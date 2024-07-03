<?php

namespace SymbolSdk\Symbol;

use SymbolSdk\Network\NetworkTimestamp as BasicNetworkTimestamp;

/**
 * Represents a Symbol network timestamp with millisecond resolution.
 */
class NetworkTimestamp extends BasicNetworkTimestamp
{
  /**
   * Adds a specified number of milliseconds to this timestamp.
   * @param {number|bigint} count Number of milliseconds to add.
   * @returns {NetworkTimestamp} New timestamp that is the specified number of milliseconds past this timestamp.
   */
  public function addMilliseconds(int $count)
  {
    return new self($this->timestamp + $count);
  }

  /**
   * Adds a specified number of seconds to this timestamp.
   * @override
   * @param {number|bigint} count Number of seconds to add.
   * @returns {NetworkTimestamp} New timestamp that is the specified number of seconds past this timestamp.
   */
  public function addSeconds(int $count): NetworkTimestamp
  {
    return $this->addMilliseconds(1000 * $count);
  }
}
