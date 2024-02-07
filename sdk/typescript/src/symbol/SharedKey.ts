/* eslint-disable no-unused-vars */
import { SharedKey256, PrivateKey, PublicKey } from '../CryptoTypes';
/* eslint-enable no-unused-vars */
import { deriveSharedKeyFactory } from '../SharedKey';
import tweetnacl from 'tweetnacl';

declare module 'tweetnacl' {
  interface nacl {
    lowlevel: any;
  }
}
// order matches order of exported methods
const tweetnacl_lowlevel = (tweetnacl as any).lowlevel;
const deriveSharedKeyImpl = deriveSharedKeyFactory('catapult', tweetnacl_lowlevel.crypto_hash);

/**
 * Derives shared key from key pair and other party's public key.
 * @param {Uint8Array} privateKey Key pair.
 * @param {Uint8Array} otherPublicKey Other party's public key.
 * @returns {SharedKey256} Shared encryption key.
 */
const deriveSharedKey = (privateKey: Uint8Array, otherPublicKey: Uint8Array): SharedKey256 => deriveSharedKeyImpl(privateKey, otherPublicKey);

export { deriveSharedKey }; // eslint-disable-line import/prefer-default-export
