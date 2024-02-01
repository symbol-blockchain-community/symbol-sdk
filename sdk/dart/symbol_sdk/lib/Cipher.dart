import 'dart:typed_data';
import 'package:pointycastle/export.dart' as pointy;

class AesGcmCipher {
  /// Byte size of GCM tag.
  static const TAG_SIZE = 16;

  /// AES shared key.
  final Uint8List _key;

  /// Creates a cipher around an aes shared key.
  AesGcmCipher(Uint8List aesKey) : _key = aesKey;

  Uint8List encrypt(Uint8List clearText, Uint8List iv) {
    final cipher = pointy.GCMBlockCipher(pointy.AESEngine())
    ..init(
      true, // encrypt
      pointy.AEADParameters(
        pointy.KeyParameter(_key), // the 256 bit (32 byte) key
        128,  //Mac length
        iv, // the 12 byte nonce
        Uint8List(0), // empty extra data
      ));
    return cipher.process(clearText);
  }

  Uint8List decrypt(Uint8List cipherText, Uint8List iv) {
  final cipher = pointy.GCMBlockCipher(pointy.AESEngine())
    ..init(
      false, // decrypt
      pointy.AEADParameters(
        pointy.KeyParameter(_key), // the 256 bit (32 byte) key
        128,  //Mac length
        iv, // the 12 byte nonce
        Uint8List(0), // empty extra data
      ));
    return cipher.process(cipherText);
  }
}