import 'package:pointycastle/export.dart' as pc;
import 'dart:typed_data';
import '../crypto/tweetNacl.dart' as tweet_nacl;

const crypto_sign_SECRETKEYBYTES = 64;
const crypto_sign_BYTES = 64;

void crypto_hash(Uint8List out, Uint8List m, int n){
  var digest = pc.KeccakDigest(512);
  var copied = Uint8List(n);
  copied.setRange(0, n, m);
  digest.update(copied, 0, copied.length);
  digest.doFinal(out, 0);
}

int crypto_sign_keypair(Uint8List pk, Uint8List sk, Uint8List seed) {
  final k = Uint8List(64);
  final p = List<Int32List>.generate(4, (_) => Int32List(16));

  crypto_hash(k, seed, 32);
  k[0] &= 248;
  k[31] &= 127;
  k[31] |= 64;

  tweet_nacl.TweetNaCl.scalarbase(p, k, 0);
  tweet_nacl.TweetNaCl().pack(pk, p);

  for (var i = 0; i < 32; i++) {
    sk[i] = seed[i];
  }
  return 0;
}

Int32List gf() {
  return Int32List.fromList([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]); //16
}

int crypto_sign(Uint8List sm, Uint8List m, int n, Uint8List sk) {
  var tweetNacl = tweet_nacl.TweetNaCl();
  var d = Uint8List(64);
  var h = Uint8List(64);
  var r = Uint8List(64);
  var i = 0;
  var j = 0;
  var x = Int32List(64);
  var p = [gf(), gf(), gf(), gf()];

  crypto_hash(d, sk, 32);
  d[0] &= 248;
  d[31] &= 127;
  d[31] |= 64;

  var smlen = n + 64;
  for (i = 0; i < n; i++) {
    sm[64 + i] = m[i];
  }
  for (i = 0; i < 32; i++) {
    sm[32 + i] = d[32 + i];
  }

  crypto_hash(r, sm.sublist(32, sm.length), n + 32);
  tweet_nacl.TweetNaCl.reduce(r);
  tweet_nacl.TweetNaCl.scalarbase(p, r, 0);

  var longArr = Uint8List(sm.length);
  for (var k = 0; k < longArr.length; k++){
    longArr[k] = sm[k];
  }
  tweetNacl.pack(longArr, p);
  for (var k = 0; k < longArr.length; k++){
    sm[k] = longArr[k];
  }
  for (i = 32; i < 64; i++) sm[i] = sk[i];

  crypto_hash(h, sm, n + 64);
  tweet_nacl.TweetNaCl.reduce(h);

  for (i = 0; i < 64; i++) {
    x[i] = 0;
  }
  for (i = 0; i < 32; i++) {
    x[i] = r[i];
  }
  for (i = 0; i < 32; i++) {
    for (j = 0; j < 32; j++) {
      x[i + j] += h[i] * d[j];
    }
  }
  var range = Uint8List.fromList(sm.sublist(32, sm.length));
  tweet_nacl.TweetNaCl.modL(range, 0, x);
  for (var k = 0; k < range.length; k++) {
    sm[k + 32] = range[k];
  }
  return smlen;
}

Uint8List sign(Uint8List msg, Uint8List privateKey, Uint8List publicKey) {
  var secretKey = Uint8List.fromList(privateKey.reversed.followedBy(publicKey).toList());
  if (secretKey.length != crypto_sign_SECRETKEYBYTES) {
    throw Exception('bad secret key size');
  }
  var signedMsg = Uint8List(crypto_sign_BYTES + msg.length);
  crypto_sign(signedMsg, msg, msg.length, secretKey);
  var sig = Uint8List(crypto_sign_BYTES);
  for (var i = 0; i < sig.length; i++) {
    sig[i] = signedMsg[i];
  }
  return sig;
}