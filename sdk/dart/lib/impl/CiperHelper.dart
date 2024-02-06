import '../CryptoTypes.dart' as ct;
import 'dart:typed_data';
import '../Cipher.dart';
import '../crypto/tweetNacl.dart' as tweet_nacl;

const GCM_IV_SIZE = 12;
const CBC_IV_SIZE = 16;
const SALT_SIZE = 32;

Uint8List concatArrays(List<Uint8List> arrays) {
  var totalLength = arrays.fold(0, (prev, array) => prev + array.length);
  var result = Uint8List(totalLength);
  var targetOffset = 0;
  for (var array in arrays) {
    result.setAll(targetOffset, array);
    targetOffset += array.length;
  }
  return result;
}

Map<String, Uint8List> decode(int tagSize, int ivSize, Uint8List encodedMessage) {
  return {
    'tag': encodedMessage.sublist(0, tagSize),
    'initializationVector': encodedMessage.sublist(tagSize, tagSize + ivSize),
    'encodedMessageData': encodedMessage.sublist(tagSize + ivSize)
  };
}

Uint8List decodeAesGcm(
    ct.SharedKey256 Function(dynamic, ct.PublicKey) deriveSharedKey,
    dynamic keyPair,
    ct.PublicKey recipientPublicKey,
    Uint8List encodedMessage) {
  final decoded = decode(AesGcmCipher.TAG_SIZE, GCM_IV_SIZE, encodedMessage);

  final sharedKey = deriveSharedKey(keyPair, recipientPublicKey);
  final cipher = AesGcmCipher(Uint8List.fromList(sharedKey.bytes));

  return cipher.decrypt(Uint8List.fromList(decoded['encodedMessageData']! + decoded['tag']!), decoded['initializationVector']!);
}

Map<String, dynamic> encodeAesGcm (
    ct.SharedKey256 Function(dynamic, ct.PublicKey) deriveSharedKey,
    dynamic keyPair,
    ct.PublicKey recipientPublicKey,
    Uint8List message,
    [Uint8List? iv]) {
  final sharedKey = deriveSharedKey(keyPair, recipientPublicKey);
  final cipher = AesGcmCipher(Uint8List.fromList(sharedKey.bytes));

  var initializationVector = iv ?? tweet_nacl.TweetNaCl.randombytes(12);
  final secretBox = cipher.encrypt(message, initializationVector);

  return {
    'tag': secretBox.sublist(secretBox.length - 16),
    'initializationVector': initializationVector,
    'cipherText': secretBox.sublist(0, secretBox.length - 16)
  };
}
