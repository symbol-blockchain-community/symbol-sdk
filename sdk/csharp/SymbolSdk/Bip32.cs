using System.Security.Cryptography;
using dotnetstandard_bip39;
using Org.BouncyCastle.Crypto;
using Org.BouncyCastle.Crypto.Digests;
using Org.BouncyCastle.Crypto.Macs;
using Org.BouncyCastle.Crypto.Parameters;

namespace SymbolSdk;

public class Bip32Node
{
    public PrivateKey PrivateKey;
    public byte[] ChainCode;

    public Bip32Node(byte[] hmacKey, byte[] data)
    {
        var hmac = new HMac(new Sha512Digest());
        hmac.Init(new KeyParameter(hmacKey));
        var hmacResult = new byte[64];
        hmac.BlockUpdate(data, 0, data.Length);
        hmac.DoFinal(hmacResult, 0);
        PrivateKey = new PrivateKey(hmacResult.ToList().GetRange(0, 32).ToArray());
        ChainCode = hmacResult.ToList().GetRange(32, 32).ToArray();
    }
    
    public Bip32Node DeriveOne(int identifier)
    {
        var childData = new byte[1 + 32 + 4];
        childData[0] = 0;
        childData[^4] = 0x80;

        for (var i = 0; i < 4; ++i)
        {
            childData[childData.Length - 1 - i] |= (byte)((identifier >> (8 * i)) & 0xFF);
        }

        for (var i = 0; i < 32; ++i)
        {
            childData[1 + i] = PrivateKey.bytes[i];
        }

        return new Bip32Node(ChainCode, childData);
    }
    
    public Bip32Node DerivePath(List<int> path)
    {
        var nextNode = this;
        return path.Aggregate(nextNode, (current, identifier) => current.DeriveOne(identifier));
    }
}

public class Bip32
{
    public readonly byte[] RootHmacKey;
    public Bip32(string curveName = "ed25519")
    {
        RootHmacKey = Converter.Utf8ToBytes(curveName + " seed");
    }
    
    public Bip32Node FromSeed(byte[] seed) {
        return new Bip32Node(RootHmacKey, seed);
    }
    
    public Bip32Node FromMnemonic(string mnemonic, string password) {
        var bip39 = new BIP39();
        return FromSeed(Converter.HexToBytes(bip39.MnemonicToSeedHex(mnemonic, password)));
    }

    public static string Random(byte seedLength = 32)
    {
        var bip39 = new BIP39();
        var wordList = bip39.GenerateMnemonic(seedLength * 8, BIP39Wordlist.English);
        return wordList;
    }
}