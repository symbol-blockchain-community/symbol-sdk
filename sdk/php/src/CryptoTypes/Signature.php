<?php

namespace SymbolSdk\CryptoTypes;

use SymbolSdk\BinaryData;

class Signature extends BinaryData
{
  static $SIZE = 64;

  public function __construct($signature)
  {
    parent::__construct(self::$SIZE, $signature);
  }
}