import { PrivateKey, uint8ToHex, utf8ToUint8, intToBytes, bytesToInt, hexToUint8, bytesToBigInt, SharedKey256 } from "../src";
import { MessageEncoder, AggregateBondedTransactionV2, EmbeddedTransferTransactionV1, Hash256, KeyPair, Amount, deriveSharedKey, TransferTransactionV1, UnresolvedAddress, UnresolvedMosaic, UnresolvedMosaicId, PublicKey, NetworkType, Timestamp, Signature, TransactionFactory } from "./symbol";
import SymbolFacade from "./facade/SymbolFacade";
import crypto from 'crypto';
import { encrypt, decrypt } from '../../../symbol-encrypt/src/CipherHelpers';

//import { aes_gcm_encrypt, aes_gcm_decrypt } from 'crypto-aes-gcm';
//const cipher = new AesGcmCipher(sharedKey);
//const cipherText = cipher.encrypt(message, initializationVector);
//var key = deriveSharedKey(hexToUint8("5DB8324E7EB83E7665D500B014283260EF312139034E86DFB7EE736503EAEC02"), hexToUint8("4C4BD7F8E1E1AC61DB817089F9416A7EDC18339F06CDC851495B271533FAD13B"));
//var otherkey = deriveSharedKey(hexToUint8("E3839324F3CD2FC194F6E1C501D4D2CFD0DC8CCAC4307AC328E3154FF00951B9"), hexToUint8("13B00FBB13C7644E13BD786F0EA4F97820022A2606759793A5D3525A03F92A2F"));
//console.log(Buffer.from(key.bytes).toString('base64'));

var alice = new KeyPair(new PrivateKey("5DB8324E7EB83E7665D500B014283260EF312139034E86DFB7EE736503EAEC02"));
var bob = new KeyPair(new PrivateKey("E3839324F3CD2FC194F6E1C501D4D2CFD0DC8CCAC4307AC328E3154FF00951B9"));
var encoder = new MessageEncoder(alice);
encoder.encode(bob.publicKey, "Hello", encrypt).then((result) => {
  console.log(result);
});

const decode = (tagSize: number, ivSize: number, encodedMessage: Uint8Array) => {
  return {
    tag: Buffer.from(encodedMessage.subarray(0, tagSize)).toString('base64'),
    initializationVector: Buffer.from(encodedMessage.subarray(tagSize, tagSize + ivSize)).toString('base64'),
    encodedMessageData: Buffer.from(encodedMessage.subarray(tagSize + ivSize)).toString('base64')
  }
};

//decrypt(encoded.cipherText, Buffer.from(alice.privateKey.bytes).toString('base64'), encoded.initializationVector, encoded.tag, true);

const a = decode(16, 12, hexToUint8('1F00DA393047FC1EB91D285DD9C91B2A88027C355428858DCBE14905FD4A5FB49F'));
//console.log(a);
//console.log(decrypt(a.encodedMessageData, Buffer.from(alice.privateKey.bytes).toString('base64'), a.initializationVector, a.tag, true));

var decodedArray = hexToUint8('01112D1C6A463BB52B1243AF0711347A7407C92B7B12C7020EAE273EFB161E0BCD98');
var decoder = new MessageEncoder(bob);
console.log(bob.publicKey);
decoder.tryDecode(alice.publicKey, decodedArray, decrypt).then((result) => {
  console.log(result);
});

/* var key = deriveSharedKey(hexToUint8("5DB8324E7EB83E7665D500B014283260EF312139034E86DFB7EE736503EAEC02"), hexToUint8("4C4BD7F8E1E1AC61DB817089F9416A7EDC18339F06CDC851495B271533FAD13B"));
var otherkey = deriveSharedKey(hexToUint8("E3839324F3CD2FC194F6E1C501D4D2CFD0DC8CCAC4307AC328E3154FF00951B9"), hexToUint8("13B00FBB13C7644E13BD786F0EA4F97820022A2606759793A5D3525A03F92A2F"));

const a = decode(16, 12, hexToUint8('244B84C66537D835490F2028FDD8E27BA220341ACACB29E3B163CEF647D64792BF'));

console.log(encrypt("Hello", false, Buffer.from(key.bytes).toString('base64')));

var ddd = decrypt(a.encodedMessageData, Buffer.from(otherkey.bytes).toString('base64'), a.initializationVector, a.tag, true);

console.log(Buffer.from(ddd, 'base64').toString('utf8')); */