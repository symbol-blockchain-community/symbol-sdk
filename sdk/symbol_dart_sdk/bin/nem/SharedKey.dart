import 'dart:typed_data';
import '../CryptoTypes.dart';
import '../symbol/KeyPair.dart';
import '../crypto/tweetNacl.dart' as tweet_nacl;
import '../SharedKey.dart';
import 'package:pointycastle/export.dart' as pointy_castle;

void cryptoHash(Uint8List out, Uint8List m) {
  var digest = pointy_castle.KeccakDigest(512);
  var r = digest.process(m);

  for (var i = 0; i < out.length; ++i) {
    out[i] = r[i];
  }
}

final deriveSharedKeyImpl = deriveSharedKeyFactory('catapult', tweet_nacl.TweetNaCl.crypto_hash);

Future<SharedKey256> deriveSharedKey(dynamic keyPair, PublicKey otherPublicKey) {
  return deriveSharedKeyImpl(keyPair.privateKey.bytes.reversed, otherPublicKey);
}
