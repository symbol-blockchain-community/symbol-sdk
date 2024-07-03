# Symbol-SDK

php用のsymbol-sdkです、NEMは使えません。

modelsやsign, 他crypto関連のテストは行っていますがsdk自体の動作テストは行っていません。自己責任でご利用ください。

SymbolCommunity管理（有志）のよる管理です、管理者、コントリビューターは常時募集しています。

Transactionのアナウンス、REST APIからのデータ取得には以下ライブラリがおすすめです。

```
comporser install symbol-rest-client
```

## TransferTransaction

```php
use SymbolRestClient\Api\TransactionRoutesApi;
use SymbolRestClient\Configuration;

use SymbolSdk\Facade\SymbolFacade;
use SymbolSdk\CryptoTypes\PrivateKey;
use SymbolSdk\Symbol\Models\TransferTransactionV1;
use SymbolSdk\Symbol\Models\UnresolvedMosaic;
use SymbolSdk\Symbol\Models\UnresolvedMosaicId;
use SymbolSdk\Symbol\Models\PublicKey;
use SymbolSdk\Symbol\Models\Amount;
use SymbolSdk\Symbol\Models\NetworkType;

$facade = new SymbolFacade('testnet');
$alice = $facade->createAccount(new PrivateKey('5DB8324E7EB83E7665D500B014283260EF312139034E86DFB7EE736503EA****'));
$bob = $facade->createPublicAccount(new PublicKey('4C4BD7F8E1E1AC61DB817089F9416A7EDC18339F06CDC851495B271533FAD13B'));

$transferTransaction = new TransferTransactionV1(
  network: new NetworkType(NetworkType::TESTNET),
  signerPublicKey: $alice->publicKey,
  recipientAddress: $bob->address,
  mosaics: [
    new UnresolvedMosaic(
      mosaicId: new UnresolvedMosaicId(),
      amount: new Amount(1)
    )
  ],
  message: "hello, symbol!"
);

$facade->setMaxFee($transferTransaction, 100);
$signature = $alice->signTransaction($transferTransaction);
$payload = $facade->attachSignature($transferTransaction, $signature);

$config = new Configuration();
$config->setHost('https://NODE_URL:3001');
$client = new GuzzleHttp\Client();
$apiInstance = new TransactionRoutesApi($client, $config);

try {
  $result = $apiInstance->announceTransaction($payload);
  print_r($result);
} catch (Exception $e) {
  echo 'Exception when calling TransactionRoutesApi->announceTransaction: ', $e->getMessage(), PHP_EOL;
}
```
