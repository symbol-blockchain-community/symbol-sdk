<?php

namespace SymbolSdk\Symbol;

require_once __DIR__ . '/../Network.php';
require_once __DIR__ . '/../symbol/Network.php';

use SymbolSdk\NetworkLocator;
use SymbolSdk\Symbol\Network;

class SymbolFacade
{
	public $network;

	public function __construct($network)
	{
		Network::initialize();
		$this->network = gettype($network) == 'string' ? NetworkLocator::findByName(Network::$NETWORKS, $network) : $network;
	}
}
