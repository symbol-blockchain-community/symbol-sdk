<?php

namespace SymbolSdk;

use DateTime;

class NetworkTimestampDatetimeConverter
{
  public $epoc;
  public $timeUnits;

  public function __construct($epoch, $timeUnits)
  {
    $this->epoc = $epoch;
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
}
