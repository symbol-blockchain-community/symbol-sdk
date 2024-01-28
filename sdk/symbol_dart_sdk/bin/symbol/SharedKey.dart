import '../CryptoTypes.dart';
import '../symbol/KeyPair.dart';
import '../crypto/tweetNacl.dart' as tweet_nacl;
import '../SharedKey.dart'
;
final deriveSharedKeyImpl = deriveSharedKeyFactory('catapult', tweet_nacl.TweetNaCl.crypto_hash);

Future<SharedKey256> deriveSharedKey(KeyPair keyPair, PublicKey otherPublicKey) {
  return deriveSharedKeyImpl(keyPair.privateKey.bytes, otherPublicKey);
}
