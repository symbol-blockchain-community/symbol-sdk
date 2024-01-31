library nem.key_pair;

import '../CryptoTypes.dart';
import '../utils/arrayHelpers.dart';
import 'dart:typed_data';
import 'package:ed25519_edwards/ed25519_edwards.dart' as ed;
import './naclFastKeccack.dart' as nacl_fast_keccack;

class KeyPair {
  PrivateKey _privateKey;
  PublicKey _publicKey;

  KeyPair(PrivateKey privateKey) : _privateKey = privateKey, _publicKey = PublicKey(Uint8List(32)) {
    _privateKey = privateKey;
    var pkey = Uint8List(32);
    var skey = Uint8List(32);
    var seed = Uint8List(64);
    seed.setRange(0, 32, privateKey.bytes.reversed);
    nacl_fast_keccack.crypto_sign_keypair(pkey, skey, seed);
    _privateKey = PrivateKey(skey.reversed.toList());
    _publicKey = PublicKey(pkey);
  }

  PublicKey get publicKey => _publicKey;
  PrivateKey get privateKey => _privateKey;

  Signature sign(Uint8List message) {
    return Signature(nacl_fast_keccack.sign(message, _privateKey.bytes, _publicKey.bytes));
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
