import 'dart:typed_data';
import 'package:pointycastle/export.dart' as pc;
import '../nem/ITransaction.dart';
import '../nem/Network.dart';
import '../CryptoTypes.dart';
import '../nem/KeyPair.dart';
import '../nem/models.dart' as nc;
import '../Bip32.dart';
import '../utils/converter.dart';
import '../nem/TransactionFactory.dart';

class NemFacade {
  Network network;
  NemFacade(Network network):
    network = network;

  Hash256 hashTransaction(ITransaction transaction) {
    var nonVerifiableTransaction = TransactionFactory.toNonVerifiableTransaction(transaction);
    final hasher = pc.KeccakDigest(256);
    var hash = hasher.process(nonVerifiableTransaction.serialize());
    return Hash256(hash);
  }

  Signature signTransaction(KeyPair keyPair, ITransaction transaction) {
    var nonVerifiableTransaction = TransactionFactory.toNonVerifiableTransaction(transaction);
    return keyPair.sign(nonVerifiableTransaction.serialize());
  }

  bool verifyTransaction(ITransaction transaction, Signature signature) {
    var nonVerifiableTransaction = TransactionFactory.toNonVerifiableTransaction(transaction);
    return Verifier(PublicKey(transaction.signerPublicKey.bytes)).verify(nonVerifiableTransaction.serialize(), signature);
  }

  List<int> bip32Path(int accountId) {
    return [44, 'mainnet' == network.name ? 4343 : 1, accountId, 0, 0];
  }

  static KeyPair bip32NodeToKeyPair(Bip32Node bip32Node) {
    // BIP32 private keys should be used as is, so reverse here to counteract reverse in KeyPair
    var reversedPrivateKeyBytes = Uint8List.fromList(bip32Node.privateKey.bytes.reversed.toList());
    return KeyPair(PrivateKey(reversedPrivateKeyBytes));
  }

  String attachSignature(ITransaction transaction, Signature signature) {
		transaction.signature = nc.Signature(signature.bytes);
    var transactionHex = bytesToHex(TransactionFactory.toNonVerifiableTransaction(transaction).serialize());
		var signatureHex = signature.toString();
		var jsonPayload = '{"data": "$transactionHex", "signature": "$signatureHex"}';
		return jsonPayload;
	}
}
