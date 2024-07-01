<?php
namespace SymbolSdk\Symbol;

use SymbolSdk\CryptoTypes\PublicKey;
use SymbolSdk\CryptoTypes\PrivateKey;
use SymbolSdk\Impl\CipherHelpers;
use SymbolSdk\Symbol\KeyPair;
use SymbolSdk\Symbol\SharedKeySymbol;
use Exception;
use SymbolSdk\Utils\ArrayHelpers;

class MessageEncoder{
  private KeyPair $_keyPair;
  private $deriveSharedKey;
  private $DELEGATION_MARKER;

  public function __construct(KeyPair $keyPair)
  {
    $this->_keyPair = $keyPair;
    $this->deriveSharedKey = function ($keyPair, $recipientPublicKey) {
      return SharedKeySymbol::deriveSharedKey($keyPair, $recipientPublicKey);
    };
    $this->DELEGATION_MARKER = hex2bin('FE2A8061577301E2');
  }

  public function publicKey(){
    return $this->_keyPair->publicKey();
  }

  public function tryDecode(PublicKey $recipientPublicKey, string $encodedMessage) {
    if ($encodedMessage[0] === "\x01") {
      $result = CipherHelpers::decodeAesGcm($this->deriveSharedKey, $this->_keyPair, $recipientPublicKey, substr($encodedMessage, 1));
      if ($result) {
        return ['isDecoded' => true, 'message' => $result];
      } else {
        return ['isDecoded' => false, 'message' => $encodedMessage];
      }
    }

    if ($encodedMessage[0] === 0xFE && ArrayHelpers::deepCompare(self::$DELEGATION_MARKER, substr($encodedMessage, 0, 8)) === 0) {
      $ephemeralPublicKeyStart = strlen(self::$DELEGATION_MARKER);
      $ephemeralPublicKeyEnd = $ephemeralPublicKeyStart + PublicKey::$SIZE;
      $ephemeralPublicKey = new PublicKey(substr($encodedMessage, $ephemeralPublicKeyStart, $ephemeralPublicKeyEnd));

      $result = CipherHelpers::decodeAesGcm($this->deriveSharedKey, $this->_keyPair, $ephemeralPublicKey, substr($encodedMessage, $ephemeralPublicKeyEnd));
      if ($result) {
        return ['isDecoded' => true, 'message' => $result];
      } else {
        return ['isDecoded' => false, 'message' => $encodedMessage];
      }
    }

    return ['isDecoded' => false, 'message' => $encodedMessage];
}

  public function encode(PublicKey $recipientPublicKey, string $message){
    $encoded = CipherHelpers::encodeAesGcm($this->deriveSharedKey, $this->_keyPair, $recipientPublicKey, $message);
    return "\x01" . $encoded['tag'] . $encoded['initializationVector'] . $encoded['cipherText'];
  }

  public function encodePersistentHarvestingDelegation(PublicKey $nodePublicKey, KeyPair $remoteKeyPair, KeyPair $vrfKeyPair) {
		$ephemeralKeyPair = new KeyPair(PrivateKey::random());
		$message = $remoteKeyPair->privateKey()->binaryData . $vrfKeyPair->privateKey()->binaryData;
    $encoded = CipherHelpers::encodeAesGcm($this->deriveSharedKey, $ephemeralKeyPair, $nodePublicKey, $message);
    return self::$DELEGATION_MARKER . $ephemeralKeyPair->publicKey()->binaryData . $encoded['tag'] . $encoded['initializationVector'] . $encoded['cipherText'];
	}
}