<?php

namespace SymbolSdk\CryptoTypes;

use SymbolSdk\BinaryData;

/**
 * Represents a 256-bit symmetric encryption key.
 */
class SharedKey256 extends BinaryData
{
  static $SIZE = 32;

  static $NAME = 'SharedKey256';

  /**
   * Creates a shared key from bytes or a hex string.
   * @param string sharedKey Input string or byte array.
   */
  public function __construct(string $sharedKey)
  {
    parent::__construct(self::$SIZE, $sharedKey);
  }
}
