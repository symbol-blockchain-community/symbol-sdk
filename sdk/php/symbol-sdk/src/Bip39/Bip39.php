<?php

/**
 * This code is derived from or inspired by the BIP39 implementation in bitcoin-lib-php:
 * https://github.com/Bit-Wasp/bitcoin-lib-php/tree/master/src/BIP39
 * 
 * The original code is released into the public domain under the terms of the Unlicense:
 * https://github.com/Bit-Wasp/bitcoin-lib-php/blob/master/LICENSE
 *
 * While attribution is not required by the license, we include this notice as a courtesy 
 * to the original authors and to maintain transparency about the code's origin.
 */

namespace SymbolSdk\BIP39;

use Error;
use SymbolSdk\BIP39\BIP39JapaneseWordList;

class BIP39
{
	protected static $defaultWordList;

	/**
	 * generate random entropy using openssl_random_pseudo_bytes
	 *
	 * @param int	$size										desired strength, must be multiple of 32, recommended 128-256
	 * @throws \Exception
	 * @return string											 hex Entropy
	 */
	public static function generateEntropy($size = 256)
	{
		if ($size % 32 !== 0) {
			throw new \InvalidArgumentException("Entropy must be in a multiple of 32");
		}
		return openssl_random_pseudo_bytes($size / 8);
	}

	/**
	 * create Mnemonic from Entropy
	 *
	 * @param string				$entropy		 Entropy
	 * @param BIP39WordList $wordList			 defaults to BIP39 english word list
	 * @return string											 Mnemonic
	 * @throws \Exception
	 */
	public static function entropyToMnemonic($entropy, BIP39WordList $wordList = null)
	{
		$bin = '';
    $length = strlen($entropy);
    for ($i = 0; $i < $length; $i++) {
      $bin .= str_pad(decbin(ord($entropy[$i])), 8, '0', STR_PAD_LEFT);
    }
		$bin = $bin . self::entropyChecksum($entropy);
		if(strlen($bin) % 11 !== 0) throw new Error('Entropy length must be an even multiple of 11 bits');

		$wordList = $wordList ?: self::defaultWordList();

    for ($i = 0; $i < strlen($bin) / 11; $i++) {
      $segment = substr($bin, $i * 11, 11);
      $wi = bindec($segment);
      $mnemonic[] = $wordList->getword($wi);
    }
		$result = '';
		if ($wordList instanceof BIP39JapaneseWordList) {
			$result = implode("\u{3000}", $mnemonic);
		} else {
			$result = implode(" ", $mnemonic);
		}
		return $result;
	}

	/**
	 * create Checksum from Entropy
	 *
	 * @param string				$entropy		 Entropy
	 * @return string											 bits checksum
	 */
	protected static function entropyChecksum($entropy)
	{
		// calculate entropy
		$ENT = strlen($entropy) * 8;
		// calculate how long the checksum should be
		$CS = $ENT / 32;

		$hashHex = hash("sha256", $entropy);

		// create full checksum
		$hashBits = self::binaryToBits(hex2bin($hashHex));
		$hashBits = str_pad($hashBits, 256, "0", STR_PAD_LEFT); // PHP trims off 0s

		// take only the bits we need
		$checksum = substr($hashBits, 0, $CS);

		return $checksum;
	}

	/**
	 * create Seed from Mnemonic and Passphrase
	 *
	 * @param string				$mnemonic			 hex Mnemonic
	 * @param string				$passphrase
	 * @return mixed
	 * @throws \Exception
	 */
	public static function mnemonicToSeedHex($mnemonic, $passphrase)
	{
		$passphrase = self::normalizePassphrase($passphrase);
		$salt = "mnemonic" . $passphrase;
		return hash_pbkdf2("sha512", $mnemonic, $salt, 2048, 64 * 2, false);
	}

	/**
	 * normalize Passphrase if it's UTF-8
	 *
	 * requires the Normalizer class from the PECL intl extension
	 *	so if the Passphrase is UTF-8 and the class isn't there we throw an error!
	 *
	 * @param string				$passphrase
	 * @return string
	 * @throws \Exception
	 */
	public static function normalizePassphrase($passphrase)
	{
		if (!class_exists('Normalizer')) {
			if (mb_detect_encoding($passphrase) == "UTF-8") {
				throw new \Exception("UTF-8 passphrase is not supported without the PECL intl extension installed.");
			} else {
				return $passphrase;
			}
		}
		return \Normalizer::normalize($passphrase, \Normalizer::FORM_KD);
	}

	/**
	 * get the default (english BIP39) word list
	 *
	 * @return BIP39EnglishWordList
	 */
	public static function defaultWordList()
	{
		if (self::$defaultWordList === null) {
			self::$defaultWordList = new BIP39EnglishWordList();
		}

		return self::$defaultWordList;
	}

	private static function binaryToBits($binaryData) {
    $bits = '';
    $length = strlen($binaryData);
    for ($i = 0; $i < $length; $i++) {
      $bits .= str_pad(decbin(ord($binaryData[$i])), 8, '0', STR_PAD_LEFT);
    }
    return $bits;
	}
}
