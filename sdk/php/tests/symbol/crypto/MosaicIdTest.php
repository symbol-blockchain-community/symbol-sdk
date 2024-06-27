<?php

namespace SymbolSdk\Symbol\Models;

require_once __DIR__ . '/../../../src/symbol/models.php';
require_once __DIR__ . '/../../../src/symbol/idGenerator.php';

use SymbolSdk\Symbol;
use function SymbolSdk\Symbol\generateMosaicId;
use SymbolSdk\Symbol\Models\Address;
use PHPUnit\Framework\TestCase;

class MosaicIdTest extends TestCase
{
  static function idTohex($id)
  {
    $mosaicId = new UnresolvedMosaicId($id);
    $hex = strtoupper(gmp_strval(gmp_init($mosaicId->value, 10), 16));
    $paddedHex = str_pad($hex, 16, '0', STR_PAD_LEFT);
    return $paddedHex;
  }

  public function testGenerateMosaicId()
  {
    $jsonFilePath = dirname(__DIR__, 5) . '/tests/vectors/symbol/crypto/5.test-mosaic-id.json';
    $jsonData = file_get_contents($jsonFilePath);
    $decodedData = json_decode($jsonData, true);

    foreach ($decodedData as $item) {
      $this->assertEquals(
        self::idTohex(generateMosaicId(new Address($item['address_Public']), $item['mosaicNonce'])),
        $item['mosaicId_Public']
      );
      $this->assertEquals(
        self::idTohex(generateMosaicId(new Address($item['address_PublicTest']), $item['mosaicNonce'])),
        $item['mosaicId_PublicTest']
      );
      $this->assertEquals(
        self::idTohex(generateMosaicId(new Address($item['address_Private']), $item['mosaicNonce'])),
        $item['mosaicId_Private']
      );
      $this->assertEquals(
        self::idTohex(generateMosaicId(new Address($item['address_PrivateTest']), $item['mosaicNonce'])),
        $item['mosaicId_PrivateTest']
      );
    }
  }
}
