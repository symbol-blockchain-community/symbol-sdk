<?php
namespace SymbolSdk\Symbol\Models;

require_once __DIR__ . '/../BaseValue.php';
require_once __DIR__ . '/../BinaryData.php';
require_once __DIR__ . '/../utils/BinaryReader.php';
require_once __DIR__ . '/../utils/BinaryWriter.php';
require_once __DIR__ . '/../utils/arrayHelpers.php';
require_once __DIR__ . '/../utils/converter.php';

use SymbolSdk\BaseValue;
use SymbolSdk\BinaryData;
use SymbolSdk\Utils\Converter;
use SymbolSdk\Utils\ArrayHelpers;
use SymbolSdk\Utils\BinaryReader;
use SymbolSdk\Utils\BinaryWriter;
use Exception;
use OutOfRangeException;

class Amount extends BaseValue {
	public function __construct($amount = 0){
		parent::__construct(8, $amount);
	}

	public static function size(): int {
		return 8;
	}

	public static function deserialize(BinaryReader $reader): self {
		return new self(Converter::binaryToInt($reader->read(8), 8));
	}

	public function serialize(): string {
		return Converter::intToBinary($this->value, 8);
	}
}

class BlockDuration extends BaseValue {
	public function __construct($blockDuration = 0){
		parent::__construct(8, $blockDuration);
	}

	public static function size(): int {
		return 8;
	}

	public static function deserialize(BinaryReader $reader): self {
		return new self(Converter::binaryToInt($reader->read(8), 8));
	}

	public function serialize(): string {
		return Converter::intToBinary($this->value, 8);
	}
}

class BlockFeeMultiplier extends BaseValue {
	public function __construct($blockFeeMultiplier = 0){
		parent::__construct(4, $blockFeeMultiplier);
	}

	public static function size(): int {
		return 4;
	}

	public static function deserialize(BinaryReader $reader): self {
		return new self(Converter::binaryToInt($reader->read(4), 4));
	}

	public function serialize(): string {
		return Converter::intToBinary($this->value, 4);
	}
}

class Difficulty extends BaseValue {
	public function __construct($difficulty = 0){
		parent::__construct(8, $difficulty);
	}

	public static function size(): int {
		return 8;
	}

	public static function deserialize(BinaryReader $reader): self {
		return new self(Converter::binaryToInt($reader->read(8), 8));
	}

	public function serialize(): string {
		return Converter::intToBinary($this->value, 8);
	}
}

class FinalizationEpoch extends BaseValue {
	public function __construct($finalizationEpoch = 0){
		parent::__construct(4, $finalizationEpoch);
	}

	public static function size(): int {
		return 4;
	}

	public static function deserialize(BinaryReader $reader): self {
		return new self(Converter::binaryToInt($reader->read(4), 4));
	}

	public function serialize(): string {
		return Converter::intToBinary($this->value, 4);
	}
}

class FinalizationPoint extends BaseValue {
	public function __construct($finalizationPoint = 0){
		parent::__construct(4, $finalizationPoint);
	}

	public static function size(): int {
		return 4;
	}

	public static function deserialize(BinaryReader $reader): self {
		return new self(Converter::binaryToInt($reader->read(4), 4));
	}

	public function serialize(): string {
		return Converter::intToBinary($this->value, 4);
	}
}

class Height extends BaseValue {
	public function __construct($height = 0){
		parent::__construct(8, $height);
	}

	public static function size(): int {
		return 8;
	}

	public static function deserialize(BinaryReader $reader): self {
		return new self(Converter::binaryToInt($reader->read(8), 8));
	}

	public function serialize(): string {
		return Converter::intToBinary($this->value, 8);
	}
}

class Importance extends BaseValue {
	public function __construct($importance = 0){
		parent::__construct(8, $importance);
	}

	public static function size(): int {
		return 8;
	}

	public static function deserialize(BinaryReader $reader): self {
		return new self(Converter::binaryToInt($reader->read(8), 8));
	}

	public function serialize(): string {
		return Converter::intToBinary($this->value, 8);
	}
}

class ImportanceHeight extends BaseValue {
	public function __construct($importanceHeight = 0){
		parent::__construct(8, $importanceHeight);
	}

	public static function size(): int {
		return 8;
	}

	public static function deserialize(BinaryReader $reader): self {
		return new self(Converter::binaryToInt($reader->read(8), 8));
	}

	public function serialize(): string {
		return Converter::intToBinary($this->value, 8);
	}
}

class UnresolvedMosaicId extends BaseValue {
	public function __construct($unresolvedMosaicId = 0){
		parent::__construct(8, $unresolvedMosaicId);
	}

	public static function size(): int {
		return 8;
	}

	public static function deserialize(BinaryReader $reader): self {
		return new self(Converter::binaryToInt($reader->read(8), 8));
	}

	public function serialize(): string {
		return Converter::intToBinary($this->value, 8);
	}
}

class MosaicId extends BaseValue {
	public function __construct($mosaicId = 0){
		parent::__construct(8, $mosaicId);
	}

	public static function size(): int {
		return 8;
	}

	public static function deserialize(BinaryReader $reader): self {
		return new self(Converter::binaryToInt($reader->read(8), 8));
	}

	public function serialize(): string {
		return Converter::intToBinary($this->value, 8);
	}
}

class Timestamp extends BaseValue {
	public function __construct($timestamp = 0){
		parent::__construct(8, $timestamp);
	}

	public static function size(): int {
		return 8;
	}

	public static function deserialize(BinaryReader $reader): self {
		return new self(Converter::binaryToInt($reader->read(8), 8));
	}

	public function serialize(): string {
		return Converter::intToBinary($this->value, 8);
	}
}

class UnresolvedAddress extends BinaryData {
	public function __construct(string $unresolvedAddress = null){
		$unresolvedAddress = $unresolvedAddress ?? str_repeat("\x00", self::size());
		parent::__construct(24, $unresolvedAddress);
	}

	public static function size(): int {
		return 24;
	}

	public static function deserialize(BinaryReader $reader): self {
		return new self($reader->read(24));
	}

	public function serialize(): string {
		return $this->binaryData;
	}
}

class Address extends BinaryData {
	public function __construct(string $address = null){
		$address = $address ?? str_repeat("\x00", self::size());
		parent::__construct(24, $address);
	}

	public static function size(): int {
		return 24;
	}

	public static function deserialize(BinaryReader $reader): self {
		return new self($reader->read(24));
	}

	public function serialize(): string {
		return $this->binaryData;
	}
}

class Hash256 extends BinaryData {
	public function __construct(string $hash256 = null){
		$hash256 = $hash256 ?? str_repeat("\x00", self::size());
		parent::__construct(32, $hash256);
	}

	public static function size(): int {
		return 32;
	}

	public static function deserialize(BinaryReader $reader): self {
		return new self($reader->read(32));
	}

	public function serialize(): string {
		return $this->binaryData;
	}
}

class Hash512 extends BinaryData {
	public function __construct(string $hash512 = null){
		$hash512 = $hash512 ?? str_repeat("\x00", self::size());
		parent::__construct(64, $hash512);
	}

	public static function size(): int {
		return 64;
	}

	public static function deserialize(BinaryReader $reader): self {
		return new self($reader->read(64));
	}

	public function serialize(): string {
		return $this->binaryData;
	}
}

class PublicKey extends BinaryData {
	public function __construct(string $publicKey = null){
		$publicKey = $publicKey ?? str_repeat("\x00", self::size());
		parent::__construct(32, $publicKey);
	}

	public static function size(): int {
		return 32;
	}

	public static function deserialize(BinaryReader $reader): self {
		return new self($reader->read(32));
	}

	public function serialize(): string {
		return $this->binaryData;
	}
}

class VotingPublicKey extends BinaryData {
	public function __construct(string $votingPublicKey = null){
		$votingPublicKey = $votingPublicKey ?? str_repeat("\x00", self::size());
		parent::__construct(32, $votingPublicKey);
	}

	public static function size(): int {
		return 32;
	}

	public static function deserialize(BinaryReader $reader): self {
		return new self($reader->read(32));
	}

	public function serialize(): string {
		return $this->binaryData;
	}
}

class Signature extends BinaryData {
	public function __construct(string $signature = null){
		$signature = $signature ?? str_repeat("\x00", self::size());
		parent::__construct(64, $signature);
	}

	public static function size(): int {
		return 64;
	}

	public static function deserialize(BinaryReader $reader): self {
		return new self($reader->read(64));
	}

	public function serialize(): string {
		return $this->binaryData;
	}
}

class Mosaic {
	public ?MosaicId $mosaicId;

	public ?Amount $amount;

	public function __construct(?MosaicId $mosaicId = null, ?Amount $amount = null){
		$this->mosaicId = $mosaicId ?? new MosaicId();
		$this->amount = $amount ?? new Amount();
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += $this->mosaicId->size();
		$size += $this->amount->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new Mosaic();

		$mosaicId = MosaicId::deserialize($reader);
		$amount = Amount::deserialize($reader);

		$instance->mosaicId = $mosaicId;
		$instance->amount = $amount;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$writer->write($this->mosaicId->serialize());
		$writer->write($this->amount->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '';
		$result .= 'mosaicId: ' . $this->mosaicId . ', ';
		$result .= 'amount: ' . $this->amount . ', ';
		return $result;
	}
}

class UnresolvedMosaic {
	public ?UnresolvedMosaicId $mosaicId;

	public ?Amount $amount;

	public function __construct(?UnresolvedMosaicId $mosaicId = null, ?Amount $amount = null){
		$this->mosaicId = $mosaicId ?? new UnresolvedMosaicId();
		$this->amount = $amount ?? new Amount();
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += $this->mosaicId->size();
		$size += $this->amount->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new UnresolvedMosaic();

		$mosaicId = UnresolvedMosaicId::deserialize($reader);
		$amount = Amount::deserialize($reader);

		$instance->mosaicId = $mosaicId;
		$instance->amount = $amount;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$writer->write($this->mosaicId->serialize());
		$writer->write($this->amount->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '';
		$result .= 'mosaicId: ' . $this->mosaicId . ', ';
		$result .= 'amount: ' . $this->amount . ', ';
		return $result;
	}
}

class LinkAction {
	const UNLINK = 0;

	const LINK = 1;

	public $value;

	public function __construct($value = 0){
		$this->value = $value;
	}

	static function valueToKey($value){
		$values = [
			0, 1
		];
		$keys = [
			'UNLINK', 'LINK'
		];

		$index = array_search($value, $values);
		if ($index === false)
			throw new Exception("Invalid enum value: {$value}");

		return $keys[$index];
	}

	public static function size(){
		return 1;
	}

	public static function deserialize(BinaryReader $reader): self {
		return new LinkAction(Converter::binaryToInt($reader->read(1), 1));
	}

	public function serialize(): string {
		return Converter::intToBinary($this->value, 1);
	}

	public function __toString(){
		return "LinkAction." . self::valueToKey($this->value);
	}
}

class NetworkType {
	const MAINNET = 104;

	const TESTNET = 152;

	public $value;

	public function __construct($value = 0){
		$this->value = $value;
	}

	static function valueToKey($value){
		$values = [
			104, 152
		];
		$keys = [
			'MAINNET', 'TESTNET'
		];

		$index = array_search($value, $values);
		if ($index === false)
			throw new Exception("Invalid enum value: {$value}");

		return $keys[$index];
	}

	public static function size(){
		return 1;
	}

	public static function deserialize(BinaryReader $reader): self {
		return new NetworkType(Converter::binaryToInt($reader->read(1), 1));
	}

	public function serialize(): string {
		return Converter::intToBinary($this->value, 1);
	}

	public function __toString(){
		return "NetworkType." . self::valueToKey($this->value);
	}
}

class TransactionType {
	const ACCOUNT_KEY_LINK = 16716;

	const NODE_KEY_LINK = 16972;

	const AGGREGATE_COMPLETE = 16705;

	const AGGREGATE_BONDED = 16961;

	const VOTING_KEY_LINK = 16707;

	const VRF_KEY_LINK = 16963;

	const HASH_LOCK = 16712;

	const SECRET_LOCK = 16722;

	const SECRET_PROOF = 16978;

	const ACCOUNT_METADATA = 16708;

	const MOSAIC_METADATA = 16964;

	const NAMESPACE_METADATA = 17220;

	const MOSAIC_DEFINITION = 16717;

	const MOSAIC_SUPPLY_CHANGE = 16973;

	const MOSAIC_SUPPLY_REVOCATION = 17229;

	const MULTISIG_ACCOUNT_MODIFICATION = 16725;

	const ADDRESS_ALIAS = 16974;

	const MOSAIC_ALIAS = 17230;

	const NAMESPACE_REGISTRATION = 16718;

	const ACCOUNT_ADDRESS_RESTRICTION = 16720;

	const ACCOUNT_MOSAIC_RESTRICTION = 16976;

	const ACCOUNT_OPERATION_RESTRICTION = 17232;

	const MOSAIC_ADDRESS_RESTRICTION = 16977;

	const MOSAIC_GLOBAL_RESTRICTION = 16721;

	const TRANSFER = 16724;

	public $value;

	public function __construct($value = 0){
		$this->value = $value;
	}

	static function valueToKey($value){
		$values = [
			16716, 16972, 16705, 16961, 16707, 16963, 16712, 16722, 16978, 16708, 16964, 17220, 16717, 16973, 17229, 16725, 16974, 17230,
			16718, 16720, 16976, 17232, 16977, 16721, 16724
		];
		$keys = [
			'ACCOUNT_KEY_LINK', 'NODE_KEY_LINK', 'AGGREGATE_COMPLETE', 'AGGREGATE_BONDED', 'VOTING_KEY_LINK', 'VRF_KEY_LINK', 'HASH_LOCK',
			'SECRET_LOCK', 'SECRET_PROOF', 'ACCOUNT_METADATA', 'MOSAIC_METADATA', 'NAMESPACE_METADATA', 'MOSAIC_DEFINITION',
			'MOSAIC_SUPPLY_CHANGE', 'MOSAIC_SUPPLY_REVOCATION', 'MULTISIG_ACCOUNT_MODIFICATION', 'ADDRESS_ALIAS', 'MOSAIC_ALIAS',
			'NAMESPACE_REGISTRATION', 'ACCOUNT_ADDRESS_RESTRICTION', 'ACCOUNT_MOSAIC_RESTRICTION', 'ACCOUNT_OPERATION_RESTRICTION',
			'MOSAIC_ADDRESS_RESTRICTION', 'MOSAIC_GLOBAL_RESTRICTION', 'TRANSFER'
		];

		$index = array_search($value, $values);
		if ($index === false)
			throw new Exception("Invalid enum value: {$value}");

		return $keys[$index];
	}

	public static function size(){
		return 2;
	}

	public static function deserialize(BinaryReader $reader): self {
		return new TransactionType(Converter::binaryToInt($reader->read(2), 2));
	}

	public function serialize(): string {
		return Converter::intToBinary($this->value, 2);
	}

	public function __toString(){
		return "TransactionType." . self::valueToKey($this->value);
	}
}

class Transaction {
	public ?Signature $signature;

	public ?PublicKey $signerPublicKey;

	public ?int $version;

	public ?NetworkType $network;

	public ?TransactionType $type;

	public ?Amount $fee;

	public ?Timestamp $deadline;

	private int $verifiableEntityHeaderReserved_1 = 0; // reserved field

	private int $entityBodyReserved_1 = 0; // reserved field

	public function __construct(
		?Signature $signature = null,
		?PublicKey $signerPublicKey = null,
		?int $version = null,
		?NetworkType $network = null,
		?TransactionType $type = null,
		?Amount $fee = null,
		?Timestamp $deadline = null
	){
		$this->signature = $signature ?? new Signature();
		$this->signerPublicKey = $signerPublicKey ?? new PublicKey();
		$this->version = $version ?? 0;
		$this->network = $network ?? new NetworkType();
		$this->type = $type ?? new TransactionType();
		$this->fee = $fee ?? new Amount();
		$this->deadline = $deadline ?? new Timestamp();
		$this->verifiableEntityHeaderReserved_1 = 0; // reserved field
		$this->entityBodyReserved_1 = 0; // reserved field
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += 4;
		$size += 4;
		$size += $this->signature->size();
		$size += $this->signerPublicKey->size();
		$size += 4;
		$size += 1;
		$size += $this->network->size();
		$size += $this->type->size();
		$size += $this->fee->size();
		$size += $this->deadline->size();
		return $size;
	}

	public static function _deserialize(BinaryReader &$reader, Transaction $instance): void {
		$size = Converter::binaryToInt($reader->read(4), 4);
		$verifiableEntityHeaderReserved_1 = Converter::binaryToInt($reader->read(4), 4);
		if (0 !== $verifiableEntityHeaderReserved_1)
			throw new OutOfRangeException('Invalid value of reserved field (' . $verifiableEntityHeaderReserved_1 . ')');
		$signature = Signature::deserialize($reader);
		$signerPublicKey = PublicKey::deserialize($reader);
		$entityBodyReserved_1 = Converter::binaryToInt($reader->read(4), 4);
		if (0 !== $entityBodyReserved_1)
			throw new OutOfRangeException('Invalid value of reserved field (' . $entityBodyReserved_1 . ')');
		$version = Converter::binaryToInt($reader->read(1), 1);
		$network = NetworkType::deserialize($reader);
		$type = TransactionType::deserialize($reader);
		$fee = Amount::deserialize($reader);
		$deadline = Timestamp::deserialize($reader);

		$instance->signature = $signature;
		$instance->signerPublicKey = $signerPublicKey;
		$instance->version = $version;
		$instance->network = $network;
		$instance->type = $type;
		$instance->fee = $fee;
		$instance->deadline = $deadline;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->_serialize($writer);
		return $writer->getBinaryData();
	}

	public function _serialize(BinaryWriter &$writer): void {
		$writer->write(Converter::intToBinary($this->size(), 4));
		$writer->write(Converter::intToBinary($this->verifiableEntityHeaderReserved_1, 4));
		$writer->write($this->signature->serialize());
		$writer->write($this->signerPublicKey->serialize());
		$writer->write(Converter::intToBinary($this->entityBodyReserved_1, 4));
		$writer->write(Converter::intToBinary($this->version, 1));
		$writer->write($this->network->serialize());
		$writer->write($this->type->serialize());
		$writer->write($this->fee->serialize());
		$writer->write($this->deadline->serialize());
	}

	public function __toString(){
		$result = '';
		$result .= 'signature: ' . $this->signature . ', ';
		$result .= 'signerPublicKey: ' . $this->signerPublicKey . ', ';
		$result .= 'version: ' . '0x' . Converter::intToHex($this->version, 1) . ', ';
		$result .= 'network: ' . $this->network . ', ';
		$result .= 'type: ' . $this->type . ', ';
		$result .= 'fee: ' . $this->fee . ', ';
		$result .= 'deadline: ' . $this->deadline . ', ';
		return $result;
	}
}

class EmbeddedTransaction {
	public ?PublicKey $signerPublicKey;

	public ?int $version;

	public ?NetworkType $network;

	public ?TransactionType $type;

	private int $embeddedTransactionHeaderReserved_1 = 0; // reserved field

	private int $entityBodyReserved_1 = 0; // reserved field

	public function __construct(
		?PublicKey $signerPublicKey = null,
		?int $version = null,
		?NetworkType $network = null,
		?TransactionType $type = null
	){
		$this->signerPublicKey = $signerPublicKey ?? new PublicKey();
		$this->version = $version ?? 0;
		$this->network = $network ?? new NetworkType();
		$this->type = $type ?? new TransactionType();
		$this->embeddedTransactionHeaderReserved_1 = 0; // reserved field
		$this->entityBodyReserved_1 = 0; // reserved field
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += 4;
		$size += 4;
		$size += $this->signerPublicKey->size();
		$size += 4;
		$size += 1;
		$size += $this->network->size();
		$size += $this->type->size();
		return $size;
	}

	public static function _deserialize(BinaryReader &$reader, EmbeddedTransaction $instance): void {
		$size = Converter::binaryToInt($reader->read(4), 4);
		$embeddedTransactionHeaderReserved_1 = Converter::binaryToInt($reader->read(4), 4);
		if (0 !== $embeddedTransactionHeaderReserved_1)
			throw new OutOfRangeException('Invalid value of reserved field (' . $embeddedTransactionHeaderReserved_1 . ')');
		$signerPublicKey = PublicKey::deserialize($reader);
		$entityBodyReserved_1 = Converter::binaryToInt($reader->read(4), 4);
		if (0 !== $entityBodyReserved_1)
			throw new OutOfRangeException('Invalid value of reserved field (' . $entityBodyReserved_1 . ')');
		$version = Converter::binaryToInt($reader->read(1), 1);
		$network = NetworkType::deserialize($reader);
		$type = TransactionType::deserialize($reader);

		$instance->signerPublicKey = $signerPublicKey;
		$instance->version = $version;
		$instance->network = $network;
		$instance->type = $type;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->_serialize($writer);
		return $writer->getBinaryData();
	}

	public function _serialize(BinaryWriter &$writer): void {
		$writer->write(Converter::intToBinary($this->size(), 4));
		$writer->write(Converter::intToBinary($this->embeddedTransactionHeaderReserved_1, 4));
		$writer->write($this->signerPublicKey->serialize());
		$writer->write(Converter::intToBinary($this->entityBodyReserved_1, 4));
		$writer->write(Converter::intToBinary($this->version, 1));
		$writer->write($this->network->serialize());
		$writer->write($this->type->serialize());
	}

	public function __toString(){
		$result = '';
		$result .= 'signerPublicKey: ' . $this->signerPublicKey . ', ';
		$result .= 'version: ' . '0x' . Converter::intToHex($this->version, 1) . ', ';
		$result .= 'network: ' . $this->network . ', ';
		$result .= 'type: ' . $this->type . ', ';
		return $result;
	}
}

class ProofGamma extends BinaryData {
	public function __construct(string $proofGamma = null){
		$proofGamma = $proofGamma ?? str_repeat("\x00", self::size());
		parent::__construct(32, $proofGamma);
	}

	public static function size(): int {
		return 32;
	}

	public static function deserialize(BinaryReader $reader): self {
		return new self($reader->read(32));
	}

	public function serialize(): string {
		return $this->binaryData;
	}
}

class ProofVerificationHash extends BinaryData {
	public function __construct(string $proofVerificationHash = null){
		$proofVerificationHash = $proofVerificationHash ?? str_repeat("\x00", self::size());
		parent::__construct(16, $proofVerificationHash);
	}

	public static function size(): int {
		return 16;
	}

	public static function deserialize(BinaryReader $reader): self {
		return new self($reader->read(16));
	}

	public function serialize(): string {
		return $this->binaryData;
	}
}

class ProofScalar extends BinaryData {
	public function __construct(string $proofScalar = null){
		$proofScalar = $proofScalar ?? str_repeat("\x00", self::size());
		parent::__construct(32, $proofScalar);
	}

	public static function size(): int {
		return 32;
	}

	public static function deserialize(BinaryReader $reader): self {
		return new self($reader->read(32));
	}

	public function serialize(): string {
		return $this->binaryData;
	}
}

class BlockType {
	const NEMESIS = 32835;

	const NORMAL = 33091;

	const IMPORTANCE = 33347;

	public $value;

	public function __construct($value = 0){
		$this->value = $value;
	}

	static function valueToKey($value){
		$values = [
			32835, 33091, 33347
		];
		$keys = [
			'NEMESIS', 'NORMAL', 'IMPORTANCE'
		];

		$index = array_search($value, $values);
		if ($index === false)
			throw new Exception("Invalid enum value: {$value}");

		return $keys[$index];
	}

	public static function size(){
		return 2;
	}

	public static function deserialize(BinaryReader $reader): self {
		return new BlockType(Converter::binaryToInt($reader->read(2), 2));
	}

	public function serialize(): string {
		return Converter::intToBinary($this->value, 2);
	}

	public function __toString(){
		return "BlockType." . self::valueToKey($this->value);
	}
}

class VrfProof {
	public ?ProofGamma $gamma;

	public ?ProofVerificationHash $verificationHash;

	public ?ProofScalar $scalar;

	public function __construct(
		?ProofGamma $gamma = null,
		?ProofVerificationHash $verificationHash = null,
		?ProofScalar $scalar = null
	){
		$this->gamma = $gamma ?? new ProofGamma();
		$this->verificationHash = $verificationHash ?? new ProofVerificationHash();
		$this->scalar = $scalar ?? new ProofScalar();
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += $this->gamma->size();
		$size += $this->verificationHash->size();
		$size += $this->scalar->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new VrfProof();

		$gamma = ProofGamma::deserialize($reader);
		$verificationHash = ProofVerificationHash::deserialize($reader);
		$scalar = ProofScalar::deserialize($reader);

		$instance->gamma = $gamma;
		$instance->verificationHash = $verificationHash;
		$instance->scalar = $scalar;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$writer->write($this->gamma->serialize());
		$writer->write($this->verificationHash->serialize());
		$writer->write($this->scalar->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '';
		$result .= 'gamma: ' . $this->gamma . ', ';
		$result .= 'verificationHash: ' . $this->verificationHash . ', ';
		$result .= 'scalar: ' . $this->scalar . ', ';
		return $result;
	}
}

class Block {
	public ?Signature $signature;

	public ?PublicKey $signerPublicKey;

	public ?int $version;

	public ?NetworkType $network;

	public ?BlockType $type;

	public ?Height $height;

	public ?Timestamp $timestamp;

	public ?Difficulty $difficulty;

	public ?VrfProof $generationHashProof;

	public ?Hash256 $previousBlockHash;

	public ?Hash256 $transactionsHash;

	public ?Hash256 $receiptsHash;

	public ?Hash256 $stateHash;

	public ?Address $beneficiaryAddress;

	public ?BlockFeeMultiplier $feeMultiplier;

	private int $verifiableEntityHeaderReserved_1 = 0; // reserved field

	private int $entityBodyReserved_1 = 0; // reserved field

	public function __construct(
		?Signature $signature = null,
		?PublicKey $signerPublicKey = null,
		?int $version = null,
		?NetworkType $network = null,
		?BlockType $type = null,
		?Height $height = null,
		?Timestamp $timestamp = null,
		?Difficulty $difficulty = null,
		?VrfProof $generationHashProof = null,
		?Hash256 $previousBlockHash = null,
		?Hash256 $transactionsHash = null,
		?Hash256 $receiptsHash = null,
		?Hash256 $stateHash = null,
		?Address $beneficiaryAddress = null,
		?BlockFeeMultiplier $feeMultiplier = null
	){
		$this->signature = $signature ?? new Signature();
		$this->signerPublicKey = $signerPublicKey ?? new PublicKey();
		$this->version = $version ?? 0;
		$this->network = $network ?? new NetworkType();
		$this->type = $type ?? new BlockType();
		$this->height = $height ?? new Height();
		$this->timestamp = $timestamp ?? new Timestamp();
		$this->difficulty = $difficulty ?? new Difficulty();
		$this->generationHashProof = $generationHashProof ?? new VrfProof();
		$this->previousBlockHash = $previousBlockHash ?? new Hash256();
		$this->transactionsHash = $transactionsHash ?? new Hash256();
		$this->receiptsHash = $receiptsHash ?? new Hash256();
		$this->stateHash = $stateHash ?? new Hash256();
		$this->beneficiaryAddress = $beneficiaryAddress ?? new Address();
		$this->feeMultiplier = $feeMultiplier ?? new BlockFeeMultiplier();
		$this->verifiableEntityHeaderReserved_1 = 0; // reserved field
		$this->entityBodyReserved_1 = 0; // reserved field
	}

	public function sort(){
		$this->generationHashProof->sort();
	}

	public function size(){
		$size = 0;
		$size += 4;
		$size += 4;
		$size += $this->signature->size();
		$size += $this->signerPublicKey->size();
		$size += 4;
		$size += 1;
		$size += $this->network->size();
		$size += $this->type->size();
		$size += $this->height->size();
		$size += $this->timestamp->size();
		$size += $this->difficulty->size();
		$size += $this->generationHashProof->size();
		$size += $this->previousBlockHash->size();
		$size += $this->transactionsHash->size();
		$size += $this->receiptsHash->size();
		$size += $this->stateHash->size();
		$size += $this->beneficiaryAddress->size();
		$size += $this->feeMultiplier->size();
		return $size;
	}

