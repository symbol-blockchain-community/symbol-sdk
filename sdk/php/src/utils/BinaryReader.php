<?php

namespace SymbolSdk\Utils;

use InvalidArgumentException;
use OverflowException;

class BinaryReader
{
  private string $binaryData;
  private int $position;

  public function __construct(string $binaryData)
  {
    $this->binaryData = $binaryData;
    $this->position = 0;
  }

  public function read($length): string
  {
    $data = substr($this->binaryData, $this->position, $length);
    $this->position += $length;
    return $data;
  }

  public function advance(int $length): void
  {
    $this->position += $length;
  }

  public function retreat(int $length): void
  {
    $this->position -= $length;
    if ($this->position < 0) {
      $this->position = 0;
    }
  }

  public function getPosition(): int
  {
    return $this->position;
  }

  public function setPosition(int $position): void
  {
    if ($position < 0 || $position > strlen($this->binaryData)) {
      throw new InvalidArgumentException('Invalid position.');
    }
    $this->position = $position;
  }

  public function getBinaryData(): string
  {
    return $this->binaryData;
  }

  public function readRemaining(): string
  {
    $remaining = substr($this->binaryData, $this->position);
    return $remaining;
  }

  public function getLength(): int
  {
    return strlen($this->binaryData);
  }

  public function getRemainingLength(): int
  {
    return strlen($this->binaryData) - $this->position;
  }
}