<?php

namespace SymbolSdk\Facade;

use DateTime;
use SymbolSdk\Symbol\Network;
use SymbolSdk\CryptoTypes\Signature;
use SymbolSdk\CryptoTypes\PublicKey;
use SymbolSdk\CryptoTypes\Hash256;
use SymbolSdk\CryptoTypes\PrivateKey;
use SymbolSdk\CryptoTypes\SharedKey256;
use SymbolSdk\Symbol\Models;
use SymbolSdk\Network\NetworkLocator;
use SymbolSdk\Symbol\KeyPair;
use SymbolSdk\Symbol\SymbolPublicAccount;
use SymbolSdk\Symbol\SymbolAccount;
use SymbolSdk\Symbol\Verifier;
use SymbolSdk\Symbol\Address;
use SymbolSdk\Symbol\SharedKeySymbol;
use SymbolSdk\Symbol\NetworkTimestamp;

/**
 * Facade used to interact with Symbol blockchain.
 */
class SymbolFacade
{
	/**
	 * Network address class type.
	 *
	 * @var string The fully qualified class name of Address
	 */
	public static string $Address = Address::class;

	/**
	 * Network key pair class type.
	 *
	 * @var string The fully qualified class name of KeyPair
	 */
	public static string $KeyPair = KeyPair::class;

	/**
	 * Network verifier class type.
	 *
	 * @var string The fully qualified class name of Verifier
	 */
	public static string $Verifier = Verifier::class;

	/**
	 * Derives shared key from key pair and other party's public key.
	 *
	 * @param KeyPair $keyPair Key pair.
	 * @param PublicKey $otherPublicKey Other party's public key.
	 * @return SharedKey256 Shared encryption key.
	 */
	public static function deriveSharedKey(KeyPair $keyPair, PublicKey $otherPublicKey): SharedKey256
	{
		return SharedKeySymbol::deriveSharedKey($keyPair, $otherPublicKey);
	}

	private static function isAggregateTransaction(string $transactionBuffer): bool
	{
		$TRANSACTION_HEADER_SIZE = 4 + 4 + Signature::$SIZE + PublicKey::$SIZE + 4;
		$transactionTypeOffset = $TRANSACTION_HEADER_SIZE + 2; // skip version and network byte
		$transactionType = (ord($transactionBuffer[$transactionTypeOffset + 1]) << 8) + ord($transactionBuffer[$transactionTypeOffset]);
		$aggregateTypes = [Models\TransactionType::AGGREGATE_BONDED, Models\TransactionType::AGGREGATE_COMPLETE];
		return in_array($transactionType, $aggregateTypes, true);
	}

