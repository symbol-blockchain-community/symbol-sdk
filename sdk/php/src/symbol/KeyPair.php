<?php

namespace SymbolSdk\Symbol;

require_once __DIR__ . '/../Impl/External/TweetNaclFastSymbol.php';

use Error;
use SymbolSdk\CryptoTypes\PrivateKey;
use SymbolSdk\CryptoTypes\PublicKey;
use SymbolSdk\CryptoTypes\Signature;
use SymbolSdk\Impl\External\TweetNaclFastSymbol;

class KeyPair
{
  const HASH_MODE = 'sha512';
  private $_privateKey;
  private $_keyPair;

  function __construct(PrivateKey $privateKey)
  {
    $this->_privateKey = $privateKey;
    TweetNaclFastSymbol::init();
    $this->_keyPair = TweetNaclFastSymbol::nacl_sign_keyPair_fromSeed($privateKey->binaryData, self::HASH_MODE);
  }

  public function sign($message){
    $signature = TweetNaclFastSymbol::nacl_sign_detached($message, $this->_keyPair['secretKey'], self::HASH_MODE);
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

  public static function generateKeyPair(): self
  {
    return new self(new PrivateKey(random_bytes(32)));
  }
}
