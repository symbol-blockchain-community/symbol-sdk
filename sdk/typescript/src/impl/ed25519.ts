// this file contains implementation details and is not intended to be used directly
import nacl from 'tweetnacl';

const crypto_sign_keypair = (seed: Uint8Array) => {
	const keyPair = nacl.sign.keyPair.fromSeed(seed);
	return keyPair;
}

const crypto_private_sign = (message: Uint8Array, privateKey: Uint8Array) => {
	const keyPair = crypto_sign_keypair(privateKey);
	const secretKey = new Uint8Array(64);
  secretKey.set(privateKey);
  secretKey.set(keyPair.publicKey, 32);
	const signature = nacl.sign.detached(message, secretKey);
	return signature;
}

const crypto_private_verify = (data: Uint8Array, signature: Uint8Array, publicKey: Uint8Array) => {
	return nacl.sign.detached.verify(data, signature, publicKey);
}

const ed25519 = {
	keyPairFromSeed: (seed: Uint8Array) => {
		const publicKey = nacl.sign.keyPair.fromSeed(seed).publicKey;	
		return { publicKey, privateKey: seed };
	},
	sign: (message: Uint8Array, privateKey: Uint8Array) => {
		const signature = crypto_private_sign(message, privateKey);
		return signature;
	},
	verify: (message: Uint8Array, signature: Uint8Array, publicKey: Uint8Array) => crypto_private_verify(message, signature, publicKey)
};

export default ed25519;
