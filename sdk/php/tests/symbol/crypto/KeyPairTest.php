<?php

require_once __DIR__ . '/../../../src/CryptoTypes/PrivateKey.php';
require_once __DIR__ . '/../../../src/symbol/KeyPair.php';

use PHPUnit\Framework\TestCase;
use SymbolSdk\CryptoTypes\PrivateKey;
use SymbolSdk\Symbol\KeyPair;

class KeyPairTest extends TestCase
{
  public function testKeyPair()
  {
    $jsonFilePath = dirname(__DIR__, 5) . '/tests/vectors/symbol/crypto/1.test-keys.json';
    $jsonData = file_get_contents($jsonFilePath);
    $decodedData = json_decode($jsonData, true);

    $randomIndexes = array_rand($decodedData, 100);
    $randomData = array_intersect_key($decodedData, array_flip($randomIndexes));

    foreach ($randomData as $item) {
      $privateKey = new PrivateKey($item['privateKey']);
      $keyPair = new KeyPair($privateKey);
      $publicKey = bin2hex($keyPair->publicKey()->binaryData);
      $this->assertEquals(strtoupper($publicKey), $item['publicKey']);
    }
  }
}
