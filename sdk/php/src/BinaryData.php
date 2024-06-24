<?php
$base_path = dirname(__FILE__);
require_once $base_path . '/utils/converter.php';

/**
 * Represents a fixed size byte array.
 */
class BinaryData
{
	public $binaryData;

	/**
	 * Creates a byte array.
	 * @param int fixedSize Size of the array.
	 * @param string hex string.
	 */
	public function __construct($fixedSize, $binaryData)
	{
		if ($fixedSize !== strlen($binaryData))
			throw new RangeException("Bytes was size " . strlen($binaryData) . " but must be $fixedSize");

		$this->binaryData = $binaryData;
	}

	/**
	 * Returns string representation of this object.
	 * @return string String representation of this object
	 */
	public function __toString()
	{
		return '0x' . strtoupper(bin2hex($this->binaryData));
	}
}
