<?php
$base_path = dirname(dirname(__FILE__));
require_once $base_path . '/Base2n.php';

class Converter
{
	private static $constants = [
		'sizes' => [
			'ripemd160' => 20,
			'symbolAddressDecoded' => 24,
			'nemAddressDecoded' => 25,
			'symbolAddressEncoded' => 39,
			'nemAddressEncoded' => 40,
			'key' => 32,
			'checksum' => 3,
		]
	];

	/**
	 * Converts siez to format
	 * @param int bytes size.
	 * @return string format for pack and unpack.
	 */
	private static function sizeToFormat($size)
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

	public static function binaryToInt(string $binary, int $size): int
	{
		$result = unpack(self::sizeToFormat($size), $binary);
		if ($result === false)
			throw new Exception("unpack failed");

		return $result[1];
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

	public static function intToBinary(int $int, int $size): string
	{
		$packed = pack(self::sizeToFormat($size), $int);
		if ($packed === false) {
			throw new Exception("pack failed");
		}
		return $packed;
	}

	public static function isHexString($value)
	{
		$hexPattern = '/^[0-9a-fA-F]+$/i';
		return preg_match($hexPattern, $value);
	}

	public static function addressToBinary($encoded)
	{
		$base32 = new Base2n(5, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ234567', FALSE, TRUE, TRUE);
		$constants = self::$constants;
		if ($constants['sizes']['symbolAddressEncoded'] == strlen($encoded)) {
			return substr($base32->decode($encoded . "A"), 0, -1);
		}
		if ($constants['sizes']['nemAddressEncoded'] == strlen($encoded)) {
			return mb_convert_encoding($encoded, 'UTF-8', 'ISO-8859-1');
		}
		throw new Exception("$encoded does not represent a valid encoded address");
	}

	public static function binaryToAddress($decoded)
	{
		$base32 = new Base2n(5, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ234567', FALSE, TRUE, TRUE);
		$constants = self::$constants;
		if ($constants['sizes']['symbolAddressDecoded'] == strlen($decoded)) {
			$padded = $decoded . "\x00";
			$encoded = $base32->encode($padded);
			return substr($encoded, 0, $constants['sizes']['symbolAddressEncoded']);
		}
		if ($constants['sizes']['nemAddressDecoded'] == strlen($decoded)) {
			return $base32->encode($decoded);
		}
		throw new Exception("invalid address type");
	}
}