	public static function _deserialize(BinaryReader &$reader, Block $instance): void {
		$size = Converter::binaryToInt($reader->read(4), 4);
		$verifiableEntityHeaderReserved_1 = Converter::binaryToInt($reader->read(4), 4);
		if (0 !== $verifiableEntityHeaderReserved_1)
			throw new OutOfRangeException('Invalid value of reserved field (' . $verifiableEntityHeaderReserved_1 . ')');
		$signature = Signature::deserialize($reader);
		$signerPublicKey = PublicKey::deserialize($reader);
		$entityBodyReserved_1 = Converter::binaryToInt($reader->read(4), 4);
		if (0 !== $entityBodyReserved_1)
			throw new OutOfRangeException('Invalid value of reserved field (' . $entityBodyReserved_1 . ')');
		$version = Converter::binaryToInt($reader->read(1), 1);
		$network = NetworkType::deserialize($reader);
		$type = BlockType::deserialize($reader);
		$height = Height::deserialize($reader);
		$timestamp = Timestamp::deserialize($reader);
		$difficulty = Difficulty::deserialize($reader);
		$generationHashProof = VrfProof::deserialize($reader);
		$previousBlockHash = Hash256::deserialize($reader);
		$transactionsHash = Hash256::deserialize($reader);
		$receiptsHash = Hash256::deserialize($reader);
		$stateHash = Hash256::deserialize($reader);
		$beneficiaryAddress = Address::deserialize($reader);
		$feeMultiplier = BlockFeeMultiplier::deserialize($reader);

		$instance->signature = $signature;
		$instance->signerPublicKey = $signerPublicKey;
		$instance->version = $version;
		$instance->network = $network;
		$instance->type = $type;
		$instance->height = $height;
		$instance->timestamp = $timestamp;
		$instance->difficulty = $difficulty;
		$instance->generationHashProof = $generationHashProof;
		$instance->previousBlockHash = $previousBlockHash;
		$instance->transactionsHash = $transactionsHash;
		$instance->receiptsHash = $receiptsHash;
		$instance->stateHash = $stateHash;
		$instance->beneficiaryAddress = $beneficiaryAddress;
		$instance->feeMultiplier = $feeMultiplier;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->_serialize($writer);
		return $writer->getBinaryData();
	}

	public function _serialize(BinaryWriter &$writer): void {
		$writer->write(Converter::intToBinary($this->size(), 4));
		$writer->write(Converter::intToBinary($this->verifiableEntityHeaderReserved_1, 4));
		$writer->write($this->signature->serialize());
		$writer->write($this->signerPublicKey->serialize());
		$writer->write(Converter::intToBinary($this->entityBodyReserved_1, 4));
		$writer->write(Converter::intToBinary($this->version, 1));
		$writer->write($this->network->serialize());
		$writer->write($this->type->serialize());
		$writer->write($this->height->serialize());
		$writer->write($this->timestamp->serialize());
		$writer->write($this->difficulty->serialize());
		$writer->write($this->generationHashProof->serialize());
		$writer->write($this->previousBlockHash->serialize());
		$writer->write($this->transactionsHash->serialize());
		$writer->write($this->receiptsHash->serialize());
		$writer->write($this->stateHash->serialize());
		$writer->write($this->beneficiaryAddress->serialize());
		$writer->write($this->feeMultiplier->serialize());
	}

	public function __toString(){
		$result = '';
		$result .= 'signature: ' . $this->signature . ', ';
		$result .= 'signerPublicKey: ' . $this->signerPublicKey . ', ';
		$result .= 'version: ' . '0x' . Converter::intToHex($this->version, 1) . ', ';
		$result .= 'network: ' . $this->network . ', ';
		$result .= 'type: ' . $this->type . ', ';
		$result .= 'height: ' . $this->height . ', ';
		$result .= 'timestamp: ' . $this->timestamp . ', ';
		$result .= 'difficulty: ' . $this->difficulty . ', ';
		$result .= 'generationHashProof: ' . $this->generationHashProof . ', ';
		$result .= 'previousBlockHash: ' . $this->previousBlockHash . ', ';
		$result .= 'transactionsHash: ' . $this->transactionsHash . ', ';
		$result .= 'receiptsHash: ' . $this->receiptsHash . ', ';
		$result .= 'stateHash: ' . $this->stateHash . ', ';
		$result .= 'beneficiaryAddress: ' . $this->beneficiaryAddress . ', ';
		$result .= 'feeMultiplier: ' . $this->feeMultiplier . ', ';
		return $result;
	}
}

class NemesisBlockV1 extends Block {
	const BLOCK_VERSION = 1;

	const BLOCK_TYPE = BlockType::NEMESIS;

	public ?int $votingEligibleAccountsCount;

	public ?int $harvestingEligibleAccountsCount;

	public ?Amount $totalVotingBalance;

	public ?Hash256 $previousImportanceBlockHash;

	public ?array $transactions;

	public function __construct(
		?Signature $signature = null,
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?Height $height = null,
		?Timestamp $timestamp = null,
		?Difficulty $difficulty = null,
		?VrfProof $generationHashProof = null,
		?Hash256 $previousBlockHash = null,
		?Hash256 $transactionsHash = null,
		?Hash256 $receiptsHash = null,
		?Hash256 $stateHash = null,
		?Address $beneficiaryAddress = null,
		?BlockFeeMultiplier $feeMultiplier = null,
		?int $votingEligibleAccountsCount = null,
		?int $harvestingEligibleAccountsCount = null,
		?Amount $totalVotingBalance = null,
		?Hash256 $previousImportanceBlockHash = null,
		?array $transactions = null
	){
		parent::__construct(
			$signature,
			$signerPublicKey,
			NemesisBlockV1::BLOCK_VERSION,
			$network,
			new BlockType(NemesisBlockV1::BLOCK_TYPE),
			$height,
			$timestamp,
			$difficulty,
			$generationHashProof,
			$previousBlockHash,
			$transactionsHash,
			$receiptsHash,
			$stateHash,
			$beneficiaryAddress,
			$feeMultiplier,
		);
		$this->votingEligibleAccountsCount = $votingEligibleAccountsCount ?? 0;
		$this->harvestingEligibleAccountsCount = $harvestingEligibleAccountsCount ?? 0;
		$this->totalVotingBalance = $totalVotingBalance ?? new Amount();
		$this->previousImportanceBlockHash = $previousImportanceBlockHash ?? new Hash256();
		$this->transactions = $transactions ?? [];
	}

	public function sort(){
		$this->generationHashProof->sort();
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += 4;
		$size += 8;
		$size += $this->totalVotingBalance->size();
		$size += $this->previousImportanceBlockHash->size();
		$size += ArrayHelpers::size($this->transactions, 8, true);
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new NemesisBlockV1();

		Block::_deserialize($reader, $instance);
		$votingEligibleAccountsCount = Converter::binaryToInt($reader->read(4), 4);
		$harvestingEligibleAccountsCount = Converter::binaryToInt($reader->read(8), 8);
		$totalVotingBalance = Amount::deserialize($reader);
		$previousImportanceBlockHash = Hash256::deserialize($reader);
		$transactions = ArrayHelpers::readVariableSizeElements($reader, [TransactionFactory::class, 'deserialize'], $reader->getRemainingLength(), 8, true);

		$instance->votingEligibleAccountsCount = $votingEligibleAccountsCount;
		$instance->harvestingEligibleAccountsCount = $harvestingEligibleAccountsCount;
		$instance->totalVotingBalance = $totalVotingBalance;
		$instance->previousImportanceBlockHash = $previousImportanceBlockHash;
		$instance->transactions = $transactions;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write(Converter::intToBinary($this->votingEligibleAccountsCount, 4));
		$writer->write(Converter::intToBinary($this->harvestingEligibleAccountsCount, 8));
		$writer->write($this->totalVotingBalance->serialize());
		$writer->write($this->previousImportanceBlockHash->serialize());
		ArrayHelpers::writeVariableSizeElements($writer, $this->transactions, 8, true);
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'votingEligibleAccountsCount: ' . '0x' . Converter::intToHex($this->votingEligibleAccountsCount, 4) . ', ';
		$result .= 'harvestingEligibleAccountsCount: ' . '0x' . Converter::intToHex($this->harvestingEligibleAccountsCount, 8) . ', ';
		$result .= 'totalVotingBalance: ' . $this->totalVotingBalance . ', ';
		$result .= 'previousImportanceBlockHash: ' . $this->previousImportanceBlockHash . ', ';
		$result .= 'transactions: ' . '[' . implode(',', array_map(fn ($e) => $e, $this->transactions)) . ']' . ', ';
		$result .= ')';
		return $result;
	}
}

class NormalBlockV1 extends Block {
	const BLOCK_VERSION = 1;

	const BLOCK_TYPE = BlockType::NORMAL;

	public ?array $transactions;

	private int $blockHeaderReserved_1 = 0; // reserved field

	public function __construct(
		?Signature $signature = null,
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?Height $height = null,
		?Timestamp $timestamp = null,
		?Difficulty $difficulty = null,
		?VrfProof $generationHashProof = null,
		?Hash256 $previousBlockHash = null,
		?Hash256 $transactionsHash = null,
		?Hash256 $receiptsHash = null,
		?Hash256 $stateHash = null,
		?Address $beneficiaryAddress = null,
		?BlockFeeMultiplier $feeMultiplier = null,
		?array $transactions = null
	){
		parent::__construct(
			$signature,
			$signerPublicKey,
			NormalBlockV1::BLOCK_VERSION,
			$network,
			new BlockType(NormalBlockV1::BLOCK_TYPE),
			$height,
			$timestamp,
			$difficulty,
			$generationHashProof,
			$previousBlockHash,
			$transactionsHash,
			$receiptsHash,
			$stateHash,
			$beneficiaryAddress,
			$feeMultiplier,
		);
		$this->transactions = $transactions ?? [];
		$this->blockHeaderReserved_1 = 0; // reserved field
	}

	public function sort(){
		$this->generationHashProof->sort();
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += 4;
		$size += ArrayHelpers::size($this->transactions, 8, true);
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new NormalBlockV1();

		Block::_deserialize($reader, $instance);
		$blockHeaderReserved_1 = Converter::binaryToInt($reader->read(4), 4);
		if (0 !== $blockHeaderReserved_1)
			throw new OutOfRangeException('Invalid value of reserved field (' . $blockHeaderReserved_1 . ')');
		$transactions = ArrayHelpers::readVariableSizeElements($reader, [TransactionFactory::class, 'deserialize'], $reader->getRemainingLength(), 8, true);

		$instance->transactions = $transactions;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write(Converter::intToBinary($this->blockHeaderReserved_1, 4));
		ArrayHelpers::writeVariableSizeElements($writer, $this->transactions, 8, true);
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'transactions: ' . '[' . implode(',', array_map(fn ($e) => $e, $this->transactions)) . ']' . ', ';
		$result .= ')';
		return $result;
	}
}

class ImportanceBlockV1 extends Block {
	const BLOCK_VERSION = 1;

	const BLOCK_TYPE = BlockType::IMPORTANCE;

	public ?int $votingEligibleAccountsCount;

	public ?int $harvestingEligibleAccountsCount;

	public ?Amount $totalVotingBalance;

	public ?Hash256 $previousImportanceBlockHash;

	public ?array $transactions;

	public function __construct(
		?Signature $signature = null,
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?Height $height = null,
		?Timestamp $timestamp = null,
		?Difficulty $difficulty = null,
		?VrfProof $generationHashProof = null,
		?Hash256 $previousBlockHash = null,
		?Hash256 $transactionsHash = null,
		?Hash256 $receiptsHash = null,
		?Hash256 $stateHash = null,
		?Address $beneficiaryAddress = null,
		?BlockFeeMultiplier $feeMultiplier = null,
		?int $votingEligibleAccountsCount = null,
		?int $harvestingEligibleAccountsCount = null,
		?Amount $totalVotingBalance = null,
		?Hash256 $previousImportanceBlockHash = null,
		?array $transactions = null
	){
		parent::__construct(
			$signature,
			$signerPublicKey,
			ImportanceBlockV1::BLOCK_VERSION,
			$network,
			new BlockType(ImportanceBlockV1::BLOCK_TYPE),
			$height,
			$timestamp,
			$difficulty,
			$generationHashProof,
			$previousBlockHash,
			$transactionsHash,
			$receiptsHash,
			$stateHash,
			$beneficiaryAddress,
			$feeMultiplier,
		);
		$this->votingEligibleAccountsCount = $votingEligibleAccountsCount ?? 0;
		$this->harvestingEligibleAccountsCount = $harvestingEligibleAccountsCount ?? 0;
		$this->totalVotingBalance = $totalVotingBalance ?? new Amount();
		$this->previousImportanceBlockHash = $previousImportanceBlockHash ?? new Hash256();
		$this->transactions = $transactions ?? [];
	}

	public function sort(){
		$this->generationHashProof->sort();
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += 4;
		$size += 8;
		$size += $this->totalVotingBalance->size();
		$size += $this->previousImportanceBlockHash->size();
		$size += ArrayHelpers::size($this->transactions, 8, true);
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new ImportanceBlockV1();

		Block::_deserialize($reader, $instance);
		$votingEligibleAccountsCount = Converter::binaryToInt($reader->read(4), 4);
		$harvestingEligibleAccountsCount = Converter::binaryToInt($reader->read(8), 8);
		$totalVotingBalance = Amount::deserialize($reader);
		$previousImportanceBlockHash = Hash256::deserialize($reader);
		$transactions = ArrayHelpers::readVariableSizeElements($reader, [TransactionFactory::class, 'deserialize'], $reader->getRemainingLength(), 8, true);

		$instance->votingEligibleAccountsCount = $votingEligibleAccountsCount;
		$instance->harvestingEligibleAccountsCount = $harvestingEligibleAccountsCount;
		$instance->totalVotingBalance = $totalVotingBalance;
		$instance->previousImportanceBlockHash = $previousImportanceBlockHash;
		$instance->transactions = $transactions;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write(Converter::intToBinary($this->votingEligibleAccountsCount, 4));
		$writer->write(Converter::intToBinary($this->harvestingEligibleAccountsCount, 8));
		$writer->write($this->totalVotingBalance->serialize());
		$writer->write($this->previousImportanceBlockHash->serialize());
		ArrayHelpers::writeVariableSizeElements($writer, $this->transactions, 8, true);
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'votingEligibleAccountsCount: ' . '0x' . Converter::intToHex($this->votingEligibleAccountsCount, 4) . ', ';
		$result .= 'harvestingEligibleAccountsCount: ' . '0x' . Converter::intToHex($this->harvestingEligibleAccountsCount, 8) . ', ';
		$result .= 'totalVotingBalance: ' . $this->totalVotingBalance . ', ';
		$result .= 'previousImportanceBlockHash: ' . $this->previousImportanceBlockHash . ', ';
		$result .= 'transactions: ' . '[' . implode(',', array_map(fn ($e) => $e, $this->transactions)) . ']' . ', ';
		$result .= ')';
		return $result;
	}
}

class FinalizationRound {
	public ?FinalizationEpoch $epoch;

	public ?FinalizationPoint $point;

	public function __construct(?FinalizationEpoch $epoch = null, ?FinalizationPoint $point = null){
		$this->epoch = $epoch ?? new FinalizationEpoch();
		$this->point = $point ?? new FinalizationPoint();
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += $this->epoch->size();
		$size += $this->point->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new FinalizationRound();

		$epoch = FinalizationEpoch::deserialize($reader);
		$point = FinalizationPoint::deserialize($reader);

		$instance->epoch = $epoch;
		$instance->point = $point;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$writer->write($this->epoch->serialize());
		$writer->write($this->point->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '';
		$result .= 'epoch: ' . $this->epoch . ', ';
		$result .= 'point: ' . $this->point . ', ';
		return $result;
	}
}

class FinalizedBlockHeader {
	public ?FinalizationRound $round;

	public ?Height $height;

	public ?Hash256 $hash;

	public function __construct(?FinalizationRound $round = null, ?Height $height = null, ?Hash256 $hash = null){
		$this->round = $round ?? new FinalizationRound();
		$this->height = $height ?? new Height();
		$this->hash = $hash ?? new Hash256();
	}

	public function sort(){
		$this->round->sort();
	}

	public function size(){
		$size = 0;
		$size += $this->round->size();
		$size += $this->height->size();
		$size += $this->hash->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new FinalizedBlockHeader();

		$round = FinalizationRound::deserialize($reader);
		$height = Height::deserialize($reader);
		$hash = Hash256::deserialize($reader);

		$instance->round = $round;
		$instance->height = $height;
		$instance->hash = $hash;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$writer->write($this->round->serialize());
		$writer->write($this->height->serialize());
		$writer->write($this->hash->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '';
		$result .= 'round: ' . $this->round . ', ';
		$result .= 'height: ' . $this->height . ', ';
		$result .= 'hash: ' . $this->hash . ', ';
		return $result;
	}
}

class ReceiptType {
	const MOSAIC_RENTAL_FEE = 4685;

	const NAMESPACE_RENTAL_FEE = 4942;

	const HARVEST_FEE = 8515;

	const LOCK_HASH_COMPLETED = 8776;

	const LOCK_HASH_EXPIRED = 9032;

	const LOCK_SECRET_COMPLETED = 8786;

	const LOCK_SECRET_EXPIRED = 9042;

	const LOCK_HASH_CREATED = 12616;

	const LOCK_SECRET_CREATED = 12626;

	const MOSAIC_EXPIRED = 16717;

	const NAMESPACE_EXPIRED = 16718;

	const NAMESPACE_DELETED = 16974;

	const INFLATION = 20803;

	const TRANSACTION_GROUP = 57667;

	const ADDRESS_ALIAS_RESOLUTION = 61763;

	const MOSAIC_ALIAS_RESOLUTION = 62019;

	public $value;

	public function __construct($value = 0){
		$this->value = $value;
	}

	static function valueToKey($value){
		$values = [
			4685, 4942, 8515, 8776, 9032, 8786, 9042, 12616, 12626, 16717, 16718, 16974, 20803, 57667, 61763, 62019
		];
		$keys = [
			'MOSAIC_RENTAL_FEE', 'NAMESPACE_RENTAL_FEE', 'HARVEST_FEE', 'LOCK_HASH_COMPLETED', 'LOCK_HASH_EXPIRED', 'LOCK_SECRET_COMPLETED',
			'LOCK_SECRET_EXPIRED', 'LOCK_HASH_CREATED', 'LOCK_SECRET_CREATED', 'MOSAIC_EXPIRED', 'NAMESPACE_EXPIRED', 'NAMESPACE_DELETED',
			'INFLATION', 'TRANSACTION_GROUP', 'ADDRESS_ALIAS_RESOLUTION', 'MOSAIC_ALIAS_RESOLUTION'
		];

		$index = array_search($value, $values);
		if ($index === false)
			throw new Exception("Invalid enum value: {$value}");

		return $keys[$index];
	}

	public static function size(){
		return 2;
	}

	public static function deserialize(BinaryReader $reader): self {
		return new ReceiptType(Converter::binaryToInt($reader->read(2), 2));
	}

	public function serialize(): string {
		return Converter::intToBinary($this->value, 2);
	}

	public function __toString(){
		return "ReceiptType." . self::valueToKey($this->value);
	}
}

class Receipt {
	public ?int $version;

	public ?ReceiptType $type;

	public function __construct(?int $version = null, ?ReceiptType $type = null){
		$this->version = $version ?? 0;
		$this->type = $type ?? new ReceiptType();
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += 4;
		$size += 2;
		$size += $this->type->size();
		return $size;
	}

	public static function _deserialize(BinaryReader &$reader, Receipt $instance): void {
		$size = Converter::binaryToInt($reader->read(4), 4);
		$version = Converter::binaryToInt($reader->read(2), 2);
		$type = ReceiptType::deserialize($reader);

		$instance->version = $version;
		$instance->type = $type;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->_serialize($writer);
		return $writer->getBinaryData();
	}

	public function _serialize(BinaryWriter &$writer): void {
		$writer->write(Converter::intToBinary($this->size(), 4));
		$writer->write(Converter::intToBinary($this->version, 2));
		$writer->write($this->type->serialize());
	}

	public function __toString(){
		$result = '';
		$result .= 'version: ' . '0x' . Converter::intToHex($this->version, 2) . ', ';
		$result .= 'type: ' . $this->type . ', ';
		return $result;
	}
}

class HarvestFeeReceipt extends Receipt {
	const RECEIPT_TYPE = ReceiptType::HARVEST_FEE;

	public ?Mosaic $mosaic;

	public ?Address $targetAddress;

	public function __construct(?int $version = null, ?Mosaic $mosaic = null, ?Address $targetAddress = null){
		parent::__construct(
			$version,
			new ReceiptType(HarvestFeeReceipt::RECEIPT_TYPE),
		);
		$this->mosaic = $mosaic ?? new Mosaic();
		$this->targetAddress = $targetAddress ?? new Address();
	}

	public function sort(){
		$this->mosaic->sort();
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->mosaic->size();
		$size += $this->targetAddress->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new HarvestFeeReceipt();

		Receipt::_deserialize($reader, $instance);
		$mosaic = Mosaic::deserialize($reader);
		$targetAddress = Address::deserialize($reader);

		$instance->mosaic = $mosaic;
		$instance->targetAddress = $targetAddress;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->mosaic->serialize());
		$writer->write($this->targetAddress->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'mosaic: ' . $this->mosaic . ', ';
		$result .= 'targetAddress: ' . $this->targetAddress . ', ';
		$result .= ')';
		return $result;
	}
}

class InflationReceipt extends Receipt {
	const RECEIPT_TYPE = ReceiptType::INFLATION;

	public ?Mosaic $mosaic;

	public function __construct(?int $version = null, ?Mosaic $mosaic = null){
		parent::__construct(
			$version,
			new ReceiptType(InflationReceipt::RECEIPT_TYPE),
		);
		$this->mosaic = $mosaic ?? new Mosaic();
	}

	public function sort(){
		$this->mosaic->sort();
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->mosaic->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new InflationReceipt();

		Receipt::_deserialize($reader, $instance);
		$mosaic = Mosaic::deserialize($reader);

		$instance->mosaic = $mosaic;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->mosaic->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'mosaic: ' . $this->mosaic . ', ';
		$result .= ')';
		return $result;
	}
}

class LockHashCreatedFeeReceipt extends Receipt {
	const RECEIPT_TYPE = ReceiptType::LOCK_HASH_CREATED;

	public ?Mosaic $mosaic;

	public ?Address $targetAddress;

	public function __construct(?int $version = null, ?Mosaic $mosaic = null, ?Address $targetAddress = null){
		parent::__construct(
			$version,
			new ReceiptType(LockHashCreatedFeeReceipt::RECEIPT_TYPE),
		);
		$this->mosaic = $mosaic ?? new Mosaic();
		$this->targetAddress = $targetAddress ?? new Address();
	}

	public function sort(){
		$this->mosaic->sort();
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->mosaic->size();
		$size += $this->targetAddress->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new LockHashCreatedFeeReceipt();

		Receipt::_deserialize($reader, $instance);
		$mosaic = Mosaic::deserialize($reader);
		$targetAddress = Address::deserialize($reader);

		$instance->mosaic = $mosaic;
		$instance->targetAddress = $targetAddress;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->mosaic->serialize());
		$writer->write($this->targetAddress->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'mosaic: ' . $this->mosaic . ', ';
		$result .= 'targetAddress: ' . $this->targetAddress . ', ';
		$result .= ')';
		return $result;
	}
}

class LockHashCompletedFeeReceipt extends Receipt {
	const RECEIPT_TYPE = ReceiptType::LOCK_HASH_COMPLETED;

	public ?Mosaic $mosaic;

	public ?Address $targetAddress;

	public function __construct(?int $version = null, ?Mosaic $mosaic = null, ?Address $targetAddress = null){
		parent::__construct(
			$version,
			new ReceiptType(LockHashCompletedFeeReceipt::RECEIPT_TYPE),
		);
		$this->mosaic = $mosaic ?? new Mosaic();
		$this->targetAddress = $targetAddress ?? new Address();
	}

	public function sort(){
		$this->mosaic->sort();
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->mosaic->size();
		$size += $this->targetAddress->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new LockHashCompletedFeeReceipt();

		Receipt::_deserialize($reader, $instance);
		$mosaic = Mosaic::deserialize($reader);
		$targetAddress = Address::deserialize($reader);

		$instance->mosaic = $mosaic;
		$instance->targetAddress = $targetAddress;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->mosaic->serialize());
		$writer->write($this->targetAddress->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'mosaic: ' . $this->mosaic . ', ';
		$result .= 'targetAddress: ' . $this->targetAddress . ', ';
		$result .= ')';
		return $result;
	}
}

class LockHashExpiredFeeReceipt extends Receipt {
	const RECEIPT_TYPE = ReceiptType::LOCK_HASH_EXPIRED;

	public ?Mosaic $mosaic;

	public ?Address $targetAddress;

	public function __construct(?int $version = null, ?Mosaic $mosaic = null, ?Address $targetAddress = null){
		parent::__construct(
			$version,
			new ReceiptType(LockHashExpiredFeeReceipt::RECEIPT_TYPE),
		);
		$this->mosaic = $mosaic ?? new Mosaic();
		$this->targetAddress = $targetAddress ?? new Address();
	}

	public function sort(){
		$this->mosaic->sort();
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->mosaic->size();
		$size += $this->targetAddress->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new LockHashExpiredFeeReceipt();

		Receipt::_deserialize($reader, $instance);
		$mosaic = Mosaic::deserialize($reader);
		$targetAddress = Address::deserialize($reader);

		$instance->mosaic = $mosaic;
		$instance->targetAddress = $targetAddress;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->mosaic->serialize());
		$writer->write($this->targetAddress->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'mosaic: ' . $this->mosaic . ', ';
		$result .= 'targetAddress: ' . $this->targetAddress . ', ';
		$result .= ')';
		return $result;
	}
}

class LockSecretCreatedFeeReceipt extends Receipt {
	const RECEIPT_TYPE = ReceiptType::LOCK_SECRET_CREATED;

	public ?Mosaic $mosaic;

	public ?Address $targetAddress;

	public function __construct(?int $version = null, ?Mosaic $mosaic = null, ?Address $targetAddress = null){
		parent::__construct(
			$version,
			new ReceiptType(LockSecretCreatedFeeReceipt::RECEIPT_TYPE),
		);
		$this->mosaic = $mosaic ?? new Mosaic();
		$this->targetAddress = $targetAddress ?? new Address();
	}

	public function sort(){
		$this->mosaic->sort();
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->mosaic->size();
		$size += $this->targetAddress->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new LockSecretCreatedFeeReceipt();

		Receipt::_deserialize($reader, $instance);
		$mosaic = Mosaic::deserialize($reader);
		$targetAddress = Address::deserialize($reader);

		$instance->mosaic = $mosaic;
		$instance->targetAddress = $targetAddress;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->mosaic->serialize());
		$writer->write($this->targetAddress->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'mosaic: ' . $this->mosaic . ', ';
		$result .= 'targetAddress: ' . $this->targetAddress . ', ';
		$result .= ')';
		return $result;
	}
}

class LockSecretCompletedFeeReceipt extends Receipt {
	const RECEIPT_TYPE = ReceiptType::LOCK_SECRET_COMPLETED;

	public ?Mosaic $mosaic;

	public ?Address $targetAddress;

	public function __construct(?int $version = null, ?Mosaic $mosaic = null, ?Address $targetAddress = null){
		parent::__construct(
			$version,
			new ReceiptType(LockSecretCompletedFeeReceipt::RECEIPT_TYPE),
		);
		$this->mosaic = $mosaic ?? new Mosaic();
		$this->targetAddress = $targetAddress ?? new Address();
	}

	public function sort(){
		$this->mosaic->sort();
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->mosaic->size();
		$size += $this->targetAddress->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new LockSecretCompletedFeeReceipt();

		Receipt::_deserialize($reader, $instance);
		$mosaic = Mosaic::deserialize($reader);
		$targetAddress = Address::deserialize($reader);

		$instance->mosaic = $mosaic;
		$instance->targetAddress = $targetAddress;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->mosaic->serialize());
		$writer->write($this->targetAddress->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'mosaic: ' . $this->mosaic . ', ';
		$result .= 'targetAddress: ' . $this->targetAddress . ', ';
		$result .= ')';
		return $result;
	}
}

class LockSecretExpiredFeeReceipt extends Receipt {
	const RECEIPT_TYPE = ReceiptType::LOCK_SECRET_EXPIRED;

	public ?Mosaic $mosaic;

	public ?Address $targetAddress;

	public function __construct(?int $version = null, ?Mosaic $mosaic = null, ?Address $targetAddress = null){
		parent::__construct(
			$version,
			new ReceiptType(LockSecretExpiredFeeReceipt::RECEIPT_TYPE),
		);
		$this->mosaic = $mosaic ?? new Mosaic();
		$this->targetAddress = $targetAddress ?? new Address();
	}

	public function sort(){
		$this->mosaic->sort();
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->mosaic->size();
		$size += $this->targetAddress->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new LockSecretExpiredFeeReceipt();

		Receipt::_deserialize($reader, $instance);
		$mosaic = Mosaic::deserialize($reader);
		$targetAddress = Address::deserialize($reader);

		$instance->mosaic = $mosaic;
		$instance->targetAddress = $targetAddress;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->mosaic->serialize());
		$writer->write($this->targetAddress->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'mosaic: ' . $this->mosaic . ', ';
		$result .= 'targetAddress: ' . $this->targetAddress . ', ';
		$result .= ')';
		return $result;
	}
}

class MosaicExpiredReceipt extends Receipt {
	const RECEIPT_TYPE = ReceiptType::MOSAIC_EXPIRED;

	public ?MosaicId $artifactId;

