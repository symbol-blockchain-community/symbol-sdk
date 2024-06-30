<?php

namespace SymbolSdk\Symbol;

use SymbolSdk\BinaryData;
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
}