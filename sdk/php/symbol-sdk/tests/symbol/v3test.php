<?php
namespace SymbolSdk\Symbol;
use SymbolSdk\Facade\SymbolFacade;
use SymbolSdk\CryptoTypes\PrivateKey;
use SymbolSdk\Symbol\Models\EmbeddedTransferTransactionV1;
use SymbolSdk\Symbol\Models\AggregateCompleteTransactionV3;
use SymbolSdk\Symbol\Models\UnresolvedMosaic;
use SymbolSdk\Symbol\Models\UnresolvedMosaicId;
use SymbolSdk\Symbol\Models\Amount;
use SymbolSdk\Symbol\Models\NetworkType;
use SymbolSdk\Symbol\Models\Timestamp;
require __DIR__ . '/../../vendor/autoload.php';

function main() {
    $facade = new SymbolFacade('testnet');
    $account = $facade->createAccount(new PrivateKey('5dab087e624a8a4b79e17f8b83800ee66f3bb1292618b6fd1c2f8b27ff88e0eb'));
    $transferTransaction = new EmbeddedTransferTransactionV1(
      network: new NetworkType(NetworkType::TESTNET),
      signerPublicKey: $account->publicKey,
      recipientAddress: $account->address,
      mosaics: [
        new UnresolvedMosaic(
          mosaicId: new UnresolvedMosaicId('0x72C0212E67A08BCE'),
          amount: new Amount(1)
        )
      ],
      message: "hello, symbol!"
    );
    $aggregateTransaction = new AggregateCompleteTransactionV3(
      network: new NetworkType(NetworkType::TESTNET),
      signerPublicKey: $account->publicKey,
      deadline: new Timestamp($facade->now()->addHours(2)),
    );
    array_push($aggregateTransaction->transactions, $transferTransaction);
    $signature = $account->signTransaction($aggregateTransaction);
    $facade->attachSignature($aggregateTransaction, $signature);

    $hashTransaction = $facade->hashTransaction($aggregateTransaction);

    $hasher = hash_init('sha3-256');
		hash_update($hasher, $aggregateTransaction->signature->binaryData);
		hash_update($hasher, $aggregateTransaction->signerPublicKey->binaryData);
		hash_update($hasher, $facade->network->generationHashSeed->binaryData);
		$serializedTransaction = $aggregateTransaction->serialize();
    $d = substr($serializedTransaction, 108, 56);
    hash_update($hasher, $d);
		$digest = hash_final($hasher, true);

    echo bin2hex($hashTransaction->binaryData) . PHP_EOL;
    echo bin2hex($digest) . PHP_EOL;
}

main();
