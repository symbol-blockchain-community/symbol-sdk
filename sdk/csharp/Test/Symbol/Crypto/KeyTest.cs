using Newtonsoft.Json;
using SymbolSdk;
using SymbolSdk.Symbol;
using NUnit.Framework;
using Org.BouncyCastle.Crypto.Digests;

namespace Test.Symbol.Crypto;

public class KeyTest
{
    [Test]
    public async Task Key()
    {
        var file = new FileInfo("../../../../../../tests/vectors/symbol/crypto/1.test-keys.json");
        var contents = await File.ReadAllTextAsync(file.FullName);
        var jsonMap = JsonConvert.DeserializeObject<List<Dictionary<string, string>>>(contents);

        if (jsonMap != null)
            foreach (var t in jsonMap)
            {
                var privKey = new PrivateKey(t["privateKey"]);
                var publicKey = t["publicKey"];
                var keyPair = new KeyPair(privKey);
                var pubKey = keyPair.PublicKey;
                Assert.That(Converter.BytesToHex(pubKey.bytes), Is.EqualTo(publicKey));
            }
    }
}