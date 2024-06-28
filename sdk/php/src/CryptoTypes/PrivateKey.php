<?php

namespace SymbolSdk\CryptoTypes;

use SymbolSdk\BinaryData;

class PrivateKey extends BinaryData
{
  static $SIZE = 32;

  public function __construct($privateKey)
  {
    parent::__construct(self::$SIZE, $privateKey);
  }
}