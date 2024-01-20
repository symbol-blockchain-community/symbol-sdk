<?php
namespace utils;
class Converter {
  public static function bytesToInt($bytes) {
    $int64 = unpack('P', $bytes)[1];
    return $int64;
  }

  public static function intToBytes($int64) {
    $bytes = pack('P', $int64);
    return $bytes;
  }
}
?>