<?php

namespace SymbolSdk\Bip32;

use SymbolSdk\CryptoTypes\PrivateKey;
use SymbolSdk\Utils\Converter;

/**
 * Representation of a BIP32 node.
 */
class Bip32Node
{
	public PrivateKey $privateKey;
	public string $seed;
	public string $chainCode;

	/**
	 * Creates a BIP32 node around a key and data.
	 * @param string hmacKey BIP32 HMAC key.
	 * @param string data BIP32 seed.
	 */
	public function __construct(string $hmacKey, string $seed)
	{
		$this->seed = $seed;
		$hmacResult = hash_hmac('sha512', $seed, $hmacKey, true);
		$this->privateKey = new PrivateKey(substr($hmacResult, 0, PrivateKey::$SIZE));
		$this->chainCode = substr($hmacResult, PrivateKey::$SIZE);
	}

	/**
	 * Derives a direct child node with specified identifier.
	 * @param int identifier Child identifier.
	 * @return Bip32Node BIP32 child node.
	 */
	public function deriveOne(int $identifier): Bip32Node
	{
		$childData = array_fill(0, 1 + PrivateKey::$SIZE + 4, 0);
		$childData[0] = 0;
		$childData[count($childData) - 4] = 0x80;

		for ($i = 0; 4 > $i; ++$i)
			$childData[count($childData) - 1 - $i] |= ($identifier >> (8 * $i)) & 0xFF;

		for ($i = 0; $i < PrivateKey::$SIZE; ++$i)
			$childData[1 + $i] = Converter::binaryToInt($this->privateKey->binaryData[$i], 1);

		return new Bip32Node($this->chainCode, Converter::arrayToBinary($childData));
	}

	/**
	 * Derives a descendent node with specified path.
	 * @param array path BIP32 path.
	 * @return Bip32Node BIP32 node at the end of the path.
	 */
	public function derivePath(array $path): Bip32Node
	{
		$nextNode = $this;
		foreach ($path as $identifier) {
			$nextNode = $nextNode->deriveOne($identifier);
		}
		return $nextNode;
	}
}
