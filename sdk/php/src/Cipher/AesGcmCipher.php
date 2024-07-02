<?php

namespace SymbolSdk\Cipher;

use SymbolSdk\CryptoTypes\SharedKey256;

/**
 * Performs AES GCM encryption and decryption with a given key.
 */
class AesGcmCipher
{
  const TAG_SIZE = 16;

  private SharedKey256 $_key;

  /**
   * Creates a cipher around an aes shared key.
   * @param SharedKey256 aesKey AES shared key.
   */
  public function __construct(SharedKey256 $key)
  {
    $this->_key = $key;
  }

  /**
   * Encrypts clear text and appends tag to encrypted payload.
   * @param string clearText Clear text to encrypt.
   * @param string iv IV bytes.
   * @return string Cipher text with appended tag.
   */
  public function encrypt(string $clearText, string $iv): string
  {
    $tag = '';
    $ciphertext = openssl_encrypt($clearText, 'aes-256-gcm', $this->_key->binaryData, OPENSSL_RAW_DATA, $iv, $tag);
    return $ciphertext . $tag;
  }

  /**
   * Decrypts cipher text with appended tag.
   * @param string cipherText Cipher text with appended tag to decrypt.
   * @param string iv IV bytes.
   * @return string Clear text.
   */
  public function decrypt(string $cipherText, string $iv): string
  {
    $ciphertext = substr($cipherText, 0, -self::TAG_SIZE);
    $tag = substr($cipherText, -self::TAG_SIZE);
    return openssl_decrypt($ciphertext, 'aes-256-gcm', $this->_key->binaryData, OPENSSL_RAW_DATA, $iv, $tag);
  }
}
