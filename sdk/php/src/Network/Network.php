<?php

namespace SymbolSdk\Network;
use ReflectionClass;

class Network
{
  public string $name;
  public $identifier;
  public NetworkTimestampDatetimeConverter $datetimeConverter;
  protected $_addressHasher;
  protected $_createAddress;
  protected ReflectionClass $_addressClass;
  public ReflectionClass $networkTimestampClass;
  public function __construct($name, $identifier, $datetimeConverter, $addressHasher, $createAddress, $addressClass, $networkTimestampClass)
  {
    $this->name = $name;
    $this->identifier = $identifier;
    $this->datetimeConverter = $datetimeConverter;
    $this->_addressHasher  = $addressHasher;
    $this->_createAddress  = $createAddress;
    $this->_addressClass = new ReflectionClass($addressClass);
    $this->networkTimestampClass = new ReflectionClass($networkTimestampClass);
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

