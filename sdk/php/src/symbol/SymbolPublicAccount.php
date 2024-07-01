<?php
namespace SymbolSdk\Symbol;

use SymbolSdk\Facade\SymbolFacade;
use SymbolSdk\CryptoTypes\PublicKey;
use SymbolSdk\Symbol\Address;

class SymbolPublicAccount {
  protected SymbolFacade $_facade;
  public PublicKey $publicKey;
  public Address $address;

  public function __construct(SymbolFacade $facade, PublicKey $publicKey)
  {
    $this->_facade = $facade;
    $this->publicKey = $publicKey;
    $this->address = $this->_facade->network->publicKeyToAddress($this->publicKey);
  }
}