	public function __construct(?int $version = null, ?MosaicId $artifactId = null){
		parent::__construct(
			$version,
			new ReceiptType(MosaicExpiredReceipt::RECEIPT_TYPE),
		);
		$this->artifactId = $artifactId ?? new MosaicId();
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->artifactId->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new MosaicExpiredReceipt();

		Receipt::_deserialize($reader, $instance);
		$artifactId = MosaicId::deserialize($reader);

		$instance->artifactId = $artifactId;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->artifactId->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'artifactId: ' . $this->artifactId . ', ';
		$result .= ')';
		return $result;
	}
}

class MosaicRentalFeeReceipt extends Receipt {
	const RECEIPT_TYPE = ReceiptType::MOSAIC_RENTAL_FEE;

	public ?Mosaic $mosaic;

	public ?Address $senderAddress;

	public ?Address $recipientAddress;

	public function __construct(
		?int $version = null,
		?Mosaic $mosaic = null,
		?Address $senderAddress = null,
		?Address $recipientAddress = null
	){
		parent::__construct(
			$version,
			new ReceiptType(MosaicRentalFeeReceipt::RECEIPT_TYPE),
		);
		$this->mosaic = $mosaic ?? new Mosaic();
		$this->senderAddress = $senderAddress ?? new Address();
		$this->recipientAddress = $recipientAddress ?? new Address();
	}

	public function sort(){
		$this->mosaic->sort();
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->mosaic->size();
		$size += $this->senderAddress->size();
		$size += $this->recipientAddress->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new MosaicRentalFeeReceipt();

		Receipt::_deserialize($reader, $instance);
		$mosaic = Mosaic::deserialize($reader);
		$senderAddress = Address::deserialize($reader);
		$recipientAddress = Address::deserialize($reader);

		$instance->mosaic = $mosaic;
		$instance->senderAddress = $senderAddress;
		$instance->recipientAddress = $recipientAddress;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->mosaic->serialize());
		$writer->write($this->senderAddress->serialize());
		$writer->write($this->recipientAddress->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'mosaic: ' . $this->mosaic . ', ';
		$result .= 'senderAddress: ' . $this->senderAddress . ', ';
		$result .= 'recipientAddress: ' . $this->recipientAddress . ', ';
		$result .= ')';
		return $result;
	}
}

class NamespaceId extends BaseValue {
	public function __construct($namespaceId = 0){
		parent::__construct(8, $namespaceId);
	}

	public static function size(): int {
		return 8;
	}

	public static function deserialize(BinaryReader $reader): self {
		return new self(Converter::binaryToInt($reader->read(8), 8));
	}

	public function serialize(): string {
		return Converter::intToBinary($this->value, 8);
	}
}

class NamespaceRegistrationType {
	const ROOT = 0;

	const CHILD = 1;

	public $value;

	public function __construct($value = 0){
		$this->value = $value;
	}

	static function valueToKey($value){
		$values = [
			0, 1
		];
		$keys = [
			'ROOT', 'CHILD'
		];

		$index = array_search($value, $values);
		if ($index === false)
			throw new Exception("Invalid enum value: {$value}");

		return $keys[$index];
	}

	public static function size(){
		return 1;
	}

	public static function deserialize(BinaryReader $reader): self {
		return new NamespaceRegistrationType(Converter::binaryToInt($reader->read(1), 1));
	}

	public function serialize(): string {
		return Converter::intToBinary($this->value, 1);
	}

	public function __toString(){
		return "NamespaceRegistrationType." . self::valueToKey($this->value);
	}
}

class AliasAction {
	const UNLINK = 0;

	const LINK = 1;

	public $value;

	public function __construct($value = 0){
		$this->value = $value;
	}

	static function valueToKey($value){
		$values = [
			0, 1
		];
		$keys = [
			'UNLINK', 'LINK'
		];

		$index = array_search($value, $values);
		if ($index === false)
			throw new Exception("Invalid enum value: {$value}");

		return $keys[$index];
	}

	public static function size(){
		return 1;
	}

	public static function deserialize(BinaryReader $reader): self {
		return new AliasAction(Converter::binaryToInt($reader->read(1), 1));
	}

	public function serialize(): string {
		return Converter::intToBinary($this->value, 1);
	}

	public function __toString(){
		return "AliasAction." . self::valueToKey($this->value);
	}
}

class NamespaceExpiredReceipt extends Receipt {
	const RECEIPT_TYPE = ReceiptType::NAMESPACE_EXPIRED;

	public ?NamespaceId $artifactId;

	public function __construct(?int $version = null, ?NamespaceId $artifactId = null){
		parent::__construct(
			$version,
			new ReceiptType(NamespaceExpiredReceipt::RECEIPT_TYPE),
		);
		$this->artifactId = $artifactId ?? new NamespaceId();
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->artifactId->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new NamespaceExpiredReceipt();

		Receipt::_deserialize($reader, $instance);
		$artifactId = NamespaceId::deserialize($reader);

		$instance->artifactId = $artifactId;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->artifactId->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'artifactId: ' . $this->artifactId . ', ';
		$result .= ')';
		return $result;
	}
}

class NamespaceDeletedReceipt extends Receipt {
	const RECEIPT_TYPE = ReceiptType::NAMESPACE_DELETED;

	public ?NamespaceId $artifactId;

	public function __construct(?int $version = null, ?NamespaceId $artifactId = null){
		parent::__construct(
			$version,
			new ReceiptType(NamespaceDeletedReceipt::RECEIPT_TYPE),
		);
		$this->artifactId = $artifactId ?? new NamespaceId();
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->artifactId->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new NamespaceDeletedReceipt();

		Receipt::_deserialize($reader, $instance);
		$artifactId = NamespaceId::deserialize($reader);

		$instance->artifactId = $artifactId;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->artifactId->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'artifactId: ' . $this->artifactId . ', ';
		$result .= ')';
		return $result;
	}
}

class NamespaceRentalFeeReceipt extends Receipt {
	const RECEIPT_TYPE = ReceiptType::NAMESPACE_RENTAL_FEE;

	public ?Mosaic $mosaic;

	public ?Address $senderAddress;

	public ?Address $recipientAddress;

	public function __construct(
		?int $version = null,
		?Mosaic $mosaic = null,
		?Address $senderAddress = null,
		?Address $recipientAddress = null
	){
		parent::__construct(
			$version,
			new ReceiptType(NamespaceRentalFeeReceipt::RECEIPT_TYPE),
		);
		$this->mosaic = $mosaic ?? new Mosaic();
		$this->senderAddress = $senderAddress ?? new Address();
		$this->recipientAddress = $recipientAddress ?? new Address();
	}

	public function sort(){
		$this->mosaic->sort();
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->mosaic->size();
		$size += $this->senderAddress->size();
		$size += $this->recipientAddress->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new NamespaceRentalFeeReceipt();

		Receipt::_deserialize($reader, $instance);
		$mosaic = Mosaic::deserialize($reader);
		$senderAddress = Address::deserialize($reader);
		$recipientAddress = Address::deserialize($reader);

		$instance->mosaic = $mosaic;
		$instance->senderAddress = $senderAddress;
		$instance->recipientAddress = $recipientAddress;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->mosaic->serialize());
		$writer->write($this->senderAddress->serialize());
		$writer->write($this->recipientAddress->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'mosaic: ' . $this->mosaic . ', ';
		$result .= 'senderAddress: ' . $this->senderAddress . ', ';
		$result .= 'recipientAddress: ' . $this->recipientAddress . ', ';
		$result .= ')';
		return $result;
	}
}

class ReceiptSource {
	public ?int $primaryId;

	public ?int $secondaryId;

	public function __construct(?int $primaryId = null, ?int $secondaryId = null){
		$this->primaryId = $primaryId ?? 0;
		$this->secondaryId = $secondaryId ?? 0;
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += 4;
		$size += 4;
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new ReceiptSource();

		$primaryId = Converter::binaryToInt($reader->read(4), 4);
		$secondaryId = Converter::binaryToInt($reader->read(4), 4);

		$instance->primaryId = $primaryId;
		$instance->secondaryId = $secondaryId;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$writer->write(Converter::intToBinary($this->primaryId, 4));
		$writer->write(Converter::intToBinary($this->secondaryId, 4));
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '';
		$result .= 'primaryId: ' . '0x' . Converter::intToHex($this->primaryId, 4) . ', ';
		$result .= 'secondaryId: ' . '0x' . Converter::intToHex($this->secondaryId, 4) . ', ';
		return $result;
	}
}

class AddressResolutionEntry {
	public ?ReceiptSource $source;

	public ?Address $resolvedValue;

	public function __construct(?ReceiptSource $source = null, ?Address $resolvedValue = null){
		$this->source = $source ?? new ReceiptSource();
		$this->resolvedValue = $resolvedValue ?? new Address();
	}

	public function sort(){
		$this->source->sort();
	}

	public function size(){
		$size = 0;
		$size += $this->source->size();
		$size += $this->resolvedValue->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new AddressResolutionEntry();

		$source = ReceiptSource::deserialize($reader);
		$resolvedValue = Address::deserialize($reader);

		$instance->source = $source;
		$instance->resolvedValue = $resolvedValue;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$writer->write($this->source->serialize());
		$writer->write($this->resolvedValue->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '';
		$result .= 'source: ' . $this->source . ', ';
		$result .= 'resolvedValue: ' . $this->resolvedValue . ', ';
		return $result;
	}
}

class AddressResolutionStatement {
	public ?UnresolvedAddress $unresolved;

	public ?array $resolutionEntries;

	public function __construct(?UnresolvedAddress $unresolved = null, ?array $resolutionEntries = null){
		$this->unresolved = $unresolved ?? new UnresolvedAddress();
		$this->resolutionEntries = $resolutionEntries ?? [];
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += $this->unresolved->size();
		$size += 4;
		$size += ArrayHelpers::size($this->resolutionEntries);
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new AddressResolutionStatement();

		$unresolved = UnresolvedAddress::deserialize($reader);
		$resolutionEntriesCount = Converter::binaryToInt($reader->read(4), 4);
		$resolutionEntries = ArrayHelpers::readArrayCount($reader, [AddressResolutionEntry::class, 'deserialize'], $resolutionEntriesCount);

		$instance->unresolved = $unresolved;
		$instance->resolutionEntries = $resolutionEntries;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$writer->write($this->unresolved->serialize());
		$writer->write(Converter::intToBinary(count($this->resolutionEntries), 4)); // bound: resolution_entries_count
		ArrayHelpers::writeArray($writer, $this->resolutionEntries);
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '';
		$result .= 'unresolved: ' . $this->unresolved . ', ';
		$result .= 'resolutionEntries: ' . '[' . implode(',', array_map(fn ($e) => $e, $this->resolutionEntries)) . ']' . ', ';
		return $result;
	}
}

class MosaicResolutionEntry {
	public ?ReceiptSource $source;

	public ?MosaicId $resolvedValue;

	public function __construct(?ReceiptSource $source = null, ?MosaicId $resolvedValue = null){
		$this->source = $source ?? new ReceiptSource();
		$this->resolvedValue = $resolvedValue ?? new MosaicId();
	}

	public function sort(){
		$this->source->sort();
	}

	public function size(){
		$size = 0;
		$size += $this->source->size();
		$size += $this->resolvedValue->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new MosaicResolutionEntry();

		$source = ReceiptSource::deserialize($reader);
		$resolvedValue = MosaicId::deserialize($reader);

		$instance->source = $source;
		$instance->resolvedValue = $resolvedValue;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$writer->write($this->source->serialize());
		$writer->write($this->resolvedValue->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '';
		$result .= 'source: ' . $this->source . ', ';
		$result .= 'resolvedValue: ' . $this->resolvedValue . ', ';
		return $result;
	}
}

class MosaicResolutionStatement {
	public ?UnresolvedMosaicId $unresolved;

	public ?array $resolutionEntries;

	public function __construct(?UnresolvedMosaicId $unresolved = null, ?array $resolutionEntries = null){
		$this->unresolved = $unresolved ?? new UnresolvedMosaicId();
		$this->resolutionEntries = $resolutionEntries ?? [];
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += $this->unresolved->size();
		$size += 4;
		$size += ArrayHelpers::size($this->resolutionEntries);
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new MosaicResolutionStatement();

		$unresolved = UnresolvedMosaicId::deserialize($reader);
		$resolutionEntriesCount = Converter::binaryToInt($reader->read(4), 4);
		$resolutionEntries = ArrayHelpers::readArrayCount($reader, [MosaicResolutionEntry::class, 'deserialize'], $resolutionEntriesCount);

		$instance->unresolved = $unresolved;
		$instance->resolutionEntries = $resolutionEntries;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$writer->write($this->unresolved->serialize());
		$writer->write(Converter::intToBinary(count($this->resolutionEntries), 4)); // bound: resolution_entries_count
		ArrayHelpers::writeArray($writer, $this->resolutionEntries);
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '';
		$result .= 'unresolved: ' . $this->unresolved . ', ';
		$result .= 'resolutionEntries: ' . '[' . implode(',', array_map(fn ($e) => $e, $this->resolutionEntries)) . ']' . ', ';
		return $result;
	}
}

class TransactionStatement {
	public ?int $primaryId;

	public ?int $secondaryId;

	public ?array $receipts;

	public function __construct(?int $primaryId = null, ?int $secondaryId = null, ?array $receipts = null){
		$this->primaryId = $primaryId ?? 0;
		$this->secondaryId = $secondaryId ?? 0;
		$this->receipts = $receipts ?? [];
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += 4;
		$size += 4;
		$size += 4;
		$size += ArrayHelpers::size($this->receipts);
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new TransactionStatement();

		$primaryId = Converter::binaryToInt($reader->read(4), 4);
		$secondaryId = Converter::binaryToInt($reader->read(4), 4);
		$receiptCount = Converter::binaryToInt($reader->read(4), 4);
		$receipts = ArrayHelpers::readArrayCount($reader, [ReceiptFactory::class, 'deserialize'], $receiptCount);

		$instance->primaryId = $primaryId;
		$instance->secondaryId = $secondaryId;
		$instance->receipts = $receipts;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$writer->write(Converter::intToBinary($this->primaryId, 4));
		$writer->write(Converter::intToBinary($this->secondaryId, 4));
		$writer->write(Converter::intToBinary(count($this->receipts), 4)); // bound: receipt_count
		ArrayHelpers::writeArray($writer, $this->receipts);
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '';
		$result .= 'primaryId: ' . '0x' . Converter::intToHex($this->primaryId, 4) . ', ';
		$result .= 'secondaryId: ' . '0x' . Converter::intToHex($this->secondaryId, 4) . ', ';
		$result .= 'receipts: ' . '[' . implode(',', array_map(fn ($e) => $e, $this->receipts)) . ']' . ', ';
		return $result;
	}
}

class BlockStatement {
	public ?array $transactionStatements;

	public ?array $addressResolutionStatements;

	public ?array $mosaicResolutionStatements;

	public function __construct(
		?array $transactionStatements = null,
		?array $addressResolutionStatements = null,
		?array $mosaicResolutionStatements = null
	){
		$this->transactionStatements = $transactionStatements ?? [];
		$this->addressResolutionStatements = $addressResolutionStatements ?? [];
		$this->mosaicResolutionStatements = $mosaicResolutionStatements ?? [];
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += 4;
		$size += ArrayHelpers::size($this->transactionStatements);
		$size += 4;
		$size += ArrayHelpers::size($this->addressResolutionStatements);
		$size += 4;
		$size += ArrayHelpers::size($this->mosaicResolutionStatements);
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new BlockStatement();

		$transactionStatementCount = Converter::binaryToInt($reader->read(4), 4);
		$transactionStatements = ArrayHelpers::readArrayCount($reader, [TransactionStatement::class, 'deserialize'], $transactionStatementCount);
		$addressResolutionStatementCount = Converter::binaryToInt($reader->read(4), 4);
		$addressResolutionStatements = ArrayHelpers::readArrayCount($reader, [AddressResolutionStatement::class, 'deserialize'], $addressResolutionStatementCount);
		$mosaicResolutionStatementCount = Converter::binaryToInt($reader->read(4), 4);
		$mosaicResolutionStatements = ArrayHelpers::readArrayCount($reader, [MosaicResolutionStatement::class, 'deserialize'], $mosaicResolutionStatementCount);

		$instance->transactionStatements = $transactionStatements;
		$instance->addressResolutionStatements = $addressResolutionStatements;
		$instance->mosaicResolutionStatements = $mosaicResolutionStatements;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$writer->write(Converter::intToBinary(count($this->transactionStatements), 4)); // bound: transaction_statement_count
		ArrayHelpers::writeArray($writer, $this->transactionStatements);
		$writer->write(Converter::intToBinary(count($this->addressResolutionStatements), 4)); // bound: address_resolution_statement_count
		ArrayHelpers::writeArray($writer, $this->addressResolutionStatements);
		$writer->write(Converter::intToBinary(count($this->mosaicResolutionStatements), 4)); // bound: mosaic_resolution_statement_count
		ArrayHelpers::writeArray($writer, $this->mosaicResolutionStatements);
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '';
		$result .= 'transactionStatements: ' . '[' . implode(',', array_map(fn ($e) => $e, $this->transactionStatements)) . ']' . ', ';
		$result .= 'addressResolutionStatements: ' . '[' . implode(',', array_map(fn ($e) => $e, $this->addressResolutionStatements)) . ']' . ', ';
		$result .= 'mosaicResolutionStatements: ' . '[' . implode(',', array_map(fn ($e) => $e, $this->mosaicResolutionStatements)) . ']' . ', ';
		return $result;
	}
}

class AccountKeyLinkTransactionV1 extends Transaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::ACCOUNT_KEY_LINK;

	public ?PublicKey $linkedPublicKey;

	public ?LinkAction $linkAction;

	public function __construct(
		?Signature $signature = null,
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?Amount $fee = null,
		?Timestamp $deadline = null,
		?PublicKey $linkedPublicKey = null,
		?LinkAction $linkAction = null
	){
		parent::__construct(
			$signature,
			$signerPublicKey,
			AccountKeyLinkTransactionV1::TRANSACTION_VERSION,
			$network,
			new TransactionType(AccountKeyLinkTransactionV1::TRANSACTION_TYPE),
			$fee,
			$deadline,
		);
		$this->linkedPublicKey = $linkedPublicKey ?? new PublicKey();
		$this->linkAction = $linkAction ?? new LinkAction();
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->linkedPublicKey->size();
		$size += $this->linkAction->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new AccountKeyLinkTransactionV1();

		Transaction::_deserialize($reader, $instance);
		$linkedPublicKey = PublicKey::deserialize($reader);
		$linkAction = LinkAction::deserialize($reader);

		$instance->linkedPublicKey = $linkedPublicKey;
		$instance->linkAction = $linkAction;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->linkedPublicKey->serialize());
		$writer->write($this->linkAction->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'linkedPublicKey: ' . $this->linkedPublicKey . ', ';
		$result .= 'linkAction: ' . $this->linkAction . ', ';
		$result .= ')';
		return $result;
	}
}

class EmbeddedAccountKeyLinkTransactionV1 extends EmbeddedTransaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::ACCOUNT_KEY_LINK;

	public ?PublicKey $linkedPublicKey;

	public ?LinkAction $linkAction;

	public function __construct(
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?PublicKey $linkedPublicKey = null,
		?LinkAction $linkAction = null
	){
		parent::__construct(
			$signerPublicKey,
			EmbeddedAccountKeyLinkTransactionV1::TRANSACTION_VERSION,
			$network,
			new TransactionType(EmbeddedAccountKeyLinkTransactionV1::TRANSACTION_TYPE),
		);
		$this->linkedPublicKey = $linkedPublicKey ?? new PublicKey();
		$this->linkAction = $linkAction ?? new LinkAction();
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->linkedPublicKey->size();
		$size += $this->linkAction->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new EmbeddedAccountKeyLinkTransactionV1();

		EmbeddedTransaction::_deserialize($reader, $instance);
		$linkedPublicKey = PublicKey::deserialize($reader);
		$linkAction = LinkAction::deserialize($reader);

		$instance->linkedPublicKey = $linkedPublicKey;
		$instance->linkAction = $linkAction;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->linkedPublicKey->serialize());
		$writer->write($this->linkAction->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'linkedPublicKey: ' . $this->linkedPublicKey . ', ';
		$result .= 'linkAction: ' . $this->linkAction . ', ';
		$result .= ')';
		return $result;
	}
}

class NodeKeyLinkTransactionV1 extends Transaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::NODE_KEY_LINK;

	public ?PublicKey $linkedPublicKey;

	public ?LinkAction $linkAction;

	public function __construct(
		?Signature $signature = null,
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?Amount $fee = null,
		?Timestamp $deadline = null,
		?PublicKey $linkedPublicKey = null,
		?LinkAction $linkAction = null
	){
		parent::__construct(
			$signature,
			$signerPublicKey,
			NodeKeyLinkTransactionV1::TRANSACTION_VERSION,
			$network,
			new TransactionType(NodeKeyLinkTransactionV1::TRANSACTION_TYPE),
			$fee,
			$deadline,
		);
		$this->linkedPublicKey = $linkedPublicKey ?? new PublicKey();
		$this->linkAction = $linkAction ?? new LinkAction();
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->linkedPublicKey->size();
		$size += $this->linkAction->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new NodeKeyLinkTransactionV1();

		Transaction::_deserialize($reader, $instance);
		$linkedPublicKey = PublicKey::deserialize($reader);
		$linkAction = LinkAction::deserialize($reader);

		$instance->linkedPublicKey = $linkedPublicKey;
		$instance->linkAction = $linkAction;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->linkedPublicKey->serialize());
		$writer->write($this->linkAction->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'linkedPublicKey: ' . $this->linkedPublicKey . ', ';
		$result .= 'linkAction: ' . $this->linkAction . ', ';
		$result .= ')';
		return $result;
	}
}

class EmbeddedNodeKeyLinkTransactionV1 extends EmbeddedTransaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::NODE_KEY_LINK;

	public ?PublicKey $linkedPublicKey;

	public ?LinkAction $linkAction;

	public function __construct(
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?PublicKey $linkedPublicKey = null,
		?LinkAction $linkAction = null
	){
		parent::__construct(
			$signerPublicKey,
			EmbeddedNodeKeyLinkTransactionV1::TRANSACTION_VERSION,
			$network,
			new TransactionType(EmbeddedNodeKeyLinkTransactionV1::TRANSACTION_TYPE),
		);
		$this->linkedPublicKey = $linkedPublicKey ?? new PublicKey();
		$this->linkAction = $linkAction ?? new LinkAction();
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->linkedPublicKey->size();
		$size += $this->linkAction->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new EmbeddedNodeKeyLinkTransactionV1();

		EmbeddedTransaction::_deserialize($reader, $instance);
		$linkedPublicKey = PublicKey::deserialize($reader);
		$linkAction = LinkAction::deserialize($reader);

		$instance->linkedPublicKey = $linkedPublicKey;
		$instance->linkAction = $linkAction;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->linkedPublicKey->serialize());
		$writer->write($this->linkAction->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'linkedPublicKey: ' . $this->linkedPublicKey . ', ';
		$result .= 'linkAction: ' . $this->linkAction . ', ';
		$result .= ')';
		return $result;
	}
}

class Cosignature {
	public ?int $version;

	public ?PublicKey $signerPublicKey;

	public ?Signature $signature;

	public function __construct(?int $version = null, ?PublicKey $signerPublicKey = null, ?Signature $signature = null){
		$this->version = $version ?? 0;
		$this->signerPublicKey = $signerPublicKey ?? new PublicKey();
		$this->signature = $signature ?? new Signature();
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += 8;
		$size += $this->signerPublicKey->size();
		$size += $this->signature->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new Cosignature();

		$version = Converter::binaryToInt($reader->read(8), 8);
		$signerPublicKey = PublicKey::deserialize($reader);
		$signature = Signature::deserialize($reader);

		$instance->version = $version;
		$instance->signerPublicKey = $signerPublicKey;
		$instance->signature = $signature;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$writer->write(Converter::intToBinary($this->version, 8));
		$writer->write($this->signerPublicKey->serialize());
		$writer->write($this->signature->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '';
		$result .= 'version: ' . '0x' . Converter::intToHex($this->version, 8) . ', ';
		$result .= 'signerPublicKey: ' . $this->signerPublicKey . ', ';
		$result .= 'signature: ' . $this->signature . ', ';
		return $result;
	}
}

class DetachedCosignature {
	public ?int $version;

	public ?PublicKey $signerPublicKey;

	public ?Signature $signature;

	public ?Hash256 $parentHash;

	public function __construct(
		?int $version = null,
		?PublicKey $signerPublicKey = null,
		?Signature $signature = null,
		?Hash256 $parentHash = null
	){
		$this->version = $version ?? 0;
		$this->signerPublicKey = $signerPublicKey ?? new PublicKey();
		$this->signature = $signature ?? new Signature();
		$this->parentHash = $parentHash ?? new Hash256();
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += 8;
		$size += $this->signerPublicKey->size();
		$size += $this->signature->size();
		$size += $this->parentHash->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new DetachedCosignature();

		$version = Converter::binaryToInt($reader->read(8), 8);
		$signerPublicKey = PublicKey::deserialize($reader);
		$signature = Signature::deserialize($reader);
		$parentHash = Hash256::deserialize($reader);

		$instance->version = $version;
		$instance->signerPublicKey = $signerPublicKey;
		$instance->signature = $signature;
		$instance->parentHash = $parentHash;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$writer->write(Converter::intToBinary($this->version, 8));
		$writer->write($this->signerPublicKey->serialize());
		$writer->write($this->signature->serialize());
		$writer->write($this->parentHash->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '';
		$result .= 'version: ' . '0x' . Converter::intToHex($this->version, 8) . ', ';
		$result .= 'signerPublicKey: ' . $this->signerPublicKey . ', ';
		$result .= 'signature: ' . $this->signature . ', ';
		$result .= 'parentHash: ' . $this->parentHash . ', ';
		return $result;
	}
}

class AggregateCompleteTransactionV1 extends Transaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::AGGREGATE_COMPLETE;

	public ?Hash256 $transactionsHash;

	public ?array $transactions;

	public ?array $cosignatures;

	private int $aggregateTransactionHeaderReserved_1 = 0; // reserved field

	public function __construct(
		?Signature $signature = null,
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?Amount $fee = null,
		?Timestamp $deadline = null,
		?Hash256 $transactionsHash = null,
		?array $transactions = null,
		?array $cosignatures = null
	){
		parent::__construct(
			$signature,
			$signerPublicKey,
			AggregateCompleteTransactionV1::TRANSACTION_VERSION,
			$network,
			new TransactionType(AggregateCompleteTransactionV1::TRANSACTION_TYPE),
			$fee,
			$deadline,
		);
		$this->transactionsHash = $transactionsHash ?? new Hash256();
		$this->transactions = $transactions ?? [];
		$this->cosignatures = $cosignatures ?? [];
		$this->aggregateTransactionHeaderReserved_1 = 0; // reserved field
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->transactionsHash->size();
		$size += 4;
		$size += 4;
		$size += ArrayHelpers::size($this->transactions, 8, false);
		$size += ArrayHelpers::size($this->cosignatures);
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new AggregateCompleteTransactionV1();

		Transaction::_deserialize($reader, $instance);
		$transactionsHash = Hash256::deserialize($reader);
		$payloadSize = Converter::binaryToInt($reader->read(4), 4);
		$aggregateTransactionHeaderReserved_1 = Converter::binaryToInt($reader->read(4), 4);
		if (0 !== $aggregateTransactionHeaderReserved_1)
			throw new OutOfRangeException('Invalid value of reserved field (' . $aggregateTransactionHeaderReserved_1 . ')');
		$transactions = ArrayHelpers::readVariableSizeElements($reader, [EmbeddedTransactionFactory::class, 'deserialize'], $payloadSize, 8, false);
		$cosignatures = ArrayHelpers::readArray($reader, [Cosignature::class, 'deserialize']);

		$instance->transactionsHash = $transactionsHash;
		$instance->transactions = $transactions;
		$instance->cosignatures = $cosignatures;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->transactionsHash->serialize());
		$writer->write(Converter::intToBinary(ArrayHelpers::size($this->transactions, 8, false), 4)); // bound: payload_size
		$writer->write(Converter::intToBinary($this->aggregateTransactionHeaderReserved_1, 4));
		ArrayHelpers::writeVariableSizeElements($writer, $this->transactions, 8, false);
		ArrayHelpers::writeArray($writer, $this->cosignatures);
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'transactionsHash: ' . $this->transactionsHash . ', ';
		$result .= 'transactions: ' . '[' . implode(',', array_map(fn ($e) => $e, $this->transactions)) . ']' . ', ';
		$result .= 'cosignatures: ' . '[' . implode(',', array_map(fn ($e) => $e, $this->cosignatures)) . ']' . ', ';
		$result .= ')';
		return $result;
	}
}

class AggregateCompleteTransactionV2 extends Transaction {
	const TRANSACTION_VERSION = 2;

	const TRANSACTION_TYPE = TransactionType::AGGREGATE_COMPLETE;

	public ?Hash256 $transactionsHash;

	public ?array $transactions;

	public ?array $cosignatures;

	private int $aggregateTransactionHeaderReserved_1 = 0; // reserved field

