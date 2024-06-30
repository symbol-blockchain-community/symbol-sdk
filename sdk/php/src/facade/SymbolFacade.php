<?php

namespace SymbolSdk\Facade;

use DateTime;
use SymbolSdk\Symbol\Network;
use SymbolSdk\CryptoTypes\Signature;
use SymbolSdk\CryptoTypes\PublicKey;
use SymbolSdk\CryptoTypes\Hash256;
use SymbolSdk\Symbol\Models;
use SymbolSdk\Network\NetworkLocator;

class SymbolFacade
{
	private static function isAggregateTransaction($transactionBuffer) {
			$TRANSACTION_HEADER_SIZE = 4 + 4 + Signature::$SIZE + PublicKey::$SIZE + 4;
			$transactionTypeOffset = $TRANSACTION_HEADER_SIZE + 2; // skip version and network byte
			$transactionType = ($transactionBuffer[$transactionTypeOffset + 1] << 8) + $transactionBuffer[$transactionTypeOffset];
			$aggregateTypes = [Models\TransactionType::AGGREGATE_BONDED, Models\TransactionType::AGGREGATE_COMPLETE];
			return in_array($transactionType, $aggregateTypes, true);
	}

	private static function transactionDataBuffer($transactionBuffer) {
		$TRANSACTION_HEADER_SIZE = 4 + 4 + Signature::$SIZE + PublicKey::$SIZE + 4;
		$AGGREGATE_HASHED_SIZE = 4 + 8 + 8 + Hash256::$SIZE;
		$dataBufferStart = $TRANSACTION_HEADER_SIZE;
		$dataBufferEnd = self::isAggregateTransaction($transactionBuffer)
				? $TRANSACTION_HEADER_SIZE + $AGGREGATE_HASHED_SIZE
				: count($transactionBuffer);

		return array_slice($transactionBuffer, $dataBufferStart, $dataBufferEnd - $dataBufferStart);
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
}
