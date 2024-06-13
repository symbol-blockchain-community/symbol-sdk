<?php

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
	 * @param int $value Value.
	 * @param bool $isSigned True if the value should be treated as signed.
	 */
	public function __construct(int $size, int $value)
	{
		$this->size = $size;
		$this->value = $value;
	}

	/**
	 * Converts base value to string.
	 * @return string String representation.
	 */
	public function __toString(): string
	{
		$hexString = gmp_strval($this->value, 16);
		$targetLength = $this->size * 2;
		$paddedHexString = str_pad($hexString, $targetLength, '0', STR_PAD_LEFT);
		return "0x" . strtoupper($paddedHexString);
	}
}
