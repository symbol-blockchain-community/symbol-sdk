using SymbolSdk.Symbol;
using SymbolSdk;
using Org.BouncyCastle.Crypto.Digests;

namespace Test.Symbol.Model;

public class AggregateV3Test
{
    [Test]
    public void AggregateV3()
    {
        var facade = new SymbolSdk.Symbol.SymbolFacade(Network.TestNet);
        var pkey = new PrivateKey("5dab087e624a8a4b79e17f8b83800ee66f3bb1292618b6fd1c2f8b27ff88e0eb");
        var keyPair = new KeyPair(pkey);
        var address = facade.Network.PublicKeyToAddress(keyPair.PublicKey);
        var AggTx = new AggregateCompleteTransactionV3();
        
        var Tx1 = new EmbeddedTransferTransactionV1(
            signerPublicKey: new PublicKey(keyPair.PublicKey.bytes),
            recipientAddress: new UnresolvedAddress(address),
            mosaics: [],
            message: Converter.Utf8ToBytes("test message"));

        AggTx.Transactions.ToList().Add(Tx1);
        var signature = facade.SignTransaction(keyPair, AggTx);
        TransactionHelper.AttachSignature(AggTx, signature);
        var hashTransaction = facade.HashTransaction(AggTx);
        var hasher = new Sha3Digest(256);
        var hash = new byte[32];
        hasher.BlockUpdate(AggTx.Signature.bytes, 0, AggTx.Signature.bytes.Length);
        hasher.BlockUpdate(AggTx.SignerPublicKey.bytes, 0, AggTx.SignerPublicKey.bytes.Length);
        hasher.BlockUpdate(facade.Network.GenerationHashSeed?.bytes, 0, facade.Network.GenerationHashSeed!.bytes.Length);
        var transactionBytes = facade.TransactionDataBuffer(AggTx.Serialize());
        hasher.BlockUpdate(transactionBytes, 0, transactionBytes.Length);
        hasher.DoFinal(hash, 0);

        var hex = Converter.BytesToHex(hashTransaction.bytes);
        
        Assert.That(Converter.BytesToHex(hash), Is.EqualTo(hex));
    }
}