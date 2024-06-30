<?php

namespace SymbolSdk\Network;

use DateTime;
use RangeException;

class NetworkTimestampDatetimeConverter
{
  public DateTime $epoch;
  public $timeUnits;

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

  public function toDatetime(int $rawTimestamp){
    return DateTime::createFromFormat('U', $this->epoch->getTimestamp() + $rawTimestamp * $this->timeUnits);
  }

  public function toDifference(DateTime $referenceDatetime){
    if ($referenceDatetime < $this->epoch)
			throw new RangeException('timestamp cannot be before epoch');

    $differenceMilliseconds = $referenceDatetime->getTimestamp() - $this->epoch->getTimestamp();
    return floor($differenceMilliseconds / $this->timeUnits);
  }
}
