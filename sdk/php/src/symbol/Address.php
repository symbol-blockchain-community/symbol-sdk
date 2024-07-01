<?php

namespace SymbolSdk\Symbol;

use SymbolSdk\BinaryData;
use SymbolSdk\Symbol\Models\NamespaceId;
use SymbolSdk\Utils\Converter;

class Address extends BinaryData
{
  const SIZE = 24;

  const ENCODED_SIZE = 39;

  public function __construct($addressInput)
  {
    if (mb_check_encoding($addressInput, 'UTF-8')) {
      $addressInput = Converter::addressToBinary($addressInput);
    } else if ($addressInput instanceof Address) {
      $addressInput = $addressInput->binaryData;
    };
    parent::__construct(self::SIZE, $addressInput);
  }

  public function toNamespaceId(){
    if(!($this->binaryData[0] & "x\01"))
      return NULL;

    $idBinary = substr($this->binaryData, 1, 8);
    $ids = unpack('P', $idBinary)[1];
    return new NamespaceId($ids);
  } 

  public static function fromDecodedAddressHexString($hexString){
    return new self(hex2bin($hexString));
  }

  public static function fromNamespaceId(NamespaceId $namespaceId, int $networkIdentifier){
    return new self(Converter::intToBinary($networkIdentifier + 1, 1) . Converter::intToBinary($namespaceId->value, 8) . str_repeat("\x00", self::SIZE - 9));
  }
}