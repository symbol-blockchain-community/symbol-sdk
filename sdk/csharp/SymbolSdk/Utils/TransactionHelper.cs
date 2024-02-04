using System.Reflection;

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
}