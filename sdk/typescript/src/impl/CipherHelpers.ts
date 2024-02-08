// this file contains implementation details and is not intended to be used directly

import { AesCbcCipher, AesGcmCipher } from '../Cipher';
import { SharedKey256, PrivateKey, PublicKey } from '../CryptoTypes';

const GCM_IV_SIZE = 12;
const CBC_IV_SIZE = 16;
const SALT_SIZE = 32;

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

const decode = (tagSize: number, ivSize: number, encodedMessage: Uint8Array) => ({
	tag: encodedMessage.subarray(0, tagSize),
	initializationVector: encodedMessage.subarray(tagSize, tagSize + ivSize),
	encodedMessageData: encodedMessage.subarray(tagSize + ivSize)
});

const decodeAesGcm = (deriveSharedKey: (privateKey: Uint8Array, recipientPublicKey: Uint8Array) => SharedKey256, privateKey: Uint8Array, recipientPublicKey: Uint8Array, encodedMessage: Uint8Array) => {
	const { tag, initializationVector, encodedMessageData } = decode(AesGcmCipher.TAG_SIZE, GCM_IV_SIZE, encodedMessage);

	const sharedKey = deriveSharedKey(privateKey, recipientPublicKey);
	const cipher = new AesGcmCipher(sharedKey);

	return new Uint8Array(cipher.decrypt(concatArrays(encodedMessageData, tag), initializationVector));
};

const decodeAesCbc = (deriveSharedKey: (privateKey: Uint8Array, recipientPublicKey: Uint8Array, tag: Uint8Array) => SharedKey256, privateKey: Uint8Array, recipientPublicKey: Uint8Array, encodedMessage: Uint8Array) => {
	const { tag, initializationVector, encodedMessageData } = decode(SALT_SIZE, CBC_IV_SIZE, encodedMessage);

	const sharedKey = deriveSharedKey(privateKey, recipientPublicKey, tag);
	const cipher = new AesCbcCipher(sharedKey);

	return new Uint8Array(cipher.decrypt(encodedMessageData, initializationVector));
};

const encodeAesGcm = (deriveSharedKey: (privateKey: Uint8Array, recipientPublicKey: Uint8Array) => SharedKey256, privateKey: Uint8Array, recipientPublicKey: Uint8Array, message: Uint8Array, iv: Uint8Array) => {
	const sharedKey = deriveSharedKey(privateKey, recipientPublicKey);
	const cipher = new AesGcmCipher(sharedKey);

	const initializationVector = iv;
	const cipherText = cipher.encrypt(message, initializationVector);
	const tagStartOffset = cipherText.length - AesGcmCipher.TAG_SIZE;
	const tag = cipherText.subarray(tagStartOffset);

	return { tag, initializationVector, cipherText: cipherText.subarray(0, tagStartOffset) };
};

const encodeAesCbc = (deriveSharedKey: (privateKey: Uint8Array, recipientPublicKey: Uint8Array, salt: Uint8Array) => SharedKey256, privateKey: Uint8Array, recipientPublicKey: Uint8Array, message: Uint8Array, salt: Uint8Array, initializationVector: Uint8Array) => {
	const sharedKey = deriveSharedKey(privateKey, recipientPublicKey, salt);
	const cipher = new AesCbcCipher(sharedKey);

	const cipherText = cipher.encrypt(message, initializationVector);

	return { salt, initializationVector, cipherText };
};

export {
	concatArrays,
	decodeAesGcm,
	decodeAesCbc,
	encodeAesGcm,
	encodeAesCbc
};
