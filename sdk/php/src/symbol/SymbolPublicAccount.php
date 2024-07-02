<?php
namespace SymbolSdk\Symbol;

use SymbolSdk\Facade\SymbolFacade;
use SymbolSdk\CryptoTypes\PublicKey;
use SymbolSdk\Symbol\Address;

/**
 * Symbol public account.
 */
class SymbolPublicAccount {
  protected SymbolFacade $_facade;
  public PublicKey $publicKey;
  public Address $address;

  /**
	 * Creates a Symbol public account.
	 * @param SymbolFacade facade Symbol facade.
	 * @param PublicKey publicKey Account public key.
	 */
  public function __construct(SymbolFacade $facade, PublicKey $publicKey)
  {
    $this->_facade = $facade;
    $this->publicKey = $publicKey;
    $this->address = $this->_facade->network->publicKeyToAddress($this->publicKey);
  }
}