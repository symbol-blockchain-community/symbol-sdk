<?php

namespace SymbolSdk;

use RangeException;

class Network
{
  public string $name;
  public $identifier;
  public $datetimeConverter;
  private $_addressHasher;
  private $_createAddress;
  public $addressClass;
  public $networkTimestampClass;
  public function __construct($name, $identifier, $datetimeConverter, $addressHasher, $createAddress, $addressClass, $networkTimestampClass)
  {
    $this->name = $name;
    $this->identifier = $identifier;
    $this->datetimeConverter = $datetimeConverter;
    $this->_addressHasher  = $addressHasher;
    $this->_createAddress  = $createAddress;
    $this->addressClass = $addressClass;
    $this->networkTimestampClass = $networkTimestampClass;
  }

  /**
   * hash_update($hasher, pack('V', $nonce));
   * hash_update($hasher, $ownerAddress->binaryData);
   * $digest = hash_final($hasher, true);
   */
  public function publicKeyToAddress(string $publicKey)
  {
    $partOneHash = hash($this->_addressHasher, $publicKey, true);
    $partTwoHash = hash('ripemd160', $partOneHash, true);
    $identifierBinary = pack('C', $this->identifier);
    $version = $identifierBinary . $partTwoHash;
    $partThreeHash = hash($this->_addressHasher, $version, true);
    $checksum = substr($partThreeHash, 0, 4);
    return call_user_func($this->_createAddress, $version, $checksum);
  }
}

class NetworkLocator
{
  public static function findByName($networks, $singleOrMultipleNames)
  {
    $names = is_array($singleOrMultipleNames) ? $singleOrMultipleNames : [$singleOrMultipleNames];
    $matchingNetwork = null;

    foreach ($networks as $network) {
      if (in_array($network->name, $names)) {
        $matchingNetwork = $network;
        break;
      }
    }

    if (null === $matchingNetwork) {
      throw new RangeException("No network found with name '" . implode(', ', $names) . "'");
    }

    return $matchingNetwork;
  }

  public static function findByIdentifier($networks, $singleOrMultipleIdentifiers)
  {
    $identifiers = is_array($singleOrMultipleIdentifiers) ? $singleOrMultipleIdentifiers : [$singleOrMultipleIdentifiers];
    $matchingNetwork = null;

    foreach ($networks as $network) {
      if (in_array($network->identifier, $identifiers)) {
        $matchingNetwork = $network;
        break;
      }
    }

    if (null === $matchingNetwork) {
      throw new RangeException("No network found with name '" . implode(', ', $identifiers) . "'");
    }

    return $matchingNetwork;
  }
}
