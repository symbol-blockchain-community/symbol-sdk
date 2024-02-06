namespace SymbolSdk.Symbol;

public class SharedKey
{
    public static SharedKey256 DeriveSharedKey(byte[] privateKey, byte[] otherPublicKey) {
        var deriveSharedKeyImpl = SymbolSdk.SharedKey.DeriveSharedKeyFactory("catapult", NaclCatapult.CryptoHash);
        return deriveSharedKeyImpl(privateKey, otherPublicKey);
    }
}