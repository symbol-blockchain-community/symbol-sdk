<?php

namespace SymbolSdk\Symbol;

use SymbolSdk\Impl\Ed25519;
use SymbolSdk\CryptoTypes\Signature;
use SymbolSdk\Utils\ArrayHelpers;
use SymbolSdk\Symbol\Models\PublicKey;
use Error;

/**
 * Verifies signatures signed by a single key pair.
 */
class Verifier
{
  const HASH_MODE = 'sha512';
  public $publicKey;

  /**
   * Creates a verifier from a public key.
   * @param PublicKey publicKey Public key.
   */
  public function __construct(PublicKey $publicKey)
  {
    if (0 == ArrayHelpers::deepCompare(str_repeat("\x00", 32), $publicKey->binaryData))
      throw new Error('public key cannot be zero');
    $this->publicKey = $publicKey;
  }

  /**
   * Verifies a message signature.
   * @param string message Message to verify.
   * @param Signature signature Signature to verify.
   * @return bool true if the message signature verifies.
   */
  public function verify(string $message, Signature $signature): bool
  {
    return Ed25519::verify($message, $signature->binaryData, $this->publicKey->binaryData, self::HASH_MODE);
  }
}
