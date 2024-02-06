import 'dart:typed_data';
import 'package:pointycastle/export.dart' as pc;
import '../symbol/ITransaction.dart';
import '../models/IInnerTransaction.dart';
import '../symbol/Network.dart';
import '../CryptoTypes.dart';
import '../symbol/KeyPair.dart';
import '../symbol/models.dart' as sc;
import '../symbol/merkle.dart';
import '../Bip32.dart';
import '../utils/converter.dart';

const TRANSACTION_HEADER_SIZE = 4 + 4 + Signature.SIZE + PublicKey.SIZE + 4;

const AGGREGATE_HASHED_SIZE = 4 + 8 + 8 + Hash256.SIZE;

bool isAggregateTransaction(Uint8List transactionBuffer) {
  final transactionTypeOffset = TRANSACTION_HEADER_SIZE + 2; // skip version and network byte
  final transactionType = (transactionBuffer[transactionTypeOffset + 1] << 8) + transactionBuffer[transactionTypeOffset];
  final aggregateTypes = [sc.TransactionType.AGGREGATE_BONDED.value, sc.TransactionType.AGGREGATE_COMPLETE.value];
  return aggregateTypes.any((aggregateType) => aggregateType == transactionType);
}

Uint8List transactionDataBuffer(Uint8List transactionBuffer) {
  final dataBufferStart = TRANSACTION_HEADER_SIZE;
  final dataBufferEnd = isAggregateTransaction(transactionBuffer)
      ? TRANSACTION_HEADER_SIZE + AGGREGATE_HASHED_SIZE
      : transactionBuffer.length;

  return transactionBuffer.sublist(dataBufferStart, dataBufferEnd);
}

class SymbolFacade {
  Network network;
  SymbolFacade(Network network):
    network = network;

  Hash256 hashTransaction(ITransaction transaction) {
    final hasher = pc.SHA3Digest(256);
    hasher.update(transaction.signature.bytes, 0, transaction.signature.bytes.length);
    hasher.update(transaction.signerPublicKey.bytes, 0, transaction.signerPublicKey.bytes.length);
    hasher.update(network.generationHashSeed.bytes, 0, network.generationHashSeed.bytes.length);
    var txBytes = transactionDataBuffer(transaction.serialize());
    hasher.update(txBytes, 0, txBytes.length);

    var hash = Uint8List(32);
    hasher.doFinal(hash, 0);
    return Hash256(hash);
  }

  Signature signTransaction(KeyPair keyPair, ITransaction transaction) {
    if(bytesToHex(transaction.signerPublicKey.bytes) != bytesToHex((PublicKey('')).bytes)){
      if(bytesToHex(transaction.signerPublicKey.bytes) != bytesToHex(keyPair.publicKey.bytes)){
        throw Exception('Transaction signerPublicKey does not match keyPair public key');
      }
    }
    transaction.signerPublicKey = sc.PublicKey(keyPair.publicKey.bytes);
    var bytes = Uint8List.fromList([
      ...network.generationHashSeed.bytes,
      ...transactionDataBuffer(transaction.serialize())
    ]);
    return keyPair.sign(bytes);
  }

  bool verifyTransaction(ITransaction transaction, Signature signature) {
    var verifyBuffer = Uint8List.fromList([
      ...network.generationHashSeed.bytes,
      ...transactionDataBuffer(transaction.serialize())
    ]);
    return Verifier(PublicKey(transaction.signerPublicKey.bytes)).verify(verifyBuffer, signature);
  }

  dynamic cosignTransaction(KeyPair keyPair, ITransaction transaction, {bool detached = false}) {
    var transactionHash = hashTransaction(transaction);

    void initializeCosignature(cosignature) {
      cosignature.version = BigInt.zero;
      cosignature.signerPublicKey = sc.PublicKey(keyPair.publicKey.bytes);
      cosignature.signature = sc.Signature(keyPair.sign(transactionHash.bytes).bytes);
    }

    if (detached) {
      var cosignature = sc.DetachedCosignature();
      cosignature.parentHash = sc.Hash256(transactionHash);
      initializeCosignature(cosignature);
      return cosignature;
    }

    var cosignature = sc.Cosignature();
    initializeCosignature(cosignature);
    return cosignature;
  }

  static Hash256 hashEmbeddedTransactions(List<IInnerTransaction> embeddedTransactions) {
    var hashBuilder = MerkleHashBuilder();
    embeddedTransactions.forEach((embeddedTransaction) {
      var hasher = pc.SHA3Digest(256);
      hashBuilder.update(Hash256(hasher.process(embeddedTransaction.serialize())));
    });

    return hashBuilder.final_();
  }

  List<int> bip32Path(int accountId) {
    return [44, 'mainnet' == network.name ? 4343 : 1, accountId, 0, 0];
  }

  static KeyPair bip32NodeToKeyPair(Bip32Node bip32Node) {
    return KeyPair(PrivateKey(bip32Node.privateKey.bytes));
  }

  String attachSignature(ITransaction transaction, Signature signature) {
		transaction.signature = sc.Signature(signature.bytes);
		var transactionBuffer = transaction.serialize();
		var hexPayload = bytesToHex(transactionBuffer);
		var jsonPayload = '{"payload": "$hexPayload"}';
		return jsonPayload;
	}
}
