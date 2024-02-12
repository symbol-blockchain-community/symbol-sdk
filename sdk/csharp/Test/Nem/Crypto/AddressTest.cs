using Newtonsoft.Json;
using SymbolSdk;
using SymbolSdk.Nem;

namespace Test.Nem.Crypto;
public class AddressTest
{
	private readonly NemFacade MainFacade = new (Network.MainNet);
    private readonly NemFacade TestFacade = new (Network.TestNet);
    
    [Test]
    public async Task Address()
    {
	    var file = new FileInfo("../../../../../../tests/vectors/nem/crypto/1.test-address.json");
	    var contents = await File.ReadAllTextAsync(file.FullName);
	    var jsonMap = JsonConvert.DeserializeObject<List<Dictionary<string, object>>>(contents);

	    if (jsonMap != null)
		    foreach (var t in jsonMap)
            {
                var publicKey = new PublicKey((string)t["publicKey"]);
			    var mainNetwork = Network.MainNet;
			    var testNetwork = Network.TestNet;
			    var mainAddress = mainNetwork.PublicKeyToAddress(publicKey).ToString();
			    var testAddress = testNetwork.PublicKeyToAddress(publicKey).ToString();
                Assert.Multiple(() =>
                {
                    Assert.That(mainAddress, Is.EqualTo((string)t["address_Public"]));
                    Assert.That(testAddress, Is.EqualTo((string)t["address_PublicTest"]));
                });
            }
    }
}