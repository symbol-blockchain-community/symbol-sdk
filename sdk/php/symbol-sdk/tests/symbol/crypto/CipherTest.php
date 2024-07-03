<?php

namespace SymbolSdk\Symbol\Models;

require_once __DIR__ . '/../../../src/symbol/models.php';

use PHPUnit\Framework\TestCase;
use SymbolSdk\CryptoTypes\PrivateKey;
use SymbolSdk\CryptoTypes\PublicKey;
use SymbolSdk\Symbol\KeyPair;
use SymbolSdk\Symbol\SharedKeySymbol;
use SymbolSdk\Impl\CipherHelpers;

class CipherTest extends TestCase
{
  public function testCipher()
  {
    $jsonFilePath = dirname(__DIR__, 5) . '/tests/vectors/symbol/crypto/4.test-cipher.json';
    $jsonData = file_get_contents($jsonFilePath);
    $decodedData = json_decode($jsonData, true);

    $randomIndexes = array_rand($decodedData, 100);
    $randomData = array_intersect_key($decodedData, array_flip($randomIndexes));

    foreach ($randomData as $item) {
      $keyPair = new KeyPair(new PrivateKey($item['privateKey']));
      $recipientPublicKey = new PublicKey($item['otherPublicKey']);
      $clearText = hex2bin($item['clearText']);
      $iv = hex2bin($item['iv']);
      $deriveSharedKey = function ($keyPair, $recipientPublicKey) {
        return SharedKeySymbol::deriveSharedKey($keyPair, $recipientPublicKey);
      };
      $result = CipherHelpers::encodeAesGcm($deriveSharedKey, $keyPair, $recipientPublicKey, $clearText, $iv);

      $tag = $item['tag'];
      $cipherText = $item['cipherText'];

      $this->assertEquals(strtoupper(bin2hex($result['tag'])), $tag);
      $this->assertEquals(strtoupper(bin2hex($result['cipherText'])), $cipherText);
    }
  }
}
