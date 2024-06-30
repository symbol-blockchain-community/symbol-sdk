<?php

namespace SymbolSdk\Symbol;

require_once __DIR__ . '/../../vendor/autoload.php';

use SymbolSdk\CryptoTypes\PrivateKey;
use SymbolSdk\CryptoTypes\PublicKey;
use SymbolSdk\CryptoTypes\Signature;
use SymbolSdk\Impl\Ed25519;

class KeyPair
{
  const HASH_MODE = 'sha512';
  private $_privateKey;
  private $_keyPair;

  function __construct(PrivateKey $privateKey)
  {
    $this->_privateKey = $privateKey;
    $this->_keyPair = Ed25519::keyPairFromSeed($privateKey->binaryData, self::HASH_MODE);
  }

  public function sign($message){
    $signature = Ed25519::sign($message, $this->_keyPair, self::HASH_MODE);
    return new Signature($signature);
  }

  public function privateKey()
  {
    return $this->_privateKey;
  }

  public function publicKey()
  {
    return new PublicKey($this->_keyPair['publicKey']);
  }
}
