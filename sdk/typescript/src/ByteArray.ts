import { hexToUint8, uint8ToHex, isHexString, stringToAddress } from './utils/converter';

/**
 * Represents a fixed size byte array.
 */
export default class ByteArray {
	bytes: Uint8Array;
	/**
	 * Creates a byte array.
	 * @param {number} fixedSize Size of the array.
	 * @param {Uint8Array|string} arrayInput Byte array or hex string.
	 */
	constructor(fixedSize: number, arrayInput: Uint8Array | string) {
		let rawBytes = arrayInput;
		if ('string' === typeof rawBytes){
			try {
				if (isHexString(rawBytes)) {
          rawBytes = hexToUint8(rawBytes);
        } else {
          rawBytes = stringToAddress(rawBytes);
        }
			} catch (e) {
				throw Error('byte array is not a valid hex string');
			}
		}

		if (fixedSize !== rawBytes.length)
			throw RangeError(`bytes was size ${rawBytes.length} but must be ${fixedSize}`);

		/**
		 * Underlying bytes.
		 * @type Uint8Array
		 */
		this.bytes = new Uint8Array(rawBytes);
	}

	/**
	 * Returns string representation of this object.
	 * @returns {string} String representation of this object
	 */
	toString(): string {
		return uint8ToHex(this.bytes);
	}
}
