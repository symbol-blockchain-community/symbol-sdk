import { KeyPair } from './KeyPair';
import { deriveSharedKey } from './SharedKey';
import { PublicKey } from '../CryptoTypes';
import { Buffer } from 'buffer';

const GCM_IV_SIZE = 12;
const TAG_SIZE = 16;

interface TryDecodeResult {
  isDecoded: boolean;
  message: any;
}

const concatArrays = (...arrays: any[]) => {
	const totalLength = arrays.map(buffer => buffer.length).reduce((accumulator, currentValue) => accumulator + currentValue);
	const result = new Uint8Array(totalLength);
	let targetOffset = 0;
	arrays.forEach(buffer => {
		result.set(buffer, targetOffset);
		targetOffset += buffer.length;
	});
	return result;
};

const filterExceptions = async (statement: () => Promise<any>, exceptions: any[]) => {
	try {
			const message = await statement();
			return [true, message];
	} catch (exception: unknown) {
			if (!exceptions.some((exceptionMessage: any) => (exception as Error).message.includes(exceptionMessage)))
					throw exception;
	}

	return [false, undefined];
};

/**
 * Encrypts and encodes messages between two parties.
 */
export default class MessageEncoder {
	private _keyPair: KeyPair;
	/**
	 * Creates message encoder around key pair.
	 * @param {KeyPair} keyPair Key pair.
	 */
	constructor(keyPair: KeyPair) {
		/**
		 * @private
		 */
		this._keyPair = keyPair;
	}

	/**
	 * Public key used for message encoding.
	 * @returns {PublicKey} Public key used for message encoding.
	 */
	get publicKey(): PublicKey {
		return this._keyPair.publicKey;
	}

	decode(tagSize: number, ivSize: number, encodedMessage: Uint8Array){
		return {
			tag: Buffer.from(encodedMessage.subarray(0, tagSize)).toString('hex'),
			initializationVector: Buffer.from(encodedMessage.subarray(tagSize, tagSize + ivSize)).toString('hex'),
			encodedMessageData: Buffer.from(encodedMessage.subarray(tagSize + ivSize)).toString('base64')
		}
	};

	/**
	 * Tries to decode encoded message.
	 * @param {PublicKey} recipientPublicKey Recipient's public key.
	 * @param {Uint8Array} encodedMessage Encoded message.
	 * @returns {TryDecodeResult} Tuple containing decoded status and message.
	 */
	async tryDecode(recipientPublicKey: PublicKey, encodedMessage: Uint8Array, decryptFunction: Function
		): Promise<TryDecodeResult> {
		var key = deriveSharedKey(this._keyPair.privateKey.bytes, recipientPublicKey.bytes);
		const decoded = this.decode(TAG_SIZE, GCM_IV_SIZE, encodedMessage.subarray(1));
		console.log(decoded);
		const key64String = Buffer.from(key.bytes).toString('base64');
		if (1 === encodedMessage[0]) {
			const [result, message] = await filterExceptions(
				async () => await decryptFunction(decoded.encodedMessageData, key64String, decoded.initializationVector, decoded.tag, false),
				['Unsupported state or unable to authenticate data']
			);
			if (result)
				return { isDecoded: true, message };
		}
		return { isDecoded: false, message: encodedMessage };
	}

	/**
	 * Encodes message to recipient using recommended format.
	 * @param {PublicKey} recipientPublicKey Recipient public key.
	 * @param {Uint8Array} message Message to encode.
	 * @returns {Uint8Array} Encrypted and encoded message.
	 */
	async encode(recipientPublicKey: PublicKey, message: string, encryptFunction: Function): Promise<Uint8Array> {
		var key = deriveSharedKey(this._keyPair.privateKey.bytes, recipientPublicKey.bytes);
		const base64String = Buffer.from(message, 'utf8').toString('base64');
		const key64String = Buffer.from(key.bytes).toString('base64');
		const result = await encryptFunction(base64String, true, key64String);
		const tag = result.tag;
		const initializationVector = result.iv;
		const cipherText = result.content;
		return concatArrays(new Uint8Array([1]), Buffer.from(tag, 'hex'), Buffer.from(initializationVector, 'hex'), Buffer.from(cipherText, 'base64'));
	}
}

// region type declarations

/**
 * Result of a try decode operation.
 * @class
 * @typedef {object} TryDecodeResult
 * @property {boolean} isDecoded \c true if message has been decoded and decrypted; \c false otherwise.
 * @property {Uint8Array} message Decoded message when `isDecoded` is \c true; encoded message otherwise.
 */

// endregion
