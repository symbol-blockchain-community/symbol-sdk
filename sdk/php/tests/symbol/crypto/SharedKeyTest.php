<?php

namespace SymbolSdk\Symbol\Models;

require_once __DIR__ . '/../../../src/symbol/models.php';

use PHPUnit\Framework\TestCase;
use SymbolSdk\CryptoTypes\PrivateKey;
use SymbolSdk\Symbol\KeyPair;
use SymbolSdk\Symbol\SharedKeySymbol;

class SharedKeyTest extends TestCase
{
  public function testSharedKey()
  {
    $jsonFilePath = dirname(__DIR__, 5) . '/tests/vectors/symbol/crypto/3.test-derive-hkdf.json';
    $jsonData = file_get_contents($jsonFilePath);
    $decodedData = json_decode($jsonData, true);

    // 時間かかるので100ランダム抽出
    $randomIndexes = array_rand($decodedData, 100);
    $randomData = array_intersect_key($decodedData, array_flip($randomIndexes));

    foreach ($randomData as $item) {
      $keyPair = new KeyPair(new PrivateKey($item['privateKey']));
      $otherPublicKey = new PublicKey($item['otherPublicKey']);
      $sharedKey = SharedKeySymbol::deriveSharedKey($keyPair, $otherPublicKey);
      $this->assertEquals(strtoupper(bin2hex($sharedKey->binaryData)), $item['sharedKey']);
    }
  }
}
