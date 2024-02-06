using Newtonsoft.Json;
using SymbolSdk;
using SymbolSdk.Symbol;

namespace Test.Nem.Crypto;

public class DeriveHkdfTest
{
    [Test]
    public async Task DeriveHkdf()
    {
        var file = new FileInfo("../../../../../../tests/vectors/nem/crypto/3.test-derive-hkdf.json");
        var contents = await File.ReadAllTextAsync(file.FullName);
        var jsonMap = JsonConvert.DeserializeObject<List<Dictionary<string, string>>>(contents);

        if (jsonMap != null)
            foreach (var t in jsonMap)
            {
                var privKey = new PrivateKey(t["privateKey"]);
                var oterhPublicKey = new PublicKey(t["otherPublicKey"]);
                var sharedKey = t["sharedKey"];
                var sharedKey256 = SymbolSdk.Nem.SharedKey.DeriveSharedKey(privKey.bytes, oterhPublicKey.bytes);
                Assert.That(Converter.BytesToHex(sharedKey256.bytes), Is.EqualTo(sharedKey));
            }
    }
}