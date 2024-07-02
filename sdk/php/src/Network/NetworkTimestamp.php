<?php

namespace SymbolSdk\Network;

use Error;

/**
 * Represents a network timestamp.
 */
class NetworkTimestamp
{
  public int $timestamp;

  /**
   * Creates a timestamp.
   * @param int timestamp Raw network timestamp.
   */
  public function __construct(int $timestamp)
  {
    $this->timestamp = $timestamp;
  }

  /**
   * Determines if this is the epochal timestamp.
   * @return bool \c true if this is the epochal timestamp.
   */
  public function isEpochal(): bool
  {
    return 0 == $this->timestamp;
  }

  /**
   * Adds a specified number of seconds to this timestamp.
   * @abstract
   * @param int count Number of seconds to add.
   * @return NetworkTimestamp New timestamp that is the specified number of seconds past this timestamp.
   */
  public function addSeconds(int $count): NetworkTimestamp
  {
    throw new Error('`addSeconds` must be implemented by concrete class');
  }

  /**
   * Adds a specified number of minutes to this timestamp.
   * @param int count Number of minutes to add.
   * @return NetworkTimestamp New timestamp that is the specified number of minutes past this timestamp.
   */
  public function addMinutes(int $count): NetworkTimestamp
  {
    return $this->addSeconds(60 * $count);
  }

  /**
   * Adds a specified number of hours to this timestamp.
   * @param int count Number of hours to add.
   * @return NetworkTimestamp New timestamp that is the specified number of hours past this timestamp.
   */
  public function addHours(int $count): NetworkTimestamp
  {
    return $this->addMinutes(60 * $count);
  }

  /**
   * Returns string representation of this object.
   * @return string String representation of this object
   */
  public function __toString(): string
  {
    return $this->timestamp;
  }
}
