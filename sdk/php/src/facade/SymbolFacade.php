<?php

namespace SymbolSdk\Facade;

use DateTime;
use SymbolSdk\Symbol\Network;
use SymbolSdk\CryptoTypes\Signature;
use SymbolSdk\CryptoTypes\PublicKey;
use SymbolSdk\CryptoTypes\Hash256;
use SymbolSdk\CryptoTypes\PrivateKey;
use SymbolSdk\Symbol\Models\TransactionType;
use SymbolSdk\Symbol\Models\Cosignature;
use SymbolSdk\Symbol\Models\DetachedCosignature;
use SymbolSdk\Symbol\Models\PublicKey as ModelsPublicKey;
use SymbolSdk\Network\NetworkLocator;
use SymbolSdk\Symbol\KeyPair;
use SymbolSdk\Symbol\Models\Signature as ModelsSignature;
use SymbolSdk\Symbol\Models\Transaction;
use SymbolSdk\Symbol\SymbolPublicAccount;
use SymbolSdk\Symbol\SymbolAccount;
use SymbolSdk\Symbol\Verifier;
use SymbolSdk\Utils\Converter;

class SymbolFacade
{
	private static function isAggregateTransaction(string $transactionBuffer): bool {
    $TRANSACTION_HEADER_SIZE = 4 + 4 + Signature::$SIZE + PublicKey::$SIZE + 4;
    $transactionTypeOffset = $TRANSACTION_HEADER_SIZE + 2; // skip version and network byte
    $transactionType = (ord($transactionBuffer[$transactionTypeOffset + 1]) << 8) + ord($transactionBuffer[$transactionTypeOffset]);
    $aggregateTypes = [TransactionType::AGGREGATE_BONDED, TransactionType::AGGREGATE_COMPLETE];
    return in_array($transactionType, $aggregateTypes, true);
	}

	private static function transactionDataBuffer(string $transactionBuffer): string {
		$TRANSACTION_HEADER_SIZE = 4 + 4 + Signature::$SIZE + PublicKey::$SIZE + 4;
		$AGGREGATE_HASHED_SIZE = 4 + 8 + 8 + Hash256::$SIZE;
		$dataBufferStart = $TRANSACTION_HEADER_SIZE;
		$dataBufferEnd = self::isAggregateTransaction($transactionBuffer)
			? $TRANSACTION_HEADER_SIZE + $AGGREGATE_HASHED_SIZE
			: strlen($transactionBuffer);
		return substr($transactionBuffer, $dataBufferStart, $dataBufferEnd - $dataBufferStart);
	}

	const BIP32_CURVE_NAME = 'ed25519';

	public Network $network;

	public function __construct($network)
	{
		Network::initialize();
		$this->network = gettype($network) == 'string' ? NetworkLocator::findByName(Network::$NETWORKS, $network) : $network;
	}

	public function now(){
		return $this->network->fromDatetime(new DateTime());
	}

	public function createPublicAccount(PublicKey $publicKey){
		return new SymbolPublicAccount($this, $publicKey);
	}

	public function createAccount(PrivateKey $privateKey){
		return new SymbolAccount($this, new KeyPair($privateKey));
	}

	public function hashTransaction(Transaction $transaction): Hash256{
		$hasher = hash_init('sha3-256');
    hash_update($hasher, $transaction->signature->binaryData);
		hash_update($hasher, $transaction->signerPublicKey->binaryData);
    hash_update($hasher, $this->network->generationHashSeed->binaryData);
		hash_update($hasher, self::transactionDataBuffer($transaction->serialize()));
    $digest = hash_final($hasher, true);
		return new Hash256($digest);
	}

	public function signTransaction(KeyPair $keyPair, Transaction $transaction): Signature {
		var_dump(strtoupper(bin2hex($this->network->generationHashSeed->binaryData)));
		var_dump(strtoupper(bin2hex(self::transactionDataBuffer($transaction->serialize()))));
		return $keyPair->sign($this->network->generationHashSeed->binaryData . self::transactionDataBuffer($transaction->serialize()));
	}

	public function verifyTransaction(Transaction $transaction, Signature $signature): bool {
		$verifyBuffer = $this->network->generationHashSeed->binaryData . self::transactionDataBuffer($transaction->serialize());
		$verifier = new Verifier($transaction->signerPublicKey);
		return $verifier->verify($verifyBuffer, $signature);
	}

	public function cosignTransaction(KeyPair $keyPair, Transaction $transaction, bool $detached = false){
		$transactionHash = $this->hashTransaction($transaction);
		$initializeCosignature = function(Cosignature &$cosignature) use ($keyPair, $transactionHash) {
			$cosignature->version = 0;
			$cosignature->signerPublicKey = new ModelsPublicKey($keyPair->publicKey()->binaryData);
			$cosignature->signature = new ModelsSignature($keyPair->sign($transactionHash));
		};

		if($detached) {
			$cosignature = new DetachedCosignature();
			$cosignature->parentHash = new Hash256($transactionHash);
			$initializeCosignature($cosignature);
			return $cosignature;
		}

		$cosignature = new Cosignature();
		$initializeCosignature($cosignature);
		return $cosignature;
	}

	public static function attachSignature(Transaction &$transaction, Signature $signature, bool $isPlainPayload = false){
		$transaction->signature = new ModelsSignature($signature->binaryData);
		$transactionBuffer = $transaction->serialize();
    $hexPayload = strtoupper(bin2hex($transactionBuffer));
    return $isPlainPayload ? $hexPayload : json_encode(['payload' => $hexPayload]);
	}
}