	public function __construct(
		?Signature $signature = null,
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?Amount $fee = null,
		?Timestamp $deadline = null,
		?Hash256 $transactionsHash = null,
		?array $transactions = null,
		?array $cosignatures = null
	){
		parent::__construct(
			$signature,
			$signerPublicKey,
			AggregateCompleteTransactionV2::TRANSACTION_VERSION,
			$network,
			new TransactionType(AggregateCompleteTransactionV2::TRANSACTION_TYPE),
			$fee,
			$deadline,
		);
		$this->transactionsHash = $transactionsHash ?? new Hash256();
		$this->transactions = $transactions ?? [];
		$this->cosignatures = $cosignatures ?? [];
		$this->aggregateTransactionHeaderReserved_1 = 0; // reserved field
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->transactionsHash->size();
		$size += 4;
		$size += 4;
		$size += ArrayHelpers::size($this->transactions, 8, false);
		$size += ArrayHelpers::size($this->cosignatures);
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new AggregateCompleteTransactionV2();

		Transaction::_deserialize($reader, $instance);
		$transactionsHash = Hash256::deserialize($reader);
		$payloadSize = Converter::binaryToInt($reader->read(4), 4);
		$aggregateTransactionHeaderReserved_1 = Converter::binaryToInt($reader->read(4), 4);
		if (0 !== $aggregateTransactionHeaderReserved_1)
			throw new OutOfRangeException('Invalid value of reserved field (' . $aggregateTransactionHeaderReserved_1 . ')');
		$transactions = ArrayHelpers::readVariableSizeElements($reader, [EmbeddedTransactionFactory::class, 'deserialize'], $payloadSize, 8, false);
		$cosignatures = ArrayHelpers::readArray($reader, [Cosignature::class, 'deserialize']);

		$instance->transactionsHash = $transactionsHash;
		$instance->transactions = $transactions;
		$instance->cosignatures = $cosignatures;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->transactionsHash->serialize());
		$writer->write(Converter::intToBinary(ArrayHelpers::size($this->transactions, 8, false), 4)); // bound: payload_size
		$writer->write(Converter::intToBinary($this->aggregateTransactionHeaderReserved_1, 4));
		ArrayHelpers::writeVariableSizeElements($writer, $this->transactions, 8, false);
		ArrayHelpers::writeArray($writer, $this->cosignatures);
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'transactionsHash: ' . $this->transactionsHash . ', ';
		$result .= 'transactions: ' . '[' . implode(',', array_map(fn ($e) => $e, $this->transactions)) . ']' . ', ';
		$result .= 'cosignatures: ' . '[' . implode(',', array_map(fn ($e) => $e, $this->cosignatures)) . ']' . ', ';
		$result .= ')';
		return $result;
	}
}

class AggregateBondedTransactionV1 extends Transaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::AGGREGATE_BONDED;

	public ?Hash256 $transactionsHash;

	public ?array $transactions;

	public ?array $cosignatures;

	private int $aggregateTransactionHeaderReserved_1 = 0; // reserved field

	public function __construct(
		?Signature $signature = null,
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?Amount $fee = null,
		?Timestamp $deadline = null,
		?Hash256 $transactionsHash = null,
		?array $transactions = null,
		?array $cosignatures = null
	){
		parent::__construct(
			$signature,
			$signerPublicKey,
			AggregateBondedTransactionV1::TRANSACTION_VERSION,
			$network,
			new TransactionType(AggregateBondedTransactionV1::TRANSACTION_TYPE),
			$fee,
			$deadline,
		);
		$this->transactionsHash = $transactionsHash ?? new Hash256();
		$this->transactions = $transactions ?? [];
		$this->cosignatures = $cosignatures ?? [];
		$this->aggregateTransactionHeaderReserved_1 = 0; // reserved field
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->transactionsHash->size();
		$size += 4;
		$size += 4;
		$size += ArrayHelpers::size($this->transactions, 8, false);
		$size += ArrayHelpers::size($this->cosignatures);
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new AggregateBondedTransactionV1();

		Transaction::_deserialize($reader, $instance);
		$transactionsHash = Hash256::deserialize($reader);
		$payloadSize = Converter::binaryToInt($reader->read(4), 4);
		$aggregateTransactionHeaderReserved_1 = Converter::binaryToInt($reader->read(4), 4);
		if (0 !== $aggregateTransactionHeaderReserved_1)
			throw new OutOfRangeException('Invalid value of reserved field (' . $aggregateTransactionHeaderReserved_1 . ')');
		$transactions = ArrayHelpers::readVariableSizeElements($reader, [EmbeddedTransactionFactory::class, 'deserialize'], $payloadSize, 8, false);
		$cosignatures = ArrayHelpers::readArray($reader, [Cosignature::class, 'deserialize']);

		$instance->transactionsHash = $transactionsHash;
		$instance->transactions = $transactions;
		$instance->cosignatures = $cosignatures;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->transactionsHash->serialize());
		$writer->write(Converter::intToBinary(ArrayHelpers::size($this->transactions, 8, false), 4)); // bound: payload_size
		$writer->write(Converter::intToBinary($this->aggregateTransactionHeaderReserved_1, 4));
		ArrayHelpers::writeVariableSizeElements($writer, $this->transactions, 8, false);
		ArrayHelpers::writeArray($writer, $this->cosignatures);
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'transactionsHash: ' . $this->transactionsHash . ', ';
		$result .= 'transactions: ' . '[' . implode(',', array_map(fn ($e) => $e, $this->transactions)) . ']' . ', ';
		$result .= 'cosignatures: ' . '[' . implode(',', array_map(fn ($e) => $e, $this->cosignatures)) . ']' . ', ';
		$result .= ')';
		return $result;
	}
}

class AggregateBondedTransactionV2 extends Transaction {
	const TRANSACTION_VERSION = 2;

	const TRANSACTION_TYPE = TransactionType::AGGREGATE_BONDED;

	public ?Hash256 $transactionsHash;

	public ?array $transactions;

	public ?array $cosignatures;

	private int $aggregateTransactionHeaderReserved_1 = 0; // reserved field

	public function __construct(
		?Signature $signature = null,
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?Amount $fee = null,
		?Timestamp $deadline = null,
		?Hash256 $transactionsHash = null,
		?array $transactions = null,
		?array $cosignatures = null
	){
		parent::__construct(
			$signature,
			$signerPublicKey,
			AggregateBondedTransactionV2::TRANSACTION_VERSION,
			$network,
			new TransactionType(AggregateBondedTransactionV2::TRANSACTION_TYPE),
			$fee,
			$deadline,
		);
		$this->transactionsHash = $transactionsHash ?? new Hash256();
		$this->transactions = $transactions ?? [];
		$this->cosignatures = $cosignatures ?? [];
		$this->aggregateTransactionHeaderReserved_1 = 0; // reserved field
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->transactionsHash->size();
		$size += 4;
		$size += 4;
		$size += ArrayHelpers::size($this->transactions, 8, false);
		$size += ArrayHelpers::size($this->cosignatures);
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new AggregateBondedTransactionV2();

		Transaction::_deserialize($reader, $instance);
		$transactionsHash = Hash256::deserialize($reader);
		$payloadSize = Converter::binaryToInt($reader->read(4), 4);
		$aggregateTransactionHeaderReserved_1 = Converter::binaryToInt($reader->read(4), 4);
		if (0 !== $aggregateTransactionHeaderReserved_1)
			throw new OutOfRangeException('Invalid value of reserved field (' . $aggregateTransactionHeaderReserved_1 . ')');
		$transactions = ArrayHelpers::readVariableSizeElements($reader, [EmbeddedTransactionFactory::class, 'deserialize'], $payloadSize, 8, false);
		$cosignatures = ArrayHelpers::readArray($reader, [Cosignature::class, 'deserialize']);

		$instance->transactionsHash = $transactionsHash;
		$instance->transactions = $transactions;
		$instance->cosignatures = $cosignatures;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->transactionsHash->serialize());
		$writer->write(Converter::intToBinary(ArrayHelpers::size($this->transactions, 8, false), 4)); // bound: payload_size
		$writer->write(Converter::intToBinary($this->aggregateTransactionHeaderReserved_1, 4));
		ArrayHelpers::writeVariableSizeElements($writer, $this->transactions, 8, false);
		ArrayHelpers::writeArray($writer, $this->cosignatures);
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'transactionsHash: ' . $this->transactionsHash . ', ';
		$result .= 'transactions: ' . '[' . implode(',', array_map(fn ($e) => $e, $this->transactions)) . ']' . ', ';
		$result .= 'cosignatures: ' . '[' . implode(',', array_map(fn ($e) => $e, $this->cosignatures)) . ']' . ', ';
		$result .= ')';
		return $result;
	}
}

class VotingKeyLinkTransactionV1 extends Transaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::VOTING_KEY_LINK;

	public ?VotingPublicKey $linkedPublicKey;

	public ?FinalizationEpoch $startEpoch;

	public ?FinalizationEpoch $endEpoch;

	public ?LinkAction $linkAction;

	public function __construct(
		?Signature $signature = null,
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?Amount $fee = null,
		?Timestamp $deadline = null,
		?VotingPublicKey $linkedPublicKey = null,
		?FinalizationEpoch $startEpoch = null,
		?FinalizationEpoch $endEpoch = null,
		?LinkAction $linkAction = null
	){
		parent::__construct(
			$signature,
			$signerPublicKey,
			VotingKeyLinkTransactionV1::TRANSACTION_VERSION,
			$network,
			new TransactionType(VotingKeyLinkTransactionV1::TRANSACTION_TYPE),
			$fee,
			$deadline,
		);
		$this->linkedPublicKey = $linkedPublicKey ?? new VotingPublicKey();
		$this->startEpoch = $startEpoch ?? new FinalizationEpoch();
		$this->endEpoch = $endEpoch ?? new FinalizationEpoch();
		$this->linkAction = $linkAction ?? new LinkAction();
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->linkedPublicKey->size();
		$size += $this->startEpoch->size();
		$size += $this->endEpoch->size();
		$size += $this->linkAction->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new VotingKeyLinkTransactionV1();

		Transaction::_deserialize($reader, $instance);
		$linkedPublicKey = VotingPublicKey::deserialize($reader);
		$startEpoch = FinalizationEpoch::deserialize($reader);
		$endEpoch = FinalizationEpoch::deserialize($reader);
		$linkAction = LinkAction::deserialize($reader);

		$instance->linkedPublicKey = $linkedPublicKey;
		$instance->startEpoch = $startEpoch;
		$instance->endEpoch = $endEpoch;
		$instance->linkAction = $linkAction;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->linkedPublicKey->serialize());
		$writer->write($this->startEpoch->serialize());
		$writer->write($this->endEpoch->serialize());
		$writer->write($this->linkAction->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'linkedPublicKey: ' . $this->linkedPublicKey . ', ';
		$result .= 'startEpoch: ' . $this->startEpoch . ', ';
		$result .= 'endEpoch: ' . $this->endEpoch . ', ';
		$result .= 'linkAction: ' . $this->linkAction . ', ';
		$result .= ')';
		return $result;
	}
}

class EmbeddedVotingKeyLinkTransactionV1 extends EmbeddedTransaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::VOTING_KEY_LINK;

	public ?VotingPublicKey $linkedPublicKey;

	public ?FinalizationEpoch $startEpoch;

	public ?FinalizationEpoch $endEpoch;

	public ?LinkAction $linkAction;

	public function __construct(
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?VotingPublicKey $linkedPublicKey = null,
		?FinalizationEpoch $startEpoch = null,
		?FinalizationEpoch $endEpoch = null,
		?LinkAction $linkAction = null
	){
		parent::__construct(
			$signerPublicKey,
			EmbeddedVotingKeyLinkTransactionV1::TRANSACTION_VERSION,
			$network,
			new TransactionType(EmbeddedVotingKeyLinkTransactionV1::TRANSACTION_TYPE),
		);
		$this->linkedPublicKey = $linkedPublicKey ?? new VotingPublicKey();
		$this->startEpoch = $startEpoch ?? new FinalizationEpoch();
		$this->endEpoch = $endEpoch ?? new FinalizationEpoch();
		$this->linkAction = $linkAction ?? new LinkAction();
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->linkedPublicKey->size();
		$size += $this->startEpoch->size();
		$size += $this->endEpoch->size();
		$size += $this->linkAction->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new EmbeddedVotingKeyLinkTransactionV1();

		EmbeddedTransaction::_deserialize($reader, $instance);
		$linkedPublicKey = VotingPublicKey::deserialize($reader);
		$startEpoch = FinalizationEpoch::deserialize($reader);
		$endEpoch = FinalizationEpoch::deserialize($reader);
		$linkAction = LinkAction::deserialize($reader);

		$instance->linkedPublicKey = $linkedPublicKey;
		$instance->startEpoch = $startEpoch;
		$instance->endEpoch = $endEpoch;
		$instance->linkAction = $linkAction;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->linkedPublicKey->serialize());
		$writer->write($this->startEpoch->serialize());
		$writer->write($this->endEpoch->serialize());
		$writer->write($this->linkAction->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'linkedPublicKey: ' . $this->linkedPublicKey . ', ';
		$result .= 'startEpoch: ' . $this->startEpoch . ', ';
		$result .= 'endEpoch: ' . $this->endEpoch . ', ';
		$result .= 'linkAction: ' . $this->linkAction . ', ';
		$result .= ')';
		return $result;
	}
}

class VrfKeyLinkTransactionV1 extends Transaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::VRF_KEY_LINK;

	public ?PublicKey $linkedPublicKey;

	public ?LinkAction $linkAction;

	public function __construct(
		?Signature $signature = null,
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?Amount $fee = null,
		?Timestamp $deadline = null,
		?PublicKey $linkedPublicKey = null,
		?LinkAction $linkAction = null
	){
		parent::__construct(
			$signature,
			$signerPublicKey,
			VrfKeyLinkTransactionV1::TRANSACTION_VERSION,
			$network,
			new TransactionType(VrfKeyLinkTransactionV1::TRANSACTION_TYPE),
			$fee,
			$deadline,
		);
		$this->linkedPublicKey = $linkedPublicKey ?? new PublicKey();
		$this->linkAction = $linkAction ?? new LinkAction();
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->linkedPublicKey->size();
		$size += $this->linkAction->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new VrfKeyLinkTransactionV1();

		Transaction::_deserialize($reader, $instance);
		$linkedPublicKey = PublicKey::deserialize($reader);
		$linkAction = LinkAction::deserialize($reader);

		$instance->linkedPublicKey = $linkedPublicKey;
		$instance->linkAction = $linkAction;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->linkedPublicKey->serialize());
		$writer->write($this->linkAction->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'linkedPublicKey: ' . $this->linkedPublicKey . ', ';
		$result .= 'linkAction: ' . $this->linkAction . ', ';
		$result .= ')';
		return $result;
	}
}

class EmbeddedVrfKeyLinkTransactionV1 extends EmbeddedTransaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::VRF_KEY_LINK;

	public ?PublicKey $linkedPublicKey;

	public ?LinkAction $linkAction;

	public function __construct(
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?PublicKey $linkedPublicKey = null,
		?LinkAction $linkAction = null
	){
		parent::__construct(
			$signerPublicKey,
			EmbeddedVrfKeyLinkTransactionV1::TRANSACTION_VERSION,
			$network,
			new TransactionType(EmbeddedVrfKeyLinkTransactionV1::TRANSACTION_TYPE),
		);
		$this->linkedPublicKey = $linkedPublicKey ?? new PublicKey();
		$this->linkAction = $linkAction ?? new LinkAction();
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->linkedPublicKey->size();
		$size += $this->linkAction->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new EmbeddedVrfKeyLinkTransactionV1();

		EmbeddedTransaction::_deserialize($reader, $instance);
		$linkedPublicKey = PublicKey::deserialize($reader);
		$linkAction = LinkAction::deserialize($reader);

		$instance->linkedPublicKey = $linkedPublicKey;
		$instance->linkAction = $linkAction;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->linkedPublicKey->serialize());
		$writer->write($this->linkAction->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'linkedPublicKey: ' . $this->linkedPublicKey . ', ';
		$result .= 'linkAction: ' . $this->linkAction . ', ';
		$result .= ')';
		return $result;
	}
}

class HashLockTransactionV1 extends Transaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::HASH_LOCK;

	public ?UnresolvedMosaic $mosaic;

	public ?BlockDuration $duration;

	public ?Hash256 $hash;

	public function __construct(
		?Signature $signature = null,
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?Amount $fee = null,
		?Timestamp $deadline = null,
		?UnresolvedMosaic $mosaic = null,
		?BlockDuration $duration = null,
		?Hash256 $hash = null
	){
		parent::__construct(
			$signature,
			$signerPublicKey,
			HashLockTransactionV1::TRANSACTION_VERSION,
			$network,
			new TransactionType(HashLockTransactionV1::TRANSACTION_TYPE),
			$fee,
			$deadline,
		);
		$this->mosaic = $mosaic ?? new UnresolvedMosaic();
		$this->duration = $duration ?? new BlockDuration();
		$this->hash = $hash ?? new Hash256();
	}

	public function sort(){
		$this->mosaic->sort();
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->mosaic->size();
		$size += $this->duration->size();
		$size += $this->hash->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new HashLockTransactionV1();

		Transaction::_deserialize($reader, $instance);
		$mosaic = UnresolvedMosaic::deserialize($reader);
		$duration = BlockDuration::deserialize($reader);
		$hash = Hash256::deserialize($reader);

		$instance->mosaic = $mosaic;
		$instance->duration = $duration;
		$instance->hash = $hash;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->mosaic->serialize());
		$writer->write($this->duration->serialize());
		$writer->write($this->hash->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'mosaic: ' . $this->mosaic . ', ';
		$result .= 'duration: ' . $this->duration . ', ';
		$result .= 'hash: ' . $this->hash . ', ';
		$result .= ')';
		return $result;
	}
}

class EmbeddedHashLockTransactionV1 extends EmbeddedTransaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::HASH_LOCK;

	public ?UnresolvedMosaic $mosaic;

	public ?BlockDuration $duration;

	public ?Hash256 $hash;

	public function __construct(
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?UnresolvedMosaic $mosaic = null,
		?BlockDuration $duration = null,
		?Hash256 $hash = null
	){
		parent::__construct(
			$signerPublicKey,
			EmbeddedHashLockTransactionV1::TRANSACTION_VERSION,
			$network,
			new TransactionType(EmbeddedHashLockTransactionV1::TRANSACTION_TYPE),
		);
		$this->mosaic = $mosaic ?? new UnresolvedMosaic();
		$this->duration = $duration ?? new BlockDuration();
		$this->hash = $hash ?? new Hash256();
	}

	public function sort(){
		$this->mosaic->sort();
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->mosaic->size();
		$size += $this->duration->size();
		$size += $this->hash->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new EmbeddedHashLockTransactionV1();

		EmbeddedTransaction::_deserialize($reader, $instance);
		$mosaic = UnresolvedMosaic::deserialize($reader);
		$duration = BlockDuration::deserialize($reader);
		$hash = Hash256::deserialize($reader);

		$instance->mosaic = $mosaic;
		$instance->duration = $duration;
		$instance->hash = $hash;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->mosaic->serialize());
		$writer->write($this->duration->serialize());
		$writer->write($this->hash->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'mosaic: ' . $this->mosaic . ', ';
		$result .= 'duration: ' . $this->duration . ', ';
		$result .= 'hash: ' . $this->hash . ', ';
		$result .= ')';
		return $result;
	}
}

class LockHashAlgorithm {
	const SHA3_256 = 0;

	const HASH_160 = 1;

	const HASH_256 = 2;

	public $value;

	public function __construct($value = 0){
		$this->value = $value;
	}

	static function valueToKey($value){
		$values = [
			0, 1, 2
		];
		$keys = [
			'SHA3_256', 'HASH_160', 'HASH_256'
		];

		$index = array_search($value, $values);
		if ($index === false)
			throw new Exception("Invalid enum value: {$value}");

		return $keys[$index];
	}

	public static function size(){
		return 1;
	}

	public static function deserialize(BinaryReader $reader): self {
		return new LockHashAlgorithm(Converter::binaryToInt($reader->read(1), 1));
	}

	public function serialize(): string {
		return Converter::intToBinary($this->value, 1);
	}

	public function __toString(){
		return "LockHashAlgorithm." . self::valueToKey($this->value);
	}
}

class SecretLockTransactionV1 extends Transaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::SECRET_LOCK;

	public ?UnresolvedAddress $recipientAddress;

	public ?Hash256 $secret;

	public ?UnresolvedMosaic $mosaic;

	public ?BlockDuration $duration;

	public ?LockHashAlgorithm $hashAlgorithm;

	public function __construct(
		?Signature $signature = null,
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?Amount $fee = null,
		?Timestamp $deadline = null,
		?UnresolvedAddress $recipientAddress = null,
		?Hash256 $secret = null,
		?UnresolvedMosaic $mosaic = null,
		?BlockDuration $duration = null,
		?LockHashAlgorithm $hashAlgorithm = null
	){
		parent::__construct(
			$signature,
			$signerPublicKey,
			SecretLockTransactionV1::TRANSACTION_VERSION,
			$network,
			new TransactionType(SecretLockTransactionV1::TRANSACTION_TYPE),
			$fee,
			$deadline,
		);
		$this->recipientAddress = $recipientAddress ?? new UnresolvedAddress();
		$this->secret = $secret ?? new Hash256();
		$this->mosaic = $mosaic ?? new UnresolvedMosaic();
		$this->duration = $duration ?? new BlockDuration();
		$this->hashAlgorithm = $hashAlgorithm ?? new LockHashAlgorithm();
	}

	public function sort(){
		$this->mosaic->sort();
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->recipientAddress->size();
		$size += $this->secret->size();
		$size += $this->mosaic->size();
		$size += $this->duration->size();
		$size += $this->hashAlgorithm->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new SecretLockTransactionV1();

		Transaction::_deserialize($reader, $instance);
		$recipientAddress = UnresolvedAddress::deserialize($reader);
		$secret = Hash256::deserialize($reader);
		$mosaic = UnresolvedMosaic::deserialize($reader);
		$duration = BlockDuration::deserialize($reader);
		$hashAlgorithm = LockHashAlgorithm::deserialize($reader);

		$instance->recipientAddress = $recipientAddress;
		$instance->secret = $secret;
		$instance->mosaic = $mosaic;
		$instance->duration = $duration;
		$instance->hashAlgorithm = $hashAlgorithm;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->recipientAddress->serialize());
		$writer->write($this->secret->serialize());
		$writer->write($this->mosaic->serialize());
		$writer->write($this->duration->serialize());
		$writer->write($this->hashAlgorithm->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'recipientAddress: ' . $this->recipientAddress . ', ';
		$result .= 'secret: ' . $this->secret . ', ';
		$result .= 'mosaic: ' . $this->mosaic . ', ';
		$result .= 'duration: ' . $this->duration . ', ';
		$result .= 'hashAlgorithm: ' . $this->hashAlgorithm . ', ';
		$result .= ')';
		return $result;
	}
}

class EmbeddedSecretLockTransactionV1 extends EmbeddedTransaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::SECRET_LOCK;

	public ?UnresolvedAddress $recipientAddress;

	public ?Hash256 $secret;

	public ?UnresolvedMosaic $mosaic;

	public ?BlockDuration $duration;

	public ?LockHashAlgorithm $hashAlgorithm;

	public function __construct(
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?UnresolvedAddress $recipientAddress = null,
		?Hash256 $secret = null,
		?UnresolvedMosaic $mosaic = null,
		?BlockDuration $duration = null,
		?LockHashAlgorithm $hashAlgorithm = null
	){
		parent::__construct(
			$signerPublicKey,
			EmbeddedSecretLockTransactionV1::TRANSACTION_VERSION,
			$network,
			new TransactionType(EmbeddedSecretLockTransactionV1::TRANSACTION_TYPE),
		);
		$this->recipientAddress = $recipientAddress ?? new UnresolvedAddress();
		$this->secret = $secret ?? new Hash256();
		$this->mosaic = $mosaic ?? new UnresolvedMosaic();
		$this->duration = $duration ?? new BlockDuration();
		$this->hashAlgorithm = $hashAlgorithm ?? new LockHashAlgorithm();
	}

	public function sort(){
		$this->mosaic->sort();
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->recipientAddress->size();
		$size += $this->secret->size();
		$size += $this->mosaic->size();
		$size += $this->duration->size();
		$size += $this->hashAlgorithm->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new EmbeddedSecretLockTransactionV1();

		EmbeddedTransaction::_deserialize($reader, $instance);
		$recipientAddress = UnresolvedAddress::deserialize($reader);
		$secret = Hash256::deserialize($reader);
		$mosaic = UnresolvedMosaic::deserialize($reader);
		$duration = BlockDuration::deserialize($reader);
		$hashAlgorithm = LockHashAlgorithm::deserialize($reader);

		$instance->recipientAddress = $recipientAddress;
		$instance->secret = $secret;
		$instance->mosaic = $mosaic;
		$instance->duration = $duration;
		$instance->hashAlgorithm = $hashAlgorithm;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->recipientAddress->serialize());
		$writer->write($this->secret->serialize());
		$writer->write($this->mosaic->serialize());
		$writer->write($this->duration->serialize());
		$writer->write($this->hashAlgorithm->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'recipientAddress: ' . $this->recipientAddress . ', ';
		$result .= 'secret: ' . $this->secret . ', ';
		$result .= 'mosaic: ' . $this->mosaic . ', ';
		$result .= 'duration: ' . $this->duration . ', ';
		$result .= 'hashAlgorithm: ' . $this->hashAlgorithm . ', ';
		$result .= ')';
		return $result;
	}
}

class SecretProofTransactionV1 extends Transaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::SECRET_PROOF;

	public ?UnresolvedAddress $recipientAddress;

	public ?Hash256 $secret;

	public ?LockHashAlgorithm $hashAlgorithm;

	public ?string $proof;

	public function __construct(
		?Signature $signature = null,
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?Amount $fee = null,
		?Timestamp $deadline = null,
		?UnresolvedAddress $recipientAddress = null,
		?Hash256 $secret = null,
		?LockHashAlgorithm $hashAlgorithm = null,
		?string $proof = null
	){
		parent::__construct(
			$signature,
			$signerPublicKey,
			SecretProofTransactionV1::TRANSACTION_VERSION,
			$network,
			new TransactionType(SecretProofTransactionV1::TRANSACTION_TYPE),
			$fee,
			$deadline,
		);
		$this->recipientAddress = $recipientAddress ?? new UnresolvedAddress();
		$this->secret = $secret ?? new Hash256();
		$this->hashAlgorithm = $hashAlgorithm ?? new LockHashAlgorithm();
		$this->proof = $proof ?? '';
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->recipientAddress->size();
		$size += $this->secret->size();
		$size += 2;
		$size += $this->hashAlgorithm->size();
		$size += strlen($this->proof);
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new SecretProofTransactionV1();

		Transaction::_deserialize($reader, $instance);
		$recipientAddress = UnresolvedAddress::deserialize($reader);
		$secret = Hash256::deserialize($reader);
		$proofSize = Converter::binaryToInt($reader->read(2), 2);
		$hashAlgorithm = LockHashAlgorithm::deserialize($reader);
		$proof = $reader->read($proofSize);

		$instance->recipientAddress = $recipientAddress;
		$instance->secret = $secret;
		$instance->hashAlgorithm = $hashAlgorithm;
		$instance->proof = $proof;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->recipientAddress->serialize());
		$writer->write($this->secret->serialize());
		$writer->write(Converter::intToBinary(strlen($this->proof), 2)); // bound: proof_size
		$writer->write($this->hashAlgorithm->serialize());
		$writer->write($this->proof);
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'recipientAddress: ' . $this->recipientAddress . ', ';
		$result .= 'secret: ' . $this->secret . ', ';
		$result .= 'hashAlgorithm: ' . $this->hashAlgorithm . ', ';
		$result .= 'proof: ' . 'hex(0x' . strtoupper(bin2hex($this->proof)) . ')' . ', ';
		$result .= ')';
		return $result;
	}
}

class EmbeddedSecretProofTransactionV1 extends EmbeddedTransaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::SECRET_PROOF;

	public ?UnresolvedAddress $recipientAddress;

	public ?Hash256 $secret;

	public ?LockHashAlgorithm $hashAlgorithm;

	public ?string $proof;

	public function __construct(
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?UnresolvedAddress $recipientAddress = null,
		?Hash256 $secret = null,
		?LockHashAlgorithm $hashAlgorithm = null,
		?string $proof = null
	){
		parent::__construct(
			$signerPublicKey,
			EmbeddedSecretProofTransactionV1::TRANSACTION_VERSION,
			$network,
			new TransactionType(EmbeddedSecretProofTransactionV1::TRANSACTION_TYPE),
		);
		$this->recipientAddress = $recipientAddress ?? new UnresolvedAddress();
		$this->secret = $secret ?? new Hash256();
		$this->hashAlgorithm = $hashAlgorithm ?? new LockHashAlgorithm();
		$this->proof = $proof ?? '';
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->recipientAddress->size();
		$size += $this->secret->size();
		$size += 2;
		$size += $this->hashAlgorithm->size();
		$size += strlen($this->proof);
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new EmbeddedSecretProofTransactionV1();

		EmbeddedTransaction::_deserialize($reader, $instance);
		$recipientAddress = UnresolvedAddress::deserialize($reader);
		$secret = Hash256::deserialize($reader);
		$proofSize = Converter::binaryToInt($reader->read(2), 2);
		$hashAlgorithm = LockHashAlgorithm::deserialize($reader);
		$proof = $reader->read($proofSize);

		$instance->recipientAddress = $recipientAddress;
		$instance->secret = $secret;
		$instance->hashAlgorithm = $hashAlgorithm;
		$instance->proof = $proof;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->recipientAddress->serialize());
		$writer->write($this->secret->serialize());
		$writer->write(Converter::intToBinary(strlen($this->proof), 2)); // bound: proof_size
		$writer->write($this->hashAlgorithm->serialize());
		$writer->write($this->proof);
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'recipientAddress: ' . $this->recipientAddress . ', ';
		$result .= 'secret: ' . $this->secret . ', ';
		$result .= 'hashAlgorithm: ' . $this->hashAlgorithm . ', ';
		$result .= 'proof: ' . 'hex(0x' . strtoupper(bin2hex($this->proof)) . ')' . ', ';
		$result .= ')';
		return $result;
	}
}

