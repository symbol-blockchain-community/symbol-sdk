<?php

namespace SymbolSdk\Symbol;

use SymbolSdk\Network\Network as BasicNetwork;

use SymbolSdk\Symbol\Address;
use SymbolSdk\Network\NetworkTimestampDatetimeConverter;
use SymbolSdk\Symbol\NetworkTimestamp;
use SymbolSdk\CryptoTypes\Hash256;
use DateTime;
use SymbolSdk\Symbol\Models\UnresolvedAddress;

/**
 * Represents a Symbol network.
 */
class Network extends BasicNetwork
{
  public static $MAINNET;

  public static $TESTNET;

  public static $NETWORKS;

  public $generationHashSeed;

  /**
   * Creates a new network with the specified name, identifier byte and generation hash seed.
   * @param string name Network name.
   * @param int identifier Network identifier byte.
   * @param DateTime epochTime Network epoch time.
   * @param Hash256 generationHashSeed Network generation hash seed.
   */
  public function __construct(string $name, int $identifier, DateTime $epochTime, Hash256 $generationHashSeed)
  {
    parent::__construct(
      $name,
      $identifier,
      new NetworkTimestampDatetimeConverter($epochTime, 'milliseconds'),
      'sha3-256',
      function ($addressWithoutChecksum, $checksum) {
        return new UnresolvedAddress($addressWithoutChecksum . substr($checksum, 0, 3));
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
}
