<?php

namespace SymbolSdk;

use SymbolSdk\Impl\External\TweetNaclFastSymbol;
use SymbolSdk\CryptoTypes\SharedKey256;
use SymbolSdk\Utils\Converter;

use Error;

class SharedKey {
  private static function isCanonicalKey($intArray){
    // 0 != a if bits 8 through 254 of data are all set
    $a = ($intArray[31] & 0x7F) ^ 0x7F;
    for ($i = 30; $i > 0; --$i) {
        $a |= $intArray[$i] ^ 0xFF;
    }

    $a = ($a - 1) >> 8;

    // 0 != b if data[0] < 256 - 19
    $b = (0xED - 1 - $intArray[0]) >> 8;
    return 0 != 1 - ($a & $b & 1);
  }

  private static function isInMainSubgroup($point) {
    $result = [TweetNaclFastSymbol::gf(), TweetNaclFastSymbol::gf(), TweetNaclFastSymbol::gf(), TweetNaclFastSymbol::gf()];
    // multiply by group order
    TweetNaclFastSymbol::scalarmult($result, $point, TweetNaclFastSymbol::$L);

    // check if result is neutral element
    $gf0 = TweetNaclFastSymbol::gf();
    $areEqual = TweetNaclFastSymbol::neq25519($result[1], $result[2]);
    $isZero = TweetNaclFastSymbol::neq25519($gf0, $result[0]);

	  // yes, this is supposed to be  bit OR
    return 0 === ($areEqual | $isZero);
  }

  public static function deriveSharedSecretFactory($hasher) {
    return function($privateKeyIntArray, $otherPublicKeyIntArray) use ($hasher) {
      $point = [TweetNaclFastSymbol::gf(), TweetNaclFastSymbol::gf(), TweetNaclFastSymbol::gf(), TweetNaclFastSymbol::gf()];
      if (!self::isCanonicalKey($otherPublicKeyIntArray) || 0 !== TweetNaclFastSymbol::unpackneg($point, $otherPublicKeyIntArray) || !self::isInMainSubgroup($point)) {
        throw new Error('invalid point');
      }

      // negate point == negate X coordinate and 't'
      TweetNaclFastSymbol::Z($point[0], TweetNaclFastSymbol::gf(), $point[0]);
      TweetNaclFastSymbol::Z($point[3], TweetNaclFastSymbol::gf(), $point[3]);

      $scalar = array_fill(0, 64, 0);

      TweetNaclFastSymbol::crypto_hash($scalar, $privateKeyIntArray, 32, $hasher);
      $scalar[0] &= 248;
      $scalar[31] &= 127;
      $scalar[31] |= 64;

      $result = [TweetNaclFastSymbol::gf(), TweetNaclFastSymbol::gf(), TweetNaclFastSymbol::gf(), TweetNaclFastSymbol::gf()];
      TweetNaclFastSymbol::scalarmult($result, $point, $scalar);
      $sharedSecret = array_fill(0, 32, 0);
      TweetNaclFastSymbol::pack($sharedSecret, $result);

      return Converter::arrayToBinary($sharedSecret);
    };
  }

  public static function deriveSharedKeyFactory($info, $hasher) {
    $deriveSharedSecret = self::deriveSharedSecretFactory($hasher);
    
    return function($privateKeyBinary, $otherPublicKeyBinary) use ($deriveSharedSecret, $info) {
      $privateKeyIntArray = Converter::binaryToArray($privateKeyBinary);
      $otherPublicKeyIntArray = Converter::binaryToArray($otherPublicKeyBinary);
      $sharedSecret = $deriveSharedSecret($privateKeyIntArray, $otherPublicKeyIntArray);
      $sharedKeyBinary = hash_hkdf('sha256', $sharedSecret, 32, $info);
      return new SharedKey256($sharedKeyBinary);
    };
  }
}