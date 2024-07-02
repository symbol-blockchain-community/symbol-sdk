<?php

namespace SymbolSdk\CryptoTypes;

use SymbolSdk\BinaryData;

/**
 * Represents a private key.
 */
class PrivateKey extends BinaryData
{
  static $SIZE = 32;

  /**
   * Creates a private key from bytes or a hex string.
   * @param string privateKey Input string or byte array.
   */
  public function __construct(string $privateKey)
  {
    parent::__construct(self::$SIZE, $privateKey);
  }

  /**
   * Creates a random private key.
   * @return PrivateKey Random private key.
   */
  public static function random(): PrivateKey
  {
    return new self(openssl_random_pseudo_bytes(32));
  }
}
