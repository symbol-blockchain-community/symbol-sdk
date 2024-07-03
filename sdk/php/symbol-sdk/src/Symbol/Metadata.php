<?php
namespace SymbolSdk\Symbol;

class Metadata {
  /**
   * Generate metadata generate key from seed.
   * @param string $seed Seed value.
   * @return string Metadata generate key.
   */
  static function metadataGenerateKey(string $str): string {
    $bytes = mb_convert_encoding($str, 'UTF-8');
    $sha3Hash = hash('sha3-256', $bytes, true);

    // Get the first 8 bytes and set the high bit
    $keyBytes = substr($sha3Hash, 0, 8);
    $keyBytes[7] = chr(ord($keyBytes[7]) | 0x80);

    // Convert to unsigned 64-bit integer (ulong in C#)
    $ulongKey = unpack('P', $keyBytes)[1];
    return $ulongKey;
  }

  /**
   * Creates a metadata payload for updating old value to new value.
   * @param string|null $oldValue Old metadata value as a string.
   * @param string $newValue New metadata value as a string.
   * @return string Metadata payload as a binary string.
   */
  static function metadataUpdateValue($oldValue, $newValue, $isBinary = false) {
    if (!$isBinary) {
      $oldValue = mb_convert_encoding($oldValue, 'UTF-8');
      $newValue = mb_convert_encoding($newValue, 'UTF-8');
    }

    if (empty($oldValue)) {
        return $newValue;
    }

    $shorterLength = min(strlen($oldValue), strlen($newValue));
    $longerLength = max(strlen($oldValue), strlen($newValue));
    $isNewValueShorter = strlen($oldValue) > strlen($newValue);

    $result = '';

    for ($i = 0; $i < $shorterLength; ++$i) {
        $result .= chr(ord($oldValue[$i]) ^ ord($newValue[$i]));
    }

    for (; $i < $longerLength; ++$i) {
        $result .= ($isNewValueShorter ? $oldValue[$i] : $newValue[$i]);
    }

    return $result;
  }
}