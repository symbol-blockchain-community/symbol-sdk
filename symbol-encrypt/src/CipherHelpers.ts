// this file contains implementation details and is not intended to be used directly

import { AesGcmCipher } from './Cipher';
import * as crypto from 'crypto';

const GCM_IV_SIZE = 12;

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

const decrypt = (base64Ciphertext: string, key: string, iv: string, tag: string, isBinary: boolean) => {
	console.log(base64Ciphertext, key, iv, tag, isBinary);
	var sharedKey = Buffer.from(key, 'base64');
	var encodedMessageData = Buffer.from(base64Ciphertext, 'base64');
	var initializationVector = Buffer.from(iv, 'hex');
	var tagBuffer = Buffer.from(tag, 'hex');
	const cipher = new AesGcmCipher(sharedKey);
	if(isBinary) {
		return Buffer.from(cipher.decrypt(concatArrays(encodedMessageData, tagBuffer), initializationVector)).toString('base64');
	}
	return Buffer.from(cipher.decrypt(concatArrays(encodedMessageData, tagBuffer), initializationVector)).toString('utf8');
};

const encrypt = (plainText: string, isBinary: boolean, key: string) => {
	var sharedKey = Buffer.from(key, 'base64');
	var message;
	if(isBinary) {
		message = Buffer.from(plainText, 'base64');
	} else {		
		message = Buffer.from(plainText, 'utf8');
	}
	const cipher = new AesGcmCipher(sharedKey);

	const initializationVector = new Uint8Array(crypto.randomBytes(GCM_IV_SIZE));
	const cipherText = cipher.encrypt(message, initializationVector);
	const tagStartOffset = cipherText.length - AesGcmCipher.TAG_SIZE;
	const tag = byteToHex(cipherText.subarray(tagStartOffset));
	return { iv: byteToHex(initializationVector), tag, content: Buffer.from(cipherText.subarray(0, tagStartOffset)).toString('base64') };
};

function byteToHex(byteArray: Uint8Array) {
  return Array.from(byteArray, byte => ('0' + (byte & 0xFF).toString(16)).slice(-2)).join('');
}

export {
	concatArrays,
	decrypt,
	encrypt,
};
