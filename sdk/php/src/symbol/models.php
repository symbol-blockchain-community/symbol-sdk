<?php
$base_path = dirname(dirname(__FILE__));
require_once $base_path . '/BaseValue.php';
require_once $base_path . '/ByteArray.php';
require_once $base_path . '/utils/converter.php';

class Amount extends BaseValue
{
	const SIZE = 8;

	public function __construct($amount = 0)
	{
		$amount = $amount ?? str_repeat("0", self::SIZE * 2);
		parent::__construct(self::SIZE, $amount);
	}

	public static function deserialize($payload)
	{
		$hexBinary = $payload;
		return new self(Converter::hexToInt($hexBinary, 8));
	}

	public static function deserializeAligned($payload)
	{
		$hexBinary = $payload;
		return new Amount(Converter::hexToInt($hexBinary, 8));
	}

	public function serialize()
	{
		return Converter::intToHex($this->value, 8);
	}
}


class UnresolvedAddress extends ByteArray
{
	const SIZE = 24;

	public function __construct($unresolvedAddress = null)
	{
		$unresolvedAddress = $unresolvedAddress ?? str_repeat("0", self::SIZE * 2);
		parent::__construct(self::SIZE, $unresolvedAddress);
	}

	public function size()
	{
		return 24;
	}

	public static function deserialize($payload)
	{
		$hexBinary = $payload;
		return new self($hexBinary);
	}

	public function serialize()
	{
		return $this->hexBinary;
	}
}
