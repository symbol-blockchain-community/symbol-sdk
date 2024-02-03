// this file contains implementation details and is not intended to be used directly

import {
	HashMode, crypto_private_sign, crypto_private_verify, crypto_sign_keypair
} from 'symbol-crypto-wasm-node';

const CRYPTO_SIGN_BYTES = 64;
const CRYPTO_SIGN_PUBLICKEYBYTES = 32;

const ed25519 = {
	keyPairFromSeed: (hashMode: HashMode | number, seed: Uint8Array) => {
		const publicKey = new Uint8Array(CRYPTO_SIGN_PUBLICKEYBYTES);
		crypto_sign_keypair(hashMode, seed, publicKey);
		return { publicKey, privateKey: seed };
	},
	sign: (hashMode: HashMode | number, message: Uint8Array, privateKey: Uint8Array) => {
		const signature = new Uint8Array(CRYPTO_SIGN_BYTES);
		crypto_private_sign(hashMode, privateKey, message, signature);
		return signature;
	},
	verify: (hashMode: HashMode, message: Uint8Array, signature: Uint8Array, publicKey: Uint8Array) => crypto_private_verify(hashMode, publicKey, message, signature)
};

export default ed25519;
