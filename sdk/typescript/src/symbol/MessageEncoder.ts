import { KeyPair } from './KeyPair';
import { deriveSharedKey } from './SharedKey';
import { PublicKey } from '../CryptoTypes';
import { Buffer } from 'buffer';
import { deepCompare } from '../utils/arrayHelpers';
import { concatArrays, decodeAesGcm, encodeAesGcm } from '../impl/CipherHelpers';

const DELEGATION_MARKER = Uint8Array.from(Buffer.from('FE2A8061577301E2', 'hex'));

interface TryDecodeResult {
  isDecoded: boolean;
  message: any;
}

const filterExceptions = (statement: () => any, exceptions: any[]) => {
	try {
			const message = statement();
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

	/**
	 * Tries to decode encoded message.
	 * @param {PublicKey} recipientPublicKey Recipient's public key.
	 * @param {Uint8Array} encodedMessage Encoded message.
	 * @returns {TryDecodeResult} Tuple containing decoded status and message.
	 */
	tryDecode(recipientPublicKey: PublicKey, encodedMessage: Uint8Array): TryDecodeResult {
		if (1 === encodedMessage[0]) {
			const [result, message] = filterExceptions(
				() => decodeAesGcm(deriveSharedKey, this._keyPair.privateKey.bytes, recipientPublicKey.bytes, encodedMessage.subarray(1)),
				['Unsupported state or unable to authenticate data']
			);
			if (result)
				return { isDecoded: true, message };
		}

		if (0xFE === encodedMessage[0] && 0 === deepCompare(DELEGATION_MARKER, encodedMessage.slice(0, 8))) {
			const ephemeralPublicKeyStart = DELEGATION_MARKER.length;
			const ephemeralPublicKeyEnd = ephemeralPublicKeyStart + PublicKey.SIZE;
			const ephemeralPublicKey = new PublicKey(encodedMessage.subarray(ephemeralPublicKeyStart, ephemeralPublicKeyEnd));

			const [result, message] = filterExceptions(
				() => decodeAesGcm(deriveSharedKey, this._keyPair.privateKey.bytes, ephemeralPublicKey.bytes, encodedMessage.subarray(ephemeralPublicKeyEnd)),
				[
					'Unsupported state or unable to authenticate data',
					'invalid point'
				]
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
	encode(recipientPublicKey: PublicKey, message: Uint8Array): Uint8Array {
		const { tag, initializationVector, cipherText } = encodeAesGcm(deriveSharedKey, this._keyPair.privateKey.bytes, recipientPublicKey.bytes, message);

		return concatArrays(new Uint8Array([1]), tag, initializationVector, cipherText);
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
