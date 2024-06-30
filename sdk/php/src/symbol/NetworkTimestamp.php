<?php
namespace SymbolSdk\Symbol;

use SymbolSdk\Network\NetworkTimestamp as BasicNetworkTimestamp;

class NetworkTimestamp extends BasicNetworkTimestamp{
  public function addMilliseconds(int $count){
    return new self($this->timestamp + $count);
  }

  public function addSeconds(int $count){
    return $this->addMilliseconds(1000 * $count);
  }

  public function addHours(int $count){
    return $this->addMinutes(60 * $count);
  }
}