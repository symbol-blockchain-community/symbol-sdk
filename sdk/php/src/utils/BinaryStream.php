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

class BinaryWriter
{
  private string $binaryData;
  private int $position;

  public function __construct(int $size)
  {
    $this->binaryData = str_repeat("\0", $size);
    $this->position = 0;
  }

  public function write(string $data): void
  {
    $length = strlen($data);
    if ($this->position + $length > strlen($this->binaryData)) {
      throw new OverflowException('Writing beyond the buffer size.');
    }

    for ($i = 0; $i < $length; $i++) {
      $this->binaryData[$this->position + $i] = $data[$i];
    }

    $this->position += $length;
  }

  public function advance(int $length): void
  {
    $this->position += $length;
    if ($this->position > strlen($this->binaryData)) {
      throw new OverflowException('Advancing beyond the buffer size.');
    }
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

  public function getRemainingLength(): int
  {
    return strlen($this->binaryData) - $this->position;
  }
}
