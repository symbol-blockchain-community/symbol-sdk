import './models.dart';
import './ITransaction.dart';
import '../models/IInnerTransaction.dart';

class TransactionFactory {
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