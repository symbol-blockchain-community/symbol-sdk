import charMapping from './charMapping';
import base32 from './base32';

const _constants: { [key: string]: { [key: string]: number } } = {
  'sizes': {
    'ripemd160': 20,
    'symbolAddressDecoded': 24,
    'nemAddressDecoded': 25,
    'symbolAddressEncoded': 39,
    'nemAddressEncoded': 40,
    'key': 32,
    'checksum': 3,
  }
};

const CHAR_TO_NIBBLE_MAP = (() => {
	const builder = charMapping.createBuilder();
	builder.addRange('0', '9', 0);
	builder.addRange('a', 'f', 10);
	builder.addRange('A', 'F', 10);
	return builder.map;
})();

const CHAR_TO_DIGIT_MAP = (() => {
	const builder = charMapping.createBuilder();
	builder.addRange('0', '9', 0);
	return builder.map;
})();

const NIBBLE_TO_CHAR_MAP = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'];

const SIGNEDNESS_AND_SIZE_TO_ARRAY_TYPE_MAPPING: { [key: string]: { [key: number]: any } } = {
	'false': {
		1: Uint8Array,
		2: Uint16Array,
		4: Uint32Array,
		8: BigUint64Array
	},
	'true': {
		1: Int8Array,
		2: Int16Array,
		4: Int32Array,
		8: BigInt64Array
	}
};

const tryParseByte = (char1: string, char2: string): number | undefined => {
	const nibble1 = CHAR_TO_NIBBLE_MAP[char1];
	const nibble2 = CHAR_TO_NIBBLE_MAP[char2];
	return undefined === nibble1 || undefined === nibble2
		? undefined
		: (nibble1 << 4) | nibble2;
};

/**
 * Decodes two hex characters into a byte.
 * @param {string} char1 First hex digit.
 * @param {string} char2 Second hex digit.
 * @returns {number} Decoded byte.
 */
const toByte = (char1: string, char2: string): number => {
	const byte = tryParseByte(char1, char2);
	if (undefined === byte)
		throw Error(`unrecognized hex char '${char1}${char2}'`);

	return byte;
};

/**
 * Determines whether or not a string is a hex string.
 * @param {string} input String to test.
 * @returns {boolean} \c true if the input is a hex string, \c false otherwise.
 */
const isHexString = (input: string): boolean => {
	if (0 !== input.length % 2)
		return false;

	for (let i = 0; i < input.length; i += 2) {
		if (undefined === tryParseByte(input[i], input[i + 1]))
			return false;
	}

	return true;
};

/**
 * Converts a hex string to a uint8 array.
 * @param {string} input Hex encoded string.
 * @returns {Uint8Array} Uint8 array corresponding to the input.
 */
const hexToUint8 = (input: string): Uint8Array => {
	if (0 !== input.length % 2)
		throw Error(`hex string has unexpected size '${input.length}'`);

	const output = new Uint8Array(input.length / 2);
	for (let i = 0; i < input.length; i += 2)
		output[i / 2] = toByte(input[i], input[i + 1]);

	return output;
};

/**
 * Converts a uint8 array to a hex string.
 * @param {Uint8Array} input Uint8 array.
 * @returns {string} Hex encoded string corresponding to the input.
 */
const uint8ToHex = (input: Uint8Array): string => {
	let s = '';
	input.forEach(byte => {
		s += NIBBLE_TO_CHAR_MAP[byte >> 4];
		s += NIBBLE_TO_CHAR_MAP[byte & 0x0F];
	});

	return s;
};

/**
 * Tries to parse a string representing an unsigned integer.
 * @param {string} str String to parse.
 * @returns {number|undefined} Number represented by the input or undefined.
 */
const tryParseUint = (str: string): number | undefined => {
	if ('0' === str)
		return 0;

	let value = 0;
	for (let i = 0; i < str.length; ++i) {
		const char = str[i];
		const digit = CHAR_TO_DIGIT_MAP[char];
		if (undefined === digit || (0 === value && 0 === digit))
			return undefined;

		value *= 10;
		value += digit;

		if (value > Number.MAX_SAFE_INTEGER)
			return undefined;
	}

	return value;
};

/**
 * Converts aligned bytes to little-endian number.
 * @param {Uint8Array} input Uint8 array.
 * @param {number} size Number of bytes.
 * @param {boolean} isSigned \c true if number should be treated as signed.
 * @returns {number} Value corresponding to the input.
 */
const bytesToInt = (input: Uint8Array, size: number, isSigned: boolean = false): number => {
	const DataType = SIGNEDNESS_AND_SIZE_TO_ARRAY_TYPE_MAPPING[String(isSigned)][size];
	if (!DataType || 8 <= size)
		throw Error(`unsupported int size ${size}`);

	return new DataType(input.buffer, input.byteOffset, 1)[0];
};

