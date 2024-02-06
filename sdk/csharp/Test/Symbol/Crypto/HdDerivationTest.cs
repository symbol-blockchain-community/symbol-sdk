using System.Text.Json.Nodes;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using SymbolSdk;
using SymbolSdk.Symbol;

namespace Test.Symbol.Crypto;

public class HdDerivationTest
{
    private static void NodeTest(Bip32Node node, int childrenCount, string rootPublicKey, List<List<int>> childrenPath, List<string> childrenPublicKey)
    {
        var rootKeyPair = new KeyPair(node.PrivateKey);
        Assert.That(rootKeyPair.PublicKey.ToString(), Is.EqualTo(rootPublicKey));
        for (var i = 0; i < childrenCount; i++)
        {
            var childNode = node.DerivePath(childrenPath[i]);
            var childKeyPair = new KeyPair(childNode.PrivateKey);
            Assert.That(childKeyPair.PublicKey.ToString(), Is.EqualTo(childrenPublicKey[i]));
        }
    }

    [Test]
    public async Task HdDerivation()
    {
        var file = new FileInfo("../../../../../../tests/vectors/symbol/crypto/6.test-hd-derivation.json");
        var contents = await File.ReadAllTextAsync(file.FullName);
        var jsonMap = JsonConvert.DeserializeObject<Dictionary<string, dynamic>>(contents);
        var counter = 0;
        var publicNet = jsonMap["public_net"];
        var testVectors = jsonMap["test_vectors"];

        foreach (var element in publicNet)
        {
            var mnemonic = (string)element["mnemonic"];
            var seed = (string)element["seed"];
            var passphrase = (string)element["passphrase"];
            var rootPublicKey = (string)element["rootPublicKey"];
            var children = element["childAccounts"];
            var childrenPath = new List<List<int>>();
            var childrenPublicKey = new List<string>();
            var c = 0;
            foreach (var child in children)
            {
                c++;
                childrenPath.Add(((JArray)child["path"]).ToObject<List<int>>());
                childrenPublicKey.Add(child["publicKey"].ToObject<string>());
            }
            if (mnemonic != null)
            {
                var node = new Bip32().FromMnemonic(mnemonic, passphrase);
                NodeTest(node, c, rootPublicKey, childrenPath, childrenPublicKey);
            }
            if (seed != null)
            {
                var node = new Bip32().FromSeed(Converter.HexToBytes(seed));
                NodeTest(node, c, rootPublicKey, childrenPath, childrenPublicKey);
            }
            counter++;
        }

        foreach (var element in testVectors)
        {
            var mnemonic = (string)element["mnemonic"];
            var seed = (string)element["seed"];
            var passphrase = (string)element["passphrase"];
            var rootPublicKey = (string)element["rootPublicKey"];
            var children = element["childAccounts"];
            var childrenPath = new List<List<int>>();
            var childrenPublicKey = new List<string>();
            var c = 0;
            foreach (var child in children)
            {
                c++;
                childrenPath.Add(((JArray)child["path"]).ToObject<List<int>>());
                childrenPublicKey.Add(child["publicKey"].ToObject<string>());
            }
            if (mnemonic != null)
            {
                var node = new Bip32().FromMnemonic(mnemonic, passphrase);
                NodeTest(node, c, rootPublicKey, childrenPath, childrenPublicKey);
            }
            if (seed != null)
            {
                var node = new Bip32().FromSeed(Converter.HexToBytes(seed));
                NodeTest(node, c, rootPublicKey, childrenPath, childrenPublicKey);
            }
            counter++;
        }
    }
}

