<?php
namespace SymbolSdk\Impl;

require_once __DIR__ . '/../../vendor/autoload.php';

use SymbolSdk\Impl\External\TweetNaclFastSymbol;
use SymbolSdk\Symbol\KeyPair;
use SymbolSdk\Utils\ArrayHelpers;
use SymbolSdk\Utils\Converter;

class Ed25519 {
  static function isCanonicalS($encodedS) {
    $encodedS = Converter::binaryToArray($encodedS);
    $reducedEncodedS = array_merge($encodedS, array_fill(0, 32, 0));
    TweetNaclFastSymbol::reduce($reducedEncodedS);

    // Compare the first 32 bytes of $encodedS with $reducedEncodedS
    return 0 === ArrayHelpers::deepCompare($encodedS, array_slice($reducedEncodedS, 0, 32));
  }

  static function keyPairFromSeed($seed, $hashMode) {
    TweetNaclFastSymbol::init();
    return TweetNaclFastSymbol::nacl_sign_keyPair_fromSeed($seed, $hashMode);
  }

  static function sign(string $message, $keyPair, string $hashMode){
    TweetNaclFastSymbol::init();
    return TweetNaclFastSymbol::nacl_sign_detached($message, $keyPair['secretKey'], $hashMode);
  }

  static function verify($message, $signature, $publicKey, $hashMode)
  {
    TweetNaclFastSymbol::init();
    return TweetNaclFastSymbol::nacl_sign_detached_verify($message, $signature, $publicKey, $hashMode)
    && self::isCanonicalS(substr($signature, 32, 64));
  }
}