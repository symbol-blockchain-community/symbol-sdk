<?php

namespace SymbolSdk\CryptoTypes;

use SymbolSdk\BinaryData;

/**
 * Represents a 256-bit hash.
 */
class Hash256 extends BinaryData
{
  static $SIZE = 32;

  static $NAME = 'Hash256';

  /**
   * Creates a hash from bytes or a hex string.
   * @param string hash256 Input string or byte array.
   */
  public function __construct(string $hash256)
  {
    parent::__construct(self::$SIZE, $hash256);
  }

  /**
   * Creates a zeroed hash.
   * @return Hash256 Zeroed hash.
   */
  public static function zero(): Hash256
  {
    return new self(str_repeat("\x00", self::$SIZE));
  }
}
