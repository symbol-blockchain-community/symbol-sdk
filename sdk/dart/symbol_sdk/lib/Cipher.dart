import 'dart:typed_data';
import 'package:cryptography/cryptography.dart';

class AesGcmCipher {
  /// Byte size of GCM tag.
  static const TAG_SIZE = 16;

  /// AES shared key.
  final Uint8List _key;

  /// Creates a cipher around an aes shared key.
  AesGcmCipher(Uint8List aesKey) : _key = aesKey;

  /// Encrypts clear text and appends tag to encrypted payload.
  Future<SecretBox> encrypt(Uint8List clearText, Uint8List iv) async {
    final algorithm = AesGcm.with256bits();
    final secretKey = SecretKey(_key);

    // Encrypt
    final secretBox = await algorithm.encrypt(
      clearText,
      secretKey: secretKey,
      nonce: iv,
    );

    return secretBox;
  }
  /// Decrypts cipher text and verifies tag.
  Future<Uint8List> decrypt(SecretBox secretBox) async {
    final algorithm = AesGcm.with256bits();
    final secretKey = SecretKey(_key);

    // Decrypt
    final clearText = await algorithm.decrypt(
      secretBox,
      secretKey: secretKey,
    );

    return Uint8List.fromList(clearText);
  }
}