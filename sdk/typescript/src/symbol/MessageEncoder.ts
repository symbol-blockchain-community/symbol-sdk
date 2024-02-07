import { KeyPair } from './KeyPair';
import { deriveSharedKey } from './SharedKey';
import { PublicKey } from '../CryptoTypes';
// import { concatArrays, decodeAesGcm, encodeAesGcm } from '../impl/CipherHelpers';

const DELEGATION_MARKER = Uint8Array.from(Buffer.from('FE2A8061577301E2', 'hex'));
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
			return [true, Buffer.from(Buffer.from(message).toString('utf8'), 'base64').toString('utf8')];
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
			tag: Buffer.from(encodedMessage.subarray(0, tagSize)).toString('base64'),
			initializationVector: Buffer.from(encodedMessage.subarray(tagSize, tagSize + ivSize)).toString('base64'),
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
		const key64String = Buffer.from(key.bytes).toString('base64');
		if (1 === encodedMessage[0]) {
			const [result, message] = await filterExceptions(
				async () => await decryptFunction(decoded.encodedMessageData, key64String, decoded.initializationVector, decoded.tag, true),
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
	 * @param {Uint8Array} iv initializationVector.
	 * @returns {Uint8Array} Encrypted and encoded message.
	 */
	async encode(recipientPublicKey: PublicKey, message: string, encryptFunction: Function): Promise<Uint8Array> {
		var key = deriveSharedKey(this._keyPair.privateKey.bytes, recipientPublicKey.bytes);
		const base64String = Buffer.from(message, 'utf8').toString('base64');
		const key64String = Buffer.from(key.bytes).toString('base64');
		const { tag, initializationVector, cipherText } = encryptFunction(base64String, true, key64String);

		return concatArrays(new Uint8Array([1]), Buffer.from(tag, 'base64'), Buffer.from(initializationVector, 'base64'), Buffer.from(cipherText, 'base64'));
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
