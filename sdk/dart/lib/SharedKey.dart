import 'package:symbol_sdk/index.dart';

import './CryptoTypes.dart' as ct;
import 'package:symbol_sdk/impl/external/tweetNacl.dart' as tweet_nacl;
import 'package:pointycastle/export.dart' as pointy;

import 'dart:typed_data';

var a = tweet_nacl.TweetNaCl().D;

Int32List gf() {
  return Int32List.fromList(
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]); //16
}

bool isCanonicalKey(ct.PublicKey publicKey) {
  var buffer = publicKey.bytes;
  var a = (buffer[31] & 0x7F) ^ 0x7F;
  for (var i = 30; 0 < i; --i) {
    a |= buffer[i] ^ 0xFF;
  }

  a = (a - 1) >> 8;

  var b = (0xED - 1 - buffer[0]) >> 8;
  return 0 != 1 - (a & b & 1);
}

bool isInMainSubgroup(List<Int32List> point) {
  var tweetNacl = tweet_nacl.TweetNaCl();
  final L = tweetNacl.L;
  final result = [gf(), gf(), gf(), gf()];
  // multiply by group order
  tweetNacl.scalarmult(result, point, L, 0);
  // check if result is neutral element
  final areEqual = tweetNacl.neq25519(result[1], result[2]);
  final isZero = tweetNacl.neq25519(gf(), result[0]);
  // yes, this is supposed to be bit OR
  return 0 == (areEqual | isZero);
}

Uint8List Function(Uint8List privateKeyBytes, ct.PublicKey otherPublicKey)
    deriveSharedSecretFactory(cryptoHash) {
  return (privateKeyBytes, otherPublicKey) {
    var tweetNacl = tweet_nacl.TweetNaCl();
    var scalarmult = tweetNacl.scalarmult;
    var Z = tweetNacl.Z;
    var point = [gf(), gf(), gf(), gf()];

    tweet_nacl.TweetNaCl.unpackneg(point, otherPublicKey.bytes);
    if (!isCanonicalKey(otherPublicKey) ||
        0 != tweet_nacl.TweetNaCl.unpackneg(point, otherPublicKey.bytes) ||
        !isInMainSubgroup(point)) {
      throw Exception('invalid point');
    }
    // negate point == negate X coordinate and 't'
    Z(point[0], gf(), point[0]);
    Z(point[3], gf(), point[3]);

    var scalar = Uint8List(64);

    cryptoHash(scalar, privateKeyBytes);

    scalar[0] &= 248;
    scalar[31] &= 127;
    scalar[31] |= 64;

    var result = [gf(), gf(), gf(), gf()];
    scalarmult(result, point, scalar, 0);

    var sharedSecret = Uint8List(32);
    tweetNacl.pack(sharedSecret, result);
    return sharedSecret;
  };
}

Function deriveSharedKeyFactory(String info, Function cryptoHash) {
  final deriveSharedSecret = deriveSharedSecretFactory(cryptoHash);
  return (Uint8List privateKeyBytes, ct.PublicKey otherPublicKey) {
    final sharedSecret = deriveSharedSecret(privateKeyBytes, otherPublicKey);
    var hkdf = pointy.KeyDerivator('SHA-256/HKDF');
    var hkdfParams = pointy.HkdfParameters(
        sharedSecret, 32, Uint8List(32), utf8ToBytes(info));
    hkdf.init(hkdfParams);
    var key = hkdf.process(Uint8List(0));
    return ct.SharedKey256(key);
  };
}