	private static function transactionDataBuffer(string $transactionBuffer): string
	{
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

	/**
	 * Creates a Symbol facade.
	 * @param string|Network network Symbol network or network name.
	 */
	public function __construct($network)
	{
		Network::initialize();
		$this->network = gettype($network) == 'string' ? NetworkLocator::findByName(Network::$NETWORKS, $network) : $network;
	}

	/**
	 * Gets class type.
	 * @return SymbolFacade Class type.
	 */
	public function static(): string
	{
		return self::class;
	}

	/**
	 * Creates a network timestamp representing the current time.
	 * @return NetworkTimestamp Network timestamp representing the current time.
	 */
	public function now(): NetworkTimestamp
	{
		return $this->network->fromDatetime(new DateTime());
	}

	/**
	 * Creates a Symbol public account from a public key.
	 * @param PublicKey publicKey Account public key.
	 * @return SymbolPublicAccount Symbol public account.
	 */
	public function createPublicAccount(PublicKey $publicKey): SymbolPublicAccount
	{
		return new SymbolPublicAccount($this, $publicKey);
	}

	/**
	 * Creates a Symbol account from a private key.
	 * @param PrivateKey privateKey Account private key.
	 * @return SymbolAccount Symbol account.
	 */
	public function createAccount(PrivateKey $privateKey): SymbolAccount
	{
		return new SymbolAccount($this, new KeyPair($privateKey));
	}

	/**
	 * Hashes a Symbol transaction.
	 * @param Models\Transaction transaction Transaction object.
	 * @return Hash256 Transaction hash.
	 */
	public function hashTransaction(Models\Transaction $transaction): Hash256
	{
		$hasher = hash_init('sha3-256');
		hash_update($hasher, $transaction->signature->binaryData);
		hash_update($hasher, $transaction->signerPublicKey->binaryData);
		hash_update($hasher, $this->network->generationHashSeed->binaryData);
		hash_update($hasher, self::transactionDataBuffer($transaction->serialize()));
		$digest = hash_final($hasher, true);
		return new Hash256($digest);
	}

	/**
	 * Signs a Symbol transaction.
	 * @param KeyPair keyPair Key pair.
	 * @param Models\Transaction transaction Transaction object.
	 * @return Signature Transaction signature.
	 */
	public function signTransaction(KeyPair $keyPair, Models\Transaction $transaction): Signature
	{
		var_dump(strtoupper(bin2hex($this->network->generationHashSeed->binaryData)));
		var_dump(strtoupper(bin2hex(self::transactionDataBuffer($transaction->serialize()))));
		return $keyPair->sign($this->network->generationHashSeed->binaryData . self::transactionDataBuffer($transaction->serialize()));
	}

	/**
	 * Verifies a Symbol transaction.
	 * @param Models\Transaction transaction Transaction object.
	 * @param Signature signature Signature to verify.
	 * @return bool \c true if transaction signature is verified.
	 */
	public function verifyTransaction(Models\Transaction $transaction, Signature $signature): bool
	{
		$verifyBuffer = $this->network->generationHashSeed->binaryData . self::transactionDataBuffer($transaction->serialize());
		$verifier = new Verifier($transaction->signerPublicKey);
		return $verifier->verify($verifyBuffer, $signature);
	}

	/**
	 * Cosigns a Symbol transaction.
	 * @param KeyPair keyPair Key pair of the cosignatory.
	 * @param Models\Transaction transaction Transaction object.
	 * @param bool detached \c true if resulting cosignature is appropriate for network propagation.
	 *                           \c false if resulting cosignature is appropriate for attaching to an aggregate.
	 * @return Models\Cosignature|Models\DetachedCosignature Signed cosignature.
	 */
	public function cosignTransaction(KeyPair $keyPair, Models\Transaction $transaction, bool $detached = false): Models\Cosignature|Models\DetachedCosignature
	{
		$transactionHash = $this->hashTransaction($transaction);
		$initializeCosignature = function (Models\Cosignature &$cosignature) use ($keyPair, $transactionHash) {
			$cosignature->version = 0;
			$cosignature->signerPublicKey = new Models\PublicKey($keyPair->publicKey()->binaryData);
			$cosignature->signature = new Models\Signature($keyPair->sign($transactionHash));
		};

		if ($detached) {
			$cosignature = new Models\DetachedCosignature();
			$cosignature->parentHash = new Hash256($transactionHash);
			$initializeCosignature($cosignature);
			return $cosignature;
		}

		$cosignature = new Models\Cosignature();
		$initializeCosignature($cosignature);
		return $cosignature;
	}

	/**
	 * Attaches a signature to a transaction.
	 * @param Models\Transaction transaction Transaction object.
	 * @param Signature signature Signature to attach.
	 * @return string JSON transaction payload.
	 */
	public static function attachSignature(Models\Transaction &$transaction, Signature $signature, bool $isPlainPayload = false): string
	{
		$transaction->signature = new Models\Signature($signature->binaryData);
		$transactionBuffer = $transaction->serialize();
		$hexPayload = strtoupper(bin2hex($transactionBuffer));
		return $isPlainPayload ? $hexPayload : json_encode(['payload' => $hexPayload]);
	}
}