class AccountMetadataTransactionV1 extends Transaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::ACCOUNT_METADATA;

	public ?UnresolvedAddress $targetAddress;

	public ?int $scopedMetadataKey;

	public ?int $valueSizeDelta;

	public ?string $value;

	public function __construct(
		?Signature $signature = null,
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?Amount $fee = null,
		?Timestamp $deadline = null,
		?UnresolvedAddress $targetAddress = null,
		?int $scopedMetadataKey = null,
		?int $valueSizeDelta = null,
		?string $value = null
	){
		parent::__construct(
			$signature,
			$signerPublicKey,
			AccountMetadataTransactionV1::TRANSACTION_VERSION,
			$network,
			new TransactionType(AccountMetadataTransactionV1::TRANSACTION_TYPE),
			$fee,
			$deadline,
		);
		$this->targetAddress = $targetAddress ?? new UnresolvedAddress();
		$this->scopedMetadataKey = $scopedMetadataKey ?? 0;
		$this->valueSizeDelta = $valueSizeDelta ?? 0;
		$this->value = $value ?? '';
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->targetAddress->size();
		$size += 8;
		$size += 2;
		$size += 2;
		$size += strlen($this->value);
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new AccountMetadataTransactionV1();

		Transaction::_deserialize($reader, $instance);
		$targetAddress = UnresolvedAddress::deserialize($reader);
		$scopedMetadataKey = Converter::binaryToInt($reader->read(8), 8);
		$valueSizeDelta = Converter::binaryToInt($reader->read(2), 2);
		$valueSize = Converter::binaryToInt($reader->read(2), 2);
		$value = $reader->read($valueSize);

		$instance->targetAddress = $targetAddress;
		$instance->scopedMetadataKey = $scopedMetadataKey;
		$instance->valueSizeDelta = $valueSizeDelta;
		$instance->value = $value;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->targetAddress->serialize());
		$writer->write(Converter::intToBinary($this->scopedMetadataKey, 8));
		$writer->write(Converter::intToBinary($this->valueSizeDelta, 2));
		$writer->write(Converter::intToBinary(strlen($this->value), 2)); // bound: value_size
		$writer->write($this->value);
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'targetAddress: ' . $this->targetAddress . ', ';
		$result .= 'scopedMetadataKey: ' . '0x' . Converter::intToHex($this->scopedMetadataKey, 8) . ', ';
		$result .= 'valueSizeDelta: ' . '0x' . Converter::intToHex($this->valueSizeDelta, 2) . ', ';
		$result .= 'value: ' . 'hex(0x' . strtoupper(bin2hex($this->value)) . ')' . ', ';
		$result .= ')';
		return $result;
	}
}

class EmbeddedAccountMetadataTransactionV1 extends EmbeddedTransaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::ACCOUNT_METADATA;

	public ?UnresolvedAddress $targetAddress;

	public ?int $scopedMetadataKey;

	public ?int $valueSizeDelta;

	public ?string $value;

	public function __construct(
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?UnresolvedAddress $targetAddress = null,
		?int $scopedMetadataKey = null,
		?int $valueSizeDelta = null,
		?string $value = null
	){
		parent::__construct(
			$signerPublicKey,
			EmbeddedAccountMetadataTransactionV1::TRANSACTION_VERSION,
			$network,
			new TransactionType(EmbeddedAccountMetadataTransactionV1::TRANSACTION_TYPE),
		);
		$this->targetAddress = $targetAddress ?? new UnresolvedAddress();
		$this->scopedMetadataKey = $scopedMetadataKey ?? 0;
		$this->valueSizeDelta = $valueSizeDelta ?? 0;
		$this->value = $value ?? '';
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->targetAddress->size();
		$size += 8;
		$size += 2;
		$size += 2;
		$size += strlen($this->value);
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new EmbeddedAccountMetadataTransactionV1();

		EmbeddedTransaction::_deserialize($reader, $instance);
		$targetAddress = UnresolvedAddress::deserialize($reader);
		$scopedMetadataKey = Converter::binaryToInt($reader->read(8), 8);
		$valueSizeDelta = Converter::binaryToInt($reader->read(2), 2);
		$valueSize = Converter::binaryToInt($reader->read(2), 2);
		$value = $reader->read($valueSize);

		$instance->targetAddress = $targetAddress;
		$instance->scopedMetadataKey = $scopedMetadataKey;
		$instance->valueSizeDelta = $valueSizeDelta;
		$instance->value = $value;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->targetAddress->serialize());
		$writer->write(Converter::intToBinary($this->scopedMetadataKey, 8));
		$writer->write(Converter::intToBinary($this->valueSizeDelta, 2));
		$writer->write(Converter::intToBinary(strlen($this->value), 2)); // bound: value_size
		$writer->write($this->value);
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'targetAddress: ' . $this->targetAddress . ', ';
		$result .= 'scopedMetadataKey: ' . '0x' . Converter::intToHex($this->scopedMetadataKey, 8) . ', ';
		$result .= 'valueSizeDelta: ' . '0x' . Converter::intToHex($this->valueSizeDelta, 2) . ', ';
		$result .= 'value: ' . 'hex(0x' . strtoupper(bin2hex($this->value)) . ')' . ', ';
		$result .= ')';
		return $result;
	}
}

class MosaicMetadataTransactionV1 extends Transaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::MOSAIC_METADATA;

	public ?UnresolvedAddress $targetAddress;

	public ?int $scopedMetadataKey;

	public ?UnresolvedMosaicId $targetMosaicId;

	public ?int $valueSizeDelta;

	public ?string $value;

	public function __construct(
		?Signature $signature = null,
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?Amount $fee = null,
		?Timestamp $deadline = null,
		?UnresolvedAddress $targetAddress = null,
		?int $scopedMetadataKey = null,
		?UnresolvedMosaicId $targetMosaicId = null,
		?int $valueSizeDelta = null,
		?string $value = null
	){
		parent::__construct(
			$signature,
			$signerPublicKey,
			MosaicMetadataTransactionV1::TRANSACTION_VERSION,
			$network,
			new TransactionType(MosaicMetadataTransactionV1::TRANSACTION_TYPE),
			$fee,
			$deadline,
		);
		$this->targetAddress = $targetAddress ?? new UnresolvedAddress();
		$this->scopedMetadataKey = $scopedMetadataKey ?? 0;
		$this->targetMosaicId = $targetMosaicId ?? new UnresolvedMosaicId();
		$this->valueSizeDelta = $valueSizeDelta ?? 0;
		$this->value = $value ?? '';
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->targetAddress->size();
		$size += 8;
		$size += $this->targetMosaicId->size();
		$size += 2;
		$size += 2;
		$size += strlen($this->value);
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new MosaicMetadataTransactionV1();

		Transaction::_deserialize($reader, $instance);
		$targetAddress = UnresolvedAddress::deserialize($reader);
		$scopedMetadataKey = Converter::binaryToInt($reader->read(8), 8);
		$targetMosaicId = UnresolvedMosaicId::deserialize($reader);
		$valueSizeDelta = Converter::binaryToInt($reader->read(2), 2);
		$valueSize = Converter::binaryToInt($reader->read(2), 2);
		$value = $reader->read($valueSize);

		$instance->targetAddress = $targetAddress;
		$instance->scopedMetadataKey = $scopedMetadataKey;
		$instance->targetMosaicId = $targetMosaicId;
		$instance->valueSizeDelta = $valueSizeDelta;
		$instance->value = $value;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->targetAddress->serialize());
		$writer->write(Converter::intToBinary($this->scopedMetadataKey, 8));
		$writer->write($this->targetMosaicId->serialize());
		$writer->write(Converter::intToBinary($this->valueSizeDelta, 2));
		$writer->write(Converter::intToBinary(strlen($this->value), 2)); // bound: value_size
		$writer->write($this->value);
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'targetAddress: ' . $this->targetAddress . ', ';
		$result .= 'scopedMetadataKey: ' . '0x' . Converter::intToHex($this->scopedMetadataKey, 8) . ', ';
		$result .= 'targetMosaicId: ' . $this->targetMosaicId . ', ';
		$result .= 'valueSizeDelta: ' . '0x' . Converter::intToHex($this->valueSizeDelta, 2) . ', ';
		$result .= 'value: ' . 'hex(0x' . strtoupper(bin2hex($this->value)) . ')' . ', ';
		$result .= ')';
		return $result;
	}
}

class EmbeddedMosaicMetadataTransactionV1 extends EmbeddedTransaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::MOSAIC_METADATA;

	public ?UnresolvedAddress $targetAddress;

	public ?int $scopedMetadataKey;

	public ?UnresolvedMosaicId $targetMosaicId;

	public ?int $valueSizeDelta;

	public ?string $value;

	public function __construct(
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?UnresolvedAddress $targetAddress = null,
		?int $scopedMetadataKey = null,
		?UnresolvedMosaicId $targetMosaicId = null,
		?int $valueSizeDelta = null,
		?string $value = null
	){
		parent::__construct(
			$signerPublicKey,
			EmbeddedMosaicMetadataTransactionV1::TRANSACTION_VERSION,
			$network,
			new TransactionType(EmbeddedMosaicMetadataTransactionV1::TRANSACTION_TYPE),
		);
		$this->targetAddress = $targetAddress ?? new UnresolvedAddress();
		$this->scopedMetadataKey = $scopedMetadataKey ?? 0;
		$this->targetMosaicId = $targetMosaicId ?? new UnresolvedMosaicId();
		$this->valueSizeDelta = $valueSizeDelta ?? 0;
		$this->value = $value ?? '';
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->targetAddress->size();
		$size += 8;
		$size += $this->targetMosaicId->size();
		$size += 2;
		$size += 2;
		$size += strlen($this->value);
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new EmbeddedMosaicMetadataTransactionV1();

		EmbeddedTransaction::_deserialize($reader, $instance);
		$targetAddress = UnresolvedAddress::deserialize($reader);
		$scopedMetadataKey = Converter::binaryToInt($reader->read(8), 8);
		$targetMosaicId = UnresolvedMosaicId::deserialize($reader);
		$valueSizeDelta = Converter::binaryToInt($reader->read(2), 2);
		$valueSize = Converter::binaryToInt($reader->read(2), 2);
		$value = $reader->read($valueSize);

		$instance->targetAddress = $targetAddress;
		$instance->scopedMetadataKey = $scopedMetadataKey;
		$instance->targetMosaicId = $targetMosaicId;
		$instance->valueSizeDelta = $valueSizeDelta;
		$instance->value = $value;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->targetAddress->serialize());
		$writer->write(Converter::intToBinary($this->scopedMetadataKey, 8));
		$writer->write($this->targetMosaicId->serialize());
		$writer->write(Converter::intToBinary($this->valueSizeDelta, 2));
		$writer->write(Converter::intToBinary(strlen($this->value), 2)); // bound: value_size
		$writer->write($this->value);
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'targetAddress: ' . $this->targetAddress . ', ';
		$result .= 'scopedMetadataKey: ' . '0x' . Converter::intToHex($this->scopedMetadataKey, 8) . ', ';
		$result .= 'targetMosaicId: ' . $this->targetMosaicId . ', ';
		$result .= 'valueSizeDelta: ' . '0x' . Converter::intToHex($this->valueSizeDelta, 2) . ', ';
		$result .= 'value: ' . 'hex(0x' . strtoupper(bin2hex($this->value)) . ')' . ', ';
		$result .= ')';
		return $result;
	}
}

class NamespaceMetadataTransactionV1 extends Transaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::NAMESPACE_METADATA;

	public ?UnresolvedAddress $targetAddress;

	public ?int $scopedMetadataKey;

	public ?NamespaceId $targetNamespaceId;

	public ?int $valueSizeDelta;

	public ?string $value;

	public function __construct(
		?Signature $signature = null,
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?Amount $fee = null,
		?Timestamp $deadline = null,
		?UnresolvedAddress $targetAddress = null,
		?int $scopedMetadataKey = null,
		?NamespaceId $targetNamespaceId = null,
		?int $valueSizeDelta = null,
		?string $value = null
	){
		parent::__construct(
			$signature,
			$signerPublicKey,
			NamespaceMetadataTransactionV1::TRANSACTION_VERSION,
			$network,
			new TransactionType(NamespaceMetadataTransactionV1::TRANSACTION_TYPE),
			$fee,
			$deadline,
		);
		$this->targetAddress = $targetAddress ?? new UnresolvedAddress();
		$this->scopedMetadataKey = $scopedMetadataKey ?? 0;
		$this->targetNamespaceId = $targetNamespaceId ?? new NamespaceId();
		$this->valueSizeDelta = $valueSizeDelta ?? 0;
		$this->value = $value ?? '';
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->targetAddress->size();
		$size += 8;
		$size += $this->targetNamespaceId->size();
		$size += 2;
		$size += 2;
		$size += strlen($this->value);
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new NamespaceMetadataTransactionV1();

		Transaction::_deserialize($reader, $instance);
		$targetAddress = UnresolvedAddress::deserialize($reader);
		$scopedMetadataKey = Converter::binaryToInt($reader->read(8), 8);
		$targetNamespaceId = NamespaceId::deserialize($reader);
		$valueSizeDelta = Converter::binaryToInt($reader->read(2), 2);
		$valueSize = Converter::binaryToInt($reader->read(2), 2);
		$value = $reader->read($valueSize);

		$instance->targetAddress = $targetAddress;
		$instance->scopedMetadataKey = $scopedMetadataKey;
		$instance->targetNamespaceId = $targetNamespaceId;
		$instance->valueSizeDelta = $valueSizeDelta;
		$instance->value = $value;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->targetAddress->serialize());
		$writer->write(Converter::intToBinary($this->scopedMetadataKey, 8));
		$writer->write($this->targetNamespaceId->serialize());
		$writer->write(Converter::intToBinary($this->valueSizeDelta, 2));
		$writer->write(Converter::intToBinary(strlen($this->value), 2)); // bound: value_size
		$writer->write($this->value);
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'targetAddress: ' . $this->targetAddress . ', ';
		$result .= 'scopedMetadataKey: ' . '0x' . Converter::intToHex($this->scopedMetadataKey, 8) . ', ';
		$result .= 'targetNamespaceId: ' . $this->targetNamespaceId . ', ';
		$result .= 'valueSizeDelta: ' . '0x' . Converter::intToHex($this->valueSizeDelta, 2) . ', ';
		$result .= 'value: ' . 'hex(0x' . strtoupper(bin2hex($this->value)) . ')' . ', ';
		$result .= ')';
		return $result;
	}
}

class EmbeddedNamespaceMetadataTransactionV1 extends EmbeddedTransaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::NAMESPACE_METADATA;

	public ?UnresolvedAddress $targetAddress;

	public ?int $scopedMetadataKey;

	public ?NamespaceId $targetNamespaceId;

	public ?int $valueSizeDelta;

	public ?string $value;

	public function __construct(
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?UnresolvedAddress $targetAddress = null,
		?int $scopedMetadataKey = null,
		?NamespaceId $targetNamespaceId = null,
		?int $valueSizeDelta = null,
		?string $value = null
	){
		parent::__construct(
			$signerPublicKey,
			EmbeddedNamespaceMetadataTransactionV1::TRANSACTION_VERSION,
			$network,
			new TransactionType(EmbeddedNamespaceMetadataTransactionV1::TRANSACTION_TYPE),
		);
		$this->targetAddress = $targetAddress ?? new UnresolvedAddress();
		$this->scopedMetadataKey = $scopedMetadataKey ?? 0;
		$this->targetNamespaceId = $targetNamespaceId ?? new NamespaceId();
		$this->valueSizeDelta = $valueSizeDelta ?? 0;
		$this->value = $value ?? '';
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->targetAddress->size();
		$size += 8;
		$size += $this->targetNamespaceId->size();
		$size += 2;
		$size += 2;
		$size += strlen($this->value);
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new EmbeddedNamespaceMetadataTransactionV1();

		EmbeddedTransaction::_deserialize($reader, $instance);
		$targetAddress = UnresolvedAddress::deserialize($reader);
		$scopedMetadataKey = Converter::binaryToInt($reader->read(8), 8);
		$targetNamespaceId = NamespaceId::deserialize($reader);
		$valueSizeDelta = Converter::binaryToInt($reader->read(2), 2);
		$valueSize = Converter::binaryToInt($reader->read(2), 2);
		$value = $reader->read($valueSize);

		$instance->targetAddress = $targetAddress;
		$instance->scopedMetadataKey = $scopedMetadataKey;
		$instance->targetNamespaceId = $targetNamespaceId;
		$instance->valueSizeDelta = $valueSizeDelta;
		$instance->value = $value;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->targetAddress->serialize());
		$writer->write(Converter::intToBinary($this->scopedMetadataKey, 8));
		$writer->write($this->targetNamespaceId->serialize());
		$writer->write(Converter::intToBinary($this->valueSizeDelta, 2));
		$writer->write(Converter::intToBinary(strlen($this->value), 2)); // bound: value_size
		$writer->write($this->value);
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'targetAddress: ' . $this->targetAddress . ', ';
		$result .= 'scopedMetadataKey: ' . '0x' . Converter::intToHex($this->scopedMetadataKey, 8) . ', ';
		$result .= 'targetNamespaceId: ' . $this->targetNamespaceId . ', ';
		$result .= 'valueSizeDelta: ' . '0x' . Converter::intToHex($this->valueSizeDelta, 2) . ', ';
		$result .= 'value: ' . 'hex(0x' . strtoupper(bin2hex($this->value)) . ')' . ', ';
		$result .= ')';
		return $result;
	}
}

class MosaicNonce extends BaseValue {
	public function __construct($mosaicNonce = 0){
		parent::__construct(4, $mosaicNonce);
	}

	public static function size(): int {
		return 4;
	}

	public static function deserialize(BinaryReader $reader): self {
		return new self(Converter::binaryToInt($reader->read(4), 4));
	}

	public function serialize(): string {
		return Converter::intToBinary($this->value, 4);
	}
}

class MosaicFlags {
	const NONE = 0;

	const SUPPLY_MUTABLE = 1;

	const TRANSFERABLE = 2;

	const RESTRICTABLE = 4;

	const REVOKABLE = 8;

	public $value;

	public function __construct($value = 0){
		$this->value = $value;
	}

	public function has($flag): bool {
		return 0 !== ($this->value & $flag);
	}

	public static function size(){
		return 1;
	}

	public static function deserialize(BinaryReader $reader): self {
		return new MosaicFlags(Converter::binaryToInt($reader->read(1), 1));
	}

	public function serialize(): string {
		return Converter::intToBinary($this->value, 1);
	}

	public function __toString(){
		$values = [
			0, 1, 2, 4, 8
		];
		$keys = [
			'NONE', 'SUPPLY_MUTABLE', 'TRANSFERABLE', 'RESTRICTABLE', 'REVOKABLE'
		];

		if ($this->value === 0) {
			$index = array_search($this->value, $values);
			return "MosaicFlags.{$keys[$values[$index]]}";
		}

		$positions = array_keys(array_filter($values, fn ($flag) => ($this->value & $flag) !== 0));
		$result = array_map(fn ($n) => "MosaicFlags.{$keys[$n]}", $positions);

		return implode('|', $result);
	}
}

class MosaicSupplyChangeAction {
	const DECREASE = 0;

	const INCREASE = 1;

	public $value;

	public function __construct($value = 0){
		$this->value = $value;
	}

	static function valueToKey($value){
		$values = [
			0, 1
		];
		$keys = [
			'DECREASE', 'INCREASE'
		];

		$index = array_search($value, $values);
		if ($index === false)
			throw new Exception("Invalid enum value: {$value}");

		return $keys[$index];
	}

	public static function size(){
		return 1;
	}

	public static function deserialize(BinaryReader $reader): self {
		return new MosaicSupplyChangeAction(Converter::binaryToInt($reader->read(1), 1));
	}

	public function serialize(): string {
		return Converter::intToBinary($this->value, 1);
	}

	public function __toString(){
		return "MosaicSupplyChangeAction." . self::valueToKey($this->value);
	}
}

class MosaicDefinitionTransactionV1 extends Transaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::MOSAIC_DEFINITION;

	public ?MosaicId $id;

	public ?BlockDuration $duration;

	public ?MosaicNonce $nonce;

	public ?MosaicFlags $flags;

	public ?int $divisibility;

	public function __construct(
		?Signature $signature = null,
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?Amount $fee = null,
		?Timestamp $deadline = null,
		?MosaicId $id = null,
		?BlockDuration $duration = null,
		?MosaicNonce $nonce = null,
		?MosaicFlags $flags = null,
		?int $divisibility = null
	){
		parent::__construct(
			$signature,
			$signerPublicKey,
			MosaicDefinitionTransactionV1::TRANSACTION_VERSION,
			$network,
			new TransactionType(MosaicDefinitionTransactionV1::TRANSACTION_TYPE),
			$fee,
			$deadline,
		);
		$this->id = $id ?? new MosaicId();
		$this->duration = $duration ?? new BlockDuration();
		$this->nonce = $nonce ?? new MosaicNonce();
		$this->flags = $flags ?? new MosaicFlags();
		$this->divisibility = $divisibility ?? 0;
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->id->size();
		$size += $this->duration->size();
		$size += $this->nonce->size();
		$size += $this->flags->size();
		$size += 1;
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new MosaicDefinitionTransactionV1();

		Transaction::_deserialize($reader, $instance);
		$id = MosaicId::deserialize($reader);
		$duration = BlockDuration::deserialize($reader);
		$nonce = MosaicNonce::deserialize($reader);
		$flags = MosaicFlags::deserialize($reader);
		$divisibility = Converter::binaryToInt($reader->read(1), 1);

		$instance->id = $id;
		$instance->duration = $duration;
		$instance->nonce = $nonce;
		$instance->flags = $flags;
		$instance->divisibility = $divisibility;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->id->serialize());
		$writer->write($this->duration->serialize());
		$writer->write($this->nonce->serialize());
		$writer->write($this->flags->serialize());
		$writer->write(Converter::intToBinary($this->divisibility, 1));
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'id: ' . $this->id . ', ';
		$result .= 'duration: ' . $this->duration . ', ';
		$result .= 'nonce: ' . $this->nonce . ', ';
		$result .= 'flags: ' . $this->flags . ', ';
		$result .= 'divisibility: ' . '0x' . Converter::intToHex($this->divisibility, 1) . ', ';
		$result .= ')';
		return $result;
	}
}

class EmbeddedMosaicDefinitionTransactionV1 extends EmbeddedTransaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::MOSAIC_DEFINITION;

	public ?MosaicId $id;

	public ?BlockDuration $duration;

	public ?MosaicNonce $nonce;

	public ?MosaicFlags $flags;

	public ?int $divisibility;

	public function __construct(
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?MosaicId $id = null,
		?BlockDuration $duration = null,
		?MosaicNonce $nonce = null,
		?MosaicFlags $flags = null,
		?int $divisibility = null
	){
		parent::__construct(
			$signerPublicKey,
			EmbeddedMosaicDefinitionTransactionV1::TRANSACTION_VERSION,
			$network,
			new TransactionType(EmbeddedMosaicDefinitionTransactionV1::TRANSACTION_TYPE),
		);
		$this->id = $id ?? new MosaicId();
		$this->duration = $duration ?? new BlockDuration();
		$this->nonce = $nonce ?? new MosaicNonce();
		$this->flags = $flags ?? new MosaicFlags();
		$this->divisibility = $divisibility ?? 0;
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->id->size();
		$size += $this->duration->size();
		$size += $this->nonce->size();
		$size += $this->flags->size();
		$size += 1;
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new EmbeddedMosaicDefinitionTransactionV1();

		EmbeddedTransaction::_deserialize($reader, $instance);
		$id = MosaicId::deserialize($reader);
		$duration = BlockDuration::deserialize($reader);
		$nonce = MosaicNonce::deserialize($reader);
		$flags = MosaicFlags::deserialize($reader);
		$divisibility = Converter::binaryToInt($reader->read(1), 1);

		$instance->id = $id;
		$instance->duration = $duration;
		$instance->nonce = $nonce;
		$instance->flags = $flags;
		$instance->divisibility = $divisibility;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->id->serialize());
		$writer->write($this->duration->serialize());
		$writer->write($this->nonce->serialize());
		$writer->write($this->flags->serialize());
		$writer->write(Converter::intToBinary($this->divisibility, 1));
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'id: ' . $this->id . ', ';
		$result .= 'duration: ' . $this->duration . ', ';
		$result .= 'nonce: ' . $this->nonce . ', ';
		$result .= 'flags: ' . $this->flags . ', ';
		$result .= 'divisibility: ' . '0x' . Converter::intToHex($this->divisibility, 1) . ', ';
		$result .= ')';
		return $result;
	}
}

class MosaicSupplyChangeTransactionV1 extends Transaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::MOSAIC_SUPPLY_CHANGE;

	public ?UnresolvedMosaicId $mosaicId;

	public ?Amount $delta;

	public ?MosaicSupplyChangeAction $action;

	public function __construct(
		?Signature $signature = null,
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?Amount $fee = null,
		?Timestamp $deadline = null,
		?UnresolvedMosaicId $mosaicId = null,
		?Amount $delta = null,
		?MosaicSupplyChangeAction $action = null
	){
		parent::__construct(
			$signature,
			$signerPublicKey,
			MosaicSupplyChangeTransactionV1::TRANSACTION_VERSION,
			$network,
			new TransactionType(MosaicSupplyChangeTransactionV1::TRANSACTION_TYPE),
			$fee,
			$deadline,
		);
		$this->mosaicId = $mosaicId ?? new UnresolvedMosaicId();
		$this->delta = $delta ?? new Amount();
		$this->action = $action ?? new MosaicSupplyChangeAction();
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->mosaicId->size();
		$size += $this->delta->size();
		$size += $this->action->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new MosaicSupplyChangeTransactionV1();

		Transaction::_deserialize($reader, $instance);
		$mosaicId = UnresolvedMosaicId::deserialize($reader);
		$delta = Amount::deserialize($reader);
		$action = MosaicSupplyChangeAction::deserialize($reader);

		$instance->mosaicId = $mosaicId;
		$instance->delta = $delta;
		$instance->action = $action;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->mosaicId->serialize());
		$writer->write($this->delta->serialize());
		$writer->write($this->action->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'mosaicId: ' . $this->mosaicId . ', ';
		$result .= 'delta: ' . $this->delta . ', ';
		$result .= 'action: ' . $this->action . ', ';
		$result .= ')';
		return $result;
	}
}

class EmbeddedMosaicSupplyChangeTransactionV1 extends EmbeddedTransaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::MOSAIC_SUPPLY_CHANGE;

	public ?UnresolvedMosaicId $mosaicId;

	public ?Amount $delta;

	public ?MosaicSupplyChangeAction $action;

	public function __construct(
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?UnresolvedMosaicId $mosaicId = null,
		?Amount $delta = null,
		?MosaicSupplyChangeAction $action = null
	){
		parent::__construct(
			$signerPublicKey,
			EmbeddedMosaicSupplyChangeTransactionV1::TRANSACTION_VERSION,
			$network,
			new TransactionType(EmbeddedMosaicSupplyChangeTransactionV1::TRANSACTION_TYPE),
		);
		$this->mosaicId = $mosaicId ?? new UnresolvedMosaicId();
		$this->delta = $delta ?? new Amount();
		$this->action = $action ?? new MosaicSupplyChangeAction();
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->mosaicId->size();
		$size += $this->delta->size();
		$size += $this->action->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new EmbeddedMosaicSupplyChangeTransactionV1();

		EmbeddedTransaction::_deserialize($reader, $instance);
		$mosaicId = UnresolvedMosaicId::deserialize($reader);
		$delta = Amount::deserialize($reader);
		$action = MosaicSupplyChangeAction::deserialize($reader);

		$instance->mosaicId = $mosaicId;
		$instance->delta = $delta;
		$instance->action = $action;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->mosaicId->serialize());
		$writer->write($this->delta->serialize());
		$writer->write($this->action->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'mosaicId: ' . $this->mosaicId . ', ';
		$result .= 'delta: ' . $this->delta . ', ';
		$result .= 'action: ' . $this->action . ', ';
		$result .= ')';
		return $result;
	}
}

