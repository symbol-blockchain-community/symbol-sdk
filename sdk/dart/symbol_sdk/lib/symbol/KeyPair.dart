library symbol.key_pair;

import '../CryptoTypes.dart';
import '../utils/arrayHelpers.dart';
import 'dart:typed_data';
import 'package:ed25519_edwards/ed25519_edwards.dart' as ed;

class KeyPair {
  PrivateKey _privateKey;
  var _keyPair;

  KeyPair(PrivateKey privateKey) : _privateKey = privateKey {
    _privateKey = privateKey;
    var pkey = ed.newKeyFromSeed(privateKey.bytes);
    var pubKey = ed.public(pkey);
    _keyPair = ed.KeyPair(pkey, pubKey);
  }

  PublicKey get publicKey => PublicKey(_keyPair.publicKey.bytes);
  PrivateKey get privateKey => PrivateKey(_privateKey.bytes);

  Signature sign(Uint8List message) {
    return Signature(ed.sign(_keyPair.privateKey, message));
  }
}

class Verifier {
  PublicKey publicKey;

  Verifier(PublicKey publicKey) : publicKey = publicKey {
    if (0 == ArrayHelpers.deepCompare(Uint8List(PublicKey.SIZE), publicKey.bytes)) {
      throw Exception('public key cannot be zero');
    }
    this.publicKey = publicKey;
  }

  bool verify(Uint8List message, Signature signature) {
    return ed.verify(ed.PublicKey(publicKey.bytes), message, signature.bytes);
  }
}