<?php

namespace SymbolSdk\Symbol;

use SymbolSdk\CryptoTypes\PublicKey;
use SymbolSdk\CryptoTypes\PrivateKey;
use SymbolSdk\Impl\CipherHelpers;
use SymbolSdk\Symbol\KeyPair;
use SymbolSdk\Symbol\SharedKeySymbol;
use SymbolSdk\Utils\ArrayHelpers;
use SymbolSdk\Utils\Converter;

/**
 * Encrypts and encodes messages between two parties.
 */
class MessageEncoder
{
  private KeyPair $_keyPair;
  private $deriveSharedKey;
  private $DELEGATION_MARKER;

  /**
   * Creates message encoder around key pair.
   * @param KeyPair keyPair Key pair.
   */
  public function __construct(KeyPair $keyPair)
  {
    $this->_keyPair = $keyPair;
    $this->deriveSharedKey = function ($keyPair, $recipientPublicKey) {
      return SharedKeySymbol::deriveSharedKey($keyPair, $recipientPublicKey);
    };
    $this->DELEGATION_MARKER = hex2bin('FE2A8061577301E2');
  }

  /**
   * Public key used for message encoding.
   * @return PublicKey Public key used for message encoding.
   */
  public function publicKey(): PublicKey
  {
    return $this->_keyPair->publicKey();
  }

  /**
   * Tries to decode encoded message.
   * @param PublicKey recipientPublicKey Recipient's public key.
   * @param string encodedMessage Encoded message.
   * @return array Tuple containing decoded status and message.
   */
  public function tryDecode(PublicKey $recipientPublicKey, string $encodedMessage): array
  {
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

  /**
   * Encodes message to recipient using recommended format.
   * @param PublicKey recipientPublicKey Recipient public key.
   * @param string message Message to encode.
   * @return string Encrypted and encoded message.
   */
  public function encode(PublicKey $recipientPublicKey, string $message): string
  {
    $encoded = CipherHelpers::encodeAesGcm($this->deriveSharedKey, $this->_keyPair, $recipientPublicKey, $message);
    return "\x01" . $encoded['tag'] . $encoded['initializationVector'] . $encoded['cipherText'];
  }

  /**
   * Encodes persistent harvesting delegation to node.
   * @param PublicKey nodePublicKey Node public key.
   * @param KeyPair remoteKeyPair Remote key pair.
   * @param KeyPair vrfKeyPair Vrf key pair.
   * @return string Encrypted and encoded harvesting delegation request.
   */
  public function encodePersistentHarvestingDelegation(PublicKey $nodePublicKey, KeyPair $remoteKeyPair, KeyPair $vrfKeyPair): string
  {
    $ephemeralKeyPair = new KeyPair(PrivateKey::random());
    $message = $remoteKeyPair->privateKey()->binaryData . $vrfKeyPair->privateKey()->binaryData;
    $encoded = CipherHelpers::encodeAesGcm($this->deriveSharedKey, $ephemeralKeyPair, $nodePublicKey, $message);
    return self::$DELEGATION_MARKER . $ephemeralKeyPair->publicKey()->binaryData . $encoded['tag'] . $encoded['initializationVector'] . $encoded['cipherText'];
  }

  /**
   * Tries to decode encoded message.
   * @deprecated This function is only provided for compatability with the original Symbol wallets.
   *             Please use `tryDecode` in any new code.
   * @param PublicKey recipientPublicKey Recipient's public key.
   * @param string encodedMessage Encoded message
   * @return array Tuple containing decoded status and message.
   */
  public function tryDecodeDeprecated(PublicKey $recipientPublicKey, string $encodedMessage)
  {
    $encodedHexString = bin2hex(substr($encodedMessage, 1));
    if ("\x01" === $encodedMessage[0] && Converter::isHexString($encodedHexString)) {
      var_dump($encodedHexString);
      // wallet additionally hex encodes
      return $this->tryDecode($recipientPublicKey, "\x01" . hex2bin(hex2bin($encodedHexString)));
    }
    return $this->tryDecode($recipientPublicKey, $encodedMessage);
  }

  /**
   * Encodes message to recipient using (deprecated) wallet format.
   * @deprecated This function is only provided for compatability with the original Symbol wallets.
   *             Please use `encode` in any new code.
   * @param PublicKey recipientPublicKey Recipient public key.
   * @param string message Message to encode.
   * @return string Encrypted and encoded message.
   */
  public function encodeDeprecated($recipientPublicKey, $message)
  {
    // wallet additionally hex encodes
    $encodedHexString = bin2hex(substr($this->encode($recipientPublicKey, $message), 1));
    $encodedHexStringBinary = hex2bin(bin2hex($encodedHexString));
    return "\x01" . $encodedHexStringBinary;
  }
}
