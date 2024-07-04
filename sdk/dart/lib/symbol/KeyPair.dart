import '../CryptoTypes.dart';
import '../utils/arrayHelpers.dart';
import 'dart:typed_data';
import '../impl/ed25519.dart' as ed25519;

final String hashMode = 'sha512';

class KeyPair {
  PrivateKey _privateKey;
  ({Uint8List publicKey, Uint8List secretKey}) _keyPair =
      (publicKey: Uint8List(32), secretKey: Uint8List(64));

  KeyPair(PrivateKey privateKey) : _privateKey = privateKey {
    _privateKey = privateKey;
    _keyPair = ed25519.keyPairFromSeed(privateKey.bytes, hashMode);
  }

  PublicKey get publicKey => PublicKey(_keyPair.publicKey);
  PrivateKey get privateKey => _privateKey;

  Signature sign(Uint8List message) {
    return Signature(
        ed25519.sign_detached(message, _keyPair.secretKey, hashMode));
  }
}

class Verifier {
  PublicKey publicKey;

  Verifier(PublicKey publicKey) : publicKey = publicKey {
    if (0 ==
        ArrayHelpers.deepCompare(Uint8List(PublicKey.SIZE), publicKey.bytes)) {
      throw Exception('public key cannot be zero');
    }
    this.publicKey = publicKey;
  }

  bool verify(Uint8List message, Signature signature) {
    return ed25519.verify(message, signature.bytes, publicKey.bytes, hashMode);
  }
}
