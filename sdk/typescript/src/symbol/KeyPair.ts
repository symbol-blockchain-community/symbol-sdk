import { PrivateKey, PublicKey, Signature } from '../CryptoTypes';
import ed25519 from '../impl/ed25519';
import { deepCompare } from '../utils/arrayHelpers';
import { HashMode } from 'symbol-crypto-wasm-node';

const HASH_MODE = HashMode.Sha2_512;

/**
 * Represents an ED25519 private and public key.
 */
export class KeyPair {
	private _privateKey: PrivateKey;
	private _keyPair: { publicKey: Uint8Array; privateKey: Uint8Array; };
	/**
	 * Creates a key pair from a private key.
	 * @param {PrivateKey} privateKey Private key.
	 */
	constructor(privateKey: PrivateKey) {
		/**
		 * @private
		 */
		this._privateKey = privateKey;

		/**
		 * @private
		 */
		this._keyPair = ed25519.keyPairFromSeed(HASH_MODE, this._privateKey.bytes);
	}

	/**
	 * Gets the public key.
	 * @returns {PublicKey} Public key.
	 */
	get publicKey(): PublicKey {
		return new PublicKey(this._keyPair.publicKey);
	}

	/**
	 * Gets the private key.
	 * @returns {PrivateKey} Private key.
	 */
	get privateKey(): PrivateKey {
		return new PrivateKey(this._privateKey.bytes);
	}

	/**
	 * Signs a message with the private key.
	 * @param {Uint8Array} message Message to sign.
	 * @returns {Signature} Message signature.
	 */
	sign(message: Uint8Array): Signature {
		return new Signature(ed25519.sign(HASH_MODE, message, this._keyPair.privateKey));
	}
}

/**
 * Verifies signatures signed by a single key pair.
 */
export class Verifier {
	private _publicKey: PublicKey;
	/**
	 * Creates a verifier from a public key.
	 * @param {PublicKey} publicKey Public key.
	 */
	constructor(publicKey: PublicKey) {
		if (0 === deepCompare(new Uint8Array(PublicKey.SIZE), publicKey.bytes))
			throw new Error('public key cannot be zero');

		/**
		 * Public key used for signature verification.
		 * @type PublicKey
		 */
		this._publicKey = publicKey;
	}

	/**
	 * Gets the public key.
	 * @returns {PublicKey} Public key.
	 */
	get publicKey(): PublicKey {
		return this._publicKey;
	}

	/**
	 * Verifies a message signature.
	 * @param {Uint8Array} message Message to verify.
	 * @param {Signature} signature Signature to verify.
	 * @returns {boolean} true if the message signature verifies.
	 */
	verify(message: Uint8Array, signature: { bytes: Uint8Array; }): boolean {
		return ed25519.verify(HASH_MODE, message, signature.bytes, this.publicKey.bytes);
	}
}
