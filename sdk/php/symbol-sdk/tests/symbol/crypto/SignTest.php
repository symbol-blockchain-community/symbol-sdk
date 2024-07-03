<?php

require_once __DIR__ . '/../../../src/CryptoTypes/PrivateKey.php';
require_once __DIR__ . '/../../../src/symbol/KeyPair.php';

use PHPUnit\Framework\TestCase;
use SymbolSdk\CryptoTypes\PrivateKey;
use SymbolSdk\Symbol\KeyPair;

class SignTest extends TestCase
{
  public function testSign()
  {
    $jsonFilePath = dirname(__DIR__, 5) . '/tests/vectors/symbol/crypto/2.test-sign.json';
    $jsonData = file_get_contents($jsonFilePath);
    $decodedData = json_decode($jsonData, true);

    $randomIndexes = array_rand($decodedData, 100);
    $randomData = array_intersect_key($decodedData, array_flip($randomIndexes));

    foreach ($randomData as $item) {
      $privateKey = new PrivateKey($item['privateKey']);
      $keyPair = new KeyPair($privateKey);
      $data = hex2bin($item['data']);
      $signed = $keyPair->sign($data);
      $this->assertEquals(strtoupper(bin2hex($keyPair->publicKey()->binaryData)), $item['publicKey']);
      $this->assertEquals(strtoupper(bin2hex($signed->binaryData)), $item['signature']);
    }
  }
}
