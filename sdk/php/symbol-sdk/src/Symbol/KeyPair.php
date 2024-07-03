<?php

namespace SymbolSdk\Symbol;

use SymbolSdk\CryptoTypes\PrivateKey;
use SymbolSdk\CryptoTypes\PublicKey;
use SymbolSdk\CryptoTypes\Signature;
use SymbolSdk\Impl\Ed25519;

/**
 * Represents an ED25519 private and public key.
 */
class KeyPair
{
  const HASH_MODE = 'sha512';
  private $_privateKey;
  private $_keyPair;

  /**
   * Creates a key pair from a private key.
   * @param PrivateKey privateKey Private key.
   */
  function __construct(PrivateKey $privateKey)
  {
    $this->_privateKey = $privateKey;
    $this->_keyPair = Ed25519::keyPairFromSeed($privateKey->binaryData, self::HASH_MODE);
  }

  /**
   * Signs a message with the private key.
   * @param string message Message to sign.
   * @return Signature Message signature.
   */
  public function sign(string $message): Signature
  {
    $signature = Ed25519::sign($message, $this->_keyPair, self::HASH_MODE);
    return new Signature($signature);
  }

  /**
   * Gets the private key.
   * @return PrivateKey Private key.
   */
  public function privateKey(): PrivateKey
  {
    return $this->_privateKey;
  }

  /**
   * Gets the public key.
   * @return PublicKey Public key.
   */
  public function publicKey(): PublicKey
  {
    return new PublicKey($this->_keyPair['publicKey']);
  }
}
