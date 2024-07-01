<?php
namespace SymbolSdk\Bip32;

use SymbolSdk\CryptoTypes\PrivateKey;
use SymbolSdk\Utils\Converter;

class Bip32Node {
	public string $seed;
	public PrivateKey $privateKey;
	public string $chainCode;

	public function __construct(string $hmacKey, string $seed)
	{
		$this->seed = $seed;
		$hmacResult = hash_hmac('sha512', $seed, $hmacKey, true);
		$this->privateKey = new PrivateKey(substr($hmacResult, 0, PrivateKey::$SIZE));
		$this->chainCode = substr($hmacResult, PrivateKey::$SIZE);
	}

	public function deriveOne(int $identifier){
		$childData = array_fill(0, 1 + PrivateKey::$SIZE + 4, 0);
		$childData[0] = 0;
		$childData[count($childData) - 4] = 0x80;

		for ($i = 0; 4 > $i; ++$i)
			$childData[count($childData) - 1 - $i] |= ($identifier >> (8 * $i)) & 0xFF;

		for ($i = 0; $i < PrivateKey::$SIZE; ++$i)
			$childData[1 + $i] = Converter::binaryToInt($this->privateKey->binaryData[$i], 1);

		return new Bip32Node($this->chainCode, Converter::arrayToBinary($childData));
	}

	public function derivePath(array $path){
		$nextNode = $this;
		foreach ($path as $identifier) {
			$nextNode = $nextNode->deriveOne($identifier);
		}
		return $nextNode;
	}
}