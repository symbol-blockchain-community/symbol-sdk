<?php

namespace SymbolSdk\Symbol;

use SymbolSdk\BinaryData;
use SymbolSdk\Symbol\Models\NamespaceId;
use SymbolSdk\Utils\Converter;

class Address extends BinaryData
{
  const SIZE = 24;

  const ENCODED_SIZE = 39;

  /**
   * Creates a Symbol address.
   * @param string|Address addressInput Input string, byte array or address.
   */
  public function __construct($addressInput)
  {
    if (mb_check_encoding($addressInput, 'UTF-8')) {
      $addressInput = Converter::addressToBinary($addressInput);
    } else if ($addressInput instanceof Address) {
      $addressInput = $addressInput->binaryData;
    };
    parent::__construct(self::SIZE, $addressInput);
  }

  /**
   * Attempts to convert this address into a namespace id.
   * @return NamespaceId|null Namespace id if this adresss is an alias, undefined otherwise.
   */
  public function toNamespaceId()
  {
    if (!($this->binaryData[0] & "x\01"))
      return null;

    $idBinary = substr($this->binaryData, 1, 8);
    $ids = unpack('P', $idBinary)[1];
    return new NamespaceId($ids);
  }

  /**
   * Creates an address from a decoded address hex string (typically from REST).
   * @param string hexString Decoded address hex string.
   * @return Address Equivalent address.
   */
  public static function fromDecodedAddressHexString($hexString)
  {
    return new self(hex2bin($hexString));
  }

  /**
   * Creates an address from a namespace id.
   * @param NamespaceId namespaceId Namespace id.
   * @param int networkIdentifier Network identifier byte.
   * @return Address Address referencing namespace id.
   */
  public static function fromNamespaceId(NamespaceId $namespaceId, int $networkIdentifier)
  {
    return new self(Converter::intToBinary($networkIdentifier + 1, 1) . Converter::intToBinary($namespaceId->value, 8) . str_repeat("\x00", self::SIZE - 9));
  }
}
