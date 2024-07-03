<?php

namespace SymbolSdk\Symbol;

use SymbolSdk\Facade\SymbolFacade;
use SymbolSdk\CryptoTypes\PublicKey;
use SymbolSdk\Symbol\Models\UnresolvedAddress;
use SymbolSdk\Symbol\Models\PublicKey as ModelsPublicKey;

/**
 * Symbol public account.
 */
class SymbolPublicAccount
{
  protected SymbolFacade $_facade;
  public PublicKey|ModelsPublicKey $publicKey;
  public UnresolvedAddress $address;

  /**
   * Creates a Symbol public account.
   * @param SymbolFacade facade Symbol facade.
   * @param PublicKey publicKey Account public key.
   */
  public function __construct(SymbolFacade $facade, PublicKey|ModelsPublicKey $publicKey)
  {
    $this->_facade = $facade;
    $this->publicKey = new ModelsPublicKey($publicKey->binaryData);
    $this->address = $this->_facade->network->publicKeyToAddress($this->publicKey);
  }
}
