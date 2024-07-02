<?php

namespace SymbolSdk\CryptoTypes;

use SymbolSdk\BinaryData;

/**
 * Represents a signature.
 */
class Signature extends BinaryData
{
	static $SIZE = 64;

	/**
	 * Creates a signature from bytes or a hex string.
	 * @param string signature Input string or byte array.
	 */
	public function __construct(string $signature)
	{
		parent::__construct(self::$SIZE, $signature);
	}

	/**
	 * Creates a zeroed signature.
	 * @return Signature Zeroed signature.
	 */
	public static function zero(): Signature
	{
		return new self(str_repeat("\x00", self::$SIZE));
	}
}
