<?php

namespace SymbolSdk;

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
	 */
	public function __construct(int $size, $value)
	{
		if (!extension_loaded('gmp')) {
			throw new \Exception('GMP extension is not loaded');
		}
		$this->size = $size;
		$this->value = $this->processInput($size, $value);
	}

	/**
	 * Process the input value based on size.
	 * @param int $size Size of the integer.
	 * @param int|string $value Value to process.
	 * @return int|string
	 * @throws InvalidArgumentException If input is invalid.
	 */
	private function processInput(int $size, $value)
	{
		if ($size === 8) {
			if (!is_string($value) && !is_numeric($value)) {
				throw new \InvalidArgumentException('For 8-byte integers, value must be a numeric string or a number');
			}
			// Ensure the value is a GMP resource
			return gmp_strval(gmp_init($value, 10));
		} else {
			if (!is_int($value)) {
				throw new \InvalidArgumentException('For non 8-byte integers, value must be an integer');
			}
			return $value;
		}
	}

	/**
	 * Converts base value to string.
	 * @return string String representation.
	 */
	public function __toString(): string
	{
		if ($this->size === 8) {
			$gmpValue = gmp_init($this->value, 10);
			$hexString = gmp_strval($gmpValue, 16);
		} else {
			$hexString = dechex($this->value);
		}

		$targetLength = $this->size * 2;
		$paddedHexString = str_pad($hexString, $targetLength, '0', STR_PAD_LEFT);
		return '0x' . strtoupper($paddedHexString);
	}
}