/**
 * Converts aligned bytes to little-endian number.
 * @param {Uint8Array} input Uint8 array.
 * @param {number} size Number of bytes.
 * @param {boolean} isSigned \c true if number should be treated as signed.
 * @returns {bigint} Value corresponding to the input.
 */
const bytesToBigInt = (input: Uint8Array, size: number, isSigned: boolean = false): bigint => {
	const DataType = SIGNEDNESS_AND_SIZE_TO_ARRAY_TYPE_MAPPING[String(isSigned)][size];
	if (!DataType || 8 > size)
		throw Error(`unsupported int size ${size}`);

	return new DataType(input.buffer, input.byteOffset, 1)[0];
};

type MappingFunction = (view: DataView) => { [key: string]: { [key: number]: (byteOffset: number, littleEndian?: boolean) => number | bigint } };

/**
 * Converts bytes to little-endian number.
 * @param {Uint8Array} input Uint8 array.
 * @param {number} size Number of bytes.
 * @param {boolean} isSigned \c true if number should be treated as signed.
 * @returns {number} Value corresponding to the input.
 */
const bytesToIntUnalignedInternal = (input: { buffer: ArrayBufferLike; byteOffset: number; }, size: number, isSigned: boolean, createMappingFromView: MappingFunction): number | bigint => {
	const view = new DataView(input.buffer, input.byteOffset);
	const mapping = createMappingFromView(view);

	const reader = mapping[String(isSigned)][size];
	if (!reader)
			throw Error(`unsupported int size ${size}`);

	return reader.call(view, 0, true);
};

/**
 * Converts bytes to little-endian number.
 * @param {Uint8Array} input Uint8 array.
 * @param {number} size Number of bytes.
 * @param {boolean} isSigned \c true if number should be treated as signed.
 * @returns {number} Value corresponding to the input.
 */
const bytesToIntUnaligned = (input: Uint8Array, size: number, isSigned: boolean = false): number => 
	bytesToIntUnalignedInternal(input, size, isSigned, view => ({
			"false": {
					1: view.getUint8,
					2: view.getUint16,
					4: view.getUint32
			},
			"true": {
					1: view.getInt8,
					2: view.getInt16,
					4: view.getInt32
			}
	})) as number;

/**
 * Converts bytes to little-endian number.
 * @param {Uint8Array} input Uint8 array.
 * @param {number} size Number of bytes.
 * @param {boolean} isSigned \c true if number should be treated as signed.
 * @returns {bigint} Value corresponding to the input.
 */
const bytesToBigIntUnaligned = (input: Uint8Array, size: number, isSigned: boolean = false): bigint => 
	bytesToIntUnalignedInternal(input, size, isSigned, view => ({
			"false": {
					8: view.getBigUint64
			},
			"true": {
					8: view.getBigInt64
			}
	})) as bigint;

/**
 * Converts an integer to bytes.
 * @param {number|bigint} value Integer value.
 * @param {number} byteSize Number of output bytes.
 * @param {boolean} isSigned \c true if the value is signed.
 * @returns {Uint8Array} Byte representation of the integer.
 */
const intToBytes = (value: number | bigint, byteSize: number, isSigned: boolean = false): Uint8Array => {
	const DataType = SIGNEDNESS_AND_SIZE_TO_ARRAY_TYPE_MAPPING[String(isSigned)][byteSize];
	const typedBuffer = new DataType([value]);
	return new Uint8Array(typedBuffer.buffer);
};

const utf8ToUint8 = (input: string): Uint8Array => {
	let buffer = Buffer.from(input, 'utf8');
	return Uint8Array.from(buffer);
};

const stringToAddress = (encoded: string): Uint8Array => {
  if (_constants['sizes']['symbolAddressEncoded'] === encoded.length) {
    const bytes = base32.decode(encoded + 'A');
    return new Uint8Array(bytes.slice(0, _constants['sizes']['symbolAddressDecoded']));
  }
  if (_constants['sizes']['nemAddressEncoded'] === encoded.length) {
    return utf8ToUint8(encoded);
  }
  throw new Error(`${encoded} does not represent a valid encoded address`);
}

const addressToString = (decoded: Uint8Array): string =>  {
  if (_constants['sizes']['symbolAddressDecoded'] === decoded.length) {
    const padded = new Uint8Array(_constants['sizes']['symbolAddressDecoded']! + 1);
    padded.set(decoded, 0);
    return base32.encode(padded).substring(0, _constants['sizes']['symbolAddressEncoded']);
  }
  if (_constants['sizes']['nemAddressDecoded'] === decoded.length) {
    return base32.encode(decoded);
  }
  throw new Error('It does not represent a valid decoded address');
}

export {
	toByte,
	isHexString,
	hexToUint8,
	uint8ToHex,
	tryParseUint,
	bytesToInt,
	bytesToBigInt,
	bytesToIntUnaligned,
	bytesToBigIntUnaligned,
	intToBytes,
	stringToAddress,
	addressToString,
	utf8ToUint8
};