class MosaicSupplyRevocationTransactionV1 extends Transaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::MOSAIC_SUPPLY_REVOCATION;

	public ?UnresolvedAddress $sourceAddress;

	public ?UnresolvedMosaic $mosaic;

	public function __construct(
		?Signature $signature = null,
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?Amount $fee = null,
		?Timestamp $deadline = null,
		?UnresolvedAddress $sourceAddress = null,
		?UnresolvedMosaic $mosaic = null
	){
		parent::__construct(
			$signature,
			$signerPublicKey,
			MosaicSupplyRevocationTransactionV1::TRANSACTION_VERSION,
			$network,
			new TransactionType(MosaicSupplyRevocationTransactionV1::TRANSACTION_TYPE),
			$fee,
			$deadline,
		);
		$this->sourceAddress = $sourceAddress ?? new UnresolvedAddress();
		$this->mosaic = $mosaic ?? new UnresolvedMosaic();
	}

	public function sort(){
		$this->mosaic->sort();
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->sourceAddress->size();
		$size += $this->mosaic->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new MosaicSupplyRevocationTransactionV1();

		Transaction::_deserialize($reader, $instance);
		$sourceAddress = UnresolvedAddress::deserialize($reader);
		$mosaic = UnresolvedMosaic::deserialize($reader);

		$instance->sourceAddress = $sourceAddress;
		$instance->mosaic = $mosaic;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->sourceAddress->serialize());
		$writer->write($this->mosaic->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'sourceAddress: ' . $this->sourceAddress . ', ';
		$result .= 'mosaic: ' . $this->mosaic . ', ';
		$result .= ')';
		return $result;
	}
}

class EmbeddedMosaicSupplyRevocationTransactionV1 extends EmbeddedTransaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::MOSAIC_SUPPLY_REVOCATION;

	public ?UnresolvedAddress $sourceAddress;

	public ?UnresolvedMosaic $mosaic;

	public function __construct(
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?UnresolvedAddress $sourceAddress = null,
		?UnresolvedMosaic $mosaic = null
	){
		parent::__construct(
			$signerPublicKey,
			EmbeddedMosaicSupplyRevocationTransactionV1::TRANSACTION_VERSION,
			$network,
			new TransactionType(EmbeddedMosaicSupplyRevocationTransactionV1::TRANSACTION_TYPE),
		);
		$this->sourceAddress = $sourceAddress ?? new UnresolvedAddress();
		$this->mosaic = $mosaic ?? new UnresolvedMosaic();
	}

	public function sort(){
		$this->mosaic->sort();
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->sourceAddress->size();
		$size += $this->mosaic->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new EmbeddedMosaicSupplyRevocationTransactionV1();

		EmbeddedTransaction::_deserialize($reader, $instance);
		$sourceAddress = UnresolvedAddress::deserialize($reader);
		$mosaic = UnresolvedMosaic::deserialize($reader);

		$instance->sourceAddress = $sourceAddress;
		$instance->mosaic = $mosaic;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->sourceAddress->serialize());
		$writer->write($this->mosaic->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'sourceAddress: ' . $this->sourceAddress . ', ';
		$result .= 'mosaic: ' . $this->mosaic . ', ';
		$result .= ')';
		return $result;
	}
}

class MultisigAccountModificationTransactionV1 extends Transaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::MULTISIG_ACCOUNT_MODIFICATION;

	public ?int $minRemovalDelta;

	public ?int $minApprovalDelta;

	public ?array $addressAdditions;

	public ?array $addressDeletions;

	private int $multisigAccountModificationTransactionBodyReserved_1 = 0; // reserved field

	public function __construct(
		?Signature $signature = null,
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?Amount $fee = null,
		?Timestamp $deadline = null,
		?int $minRemovalDelta = null,
		?int $minApprovalDelta = null,
		?array $addressAdditions = null,
		?array $addressDeletions = null
	){
		parent::__construct(
			$signature,
			$signerPublicKey,
			MultisigAccountModificationTransactionV1::TRANSACTION_VERSION,
			$network,
			new TransactionType(MultisigAccountModificationTransactionV1::TRANSACTION_TYPE),
			$fee,
			$deadline,
		);
		$this->minRemovalDelta = $minRemovalDelta ?? 0;
		$this->minApprovalDelta = $minApprovalDelta ?? 0;
		$this->addressAdditions = $addressAdditions ?? [];
		$this->addressDeletions = $addressDeletions ?? [];
		$this->multisigAccountModificationTransactionBodyReserved_1 = 0; // reserved field
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += 1;
		$size += 1;
		$size += 1;
		$size += 1;
		$size += 4;
		$size += ArrayHelpers::size($this->addressAdditions);
		$size += ArrayHelpers::size($this->addressDeletions);
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new MultisigAccountModificationTransactionV1();

		Transaction::_deserialize($reader, $instance);
		$minRemovalDelta = Converter::binaryToInt($reader->read(1), 1);
		$minApprovalDelta = Converter::binaryToInt($reader->read(1), 1);
		$addressAdditionsCount = Converter::binaryToInt($reader->read(1), 1);
		$addressDeletionsCount = Converter::binaryToInt($reader->read(1), 1);
		$multisigAccountModificationTransactionBodyReserved_1 = Converter::binaryToInt($reader->read(4), 4);
		if (0 !== $multisigAccountModificationTransactionBodyReserved_1)
			throw new OutOfRangeException('Invalid value of reserved field (' . $multisigAccountModificationTransactionBodyReserved_1 . ')');
		$addressAdditions = ArrayHelpers::readArrayCount($reader, [UnresolvedAddress::class, 'deserialize'], $addressAdditionsCount);
		$addressDeletions = ArrayHelpers::readArrayCount($reader, [UnresolvedAddress::class, 'deserialize'], $addressDeletionsCount);

		$instance->minRemovalDelta = $minRemovalDelta;
		$instance->minApprovalDelta = $minApprovalDelta;
		$instance->addressAdditions = $addressAdditions;
		$instance->addressDeletions = $addressDeletions;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write(Converter::intToBinary($this->minRemovalDelta, 1));
		$writer->write(Converter::intToBinary($this->minApprovalDelta, 1));
		$writer->write(Converter::intToBinary(count($this->addressAdditions), 1)); // bound: address_additions_count
		$writer->write(Converter::intToBinary(count($this->addressDeletions), 1)); // bound: address_deletions_count
		$writer->write(Converter::intToBinary($this->multisigAccountModificationTransactionBodyReserved_1, 4));
		ArrayHelpers::writeArray($writer, $this->addressAdditions);
		ArrayHelpers::writeArray($writer, $this->addressDeletions);
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'minRemovalDelta: ' . '0x' . Converter::intToHex($this->minRemovalDelta, 1) . ', ';
		$result .= 'minApprovalDelta: ' . '0x' . Converter::intToHex($this->minApprovalDelta, 1) . ', ';
		$result .= 'addressAdditions: ' . '[' . implode(',', array_map(fn ($e) => $e, $this->addressAdditions)) . ']' . ', ';
		$result .= 'addressDeletions: ' . '[' . implode(',', array_map(fn ($e) => $e, $this->addressDeletions)) . ']' . ', ';
		$result .= ')';
		return $result;
	}
}

class EmbeddedMultisigAccountModificationTransactionV1 extends EmbeddedTransaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::MULTISIG_ACCOUNT_MODIFICATION;

	public ?int $minRemovalDelta;

	public ?int $minApprovalDelta;

	public ?array $addressAdditions;

	public ?array $addressDeletions;

	private int $multisigAccountModificationTransactionBodyReserved_1 = 0; // reserved field

	public function __construct(
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?int $minRemovalDelta = null,
		?int $minApprovalDelta = null,
		?array $addressAdditions = null,
		?array $addressDeletions = null
	){
		parent::__construct(
			$signerPublicKey,
			EmbeddedMultisigAccountModificationTransactionV1::TRANSACTION_VERSION,
			$network,
			new TransactionType(EmbeddedMultisigAccountModificationTransactionV1::TRANSACTION_TYPE),
		);
		$this->minRemovalDelta = $minRemovalDelta ?? 0;
		$this->minApprovalDelta = $minApprovalDelta ?? 0;
		$this->addressAdditions = $addressAdditions ?? [];
		$this->addressDeletions = $addressDeletions ?? [];
		$this->multisigAccountModificationTransactionBodyReserved_1 = 0; // reserved field
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += 1;
		$size += 1;
		$size += 1;
		$size += 1;
		$size += 4;
		$size += ArrayHelpers::size($this->addressAdditions);
		$size += ArrayHelpers::size($this->addressDeletions);
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new EmbeddedMultisigAccountModificationTransactionV1();

		EmbeddedTransaction::_deserialize($reader, $instance);
		$minRemovalDelta = Converter::binaryToInt($reader->read(1), 1);
		$minApprovalDelta = Converter::binaryToInt($reader->read(1), 1);
		$addressAdditionsCount = Converter::binaryToInt($reader->read(1), 1);
		$addressDeletionsCount = Converter::binaryToInt($reader->read(1), 1);
		$multisigAccountModificationTransactionBodyReserved_1 = Converter::binaryToInt($reader->read(4), 4);
		if (0 !== $multisigAccountModificationTransactionBodyReserved_1)
			throw new OutOfRangeException('Invalid value of reserved field (' . $multisigAccountModificationTransactionBodyReserved_1 . ')');
		$addressAdditions = ArrayHelpers::readArrayCount($reader, [UnresolvedAddress::class, 'deserialize'], $addressAdditionsCount);
		$addressDeletions = ArrayHelpers::readArrayCount($reader, [UnresolvedAddress::class, 'deserialize'], $addressDeletionsCount);

		$instance->minRemovalDelta = $minRemovalDelta;
		$instance->minApprovalDelta = $minApprovalDelta;
		$instance->addressAdditions = $addressAdditions;
		$instance->addressDeletions = $addressDeletions;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write(Converter::intToBinary($this->minRemovalDelta, 1));
		$writer->write(Converter::intToBinary($this->minApprovalDelta, 1));
		$writer->write(Converter::intToBinary(count($this->addressAdditions), 1)); // bound: address_additions_count
		$writer->write(Converter::intToBinary(count($this->addressDeletions), 1)); // bound: address_deletions_count
		$writer->write(Converter::intToBinary($this->multisigAccountModificationTransactionBodyReserved_1, 4));
		ArrayHelpers::writeArray($writer, $this->addressAdditions);
		ArrayHelpers::writeArray($writer, $this->addressDeletions);
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'minRemovalDelta: ' . '0x' . Converter::intToHex($this->minRemovalDelta, 1) . ', ';
		$result .= 'minApprovalDelta: ' . '0x' . Converter::intToHex($this->minApprovalDelta, 1) . ', ';
		$result .= 'addressAdditions: ' . '[' . implode(',', array_map(fn ($e) => $e, $this->addressAdditions)) . ']' . ', ';
		$result .= 'addressDeletions: ' . '[' . implode(',', array_map(fn ($e) => $e, $this->addressDeletions)) . ']' . ', ';
		$result .= ')';
		return $result;
	}
}

class AddressAliasTransactionV1 extends Transaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::ADDRESS_ALIAS;

	public ?NamespaceId $namespaceId;

	public ?Address $address;

	public ?AliasAction $aliasAction;

	public function __construct(
		?Signature $signature = null,
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?Amount $fee = null,
		?Timestamp $deadline = null,
		?NamespaceId $namespaceId = null,
		?Address $address = null,
		?AliasAction $aliasAction = null
	){
		parent::__construct(
			$signature,
			$signerPublicKey,
			AddressAliasTransactionV1::TRANSACTION_VERSION,
			$network,
			new TransactionType(AddressAliasTransactionV1::TRANSACTION_TYPE),
			$fee,
			$deadline,
		);
		$this->namespaceId = $namespaceId ?? new NamespaceId();
		$this->address = $address ?? new Address();
		$this->aliasAction = $aliasAction ?? new AliasAction();
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->namespaceId->size();
		$size += $this->address->size();
		$size += $this->aliasAction->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new AddressAliasTransactionV1();

		Transaction::_deserialize($reader, $instance);
		$namespaceId = NamespaceId::deserialize($reader);
		$address = Address::deserialize($reader);
		$aliasAction = AliasAction::deserialize($reader);

		$instance->namespaceId = $namespaceId;
		$instance->address = $address;
		$instance->aliasAction = $aliasAction;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->namespaceId->serialize());
		$writer->write($this->address->serialize());
		$writer->write($this->aliasAction->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'namespaceId: ' . $this->namespaceId . ', ';
		$result .= 'address: ' . $this->address . ', ';
		$result .= 'aliasAction: ' . $this->aliasAction . ', ';
		$result .= ')';
		return $result;
	}
}

class EmbeddedAddressAliasTransactionV1 extends EmbeddedTransaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::ADDRESS_ALIAS;

	public ?NamespaceId $namespaceId;

	public ?Address $address;

	public ?AliasAction $aliasAction;

	public function __construct(
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?NamespaceId $namespaceId = null,
		?Address $address = null,
		?AliasAction $aliasAction = null
	){
		parent::__construct(
			$signerPublicKey,
			EmbeddedAddressAliasTransactionV1::TRANSACTION_VERSION,
			$network,
			new TransactionType(EmbeddedAddressAliasTransactionV1::TRANSACTION_TYPE),
		);
		$this->namespaceId = $namespaceId ?? new NamespaceId();
		$this->address = $address ?? new Address();
		$this->aliasAction = $aliasAction ?? new AliasAction();
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->namespaceId->size();
		$size += $this->address->size();
		$size += $this->aliasAction->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new EmbeddedAddressAliasTransactionV1();

		EmbeddedTransaction::_deserialize($reader, $instance);
		$namespaceId = NamespaceId::deserialize($reader);
		$address = Address::deserialize($reader);
		$aliasAction = AliasAction::deserialize($reader);

		$instance->namespaceId = $namespaceId;
		$instance->address = $address;
		$instance->aliasAction = $aliasAction;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->namespaceId->serialize());
		$writer->write($this->address->serialize());
		$writer->write($this->aliasAction->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'namespaceId: ' . $this->namespaceId . ', ';
		$result .= 'address: ' . $this->address . ', ';
		$result .= 'aliasAction: ' . $this->aliasAction . ', ';
		$result .= ')';
		return $result;
	}
}

class MosaicAliasTransactionV1 extends Transaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::MOSAIC_ALIAS;

	public ?NamespaceId $namespaceId;

	public ?MosaicId $mosaicId;

	public ?AliasAction $aliasAction;

	public function __construct(
		?Signature $signature = null,
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?Amount $fee = null,
		?Timestamp $deadline = null,
		?NamespaceId $namespaceId = null,
		?MosaicId $mosaicId = null,
		?AliasAction $aliasAction = null
	){
		parent::__construct(
			$signature,
			$signerPublicKey,
			MosaicAliasTransactionV1::TRANSACTION_VERSION,
			$network,
			new TransactionType(MosaicAliasTransactionV1::TRANSACTION_TYPE),
			$fee,
			$deadline,
		);
		$this->namespaceId = $namespaceId ?? new NamespaceId();
		$this->mosaicId = $mosaicId ?? new MosaicId();
		$this->aliasAction = $aliasAction ?? new AliasAction();
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->namespaceId->size();
		$size += $this->mosaicId->size();
		$size += $this->aliasAction->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new MosaicAliasTransactionV1();

		Transaction::_deserialize($reader, $instance);
		$namespaceId = NamespaceId::deserialize($reader);
		$mosaicId = MosaicId::deserialize($reader);
		$aliasAction = AliasAction::deserialize($reader);

		$instance->namespaceId = $namespaceId;
		$instance->mosaicId = $mosaicId;
		$instance->aliasAction = $aliasAction;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->namespaceId->serialize());
		$writer->write($this->mosaicId->serialize());
		$writer->write($this->aliasAction->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'namespaceId: ' . $this->namespaceId . ', ';
		$result .= 'mosaicId: ' . $this->mosaicId . ', ';
		$result .= 'aliasAction: ' . $this->aliasAction . ', ';
		$result .= ')';
		return $result;
	}
}

class EmbeddedMosaicAliasTransactionV1 extends EmbeddedTransaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::MOSAIC_ALIAS;

	public ?NamespaceId $namespaceId;

	public ?MosaicId $mosaicId;

	public ?AliasAction $aliasAction;

	public function __construct(
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?NamespaceId $namespaceId = null,
		?MosaicId $mosaicId = null,
		?AliasAction $aliasAction = null
	){
		parent::__construct(
			$signerPublicKey,
			EmbeddedMosaicAliasTransactionV1::TRANSACTION_VERSION,
			$network,
			new TransactionType(EmbeddedMosaicAliasTransactionV1::TRANSACTION_TYPE),
		);
		$this->namespaceId = $namespaceId ?? new NamespaceId();
		$this->mosaicId = $mosaicId ?? new MosaicId();
		$this->aliasAction = $aliasAction ?? new AliasAction();
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->namespaceId->size();
		$size += $this->mosaicId->size();
		$size += $this->aliasAction->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new EmbeddedMosaicAliasTransactionV1();

		EmbeddedTransaction::_deserialize($reader, $instance);
		$namespaceId = NamespaceId::deserialize($reader);
		$mosaicId = MosaicId::deserialize($reader);
		$aliasAction = AliasAction::deserialize($reader);

		$instance->namespaceId = $namespaceId;
		$instance->mosaicId = $mosaicId;
		$instance->aliasAction = $aliasAction;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->namespaceId->serialize());
		$writer->write($this->mosaicId->serialize());
		$writer->write($this->aliasAction->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'namespaceId: ' . $this->namespaceId . ', ';
		$result .= 'mosaicId: ' . $this->mosaicId . ', ';
		$result .= 'aliasAction: ' . $this->aliasAction . ', ';
		$result .= ')';
		return $result;
	}
}

class NamespaceRegistrationTransactionV1 extends Transaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::NAMESPACE_REGISTRATION;

	public ?BlockDuration $duration;

	public ?NamespaceId $parentId;

	public ?NamespaceId $id;

	public ?NamespaceRegistrationType $registrationType;

	public ?string $name;

	public function __construct(
		?Signature $signature = null,
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?Amount $fee = null,
		?Timestamp $deadline = null,
		?BlockDuration $duration = null,
		?NamespaceId $parentId = null,
		?NamespaceId $id = null,
		?NamespaceRegistrationType $registrationType = null,
		?string $name = null
	){
		parent::__construct(
			$signature,
			$signerPublicKey,
			NamespaceRegistrationTransactionV1::TRANSACTION_VERSION,
			$network,
			new TransactionType(NamespaceRegistrationTransactionV1::TRANSACTION_TYPE),
			$fee,
			$deadline,
		);
		$this->duration = $duration ?? new BlockDuration();
		$this->parentId = $parentId ?? new NamespaceId();
		$this->id = $id ?? new NamespaceId();
		$this->registrationType = $registrationType ?? new NamespaceRegistrationType();
		$this->name = $name ?? '';
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		if (NamespaceRegistrationType::ROOT === $this->registrationType->value)
			$size += $this->duration->size();

		if (NamespaceRegistrationType::CHILD === $this->registrationType->value)
			$size += $this->parentId->size();

		$size += $this->id->size();
		$size += $this->registrationType->size();
		$size += 1;
		$size += strlen($this->name);
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new NamespaceRegistrationTransactionV1();

		Transaction::_deserialize($reader, $instance);
		// deserialize to temporary buffer for further processing
		$durationTemporary = BlockDuration::deserialize($reader);
		$registration_type_condition_reader = new BinaryReader($durationTemporary->serialize());


		$id = NamespaceId::deserialize($reader);
		$registrationType = NamespaceRegistrationType::deserialize($reader);
		$duration = new BlockDuration();
		if (NamespaceRegistrationType::ROOT === $registrationType->value)
			$duration = BlockDuration::deserialize($registration_type_condition_reader);

		$parentId = new NamespaceId();
		if (NamespaceRegistrationType::CHILD === $registrationType->value)
			$parentId = NamespaceId::deserialize($registration_type_condition_reader);

		$nameSize = Converter::binaryToInt($reader->read(1), 1);
		$name = $reader->read($nameSize);

		$instance->duration = $duration;
		$instance->parentId = $parentId;
		$instance->id = $id;
		$instance->registrationType = $registrationType;
		$instance->name = $name;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		if (NamespaceRegistrationType::ROOT === $this->registrationType->value)
			$writer->write($this->duration->serialize());

		if (NamespaceRegistrationType::CHILD === $this->registrationType->value)
			$writer->write($this->parentId->serialize());

		$writer->write($this->id->serialize());
		$writer->write($this->registrationType->serialize());
		$writer->write(Converter::intToBinary(strlen($this->name), 1)); // bound: name_size
		$writer->write($this->name);
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		if (NamespaceRegistrationType::ROOT === $this->registrationType->value)
			$result .= 'duration: ' . $this->duration . ', ';

		if (NamespaceRegistrationType::CHILD === $this->registrationType->value)
			$result .= 'parentId: ' . $this->parentId . ', ';

		$result .= 'id: ' . $this->id . ', ';
		$result .= 'registrationType: ' . $this->registrationType . ', ';
		$result .= 'name: ' . 'hex(0x' . strtoupper(bin2hex($this->name)) . ')' . ', ';
		$result .= ')';
		return $result;
	}
}

class EmbeddedNamespaceRegistrationTransactionV1 extends EmbeddedTransaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::NAMESPACE_REGISTRATION;

	public ?BlockDuration $duration;

	public ?NamespaceId $parentId;

	public ?NamespaceId $id;

	public ?NamespaceRegistrationType $registrationType;

	public ?string $name;

	public function __construct(
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?BlockDuration $duration = null,
		?NamespaceId $parentId = null,
		?NamespaceId $id = null,
		?NamespaceRegistrationType $registrationType = null,
		?string $name = null
	){
		parent::__construct(
			$signerPublicKey,
			EmbeddedNamespaceRegistrationTransactionV1::TRANSACTION_VERSION,
			$network,
			new TransactionType(EmbeddedNamespaceRegistrationTransactionV1::TRANSACTION_TYPE),
		);
		$this->duration = $duration ?? new BlockDuration();
		$this->parentId = $parentId ?? new NamespaceId();
		$this->id = $id ?? new NamespaceId();
		$this->registrationType = $registrationType ?? new NamespaceRegistrationType();
		$this->name = $name ?? '';
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		if (NamespaceRegistrationType::ROOT === $this->registrationType->value)
			$size += $this->duration->size();

		if (NamespaceRegistrationType::CHILD === $this->registrationType->value)
			$size += $this->parentId->size();

		$size += $this->id->size();
		$size += $this->registrationType->size();
		$size += 1;
		$size += strlen($this->name);
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new EmbeddedNamespaceRegistrationTransactionV1();

		EmbeddedTransaction::_deserialize($reader, $instance);
		// deserialize to temporary buffer for further processing
		$durationTemporary = BlockDuration::deserialize($reader);
		$registration_type_condition_reader = new BinaryReader($durationTemporary->serialize());


		$id = NamespaceId::deserialize($reader);
		$registrationType = NamespaceRegistrationType::deserialize($reader);
		$duration = new BlockDuration();
		if (NamespaceRegistrationType::ROOT === $registrationType->value)
			$duration = BlockDuration::deserialize($registration_type_condition_reader);

		$parentId = new NamespaceId();
		if (NamespaceRegistrationType::CHILD === $registrationType->value)
			$parentId = NamespaceId::deserialize($registration_type_condition_reader);

		$nameSize = Converter::binaryToInt($reader->read(1), 1);
		$name = $reader->read($nameSize);

		$instance->duration = $duration;
		$instance->parentId = $parentId;
		$instance->id = $id;
		$instance->registrationType = $registrationType;
		$instance->name = $name;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		if (NamespaceRegistrationType::ROOT === $this->registrationType->value)
			$writer->write($this->duration->serialize());

		if (NamespaceRegistrationType::CHILD === $this->registrationType->value)
			$writer->write($this->parentId->serialize());

		$writer->write($this->id->serialize());
		$writer->write($this->registrationType->serialize());
		$writer->write(Converter::intToBinary(strlen($this->name), 1)); // bound: name_size
		$writer->write($this->name);
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		if (NamespaceRegistrationType::ROOT === $this->registrationType->value)
			$result .= 'duration: ' . $this->duration . ', ';

		if (NamespaceRegistrationType::CHILD === $this->registrationType->value)
			$result .= 'parentId: ' . $this->parentId . ', ';

		$result .= 'id: ' . $this->id . ', ';
		$result .= 'registrationType: ' . $this->registrationType . ', ';
		$result .= 'name: ' . 'hex(0x' . strtoupper(bin2hex($this->name)) . ')' . ', ';
		$result .= ')';
		return $result;
	}
}

class AccountRestrictionFlags {
	const ADDRESS = 1;

	const MOSAIC_ID = 2;

	const TRANSACTION_TYPE = 4;

	const OUTGOING = 16384;

	const BLOCK = 32768;

	public $value;

	public function __construct($value = 0){
		$this->value = $value;
	}

	public function has($flag): bool {
		return 0 !== ($this->value & $flag);
	}

	public static function size(){
		return 2;
	}

	public static function deserialize(BinaryReader $reader): self {
		return new AccountRestrictionFlags(Converter::binaryToInt($reader->read(2), 2));
	}

	public function serialize(): string {
		return Converter::intToBinary($this->value, 2);
	}

	public function __toString(){
		$values = [
			1, 2, 4, 16384, 32768
		];
		$keys = [
			'ADDRESS', 'MOSAIC_ID', 'TRANSACTION_TYPE', 'OUTGOING', 'BLOCK'
		];

		if ($this->value === 0) {
			$index = array_search($this->value, $values);
			return "AccountRestrictionFlags.{$keys[$values[$index]]}";
		}

		$positions = array_keys(array_filter($values, fn ($flag) => ($this->value & $flag) !== 0));
		$result = array_map(fn ($n) => "AccountRestrictionFlags.{$keys[$n]}", $positions);

		return implode('|', $result);
	}
}

class AccountAddressRestrictionTransactionV1 extends Transaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::ACCOUNT_ADDRESS_RESTRICTION;

	public ?AccountRestrictionFlags $restrictionFlags;

	public ?array $restrictionAdditions;

	public ?array $restrictionDeletions;

	private int $accountRestrictionTransactionBodyReserved_1 = 0; // reserved field

	public function __construct(
		?Signature $signature = null,
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?Amount $fee = null,
		?Timestamp $deadline = null,
		?AccountRestrictionFlags $restrictionFlags = null,
		?array $restrictionAdditions = null,
		?array $restrictionDeletions = null
	){
		parent::__construct(
			$signature,
			$signerPublicKey,
			AccountAddressRestrictionTransactionV1::TRANSACTION_VERSION,
			$network,
			new TransactionType(AccountAddressRestrictionTransactionV1::TRANSACTION_TYPE),
			$fee,
			$deadline,
		);
		$this->restrictionFlags = $restrictionFlags ?? new AccountRestrictionFlags();
		$this->restrictionAdditions = $restrictionAdditions ?? [];
		$this->restrictionDeletions = $restrictionDeletions ?? [];
		$this->accountRestrictionTransactionBodyReserved_1 = 0; // reserved field
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->restrictionFlags->size();
		$size += 1;
		$size += 1;
		$size += 4;
		$size += ArrayHelpers::size($this->restrictionAdditions);
		$size += ArrayHelpers::size($this->restrictionDeletions);
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new AccountAddressRestrictionTransactionV1();

		Transaction::_deserialize($reader, $instance);
		$restrictionFlags = AccountRestrictionFlags::deserialize($reader);
		$restrictionAdditionsCount = Converter::binaryToInt($reader->read(1), 1);
		$restrictionDeletionsCount = Converter::binaryToInt($reader->read(1), 1);
		$accountRestrictionTransactionBodyReserved_1 = Converter::binaryToInt($reader->read(4), 4);
		if (0 !== $accountRestrictionTransactionBodyReserved_1)
			throw new OutOfRangeException('Invalid value of reserved field (' . $accountRestrictionTransactionBodyReserved_1 . ')');
		$restrictionAdditions = ArrayHelpers::readArrayCount($reader, [UnresolvedAddress::class, 'deserialize'], $restrictionAdditionsCount);
		$restrictionDeletions = ArrayHelpers::readArrayCount($reader, [UnresolvedAddress::class, 'deserialize'], $restrictionDeletionsCount);

		$instance->restrictionFlags = $restrictionFlags;
		$instance->restrictionAdditions = $restrictionAdditions;
		$instance->restrictionDeletions = $restrictionDeletions;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->restrictionFlags->serialize());
		$writer->write(Converter::intToBinary(count($this->restrictionAdditions), 1)); // bound: restriction_additions_count
		$writer->write(Converter::intToBinary(count($this->restrictionDeletions), 1)); // bound: restriction_deletions_count
		$writer->write(Converter::intToBinary($this->accountRestrictionTransactionBodyReserved_1, 4));
		ArrayHelpers::writeArray($writer, $this->restrictionAdditions);
		ArrayHelpers::writeArray($writer, $this->restrictionDeletions);
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'restrictionFlags: ' . $this->restrictionFlags . ', ';
		$result .= 'restrictionAdditions: ' . '[' . implode(',', array_map(fn ($e) => $e, $this->restrictionAdditions)) . ']' . ', ';
		$result .= 'restrictionDeletions: ' . '[' . implode(',', array_map(fn ($e) => $e, $this->restrictionDeletions)) . ']' . ', ';
		$result .= ')';
		return $result;
	}
}

