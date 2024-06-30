<?php
namespace SymbolSdk\Impl;

use SymbolSdk\Cipher\AesGcmCipher;

class CipherHelpers{
  const GCM_IV_SIZE = 12;
  const CBC_IV_SIZE = 16;
  const SALT_SIZE = 32;

  private static function decode ($tagSize, $ivSize, $encodedMessage){
    return [
      'tag' => substr($encodedMessage, 0, $tagSize),
      'initializationVector' => substr($encodedMessage, $tagSize, $ivSize),
      'encodedMessageData' => substr($encodedMessage, $tagSize + $ivSize)
    ];
  }

  public static function encodeAesGcm(callable $deriveSharedKey, $keyPair, $recipientPublicKey, $message, $iv = NULL){
    $sharedKey = call_user_func($deriveSharedKey, $keyPair, $recipientPublicKey);
    $cipher = new AesGcmCipher($sharedKey);
    $initializationVector = $iv ?? openssl_random_pseudo_bytes(self::GCM_IV_SIZE);
    $cipherText = $cipher->encrypt($message, $initializationVector);
    $tag = substr($cipherText, -AesGcmCipher::TAG_SIZE);    
    return [
      'tag' => $tag,
      'initializationVector' => $initializationVector,
      'cipherText' => substr($cipherText, 0, -AesGcmCipher::TAG_SIZE)
    ];
  }

  public static function decodeAesGcm($deriveSharedKey, $keyPair, $recipientPublicKey, $encodedMessage){
    $decoded = self::decode(AesGcmCipher::TAG_SIZE, self::GCM_IV_SIZE, $encodedMessage);
    $sharedKey = call_user_func($deriveSharedKey, $keyPair, $recipientPublicKey);
    $cipher = new AesGcmCipher($sharedKey);
    return $cipher->decrypt($decoded['encodedMessageData'] . $decoded['tag'], $decoded['initializationVector']);
  }
}