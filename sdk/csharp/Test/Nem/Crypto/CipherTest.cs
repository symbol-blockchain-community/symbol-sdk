using Newtonsoft.Json;
using SymbolSdk;
using SymbolSdk.Nem;

namespace Test.Nem.Crypto;

public class CipherTest
{
    [Test]
    public async Task Cipher()
    {
        var file = new FileInfo("../../../../../../tests/vectors/nem/crypto/4.test-cipher.json");
        var contents = await File.ReadAllTextAsync(file.FullName);
        var jsonMap = JsonConvert.DeserializeObject<List<Dictionary<string, string>>>(contents);

        if (jsonMap != null)
            foreach (var t in jsonMap)
            {
                var privateKey = new PrivateKey(t["privateKey"]);
                var recipientPublicKey = new PublicKey(t["otherPublicKey"]);
                var clearText = Converter.HexToBytes(t["clearText"]);
                var iv = t["iv"];
                var result = CiperHelper.EncodeAesGcm(SymbolSdk.Nem.SharedKey.DeriveSharedKey, privateKey.bytes, recipientPublicKey.bytes, clearText, Converter.HexToBytes(iv));
                var tag = t["tag"];
                var cipherText = t["cipherText"];
                Assert.Multiple(() =>
                {
                    Assert.That(Converter.BytesToHex(result.tag), Is.EqualTo(tag));
                    Assert.That(Converter.BytesToHex(result.initializationVector), Is.EqualTo(iv));
                    Assert.That(Converter.BytesToHex(result.cipherText), Is.EqualTo(cipherText));
                });
            }
    }
}