class EmbeddedAccountAddressRestrictionTransactionV1 extends EmbeddedTransaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::ACCOUNT_ADDRESS_RESTRICTION;

	public ?AccountRestrictionFlags $restrictionFlags;

	public ?array $restrictionAdditions;

	public ?array $restrictionDeletions;

	private int $accountRestrictionTransactionBodyReserved_1 = 0; // reserved field

	public function __construct(
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?AccountRestrictionFlags $restrictionFlags = null,
		?array $restrictionAdditions = null,
		?array $restrictionDeletions = null
	){
		parent::__construct(
			$signerPublicKey,
			EmbeddedAccountAddressRestrictionTransactionV1::TRANSACTION_VERSION,
			$network,
			new TransactionType(EmbeddedAccountAddressRestrictionTransactionV1::TRANSACTION_TYPE),
		);
		$this->restrictionFlags = $restrictionFlags ?? new AccountRestrictionFlags();
		$this->restrictionAdditions = $restrictionAdditions ?? [];
		$this->restrictionDeletions = $restrictionDeletions ?? [];
		$this->accountRestrictionTransactionBodyReserved_1 = 0; // reserved field
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->restrictionFlags->size();
		$size += 1;
		$size += 1;
		$size += 4;
		$size += ArrayHelpers::size($this->restrictionAdditions);
		$size += ArrayHelpers::size($this->restrictionDeletions);
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new EmbeddedAccountAddressRestrictionTransactionV1();

		EmbeddedTransaction::_deserialize($reader, $instance);
		$restrictionFlags = AccountRestrictionFlags::deserialize($reader);
		$restrictionAdditionsCount = Converter::binaryToInt($reader->read(1), 1);
		$restrictionDeletionsCount = Converter::binaryToInt($reader->read(1), 1);
		$accountRestrictionTransactionBodyReserved_1 = Converter::binaryToInt($reader->read(4), 4);
		if (0 !== $accountRestrictionTransactionBodyReserved_1)
			throw new OutOfRangeException('Invalid value of reserved field (' . $accountRestrictionTransactionBodyReserved_1 . ')');
		$restrictionAdditions = ArrayHelpers::readArrayCount($reader, [UnresolvedAddress::class, 'deserialize'], $restrictionAdditionsCount);
		$restrictionDeletions = ArrayHelpers::readArrayCount($reader, [UnresolvedAddress::class, 'deserialize'], $restrictionDeletionsCount);

		$instance->restrictionFlags = $restrictionFlags;
		$instance->restrictionAdditions = $restrictionAdditions;
		$instance->restrictionDeletions = $restrictionDeletions;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->restrictionFlags->serialize());
		$writer->write(Converter::intToBinary(count($this->restrictionAdditions), 1)); // bound: restriction_additions_count
		$writer->write(Converter::intToBinary(count($this->restrictionDeletions), 1)); // bound: restriction_deletions_count
		$writer->write(Converter::intToBinary($this->accountRestrictionTransactionBodyReserved_1, 4));
		ArrayHelpers::writeArray($writer, $this->restrictionAdditions);
		ArrayHelpers::writeArray($writer, $this->restrictionDeletions);
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'restrictionFlags: ' . $this->restrictionFlags . ', ';
		$result .= 'restrictionAdditions: ' . '[' . implode(',', array_map(fn ($e) => $e, $this->restrictionAdditions)) . ']' . ', ';
		$result .= 'restrictionDeletions: ' . '[' . implode(',', array_map(fn ($e) => $e, $this->restrictionDeletions)) . ']' . ', ';
		$result .= ')';
		return $result;
	}
}

class AccountMosaicRestrictionTransactionV1 extends Transaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::ACCOUNT_MOSAIC_RESTRICTION;

	public ?AccountRestrictionFlags $restrictionFlags;

	public ?array $restrictionAdditions;

	public ?array $restrictionDeletions;

	private int $accountRestrictionTransactionBodyReserved_1 = 0; // reserved field

	public function __construct(
		?Signature $signature = null,
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?Amount $fee = null,
		?Timestamp $deadline = null,
		?AccountRestrictionFlags $restrictionFlags = null,
		?array $restrictionAdditions = null,
		?array $restrictionDeletions = null
	){
		parent::__construct(
			$signature,
			$signerPublicKey,
			AccountMosaicRestrictionTransactionV1::TRANSACTION_VERSION,
			$network,
			new TransactionType(AccountMosaicRestrictionTransactionV1::TRANSACTION_TYPE),
			$fee,
			$deadline,
		);
		$this->restrictionFlags = $restrictionFlags ?? new AccountRestrictionFlags();
		$this->restrictionAdditions = $restrictionAdditions ?? [];
		$this->restrictionDeletions = $restrictionDeletions ?? [];
		$this->accountRestrictionTransactionBodyReserved_1 = 0; // reserved field
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->restrictionFlags->size();
		$size += 1;
		$size += 1;
		$size += 4;
		$size += ArrayHelpers::size($this->restrictionAdditions);
		$size += ArrayHelpers::size($this->restrictionDeletions);
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new AccountMosaicRestrictionTransactionV1();

		Transaction::_deserialize($reader, $instance);
		$restrictionFlags = AccountRestrictionFlags::deserialize($reader);
		$restrictionAdditionsCount = Converter::binaryToInt($reader->read(1), 1);
		$restrictionDeletionsCount = Converter::binaryToInt($reader->read(1), 1);
		$accountRestrictionTransactionBodyReserved_1 = Converter::binaryToInt($reader->read(4), 4);
		if (0 !== $accountRestrictionTransactionBodyReserved_1)
			throw new OutOfRangeException('Invalid value of reserved field (' . $accountRestrictionTransactionBodyReserved_1 . ')');
		$restrictionAdditions = ArrayHelpers::readArrayCount($reader, [UnresolvedMosaicId::class, 'deserialize'], $restrictionAdditionsCount);
		$restrictionDeletions = ArrayHelpers::readArrayCount($reader, [UnresolvedMosaicId::class, 'deserialize'], $restrictionDeletionsCount);

		$instance->restrictionFlags = $restrictionFlags;
		$instance->restrictionAdditions = $restrictionAdditions;
		$instance->restrictionDeletions = $restrictionDeletions;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->restrictionFlags->serialize());
		$writer->write(Converter::intToBinary(count($this->restrictionAdditions), 1)); // bound: restriction_additions_count
		$writer->write(Converter::intToBinary(count($this->restrictionDeletions), 1)); // bound: restriction_deletions_count
		$writer->write(Converter::intToBinary($this->accountRestrictionTransactionBodyReserved_1, 4));
		ArrayHelpers::writeArray($writer, $this->restrictionAdditions);
		ArrayHelpers::writeArray($writer, $this->restrictionDeletions);
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'restrictionFlags: ' . $this->restrictionFlags . ', ';
		$result .= 'restrictionAdditions: ' . '[' . implode(',', array_map(fn ($e) => $e, $this->restrictionAdditions)) . ']' . ', ';
		$result .= 'restrictionDeletions: ' . '[' . implode(',', array_map(fn ($e) => $e, $this->restrictionDeletions)) . ']' . ', ';
		$result .= ')';
		return $result;
	}
}

class EmbeddedAccountMosaicRestrictionTransactionV1 extends EmbeddedTransaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::ACCOUNT_MOSAIC_RESTRICTION;

	public ?AccountRestrictionFlags $restrictionFlags;

	public ?array $restrictionAdditions;

	public ?array $restrictionDeletions;

	private int $accountRestrictionTransactionBodyReserved_1 = 0; // reserved field

	public function __construct(
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?AccountRestrictionFlags $restrictionFlags = null,
		?array $restrictionAdditions = null,
		?array $restrictionDeletions = null
	){
		parent::__construct(
			$signerPublicKey,
			EmbeddedAccountMosaicRestrictionTransactionV1::TRANSACTION_VERSION,
			$network,
			new TransactionType(EmbeddedAccountMosaicRestrictionTransactionV1::TRANSACTION_TYPE),
		);
		$this->restrictionFlags = $restrictionFlags ?? new AccountRestrictionFlags();
		$this->restrictionAdditions = $restrictionAdditions ?? [];
		$this->restrictionDeletions = $restrictionDeletions ?? [];
		$this->accountRestrictionTransactionBodyReserved_1 = 0; // reserved field
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->restrictionFlags->size();
		$size += 1;
		$size += 1;
		$size += 4;
		$size += ArrayHelpers::size($this->restrictionAdditions);
		$size += ArrayHelpers::size($this->restrictionDeletions);
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new EmbeddedAccountMosaicRestrictionTransactionV1();

		EmbeddedTransaction::_deserialize($reader, $instance);
		$restrictionFlags = AccountRestrictionFlags::deserialize($reader);
		$restrictionAdditionsCount = Converter::binaryToInt($reader->read(1), 1);
		$restrictionDeletionsCount = Converter::binaryToInt($reader->read(1), 1);
		$accountRestrictionTransactionBodyReserved_1 = Converter::binaryToInt($reader->read(4), 4);
		if (0 !== $accountRestrictionTransactionBodyReserved_1)
			throw new OutOfRangeException('Invalid value of reserved field (' . $accountRestrictionTransactionBodyReserved_1 . ')');
		$restrictionAdditions = ArrayHelpers::readArrayCount($reader, [UnresolvedMosaicId::class, 'deserialize'], $restrictionAdditionsCount);
		$restrictionDeletions = ArrayHelpers::readArrayCount($reader, [UnresolvedMosaicId::class, 'deserialize'], $restrictionDeletionsCount);

		$instance->restrictionFlags = $restrictionFlags;
		$instance->restrictionAdditions = $restrictionAdditions;
		$instance->restrictionDeletions = $restrictionDeletions;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->restrictionFlags->serialize());
		$writer->write(Converter::intToBinary(count($this->restrictionAdditions), 1)); // bound: restriction_additions_count
		$writer->write(Converter::intToBinary(count($this->restrictionDeletions), 1)); // bound: restriction_deletions_count
		$writer->write(Converter::intToBinary($this->accountRestrictionTransactionBodyReserved_1, 4));
		ArrayHelpers::writeArray($writer, $this->restrictionAdditions);
		ArrayHelpers::writeArray($writer, $this->restrictionDeletions);
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'restrictionFlags: ' . $this->restrictionFlags . ', ';
		$result .= 'restrictionAdditions: ' . '[' . implode(',', array_map(fn ($e) => $e, $this->restrictionAdditions)) . ']' . ', ';
		$result .= 'restrictionDeletions: ' . '[' . implode(',', array_map(fn ($e) => $e, $this->restrictionDeletions)) . ']' . ', ';
		$result .= ')';
		return $result;
	}
}

class AccountOperationRestrictionTransactionV1 extends Transaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::ACCOUNT_OPERATION_RESTRICTION;

	public ?AccountRestrictionFlags $restrictionFlags;

	public ?array $restrictionAdditions;

	public ?array $restrictionDeletions;

	private int $accountRestrictionTransactionBodyReserved_1 = 0; // reserved field

	public function __construct(
		?Signature $signature = null,
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?Amount $fee = null,
		?Timestamp $deadline = null,
		?AccountRestrictionFlags $restrictionFlags = null,
		?array $restrictionAdditions = null,
		?array $restrictionDeletions = null
	){
		parent::__construct(
			$signature,
			$signerPublicKey,
			AccountOperationRestrictionTransactionV1::TRANSACTION_VERSION,
			$network,
			new TransactionType(AccountOperationRestrictionTransactionV1::TRANSACTION_TYPE),
			$fee,
			$deadline,
		);
		$this->restrictionFlags = $restrictionFlags ?? new AccountRestrictionFlags();
		$this->restrictionAdditions = $restrictionAdditions ?? [];
		$this->restrictionDeletions = $restrictionDeletions ?? [];
		$this->accountRestrictionTransactionBodyReserved_1 = 0; // reserved field
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->restrictionFlags->size();
		$size += 1;
		$size += 1;
		$size += 4;
		$size += ArrayHelpers::size($this->restrictionAdditions);
		$size += ArrayHelpers::size($this->restrictionDeletions);
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new AccountOperationRestrictionTransactionV1();

		Transaction::_deserialize($reader, $instance);
		$restrictionFlags = AccountRestrictionFlags::deserialize($reader);
		$restrictionAdditionsCount = Converter::binaryToInt($reader->read(1), 1);
		$restrictionDeletionsCount = Converter::binaryToInt($reader->read(1), 1);
		$accountRestrictionTransactionBodyReserved_1 = Converter::binaryToInt($reader->read(4), 4);
		if (0 !== $accountRestrictionTransactionBodyReserved_1)
			throw new OutOfRangeException('Invalid value of reserved field (' . $accountRestrictionTransactionBodyReserved_1 . ')');
		$restrictionAdditions = ArrayHelpers::readArrayCount($reader, [TransactionType::class, 'deserialize'], $restrictionAdditionsCount);
		$restrictionDeletions = ArrayHelpers::readArrayCount($reader, [TransactionType::class, 'deserialize'], $restrictionDeletionsCount);

		$instance->restrictionFlags = $restrictionFlags;
		$instance->restrictionAdditions = $restrictionAdditions;
		$instance->restrictionDeletions = $restrictionDeletions;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->restrictionFlags->serialize());
		$writer->write(Converter::intToBinary(count($this->restrictionAdditions), 1)); // bound: restriction_additions_count
		$writer->write(Converter::intToBinary(count($this->restrictionDeletions), 1)); // bound: restriction_deletions_count
		$writer->write(Converter::intToBinary($this->accountRestrictionTransactionBodyReserved_1, 4));
		ArrayHelpers::writeArray($writer, $this->restrictionAdditions);
		ArrayHelpers::writeArray($writer, $this->restrictionDeletions);
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'restrictionFlags: ' . $this->restrictionFlags . ', ';
		$result .= 'restrictionAdditions: ' . '[' . implode(',', array_map(fn ($e) => $e, $this->restrictionAdditions)) . ']' . ', ';
		$result .= 'restrictionDeletions: ' . '[' . implode(',', array_map(fn ($e) => $e, $this->restrictionDeletions)) . ']' . ', ';
		$result .= ')';
		return $result;
	}
}

class EmbeddedAccountOperationRestrictionTransactionV1 extends EmbeddedTransaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::ACCOUNT_OPERATION_RESTRICTION;

	public ?AccountRestrictionFlags $restrictionFlags;

	public ?array $restrictionAdditions;

	public ?array $restrictionDeletions;

	private int $accountRestrictionTransactionBodyReserved_1 = 0; // reserved field

	public function __construct(
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?AccountRestrictionFlags $restrictionFlags = null,
		?array $restrictionAdditions = null,
		?array $restrictionDeletions = null
	){
		parent::__construct(
			$signerPublicKey,
			EmbeddedAccountOperationRestrictionTransactionV1::TRANSACTION_VERSION,
			$network,
			new TransactionType(EmbeddedAccountOperationRestrictionTransactionV1::TRANSACTION_TYPE),
		);
		$this->restrictionFlags = $restrictionFlags ?? new AccountRestrictionFlags();
		$this->restrictionAdditions = $restrictionAdditions ?? [];
		$this->restrictionDeletions = $restrictionDeletions ?? [];
		$this->accountRestrictionTransactionBodyReserved_1 = 0; // reserved field
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->restrictionFlags->size();
		$size += 1;
		$size += 1;
		$size += 4;
		$size += ArrayHelpers::size($this->restrictionAdditions);
		$size += ArrayHelpers::size($this->restrictionDeletions);
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new EmbeddedAccountOperationRestrictionTransactionV1();

		EmbeddedTransaction::_deserialize($reader, $instance);
		$restrictionFlags = AccountRestrictionFlags::deserialize($reader);
		$restrictionAdditionsCount = Converter::binaryToInt($reader->read(1), 1);
		$restrictionDeletionsCount = Converter::binaryToInt($reader->read(1), 1);
		$accountRestrictionTransactionBodyReserved_1 = Converter::binaryToInt($reader->read(4), 4);
		if (0 !== $accountRestrictionTransactionBodyReserved_1)
			throw new OutOfRangeException('Invalid value of reserved field (' . $accountRestrictionTransactionBodyReserved_1 . ')');
		$restrictionAdditions = ArrayHelpers::readArrayCount($reader, [TransactionType::class, 'deserialize'], $restrictionAdditionsCount);
		$restrictionDeletions = ArrayHelpers::readArrayCount($reader, [TransactionType::class, 'deserialize'], $restrictionDeletionsCount);

		$instance->restrictionFlags = $restrictionFlags;
		$instance->restrictionAdditions = $restrictionAdditions;
		$instance->restrictionDeletions = $restrictionDeletions;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->restrictionFlags->serialize());
		$writer->write(Converter::intToBinary(count($this->restrictionAdditions), 1)); // bound: restriction_additions_count
		$writer->write(Converter::intToBinary(count($this->restrictionDeletions), 1)); // bound: restriction_deletions_count
		$writer->write(Converter::intToBinary($this->accountRestrictionTransactionBodyReserved_1, 4));
		ArrayHelpers::writeArray($writer, $this->restrictionAdditions);
		ArrayHelpers::writeArray($writer, $this->restrictionDeletions);
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'restrictionFlags: ' . $this->restrictionFlags . ', ';
		$result .= 'restrictionAdditions: ' . '[' . implode(',', array_map(fn ($e) => $e, $this->restrictionAdditions)) . ']' . ', ';
		$result .= 'restrictionDeletions: ' . '[' . implode(',', array_map(fn ($e) => $e, $this->restrictionDeletions)) . ']' . ', ';
		$result .= ')';
		return $result;
	}
}

class MosaicAddressRestrictionTransactionV1 extends Transaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::MOSAIC_ADDRESS_RESTRICTION;

	public ?UnresolvedMosaicId $mosaicId;

	public ?int $restrictionKey;

	public ?int $previousRestrictionValue;

	public ?int $newRestrictionValue;

	public ?UnresolvedAddress $targetAddress;

	public function __construct(
		?Signature $signature = null,
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?Amount $fee = null,
		?Timestamp $deadline = null,
		?UnresolvedMosaicId $mosaicId = null,
		?int $restrictionKey = null,
		?int $previousRestrictionValue = null,
		?int $newRestrictionValue = null,
		?UnresolvedAddress $targetAddress = null
	){
		parent::__construct(
			$signature,
			$signerPublicKey,
			MosaicAddressRestrictionTransactionV1::TRANSACTION_VERSION,
			$network,
			new TransactionType(MosaicAddressRestrictionTransactionV1::TRANSACTION_TYPE),
			$fee,
			$deadline,
		);
		$this->mosaicId = $mosaicId ?? new UnresolvedMosaicId();
		$this->restrictionKey = $restrictionKey ?? 0;
		$this->previousRestrictionValue = $previousRestrictionValue ?? 0;
		$this->newRestrictionValue = $newRestrictionValue ?? 0;
		$this->targetAddress = $targetAddress ?? new UnresolvedAddress();
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->mosaicId->size();
		$size += 8;
		$size += 8;
		$size += 8;
		$size += $this->targetAddress->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new MosaicAddressRestrictionTransactionV1();

		Transaction::_deserialize($reader, $instance);
		$mosaicId = UnresolvedMosaicId::deserialize($reader);
		$restrictionKey = Converter::binaryToInt($reader->read(8), 8);
		$previousRestrictionValue = Converter::binaryToInt($reader->read(8), 8);
		$newRestrictionValue = Converter::binaryToInt($reader->read(8), 8);
		$targetAddress = UnresolvedAddress::deserialize($reader);

		$instance->mosaicId = $mosaicId;
		$instance->restrictionKey = $restrictionKey;
		$instance->previousRestrictionValue = $previousRestrictionValue;
		$instance->newRestrictionValue = $newRestrictionValue;
		$instance->targetAddress = $targetAddress;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->mosaicId->serialize());
		$writer->write(Converter::intToBinary($this->restrictionKey, 8));
		$writer->write(Converter::intToBinary($this->previousRestrictionValue, 8));
		$writer->write(Converter::intToBinary($this->newRestrictionValue, 8));
		$writer->write($this->targetAddress->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'mosaicId: ' . $this->mosaicId . ', ';
		$result .= 'restrictionKey: ' . '0x' . Converter::intToHex($this->restrictionKey, 8) . ', ';
		$result .= 'previousRestrictionValue: ' . '0x' . Converter::intToHex($this->previousRestrictionValue, 8) . ', ';
		$result .= 'newRestrictionValue: ' . '0x' . Converter::intToHex($this->newRestrictionValue, 8) . ', ';
		$result .= 'targetAddress: ' . $this->targetAddress . ', ';
		$result .= ')';
		return $result;
	}
}

class EmbeddedMosaicAddressRestrictionTransactionV1 extends EmbeddedTransaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::MOSAIC_ADDRESS_RESTRICTION;

	public ?UnresolvedMosaicId $mosaicId;

	public ?int $restrictionKey;

	public ?int $previousRestrictionValue;

	public ?int $newRestrictionValue;

	public ?UnresolvedAddress $targetAddress;

	public function __construct(
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?UnresolvedMosaicId $mosaicId = null,
		?int $restrictionKey = null,
		?int $previousRestrictionValue = null,
		?int $newRestrictionValue = null,
		?UnresolvedAddress $targetAddress = null
	){
		parent::__construct(
			$signerPublicKey,
			EmbeddedMosaicAddressRestrictionTransactionV1::TRANSACTION_VERSION,
			$network,
			new TransactionType(EmbeddedMosaicAddressRestrictionTransactionV1::TRANSACTION_TYPE),
		);
		$this->mosaicId = $mosaicId ?? new UnresolvedMosaicId();
		$this->restrictionKey = $restrictionKey ?? 0;
		$this->previousRestrictionValue = $previousRestrictionValue ?? 0;
		$this->newRestrictionValue = $newRestrictionValue ?? 0;
		$this->targetAddress = $targetAddress ?? new UnresolvedAddress();
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->mosaicId->size();
		$size += 8;
		$size += 8;
		$size += 8;
		$size += $this->targetAddress->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new EmbeddedMosaicAddressRestrictionTransactionV1();

		EmbeddedTransaction::_deserialize($reader, $instance);
		$mosaicId = UnresolvedMosaicId::deserialize($reader);
		$restrictionKey = Converter::binaryToInt($reader->read(8), 8);
		$previousRestrictionValue = Converter::binaryToInt($reader->read(8), 8);
		$newRestrictionValue = Converter::binaryToInt($reader->read(8), 8);
		$targetAddress = UnresolvedAddress::deserialize($reader);

		$instance->mosaicId = $mosaicId;
		$instance->restrictionKey = $restrictionKey;
		$instance->previousRestrictionValue = $previousRestrictionValue;
		$instance->newRestrictionValue = $newRestrictionValue;
		$instance->targetAddress = $targetAddress;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->mosaicId->serialize());
		$writer->write(Converter::intToBinary($this->restrictionKey, 8));
		$writer->write(Converter::intToBinary($this->previousRestrictionValue, 8));
		$writer->write(Converter::intToBinary($this->newRestrictionValue, 8));
		$writer->write($this->targetAddress->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'mosaicId: ' . $this->mosaicId . ', ';
		$result .= 'restrictionKey: ' . '0x' . Converter::intToHex($this->restrictionKey, 8) . ', ';
		$result .= 'previousRestrictionValue: ' . '0x' . Converter::intToHex($this->previousRestrictionValue, 8) . ', ';
		$result .= 'newRestrictionValue: ' . '0x' . Converter::intToHex($this->newRestrictionValue, 8) . ', ';
		$result .= 'targetAddress: ' . $this->targetAddress . ', ';
		$result .= ')';
		return $result;
	}
}

class MosaicRestrictionKey extends BaseValue {
	public function __construct($mosaicRestrictionKey = 0){
		parent::__construct(8, $mosaicRestrictionKey);
	}

	public static function size(): int {
		return 8;
	}

	public static function deserialize(BinaryReader $reader): self {
		return new self(Converter::binaryToInt($reader->read(8), 8));
	}

	public function serialize(): string {
		return Converter::intToBinary($this->value, 8);
	}
}

class MosaicRestrictionType {
	const NONE = 0;

	const EQ = 1;

	const NE = 2;

	const LT = 3;

	const LE = 4;

	const GT = 5;

	const GE = 6;

	public $value;

	public function __construct($value = 0){
		$this->value = $value;
	}

	static function valueToKey($value){
		$values = [
			0, 1, 2, 3, 4, 5, 6
		];
		$keys = [
			'NONE', 'EQ', 'NE', 'LT', 'LE', 'GT', 'GE'
		];

		$index = array_search($value, $values);
		if ($index === false)
			throw new Exception("Invalid enum value: {$value}");

		return $keys[$index];
	}

	public static function size(){
		return 1;
	}

	public static function deserialize(BinaryReader $reader): self {
		return new MosaicRestrictionType(Converter::binaryToInt($reader->read(1), 1));
	}

	public function serialize(): string {
		return Converter::intToBinary($this->value, 1);
	}

	public function __toString(){
		return "MosaicRestrictionType." . self::valueToKey($this->value);
	}
}

class MosaicGlobalRestrictionTransactionV1 extends Transaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::MOSAIC_GLOBAL_RESTRICTION;

	public ?UnresolvedMosaicId $mosaicId;

	public ?UnresolvedMosaicId $referenceMosaicId;

	public ?int $restrictionKey;

	public ?int $previousRestrictionValue;

	public ?int $newRestrictionValue;

	public ?MosaicRestrictionType $previousRestrictionType;

	public ?MosaicRestrictionType $newRestrictionType;

	public function __construct(
		?Signature $signature = null,
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?Amount $fee = null,
		?Timestamp $deadline = null,
		?UnresolvedMosaicId $mosaicId = null,
		?UnresolvedMosaicId $referenceMosaicId = null,
		?int $restrictionKey = null,
		?int $previousRestrictionValue = null,
		?int $newRestrictionValue = null,
		?MosaicRestrictionType $previousRestrictionType = null,
		?MosaicRestrictionType $newRestrictionType = null
	){
		parent::__construct(
			$signature,
			$signerPublicKey,
			MosaicGlobalRestrictionTransactionV1::TRANSACTION_VERSION,
			$network,
			new TransactionType(MosaicGlobalRestrictionTransactionV1::TRANSACTION_TYPE),
			$fee,
			$deadline,
		);
		$this->mosaicId = $mosaicId ?? new UnresolvedMosaicId();
		$this->referenceMosaicId = $referenceMosaicId ?? new UnresolvedMosaicId();
		$this->restrictionKey = $restrictionKey ?? 0;
		$this->previousRestrictionValue = $previousRestrictionValue ?? 0;
		$this->newRestrictionValue = $newRestrictionValue ?? 0;
		$this->previousRestrictionType = $previousRestrictionType ?? new MosaicRestrictionType();
		$this->newRestrictionType = $newRestrictionType ?? new MosaicRestrictionType();
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->mosaicId->size();
		$size += $this->referenceMosaicId->size();
		$size += 8;
		$size += 8;
		$size += 8;
		$size += $this->previousRestrictionType->size();
		$size += $this->newRestrictionType->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new MosaicGlobalRestrictionTransactionV1();

		Transaction::_deserialize($reader, $instance);
		$mosaicId = UnresolvedMosaicId::deserialize($reader);
		$referenceMosaicId = UnresolvedMosaicId::deserialize($reader);
		$restrictionKey = Converter::binaryToInt($reader->read(8), 8);
		$previousRestrictionValue = Converter::binaryToInt($reader->read(8), 8);
		$newRestrictionValue = Converter::binaryToInt($reader->read(8), 8);
		$previousRestrictionType = MosaicRestrictionType::deserialize($reader);
		$newRestrictionType = MosaicRestrictionType::deserialize($reader);

		$instance->mosaicId = $mosaicId;
		$instance->referenceMosaicId = $referenceMosaicId;
		$instance->restrictionKey = $restrictionKey;
		$instance->previousRestrictionValue = $previousRestrictionValue;
		$instance->newRestrictionValue = $newRestrictionValue;
		$instance->previousRestrictionType = $previousRestrictionType;
		$instance->newRestrictionType = $newRestrictionType;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->mosaicId->serialize());
		$writer->write($this->referenceMosaicId->serialize());
		$writer->write(Converter::intToBinary($this->restrictionKey, 8));
		$writer->write(Converter::intToBinary($this->previousRestrictionValue, 8));
		$writer->write(Converter::intToBinary($this->newRestrictionValue, 8));
		$writer->write($this->previousRestrictionType->serialize());
		$writer->write($this->newRestrictionType->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'mosaicId: ' . $this->mosaicId . ', ';
		$result .= 'referenceMosaicId: ' . $this->referenceMosaicId . ', ';
		$result .= 'restrictionKey: ' . '0x' . Converter::intToHex($this->restrictionKey, 8) . ', ';
		$result .= 'previousRestrictionValue: ' . '0x' . Converter::intToHex($this->previousRestrictionValue, 8) . ', ';
		$result .= 'newRestrictionValue: ' . '0x' . Converter::intToHex($this->newRestrictionValue, 8) . ', ';
		$result .= 'previousRestrictionType: ' . $this->previousRestrictionType . ', ';
		$result .= 'newRestrictionType: ' . $this->newRestrictionType . ', ';
		$result .= ')';
		return $result;
	}
}

