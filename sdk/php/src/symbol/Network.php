<?php

namespace SymbolSdk\Symbol;

require_once __DIR__ . '/../Network.php';
require_once __DIR__ . '/../BinaryData.php';
require_once __DIR__ . '/../utils/converter.php';
require_once __DIR__ . '/../NetworkTimestamp.php';

use SymbolSdk\BinaryData;
use SymbolSdk\Network as BasicNetwork;
use SymbolSdk\Utils;
use SymbolSdk\NetworkTimestampDatetimeConverter;

use DateTime;

class Address extends BinaryData
{
  static $SIZE = 24;

  static $ENCODED_SIZE = 39;

  static $NAME = 'Address';

  public function __construct($addressInput)
  {
    if (mb_check_encoding($addressInput, 'UTF-8')) {
      $addressInput = Utils\addressToBinary($addressInput);
    } else if ($addressInput instanceof Address) {
      $addressInput = $addressInput->binaryData;
    };
    parent::__construct(self::$SIZE, $addressInput);
  }
}

class Network extends BasicNetwork
{
  /**
   * @var Network MAINNET
   */
  public static $MAINNET;

  /**
   * @var Network TESTNET
   */
  public static $TESTNET;

  /**
   * @var Network[] NETWORKS
   */
  public static $NETWORKS;

  /**
   * @var Hash256
   */
  public $generationHashSeed;

  /**
   * Network constructor.
   * @param string $name Network name
   * @param int $identifier Network identifier byte
   * @param DateTime $epochTime Network epoch time
   * @param callable $generationHashSeedCallback Network generation hash seed callback
   * @param callable $addressConstructor Address constructor callback
   * @param string $addressClass Address class name
   * @param string $networkTimestampClass NetworkTimestamp class name
   */
  public function __construct($name, $identifier, $epochTime, $generationHashSeed)
  {
    parent::__construct(
      $name,
      $identifier,
      new NetworkTimestampDatetimeConverter($epochTime->getTimestamp() * 1000, 'milliseconds'),
      $generationHashSeed,
      function ($addressWithoutChecksum, $checksum) {
        return new Address($addressWithoutChecksum . substr($checksum, 0, 3));
      },
      'Address',
      'NetworkTimestamp'
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
