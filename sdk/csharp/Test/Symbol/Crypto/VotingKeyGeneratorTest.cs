using Newtonsoft.Json;
using SymbolSdk;
using SymbolSdk.Symbol;

namespace Test.Symbol.Crypto;

public class VotingKeyGeneratorTest
{
    [Test]
    public async Task VotingKeyGenerator()
    {
        var file = new FileInfo("../../../../../../tests/vectors/symbol/crypto/7.test-voting-keys-generation.json");
        var contents = await File.ReadAllTextAsync(file.FullName);
        var jsonMap = JsonConvert.DeserializeObject<List<Dictionary<string, object>>>(contents);

        if (jsonMap != null)
            foreach (var t in jsonMap)
            {
                var rootPrivateKey = t["rootPrivateKey"];
                var startEpoch = (long)t["startEpoch"];
                var endEpoch = (long)t["endEpoch"];
                var expectedFileHex = (string)t["expectedFileHex"];
                var votingKeysGenerator = new VotingKeysGenerator(new KeyPair(new PrivateKey(rootPrivateKey)));
                var key = votingKeysGenerator.Generate(startEpoch, endEpoch);
                var keyBytes = new byte[80];
                Array.Copy(key, 0, keyBytes, 0, 80);
                Assert.That(expectedFileHex[..160], Is.EqualTo(Converter.BytesToHex(keyBytes)));
            }
    }
}