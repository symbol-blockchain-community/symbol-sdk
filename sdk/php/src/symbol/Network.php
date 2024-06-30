<?php

namespace SymbolSdk\Symbol;

use SymbolSdk\BinaryData;
use SymbolSdk\Network\Network as BasicNetwork;
use SymbolSdk\Utils\Converter;
use SymbolSdk\Symbol\Address;
use SymbolSdk\Network\NetworkTimestampDatetimeConverter;
use SymbolSdk\Network\NetworkTimestamp;
use DateTime;


class Network extends BasicNetwork
{
  public static $MAINNET;

  public static $TESTNET;

  public static $NETWORKS;

  public $generationHashSeed;

  public function __construct($name, $identifier, $epochTime, $generationHashSeed)
  {
    parent::__construct(
      $name,
      $identifier,
      new NetworkTimestampDatetimeConverter($epochTime, 'milliseconds'),
      $generationHashSeed,
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
      'sha3-256'
    );

    self::$TESTNET = new Network(
      'testnet',
      0x98,
      new DateTime('2022-10-31T21:07:47Z'),
      'sha3-256'
    );

    self::$NETWORKS = [self::$MAINNET, self::$TESTNET];
  }
}
