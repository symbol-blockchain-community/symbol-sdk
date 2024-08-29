import 'dart:typed_data';
import 'package:pointycastle/digests/sha3.dart';

BigInt metadataGenerateKey(Uint8List seed) {
  final hasher = SHA3Digest(256);
  hasher.update(seed, 0, seed.length);
  var hashResult = Uint8List(32);
  hasher.doFinal(hashResult, 0);

  var keyBytes = hashResult.sublist(0, 8);
  keyBytes[7] |= 0x80;

  var keyBigInt = BigInt.from(0);
  for (var i = 0; i < keyBytes.length; i++) {
    keyBigInt |= BigInt.from(keyBytes[i]) << (8 * i);
  }

  return keyBigInt;
}

Uint8List metadataUpdateValue(Uint8List? oldValue, Uint8List newValue) {
  if (oldValue == null) {
    return newValue;
  }

  var shorterLength =
      oldValue.length < newValue.length ? oldValue.length : newValue.length;
  var longerLength =
      oldValue.length > newValue.length ? oldValue.length : newValue.length;
  var isNewValueShorter = oldValue.length > newValue.length;

  var result = Uint8List(longerLength);

  var i = 0;
  for (i = 0; i < shorterLength; ++i) {
    result[i] = oldValue[i] ^ newValue[i];
  }

  for (; i < longerLength; ++i) {
    result[i] = (isNewValueShorter ? oldValue : newValue)[i];
  }

  return result;
}
