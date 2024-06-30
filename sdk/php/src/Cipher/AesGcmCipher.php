<?php
namespace SymbolSdk\Cipher;

use SymbolSdk\CryptoTypes\SharedKey256;

class AesGcmCipher{
  const TAG_SIZE = 16;

  private SharedKey256 $_key;

  public function __construct(SharedKey256 $key)
  {
    $this->_key = $key;
  }

  public function encrypt($clearText, $iv){
    $tag = '';
    $ciphertext = openssl_encrypt($clearText, 'aes-256-gcm', $this->_key->binaryData, OPENSSL_RAW_DATA, $iv, $tag);
    return $ciphertext . $tag;
  }

  public function decrypt($cipherText, $iv) {
    $ciphertext = substr($cipherText, 0, -self::TAG_SIZE);
    $tag = substr($cipherText, -self::TAG_SIZE);
    return openssl_decrypt($ciphertext, 'aes-256-gcm', $this->_key->binaryData, OPENSSL_RAW_DATA, $iv, $tag);
  }
}