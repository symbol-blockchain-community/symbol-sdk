import ByteArray from './ByteArray';

/**
 * Represents a 256-bit hash.
 */
export class Hash256 extends ByteArray {
	/**
	 * Byte size of raw hash.
	 * @type number
	 */
	static SIZE: number = 32;

	/**
	 * Creates a hash from bytes or a hex string.
	 * @param {Uint8Array|string} hash256 Input string or byte array.
	 */
	constructor(hash256: Uint8Array | string) {
		super(Hash256.SIZE, hash256);
	}

	/**
	 * Creates a zeroed hash.
	 * @returns {Hash256} Zeroed hash.
	 */
	static zero(): Hash256 {
		return new Hash256(new Uint8Array(Hash256.SIZE));
	}
}

/**
 * Represents a private key.
 */
export class PrivateKey extends ByteArray {
	/**
	 * Byte size of raw private key.
	 * @type number
	 */
	static SIZE: number = 32;

	/**
	 * Creates a private key from bytes or a hex string.
	 * @param {Uint8Array|string} privateKey Input string or byte array.
	 */
	constructor(privateKey: Uint8Array | string) {
		super(PrivateKey.SIZE, privateKey);
	}
}

/**
 * Represents a public key.
 */
export class PublicKey extends ByteArray {
	/**
	 * Byte size of raw public key.
	 * @type number
	 */
	static SIZE: number = 32;

	/**
	 * Creates a public key from bytes or a hex string.
	 * @param {Uint8Array|string|PublicKey} publicKey Input string, byte array or public key.
	 */
	constructor(publicKey: Uint8Array | string | PublicKey) {
		super(PublicKey.SIZE, publicKey instanceof PublicKey ? publicKey.bytes : publicKey);
	}
}

/**
 * Represents a 256-bit symmetric encryption key.
 */
export class SharedKey256 extends ByteArray {
	/**
	 * Byte size of raw shared key.
	 * @type number
	 */
	static SIZE: number = 32;

	/**
	 * Creates a shared key from bytes or a hex string.
	 * @param {Uint8Array|string} sharedKey Input string or byte array.
	 */
	constructor(sharedKey: Uint8Array | string) {
		super(SharedKey256.SIZE, sharedKey);
	}
}

/**
 * Represents a signature.
 */
export class Signature extends ByteArray {
	/**
	 * Byte size of raw signature.
	 * @type number
	 */
	static SIZE: number = 64;

	/**
	 * Creates a signature from bytes or a hex string.
	 * @param {Uint8Array|string} signature Input string or byte array.
	 */
	constructor(signature: Uint8Array | string) {
		super(Signature.SIZE, signature);
	}

	/**
	 * Creates a zeroed signature.
	 * @returns {Signature} Zeroed signature.
	 */
	static zero(): Signature {
		return new Signature(new Uint8Array(Signature.SIZE));
	}
}
