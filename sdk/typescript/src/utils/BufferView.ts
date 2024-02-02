/**
 * Buffer view.
 */
export default class BufferView {
	buffer: Uint8Array;
	/**
	 * Creates buffer view around a buffer.
	 * @param {Uint8Array} buffer Initial buffer view.
	 */
	constructor(buffer: Uint8Array) {
		/**
		 * Underlying buffer view.
		 * @type Uint8Array
		 */
		this.buffer = buffer;
	}

	/**
	 * Moves view right.
	 * @param {number} size Amount of bytes to shift.
	 */
	shiftRight(size: number) {
		this.buffer = new Uint8Array(this.buffer.buffer, this.buffer.byteOffset + size, this.buffer.length - size);
	}

	/**
	 * Returns new limited view.
	 * @param {number} size Length in bytes.
	 * @returns {Uint8Array} View limited to specified size.
	 */
	window(size: number): Uint8Array {
		if (size > this.buffer.length)
			throw RangeError(`invalid shrink value: ${size} vs ${this.buffer.length}`);

		return new Uint8Array(this.buffer.buffer, this.buffer.byteOffset, size);
	}

	/**
	 * Shrinks view to specified size
	 * @param {number} size New length in bytes.
	 */
	shrink(size: number) {
		this.buffer = this.window(size);
	}
}
