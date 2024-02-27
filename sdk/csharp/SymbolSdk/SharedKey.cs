using System.Text;

namespace SymbolSdk;

public class SharedKey
{
    private static bool IsCanonicalKey(byte[] publicKey)
    {
        var a = (publicKey[31] & 0x7F) ^ 0x7F;
        for (var i = 30; 0 < i; --i)
        {
            a |= publicKey[i] ^ 0xFF;
        }

        a = (a - 1) >> 8;

        var b = (0xED - 1 - publicKey[0]) >> 8;
        return 0 != 1 - (a & b & 1);
    }
    
    private static bool IsInMainSubgroup(long[][] point)
    {
        var result = new List<long[]> { NaclCatapult.Gf(), NaclCatapult.Gf(), NaclCatapult.Gf(), NaclCatapult.Gf() };
        Console.WriteLine(result[1][0]);
        Console.WriteLine(result[2][0]);
        // multiply by group order
        NaclCatapult.Scalarmult(result.ToArray(), point, NaclCatapult.L);
        Console.WriteLine(result[1][0]);
        Console.WriteLine(result[2][0]);
        // check if result is neutral element
        var areEqual = NaclCatapult.Neq25519(result[1], result[2]);
        var isZero = NaclCatapult.Neq25519(NaclCatapult.Gf(), result[0]);
        // yes, this is supposed to be bit OR
        return 0 == (areEqual | isZero);
    }

    
    private static Func<byte[], byte[], byte[]> DeriveSharedSecretFactory(Action<byte[], byte[]> cryptoHash)
    {
        return (privateKeyBytes, otherPublicKey) =>
        {
            var point = new[] {NaclCatapult.Gf(), NaclCatapult.Gf(), NaclCatapult.Gf(), NaclCatapult.Gf()};
            NaclCatapult.Unpack(point, otherPublicKey);
            if (!IsCanonicalKey(otherPublicKey) || 0 != NaclCatapult.Unpack(point, otherPublicKey) ||
                !IsInMainSubgroup(point))
            {
                throw new Exception("invalid point");
            }

            NaclCatapult.Z(point[0], NaclCatapult.Gf(), point[0]);
            NaclCatapult.Z(point[3], NaclCatapult.Gf(), point[3]);

            var scalar = new byte[64];
            cryptoHash(scalar, privateKeyBytes);

            scalar[0] &= 248;
            scalar[31] &= 127;
            scalar[31] |= 64;

            var result = new [] {NaclCatapult.Gf(), NaclCatapult.Gf(), NaclCatapult.Gf(), NaclCatapult.Gf()};
            NaclCatapult.Scalarmult(result, point, scalar);
            
            var sharedSecret = new long[32];
            NaclCatapult.Pack(sharedSecret, result);
            var byteArray = new byte[sharedSecret.Length];
            for(var i = 0; i < byteArray.Length; i++)
            {
                byteArray[i] = (byte)sharedSecret[i];
            }
            return byteArray;
        };
    }

    public static Func<byte[], byte[], SharedKey256> DeriveSharedKeyFactory(string info,
        Action<byte[], byte[]> cryptoHash)
    {
        var deriveSharedSecret = DeriveSharedSecretFactory(cryptoHash);
        return (byte[] privateKeyBytes, byte[] otherPublicKey) =>
        {
            var sharedSecret = deriveSharedSecret(privateKeyBytes, otherPublicKey);
            var hkdf = new Hkdf();
            var key = hkdf.DeriveKey(new byte[32], sharedSecret, Encoding.UTF8.GetBytes(info), 32);
            return new SharedKey256(key);
        };
    }
}