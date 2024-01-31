import 'dart:typed_data';
import 'package:pointycastle/export.dart' as pc;
import '../nem/ITransaction.dart';
import '../nem/Network.dart';
import '../CryptoTypes.dart' as ct;
import '../nem/KeyPair.dart';
import '../nem/models.dart';
import '../Bip32.dart';
import '../utils/converter.dart';
import '../models/IInnerTransaction.dart';

class NemFacade {
  Network network;
  NemFacade(Network network):
    network = network;

  ct.Hash256 hashTransaction(ITransaction transaction) {
    var nonVerifiableTransaction = toNonVerifiableTransaction(transaction);
    final hasher = pc.KeccakDigest(256);
    var hash = hasher.process(nonVerifiableTransaction.serialize());
    return ct.Hash256(hash);
  }

  ct.Signature signTransaction(KeyPair keyPair, ITransaction transaction) {
    var nonVerifiableTransaction = toNonVerifiableTransaction(transaction);
    return keyPair.sign(nonVerifiableTransaction.serialize());
  }

  bool verifyTransaction(ITransaction transaction, ct.Signature signature) {
    var nonVerifiableTransaction = toNonVerifiableTransaction(transaction);
    return Verifier(ct.PublicKey(transaction.signerPublicKey.bytes)).verify(nonVerifiableTransaction.serialize(), signature);
  }

  List<int> bip32Path(int accountId) {
    return [44, 'mainnet' == network.name ? 4343 : 1, accountId, 0, 0];
  }

  static KeyPair bip32NodeToKeyPair(Bip32Node bip32Node) {
    // BIP32 private keys should be used as is, so reverse here to counteract reverse in KeyPair
    var reversedPrivateKeyBytes = Uint8List.fromList(bip32Node.privateKey.bytes.reversed.toList());
    return KeyPair(ct.PrivateKey(reversedPrivateKeyBytes));
  }

  static String attachSignature(ITransaction transaction, Signature signature) {
		transaction.signature = Signature(signature.bytes);
    var transactionHex = bytesToHex(toNonVerifiableTransaction(transaction).serialize());
		var signatureHex = signature.toString();
		var jsonPayload = '{"data": "$transactionHex", "signature": "$signatureHex"}';
		return jsonPayload;
	}

  static IInnerTransaction toNonVerifiableTransaction(ITransaction transaction) {
    switch((transaction.type.value, transaction.version)) {
      case (257, 1):
        return toNonVerifiableTransferTransactionV1(transaction as TransferTransactionV1);
      case (257, 2):
        return toNonVerifiableTransferTransactionV2(transaction as TransferTransactionV2);
      case (2049, 1):
        return toNonVerifiableAccountKeyLinkTransactionV1(transaction as AccountKeyLinkTransactionV1);
      case (4097, 1):
        return toNonVerifiableMultisigAccountModificationTransactionV1(transaction as MultisigAccountModificationTransactionV1);
      case (4097, 2):
        return toNonVerifiableMultisigAccountModificationTransactionV2(transaction as MultisigAccountModificationTransactionV2);
      case (4100, 1):
        return toNonVerifiableMultisigTransactionV1(transaction as MultisigTransactionV1);
      case (8193, 1):
        return toNonVerifiableNamespaceRegistrationTransactionV1(transaction as NamespaceRegistrationTransactionV1);
      case (16385, 1):
        return toNonVerifiableMosaicDefinitionTransactionV1(transaction as MosaicDefinitionTransactionV1);
      case (16386, 1):
        return toNonVerifiableMosaicSupplyChangeTransactionV1(transaction as MosaicSupplyChangeTransactionV1);
    }
    throw Exception('unsupported transaction type');
  }
}

NonVerifiableAccountKeyLinkTransactionV1 toNonVerifiableAccountKeyLinkTransactionV1(AccountKeyLinkTransactionV1 tx) {
  return NonVerifiableAccountKeyLinkTransactionV1(
    network: tx.network,
    timestamp: tx.timestamp,
    signerPublicKey: tx.signerPublicKey,
    fee: tx.fee,
    deadline: tx.deadline,
    linkAction: tx.linkAction,
    remotePublicKey: tx.remotePublicKey,
  );
}

