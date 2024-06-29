<?php

namespace SymbolSdk\CryptoTypes;

use SymbolSdk\BinaryData;

class SharedKey256 extends BinaryData
{
  static $SIZE = 32;

  static $NAME = 'SharedKey256';

  public function __construct($sharedKey)
  {
    parent::__construct(self::$SIZE, $sharedKey);
  }
}
