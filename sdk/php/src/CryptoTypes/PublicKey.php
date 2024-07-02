<?php

namespace SymbolSdk\CryptoTypes;

use SymbolSdk\BinaryData;

/**
 * Represents a public key.
 */
class PublicKey extends BinaryData
{
  static $SIZE = 32;

  /**
   * Creates a public key from bytes or a hex string.
   * @param string|PublicKey publicKey Input string, byte array or public key.
   */
  public function __construct(string|PublicKey $publicKey)
  {
    parent::__construct(self::$SIZE, $publicKey instanceof PublicKey ? $publicKey->binaryData : $publicKey);
  }
}
