<?php
class Converter
{
	/**
	 * Converts siez to format
	 * @param int bytes size.
	 * @return string format for pack and unpack.
	 */
	private static function sizeToFormat($size)
	{
		switch ($size) {
			case 2:
				return "n";
			case 4:
				return "N";
			case 8:
				return "J";
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
		return unpack(self::sizeToFormat($size), hex2bin($binaryHex))[1];
	}

	/**
	 * int to hex of binary
	 * @param int int
	 * @param int size of binary
	 * @return string hex of binary
	 */
	public static function intToHex($int, $size)
	{
		return bin2hex(pack(self::sizeToFormat($size), $int));
	}
}
