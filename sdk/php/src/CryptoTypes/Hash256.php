<?php

namespace SymbolSdk\CryptoTypes;

use SymbolSdk\BinaryData;

class Hash256 extends BinaryData
{
  static $SIZE = 32;

  static $NAME = 'Hash256';

  public function __construct($hash256)
  {
    parent::__construct(self::$SIZE, $hash256);
  }

  public static function zero()
  {
    return new self(str_repeat("\x00", self::$SIZE));
  }
}
