<?php
$base_path = dirname(__FILE__);
require_once $base_path . '/utils/converter.php';

/**
 * Represents a fixed size byte array.
 */
class ByteArray
{
	/**
	 * Byte array name (required because `constructor.name` is dropped during minification).
	 * @type string
	 */
	const NAME = 'ByteArray';

	public $hexBinary;

	/**
	 * Creates a byte array.
	 * @param int fixedSize Size of the array.
	 * @param string hex string.
	 */
	public function __construct($fixedSize, $hexBinary)
	{
		$rowHex = "";
		if (Converter::isHexString($hexBinary)) {
			$rowHex = $hexBinary;
		} else {
			$rowHex = Converter::addressToHexAddress($hexBinary);
		}
		if ($fixedSize !== strlen($rowHex) / 2)
			throw new RangeException("Bytes was size " . strlen($rowHex) . " but must be $fixedSize");

		$this->hexBinary = $rowHex;
	}

	/**
	 * Returns string representation of this object.
	 * @return string String representation of this object
	 */
	public function toString()
	{
		try {
			return Converter::hexAddressToAddress($this->hexBinary);
		} catch (Exception) {
			return '0x' . $this->hexBinary;
		}
	}
}