NonVerifiableMosaicDefinitionTransactionV1 toNonVerifiableMosaicDefinitionTransactionV1(MosaicDefinitionTransactionV1 tx) {
  return NonVerifiableMosaicDefinitionTransactionV1(
    network: tx.network,
    timestamp: tx.timestamp,
    signerPublicKey: tx.signerPublicKey,
    fee: tx.fee,
    deadline: tx.deadline,
    mosaicDefinition: tx.mosaicDefinition,
    rentalFeeSink: tx.rentalFeeSink,
    rentalFee: tx.rentalFee,
  );
}

NonVerifiableMosaicSupplyChangeTransactionV1 toNonVerifiableMosaicSupplyChangeTransactionV1(MosaicSupplyChangeTransactionV1 tx) {
  return NonVerifiableMosaicSupplyChangeTransactionV1(
    network: tx.network,
    timestamp: tx.timestamp,
    signerPublicKey: tx.signerPublicKey,
    fee: tx.fee,
    deadline: tx.deadline,
    mosaicId: tx.mosaicId,
    action: tx.action,
    delta: tx.delta,
  );
}

NonVerifiableMultisigAccountModificationTransactionV1 toNonVerifiableMultisigAccountModificationTransactionV1(MultisigAccountModificationTransactionV1 tx) {
  return NonVerifiableMultisigAccountModificationTransactionV1(
    network: tx.network,
    timestamp: tx.timestamp,
    signerPublicKey: tx.signerPublicKey,
    fee: tx.fee,
    deadline: tx.deadline,
    modifications: tx.modifications,
  );
}

NonVerifiableMultisigAccountModificationTransactionV2 toNonVerifiableMultisigAccountModificationTransactionV2(MultisigAccountModificationTransactionV2 tx) {
  return NonVerifiableMultisigAccountModificationTransactionV2(
    network: tx.network,
    timestamp: tx.timestamp,
    signerPublicKey: tx.signerPublicKey,
    fee: tx.fee,
    deadline: tx.deadline,
    modifications: tx.modifications,
    minApprovalDelta: tx.minApprovalDelta,
  );
}

NonVerifiableMultisigTransactionV1 toNonVerifiableMultisigTransactionV1(MultisigTransactionV1 tx) {
  return NonVerifiableMultisigTransactionV1(
    network: tx.network,
    timestamp: tx.timestamp,
    signerPublicKey: tx.signerPublicKey,
    fee: tx.fee,
    deadline: tx.deadline,
    innerTransaction: tx.innerTransaction,
  );
}

NonVerifiableNamespaceRegistrationTransactionV1 toNonVerifiableNamespaceRegistrationTransactionV1(NamespaceRegistrationTransactionV1 tx) {
  return NonVerifiableNamespaceRegistrationTransactionV1(
    network: tx.network,
    timestamp: tx.timestamp,
    signerPublicKey: tx.signerPublicKey,
    fee: tx.fee,
    deadline: tx.deadline,
    rentalFeeSink: tx.rentalFeeSink,
    rentalFee: tx.rentalFee,
    name: tx.name,
    parentName: tx.parentName,
  );
}

NonVerifiableTransferTransactionV1 toNonVerifiableTransferTransactionV1(TransferTransactionV1 tx) {
  return NonVerifiableTransferTransactionV1(
    network: tx.network,
    timestamp: tx.timestamp,
    signerPublicKey: tx.signerPublicKey,
    fee: tx.fee,
    deadline: tx.deadline,
    recipientAddress: tx.recipientAddress,
    amount: tx.amount,
    message: tx.message,
  );
}

NonVerifiableTransferTransactionV2 toNonVerifiableTransferTransactionV2(TransferTransactionV2 tx) {
  return NonVerifiableTransferTransactionV2(
    network: tx.network,
    timestamp: tx.timestamp,
    signerPublicKey: tx.signerPublicKey,
    fee: tx.fee,
    deadline: tx.deadline,
    recipientAddress: tx.recipientAddress,
    amount: tx.amount,
    message: tx.message,
    mosaics: tx.mosaics,
  );
}