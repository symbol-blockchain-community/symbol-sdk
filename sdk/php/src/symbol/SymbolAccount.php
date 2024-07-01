<?php
namespace SymbolSdk\Symbol;

use SymbolSdk\Facade\SymbolFacade;
use SymbolSdk\Symbol\KeyPair;
use SymbolSdk\Symbol\SymbolPublicAccount;
use SymbolSdk\Symbol\MessageEncoder;
use SymbolSdk\Symbol\Models\Transaction;

class SymbolAccount extends SymbolPublicAccount {
  public KeyPair $keyPair;

  public function __construct(SymbolFacade $facade, KeyPair $keyPair)
  {
    parent::__construct($facade, $keyPair->publicKey());
    $this->keyPair = $keyPair;
  }

  public function messageEncoder(){
    return new MessageEncoder(($this->keyPair));
  }

  public function signTransaction(Transaction $transaction){
    return $this->_facade->signTransaction($this->keyPair, $transaction);
  }

  public function cosignTransaction(Transaction $transaction, bool $detached = false){
    return $this->_facade->cosignTransaction($this->keyPair, $transaction, $detached);
  }
}