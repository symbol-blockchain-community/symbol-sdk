<?php

namespace SymbolSdk\Facade;

use SymbolSdk\Symbol\Network;
use SymbolSdk\CryptoTypes\Signature;
use SymbolSdk\CryptoTypes\PublicKey;
use SymbolSdk\CryptoTypes\Hash256;
use SymbolSdk\Symbol\Address;
use SymbolSdk\Symbol\Models;
use SymbolSdk\Network\NetworkLocator;

class SymbolFacade
{
	const TRANSACTION_HEADER_SIZE = 4 + 4 + Signature::$SIZE + PublicKey::$SIZE + 4;
	const AGGREGATE_HASHED_SIZE = 4 + 8 + 8 + Hash256::$SIZE;

	private static function isAggregateTransaction($transactionBuffer) {
			$transactionTypeOffset = self::TRANSACTION_HEADER_SIZE + 2; // skip version and network byte
			$transactionType = ($transactionBuffer[$transactionTypeOffset + 1] << 8) + $transactionBuffer[$transactionTypeOffset];
			$aggregateTypes = [Models\TransactionType::AGGREGATE_BONDED, Models\TransactionType::AGGREGATE_COMPLETE];
			return in_array($transactionType, $aggregateTypes, true);
	}

	private static function transactionDataBuffer($transactionBuffer) {
		$dataBufferStart = self::TRANSACTION_HEADER_SIZE;
		$dataBufferEnd = self::isAggregateTransaction($transactionBuffer)
				? self::TRANSACTION_HEADER_SIZE + self::AGGREGATE_HASHED_SIZE
				: count($transactionBuffer);

		return array_slice($transactionBuffer, $dataBufferStart, $dataBufferEnd - $dataBufferStart);
	}

	const BIP32_CURVE_NAME = 'ed25519';

	public $network;

	public function __construct($network)
	{
		Network::initialize();
		$this->network = gettype($network) == 'string' ? NetworkLocator::findByName(Network::$NETWORKS, $network) : $network;
	}
}
