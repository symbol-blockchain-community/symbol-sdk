using Org.BouncyCastle.Crypto.Digests;

namespace SymbolSdk.Nem;

public abstract class SharedKey
{
    private static void CryptoHash(byte[] outArray, byte[] m) {
        var digest = new KeccakDigest(512);
        digest.BlockUpdate(m, 0, m.Length);
        digest.DoFinal(outArray, 0);
    }

    public static SharedKey256 DeriveSharedKey(byte[] privateKey, byte[] otherPublicKey) {
        var deriveSharedKeyImpl = SymbolSdk.SharedKey.DeriveSharedKeyFactory("nem-nis1", CryptoHash);
        return deriveSharedKeyImpl(privateKey.Reverse().ToArray(), otherPublicKey);
    }
}