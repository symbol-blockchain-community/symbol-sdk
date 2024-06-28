<?php
namespace SymbolSdk\CryptoTypes;

use SymbolSdk\BinaryData;

class PublicKey extends BinaryData
{
  static $SIZE = 32;

  public function __construct($publicKey)
  {
    parent::__construct(self::$SIZE, $publicKey);
  }
}