<?php
namespace SymbolSdk\Merkle;

use SymbolSdk\Utils\ArrayHelpers;

class Merkle {
  /**
   * Proves a merkle hash.
   * @param Hash256 leafHash Leaf hash to prove.
   * @param array merklePath Merkle *hash chain* path from leaf to root.
   * @param Hash256 rootHash Root hash of the merkle tree.
   * @return bool \c true if leaf hash is connected to root hash; false otherwise.
   */
  static function proveMerkle($leafHash, $merklePath, $rootHash): bool {
    $computedRootHash = array_reduce($merklePath, function($workingHash, $merklePart) {
      $hasher = hash_init('sha3-256');
      if ($merklePart['position'] === 'left') {
        hash_update($hasher, hex2bin($merklePart['hash']));
        hash_update($hasher, hex2bin($workingHash));
      } else {
        hash_update($hasher, hex2bin($workingHash));
        hash_update($hasher, hex2bin($merklePart['hash']));
      }
      return hash_final($hasher, true);
    }, $leafHash);
    return 0 === ArrayHelpers::deepCompare(hex2bin($rootHash), $computedRootHash);
  }
}