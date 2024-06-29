<?php

namespace SymbolSdk\Symbol\Models;

require_once __DIR__ . '/../../../src/symbol/models.php';

use PHPUnit\Framework\TestCase;
use SymbolSdk\Symbol\Network;

class AddressTest extends TestCase
{
  public function testAddress()
  {
    $jsonFilePath = dirname(__DIR__, 5) . '/tests/vectors/symbol/crypto/1.test-address.json';
    $jsonData = file_get_contents($jsonFilePath);
    $decodedData = json_decode($jsonData, true);

    foreach ($decodedData as $item) {
      $publicKey = new PublicKey($item['publicKey']);
      Network::initialize();
      $mainNetwork = Network::$MAINNET;
      $testNetwork = Network::$TESTNET;
      $mainAddress = $mainNetwork->publicKeyToAddress($publicKey->binaryData);
      $testAddress = $testNetwork->publicKeyToAddress($publicKey->binaryData);

      $this->assertEquals($mainAddress, $item['address_Public']);
      $this->assertEquals($testAddress, $item['address_PublicTest']);
    }
  }
}
