<?php

namespace SymbolSdk\Utils;

use Exception;

define('CONSTANTS', [
	'sizes' => [
		'ripemd160' => 20,
		'symbolAddressDecoded' => 24,
		'nemAddressDecoded' => 25,
		'symbolAddressEncoded' => 39,
		'nemAddressEncoded' => 40,
		'key' => 32,
		'checksum' => 3,
	]
]);

class Converter {	
	/**
	 * Converts siez to format
	 * @param int bytes size.
	 * @return string format for pack and unpack.
	 */
	public static function sizeToFormat($size)
	{
		switch ($size) {
			case 1:
				return "C";
			case 2:
				return "v";
			case 4:
				return "V";
			case 8:
				return "Q";
			default:
				throw new Exception("invalid size");
		}
	}
	
	/**
	 * hex of binary to int
	 * @param string hex of binary
	 * @param int size of binary
	 * @return int culclated int from hex of binary
	 */
	public static function hexToInt($binaryHex, $size)
	{
		$binary = hex2bin($binaryHex);
		if ($binary === false)
			throw new Exception("invalid hex string");
	
		$result = unpack(self::sizeToFormat($size), $binary);
		if ($result === false)
			throw new Exception("unpack failed");
	
		return $result[1];
	}
	
	public static function binaryToInt(string $binary, int $size)
	{
		if ($size === 8) {
			return self::binaryToGmp($binary);
		} else {
			return unpack(self::sizeToFormat($size), $binary)[1];
		}
	}
	
	public static function intToBinary($int, int $size): string
	{
		if ($int === 0) {
			return str_repeat("\0", $size); // Return a string of zeros
		}
		if ($size === 8) {
			return self::gmpToBinary($int);
		} else {
			return pack(self::sizeToFormat($size), $int);
		}
	}
	
	/**
	 * Converts GMP value to 64-bit binary string.
	 * @param string $gmpValue GMP value as string.
	 * @return string Binary representation.
	 */
	public static function gmpToBinary(string $gmpValue): string
	{
		$gmp = gmp_init($gmpValue, 10);
		$hex = gmp_strval($gmp, 16);
		$hex = str_pad($hex, 16, '0', STR_PAD_LEFT);
		$binary = pack('H*', $hex);
		return strrev($binary);
	}
	
	/**
	 * Converts binary string to GMP value.
	 * @param string $binary Binary string.
	 * @return string GMP value as string.
	 */
	public static function binaryToGmp(string $binary): string
	{
		$reversedBinary = strrev($binary);
		$hex = bin2hex($reversedBinary);
		$gmp = gmp_init($hex, 16);
		return gmp_strval($gmp, 10);
	}
	
	/**
	 * int to hex of binary
	 * @param int int
	 * @param int size of binary
	 * @return string hex of binary
	 */
	public static function intToHex($int, $size)
	{
		$packed = pack(self::sizeToFormat($size), $int);
		if ($packed === false) {
			throw new Exception("pack failed");
		}
		return strtoupper(bin2hex($packed));
	}
	
	public static function isHexString($value)
	{
		$hexPattern = '/^[0-9a-fA-F]+$/i';
		return preg_match($hexPattern, $value);
	}
	
	public static function addressToBinary($encoded)
	{
		$base32 = new Base2n(5, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ234567', FALSE, TRUE, TRUE);
		if (CONSTANTS['sizes']['symbolAddressEncoded'] == strlen($encoded)) {
			return substr($base32->decode($encoded . "A"), 0, -1);
		}
		if (CONSTANTS['sizes']['nemAddressEncoded'] == strlen($encoded)) {
			return mb_convert_encoding($encoded, 'UTF-8', 'ISO-8859-1');
		}
		throw new Exception("$encoded does not represent a valid encoded address");
	}
	
	public static function binaryToAddress($decoded)
	{
		$base32 = new Base2n(5, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ234567', FALSE, TRUE, TRUE);
		if (CONSTANTS['sizes']['symbolAddressDecoded'] == strlen($decoded)) {
			$padded = $decoded . "\x00";
			$encoded = $base32->encode($padded);
			return substr($encoded, 0, CONSTANTS['sizes']['symbolAddressEncoded']);
		}
		if (CONSTANTS['sizes']['nemAddressDecoded'] == strlen($decoded)) {
			return $base32->encode($decoded);
		}
		throw new Exception("invalid address type");
	}

	public static function arrayToBinary($array) {
		$binaryData = '';
		foreach ($array as $element) {
				$binaryData .= pack('C', $element);
		}
		return $binaryData;
	}

	public static function arrayToHex($array){
		return strtoupper(bin2hex(self::arrayToBinary($array))) . "\n";
	}

	public static function arrayToString($array, $int = 0){
		foreach ($array as $element) {
			if($int == 1){
				echo $element . ", ";
			} else {
				foreach($element as $e) {
					echo $e . ", ";
				}
				echo "\n";
			}
		}
		echo "\n";
	}
}
