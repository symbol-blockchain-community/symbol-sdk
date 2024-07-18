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

class Converter
{
	/**
	 * Converts siez to format
	 * @param int bytes size.
	 * @return string format for pack and unpack.
	 */
	public static function sizeToFormat($size, $isReverse = false)
	{
		if ($isReverse) {
			switch ($size) {
				case 1:
					return "C";
				case 2:
					return "n";
				case 4:
					return "N";
				case 8:
					return "J";
				default:
					throw new Exception("invalid size");
			}
		} else {
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
		return unpack(self::sizeToFormat($size), $binary)[1];
	}

	public static function intToBinary($int, int $size): string
	{
		if ($int === 0) {
			return str_repeat("\0", $size); // Return a string of zeros
		}
		return pack(self::sizeToFormat($size), $int);
	}

	/**
	 * int to hex of binary
	 * @param int int
	 * @param int size of binary
	 * @return string hex of binary
	 */
	public static function intToHex($int, $size, $isReverse = false)
	{
		$packed = pack(self::sizeToFormat($size, $isReverse), $int);
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

	public static function binaryToArray($binary)
	{
		return array_values(unpack('C*', $binary));
	}

	public static function arrayToBinary($array)
	{
		return pack('C*', ...$array);
	}

	public static function arrayToHex($array)
	{
		return strtoupper(bin2hex(self::arrayToBinary($array))) . "\n";
	}

	public static function arrayToString($array, $int = 0)
	{
		foreach ($array as $element) {
			if ($int == 1) {
				echo $element . ", ";
			} else {
				foreach ($element as $e) {
					echo $e . ", ";
				}
				echo "\n";
			}
		}
		echo "\n";
	}

	public static function intStringToInt(string $input)
	{
		if (substr($input, 0, 2) === '0x') {
			$input = self::hexToSignedInt($input);
		}
		if (is_numeric($input) && $input >= PHP_INT_MIN && $input <= PHP_INT_MAX) {
			return (int)$input;
		}

		// BCMath 関数を使用して大きな数値を処理
		$twoTo64 = bcpow('2', '64');
		$twoTo63 = bcdiv($twoTo64, '2');

		$unsigned64 = bcmod($input, $twoTo64);
		if (bccomp($unsigned64, $twoTo63) >= 0) {
			return (int)bcsub($unsigned64, $twoTo64);
		} else {
			throw new Exception("Input exceeds 64-bit range");
		}
	}

	public static function hexToSignedInt($hexString)
	{
		$hexString = ltrim($hexString, '0x');

		if (!ctype_xdigit($hexString)) {
			throw new Exception("Invalid hexadecimal input");
		}

		if (strlen($hexString) > 16) {
			throw new Exception("Input exceeds 64-bit range");
		}

		$hexString = str_pad($hexString, 16, '0', STR_PAD_LEFT);
		$isNegative = hexdec($hexString[0]) >= 8;

		if ($isNegative) {
			$inverted = '';
			for ($i = 0; $i < 16; $i++) {
				$inverted .= dechex(15 - hexdec($hexString[$i]));
			}
			$hexString = $inverted;

			for ($i = 15; $i >= 0; $i--) {
				$digit = hexdec($hexString[$i]) + 1;
				if ($digit <= 15) {
					$hexString[$i] = dechex($digit);
					break;
				}
				$hexString[$i] = '0';
			}
		}

		$decimal = '0';
		for ($i = 0; $i < 16; $i++) {
			$decimal = bcadd(bcmul($decimal, '16'), (string)hexdec($hexString[$i]));
		}

		if ($isNegative) {
			$decimal = '-' . $decimal;
		}

		return (int)$decimal;
	}
}
