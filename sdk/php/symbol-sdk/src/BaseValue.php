<?php

namespace SymbolSdk;

use Error;
use SymbolSdk\Utils\Converter;

/**
 * Represents a base integer.
 */
class BaseValue
{
	/**
	 * Size of the integer.
	 * @var int
	 */
	public $size;

	/**
	 * Value.
	 * @var int
	 */
	public $value;

	/**
	 * Creates a base value.
	 * @param int $size Size of the integer.
	 * @param int|float|string $value Value.
	 */
	public function __construct(int $size, int|string $value)
	{
		$this->size = $size;
		if (is_float($value))
			throw new Error('Value ' . $value . ' exceeds the maximum integer size (' . PHP_INT_MAX . ') supported by this system. However, if the value is within the 64-bit integer range, you can pass it as a string (e.g., \'0xFFFFFFFFFFFFFFFF\' or \'18446744073709551615\').');
		if (is_string($value)) {
			$this->value = Converter::intStringToInt($value);
		} else {
			$this->value = $value;
		}
	}

	/**
	 * Converts base value to string.
	 * @return string String representation.
	 */
	public function __toString(): string
	{
		$hexString = dechex($this->value);
		$targetLength = $this->size * 2;
		$paddedHexString = str_pad($hexString, $targetLength, '0', STR_PAD_LEFT);
		return '0x' . strtoupper($paddedHexString);
	}
}
