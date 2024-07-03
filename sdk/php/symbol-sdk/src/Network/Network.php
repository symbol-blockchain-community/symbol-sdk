<?php

namespace SymbolSdk\Network;

use ReflectionClass;
use SymbolSdk\CryptoTypes\PublicKey;
use SymbolSdk\Utils\Converter;
use SymbolSdk\BinaryData;
use DateTime;

/**
 * Represents a network.
 */
class Network
{
  public string $name;
  public $identifier;
  public NetworkTimestampDatetimeConverter $datetimeConverter;
  protected $_addressHasher;
  protected $_createAddress;
  protected ReflectionClass $_addressClass;
  public ReflectionClass $networkTimestampClass;

  const BASE32_RFC4648_ALPHABET = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ234567';

  /**
   * Creates a new network with the specified name and identifier byte.
   * @param string name Network name.
   * @param int identifier Network identifier byte.
   * @param NetworkTimestampDatetimeConverter datetimeConverter Network timestamp datetime converter associated with this network.
   * @param string addressHasher Gets the primary hasher to use in the public key to address conversion.
   * @param callable createAddress Creates an encoded address from an address without checksum and checksum bytes.
   * @param string AddressClass Address class associated with this network.
   * @param string NetworkTimestampClass Network timestamp class associated with this network.
   */
  public function __construct(
    string $name,
    int $identifier,
    NetworkTimestampDatetimeConverter $datetimeConverter,
    string $addressHasher,
    $createAddress,
    $addressClass,
    $networkTimestampClass
  ) {
    $this->name = $name;
    $this->identifier = $identifier;
    $this->datetimeConverter = $datetimeConverter;
    $this->_addressHasher  = $addressHasher;
    $this->_createAddress  = $createAddress;
    $this->_addressClass = new ReflectionClass($addressClass);
    $this->networkTimestampClass = new ReflectionClass($networkTimestampClass);
  }

  /**
   * Converts a public key to an address.
   * @param PublicKey publicKey Public key to convert.
   * @return TAddress Address corresponding to the public key input.
   */
  public function publicKeyToAddress(string|PublicKey $publicKey)
  {
    if ($publicKey instanceof PublicKey) $publicKey = $publicKey->binaryData;
    $partOneHash = hash($this->_addressHasher, $publicKey, true);
    $partTwoHash = hash('ripemd160', $partOneHash, true);
    $identifierBinary = pack('C', $this->identifier);
    $version = $identifierBinary . $partTwoHash;
    $partThreeHash = hash($this->_addressHasher, $version, true);
    $checksum = substr($partThreeHash, 0, 4);
    return call_user_func($this->_createAddress, $version, $checksum);
  }

  /**
   * Checks if an address string is valid and belongs to this network.
   * @param string addressString Address to check.
   * @return bool \c true if address is valid and belongs to this network.
   */
  public function isValidAddressString(string $addressString): bool
  {
    if ($this->_addressClass->getConstant('ENCODED_SIZE') !== strlen($addressString))
      return false;

    for ($i = 0; $i < strlen($addressString); ++$i) {
      if (strpos(self::BASE32_RFC4648_ALPHABET, $addressString[$i]) === false)
        return false;
    }
    return $this->isValidAddress($this->_addressClass->newInstance($addressString));
  }

  /**
   * Checks if an address is valid and belongs to this network.
   * @param TAddress address Address to check.
   * @return bool \c true if address is valid and belongs to this network.
   */
  public function isValidAddress($address): bool
  {
    if (Converter::binaryToInt($address->binaryData[0], 1) != $this->identifier)
      return false;
    $hash = hash($this->_addressHasher, substr($address->binaryData, 0, 1 + 20), true);
    $checkSumFromAddress = substr($address->binaryData, 1 + 20);
    $calculatedChecksum = substr($hash, 0, strlen($checkSumFromAddress));
    for ($i = 0; $i < strlen($checkSumFromAddress); ++$i) {
      if ($checkSumFromAddress[$i] != $calculatedChecksum[$i])
        return false;
    }
    return true;
  }

  /**
   * Converts a network timestamp to a datetime.
   * @param NetworkTimestamp referenceNetworkTimestamp Reference network timestamp to convert.
   * @return DateTime Datetime representation of the reference network timestamp.
   */
  public function toDatetime(NetworkTimestamp $referenceNetworkTimestamp): DateTime
  {
    return $this->datetimeConverter->toDatetime($referenceNetworkTimestamp->timestamp);
  }

  /**
   * Converts a datetime to a network timestamp.
   * @param DateTime referenceDatetime Reference datetime to convert.
   * @return NetworkTimestamp Network timestamp representation of the reference datetime.
   */
  public function fromDatetime(DateTime $referenceDatetime): NetworkTimestamp
  {
    return $this->networkTimestampClass->newInstance($this->datetimeConverter->toDifference($referenceDatetime));
  }

  /**
   * Returns string representation of this object.
   * @return string String representation of this object
   */
  public function __toString(): string
  {
    return $this->name;
  }
}
