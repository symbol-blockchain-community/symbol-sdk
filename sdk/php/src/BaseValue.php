<?php
function bitmask($bitsNumber) {
  return -pow(2, 32 - $bitsNumber);
}

function check($byteSize, $value, $isSigned) {
  if ($byteSize === 8) {
    if (!is_int($value) && !is_float($value))
      throw new TypeError("\"value\" ({$value}) has invalid type, expected BigInt");

    $lowerBound = $isSigned ? -pow(2, 63) : 0;
    $upperBound = $isSigned ? pow(2, 63) - 1 : pow(2, 64) - 1;
  } else {
    if (!is_int($value))
      throw new OutOfRangeException("\"value\" ({$value}) is not an integer");

    $lowerBound = $isSigned ? -pow(2, 8 * $byteSize - 1) : 0;
    $upperBound = $isSigned ? pow(2, 8 * $byteSize - 1) - 1 : pow(2, 8 * $byteSize) - 1;
  }

  if ($value < $lowerBound || $value > $upperBound)
    throw new OutOfRangeException("\"value\" ({$value}) is outside of valid " . (8 * $byteSize) . "-bit range");

  return $value;
}

function isNonNegative($value) {
  return $value >= 0;
}

class BaseValue {
  public $size;
  public $isSigned;
  public $value;

  public function __construct($size, $value, $isSigned = false) {
    $this->size = $size;
    $this->isSigned = $isSigned;
    $this->value = check($size, $value, $isSigned);
  }

  public function __toString() {
    if (!$this->isSigned || isNonNegative($this->value)) {
      $unsignedValue = $this->value;
    } else {
      $upperBoundPlusOne = ($this->size === 8 ? pow(2, 64) : bitmask($this->size * 8) + 1);
      $unsignedValue = $this->value + $upperBoundPlusOne;
    }

    return "0x" . str_pad(dechex($unsignedValue), $this->size * 2, '0', STR_PAD_LEFT);
  }
}