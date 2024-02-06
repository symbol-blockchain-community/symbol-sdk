using Newtonsoft.Json;
using SymbolSdk;
using Org.BouncyCastle.Crypto.Digests;

namespace Test.Symbol.Crypto;

public class Sha3256Test
{
    [Test]
    public async Task Sha3256()
    {
        var file = new FileInfo("../../../../../../tests/vectors/symbol/crypto/0.test-sha3-256.json");
        var contents = await File.ReadAllTextAsync(file.FullName);
        var jsonMap = JsonConvert.DeserializeObject<List<Dictionary<string, string>>>(contents);

        if (jsonMap != null)
            foreach (var t in jsonMap)
            {
                var digest = new Sha3Digest(256);
                var data = Converter.HexToBytes(t["data"]);
                digest.BlockUpdate(data, 0, data.Length);
                var output = new byte[digest.GetDigestSize()];
                digest.DoFinal(output, 0);
                var testName = t["hash"];
                var hash = Converter.BytesToHex(output);
                Assert.That(hash, Is.EqualTo(testName));
            }
    }
}