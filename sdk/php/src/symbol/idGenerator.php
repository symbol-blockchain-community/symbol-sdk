<?php

namespace SymbolSdk\Symbol;

use Exception;

class IdGenerator {
  private const NAMESPACE_FLAG = 0x8000000000000000;

  public static function generateMosaicId($ownerAddress, $nonce) {
    $hasher = hash_init('sha3-256');
    hash_update($hasher, self::uint32ToBytes($nonce));
    hash_update($hasher, $ownerAddress->binaryData);
    $digest = hash_final($hasher, true);
    $result = self::digestToGmp($digest);
    
    $gmpMax = gmp_init('9223372036854775807');
    
    if (gmp_testbit($result, 63)) {
        $result = gmp_sub($result, gmp_add($gmpMax, 1));
    }
    
    return gmp_strval($result);
  }

  public static function generateNamespaceId($name, $parentNamespaceId = 0) {
    $hasher = hash_init('sha3-256');
    hash_update($hasher, self::uint32ToBytes($parentNamespaceId & 0xFFFFFFFF));
    hash_update($hasher, self::uint32ToBytes(($parentNamespaceId >> 32) & 0xFFFFFFFF));
    hash_update($hasher, $name);
    $digest = hash_final($hasher, true);
    $result = self::digestToGmp($digest);
    
    return gmp_strval(gmp_or($result, NAMESPACE_FLAG));
  }

  public static function isValidNamespaceName($name) {
    $isAlphanum = function($char) {
        return ctype_alnum($char);
    };

    if (!$name || !$isAlphanum($name[0])) {
        return false;
    }

    for ($i = 0; $i < strlen($name); ++$i) {
        $ch = $name[$i];
        if (!$isAlphanum($ch) && $ch !== '_' && $ch !== '-') {
            return false;
        }
    }

    return true;
  }

  public static function generateNamespacePath($fullyQualifiedName) {
    $path = [];
    $parentNamespaceId = 0;
    
    foreach (explode('.', $fullyQualifiedName) as $name) {
      if (!self::isValidNamespaceName($name)) {
          throw new Exception("fully qualified name is invalid due to invalid part name ({$fullyQualifiedName})");
      }
      
      $path[] = self::generateNamespaceId($name, $parentNamespaceId);
      $parentNamespaceId = end($path);
    }
    
    return $path;
  }

  public static function generateMosaicAliasId($fullyQualifiedName) {
    $path = self::generateNamespacePath($fullyQualifiedName);
    return end($path);
  }

  private static function uint32ToBytes($num) {
    return pack('V', $num);
  }

  private static function digestToGmp($digest) {
    $result = gmp_init(0);
    for ($i = 0; $i < 8; ++$i) {
        $shifted = gmp_mul(ord($digest[$i]), gmp_pow(2, 8 * $i));
        $result = gmp_add($result, $shifted);
    }
    return $result;
  }
}
