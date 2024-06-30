<?php

namespace SymbolSdk\Network;

use Error;

class NetworkTimestamp
{
  public int $timestamp;

  public function __construct(int $timestamp)
  {
    $this->timestamp = $timestamp;
  }

  public function isEpochal(){
    return 0 == $this->timestamp;
  }

  public function addSeconds(int $count){
    throw new Error('`addSeconds` must be implemented by concrete class');
  }

  public function addMinutes(int $count){
    return $this->addSeconds(60 * $count);
  }

  public function addHours(int $count){
    return $this->addMinutes(60 * $count);
  }

  public function __toString()
  {
    return $this->timestamp; 
  }
}