class EmbeddedMosaicGlobalRestrictionTransactionV1 extends EmbeddedTransaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::MOSAIC_GLOBAL_RESTRICTION;

	public ?UnresolvedMosaicId $mosaicId;

	public ?UnresolvedMosaicId $referenceMosaicId;

	public ?int $restrictionKey;

	public ?int $previousRestrictionValue;

	public ?int $newRestrictionValue;

	public ?MosaicRestrictionType $previousRestrictionType;

	public ?MosaicRestrictionType $newRestrictionType;

	public function __construct(
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?UnresolvedMosaicId $mosaicId = null,
		?UnresolvedMosaicId $referenceMosaicId = null,
		?int $restrictionKey = null,
		?int $previousRestrictionValue = null,
		?int $newRestrictionValue = null,
		?MosaicRestrictionType $previousRestrictionType = null,
		?MosaicRestrictionType $newRestrictionType = null
	){
		parent::__construct(
			$signerPublicKey,
			EmbeddedMosaicGlobalRestrictionTransactionV1::TRANSACTION_VERSION,
			$network,
			new TransactionType(EmbeddedMosaicGlobalRestrictionTransactionV1::TRANSACTION_TYPE),
		);
		$this->mosaicId = $mosaicId ?? new UnresolvedMosaicId();
		$this->referenceMosaicId = $referenceMosaicId ?? new UnresolvedMosaicId();
		$this->restrictionKey = $restrictionKey ?? 0;
		$this->previousRestrictionValue = $previousRestrictionValue ?? 0;
		$this->newRestrictionValue = $newRestrictionValue ?? 0;
		$this->previousRestrictionType = $previousRestrictionType ?? new MosaicRestrictionType();
		$this->newRestrictionType = $newRestrictionType ?? new MosaicRestrictionType();
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->mosaicId->size();
		$size += $this->referenceMosaicId->size();
		$size += 8;
		$size += 8;
		$size += 8;
		$size += $this->previousRestrictionType->size();
		$size += $this->newRestrictionType->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new EmbeddedMosaicGlobalRestrictionTransactionV1();

		EmbeddedTransaction::_deserialize($reader, $instance);
		$mosaicId = UnresolvedMosaicId::deserialize($reader);
		$referenceMosaicId = UnresolvedMosaicId::deserialize($reader);
		$restrictionKey = Converter::binaryToInt($reader->read(8), 8);
		$previousRestrictionValue = Converter::binaryToInt($reader->read(8), 8);
		$newRestrictionValue = Converter::binaryToInt($reader->read(8), 8);
		$previousRestrictionType = MosaicRestrictionType::deserialize($reader);
		$newRestrictionType = MosaicRestrictionType::deserialize($reader);

		$instance->mosaicId = $mosaicId;
		$instance->referenceMosaicId = $referenceMosaicId;
		$instance->restrictionKey = $restrictionKey;
		$instance->previousRestrictionValue = $previousRestrictionValue;
		$instance->newRestrictionValue = $newRestrictionValue;
		$instance->previousRestrictionType = $previousRestrictionType;
		$instance->newRestrictionType = $newRestrictionType;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->mosaicId->serialize());
		$writer->write($this->referenceMosaicId->serialize());
		$writer->write(Converter::intToBinary($this->restrictionKey, 8));
		$writer->write(Converter::intToBinary($this->previousRestrictionValue, 8));
		$writer->write(Converter::intToBinary($this->newRestrictionValue, 8));
		$writer->write($this->previousRestrictionType->serialize());
		$writer->write($this->newRestrictionType->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'mosaicId: ' . $this->mosaicId . ', ';
		$result .= 'referenceMosaicId: ' . $this->referenceMosaicId . ', ';
		$result .= 'restrictionKey: ' . '0x' . Converter::intToHex($this->restrictionKey, 8) . ', ';
		$result .= 'previousRestrictionValue: ' . '0x' . Converter::intToHex($this->previousRestrictionValue, 8) . ', ';
		$result .= 'newRestrictionValue: ' . '0x' . Converter::intToHex($this->newRestrictionValue, 8) . ', ';
		$result .= 'previousRestrictionType: ' . $this->previousRestrictionType . ', ';
		$result .= 'newRestrictionType: ' . $this->newRestrictionType . ', ';
		$result .= ')';
		return $result;
	}
}

class TransferTransactionV1 extends Transaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::TRANSFER;

	public ?UnresolvedAddress $recipientAddress;

	public ?array $mosaics;

	public ?string $message;

	private int $transferTransactionBodyReserved_1 = 0; // reserved field

	private int $transferTransactionBodyReserved_2 = 0; // reserved field

	public function __construct(
		?Signature $signature = null,
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?Amount $fee = null,
		?Timestamp $deadline = null,
		?UnresolvedAddress $recipientAddress = null,
		?array $mosaics = null,
		?string $message = null
	){
		parent::__construct(
			$signature,
			$signerPublicKey,
			TransferTransactionV1::TRANSACTION_VERSION,
			$network,
			new TransactionType(TransferTransactionV1::TRANSACTION_TYPE),
			$fee,
			$deadline,
		);
		$this->recipientAddress = $recipientAddress ?? new UnresolvedAddress();
		$this->mosaics = $mosaics ?? [];
		$this->message = $message ?? '';
		$this->transferTransactionBodyReserved_1 = 0; // reserved field
		$this->transferTransactionBodyReserved_2 = 0; // reserved field
	}

	public function sort(){
		usort(
			$this->mosaics,
			fn ($lhs, $rhs) =>
			ArrayHelpers::deepCompare(
				isset($lhs->mosaicId->comparer) ? $lhs->mosaicId->comparer() : $lhs->mosaicId->value,
				isset($rhs->mosaicId->comparer) ? $rhs->mosaicId->comparer() : $rhs->mosaicId->value
			)
		);
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->recipientAddress->size();
		$size += 2;
		$size += 1;
		$size += 1;
		$size += 4;
		$size += ArrayHelpers::size($this->mosaics);
		$size += strlen($this->message);
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new TransferTransactionV1();

		Transaction::_deserialize($reader, $instance);
		$recipientAddress = UnresolvedAddress::deserialize($reader);
		$messageSize = Converter::binaryToInt($reader->read(2), 2);
		$mosaicsCount = Converter::binaryToInt($reader->read(1), 1);
		$transferTransactionBodyReserved_1 = Converter::binaryToInt($reader->read(1), 1);
		if (0 !== $transferTransactionBodyReserved_1)
			throw new OutOfRangeException('Invalid value of reserved field (' . $transferTransactionBodyReserved_1 . ')');
		$transferTransactionBodyReserved_2 = Converter::binaryToInt($reader->read(4), 4);
		if (0 !== $transferTransactionBodyReserved_2)
			throw new OutOfRangeException('Invalid value of reserved field (' . $transferTransactionBodyReserved_2 . ')');
		$mosaics = ArrayHelpers::readArrayCount($reader, [UnresolvedMosaic::class, 'deserialize'], $mosaicsCount, fn ($e) => isset($e->mosaicId->comparer) ? $e->mosaicId->comparer() : $e->mosaicId->value);
		$message = $reader->read($messageSize);

		$instance->recipientAddress = $recipientAddress;
		$instance->mosaics = $mosaics;
		$instance->message = $message;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->recipientAddress->serialize());
		$writer->write(Converter::intToBinary(strlen($this->message), 2)); // bound: message_size
		$writer->write(Converter::intToBinary(count($this->mosaics), 1)); // bound: mosaics_count
		$writer->write(Converter::intToBinary($this->transferTransactionBodyReserved_1, 1));
		$writer->write(Converter::intToBinary($this->transferTransactionBodyReserved_2, 4));
		ArrayHelpers::writeArray($writer, $this->mosaics, fn ($e) => isset($e->mosaicId->comparer) ? $e->mosaicId->comparer() : $e->mosaicId->value);
		$writer->write($this->message);
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'recipientAddress: ' . $this->recipientAddress . ', ';
		$result .= 'mosaics: ' . '[' . implode(',', array_map(fn ($e) => $e, $this->mosaics)) . ']' . ', ';
		$result .= 'message: ' . 'hex(0x' . strtoupper(bin2hex($this->message)) . ')' . ', ';
		$result .= ')';
		return $result;
	}
}

class EmbeddedTransferTransactionV1 extends EmbeddedTransaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::TRANSFER;

	public ?UnresolvedAddress $recipientAddress;

	public ?array $mosaics;

	public ?string $message;

	private int $transferTransactionBodyReserved_1 = 0; // reserved field

	private int $transferTransactionBodyReserved_2 = 0; // reserved field

	public function __construct(
		?PublicKey $signerPublicKey = null,
		?NetworkType $network = null,
		?UnresolvedAddress $recipientAddress = null,
		?array $mosaics = null,
		?string $message = null
	){
		parent::__construct(
			$signerPublicKey,
			EmbeddedTransferTransactionV1::TRANSACTION_VERSION,
			$network,
			new TransactionType(EmbeddedTransferTransactionV1::TRANSACTION_TYPE),
		);
		$this->recipientAddress = $recipientAddress ?? new UnresolvedAddress();
		$this->mosaics = $mosaics ?? [];
		$this->message = $message ?? '';
		$this->transferTransactionBodyReserved_1 = 0; // reserved field
		$this->transferTransactionBodyReserved_2 = 0; // reserved field
	}

	public function sort(){
		usort(
			$this->mosaics,
			fn ($lhs, $rhs) =>
			ArrayHelpers::deepCompare(
				isset($lhs->mosaicId->comparer) ? $lhs->mosaicId->comparer() : $lhs->mosaicId->value,
				isset($rhs->mosaicId->comparer) ? $rhs->mosaicId->comparer() : $rhs->mosaicId->value
			)
		);
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->recipientAddress->size();
		$size += 2;
		$size += 1;
		$size += 1;
		$size += 4;
		$size += ArrayHelpers::size($this->mosaics);
		$size += strlen($this->message);
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new EmbeddedTransferTransactionV1();

		EmbeddedTransaction::_deserialize($reader, $instance);
		$recipientAddress = UnresolvedAddress::deserialize($reader);
		$messageSize = Converter::binaryToInt($reader->read(2), 2);
		$mosaicsCount = Converter::binaryToInt($reader->read(1), 1);
		$transferTransactionBodyReserved_1 = Converter::binaryToInt($reader->read(1), 1);
		if (0 !== $transferTransactionBodyReserved_1)
			throw new OutOfRangeException('Invalid value of reserved field (' . $transferTransactionBodyReserved_1 . ')');
		$transferTransactionBodyReserved_2 = Converter::binaryToInt($reader->read(4), 4);
		if (0 !== $transferTransactionBodyReserved_2)
			throw new OutOfRangeException('Invalid value of reserved field (' . $transferTransactionBodyReserved_2 . ')');
		$mosaics = ArrayHelpers::readArrayCount($reader, [UnresolvedMosaic::class, 'deserialize'], $mosaicsCount, fn ($e) => isset($e->mosaicId->comparer) ? $e->mosaicId->comparer() : $e->mosaicId->value);
		$message = $reader->read($messageSize);

		$instance->recipientAddress = $recipientAddress;
		$instance->mosaics = $mosaics;
		$instance->message = $message;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->recipientAddress->serialize());
		$writer->write(Converter::intToBinary(strlen($this->message), 2)); // bound: message_size
		$writer->write(Converter::intToBinary(count($this->mosaics), 1)); // bound: mosaics_count
		$writer->write(Converter::intToBinary($this->transferTransactionBodyReserved_1, 1));
		$writer->write(Converter::intToBinary($this->transferTransactionBodyReserved_2, 4));
		ArrayHelpers::writeArray($writer, $this->mosaics, fn ($e) => isset($e->mosaicId->comparer) ? $e->mosaicId->comparer() : $e->mosaicId->value);
		$writer->write($this->message);
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'recipientAddress: ' . $this->recipientAddress . ', ';
		$result .= 'mosaics: ' . '[' . implode(',', array_map(fn ($e) => $e, $this->mosaics)) . ']' . ', ';
		$result .= 'message: ' . 'hex(0x' . strtoupper(bin2hex($this->message)) . ')' . ', ';
		$result .= ')';
		return $result;
	}
}

class TransactionFactory {
	public static function toKey($values){
		if (count($values) === 1) {
			return $values[0];
		}

		// assume each key is at most 32bits
		return array_reduce(array_map('intval', $values), function ($accumulator, $value) {
			return ($accumulator << 32) + $value;
		}, 0);
	}

	public static function deserialize($binaryData){
		$reader = new BinaryReader($binaryData);
		$parent = new Transaction();
		Transaction::_deserialize($reader, $parent);
		$reader->setPosition(0);
		$mapping = [
		self::toKey([AccountKeyLinkTransactionV1::TRANSACTION_TYPE, AccountKeyLinkTransactionV1::TRANSACTION_VERSION]) => AccountKeyLinkTransactionV1::class,
		self::toKey([NodeKeyLinkTransactionV1::TRANSACTION_TYPE, NodeKeyLinkTransactionV1::TRANSACTION_VERSION]) => NodeKeyLinkTransactionV1::class,
		self::toKey([AggregateCompleteTransactionV1::TRANSACTION_TYPE, AggregateCompleteTransactionV1::TRANSACTION_VERSION]) => AggregateCompleteTransactionV1::class,
		self::toKey([AggregateCompleteTransactionV2::TRANSACTION_TYPE, AggregateCompleteTransactionV2::TRANSACTION_VERSION]) => AggregateCompleteTransactionV2::class,
		self::toKey([AggregateBondedTransactionV1::TRANSACTION_TYPE, AggregateBondedTransactionV1::TRANSACTION_VERSION]) => AggregateBondedTransactionV1::class,
		self::toKey([AggregateBondedTransactionV2::TRANSACTION_TYPE, AggregateBondedTransactionV2::TRANSACTION_VERSION]) => AggregateBondedTransactionV2::class,
		self::toKey([VotingKeyLinkTransactionV1::TRANSACTION_TYPE, VotingKeyLinkTransactionV1::TRANSACTION_VERSION]) => VotingKeyLinkTransactionV1::class,
		self::toKey([VrfKeyLinkTransactionV1::TRANSACTION_TYPE, VrfKeyLinkTransactionV1::TRANSACTION_VERSION]) => VrfKeyLinkTransactionV1::class,
		self::toKey([HashLockTransactionV1::TRANSACTION_TYPE, HashLockTransactionV1::TRANSACTION_VERSION]) => HashLockTransactionV1::class,
		self::toKey([SecretLockTransactionV1::TRANSACTION_TYPE, SecretLockTransactionV1::TRANSACTION_VERSION]) => SecretLockTransactionV1::class,
		self::toKey([SecretProofTransactionV1::TRANSACTION_TYPE, SecretProofTransactionV1::TRANSACTION_VERSION]) => SecretProofTransactionV1::class,
		self::toKey([AccountMetadataTransactionV1::TRANSACTION_TYPE, AccountMetadataTransactionV1::TRANSACTION_VERSION]) => AccountMetadataTransactionV1::class,
		self::toKey([MosaicMetadataTransactionV1::TRANSACTION_TYPE, MosaicMetadataTransactionV1::TRANSACTION_VERSION]) => MosaicMetadataTransactionV1::class,
		self::toKey([NamespaceMetadataTransactionV1::TRANSACTION_TYPE, NamespaceMetadataTransactionV1::TRANSACTION_VERSION]) => NamespaceMetadataTransactionV1::class,
		self::toKey([MosaicDefinitionTransactionV1::TRANSACTION_TYPE, MosaicDefinitionTransactionV1::TRANSACTION_VERSION]) => MosaicDefinitionTransactionV1::class,
		self::toKey([MosaicSupplyChangeTransactionV1::TRANSACTION_TYPE, MosaicSupplyChangeTransactionV1::TRANSACTION_VERSION]) => MosaicSupplyChangeTransactionV1::class,
		self::toKey([MosaicSupplyRevocationTransactionV1::TRANSACTION_TYPE, MosaicSupplyRevocationTransactionV1::TRANSACTION_VERSION]) => MosaicSupplyRevocationTransactionV1::class,
		self::toKey([MultisigAccountModificationTransactionV1::TRANSACTION_TYPE, MultisigAccountModificationTransactionV1::TRANSACTION_VERSION]) => MultisigAccountModificationTransactionV1::class,
		self::toKey([AddressAliasTransactionV1::TRANSACTION_TYPE, AddressAliasTransactionV1::TRANSACTION_VERSION]) => AddressAliasTransactionV1::class,
		self::toKey([MosaicAliasTransactionV1::TRANSACTION_TYPE, MosaicAliasTransactionV1::TRANSACTION_VERSION]) => MosaicAliasTransactionV1::class,
		self::toKey([NamespaceRegistrationTransactionV1::TRANSACTION_TYPE, NamespaceRegistrationTransactionV1::TRANSACTION_VERSION]) => NamespaceRegistrationTransactionV1::class,
		self::toKey([AccountAddressRestrictionTransactionV1::TRANSACTION_TYPE, AccountAddressRestrictionTransactionV1::TRANSACTION_VERSION]) => AccountAddressRestrictionTransactionV1::class,
		self::toKey([AccountMosaicRestrictionTransactionV1::TRANSACTION_TYPE, AccountMosaicRestrictionTransactionV1::TRANSACTION_VERSION]) => AccountMosaicRestrictionTransactionV1::class,
		self::toKey([AccountOperationRestrictionTransactionV1::TRANSACTION_TYPE, AccountOperationRestrictionTransactionV1::TRANSACTION_VERSION]) => AccountOperationRestrictionTransactionV1::class,
		self::toKey([MosaicAddressRestrictionTransactionV1::TRANSACTION_TYPE, MosaicAddressRestrictionTransactionV1::TRANSACTION_VERSION]) => MosaicAddressRestrictionTransactionV1::class,
		self::toKey([MosaicGlobalRestrictionTransactionV1::TRANSACTION_TYPE, MosaicGlobalRestrictionTransactionV1::TRANSACTION_VERSION]) => MosaicGlobalRestrictionTransactionV1::class,
		self::toKey([TransferTransactionV1::TRANSACTION_TYPE, TransferTransactionV1::TRANSACTION_VERSION]) => TransferTransactionV1::class,];
		$discriminator = self::toKey([$parent->type->value, $parent->version]);
		if (!array_key_exists($discriminator, $mapping)) {
			throw new Exception("Unknown Transaction type");
		}
		$factoryClass = $mapping[$discriminator];
		return call_user_func([$factoryClass, 'deserialize'], $reader);
	}
}

class EmbeddedTransactionFactory {
	public static function toKey($values){
		if (count($values) === 1) {
			return $values[0];
		}

		// assume each key is at most 32bits
		return array_reduce(array_map('intval', $values), function ($accumulator, $value) {
			return ($accumulator << 32) + $value;
		}, 0);
	}

	public static function deserialize($binaryData){
		$reader = new BinaryReader($binaryData);
		$parent = new EmbeddedTransaction();
		EmbeddedTransaction::_deserialize($reader, $parent);
		$reader->setPosition(0);
		$mapping = [
		self::toKey([EmbeddedAccountKeyLinkTransactionV1::TRANSACTION_TYPE, EmbeddedAccountKeyLinkTransactionV1::TRANSACTION_VERSION]) => EmbeddedAccountKeyLinkTransactionV1::class,
		self::toKey([EmbeddedNodeKeyLinkTransactionV1::TRANSACTION_TYPE, EmbeddedNodeKeyLinkTransactionV1::TRANSACTION_VERSION]) => EmbeddedNodeKeyLinkTransactionV1::class,
		self::toKey([EmbeddedVotingKeyLinkTransactionV1::TRANSACTION_TYPE, EmbeddedVotingKeyLinkTransactionV1::TRANSACTION_VERSION]) => EmbeddedVotingKeyLinkTransactionV1::class,
		self::toKey([EmbeddedVrfKeyLinkTransactionV1::TRANSACTION_TYPE, EmbeddedVrfKeyLinkTransactionV1::TRANSACTION_VERSION]) => EmbeddedVrfKeyLinkTransactionV1::class,
		self::toKey([EmbeddedHashLockTransactionV1::TRANSACTION_TYPE, EmbeddedHashLockTransactionV1::TRANSACTION_VERSION]) => EmbeddedHashLockTransactionV1::class,
		self::toKey([EmbeddedSecretLockTransactionV1::TRANSACTION_TYPE, EmbeddedSecretLockTransactionV1::TRANSACTION_VERSION]) => EmbeddedSecretLockTransactionV1::class,
		self::toKey([EmbeddedSecretProofTransactionV1::TRANSACTION_TYPE, EmbeddedSecretProofTransactionV1::TRANSACTION_VERSION]) => EmbeddedSecretProofTransactionV1::class,
		self::toKey([EmbeddedAccountMetadataTransactionV1::TRANSACTION_TYPE, EmbeddedAccountMetadataTransactionV1::TRANSACTION_VERSION]) => EmbeddedAccountMetadataTransactionV1::class,
		self::toKey([EmbeddedMosaicMetadataTransactionV1::TRANSACTION_TYPE, EmbeddedMosaicMetadataTransactionV1::TRANSACTION_VERSION]) => EmbeddedMosaicMetadataTransactionV1::class,
		self::toKey([EmbeddedNamespaceMetadataTransactionV1::TRANSACTION_TYPE, EmbeddedNamespaceMetadataTransactionV1::TRANSACTION_VERSION]) => EmbeddedNamespaceMetadataTransactionV1::class,
		self::toKey([EmbeddedMosaicDefinitionTransactionV1::TRANSACTION_TYPE, EmbeddedMosaicDefinitionTransactionV1::TRANSACTION_VERSION]) => EmbeddedMosaicDefinitionTransactionV1::class,
		self::toKey([EmbeddedMosaicSupplyChangeTransactionV1::TRANSACTION_TYPE, EmbeddedMosaicSupplyChangeTransactionV1::TRANSACTION_VERSION]) => EmbeddedMosaicSupplyChangeTransactionV1::class,
		self::toKey([EmbeddedMosaicSupplyRevocationTransactionV1::TRANSACTION_TYPE, EmbeddedMosaicSupplyRevocationTransactionV1::TRANSACTION_VERSION]) => EmbeddedMosaicSupplyRevocationTransactionV1::class,
		self::toKey([EmbeddedMultisigAccountModificationTransactionV1::TRANSACTION_TYPE, EmbeddedMultisigAccountModificationTransactionV1::TRANSACTION_VERSION]) => EmbeddedMultisigAccountModificationTransactionV1::class,
		self::toKey([EmbeddedAddressAliasTransactionV1::TRANSACTION_TYPE, EmbeddedAddressAliasTransactionV1::TRANSACTION_VERSION]) => EmbeddedAddressAliasTransactionV1::class,
		self::toKey([EmbeddedMosaicAliasTransactionV1::TRANSACTION_TYPE, EmbeddedMosaicAliasTransactionV1::TRANSACTION_VERSION]) => EmbeddedMosaicAliasTransactionV1::class,
		self::toKey([EmbeddedNamespaceRegistrationTransactionV1::TRANSACTION_TYPE, EmbeddedNamespaceRegistrationTransactionV1::TRANSACTION_VERSION]) => EmbeddedNamespaceRegistrationTransactionV1::class,
		self::toKey([EmbeddedAccountAddressRestrictionTransactionV1::TRANSACTION_TYPE, EmbeddedAccountAddressRestrictionTransactionV1::TRANSACTION_VERSION]) => EmbeddedAccountAddressRestrictionTransactionV1::class,
		self::toKey([EmbeddedAccountMosaicRestrictionTransactionV1::TRANSACTION_TYPE, EmbeddedAccountMosaicRestrictionTransactionV1::TRANSACTION_VERSION]) => EmbeddedAccountMosaicRestrictionTransactionV1::class,
		self::toKey([EmbeddedAccountOperationRestrictionTransactionV1::TRANSACTION_TYPE, EmbeddedAccountOperationRestrictionTransactionV1::TRANSACTION_VERSION]) => EmbeddedAccountOperationRestrictionTransactionV1::class,
		self::toKey([EmbeddedMosaicAddressRestrictionTransactionV1::TRANSACTION_TYPE, EmbeddedMosaicAddressRestrictionTransactionV1::TRANSACTION_VERSION]) => EmbeddedMosaicAddressRestrictionTransactionV1::class,
		self::toKey([EmbeddedMosaicGlobalRestrictionTransactionV1::TRANSACTION_TYPE, EmbeddedMosaicGlobalRestrictionTransactionV1::TRANSACTION_VERSION]) => EmbeddedMosaicGlobalRestrictionTransactionV1::class,
		self::toKey([EmbeddedTransferTransactionV1::TRANSACTION_TYPE, EmbeddedTransferTransactionV1::TRANSACTION_VERSION]) => EmbeddedTransferTransactionV1::class,];
		$discriminator = self::toKey([$parent->type->value, $parent->version]);
		if (!array_key_exists($discriminator, $mapping)) {
			throw new Exception("Unknown EmbeddedTransaction type");
		}
		$factoryClass = $mapping[$discriminator];
		return call_user_func([$factoryClass, 'deserialize'], $reader);
	}
}

class BlockFactory {
	public static function toKey($values){
		if (count($values) === 1) {
			return $values[0];
		}

		// assume each key is at most 32bits
		return array_reduce(array_map('intval', $values), function ($accumulator, $value) {
			return ($accumulator << 32) + $value;
		}, 0);
	}

	public static function deserialize($binaryData){
		$reader = new BinaryReader($binaryData);
		$parent = new Block();
		Block::_deserialize($reader, $parent);
		$reader->setPosition(0);
		$mapping = [
		self::toKey([NemesisBlockV1::BLOCK_TYPE]) => NemesisBlockV1::class,
		self::toKey([NormalBlockV1::BLOCK_TYPE]) => NormalBlockV1::class,
		self::toKey([ImportanceBlockV1::BLOCK_TYPE]) => ImportanceBlockV1::class,];
		$discriminator = self::toKey([$parent->type->value]);
		if (!array_key_exists($discriminator, $mapping)) {
			throw new Exception("Unknown Block type");
		}
		$factoryClass = $mapping[$discriminator];
		return call_user_func([$factoryClass, 'deserialize'], $reader);
	}
}

class ReceiptFactory {
	public static function toKey($values){
		if (count($values) === 1) {
			return $values[0];
		}

		// assume each key is at most 32bits
		return array_reduce(array_map('intval', $values), function ($accumulator, $value) {
			return ($accumulator << 32) + $value;
		}, 0);
	}

	public static function deserialize($binaryData){
		$reader = new BinaryReader($binaryData);
		$parent = new Receipt();
		Receipt::_deserialize($reader, $parent);
		$reader->setPosition(0);
		$mapping = [
		self::toKey([HarvestFeeReceipt::RECEIPT_TYPE]) => HarvestFeeReceipt::class,
		self::toKey([InflationReceipt::RECEIPT_TYPE]) => InflationReceipt::class,
		self::toKey([LockHashCreatedFeeReceipt::RECEIPT_TYPE]) => LockHashCreatedFeeReceipt::class,
		self::toKey([LockHashCompletedFeeReceipt::RECEIPT_TYPE]) => LockHashCompletedFeeReceipt::class,
		self::toKey([LockHashExpiredFeeReceipt::RECEIPT_TYPE]) => LockHashExpiredFeeReceipt::class,
		self::toKey([LockSecretCreatedFeeReceipt::RECEIPT_TYPE]) => LockSecretCreatedFeeReceipt::class,
		self::toKey([LockSecretCompletedFeeReceipt::RECEIPT_TYPE]) => LockSecretCompletedFeeReceipt::class,
		self::toKey([LockSecretExpiredFeeReceipt::RECEIPT_TYPE]) => LockSecretExpiredFeeReceipt::class,
		self::toKey([MosaicExpiredReceipt::RECEIPT_TYPE]) => MosaicExpiredReceipt::class,
		self::toKey([MosaicRentalFeeReceipt::RECEIPT_TYPE]) => MosaicRentalFeeReceipt::class,
		self::toKey([NamespaceExpiredReceipt::RECEIPT_TYPE]) => NamespaceExpiredReceipt::class,
		self::toKey([NamespaceDeletedReceipt::RECEIPT_TYPE]) => NamespaceDeletedReceipt::class,
		self::toKey([NamespaceRentalFeeReceipt::RECEIPT_TYPE]) => NamespaceRentalFeeReceipt::class,];
		$discriminator = self::toKey([$parent->type->value]);
		if (!array_key_exists($discriminator, $mapping)) {
			throw new Exception("Unknown Receipt type");
		}
		$factoryClass = $mapping[$discriminator];
		return call_user_func([$factoryClass, 'deserialize'], $reader);
	}
}
