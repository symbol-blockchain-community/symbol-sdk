<?php

namespace SymbolSdk\Symbol\Models;

use PHPUnit\Framework\TestCase;
use SymbolSdk\Symbol\KeyPair;
use SymbolSdk\Bip32\Bip32;
use SymbolSdk\Bip32\Bip32Node;

class HdDerivationTest extends TestCase
{
	private function nodeTest(Bip32Node $node, array $children, string $rootPublicKey, array $childrenPath, array $childrenPublicKey)
	{
		$rootKeyPair = new KeyPair($node->privateKey, $rootPublicKey);
		$this->assertEquals(strtoupper(bin2hex($rootKeyPair->publicKey()->binaryData)), $rootPublicKey, "Root public key mismatch");
		for ($i = 0; $i < count($children); $i++) {
			$childNode = $node->derivePath($childrenPath[$i]);
			$childKeyPair = new KeyPair($childNode->privateKey);
			$this->assertEquals(strtoupper(bin2hex($childKeyPair->publicKey()->binaryData)), $childrenPublicKey[$i], "Child public key mismatch at index $i with path " . implode('/', $childrenPath[$i]));
		}
	}

	public function testHdDerivation()
	{
		$jsonFilePath = dirname(__DIR__, 6) . '/tests/vectors/symbol/crypto/6.test-hd-derivation.json';
		$jsonData = file_get_contents($jsonFilePath);
		$decodedData = json_decode($jsonData, true);

		$publicNet = $decodedData['public_net'];
		$testNet = $decodedData['test_net'];

		$testVectors = $decodedData['test_vectors'];
		$bip32 = new Bip32();
		foreach ($publicNet as $item) {
			$mnemonic = $item['mnemonic'];
			$seed = $item['seed'];
			$passphrase = $item['passphrase'];
			$rootPublicKey = $item['rootPublicKey'];
			$children = $item['childAccounts'];
			$childrenPath = [];
			$childrenPublicKey = [];
			foreach ($children as $child) {
				$childrenPath[] = array_map('intval', $child['path']);
				$childrenPublicKey[] = $child['publicKey'];
			}

			if ($mnemonic != null) {
				$node = $bip32->fromMnemonic($mnemonic, $passphrase);
				$this->nodeTest($node, $children, $rootPublicKey, $childrenPath, $childrenPublicKey);
			}
			if ($seed != null) {
				$node = $bip32->fromSeed(hex2bin($seed));
				$this->nodeTest($node, $children, $rootPublicKey, $childrenPath, $childrenPublicKey);
			}
		}

		foreach ($testNet as $item) {
			$mnemonic = $item['mnemonic'];
			$seed = $item['seed'];
			$passphrase = $item['passphrase'];
			$rootPublicKey = $item['rootPublicKey'];
			$children = $item['childAccounts'];
			$childrenPath = [];
			$childrenPublicKey = [];
			foreach ($children as $child) {
				$childrenPath[] = array_map('intval', $child['path']);
				$childrenPublicKey[] = $child['publicKey'];
			}
			if ($mnemonic != null) {
				$node = $bip32->fromMnemonic($mnemonic, $passphrase);
				$this->nodeTest($node, $children, $rootPublicKey, $childrenPath, $childrenPublicKey);
			}
			if ($seed != null) {
				$node = $bip32->fromSeed(hex2bin($seed));
				$this->nodeTest($node, $children, $rootPublicKey, $childrenPath, $childrenPublicKey);
			}
		}


		foreach ($testVectors as $item) {
			$mnemonic = $item['mnemonic'];
			$seed = $item['seed'];
			$passphrase = $item['passphrase'];
			$rootPublicKey = $item['rootPublicKey'];
			$children = $item['childAccounts'];
			$childrenPath = [];
			$childrenPublicKey = [];
			foreach ($children as $child) {
				$childrenPath[] = array_map('intval', $child['path']);
				$childrenPublicKey[] = $child['publicKey'];
			}

			if ($mnemonic != null) {
				$node = $bip32->fromMnemonic($mnemonic, $passphrase);
				$this->nodeTest($node, $children, $rootPublicKey, $childrenPath, $childrenPublicKey);
			}
			if ($seed != null) {
				$node = $bip32->fromSeed(hex2bin($seed));
				$this->nodeTest($node, $children, $rootPublicKey, $childrenPath, $childrenPublicKey);
			}
		}
	}
}
