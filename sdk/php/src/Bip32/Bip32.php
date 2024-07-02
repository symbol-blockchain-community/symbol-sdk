<?php

namespace SymbolSdk\Bip32;

use SymbolSdk\Bip32\Bip32Node;
use SymbolSdk\BIP39\BIP39;
use SymbolSdk\BIP39\BIP39JapaneseWordList;
use SymbolSdk\BIP39\BIP39EnglishWordList;
use SymbolSdk\BIP39\BIP39WordList;

/**
 * Factory of BIP32 root nodes.
 */
class Bip32
{
	private string $_rootHmacKey;
	private string $_mnemonicLanguage;

	/**
	 * Creates a BIP32 root node factory.
	 * @param string curveName Elliptic curve to use.
	 * @param string mnemonicLanguage Language of constructed mnemonics.
	 */
	public function __construct($curveName = 'ed25519', $mnemonicLanguage = 'english')
	{
		$this->_rootHmacKey = mb_convert_encoding($curveName . ' seed', 'ISO-8859-1', 'UTF-8');
		$this->_mnemonicLanguage = $mnemonicLanguage;
	}

	/**
	 * Creates a BIP32 root node from a seed.
	 * @param string seed BIP32 seed.
	 * @return Bip32Node BIP32 root node.
	 */
	public function fromSeed(string $seed): Bip32Node
	{
		return new Bip32Node($this->_rootHmacKey, $seed);
	}

	/**
	 * Creates a BIP32 root node from a BIP39 mnemonic and password.
	 * @param string mnemonic BIP32 mnemonic.
	 * @param string password BIP32 mnemonic password.
	 * @return Bip32Node BIP32 root node.
	 */
	public function fromMnemonic(string $mnemonic, string $password): Bip32Node
	{
		$seedHex = BIP39::mnemonicToSeedHex($mnemonic, $password);
		return $this->fromSeed(hex2bin($seedHex));
	}

	/**
	 * Creates a random BIP32 mnemonic.
	 * @param number seedLength Length of random seed to use when generating mnemonic.
	 * @return string Random mnemonic created with the specified entropy.
	 */
	public function random(int $seedLength = 32): string
	{
		return Bip39::entropyToMnemonic(BIP39::generateEntropy($seedLength * 8), self::createWordList($this->_mnemonicLanguage));
	}

	private static function createWordList(string $mnemonicLanguage): BIP39WordList
	{
		switch ($mnemonicLanguage) {
			case 'english':
				return new BIP39EnglishWordList();
			case 'japanese':
				return new BIP39JapaneseWordList();
			default:
				return new BIP39EnglishWordList();
		}
	}
}
