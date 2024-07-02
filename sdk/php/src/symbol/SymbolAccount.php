<?php

namespace SymbolSdk\Symbol;

use SymbolSdk\Facade\SymbolFacade;
use SymbolSdk\Symbol\KeyPair;
use SymbolSdk\Symbol\SymbolPublicAccount;
use SymbolSdk\Symbol\MessageEncoder;
use SymbolSdk\Symbol\Models;
use SymbolSdk\CryptoTypes\Signature;

/**
 * Symbol account.
 */
class SymbolAccount extends SymbolPublicAccount
{
  public KeyPair $keyPair;

  /**
   * Creates a Symbol account.
   * @param SymbolFacade facade Symbol facade.
   * @param KeyPair keyPair Account key pair.
   */
  public function __construct(SymbolFacade $facade, KeyPair $keyPair)
  {
    parent::__construct($facade, $keyPair->publicKey());
    $this->keyPair = $keyPair;
  }

  /**
   * Creates a message encoder that can be used for encrypting and encoding messages between two parties.
   * @return MessageEncoder Message encoder using this account as one party.
   */
  public function messageEncoder()
  {
    return new MessageEncoder(($this->keyPair));
  }

  /**
   * Signs a Symbol transaction.
   * @param Models\Transaction transaction Transaction object.
   * @return Signature Transaction signature.
   */
  public function signTransaction(Models\Transaction $transaction): Signature
  {
    return $this->_facade->signTransaction($this->keyPair, $transaction);
  }

  /**
   * Cosigns a Symbol transaction.
   * @param Models\Transaction transaction Transaction object.
   * @param bool detached \c true if resulting cosignature is appropriate for network propagation.
   *                           \c false if resulting cosignature is appropriate for attaching to an aggregate.
   * @return Models\Cosignature|Models\DetachedCosignature Signed cosignature.
   */
  public function cosignTransaction(Models\Transaction $transaction, bool $detached = false)
  {
    return $this->_facade->cosignTransaction($this->keyPair, $transaction, $detached);
  }
}
