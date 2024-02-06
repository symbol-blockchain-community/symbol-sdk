using System.Reflection;
using SymbolSdk.Nem;

namespace SymbolSdk;
public static class TransactionHelper
{
    const ulong CosignatureByte = 104;
    public static void SetMaxFee(Symbol.ITransaction transaction, int feeMultiplier, int cosignatureCount = 0)
    {
        transaction.Fee = new Symbol.Amount((transaction.Size + (ulong)cosignatureCount * CosignatureByte) * (ulong)feeMultiplier);
    }
    
    public static string GetPayload(Symbol.ITransaction transaction)
    {
        return Converter.BytesToHex(transaction.Serialize());
    }
    
    public static T TransactionDeserializer<T>(string payload, Func<BinaryReader, T> func) where T: ISerializer
    {
        var barr = Converter.HexToBytes(payload);
        var ms = new MemoryStream(barr);
        var br = new BinaryReader(ms);
        return func(br);
    }
    
    public static Symbol.Cosignature CosignatureDeserializer(string payload)
    {
        var barr = Converter.HexToBytes(payload);
        var ms = new MemoryStream(barr);
        var br = new BinaryReader(ms);
        return Symbol.Cosignature.Deserialize(br);
    }
    
    public static string AttachSignature(Symbol.ITransaction transaction, Symbol.Signature signature)
    {
        transaction.Signature = signature;
        var transactionBuffer = transaction.Serialize();
        var hexPayload = Converter.BytesToHex(transactionBuffer);
        var jsonPayload = "{\"payload\": \"" + hexPayload + "\"}";
        return jsonPayload;
    }
    
    public static Nem.IBaseTransaction ToNonVerifiableTransaction(Nem.IBaseTransaction transaction)
    {
        var nonVerifiableClassName = transaction.GetType().Name;
        nonVerifiableClassName = nonVerifiableClassName.Contains("NonVerifiable") ? nonVerifiableClassName : $"NonVerifiable{nonVerifiableClassName}";
        var assm = Assembly.GetExecutingAssembly();
        var types = assm.GetTypes()
            .Where(p => p.Namespace == "SymbolSdk.Nem")
            .OrderBy(o => o.Name)
            .Where(s => !s.Name.Contains("<>"))
            .ToList();
        var nonVerifiableClass = types.Find(m => m.Name == nonVerifiableClassName);
        if (nonVerifiableClass == null) throw new NullReferenceException("nonVerifiableClass type is invalid");
        var inst = (Nem.IBaseTransaction)Activator.CreateInstance(nonVerifiableClass)!;

        var pInfos = inst.GetType().GetProperties();
        var tInfos = transaction.GetType().GetProperties();

        foreach (var propertyInfo in pInfos)
        {
            if (!propertyInfo.CanWrite) continue;
            var tInfo = tInfos.ToList().Find(t => t.Name == propertyInfo.Name);
            var value = tInfo?.GetValue(transaction);
            propertyInfo.SetValue(inst, value);
        }
        return inst;
    }

    public static string AttachSignature(Nem.ITransaction transaction, Nem.Signature signature)
    {
        transaction.Signature = new Nem.Signature(signature.bytes);
        var transactionHex = Converter.BytesToHex(ToNonVerifiableTransaction(transaction).Serialize());
        var signatureHex = signature.ToString();
        var jsonPayload = "{\"data\":\"" + transactionHex + "\",\"signature\":\"" + signatureHex + "\"}";
        return jsonPayload;
    }
    
    public static IBaseTransaction ToNonVerifiableTransaction(ITransaction transaction)
    {
      return (transaction.Type.Value, transaction.Version) switch
      {
        (257, 1) => ToNonVerifiableTransferTransactionV1(transaction as TransferTransactionV1 ??
                                                         throw new InvalidOperationException(
                                                           "Invalid transaction type")),
        (257, 2) => ToNonVerifiableTransferTransactionV2(transaction as TransferTransactionV2 ??
                                                         throw new InvalidOperationException(
                                                           "Invalid transaction type")),
        (2049, 1) => ToNonVerifiableAccountKeyLinkTransactionV1(transaction as AccountKeyLinkTransactionV1 ??
                                                                throw new InvalidOperationException(
                                                                  "Invalid transaction type")),
        (4097, 1) => ToNonVerifiableMultisigAccountModificationTransactionV1(
          transaction as MultisigAccountModificationTransactionV1 ??
          throw new InvalidOperationException("Invalid transaction type")),
        (4097, 2) => ToNonVerifiableMultisigAccountModificationTransactionV2(
          transaction as MultisigAccountModificationTransactionV2 ??
          throw new InvalidOperationException("Invalid transaction type")),
        (4100, 1) => ToNonVerifiableMultisigTransactionV1(transaction as MultisigTransactionV1 ??
                                                          throw new InvalidOperationException(
                                                            "Invalid transaction type")),
        (8193, 1) => ToNonVerifiableNamespaceRegistrationTransactionV1(
          transaction as NamespaceRegistrationTransactionV1 ??
          throw new InvalidOperationException("Invalid transaction type")),
        (16385, 1) => ToNonVerifiableMosaicDefinitionTransactionV1(transaction as MosaicDefinitionTransactionV1 ??
                                                                   throw new InvalidOperationException(
                                                                     "Invalid transaction type")),
        (16386, 1) => ToNonVerifiableMosaicSupplyChangeTransactionV1(transaction as MosaicSupplyChangeTransactionV1 ??
                                                                     throw new InvalidOperationException(
                                                                       "Invalid transaction type")),
        _ => throw new Exception("unsupported transaction type")
      };
    }
    
