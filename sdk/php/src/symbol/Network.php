<?php

namespace SymbolSdk\Symbol;

use SymbolSdk\BinaryData;
use SymbolSdk\Network\Network as BasicNetwork;
use SymbolSdk\Utils\Converter;
use SymbolSdk\Symbol\Address;
use SymbolSdk\Network\NetworkTimestampDatetimeConverter;
use SymbolSdk\Network\NetworkTimestamp;
use DateTime;
use SymbolSdk\CryptoTypes\Hash256;

class Network extends BasicNetwork
{
  public static $MAINNET;

  public static $TESTNET;

  public static $NETWORKS;

  public $generationHashSeed;

  const BASE32_RFC4648_ALPHABET = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ234567';

  public function __construct(string $name, int $identifier, DateTime $epochTime, Hash256 $generationHashSeed)
  {
    parent::__construct(
      $name,
      $identifier,
      new NetworkTimestampDatetimeConverter($epochTime, 'milliseconds'),
      'sha3-256',
      function ($addressWithoutChecksum, $checksum) {
        return new Address($addressWithoutChecksum . substr($checksum, 0, 3));
      },
      Address::class,
      NetworkTimestamp::class
    );

    $this->generationHashSeed = $generationHashSeed;
  }

  /**
   * Initialize MAINNET and TESTNET networks
   */
  public static function initialize()
  {
    self::$MAINNET = new Network(
      'mainnet',
      0x68,
      new DateTime('2021-03-16T00:06:25Z'),
      new Hash256('57F7DA205008026C776CB6AED843393F04CD458E0AA2D9F1D5F31A402072B2D6')
    );

    self::$TESTNET = new Network(
      'testnet',
      0x98,
      new DateTime('2022-10-31T21:07:47Z'),
      new Hash256('49D6E1CE276A85B70EAFE52349AACCA389302E7A9754BCF1221E79494FC665A4')
    );

    self::$NETWORKS = [self::$MAINNET, self::$TESTNET];
  }

  public function isValidAddressString($addressString) {
		if ($this->_addressClass->getConstant('ENCODED_SIZE') !== strlen($addressString))
			return false;

		for ($i = 0; $i < strlen($addressString); ++$i) {
      if (strpos(self::BASE32_RFC4648_ALPHABET, $addressString[$i]) === false)
				return false;
		}
		return $this->isValidAddress($this->_addressClass->newInstance($addressString));
	}

  public function isValidAddress(BinaryData $address): bool{
    if(Converter::binaryToInt($address->binaryData[0], 1) != $this->identifier)
      return false;
    $hash = hash($this->_addressHasher, substr($address->binaryData, 0, 1 + 20 ), true);
    $checkSumFromAddress = substr($address->binaryData, 1 + 20);
    $calculatedChecksum = substr($hash, 0, strlen($checkSumFromAddress));
    for ($i = 0; $i < strlen($checkSumFromAddress); ++$i) {
			if ($checkSumFromAddress[$i] != $calculatedChecksum[$i])
				return false;
		}
		return true;
  }

  public function toDatetime(NetworkTimestamp $referenceNetworkTimestamp) {
		return $this->datetimeConverter->toDatetime($referenceNetworkTimestamp->timestamp);
	}

  public function fromDatetime(DateTime $referenceDatetime) {
		return $this->networkTimestampClass->newInstance($this->datetimeConverter->toDifference($referenceDatetime));
	}

  public function __toString()
  {
    return $this->name;
  }
}
