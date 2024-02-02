/**
 * Position tracking writer.
 */
export default class Writer {
	storage: Uint8Array;
	offset: number;
	/**
	 * Creates a writer with specified size.
	 * @param {number} size Allocated buffer size.
	 */
	constructor(size: number) {
		/**
		 *  Underlying storage.
		 * @type Uint8Array
		 */
		this.storage = new Uint8Array(size);

		/**
		 * Current offset.
		 * @type number
		 */
		this.offset = 0;
	}

	/**
	 * Writes array into buffer.
	 * @param {Uint8Array|Array<number>} buffer Data to write.
	 */
	write(buffer: Uint8Array|Array<number>) {
		this.storage.set(buffer, this.offset);
		this.offset += buffer.length;
	}
}
