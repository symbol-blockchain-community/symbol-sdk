import ISerializable from '../models/ISerializable';
import BufferView from './BufferView';
/* eslint-disable no-unused-vars */
import Writer from './Writer';
import { uint8ToHex } from './converter';
/* eslint-enable no-unused-vars */

const getValue = (e: any) => {
	try {
		return e.comparer();
	} catch (_) {
		return e.value;
	}
}

/**
 * Deeply compares two array elements.
 * @param {object} lhs Left object to compare.
 * @param {object} rhs Right object to compare.
 * @returns {number} 1 if lhs is greater than rhs; -1 if lhs is less than rhs; 0 if lhs and rhs are equal.
 */
const deepCompare = (lhs: number | Uint8Array | Array<any>, rhs: number | Uint8Array | Array<any>): number => {
	if (typeof lhs === 'number' && typeof rhs === 'number' || typeof lhs === 'bigint' && typeof rhs === 'bigint') {
		if (lhs === rhs)
			return 0;
		return lhs > rhs ? 1 : -1;
	} else if ((lhs instanceof Uint8Array && rhs instanceof Uint8Array) || (Array.isArray(lhs) && Array.isArray(rhs))) {
		if (lhs.length !== rhs.length)
			return lhs.length > rhs.length ? 1 : -1;

		for (let i = 0; i < lhs.length; ++i) {
			const compareResult = deepCompare(lhs[i], rhs[i]);
			if (0 !== compareResult)
				return compareResult;
		}
	}
	return 0;
};

const readArrayImpl = (bufferInput: Uint8Array, FactoryClass: { deserialize: Function; }, accessor: Function | undefined, shouldContinue: Function) => {
	const view = new BufferView(bufferInput);
	const elements = [];
	let previousElement = null;
	let i = 0;
	while (shouldContinue(i, view)) {
		const element = FactoryClass.deserialize(view.buffer);

		if (0 >= element.size)
			throw RangeError('element size has invalid size');

		if (accessor && previousElement && 0 <= deepCompare(accessor(previousElement), accessor(element)))
			throw RangeError('elements in array are not sorted');

		elements.push(element);
		view.shiftRight(element.size);

		previousElement = element;
		++i;
	}

	return elements;
};

const writeArrayImpl = (output: { write: Function; }, elements: any[], count: number, accessor: Function | undefined) => {
	for (let i = 0; i < count; ++i) {
		const element = elements[i];
		if (accessor && 0 < i && 0 <= deepCompare(accessor(elements[i - 1]), accessor(element)))
			throw RangeError('array passed to write array is not sorted');

		output.write(element.serialize());
	}
};

const sum = (numbers: any[]) => numbers.reduce((a, b) => a + b, 0);

/**
 * Calculates aligned size.
 * @param {number} size Size.
 * @param {number} alignment Alignment.
 * @returns {number} Size rounded up to alignment.
 */
const alignUp = (size: number, alignment: number): number => Math.floor((size + alignment - 1) / alignment) * alignment;

/**
 * Calculates size of variable size objects.
 * @param {Array<object>} elements Serializable elements.
 * @param {number} alignment Alignment used for calculations.
 * @param {boolean} skipLastElementPadding \c true if last element should not be aligned.
 * @returns {number} Computed size.
 */
const size = (elements: Array<any>, alignment: number = 0, skipLastElementPadding: boolean = false): number => {
	if (!alignment)
		return sum(elements.map(e => e.size));

	if (!skipLastElementPadding)
		return sum(elements.map(e => alignUp(e.size, alignment)));

	return sum(elements.slice(0, -1).map(e => alignUp(e.size, alignment))) + sum(elements.slice(-1).map(e => e.size));
};

/**
 * Reads array of objects.
 * @param {Uint8Array} bufferInput Buffer input.
 * @param {{deserialize: Function}} FactoryClass Factory used to deserialize objects.
 * @param {Function|undefined} accessor Optional accessor used to check objects order.
 * @returns {Array<object>} Array of deserialized objects.
 */
