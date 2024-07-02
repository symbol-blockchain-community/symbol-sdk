<?php

namespace SymbolSdk\Symbol;

use Exception;
use SymbolSdk\Symbol\Models;

class IdGenerator
{
  private const NAMESPACE_FLAG = 0x8000000000000000;

  /**
   * Generates a mosaic id from an owner address and a nonce.
   * @param Address|Models\UnresolvedAddress|Models\Address ownerAddress Owner address.
   * @param int nonce Nonce.
   * @return string Computed mosaic id by GMP.
   */
  public static function generateMosaicId(Address|Models\UnresolvedAddress|Models\Address $ownerAddress, int $nonce): string
  {
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

  /**
   * Generates a namespace id from a name and an optional parent namespace id.
   * @param string name Namespace name.
   * @param int parentNamespaceId Parent namespace id.
   * @return string Computed namespace id by GMP.
   */
  public static function generateNamespaceId(string $name, int $parentNamespaceId = 0): string
  {
    $hasher = hash_init('sha3-256');
    hash_update($hasher, self::uint32ToBytes($parentNamespaceId & 0xFFFFFFFF));
    hash_update($hasher, self::uint32ToBytes(($parentNamespaceId >> 32) & 0xFFFFFFFF));
    hash_update($hasher, $name);
    $digest = hash_final($hasher, true);
    $result = self::digestToGmp($digest);

    return gmp_strval(gmp_or($result, self::NAMESPACE_FLAG));
  }

  /**
   * Returns true if a name is a valid namespace name.
   * @param string name Namespace name to check.
   * @return bool true if the specified name is valid.
   */
  public static function isValidNamespaceName(string $name): bool
  {
    $isAlphanum = function ($char) {
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

  /**
   * Parses a fully qualified namespace name into a path.
   * @param string fullyQualifiedName Fully qualified namespace name.
   * @return array Computed namespace path.
   */
  public static function generateNamespacePath(string $fullyQualifiedName): array
  {
    $path = [];
    $parentNamespaceId = 0;

    foreach (explode('.', $fullyQualifiedName) as $name) {
      if (!self::isValidNamespaceName($name))
        throw new Exception("fully qualified name is invalid due to invalid part name ({$fullyQualifiedName})");

      $path[] = self::generateNamespaceId($name, $parentNamespaceId);
      $parentNamespaceId = end($path);
    }

    return $path;
  }

  /**
   * Generates a mosaic id from a fully qualified mosaic alias name.
   * @param string fullyQualifiedName Fully qualified mosaic name.
   * @return int Computed mosaic id.
   */
  public static function generateMosaicAliasId($fullyQualifiedName): int
  {
    $path = self::generateNamespacePath($fullyQualifiedName);
    return $path[count($path) - 1];
  }

  private static function uint32ToBytes($num)
  {
    return pack('V', $num);
  }

  private static function digestToGmp($digest)
  {
    $result = gmp_init(0);
    for ($i = 0; $i < 8; ++$i) {
      $shifted = gmp_mul(ord($digest[$i]), gmp_pow(2, 8 * $i));
      $result = gmp_add($result, $shifted);
    }
    return $result;
  }
}
