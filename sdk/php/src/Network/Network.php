<?php

namespace SymbolSdk\Network;

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

