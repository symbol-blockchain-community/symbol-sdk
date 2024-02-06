using Newtonsoft.Json;
using SymbolSdk;
using SymbolSdk.Nem;

namespace Test.Nem.Crypto;

using NUnit.Framework;

public class SignTest
{
	[Test]
	public async Task Sign()
	{
		var file = new FileInfo("../../../../../../tests/vectors/nem/crypto/2.test-sign.json");
		var contents = await File.ReadAllTextAsync(file.FullName);
		var jsonMap = JsonConvert.DeserializeObject<List<Dictionary<string, object>>>(contents);

		if (jsonMap != null)
			foreach (var t in jsonMap)
			{
				var privateKey = new PrivateKey((string)t["privateKey"]);
				var publicKey = (string)t["publicKey"];
				var keyPair = new KeyPair(privateKey);
				var data = Converter.HexToBytes((string)t["data"]);
				var signed = keyPair.Sign(data);
				var signature = (string)t["signature"];
				
				Assert.Multiple(() =>
				{
					Assert.That(Converter.BytesToHex(keyPair.PublicKey.bytes), Is.EqualTo(publicKey));
					Assert.That(Converter.BytesToHex(signed.bytes), Is.EqualTo(signature));
				});
			}
	}
}