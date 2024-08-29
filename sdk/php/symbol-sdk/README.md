# Symbol-SDK

php 用の symbol-sdk です、NEM は使えません。

models や sign, 他 crypto 関連のテストは行っていますが sdk 自体の動作テストは行っていません。自己責任でご利用ください。

SymbolCommunity 管理（有志）のよる管理です、管理者、コントリビューターは常時募集しています。

## Install

```
composer require symbol-blockchain-community/symbol-sdk
```

また、Transaction のアナウンス、REST API からのデータ取得には以下ライブラリがおすすめです。

```
composer require symbol-blockchain-community/symbol-rest-client
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
use SymbolSdk\Symbol\Models\Timestamp;

$facade = new SymbolFacade('testnet');
$alice = $facade->createAccount(new PrivateKey('5DB8324E7EB83E7665D500B014283260EF312139034E86DFB7EE736503EA****'));
$bob = $facade->createPublicAccount(new PublicKey('4C4BD7F8E1E1AC61DB817089F9416A7EDC18339F06CDC851495B271533FAD13B'));

$transferTransaction = new TransferTransactionV1(
  network: new NetworkType(NetworkType::TESTNET),
  signerPublicKey: $alice->publicKey,
	deadline: new Timestamp($facade->now()->addHours(2)),
  recipientAddress: $bob->address,
  mosaics: [
    new UnresolvedMosaic(
      mosaicId: new UnresolvedMosaicId('0x72C0212E67A08BCE'),
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

## AggregateCompleteTransaction

モザイク作成を例にします
AggregateTransaction の Inner Transaction クラスは全て Embedded がつきます
`MosaicDefinitionTransactionV1` -> `EmbeddedMosaicDefinitionTransactionV1`
また、Inner Transaction もネットワークタイプの設定が必要です。

```php
$mosaicId = IdGenerator::generateMosaicId($alice->address);
$mosaicDefinitisonTransaction = new EmbeddedMosaicDefinitionTransactionV1(
  network: new NetworkType(NetworkType::TESTNET),
  signerPublicKey: $alice->publicKey,
  nonce: new MosaicNonce($mosaicId['nonce']),
  id: new MosaicId($mosaicId['id']),
  duration: new BlockDuration(0),
  divisibility: 2,
  flags: new MosaicFlags(MosaicFlags::TRANSFERABLE)
);
$mosaicSupplyChangeTransaction = new EmbeddedMosaicSupplyChangeTransactionV1(
  network: new NetworkType(NetworkType::TESTNET),
  signerPublicKey: $alice->publicKey,
  mosaicId: new UnresolvedMosaicId($mosaicId['id']),
  action: new MosaicSupplyChangeAction(MosaicSupplyChangeAction::INCREASE),
  delta: new Amount(10000)
);
$inner = [$mosaicDefinitisonTransaction, $mosaicSupplyChangeTransaction];
$merkleHash = SymbolFacade::hashEmbeddedTransactions($inner);

$aggTransaction = new AggregateCompleteTransactionV2(
  network: new NetworkType(NetworkType::TESTNET),
  signerPublicKey: $alice->publicKey,
  deadline: new Timestamp($facade->now()->addHours(2)->timestamp),
  transactions: $inner,
  transactionsHash: $merkleHash
);

$facade->setMaxFee($aggTransaction, 100);
$signature = $alice->signTransaction($aggTransaction);
$payload = $facade->attachSignature($aggTransaction, $signature);
try {
  $result = $apiInstance->announceTransaction($payload);
  print_r($result);
} catch (Exception $e) {
  echo 'Exception when calling TransactionRoutesApi->announceTransaction: ', $e->getMessage(), PHP_EOL;
}
```

その他 Transaction についてはまだドキュメントがありません。いずれ速習 Symbol for PHP を作成したいとは思っています。