    private static NonVerifiableAccountKeyLinkTransactionV1 ToNonVerifiableAccountKeyLinkTransactionV1(AccountKeyLinkTransactionV1 tx) {
      return new NonVerifiableAccountKeyLinkTransactionV1(
        network: tx.Network,
        timestamp: tx.Timestamp,
        signerPublicKey: tx.SignerPublicKey,
        fee: tx.Fee,
        deadline: tx.Deadline,
        linkAction: tx.LinkAction,
        remotePublicKey: tx.RemotePublicKey
      );
    }
    
    private static NonVerifiableMosaicDefinitionTransactionV1 ToNonVerifiableMosaicDefinitionTransactionV1(MosaicDefinitionTransactionV1 tx) {
      return new NonVerifiableMosaicDefinitionTransactionV1(
        network: tx.Network,
        timestamp: tx.Timestamp,
        signerPublicKey: tx.SignerPublicKey,
        fee: tx.Fee,
        deadline: tx.Deadline,
        mosaicDefinition: tx.MosaicDefinition,
        rentalFeeSink: tx.RentalFeeSink,
        rentalFee: tx.RentalFee
      );
    }

    private static NonVerifiableMosaicSupplyChangeTransactionV1 ToNonVerifiableMosaicSupplyChangeTransactionV1(MosaicSupplyChangeTransactionV1 tx) {
      return new NonVerifiableMosaicSupplyChangeTransactionV1(
        network: tx.Network,
        timestamp: tx.Timestamp,
        signerPublicKey: tx.SignerPublicKey,
        fee: tx.Fee,
        deadline: tx.Deadline,
        mosaicId: tx.MosaicId,
        action: tx.Action,
        delta: tx.Delta
      );
    }

    private static NonVerifiableMultisigAccountModificationTransactionV1 ToNonVerifiableMultisigAccountModificationTransactionV1(MultisigAccountModificationTransactionV1 tx) {
      return new NonVerifiableMultisigAccountModificationTransactionV1(
        network: tx.Network,
        timestamp: tx.Timestamp,
        signerPublicKey: tx.SignerPublicKey,
        fee: tx.Fee,
        deadline: tx.Deadline,
        modifications: tx.Modifications
      );
    }

    private static NonVerifiableMultisigAccountModificationTransactionV2 ToNonVerifiableMultisigAccountModificationTransactionV2(MultisigAccountModificationTransactionV2 tx) {
      return new NonVerifiableMultisigAccountModificationTransactionV2(
        network: tx.Network,
        timestamp: tx.Timestamp,
        signerPublicKey: tx.SignerPublicKey,
        fee: tx.Fee,
        deadline: tx.Deadline,
        modifications: tx.Modifications,
        minApprovalDelta: tx.MinApprovalDelta
      );
    }

    private static NonVerifiableMultisigTransactionV1 ToNonVerifiableMultisigTransactionV1(MultisigTransactionV1 tx) {
      return new NonVerifiableMultisigTransactionV1(
        network: tx.Network,
        timestamp: tx.Timestamp,
        signerPublicKey: tx.SignerPublicKey,
        fee: tx.Fee,
        deadline: tx.Deadline,
        innerTransaction: tx.InnerTransaction
      );
    }

    private static NonVerifiableNamespaceRegistrationTransactionV1 ToNonVerifiableNamespaceRegistrationTransactionV1(NamespaceRegistrationTransactionV1 tx) {
      return new NonVerifiableNamespaceRegistrationTransactionV1(
        network: tx.Network,
        timestamp: tx.Timestamp,
        signerPublicKey: tx.SignerPublicKey,
        fee: tx.Fee,
        deadline: tx.Deadline,
        rentalFeeSink: tx.RentalFeeSink,
        rentalFee: tx.RentalFee,
        name: tx.Name,
        parentName: tx.ParentName
      );
    }

    private static NonVerifiableTransferTransactionV1 ToNonVerifiableTransferTransactionV1(TransferTransactionV1 tx) {
      return new NonVerifiableTransferTransactionV1(
        network: tx.Network,
        timestamp: tx.Timestamp,
        signerPublicKey: tx.SignerPublicKey,
        fee: tx.Fee,
        deadline: tx.Deadline,
        recipientAddress: tx.RecipientAddress,
        amount: tx.Amount,
        message: tx.Message
      );
    }

    private static NonVerifiableTransferTransactionV2 ToNonVerifiableTransferTransactionV2(TransferTransactionV2 tx) {
      return new NonVerifiableTransferTransactionV2(
        network: tx.Network,
        timestamp: tx.Timestamp,
        signerPublicKey: tx.SignerPublicKey,
        fee: tx.Fee,
        deadline: tx.Deadline,
        recipientAddress: tx.RecipientAddress,
        amount: tx.Amount,
        message: tx.Message,
        mosaics: tx.Mosaics
      );
    }
}