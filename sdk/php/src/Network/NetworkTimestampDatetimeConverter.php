<?php

namespace SymbolSdk\Network;

use DateTime;
use RangeException;

/**
 * Provides utilities for converting between network timestamps and datetimes.
 */
class NetworkTimestampDatetimeConverter
{
  public DateTime $epoch;
  public $timeUnits;

  /**
   * Creates a converter given an epoch and base time units.
   * @param DateTime epoch Date at which network started.
   * @param string timeUnits Time unit the network uses for progressing.
   */
  public function __construct($epoch, $timeUnits)
  {
    $this->epoch = $epoch;
    switch ($timeUnits) {
      case 'hours':
        $this->timeUnits = 60 * 60 * 1000;
        break;
      case 'minutes':
        $this->timeUnits = 60 * 1000;
        break;
      case 'seconds':
        $this->timeUnits = 1000;
        break;
      case 'milliseconds':
        $this->timeUnits = 1;
        break;
    }
  }

  /**
   * Converts a network timestamp to a datetime.
   * @param int rawTimestamp Raw network timestamp.
   * @return DateTime Date representation of the network timestamp.
   */
  public function toDatetime(int $rawTimestamp): DateTime
  {
    return DateTime::createFromFormat('U', $this->epoch->getTimestamp() + $rawTimestamp * $this->timeUnits);
  }

  private static function getMilliSeconds(DateTime $dateTime): int
  {
    $timestampInSeconds = $dateTime->getTimestamp();
    $microseconds = (int) $dateTime->format('u');
    return $timestampInSeconds * 1000 + (int) ($microseconds / 1000);
  }

  /**
   * Subtracts the network epoch from the reference date.
   * @param DateTime referenceDatetime Reference date.
   * @return int Number of network time units between the reference date and the network epoch.
   */
  public function toDifference(DateTime $referenceDatetime): int
  {
    if ($referenceDatetime < $this->epoch)
      throw new RangeException('timestamp cannot be before epoch');

    $differenceMilliseconds = self::getMilliSeconds($referenceDatetime) - self::getMilliSeconds($this->epoch);
    return floor($differenceMilliseconds / $this->timeUnits);
  }
}
