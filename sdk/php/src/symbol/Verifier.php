<?php

namespace SymbolSdk\Symbol;

require_once __DIR__ . '/../../vendor/autoload.php';

use SymbolSdk\Impl\Ed25519;
use Error;
use SymbolSdk\Utils\ArrayHelpers;

class Verifier {
  const HASH_MODE = 'sha512';
  public $publicKey;

  public function __construct($publicKey)
  {
    if (0 == ArrayHelpers::deepCompare(str_repeat("\x00", 32), $publicKey->binaryData))
      throw new Error('public key cannot be zero');
    $this->publicKey = $publicKey;
  }

  public function verify($message, $signature){
    return Ed25519::verify($message, $signature->binaryData, $this->publicKey->binaryData, self::HASH_MODE);
  }
}