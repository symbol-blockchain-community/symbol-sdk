<?php
	namespace symbol;
	require_once dirname(__FILE__).'/../BaseValue.php';
	require_once dirname(__FILE__).'/../utils/converter.php';
	use BaseValue;
	use utils\Converter;
class Amount extends BaseValue {
	const SIZE = 8;

	public function __construct($amount = 0) {
		parent::__construct(self::SIZE, $amount);
	}

	public static function deserialize($payload) {
		$byteArray = $payload;
		return new Amount(Converter::bytesToInt($byteArray));
	}

	public function serialize() {
		return Converter::intToBytes($this->value);
	}
}