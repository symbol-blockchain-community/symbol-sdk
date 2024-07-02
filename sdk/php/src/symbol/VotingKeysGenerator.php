<?php

namespace SymbolSdk\Symbol;

use SymbolSdk\CryptoTypes\PrivateKey;
use SymbolSdk\Symbol\KeyPair;

/**
 * Generates symbol voting keys.
 */
class VotingKeysGenerator
{
  private KeyPair $_rootKeyPair;
  private $_privateKeyGenerator;

  /**
   * Creates a generator around a voting root key pair.
   * @param KeyPair rootKeyPair Voting root key pair.
   * @param callable privateKeyGenerator Private key generator.
   */
  public function __construct(KeyPair $rootKeyPair, callable $privateKeyGenerator = null)
  {
    $this->_rootKeyPair = $rootKeyPair;
    $this->_privateKeyGenerator = $privateKeyGenerator ?? [$this, 'defaultPrivateKeyGenerator'];
  }

  private function defaultPrivateKeyGenerator()
  {
    return PrivateKey::random();
  }

  /**
   * Generates voting keys for specified epochs.
   * @param int startEpoch Start epoch.
   * @param int endEpoch End epoch.
   * @return string Serialized voting keys.
   */
  public function generate(int $startEpoch, int $endEpoch)
  {
    $numEpochs = $endEpoch - $startEpoch + 1;
    $buffer = '';
    $buffer .= pack('P', $startEpoch); // start key identifier
    $buffer .= pack('P', $endEpoch); // end key identifier
    $buffer .= pack('P', 0xFFFFFFFFFFFFFFFF); // reserved - last (used) key identifier
    $buffer .= pack('P', 0xFFFFFFFFFFFFFFFF); // reserved - last wiped key identifier
    $buffer .= $this->_rootKeyPair->publicKey()->binaryData; // root voting public key
    $buffer .= pack('P', $startEpoch); // level 1/1 start key identifier
    $buffer .= pack('P', $endEpoch); // level 1/1 end key identifier

    for ($i = 0; $i < $numEpochs; ++$i) {
      $identifier = $endEpoch - $i;
      $childPrivateKey = call_user_func($this->_privateKeyGenerator);
      $childKeyPair = new KeyPair($childPrivateKey);

      $parentSignedPayloadBuffer = '';
      $parentSignedPayloadBuffer .= $childKeyPair->publicKey()->binaryData;
      $parentSignedPayloadBuffer .= pack('P', $identifier);

      $signature = $this->_rootKeyPair->sign($parentSignedPayloadBuffer);

      $buffer .= $childKeyPair->privateKey()->binaryData;
      $buffer .= $signature->binaryData;
    }

    return $buffer;
  }
}
