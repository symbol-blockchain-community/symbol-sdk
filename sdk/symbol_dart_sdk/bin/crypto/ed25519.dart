import './tweetNacl.dart';
import '../CryptoTypes.dart';
import '../symbol/KeyPair.dart';

const CRYPTO_SIGN_BYTES = 64;
const CRYPTO_SIGN_PUBLICKEYBYTES = 32;


/* 
class Ed25519 {
  static KeyPair keyPairFromSeed(HashMode hashMode, List<int> seed) {
    final publicKey = List<int>.filled(CRYPTO_SIGN_PUBLICKEYBYTES, 0);
    cryptoSignKeypair(hashMode[HashMode], seed, publicKey);
    return KeyPair(publicKey: publicKey, privateKey: seed);
  }

  static List<int> sign(HashMode hashMode, List<int> message, List<int> privateKey) {
    final signature = List<int>.filled(CRYPTO_SIGN_BYTES, 0);
    cryptoPrivateSign(hashMode[HashMode], privateKey, message, signature);
    return signature;
  }

  static bool verify(HashMode hashMode, List<int> message, List<int> signature, List<int> publicKey) {
    return cryptoPrivateVerify(hashMode[HashMode], publicKey, message, signature);
  }
} */

enum HashMode {
	/// Keccak hash.
	Keccak,

	/// SHA2 hash.
	Sha2_512
}