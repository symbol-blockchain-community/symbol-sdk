import { KeyPair } from './KeyPair';
import { deriveSharedKey } from './SharedKey';
import { PublicKey } from '../CryptoTypes.js';
import { concatArrays, decodeAesGcm, encodeAesGcm } from '../impl/CipherHelpers';
import { deepCompare } from '../utils/arrayHelpers';
import { hexToUint8, isHexString, uint8ToHex } from '../utils/converter';

const DELEGATION_MARKER = Uint8Array.from(Buffer.from('FE2A8061577301E2', 'hex'));

interface TryDecodeResult {
  isDecoded: boolean;
  message: any;
}

const filterExceptions = (statement: { (): Uint8Array; (): Uint8Array; (): any; }, exceptions: any[]) => {
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
	 * @param {Uint8Array} iv initializationVector.
	 * @returns {Uint8Array} Encrypted and encoded message.
	 */
	encode(recipientPublicKey: PublicKey, message: Uint8Array, iv: Uint8Array): Uint8Array {
		const { tag, initializationVector, cipherText } = encodeAesGcm(deriveSharedKey, this._keyPair.privateKey.bytes, recipientPublicKey.bytes, message, iv);

		return concatArrays(new Uint8Array([1]), tag, initializationVector, cipherText);
	}

	/**
	 * Encodes persistent harvesting delegation to node.
	 * @param {PublicKey} nodePublicKey Node public key.
	 * @param {KeyPair} remoteKeyPair Remote key pair.
	 * @param {KeyPair} vrfKeyPair Vrf key pair.
	 * @param {Uint8Array} iv initializationVector.
	 * @returns {Uint8Array} Encrypted and encoded harvesting delegation request.
	 */
	// eslint-disable-next-line class-methods-use-this
	encodePersistentHarvestingDelegation(ephemeralKeyPair: KeyPair, nodePublicKey: PublicKey, remoteKeyPair: KeyPair, vrfKeyPair: KeyPair, iv: Uint8Array): Uint8Array {
		const message = concatArrays(remoteKeyPair.privateKey.bytes, vrfKeyPair.privateKey.bytes);
		const { tag, initializationVector, cipherText } = encodeAesGcm(deriveSharedKey, ephemeralKeyPair.privateKey.bytes, nodePublicKey.bytes, message, iv);

		return concatArrays(DELEGATION_MARKER, ephemeralKeyPair.publicKey.bytes, tag, initializationVector, cipherText);
	}

	/**
	 * Tries to decode encoded message.
	 * @deprecated This function is only provided for compatability with the original Symbol wallets.
	 *             Please use `tryDecode` in any new code.
	 * @param {PublicKey} recipientPublicKey Recipient's public key.
	 * @param {Uint8Array} encodedMessage Encoded message
	 * @returns {TryDecodeResult} Tuple containing decoded status and message.
	 */
	tryDecodeDeprecated(recipientPublicKey: PublicKey, encodedMessage: Uint8Array): TryDecodeResult {
		const encodedHexString = new TextDecoder().decode(encodedMessage.subarray(1));
		if (1 === encodedMessage[0] && isHexString(encodedHexString)) {
			// wallet additionally hex encodes
			return this.tryDecode(recipientPublicKey, new Uint8Array([1, ...hexToUint8(encodedHexString)]));
		}

		return this.tryDecode(recipientPublicKey, encodedMessage);
	}

	/**
	 * Encodes message to recipient using (deprecated) wallet format.
	 * @deprecated This function is only provided for compatability with the original Symbol wallets.
	 *             Please use `encode` in any new code.
	 * @param {PublicKey} recipientPublicKey Recipient public key.
	 * @param {Uint8Array} message Message to encode.
	 * @param {Uint8Array} iv initializationVector.
	 * @returns {Uint8Array} Encrypted and encoded message.
	 */
	encodeDeprecated(recipientPublicKey: PublicKey, message: Uint8Array, iv: Uint8Array): Uint8Array {
		// wallet additionally hex encodes
		const encodedHexString = uint8ToHex(this.encode(recipientPublicKey, message, iv).subarray(1));
		const encodedHexStringBytes = new TextEncoder().encode(encodedHexString);
		return new Uint8Array([1, ...encodedHexStringBytes]);
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
