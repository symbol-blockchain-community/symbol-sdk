<?php

namespace SymbolSdk\Merkle;

use SymbolSdk\Symbol\Models\Hash256;

/**
 * Builder for creating a merkle hash.
 */
class MerkleHashBuilder
{
  private array $_hashes;

  /**
   * Creates a merkle hash builder.
   */
  public function __construct()
  {
    $this->_hashes = [];
  }

  /**
   * Adds a hash to the merkle hash.
   * @param Hash256 componentHash Hash to add.
   */
  public function update(Hash256 $componentHash): void
  {
    array_push($this->_hashes, $componentHash->binaryData);
  }

  /**
   * Calculates the merkle hash.
   * @return Hash256 Merkle hash.
   */
  public function final(): Hash256
  {
    if (0 == count($this->_hashes))
      return new Hash256();

    $numRemainingHashes = count($this->_hashes);
    while (1 < $numRemainingHashes) {
      $i = 0;
      while ($i < $numRemainingHashes) {
        $hasher = hash_init('sha3-256');
        hash_update($hasher, $this->_hashes[$i]);

        if ($i + 1 < $numRemainingHashes) {
          hash_update($hasher, $this->_hashes[$i + 1]);
        } else {
          // if there is an odd number of hashes, duplicate the last one
          hash_update($hasher, $this->_hashes[$i]);
          $numRemainingHashes += 1;
        }

        $this->_hashes[floor($i / 2)] = hash_final($hasher, true);
        $i += 2;
      }

      $numRemainingHashes = floor($numRemainingHashes / 2);
    }

    return new Hash256($this->_hashes[0]);
  }
}
