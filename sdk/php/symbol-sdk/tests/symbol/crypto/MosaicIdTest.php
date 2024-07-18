<?php

namespace SymbolSdk\Symbol\Models;

use SymbolSdk\Symbol\IdGenerator;
use SymbolSdk\Symbol\Address;
use PHPUnit\Framework\TestCase;
use SymbolSdk\Utils\Converter;

class MosaicIdTest extends TestCase
{
  static function idTohex($id)
  {
    $mosaicId = new UnresolvedMosaicId($id['id']);
    $hex = substr($mosaicId->__toString(), 2);
    return $hex;
  }

  public function testGenerateMosaicId()
  {
    $jsonFilePath = dirname(__DIR__, 6) . '/tests/vectors/symbol/crypto/5.test-mosaic-id.json';
    $jsonData = file_get_contents($jsonFilePath);
    $decodedData = json_decode($jsonData, true);

    foreach ($decodedData as $item) {
      $this->assertEquals(
        self::idTohex(IdGenerator::generateMosaicId(new Address($item['address_Public']), $item['mosaicNonce'])),
        $item['mosaicId_Public']
      );
      $this->assertEquals(
        self::idTohex(IdGenerator::generateMosaicId(new Address($item['address_PublicTest']), $item['mosaicNonce'])),
        $item['mosaicId_PublicTest']
      );
      $this->assertEquals(
        self::idTohex(IdGenerator::generateMosaicId(new Address($item['address_Private']), $item['mosaicNonce'])),
        $item['mosaicId_Private']
      );
      $this->assertEquals(
        self::idTohex(IdGenerator::generateMosaicId(new Address($item['address_PrivateTest']), $item['mosaicNonce'])),
        $item['mosaicId_PrivateTest']
      );
    }
  }
}