const readArray = (bufferInput: Uint8Array, FactoryClass: { deserialize: Function; }, accessor: Function | undefined = undefined): Array<object> =>
	// note: this method is used only for '__FILL__' type arrays
	// this loop assumes properly sliced buffer is passed and that there's no additional data.
	readArrayImpl(bufferInput, FactoryClass, accessor, (_: any, view: any) => 0 < view.buffer.length);

/**
 * Reads array of deterministic number of objects.
 * @param {Uint8Array} bufferInput Buffer input.
 * @param {{deserialize: Function}} FactoryClass Factory used to deserialize objects.
 * @param {number} count Number of object to deserialize.
 * @param {Function|undefined} accessor Optional accessor used to check objects order.
 * @returns {Array<object>} Array of deserialized objects.
 */
const readArrayCount = (bufferInput: Uint8Array, FactoryClass: { deserialize: Function; }, count: number, accessor: Function | undefined = undefined): Array<object> =>
	readArrayImpl(bufferInput, FactoryClass, accessor, (index: number) => count > index);

/**
 * Reads array of variable size objects.
 * @param {Uint8Array} bufferInput Buffer input.
 * @param {{deserialize: Function}} FactoryClass Factory used to deserialize objects.
 * @param {number} alignment Alignment used to make sure each object is at boundary.
 * @param {boolean} skipLastElementPadding \c true if last element is not aligned/padded.
 * @returns {Array<object>} Array of deserialized objects.
 */
const readVariableSizeElements = (bufferInput: Uint8Array, FactoryClass: { deserialize: Function; }, alignment: number, skipLastElementPadding: boolean = false): Array<object> => {
	const view = new BufferView(bufferInput);
	const elements = [];
	while (0 < view.buffer.length) {
		const element = FactoryClass.deserialize(view.buffer);

		if (0 >= element.size)
			throw RangeError('element size has invalid size');

		elements.push(element);

		const alignedSize = (skipLastElementPadding && element.size >= view.buffer.length)
			? element.size
			: alignUp(element.size, alignment);
		if (alignedSize > view.buffer.length)
			throw RangeError('unexpected buffer length');
		view.shiftRight(alignedSize);
	}

	return elements;
};

/**
 * Writes array of objects.
 * @param {{write: Function}} output Output sink.
 * @param {Array<object>} elements Serializable elements.
 * @param {Function|undefined} accessor Optional accessor used to check objects order.
 */
const writeArray = (output: { write: Function; }, elements: Array<object>, accessor: Function | undefined = undefined) => {
	writeArrayImpl(output, elements, elements.length, accessor);
};

/**
 * Writes array of deterministic number of objects.
 * @param {{write: Function}} output Output sink.
 * @param {Array<object>} elements Serializable elements.
 * @param {number} count Number of objects to write.
 * @param {Function|undefined} accessor Optional accessor used to check objects order.
 */
const writeArrayCount = (output: { write: Function; }, elements: Array<object>, count: number, accessor: Function | undefined = undefined) => {
	writeArrayImpl(output, elements, count, accessor);
};

/**
 * Writes array of variable size objects.
 * @param {{write: Function}} output Output sink.
 * @param {Array<object>} elements Serializable elements.
 * @param {number} alignment Alignment used to make sure each object is at boundary.
 * @param {boolean} skipLastElementPadding \c true if last element should not be aligned/padded.
 */
const writeVariableSizeElements = (output: { write: Function; }, elements: Array<any>, alignment: number, skipLastElementPadding: boolean = false) => {
	elements.forEach((element, index) => {
		output.write(element.serialize());
		if (!skipLastElementPadding || elements.length - 1 !== index) {
			const alignedSize = alignUp(element.size, alignment);
			if (alignedSize - element.size)
				output.write(new Uint8Array(alignedSize - element.size));
		}
	});
};

export {
	getValue,
	deepCompare,
	alignUp,
	size,
	readArray,
	readArrayCount,
	readVariableSizeElements,
	writeArray,
	writeArrayCount,
	writeVariableSizeElements
};
