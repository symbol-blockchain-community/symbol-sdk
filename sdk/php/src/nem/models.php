<?php
$base_path = dirname(dirname(__FILE__));
require_once $base_path . '/BaseValue.php';
require_once $base_path . '/BinaryData.php';
require_once $base_path . '/BinaryStream.php';
require_once $base_path . '/utils/converter.php';

import { ripemdKeccak256 } from '../utils/transforms.js';

class Amount extends BaseValue {
	public function __construct(int $amount = 0){
		parent::__construct(8, $amount);
	}

	public static function size(): int {
		return 8;
	}

	public static function deserialize(BinaryReader $reader): self {
		return new self(Converter::binaryToInt($reader->read(8), 8));
	}

	public static function deserializeAligned(BinaryReader $reader): self {
		return new self(Converter::binaryToInt($reader->read(8), 8));
	}

	public function serialize(): string {
		return Converter::intToBinary($this->value, 8);
	}
}

class Height extends BaseValue {
	public function __construct(int $height = 0){
		parent::__construct(8, $height);
	}

	public static function size(): int {
		return 8;
	}

	public static function deserialize(BinaryReader $reader): self {
		return new self(Converter::binaryToInt($reader->read(8), 8));
	}

	public static function deserializeAligned(BinaryReader $reader): self {
		return new self(Converter::binaryToInt($reader->read(8), 8));
	}

	public function serialize(): string {
		return Converter::intToBinary($this->value, 8);
	}
}

class Timestamp extends BaseValue {
	public function __construct(int $timestamp = 0){
		parent::__construct(4, $timestamp);
	}

	public static function size(): int {
		return 4;
	}

	public static function deserialize(BinaryReader $reader): self {
		return new self(Converter::binaryToInt($reader->read(4), 4));
	}

	public static function deserializeAligned(BinaryReader $reader): self {
		return new self(Converter::binaryToInt($reader->read(4), 4));
	}

	public function serialize(): string {
		return Converter::intToBinary($this->value, 4);
	}
}

class Address extends BinaryData {
	public function __construct(string $address = null){
		$address = $address ?? str_repeat("\x00", self::size());
		parent::__construct(40, $address);
	}

	public static function size(): int {
		return 40;
	}

	public static function deserialize(BinaryReader $reader): self {
		return new self($reader->read(40));
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

class NetworkType {
	const MAINNET = 104;

	const TESTNET = 152;

	public $value;

	public function __construct(int $value = 0){
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

	public static function deserializeAligned(BinaryReader $reader): self {
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
	const TRANSFER = 257;

	const ACCOUNT_KEY_LINK = 2049;

	const MULTISIG_ACCOUNT_MODIFICATION = 4097;

	const MULTISIG_COSIGNATURE = 4098;

	const MULTISIG = 4100;

	const NAMESPACE_REGISTRATION = 8193;

	const MOSAIC_DEFINITION = 16385;

	const MOSAIC_SUPPLY_CHANGE = 16386;

	public $value;

	public function __construct(int $value = 0){
		$this->value = $value;
	}

	static function valueToKey($value){
		$values = [
			257, 2049, 4097, 4098, 4100, 8193, 16385, 16386
		];
		$keys = [
			'TRANSFER', 'ACCOUNT_KEY_LINK', 'MULTISIG_ACCOUNT_MODIFICATION', 'MULTISIG_COSIGNATURE', 'MULTISIG', 'NAMESPACE_REGISTRATION',
			'MOSAIC_DEFINITION', 'MOSAIC_SUPPLY_CHANGE'
		];

		$index = array_search($value, $values);
		if ($index === false)
			throw new Exception("Invalid enum value: {$value}");

		return $keys[$index];
	}

	public static function size(){
		return 4;
	}

	public static function deserialize(BinaryReader $reader): self {
		return new TransactionType(Converter::binaryToInt($reader->read(4), 4));
	}

	public static function deserializeAligned(BinaryReader $reader): self {
		return new TransactionType(Converter::binaryToInt($reader->read(4), 4));
	}

	public function serialize(): string {
		return Converter::intToBinary($this->value, 4);
	}

	public function __toString(){
		return "TransactionType." . self::valueToKey($this->value);
	}
}

class Transaction {
	public TransactionType $type;

	public int $version;

	public NetworkType $network;

	public Timestamp $timestamp;

	public PublicKey $signerPublicKey;

	public Signature $signature;

	public Amount $fee;

	public Timestamp $deadline;

	private int $entityBodyReserved_1 = 0; // reserved field

	private int $signerPublicKeySize = 32; // reserved field

	private int $signatureSize = 64; // reserved field

	public function __construct(
		?TransactionType $type = null,
		?int $version = null,
		?NetworkType $network = null,
		?Timestamp $timestamp = null,
		?PublicKey $signerPublicKey = null,
		?Signature $signature = null,
		?Amount $fee = null,
		?Timestamp $deadline = null
	){
		$this->type = $type ?? new TransactionType();
		$this->version = $version ?? 0;
		$this->network = $network ?? new NetworkType();
		$this->timestamp = $timestamp ?? new Timestamp();
		$this->signerPublicKey = $signerPublicKey ?? new PublicKey();
		$this->signature = $signature ?? new Signature();
		$this->fee = $fee ?? new Amount();
		$this->deadline = $deadline ?? new Timestamp();
		$this->entityBodyReserved_1 = 0; // reserved field
		$this->signerPublicKeySize = 32; // reserved field
		$this->signatureSize = 64; // reserved field
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += $this->type->size();
		$size += 1;
		$size += 2;
		$size += $this->network->size();
		$size += $this->timestamp->size();
		$size += 4;
		$size += $this->signerPublicKey->size();
		$size += 4;
		$size += $this->signature->size();
		$size += $this->fee->size();
		$size += $this->deadline->size();
		return $size;
	}

	public static function _deserialize(BinaryReader &$reader, Transaction $instance): void {
		$type = TransactionType::deserialize($reader);
		$version = Converter::binaryToInt($reader->read(1), 1);
		$entityBodyReserved_1 = Converter::binaryToInt($reader->read(2), 2);
		if (0 !== $entityBodyReserved_1)
			throw new OutOfRangeException('Invalid value of reserved field (' . $entityBodyReserved_1 . ')');
		$network = NetworkType::deserialize($reader);
		$timestamp = Timestamp::deserialize($reader);
		$signerPublicKeySize = Converter::binaryToInt($reader->read(4), 4);
		if (32 !== $signerPublicKeySize)
			throw new OutOfRangeException('Invalid value of reserved field (' . $signerPublicKeySize . ')');
		$signerPublicKey = PublicKey::deserialize($reader);
		$signatureSize = Converter::binaryToInt($reader->read(4), 4);
		if (64 !== $signatureSize)
			throw new OutOfRangeException('Invalid value of reserved field (' . $signatureSize . ')');
		$signature = Signature::deserialize($reader);
		$fee = Amount::deserialize($reader);
		$deadline = Timestamp::deserialize($reader);

		$instance->type = $type;
		$instance->version = $version;
		$instance->network = $network;
		$instance->timestamp = $timestamp;
		$instance->signerPublicKey = $signerPublicKey;
		$instance->signature = $signature;
		$instance->fee = $fee;
		$instance->deadline = $deadline;
	}

	public function _serialize(BinaryWriter &$writer): void {
		$writer->write($this->type->serialize());
		$writer->write(Converter::intToBinary($this->version, 1));
		$writer->write(Converter::intToBinary($this->entityBodyReserved_1, 2));
		$writer->write($this->network->serialize());
		$writer->write($this->timestamp->serialize());
		$writer->write(Converter::intToBinary($this->signerPublicKeySize, 4));
		$writer->write($this->signerPublicKey->serialize());
		$writer->write(Converter::intToBinary($this->signatureSize, 4));
		$writer->write($this->signature->serialize());
		$writer->write($this->fee->serialize());
		$writer->write($this->deadline->serialize());
	}

	public function __toString(){
		$result = '';
		$result .= 'type: ' . $this->type . ', ';
		$result .= 'version: ' . '0x' . Converter::intToHex($this->version, 1) . ', ';
		$result .= 'network: ' . $this->network . ', ';
		$result .= 'timestamp: ' . $this->timestamp . ', ';
		$result .= 'signerPublicKey: ' . $this->signerPublicKey . ', ';
		$result .= 'signature: ' . $this->signature . ', ';
		$result .= 'fee: ' . $this->fee . ', ';
		$result .= 'deadline: ' . $this->deadline . ', ';
		return $result;
	}
}

class NonVerifiableTransaction {
	public TransactionType $type;

	public int $version;

	public NetworkType $network;

	public Timestamp $timestamp;

	public PublicKey $signerPublicKey;

	public Amount $fee;

	public Timestamp $deadline;

	private int $entityBodyReserved_1 = 0; // reserved field

	private int $signerPublicKeySize = 32; // reserved field

	public function __construct(
		?TransactionType $type = null,
		?int $version = null,
		?NetworkType $network = null,
		?Timestamp $timestamp = null,
		?PublicKey $signerPublicKey = null,
		?Amount $fee = null,
		?Timestamp $deadline = null
	){
		$this->type = $type ?? new TransactionType();
		$this->version = $version ?? 0;
		$this->network = $network ?? new NetworkType();
		$this->timestamp = $timestamp ?? new Timestamp();
		$this->signerPublicKey = $signerPublicKey ?? new PublicKey();
		$this->fee = $fee ?? new Amount();
		$this->deadline = $deadline ?? new Timestamp();
		$this->entityBodyReserved_1 = 0; // reserved field
		$this->signerPublicKeySize = 32; // reserved field
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += $this->type->size();
		$size += 1;
		$size += 2;
		$size += $this->network->size();
		$size += $this->timestamp->size();
		$size += 4;
		$size += $this->signerPublicKey->size();
		$size += $this->fee->size();
		$size += $this->deadline->size();
		return $size;
	}

	public static function _deserialize(BinaryReader &$reader, NonVerifiableTransaction $instance): void {
		$type = TransactionType::deserialize($reader);
		$version = Converter::binaryToInt($reader->read(1), 1);
		$entityBodyReserved_1 = Converter::binaryToInt($reader->read(2), 2);
		if (0 !== $entityBodyReserved_1)
			throw new OutOfRangeException('Invalid value of reserved field (' . $entityBodyReserved_1 . ')');
		$network = NetworkType::deserialize($reader);
		$timestamp = Timestamp::deserialize($reader);
		$signerPublicKeySize = Converter::binaryToInt($reader->read(4), 4);
		if (32 !== $signerPublicKeySize)
			throw new OutOfRangeException('Invalid value of reserved field (' . $signerPublicKeySize . ')');
		$signerPublicKey = PublicKey::deserialize($reader);
		$fee = Amount::deserialize($reader);
		$deadline = Timestamp::deserialize($reader);

		$instance->type = $type;
		$instance->version = $version;
		$instance->network = $network;
		$instance->timestamp = $timestamp;
		$instance->signerPublicKey = $signerPublicKey;
		$instance->fee = $fee;
		$instance->deadline = $deadline;
	}

	public function _serialize(BinaryWriter &$writer): void {
		$writer->write($this->type->serialize());
		$writer->write(Converter::intToBinary($this->version, 1));
		$writer->write(Converter::intToBinary($this->entityBodyReserved_1, 2));
		$writer->write($this->network->serialize());
		$writer->write($this->timestamp->serialize());
		$writer->write(Converter::intToBinary($this->signerPublicKeySize, 4));
		$writer->write($this->signerPublicKey->serialize());
		$writer->write($this->fee->serialize());
		$writer->write($this->deadline->serialize());
	}

	public function __toString(){
		$result = '';
		$result .= 'type: ' . $this->type . ', ';
		$result .= 'version: ' . '0x' . Converter::intToHex($this->version, 1) . ', ';
		$result .= 'network: ' . $this->network . ', ';
		$result .= 'timestamp: ' . $this->timestamp . ', ';
		$result .= 'signerPublicKey: ' . $this->signerPublicKey . ', ';
		$result .= 'fee: ' . $this->fee . ', ';
		$result .= 'deadline: ' . $this->deadline . ', ';
		return $result;
	}
}

class LinkAction {
	const LINK = 1;

	const UNLINK = 2;

	public $value;

	public function __construct(int $value = 0){
		$this->value = $value;
	}

	static function valueToKey($value){
		$values = [
			1, 2
		];
		$keys = [
			'LINK', 'UNLINK'
		];

		$index = array_search($value, $values);
		if ($index === false)
			throw new Exception("Invalid enum value: {$value}");

		return $keys[$index];
	}

	public static function size(){
		return 4;
	}

	public static function deserialize(BinaryReader $reader): self {
		return new LinkAction(Converter::binaryToInt($reader->read(4), 4));
	}

	public static function deserializeAligned(BinaryReader $reader): self {
		return new LinkAction(Converter::binaryToInt($reader->read(4), 4));
	}

	public function serialize(): string {
		return Converter::intToBinary($this->value, 4);
	}

	public function __toString(){
		return "LinkAction." . self::valueToKey($this->value);
	}
}

class AccountKeyLinkTransactionV1 extends Transaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::ACCOUNT_KEY_LINK;

	public LinkAction $linkAction;

	public PublicKey $remotePublicKey;

	private int $remotePublicKeySize = 32; // reserved field

	public function __construct(
		?NetworkType $network = null,
		?Timestamp $timestamp = null,
		?PublicKey $signerPublicKey = null,
		?Signature $signature = null,
		?Amount $fee = null,
		?Timestamp $deadline = null,
		?LinkAction $linkAction = null,
		?PublicKey $remotePublicKey = null
	){
		parent::__construct(
			new TransactionType(AccountKeyLinkTransactionV1::TRANSACTION_TYPE),
			AccountKeyLinkTransactionV1::TRANSACTION_VERSION,
			$network,
			$timestamp,
			$signerPublicKey,
			$signature,
			$fee,
			$deadline,
		);
		$this->linkAction = $linkAction ?? new LinkAction();
		$this->remotePublicKey = $remotePublicKey ?? new PublicKey();
		$this->remotePublicKeySize = 32; // reserved field
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->linkAction->size();
		$size += 4;
		$size += $this->remotePublicKey->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new AccountKeyLinkTransactionV1();

		Transaction::_deserialize($reader, $instance);
		$linkAction = LinkAction::deserialize($reader);
		$remotePublicKeySize = Converter::binaryToInt($reader->read(4), 4);
		if (32 !== $remotePublicKeySize)
			throw new OutOfRangeException('Invalid value of reserved field (' . $remotePublicKeySize . ')');
		$remotePublicKey = PublicKey::deserialize($reader);

		$instance->linkAction = $linkAction;
		$instance->remotePublicKey = $remotePublicKey;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->linkAction->serialize());
		$writer->write(Converter::intToBinary($this->remotePublicKeySize, 4));
		$writer->write($this->remotePublicKey->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'linkAction: ' . $this->linkAction . ', ';
		$result .= 'remotePublicKey: ' . $this->remotePublicKey . ', ';
		$result .= ')';
		return $result;
	}
}

class NonVerifiableAccountKeyLinkTransactionV1 extends NonVerifiableTransaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::ACCOUNT_KEY_LINK;

	public LinkAction $linkAction;

	public PublicKey $remotePublicKey;

	private int $remotePublicKeySize = 32; // reserved field

	public function __construct(
		?NetworkType $network = null,
		?Timestamp $timestamp = null,
		?PublicKey $signerPublicKey = null,
		?Amount $fee = null,
		?Timestamp $deadline = null,
		?LinkAction $linkAction = null,
		?PublicKey $remotePublicKey = null
	){
		parent::__construct(
			new TransactionType(NonVerifiableAccountKeyLinkTransactionV1::TRANSACTION_TYPE),
			NonVerifiableAccountKeyLinkTransactionV1::TRANSACTION_VERSION,
			$network,
			$timestamp,
			$signerPublicKey,
			$fee,
			$deadline,
		);
		$this->linkAction = $linkAction ?? new LinkAction();
		$this->remotePublicKey = $remotePublicKey ?? new PublicKey();
		$this->remotePublicKeySize = 32; // reserved field
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += $this->linkAction->size();
		$size += 4;
		$size += $this->remotePublicKey->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new NonVerifiableAccountKeyLinkTransactionV1();

		NonVerifiableTransaction::_deserialize($reader, $instance);
		$linkAction = LinkAction::deserialize($reader);
		$remotePublicKeySize = Converter::binaryToInt($reader->read(4), 4);
		if (32 !== $remotePublicKeySize)
			throw new OutOfRangeException('Invalid value of reserved field (' . $remotePublicKeySize . ')');
		$remotePublicKey = PublicKey::deserialize($reader);

		$instance->linkAction = $linkAction;
		$instance->remotePublicKey = $remotePublicKey;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write($this->linkAction->serialize());
		$writer->write(Converter::intToBinary($this->remotePublicKeySize, 4));
		$writer->write($this->remotePublicKey->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'linkAction: ' . $this->linkAction . ', ';
		$result .= 'remotePublicKey: ' . $this->remotePublicKey . ', ';
		$result .= ')';
		return $result;
	}
}

class NamespaceId {
	public string $name;

	public function __construct(?string $name = null){
		$this->name = $name ?? '';
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += 4;
		$size += strlen($this->name);
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new NamespaceId();

		$nameSize = Converter::binaryToInt($reader->read(4), 4);
		$name = $reader->read($nameSize);

		$instance->name = $name;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$writer->write(Converter::intToBinary(strlen($this->name), 4)); // bound: name_size
		$writer->write($this->name);
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '';
		$result .= 'name: ' . 'hex(0x' . strtoupper(bin2hex($this->name)) . ')' . ', ';
		return $result;
	}
}

class MosaicId {
	public NamespaceId $namespaceId;

	public string $name;

	public function __construct(?NamespaceId $namespaceId = null, ?string $name = null){
		$this->namespaceId = $namespaceId ?? new NamespaceId();
		$this->name = $name ?? '';
	}

	public function sort(){
		$this->namespaceId->sort();
	}

	public function size(){
		$size = 0;
		$size += $this->namespaceId->size();
		$size += 4;
		$size += strlen($this->name);
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new MosaicId();

		$namespaceId = NamespaceId::deserialize($reader);
		$nameSize = Converter::binaryToInt($reader->read(4), 4);
		$name = $reader->read($nameSize);

		$instance->namespaceId = $namespaceId;
		$instance->name = $name;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$writer->write($this->namespaceId->serialize());
		$writer->write(Converter::intToBinary(strlen($this->name), 4)); // bound: name_size
		$writer->write($this->name);
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '';
		$result .= 'namespaceId: ' . $this->namespaceId . ', ';
		$result .= 'name: ' . 'hex(0x' . strtoupper(bin2hex($this->name)) . ')' . ', ';
		return $result;
	}
}

class Mosaic {
	public MosaicId $mosaicId;

	public Amount $amount;

	public function __construct(?MosaicId $mosaicId = null, ?Amount $amount = null){
		$this->mosaicId = $mosaicId ?? new MosaicId();
		$this->amount = $amount ?? new Amount();
	}

	public function sort(){
		$this->mosaicId->sort();
	}

	public function size(){
		$size = 0;
		$size += 4;
		$size += $this->mosaicId->size();
		$size += $this->amount->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new Mosaic();

		$mosaicIdSize = Converter::binaryToInt($reader->read(4), 4);
		// marking sizeof field
		$mosaicId = MosaicId::deserialize(view.window(mosaicIdSize));
		$amount = Amount::deserialize($reader);

		$instance->mosaicId = $mosaicId;
		$instance->amount = $amount;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$writer->write(Converter::intToBinary($this->mosaicId->size(), 4)); // bound: mosaic_id_size
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

class SizePrefixedMosaic {
	public Mosaic $mosaic;

	public function __construct(?Mosaic $mosaic = null){
		$this->mosaic = $mosaic ?? new Mosaic();
	}

	public function sort(){
		$this->mosaic->sort();
	}

	public function size(){
		$size = 0;
		$size += 4;
		$size += $this->mosaic->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new SizePrefixedMosaic();

		$mosaicSize = Converter::binaryToInt($reader->read(4), 4);
		// marking sizeof field
		$mosaic = Mosaic::deserialize(view.window(mosaicSize));

		$instance->mosaic = $mosaic;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$writer->write(Converter::intToBinary($this->mosaic->size(), 4)); // bound: mosaic_size
		$writer->write($this->mosaic->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '';
		$result .= 'mosaic: ' . $this->mosaic . ', ';
		return $result;
	}
}

class MosaicTransferFeeType {
	const ABSOLUTE = 1;

	const PERCENTILE = 2;

	public $value;

	public function __construct(int $value = 0){
		$this->value = $value;
	}

	static function valueToKey($value){
		$values = [
			1, 2
		];
		$keys = [
			'ABSOLUTE', 'PERCENTILE'
		];

		$index = array_search($value, $values);
		if ($index === false)
			throw new Exception("Invalid enum value: {$value}");

		return $keys[$index];
	}

	public static function size(){
		return 4;
	}

	public static function deserialize(BinaryReader $reader): self {
		return new MosaicTransferFeeType(Converter::binaryToInt($reader->read(4), 4));
	}

	public static function deserializeAligned(BinaryReader $reader): self {
		return new MosaicTransferFeeType(Converter::binaryToInt($reader->read(4), 4));
	}

	public function serialize(): string {
		return Converter::intToBinary($this->value, 4);
	}

	public function __toString(){
		return "MosaicTransferFeeType." . self::valueToKey($this->value);
	}
}

class MosaicLevy {
	public MosaicTransferFeeType $transferFeeType;

	public Address $recipientAddress;

	public MosaicId $mosaicId;

	public Amount $fee;

	private int $recipientAddressSize = 40; // reserved field

	public function __construct(
		?MosaicTransferFeeType $transferFeeType = null,
		?Address $recipientAddress = null,
		?MosaicId $mosaicId = null,
		?Amount $fee = null
	){
		$this->transferFeeType = $transferFeeType ?? new MosaicTransferFeeType();
		$this->recipientAddress = $recipientAddress ?? new Address();
		$this->mosaicId = $mosaicId ?? new MosaicId();
		$this->fee = $fee ?? new Amount();
		$this->recipientAddressSize = 40; // reserved field
	}

	public function sort(){
		$this->mosaicId->sort();
	}

	public function size(){
		$size = 0;
		$size += $this->transferFeeType->size();
		$size += 4;
		$size += $this->recipientAddress->size();
		$size += 4;
		$size += $this->mosaicId->size();
		$size += $this->fee->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new MosaicLevy();

		$transferFeeType = MosaicTransferFeeType::deserialize($reader);
		$recipientAddressSize = Converter::binaryToInt($reader->read(4), 4);
		if (40 !== $recipientAddressSize)
			throw new OutOfRangeException('Invalid value of reserved field (' . $recipientAddressSize . ')');
		$recipientAddress = Address::deserialize($reader);
		$mosaicIdSize = Converter::binaryToInt($reader->read(4), 4);
		// marking sizeof field
		$mosaicId = MosaicId::deserialize(view.window(mosaicIdSize));
		$fee = Amount::deserialize($reader);

		$instance->transferFeeType = $transferFeeType;
		$instance->recipientAddress = $recipientAddress;
		$instance->mosaicId = $mosaicId;
		$instance->fee = $fee;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$writer->write($this->transferFeeType->serialize());
		$writer->write(Converter::intToBinary($this->recipientAddressSize, 4));
		$writer->write($this->recipientAddress->serialize());
		$writer->write(Converter::intToBinary($this->mosaicId->size(), 4)); // bound: mosaic_id_size
		$writer->write($this->mosaicId->serialize());
		$writer->write($this->fee->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '';
		$result .= 'transferFeeType: ' . $this->transferFeeType . ', ';
		$result .= 'recipientAddress: ' . $this->recipientAddress . ', ';
		$result .= 'mosaicId: ' . $this->mosaicId . ', ';
		$result .= 'fee: ' . $this->fee . ', ';
		return $result;
	}
}

class MosaicProperty {
	public string $name;

	public string $value;

	public function __construct(?string $name = null, ?string $value = null){
		$this->name = $name ?? '';
		$this->value = $value ?? '';
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += 4;
		$size += strlen($this->name);
		$size += 4;
		$size += strlen($this->value);
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new MosaicProperty();

		$nameSize = Converter::binaryToInt($reader->read(4), 4);
		$name = $reader->read($nameSize);
		$valueSize = Converter::binaryToInt($reader->read(4), 4);
		$value = $reader->read($valueSize);

		$instance->name = $name;
		$instance->value = $value;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$writer->write(Converter::intToBinary(strlen($this->name), 4)); // bound: name_size
		$writer->write($this->name);
		$writer->write(Converter::intToBinary(strlen($this->value), 4)); // bound: value_size
		$writer->write($this->value);
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '';
		$result .= 'name: ' . 'hex(0x' . strtoupper(bin2hex($this->name)) . ')' . ', ';
		$result .= 'value: ' . 'hex(0x' . strtoupper(bin2hex($this->value)) . ')' . ', ';
		return $result;
	}
}

class SizePrefixedMosaicProperty {
	public MosaicProperty $property;

	public function __construct(?MosaicProperty $property = null){
		$this->property = $property ?? new MosaicProperty();
	}

	public function sort(){
		$this->property->sort();
	}

	public function size(){
		$size = 0;
		$size += 4;
		$size += $this->property->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new SizePrefixedMosaicProperty();

		$propertySize = Converter::binaryToInt($reader->read(4), 4);
		// marking sizeof field
		$property = MosaicProperty::deserialize(view.window(propertySize));

		$instance->property = $property;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$writer->write(Converter::intToBinary($this->property->size(), 4)); // bound: property_size
		$writer->write($this->property->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '';
		$result .= 'property: ' . $this->property . ', ';
		return $result;
	}
}

class MosaicDefinition {
	public PublicKey $ownerPublicKey;

	public MosaicId $id;

	public string $description;

	public array $properties;

	public MosaicLevy $levy;

	private int $ownerPublicKeySize = 32; // reserved field

	public function __construct(
		?PublicKey $ownerPublicKey = null,
		?MosaicId $id = null,
		?string $description = null,
		?array $properties = null,
		?MosaicLevy $levy = null
	){
		$this->ownerPublicKey = $ownerPublicKey ?? new PublicKey();
		$this->id = $id ?? new MosaicId();
		$this->description = $description ?? '';
		$this->properties = $properties ?? [];
		$this->levy = null;
		$this->ownerPublicKeySize = 32; // reserved field
	}

	public function sort(){
		$this->id->sort();
		if (0 !== $this->levySizeComputed)
			$this->levy->sort();
	}

	get levySizeComputed(){
		return this.levy ? this.levy.size + 0 : 0;
	}

	public function size(){
		$size = 0;
		$size += 4;
		$size += $this->ownerPublicKey->size();
		$size += 4;
		$size += $this->id->size();
		$size += 4;
		$size += strlen($this->description);
		$size += 4;
		$size += ArrayHelpers::size($this->properties);
		$size += 4;
		if (0 !== $this->levySizeComputed)
			$size += $this->levy->size();

		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new MosaicDefinition();

		$ownerPublicKeySize = Converter::binaryToInt($reader->read(4), 4);
		if (32 !== $ownerPublicKeySize)
			throw new OutOfRangeException('Invalid value of reserved field (' . $ownerPublicKeySize . ')');
		$ownerPublicKey = PublicKey::deserialize($reader);
		$idSize = Converter::binaryToInt($reader->read(4), 4);
		// marking sizeof field
		$id = MosaicId::deserialize(view.window(idSize));
		$descriptionSize = Converter::binaryToInt($reader->read(4), 4);
		$description = $reader->read($descriptionSize);
		$propertiesCount = Converter::binaryToInt($reader->read(4), 4);
		$properties = ArrayHelpers::readArrayCount($reader, [SizePrefixedMosaicProperty::class, 'deserialize'], $propertiesCount);
		$levySize = Converter::binaryToInt($reader->read(4), 4);
		$levy = null;
		if (0 !== $levySize->value)
			$levy = MosaicLevy::deserialize($reader);


		$instance->ownerPublicKey = $ownerPublicKey;
		$instance->id = $id;
		$instance->description = $description;
		$instance->properties = $properties;
		$instance->levy = $levy;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$writer->write(Converter::intToBinary($this->ownerPublicKeySize, 4));
		$writer->write($this->ownerPublicKey->serialize());
		$writer->write(Converter::intToBinary($this->id->size(), 4)); // bound: id_size
		$writer->write($this->id->serialize());
		$writer->write(Converter::intToBinary(strlen($this->description), 4)); // bound: description_size
		$writer->write($this->description);
		$writer->write(Converter::intToBinary(count($this->properties), 4)); // bound: properties_count
		ArrayHelpers::writeArray($writer, $this->properties);
		$writer->write(Converter::intToBinary($this->levySizeComputed, 4));
		if (0 !== $this->levySizeComputed)
			$writer->write($this->levy->serialize());

		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '';
		$result .= 'ownerPublicKey: ' . $this->ownerPublicKey . ', ';
		$result .= 'id: ' . $this->id . ', ';
		$result .= 'description: ' . 'hex(0x' . strtoupper(bin2hex($this->description)) . ')' . ', ';
		$result .= 'properties: ' . '[' . implode(',', array_map(fn ($e) => $e, $this->properties)) . ']' . ', ';
		if (0 !== $this->levySizeComputed)
			$result .= 'levy: ' . $this->levy . ', ';

		return $result;
	}
}

class MosaicDefinitionTransactionV1 extends Transaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::MOSAIC_DEFINITION;

	public MosaicDefinition $mosaicDefinition;

	public Address $rentalFeeSink;

	public Amount $rentalFee;

	private int $rentalFeeSinkSize = 40; // reserved field

	public function __construct(
		?NetworkType $network = null,
		?Timestamp $timestamp = null,
		?PublicKey $signerPublicKey = null,
		?Signature $signature = null,
		?Amount $fee = null,
		?Timestamp $deadline = null,
		?MosaicDefinition $mosaicDefinition = null,
		?Address $rentalFeeSink = null,
		?Amount $rentalFee = null
	){
		parent::__construct(
			new TransactionType(MosaicDefinitionTransactionV1::TRANSACTION_TYPE),
			MosaicDefinitionTransactionV1::TRANSACTION_VERSION,
			$network,
			$timestamp,
			$signerPublicKey,
			$signature,
			$fee,
			$deadline,
		);
		$this->mosaicDefinition = $mosaicDefinition ?? new MosaicDefinition();
		$this->rentalFeeSink = $rentalFeeSink ?? new Address();
		$this->rentalFee = $rentalFee ?? new Amount();
		$this->rentalFeeSinkSize = 40; // reserved field
	}

	public function sort(){
		$this->mosaicDefinition->sort();
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += 4;
		$size += $this->mosaicDefinition->size();
		$size += 4;
		$size += $this->rentalFeeSink->size();
		$size += $this->rentalFee->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new MosaicDefinitionTransactionV1();

		Transaction::_deserialize($reader, $instance);
		$mosaicDefinitionSize = Converter::binaryToInt($reader->read(4), 4);
		// marking sizeof field
		$mosaicDefinition = MosaicDefinition::deserialize(view.window(mosaicDefinitionSize));
		$rentalFeeSinkSize = Converter::binaryToInt($reader->read(4), 4);
		if (40 !== $rentalFeeSinkSize)
			throw new OutOfRangeException('Invalid value of reserved field (' . $rentalFeeSinkSize . ')');
		$rentalFeeSink = Address::deserialize($reader);
		$rentalFee = Amount::deserialize($reader);

		$instance->mosaicDefinition = $mosaicDefinition;
		$instance->rentalFeeSink = $rentalFeeSink;
		$instance->rentalFee = $rentalFee;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write(Converter::intToBinary($this->mosaicDefinition->size(), 4)); // bound: mosaic_definition_size
		$writer->write($this->mosaicDefinition->serialize());
		$writer->write(Converter::intToBinary($this->rentalFeeSinkSize, 4));
		$writer->write($this->rentalFeeSink->serialize());
		$writer->write($this->rentalFee->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'mosaicDefinition: ' . $this->mosaicDefinition . ', ';
		$result .= 'rentalFeeSink: ' . $this->rentalFeeSink . ', ';
		$result .= 'rentalFee: ' . $this->rentalFee . ', ';
		$result .= ')';
		return $result;
	}
}

class NonVerifiableMosaicDefinitionTransactionV1 extends NonVerifiableTransaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::MOSAIC_DEFINITION;

	public MosaicDefinition $mosaicDefinition;

	public Address $rentalFeeSink;

	public Amount $rentalFee;

	private int $rentalFeeSinkSize = 40; // reserved field

	public function __construct(
		?NetworkType $network = null,
		?Timestamp $timestamp = null,
		?PublicKey $signerPublicKey = null,
		?Amount $fee = null,
		?Timestamp $deadline = null,
		?MosaicDefinition $mosaicDefinition = null,
		?Address $rentalFeeSink = null,
		?Amount $rentalFee = null
	){
		parent::__construct(
			new TransactionType(NonVerifiableMosaicDefinitionTransactionV1::TRANSACTION_TYPE),
			NonVerifiableMosaicDefinitionTransactionV1::TRANSACTION_VERSION,
			$network,
			$timestamp,
			$signerPublicKey,
			$fee,
			$deadline,
		);
		$this->mosaicDefinition = $mosaicDefinition ?? new MosaicDefinition();
		$this->rentalFeeSink = $rentalFeeSink ?? new Address();
		$this->rentalFee = $rentalFee ?? new Amount();
		$this->rentalFeeSinkSize = 40; // reserved field
	}

	public function sort(){
		$this->mosaicDefinition->sort();
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += 4;
		$size += $this->mosaicDefinition->size();
		$size += 4;
		$size += $this->rentalFeeSink->size();
		$size += $this->rentalFee->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new NonVerifiableMosaicDefinitionTransactionV1();

		NonVerifiableTransaction::_deserialize($reader, $instance);
		$mosaicDefinitionSize = Converter::binaryToInt($reader->read(4), 4);
		// marking sizeof field
		$mosaicDefinition = MosaicDefinition::deserialize(view.window(mosaicDefinitionSize));
		$rentalFeeSinkSize = Converter::binaryToInt($reader->read(4), 4);
		if (40 !== $rentalFeeSinkSize)
			throw new OutOfRangeException('Invalid value of reserved field (' . $rentalFeeSinkSize . ')');
		$rentalFeeSink = Address::deserialize($reader);
		$rentalFee = Amount::deserialize($reader);

		$instance->mosaicDefinition = $mosaicDefinition;
		$instance->rentalFeeSink = $rentalFeeSink;
		$instance->rentalFee = $rentalFee;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write(Converter::intToBinary($this->mosaicDefinition->size(), 4)); // bound: mosaic_definition_size
		$writer->write($this->mosaicDefinition->serialize());
		$writer->write(Converter::intToBinary($this->rentalFeeSinkSize, 4));
		$writer->write($this->rentalFeeSink->serialize());
		$writer->write($this->rentalFee->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'mosaicDefinition: ' . $this->mosaicDefinition . ', ';
		$result .= 'rentalFeeSink: ' . $this->rentalFeeSink . ', ';
		$result .= 'rentalFee: ' . $this->rentalFee . ', ';
		$result .= ')';
		return $result;
	}
}

class MosaicSupplyChangeAction {
	const INCREASE = 1;

	const DECREASE = 2;

	public $value;

	public function __construct(int $value = 0){
		$this->value = $value;
	}

	static function valueToKey($value){
		$values = [
			1, 2
		];
		$keys = [
			'INCREASE', 'DECREASE'
		];

		$index = array_search($value, $values);
		if ($index === false)
			throw new Exception("Invalid enum value: {$value}");

		return $keys[$index];
	}

	public static function size(){
		return 4;
	}

	public static function deserialize(BinaryReader $reader): self {
		return new MosaicSupplyChangeAction(Converter::binaryToInt($reader->read(4), 4));
	}

	public static function deserializeAligned(BinaryReader $reader): self {
		return new MosaicSupplyChangeAction(Converter::binaryToInt($reader->read(4), 4));
	}

	public function serialize(): string {
		return Converter::intToBinary($this->value, 4);
	}

	public function __toString(){
		return "MosaicSupplyChangeAction." . self::valueToKey($this->value);
	}
}

class MosaicSupplyChangeTransactionV1 extends Transaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::MOSAIC_SUPPLY_CHANGE;

	public MosaicId $mosaicId;

	public MosaicSupplyChangeAction $action;

	public Amount $delta;

	public function __construct(
		?NetworkType $network = null,
		?Timestamp $timestamp = null,
		?PublicKey $signerPublicKey = null,
		?Signature $signature = null,
		?Amount $fee = null,
		?Timestamp $deadline = null,
		?MosaicId $mosaicId = null,
		?MosaicSupplyChangeAction $action = null,
		?Amount $delta = null
	){
		parent::__construct(
			new TransactionType(MosaicSupplyChangeTransactionV1::TRANSACTION_TYPE),
			MosaicSupplyChangeTransactionV1::TRANSACTION_VERSION,
			$network,
			$timestamp,
			$signerPublicKey,
			$signature,
			$fee,
			$deadline,
		);
		$this->mosaicId = $mosaicId ?? new MosaicId();
		$this->action = $action ?? new MosaicSupplyChangeAction();
		$this->delta = $delta ?? new Amount();
	}

	public function sort(){
		$this->mosaicId->sort();
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += 4;
		$size += $this->mosaicId->size();
		$size += $this->action->size();
		$size += $this->delta->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new MosaicSupplyChangeTransactionV1();

		Transaction::_deserialize($reader, $instance);
		$mosaicIdSize = Converter::binaryToInt($reader->read(4), 4);
		// marking sizeof field
		$mosaicId = MosaicId::deserialize(view.window(mosaicIdSize));
		$action = MosaicSupplyChangeAction::deserialize($reader);
		$delta = Amount::deserialize($reader);

		$instance->mosaicId = $mosaicId;
		$instance->action = $action;
		$instance->delta = $delta;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write(Converter::intToBinary($this->mosaicId->size(), 4)); // bound: mosaic_id_size
		$writer->write($this->mosaicId->serialize());
		$writer->write($this->action->serialize());
		$writer->write($this->delta->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'mosaicId: ' . $this->mosaicId . ', ';
		$result .= 'action: ' . $this->action . ', ';
		$result .= 'delta: ' . $this->delta . ', ';
		$result .= ')';
		return $result;
	}
}

class NonVerifiableMosaicSupplyChangeTransactionV1 extends NonVerifiableTransaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::MOSAIC_SUPPLY_CHANGE;

	public MosaicId $mosaicId;

	public MosaicSupplyChangeAction $action;

	public Amount $delta;

	public function __construct(
		?NetworkType $network = null,
		?Timestamp $timestamp = null,
		?PublicKey $signerPublicKey = null,
		?Amount $fee = null,
		?Timestamp $deadline = null,
		?MosaicId $mosaicId = null,
		?MosaicSupplyChangeAction $action = null,
		?Amount $delta = null
	){
		parent::__construct(
			new TransactionType(NonVerifiableMosaicSupplyChangeTransactionV1::TRANSACTION_TYPE),
			NonVerifiableMosaicSupplyChangeTransactionV1::TRANSACTION_VERSION,
			$network,
			$timestamp,
			$signerPublicKey,
			$fee,
			$deadline,
		);
		$this->mosaicId = $mosaicId ?? new MosaicId();
		$this->action = $action ?? new MosaicSupplyChangeAction();
		$this->delta = $delta ?? new Amount();
	}

	public function sort(){
		$this->mosaicId->sort();
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += 4;
		$size += $this->mosaicId->size();
		$size += $this->action->size();
		$size += $this->delta->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new NonVerifiableMosaicSupplyChangeTransactionV1();

		NonVerifiableTransaction::_deserialize($reader, $instance);
		$mosaicIdSize = Converter::binaryToInt($reader->read(4), 4);
		// marking sizeof field
		$mosaicId = MosaicId::deserialize(view.window(mosaicIdSize));
		$action = MosaicSupplyChangeAction::deserialize($reader);
		$delta = Amount::deserialize($reader);

		$instance->mosaicId = $mosaicId;
		$instance->action = $action;
		$instance->delta = $delta;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write(Converter::intToBinary($this->mosaicId->size(), 4)); // bound: mosaic_id_size
		$writer->write($this->mosaicId->serialize());
		$writer->write($this->action->serialize());
		$writer->write($this->delta->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'mosaicId: ' . $this->mosaicId . ', ';
		$result .= 'action: ' . $this->action . ', ';
		$result .= 'delta: ' . $this->delta . ', ';
		$result .= ')';
		return $result;
	}
}

class MultisigAccountModificationType {
	const ADD_COSIGNATORY = 1;

	const DELETE_COSIGNATORY = 2;

	public $value;

	public function __construct(int $value = 0){
		$this->value = $value;
	}

	static function valueToKey($value){
		$values = [
			1, 2
		];
		$keys = [
			'ADD_COSIGNATORY', 'DELETE_COSIGNATORY'
		];

		$index = array_search($value, $values);
		if ($index === false)
			throw new Exception("Invalid enum value: {$value}");

		return $keys[$index];
	}

	public static function size(){
		return 4;
	}

	public static function deserialize(BinaryReader $reader): self {
		return new MultisigAccountModificationType(Converter::binaryToInt($reader->read(4), 4));
	}

	public static function deserializeAligned(BinaryReader $reader): self {
		return new MultisigAccountModificationType(Converter::binaryToInt($reader->read(4), 4));
	}

	public function serialize(): string {
		return Converter::intToBinary($this->value, 4);
	}

	public function __toString(){
		return "MultisigAccountModificationType." . self::valueToKey($this->value);
	}
}

class MultisigAccountModification {
	public MultisigAccountModificationType $modificationType;

	public PublicKey $cosignatoryPublicKey;

	private int $cosignatoryPublicKeySize = 32; // reserved field

	public function __construct(?MultisigAccountModificationType $modificationType = null, ?PublicKey $cosignatoryPublicKey = null){
		$this->modificationType = $modificationType ?? new MultisigAccountModificationType();
		$this->cosignatoryPublicKey = $cosignatoryPublicKey ?? new PublicKey();
		$this->cosignatoryPublicKeySize = 32; // reserved field
	}

	comparer(){
		return [
			this.modificationType,
			ripemdKeccak256(this.cosignatoryPublicKey.bytes)
		];
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += $this->modificationType->size();
		$size += 4;
		$size += $this->cosignatoryPublicKey->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new MultisigAccountModification();

		$modificationType = MultisigAccountModificationType::deserialize($reader);
		$cosignatoryPublicKeySize = Converter::binaryToInt($reader->read(4), 4);
		if (32 !== $cosignatoryPublicKeySize)
			throw new OutOfRangeException('Invalid value of reserved field (' . $cosignatoryPublicKeySize . ')');
		$cosignatoryPublicKey = PublicKey::deserialize($reader);

		$instance->modificationType = $modificationType;
		$instance->cosignatoryPublicKey = $cosignatoryPublicKey;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$writer->write($this->modificationType->serialize());
		$writer->write(Converter::intToBinary($this->cosignatoryPublicKeySize, 4));
		$writer->write($this->cosignatoryPublicKey->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '';
		$result .= 'modificationType: ' . $this->modificationType . ', ';
		$result .= 'cosignatoryPublicKey: ' . $this->cosignatoryPublicKey . ', ';
		return $result;
	}
}

class SizePrefixedMultisigAccountModification {
	public MultisigAccountModification $modification;

	public function __construct(?MultisigAccountModification $modification = null){
		$this->modification = $modification ?? new MultisigAccountModification();
	}

	public function sort(){
		$this->modification->sort();
	}

	public function size(){
		$size = 0;
		$size += 4;
		$size += $this->modification->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new SizePrefixedMultisigAccountModification();

		$modificationSize = Converter::binaryToInt($reader->read(4), 4);
		// marking sizeof field
		$modification = MultisigAccountModification::deserialize(view.window(modificationSize));

		$instance->modification = $modification;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$writer->write(Converter::intToBinary($this->modification->size(), 4)); // bound: modification_size
		$writer->write($this->modification->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '';
		$result .= 'modification: ' . $this->modification . ', ';
		return $result;
	}
}

class MultisigAccountModificationTransactionV1 extends Transaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::MULTISIG_ACCOUNT_MODIFICATION;

	public array $modifications;

	public function __construct(
		?NetworkType $network = null,
		?Timestamp $timestamp = null,
		?PublicKey $signerPublicKey = null,
		?Signature $signature = null,
		?Amount $fee = null,
		?Timestamp $deadline = null,
		?array $modifications = null
	){
		parent::__construct(
			new TransactionType(MultisigAccountModificationTransactionV1::TRANSACTION_TYPE),
			MultisigAccountModificationTransactionV1::TRANSACTION_VERSION,
			$network,
			$timestamp,
			$signerPublicKey,
			$signature,
			$fee,
			$deadline,
		);
		$this->modifications = $modifications ?? [];
	}

	public function sort(){
		usort(
			$this->modifications,
			fn ($lhs, $rhs) =>
			ArrayHelpers::deepCompare(
				isset($lhs->modification->comparer) ? $lhs->modification->comparer() : $lhs->modification->value,
				isset($rhs->modification->comparer) ? $rhs->modification->comparer() : $rhs->modification->value
			)
		);
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += 4;
		$size += ArrayHelpers::size($this->modifications);
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new MultisigAccountModificationTransactionV1();

		Transaction::_deserialize($reader, $instance);
		$modificationsCount = Converter::binaryToInt($reader->read(4), 4);
		$modifications = ArrayHelpers::readArrayCount($reader, [SizePrefixedMultisigAccountModification::class, 'deserialize'], $modificationsCount, fn ($e) => isset($e->modification->comparer) ? $e->modification->comparer() : $e->modification->value);

		$instance->modifications = $modifications;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write(Converter::intToBinary(count($this->modifications), 4)); // bound: modifications_count
		ArrayHelpers::writeArray($writer, $this->modifications, fn ($e) => isset($e->modification->comparer) ? $e->modification->comparer() : $e->modification->value);
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'modifications: ' . '[' . implode(',', array_map(fn ($e) => $e, $this->modifications)) . ']' . ', ';
		$result .= ')';
		return $result;
	}
}

class NonVerifiableMultisigAccountModificationTransactionV1 extends NonVerifiableTransaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::MULTISIG_ACCOUNT_MODIFICATION;

	public array $modifications;

	public function __construct(
		?NetworkType $network = null,
		?Timestamp $timestamp = null,
		?PublicKey $signerPublicKey = null,
		?Amount $fee = null,
		?Timestamp $deadline = null,
		?array $modifications = null
	){
		parent::__construct(
			new TransactionType(NonVerifiableMultisigAccountModificationTransactionV1::TRANSACTION_TYPE),
			NonVerifiableMultisigAccountModificationTransactionV1::TRANSACTION_VERSION,
			$network,
			$timestamp,
			$signerPublicKey,
			$fee,
			$deadline,
		);
		$this->modifications = $modifications ?? [];
	}

	public function sort(){
		usort(
			$this->modifications,
			fn ($lhs, $rhs) =>
			ArrayHelpers::deepCompare(
				isset($lhs->modification->comparer) ? $lhs->modification->comparer() : $lhs->modification->value,
				isset($rhs->modification->comparer) ? $rhs->modification->comparer() : $rhs->modification->value
			)
		);
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += 4;
		$size += ArrayHelpers::size($this->modifications);
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new NonVerifiableMultisigAccountModificationTransactionV1();

		NonVerifiableTransaction::_deserialize($reader, $instance);
		$modificationsCount = Converter::binaryToInt($reader->read(4), 4);
		$modifications = ArrayHelpers::readArrayCount($reader, [SizePrefixedMultisigAccountModification::class, 'deserialize'], $modificationsCount, fn ($e) => isset($e->modification->comparer) ? $e->modification->comparer() : $e->modification->value);

		$instance->modifications = $modifications;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write(Converter::intToBinary(count($this->modifications), 4)); // bound: modifications_count
		ArrayHelpers::writeArray($writer, $this->modifications, fn ($e) => isset($e->modification->comparer) ? $e->modification->comparer() : $e->modification->value);
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'modifications: ' . '[' . implode(',', array_map(fn ($e) => $e, $this->modifications)) . ']' . ', ';
		$result .= ')';
		return $result;
	}
}

class MultisigAccountModificationTransactionV2 extends Transaction {
	const TRANSACTION_VERSION = 2;

	const TRANSACTION_TYPE = TransactionType::MULTISIG_ACCOUNT_MODIFICATION;

	public array $modifications;

	public int $minApprovalDelta;

	private int $minApprovalDeltaSize = 4; // reserved field

	public function __construct(
		?NetworkType $network = null,
		?Timestamp $timestamp = null,
		?PublicKey $signerPublicKey = null,
		?Signature $signature = null,
		?Amount $fee = null,
		?Timestamp $deadline = null,
		?array $modifications = null,
		?int $minApprovalDelta = null
	){
		parent::__construct(
			new TransactionType(MultisigAccountModificationTransactionV2::TRANSACTION_TYPE),
			MultisigAccountModificationTransactionV2::TRANSACTION_VERSION,
			$network,
			$timestamp,
			$signerPublicKey,
			$signature,
			$fee,
			$deadline,
		);
		$this->modifications = $modifications ?? [];
		$this->minApprovalDelta = $minApprovalDelta ?? 0;
		$this->minApprovalDeltaSize = 4; // reserved field
	}

	public function sort(){
		usort(
			$this->modifications,
			fn ($lhs, $rhs) =>
			ArrayHelpers::deepCompare(
				isset($lhs->modification->comparer) ? $lhs->modification->comparer() : $lhs->modification->value,
				isset($rhs->modification->comparer) ? $rhs->modification->comparer() : $rhs->modification->value
			)
		);
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += 4;
		$size += ArrayHelpers::size($this->modifications);
		$size += 4;
		$size += 4;
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new MultisigAccountModificationTransactionV2();

		Transaction::_deserialize($reader, $instance);
		$modificationsCount = Converter::binaryToInt($reader->read(4), 4);
		$modifications = ArrayHelpers::readArrayCount($reader, [SizePrefixedMultisigAccountModification::class, 'deserialize'], $modificationsCount, fn ($e) => isset($e->modification->comparer) ? $e->modification->comparer() : $e->modification->value);
		$minApprovalDeltaSize = Converter::binaryToInt($reader->read(4), 4);
		if (4 !== $minApprovalDeltaSize)
			throw new OutOfRangeException('Invalid value of reserved field (' . $minApprovalDeltaSize . ')');
		$minApprovalDelta = Converter::binaryToInt($reader->read(4), 4);

		$instance->modifications = $modifications;
		$instance->minApprovalDelta = $minApprovalDelta;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write(Converter::intToBinary(count($this->modifications), 4)); // bound: modifications_count
		ArrayHelpers::writeArray($writer, $this->modifications, fn ($e) => isset($e->modification->comparer) ? $e->modification->comparer() : $e->modification->value);
		$writer->write(Converter::intToBinary($this->minApprovalDeltaSize, 4));
		$writer->write(Converter::intToBinary($this->minApprovalDelta, 4));
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'modifications: ' . '[' . implode(',', array_map(fn ($e) => $e, $this->modifications)) . ']' . ', ';
		$result .= 'minApprovalDelta: ' . '0x' . Converter::intToHex($this->minApprovalDelta, 4) . ', ';
		$result .= ')';
		return $result;
	}
}

class NonVerifiableMultisigAccountModificationTransactionV2 extends NonVerifiableTransaction {
	const TRANSACTION_VERSION = 2;

	const TRANSACTION_TYPE = TransactionType::MULTISIG_ACCOUNT_MODIFICATION;

	public array $modifications;

	public int $minApprovalDelta;

	private int $minApprovalDeltaSize = 4; // reserved field

	public function __construct(
		?NetworkType $network = null,
		?Timestamp $timestamp = null,
		?PublicKey $signerPublicKey = null,
		?Amount $fee = null,
		?Timestamp $deadline = null,
		?array $modifications = null,
		?int $minApprovalDelta = null
	){
		parent::__construct(
			new TransactionType(NonVerifiableMultisigAccountModificationTransactionV2::TRANSACTION_TYPE),
			NonVerifiableMultisigAccountModificationTransactionV2::TRANSACTION_VERSION,
			$network,
			$timestamp,
			$signerPublicKey,
			$fee,
			$deadline,
		);
		$this->modifications = $modifications ?? [];
		$this->minApprovalDelta = $minApprovalDelta ?? 0;
		$this->minApprovalDeltaSize = 4; // reserved field
	}

	public function sort(){
		usort(
			$this->modifications,
			fn ($lhs, $rhs) =>
			ArrayHelpers::deepCompare(
				isset($lhs->modification->comparer) ? $lhs->modification->comparer() : $lhs->modification->value,
				isset($rhs->modification->comparer) ? $rhs->modification->comparer() : $rhs->modification->value
			)
		);
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += 4;
		$size += ArrayHelpers::size($this->modifications);
		$size += 4;
		$size += 4;
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new NonVerifiableMultisigAccountModificationTransactionV2();

		NonVerifiableTransaction::_deserialize($reader, $instance);
		$modificationsCount = Converter::binaryToInt($reader->read(4), 4);
		$modifications = ArrayHelpers::readArrayCount($reader, [SizePrefixedMultisigAccountModification::class, 'deserialize'], $modificationsCount, fn ($e) => isset($e->modification->comparer) ? $e->modification->comparer() : $e->modification->value);
		$minApprovalDeltaSize = Converter::binaryToInt($reader->read(4), 4);
		if (4 !== $minApprovalDeltaSize)
			throw new OutOfRangeException('Invalid value of reserved field (' . $minApprovalDeltaSize . ')');
		$minApprovalDelta = Converter::binaryToInt($reader->read(4), 4);

		$instance->modifications = $modifications;
		$instance->minApprovalDelta = $minApprovalDelta;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write(Converter::intToBinary(count($this->modifications), 4)); // bound: modifications_count
		ArrayHelpers::writeArray($writer, $this->modifications, fn ($e) => isset($e->modification->comparer) ? $e->modification->comparer() : $e->modification->value);
		$writer->write(Converter::intToBinary($this->minApprovalDeltaSize, 4));
		$writer->write(Converter::intToBinary($this->minApprovalDelta, 4));
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'modifications: ' . '[' . implode(',', array_map(fn ($e) => $e, $this->modifications)) . ']' . ', ';
		$result .= 'minApprovalDelta: ' . '0x' . Converter::intToHex($this->minApprovalDelta, 4) . ', ';
		$result .= ')';
		return $result;
	}
}

class CosignatureV1 extends Transaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::MULTISIG_COSIGNATURE;

	public Hash256 $multisigTransactionHash;

	public Address $multisigAccountAddress;

	private int $multisigTransactionHashOuterSize = 36; // reserved field

	private int $multisigTransactionHashSize = 32; // reserved field

	private int $multisigAccountAddressSize = 40; // reserved field

	public function __construct(
		?NetworkType $network = null,
		?Timestamp $timestamp = null,
		?PublicKey $signerPublicKey = null,
		?Signature $signature = null,
		?Amount $fee = null,
		?Timestamp $deadline = null,
		?Hash256 $multisigTransactionHash = null,
		?Address $multisigAccountAddress = null
	){
		parent::__construct(
			new TransactionType(CosignatureV1::TRANSACTION_TYPE),
			CosignatureV1::TRANSACTION_VERSION,
			$network,
			$timestamp,
			$signerPublicKey,
			$signature,
			$fee,
			$deadline,
		);
		$this->multisigTransactionHash = $multisigTransactionHash ?? new Hash256();
		$this->multisigAccountAddress = $multisigAccountAddress ?? new Address();
		$this->multisigTransactionHashOuterSize = 36; // reserved field
		$this->multisigTransactionHashSize = 32; // reserved field
		$this->multisigAccountAddressSize = 40; // reserved field
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += 4;
		$size += 4;
		$size += $this->multisigTransactionHash->size();
		$size += 4;
		$size += $this->multisigAccountAddress->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new CosignatureV1();

		Transaction::_deserialize($reader, $instance);
		$multisigTransactionHashOuterSize = Converter::binaryToInt($reader->read(4), 4);
		if (36 !== $multisigTransactionHashOuterSize)
			throw new OutOfRangeException('Invalid value of reserved field (' . $multisigTransactionHashOuterSize . ')');
		$multisigTransactionHashSize = Converter::binaryToInt($reader->read(4), 4);
		if (32 !== $multisigTransactionHashSize)
			throw new OutOfRangeException('Invalid value of reserved field (' . $multisigTransactionHashSize . ')');
		$multisigTransactionHash = Hash256::deserialize($reader);
		$multisigAccountAddressSize = Converter::binaryToInt($reader->read(4), 4);
		if (40 !== $multisigAccountAddressSize)
			throw new OutOfRangeException('Invalid value of reserved field (' . $multisigAccountAddressSize . ')');
		$multisigAccountAddress = Address::deserialize($reader);

		$instance->multisigTransactionHash = $multisigTransactionHash;
		$instance->multisigAccountAddress = $multisigAccountAddress;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write(Converter::intToBinary($this->multisigTransactionHashOuterSize, 4));
		$writer->write(Converter::intToBinary($this->multisigTransactionHashSize, 4));
		$writer->write($this->multisigTransactionHash->serialize());
		$writer->write(Converter::intToBinary($this->multisigAccountAddressSize, 4));
		$writer->write($this->multisigAccountAddress->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'multisigTransactionHash: ' . $this->multisigTransactionHash . ', ';
		$result .= 'multisigAccountAddress: ' . $this->multisigAccountAddress . ', ';
		$result .= ')';
		return $result;
	}
}

class SizePrefixedCosignatureV1 {
	public CosignatureV1 $cosignature;

	public function __construct(?CosignatureV1 $cosignature = null){
		$this->cosignature = $cosignature ?? new CosignatureV1();
	}

	public function sort(){
		$this->cosignature->sort();
	}

	public function size(){
		$size = 0;
		$size += 4;
		$size += $this->cosignature->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new SizePrefixedCosignatureV1();

		$cosignatureSize = Converter::binaryToInt($reader->read(4), 4);
		// marking sizeof field
		$cosignature = CosignatureV1::deserialize(view.window(cosignatureSize));

		$instance->cosignature = $cosignature;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$writer->write(Converter::intToBinary($this->cosignature->size(), 4)); // bound: cosignature_size
		$writer->write($this->cosignature->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '';
		$result .= 'cosignature: ' . $this->cosignature . ', ';
		return $result;
	}
}

class MultisigTransactionV1 extends Transaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::MULTISIG;

	public NonVerifiableTransaction $innerTransaction;

	public array $cosignatures;

	public function __construct(
		?NetworkType $network = null,
		?Timestamp $timestamp = null,
		?PublicKey $signerPublicKey = null,
		?Signature $signature = null,
		?Amount $fee = null,
		?Timestamp $deadline = null,
		?NonVerifiableTransaction $innerTransaction = null,
		?array $cosignatures = null
	){
		parent::__construct(
			new TransactionType(MultisigTransactionV1::TRANSACTION_TYPE),
			MultisigTransactionV1::TRANSACTION_VERSION,
			$network,
			$timestamp,
			$signerPublicKey,
			$signature,
			$fee,
			$deadline,
		);
		$this->innerTransaction = $innerTransaction ?? new NonVerifiableTransaction();
		$this->cosignatures = $cosignatures ?? [];
	}

	public function sort(){
		$this->innerTransaction->sort();
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += 4;
		$size += $this->innerTransaction->size();
		$size += 4;
		$size += ArrayHelpers::size($this->cosignatures);
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new MultisigTransactionV1();

		Transaction::_deserialize($reader, $instance);
		$innerTransactionSize = Converter::binaryToInt($reader->read(4), 4);
		// marking sizeof field
		$innerTransaction = NonVerifiableTransactionFactory::deserialize(view.window(innerTransactionSize));
		$cosignaturesCount = Converter::binaryToInt($reader->read(4), 4);
		$cosignatures = ArrayHelpers::readArrayCount($reader, [SizePrefixedCosignatureV1::class, 'deserialize'], $cosignaturesCount);

		$instance->innerTransaction = $innerTransaction;
		$instance->cosignatures = $cosignatures;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write(Converter::intToBinary($this->innerTransaction->size(), 4)); // bound: inner_transaction_size
		$writer->write($this->innerTransaction->serialize());
		$writer->write(Converter::intToBinary(count($this->cosignatures), 4)); // bound: cosignatures_count
		ArrayHelpers::writeArray($writer, $this->cosignatures);
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'innerTransaction: ' . $this->innerTransaction . ', ';
		$result .= 'cosignatures: ' . '[' . implode(',', array_map(fn ($e) => $e, $this->cosignatures)) . ']' . ', ';
		$result .= ')';
		return $result;
	}
}

class NonVerifiableMultisigTransactionV1 extends NonVerifiableTransaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::MULTISIG;

	public NonVerifiableTransaction $innerTransaction;

	public function __construct(
		?NetworkType $network = null,
		?Timestamp $timestamp = null,
		?PublicKey $signerPublicKey = null,
		?Amount $fee = null,
		?Timestamp $deadline = null,
		?NonVerifiableTransaction $innerTransaction = null
	){
		parent::__construct(
			new TransactionType(NonVerifiableMultisigTransactionV1::TRANSACTION_TYPE),
			NonVerifiableMultisigTransactionV1::TRANSACTION_VERSION,
			$network,
			$timestamp,
			$signerPublicKey,
			$fee,
			$deadline,
		);
		$this->innerTransaction = $innerTransaction ?? new NonVerifiableTransaction();
	}

	public function sort(){
		$this->innerTransaction->sort();
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += 4;
		$size += $this->innerTransaction->size();
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new NonVerifiableMultisigTransactionV1();

		NonVerifiableTransaction::_deserialize($reader, $instance);
		$innerTransactionSize = Converter::binaryToInt($reader->read(4), 4);
		// marking sizeof field
		$innerTransaction = NonVerifiableTransactionFactory::deserialize(view.window(innerTransactionSize));

		$instance->innerTransaction = $innerTransaction;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write(Converter::intToBinary($this->innerTransaction->size(), 4)); // bound: inner_transaction_size
		$writer->write($this->innerTransaction->serialize());
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'innerTransaction: ' . $this->innerTransaction . ', ';
		$result .= ')';
		return $result;
	}
}

class NamespaceRegistrationTransactionV1 extends Transaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::NAMESPACE_REGISTRATION;

	public Address $rentalFeeSink;

	public Amount $rentalFee;

	public string $name;

	public string $parentName;

	private int $rentalFeeSinkSize = 40; // reserved field

	public function __construct(
		?NetworkType $network = null,
		?Timestamp $timestamp = null,
		?PublicKey $signerPublicKey = null,
		?Signature $signature = null,
		?Amount $fee = null,
		?Timestamp $deadline = null,
		?Address $rentalFeeSink = null,
		?Amount $rentalFee = null,
		?string $name = null,
		?string $parentName = null
	){
		parent::__construct(
			new TransactionType(NamespaceRegistrationTransactionV1::TRANSACTION_TYPE),
			NamespaceRegistrationTransactionV1::TRANSACTION_VERSION,
			$network,
			$timestamp,
			$signerPublicKey,
			$signature,
			$fee,
			$deadline,
		);
		$this->rentalFeeSink = $rentalFeeSink ?? new Address();
		$this->rentalFee = $rentalFee ?? new Amount();
		$this->name = $name ?? '';
		$this->parentName = null;
		$this->rentalFeeSinkSize = 40; // reserved field
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += 4;
		$size += $this->rentalFeeSink->size();
		$size += $this->rentalFee->size();
		$size += 4;
		$size += strlen($this->name);
		$size += 4;
		if ($this->parentName)
			$size += strlen($this->parentName);

		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new NamespaceRegistrationTransactionV1();

		Transaction::_deserialize($reader, $instance);
		$rentalFeeSinkSize = Converter::binaryToInt($reader->read(4), 4);
		if (40 !== $rentalFeeSinkSize)
			throw new OutOfRangeException('Invalid value of reserved field (' . $rentalFeeSinkSize . ')');
		$rentalFeeSink = Address::deserialize($reader);
		$rentalFee = Amount::deserialize($reader);
		$nameSize = Converter::binaryToInt($reader->read(4), 4);
		$name = $reader->read($nameSize);
		$parentNameSize = Converter::binaryToInt($reader->read(4), 4);
		$parentName = null;
		if (4294967295 !== $parentNameSize->value)
			$parentName = $reader->read($parentNameSize);


		$instance->rentalFeeSink = $rentalFeeSink;
		$instance->rentalFee = $rentalFee;
		$instance->name = $name;
		$instance->parentName = $parentName;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write(Converter::intToBinary($this->rentalFeeSinkSize, 4));
		$writer->write($this->rentalFeeSink->serialize());
		$writer->write($this->rentalFee->serialize());
		$writer->write(Converter::intToBinary(strlen($this->name), 4)); // bound: name_size
		$writer->write($this->name);
		$writer->write(Converter::intToBinary(($this->parentName ? strlen($this->parentName) : 4294967295), 4)); // bound: parent_name_size
		if ($this->parentName)
			$writer->write($this->parentName);

		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'rentalFeeSink: ' . $this->rentalFeeSink . ', ';
		$result .= 'rentalFee: ' . $this->rentalFee . ', ';
		$result .= 'name: ' . 'hex(0x' . strtoupper(bin2hex($this->name)) . ')' . ', ';
		if ($this->parentName)
			$result .= 'parentName: ' . 'hex(0x' . strtoupper(bin2hex($this->parentName)) . ')' . ', ';

		$result .= ')';
		return $result;
	}
}

class NonVerifiableNamespaceRegistrationTransactionV1 extends NonVerifiableTransaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::NAMESPACE_REGISTRATION;

	public Address $rentalFeeSink;

	public Amount $rentalFee;

	public string $name;

	public string $parentName;

	private int $rentalFeeSinkSize = 40; // reserved field

	public function __construct(
		?NetworkType $network = null,
		?Timestamp $timestamp = null,
		?PublicKey $signerPublicKey = null,
		?Amount $fee = null,
		?Timestamp $deadline = null,
		?Address $rentalFeeSink = null,
		?Amount $rentalFee = null,
		?string $name = null,
		?string $parentName = null
	){
		parent::__construct(
			new TransactionType(NonVerifiableNamespaceRegistrationTransactionV1::TRANSACTION_TYPE),
			NonVerifiableNamespaceRegistrationTransactionV1::TRANSACTION_VERSION,
			$network,
			$timestamp,
			$signerPublicKey,
			$fee,
			$deadline,
		);
		$this->rentalFeeSink = $rentalFeeSink ?? new Address();
		$this->rentalFee = $rentalFee ?? new Amount();
		$this->name = $name ?? '';
		$this->parentName = null;
		$this->rentalFeeSinkSize = 40; // reserved field
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += 4;
		$size += $this->rentalFeeSink->size();
		$size += $this->rentalFee->size();
		$size += 4;
		$size += strlen($this->name);
		$size += 4;
		if ($this->parentName)
			$size += strlen($this->parentName);

		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new NonVerifiableNamespaceRegistrationTransactionV1();

		NonVerifiableTransaction::_deserialize($reader, $instance);
		$rentalFeeSinkSize = Converter::binaryToInt($reader->read(4), 4);
		if (40 !== $rentalFeeSinkSize)
			throw new OutOfRangeException('Invalid value of reserved field (' . $rentalFeeSinkSize . ')');
		$rentalFeeSink = Address::deserialize($reader);
		$rentalFee = Amount::deserialize($reader);
		$nameSize = Converter::binaryToInt($reader->read(4), 4);
		$name = $reader->read($nameSize);
		$parentNameSize = Converter::binaryToInt($reader->read(4), 4);
		$parentName = null;
		if (4294967295 !== $parentNameSize->value)
			$parentName = $reader->read($parentNameSize);


		$instance->rentalFeeSink = $rentalFeeSink;
		$instance->rentalFee = $rentalFee;
		$instance->name = $name;
		$instance->parentName = $parentName;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write(Converter::intToBinary($this->rentalFeeSinkSize, 4));
		$writer->write($this->rentalFeeSink->serialize());
		$writer->write($this->rentalFee->serialize());
		$writer->write(Converter::intToBinary(strlen($this->name), 4)); // bound: name_size
		$writer->write($this->name);
		$writer->write(Converter::intToBinary(($this->parentName ? strlen($this->parentName) : 4294967295), 4)); // bound: parent_name_size
		if ($this->parentName)
			$writer->write($this->parentName);

		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'rentalFeeSink: ' . $this->rentalFeeSink . ', ';
		$result .= 'rentalFee: ' . $this->rentalFee . ', ';
		$result .= 'name: ' . 'hex(0x' . strtoupper(bin2hex($this->name)) . ')' . ', ';
		if ($this->parentName)
			$result .= 'parentName: ' . 'hex(0x' . strtoupper(bin2hex($this->parentName)) . ')' . ', ';

		$result .= ')';
		return $result;
	}
}

class MessageType {
	const PLAIN = 1;

	const ENCRYPTED = 2;

	public $value;

	public function __construct(int $value = 0){
		$this->value = $value;
	}

	static function valueToKey($value){
		$values = [
			1, 2
		];
		$keys = [
			'PLAIN', 'ENCRYPTED'
		];

		$index = array_search($value, $values);
		if ($index === false)
			throw new Exception("Invalid enum value: {$value}");

		return $keys[$index];
	}

	public static function size(){
		return 4;
	}

	public static function deserialize(BinaryReader $reader): self {
		return new MessageType(Converter::binaryToInt($reader->read(4), 4));
	}

	public static function deserializeAligned(BinaryReader $reader): self {
		return new MessageType(Converter::binaryToInt($reader->read(4), 4));
	}

	public function serialize(): string {
		return Converter::intToBinary($this->value, 4);
	}

	public function __toString(){
		return "MessageType." . self::valueToKey($this->value);
	}
}

class Message {
	public MessageType $messageType;

	public string $message;

	public function __construct(?MessageType $messageType = null, ?string $message = null){
		$this->messageType = $messageType ?? new MessageType();
		$this->message = $message ?? '';
	}

	public function sort(){
	}

	public function size(){
		$size = 0;
		$size += $this->messageType->size();
		$size += 4;
		$size += strlen($this->message);
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new Message();

		$messageType = MessageType::deserialize($reader);
		$messageSize = Converter::binaryToInt($reader->read(4), 4);
		$message = $reader->read($messageSize);

		$instance->messageType = $messageType;
		$instance->message = $message;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$writer->write($this->messageType->serialize());
		$writer->write(Converter::intToBinary(strlen($this->message), 4)); // bound: message_size
		$writer->write($this->message);
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '';
		$result .= 'messageType: ' . $this->messageType . ', ';
		$result .= 'message: ' . 'hex(0x' . strtoupper(bin2hex($this->message)) . ')' . ', ';
		return $result;
	}
}

class TransferTransactionV1 extends Transaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::TRANSFER;

	public Address $recipientAddress;

	public Amount $amount;

	public Message $message;

	private int $recipientAddressSize = 40; // reserved field

	public function __construct(
		?NetworkType $network = null,
		?Timestamp $timestamp = null,
		?PublicKey $signerPublicKey = null,
		?Signature $signature = null,
		?Amount $fee = null,
		?Timestamp $deadline = null,
		?Address $recipientAddress = null,
		?Amount $amount = null,
		?Message $message = null
	){
		parent::__construct(
			new TransactionType(TransferTransactionV1::TRANSACTION_TYPE),
			TransferTransactionV1::TRANSACTION_VERSION,
			$network,
			$timestamp,
			$signerPublicKey,
			$signature,
			$fee,
			$deadline,
		);
		$this->recipientAddress = $recipientAddress ?? new Address();
		$this->amount = $amount ?? new Amount();
		$this->message = null;
		$this->recipientAddressSize = 40; // reserved field
	}

	public function sort(){
		if (0 !== $this->messageEnvelopeSizeComputed)
			$this->message->sort();
	}

	get messageEnvelopeSizeComputed(){
		return this.message ? this.message.size + 0 : 0;
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += 4;
		$size += $this->recipientAddress->size();
		$size += $this->amount->size();
		$size += 4;
		if (0 !== $this->messageEnvelopeSizeComputed)
			$size += $this->message->size();

		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new TransferTransactionV1();

		Transaction::_deserialize($reader, $instance);
		$recipientAddressSize = Converter::binaryToInt($reader->read(4), 4);
		if (40 !== $recipientAddressSize)
			throw new OutOfRangeException('Invalid value of reserved field (' . $recipientAddressSize . ')');
		$recipientAddress = Address::deserialize($reader);
		$amount = Amount::deserialize($reader);
		$messageEnvelopeSize = Converter::binaryToInt($reader->read(4), 4);
		$message = null;
		if (0 !== $messageEnvelopeSize->value)
			$message = Message::deserialize($reader);


		$instance->recipientAddress = $recipientAddress;
		$instance->amount = $amount;
		$instance->message = $message;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write(Converter::intToBinary($this->recipientAddressSize, 4));
		$writer->write($this->recipientAddress->serialize());
		$writer->write($this->amount->serialize());
		$writer->write(Converter::intToBinary($this->messageEnvelopeSizeComputed, 4));
		if (0 !== $this->messageEnvelopeSizeComputed)
			$writer->write($this->message->serialize());

		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'recipientAddress: ' . $this->recipientAddress . ', ';
		$result .= 'amount: ' . $this->amount . ', ';
		if (0 !== $this->messageEnvelopeSizeComputed)
			$result .= 'message: ' . $this->message . ', ';

		$result .= ')';
		return $result;
	}
}

class NonVerifiableTransferTransactionV1 extends NonVerifiableTransaction {
	const TRANSACTION_VERSION = 1;

	const TRANSACTION_TYPE = TransactionType::TRANSFER;

	public Address $recipientAddress;

	public Amount $amount;

	public Message $message;

	private int $recipientAddressSize = 40; // reserved field

	public function __construct(
		?NetworkType $network = null,
		?Timestamp $timestamp = null,
		?PublicKey $signerPublicKey = null,
		?Amount $fee = null,
		?Timestamp $deadline = null,
		?Address $recipientAddress = null,
		?Amount $amount = null,
		?Message $message = null
	){
		parent::__construct(
			new TransactionType(NonVerifiableTransferTransactionV1::TRANSACTION_TYPE),
			NonVerifiableTransferTransactionV1::TRANSACTION_VERSION,
			$network,
			$timestamp,
			$signerPublicKey,
			$fee,
			$deadline,
		);
		$this->recipientAddress = $recipientAddress ?? new Address();
		$this->amount = $amount ?? new Amount();
		$this->message = null;
		$this->recipientAddressSize = 40; // reserved field
	}

	public function sort(){
		if (0 !== $this->messageEnvelopeSizeComputed)
			$this->message->sort();
	}

	get messageEnvelopeSizeComputed(){
		return this.message ? this.message.size + 0 : 0;
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += 4;
		$size += $this->recipientAddress->size();
		$size += $this->amount->size();
		$size += 4;
		if (0 !== $this->messageEnvelopeSizeComputed)
			$size += $this->message->size();

		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new NonVerifiableTransferTransactionV1();

		NonVerifiableTransaction::_deserialize($reader, $instance);
		$recipientAddressSize = Converter::binaryToInt($reader->read(4), 4);
		if (40 !== $recipientAddressSize)
			throw new OutOfRangeException('Invalid value of reserved field (' . $recipientAddressSize . ')');
		$recipientAddress = Address::deserialize($reader);
		$amount = Amount::deserialize($reader);
		$messageEnvelopeSize = Converter::binaryToInt($reader->read(4), 4);
		$message = null;
		if (0 !== $messageEnvelopeSize->value)
			$message = Message::deserialize($reader);


		$instance->recipientAddress = $recipientAddress;
		$instance->amount = $amount;
		$instance->message = $message;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write(Converter::intToBinary($this->recipientAddressSize, 4));
		$writer->write($this->recipientAddress->serialize());
		$writer->write($this->amount->serialize());
		$writer->write(Converter::intToBinary($this->messageEnvelopeSizeComputed, 4));
		if (0 !== $this->messageEnvelopeSizeComputed)
			$writer->write($this->message->serialize());

		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'recipientAddress: ' . $this->recipientAddress . ', ';
		$result .= 'amount: ' . $this->amount . ', ';
		if (0 !== $this->messageEnvelopeSizeComputed)
			$result .= 'message: ' . $this->message . ', ';

		$result .= ')';
		return $result;
	}
}

class TransferTransactionV2 extends Transaction {
	const TRANSACTION_VERSION = 2;

	const TRANSACTION_TYPE = TransactionType::TRANSFER;

	public Address $recipientAddress;

	public Amount $amount;

	public Message $message;

	public array $mosaics;

	private int $recipientAddressSize = 40; // reserved field

	public function __construct(
		?NetworkType $network = null,
		?Timestamp $timestamp = null,
		?PublicKey $signerPublicKey = null,
		?Signature $signature = null,
		?Amount $fee = null,
		?Timestamp $deadline = null,
		?Address $recipientAddress = null,
		?Amount $amount = null,
		?Message $message = null,
		?array $mosaics = null
	){
		parent::__construct(
			new TransactionType(TransferTransactionV2::TRANSACTION_TYPE),
			TransferTransactionV2::TRANSACTION_VERSION,
			$network,
			$timestamp,
			$signerPublicKey,
			$signature,
			$fee,
			$deadline,
		);
		$this->recipientAddress = $recipientAddress ?? new Address();
		$this->amount = $amount ?? new Amount();
		$this->message = null;
		$this->mosaics = $mosaics ?? [];
		$this->recipientAddressSize = 40; // reserved field
	}

	public function sort(){
		if (0 !== $this->messageEnvelopeSizeComputed)
			$this->message->sort();
	}

	get messageEnvelopeSizeComputed(){
		return this.message ? this.message.size + 0 : 0;
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += 4;
		$size += $this->recipientAddress->size();
		$size += $this->amount->size();
		$size += 4;
		if (0 !== $this->messageEnvelopeSizeComputed)
			$size += $this->message->size();

		$size += 4;
		$size += ArrayHelpers::size($this->mosaics);
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new TransferTransactionV2();

		Transaction::_deserialize($reader, $instance);
		$recipientAddressSize = Converter::binaryToInt($reader->read(4), 4);
		if (40 !== $recipientAddressSize)
			throw new OutOfRangeException('Invalid value of reserved field (' . $recipientAddressSize . ')');
		$recipientAddress = Address::deserialize($reader);
		$amount = Amount::deserialize($reader);
		$messageEnvelopeSize = Converter::binaryToInt($reader->read(4), 4);
		$message = null;
		if (0 !== $messageEnvelopeSize->value)
			$message = Message::deserialize($reader);

		$mosaicsCount = Converter::binaryToInt($reader->read(4), 4);
		$mosaics = ArrayHelpers::readArrayCount($reader, [SizePrefixedMosaic::class, 'deserialize'], $mosaicsCount);

		$instance->recipientAddress = $recipientAddress;
		$instance->amount = $amount;
		$instance->message = $message;
		$instance->mosaics = $mosaics;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write(Converter::intToBinary($this->recipientAddressSize, 4));
		$writer->write($this->recipientAddress->serialize());
		$writer->write($this->amount->serialize());
		$writer->write(Converter::intToBinary($this->messageEnvelopeSizeComputed, 4));
		if (0 !== $this->messageEnvelopeSizeComputed)
			$writer->write($this->message->serialize());

		$writer->write(Converter::intToBinary(count($this->mosaics), 4)); // bound: mosaics_count
		ArrayHelpers::writeArray($writer, $this->mosaics);
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'recipientAddress: ' . $this->recipientAddress . ', ';
		$result .= 'amount: ' . $this->amount . ', ';
		if (0 !== $this->messageEnvelopeSizeComputed)
			$result .= 'message: ' . $this->message . ', ';

		$result .= 'mosaics: ' . '[' . implode(',', array_map(fn ($e) => $e, $this->mosaics)) . ']' . ', ';
		$result .= ')';
		return $result;
	}
}

class NonVerifiableTransferTransactionV2 extends NonVerifiableTransaction {
	const TRANSACTION_VERSION = 2;

	const TRANSACTION_TYPE = TransactionType::TRANSFER;

	public Address $recipientAddress;

	public Amount $amount;

	public Message $message;

	public array $mosaics;

	private int $recipientAddressSize = 40; // reserved field

	public function __construct(
		?NetworkType $network = null,
		?Timestamp $timestamp = null,
		?PublicKey $signerPublicKey = null,
		?Amount $fee = null,
		?Timestamp $deadline = null,
		?Address $recipientAddress = null,
		?Amount $amount = null,
		?Message $message = null,
		?array $mosaics = null
	){
		parent::__construct(
			new TransactionType(NonVerifiableTransferTransactionV2::TRANSACTION_TYPE),
			NonVerifiableTransferTransactionV2::TRANSACTION_VERSION,
			$network,
			$timestamp,
			$signerPublicKey,
			$fee,
			$deadline,
		);
		$this->recipientAddress = $recipientAddress ?? new Address();
		$this->amount = $amount ?? new Amount();
		$this->message = null;
		$this->mosaics = $mosaics ?? [];
		$this->recipientAddressSize = 40; // reserved field
	}

	public function sort(){
		if (0 !== $this->messageEnvelopeSizeComputed)
			$this->message->sort();
	}

	get messageEnvelopeSizeComputed(){
		return this.message ? this.message.size + 0 : 0;
	}

	public function size(){
		$size = 0;
		$size += parent::size();
		$size += 4;
		$size += $this->recipientAddress->size();
		$size += $this->amount->size();
		$size += 4;
		if (0 !== $this->messageEnvelopeSizeComputed)
			$size += $this->message->size();

		$size += 4;
		$size += ArrayHelpers::size($this->mosaics);
		return $size;
	}

	public static function deserialize(BinaryReader $reader){
		$instance = new NonVerifiableTransferTransactionV2();

		NonVerifiableTransaction::_deserialize($reader, $instance);
		$recipientAddressSize = Converter::binaryToInt($reader->read(4), 4);
		if (40 !== $recipientAddressSize)
			throw new OutOfRangeException('Invalid value of reserved field (' . $recipientAddressSize . ')');
		$recipientAddress = Address::deserialize($reader);
		$amount = Amount::deserialize($reader);
		$messageEnvelopeSize = Converter::binaryToInt($reader->read(4), 4);
		$message = null;
		if (0 !== $messageEnvelopeSize->value)
			$message = Message::deserialize($reader);

		$mosaicsCount = Converter::binaryToInt($reader->read(4), 4);
		$mosaics = ArrayHelpers::readArrayCount($reader, [SizePrefixedMosaic::class, 'deserialize'], $mosaicsCount);

		$instance->recipientAddress = $recipientAddress;
		$instance->amount = $amount;
		$instance->message = $message;
		$instance->mosaics = $mosaics;
		return $instance;
	}

	public function serialize(): string {
		$writer = new BinaryWriter($this->size());
		$this->sort();
		parent::_serialize($writer);
		$writer->write(Converter::intToBinary($this->recipientAddressSize, 4));
		$writer->write($this->recipientAddress->serialize());
		$writer->write($this->amount->serialize());
		$writer->write(Converter::intToBinary($this->messageEnvelopeSizeComputed, 4));
		if (0 !== $this->messageEnvelopeSizeComputed)
			$writer->write($this->message->serialize());

		$writer->write(Converter::intToBinary(count($this->mosaics), 4)); // bound: mosaics_count
		ArrayHelpers::writeArray($writer, $this->mosaics);
		return $writer->getBinaryData();
	}

	public function __toString(){
		$result = '(';
		$result .= parent::__toString();
		$result .= 'recipientAddress: ' . $this->recipientAddress . ', ';
		$result .= 'amount: ' . $this->amount . ', ';
		if (0 !== $this->messageEnvelopeSizeComputed)
			$result .= 'message: ' . $this->message . ', ';

		$result .= 'mosaics: ' . '[' . implode(',', array_map(fn ($e) => $e, $this->mosaics)) . ']' . ', ';
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
		self::toKey([MosaicDefinitionTransactionV1::TRANSACTION_TYPE, MosaicDefinitionTransactionV1::TRANSACTION_VERSION]) => MosaicDefinitionTransactionV1::class,
		self::toKey([MosaicSupplyChangeTransactionV1::TRANSACTION_TYPE, MosaicSupplyChangeTransactionV1::TRANSACTION_VERSION]) => MosaicSupplyChangeTransactionV1::class,
		self::toKey([MultisigAccountModificationTransactionV1::TRANSACTION_TYPE, MultisigAccountModificationTransactionV1::TRANSACTION_VERSION]) => MultisigAccountModificationTransactionV1::class,
		self::toKey([MultisigAccountModificationTransactionV2::TRANSACTION_TYPE, MultisigAccountModificationTransactionV2::TRANSACTION_VERSION]) => MultisigAccountModificationTransactionV2::class,
		self::toKey([CosignatureV1::TRANSACTION_TYPE, CosignatureV1::TRANSACTION_VERSION]) => CosignatureV1::class,
		self::toKey([MultisigTransactionV1::TRANSACTION_TYPE, MultisigTransactionV1::TRANSACTION_VERSION]) => MultisigTransactionV1::class,
		self::toKey([NamespaceRegistrationTransactionV1::TRANSACTION_TYPE, NamespaceRegistrationTransactionV1::TRANSACTION_VERSION]) => NamespaceRegistrationTransactionV1::class,
		self::toKey([TransferTransactionV1::TRANSACTION_TYPE, TransferTransactionV1::TRANSACTION_VERSION]) => TransferTransactionV1::class,
		self::toKey([TransferTransactionV2::TRANSACTION_TYPE, TransferTransactionV2::TRANSACTION_VERSION]) => TransferTransactionV2::class,];
		$discriminator = self::toKey([$parent->type->value, $parent->version]);
		if (!array_key_exists($discriminator, $mapping)) {
			throw new Exception("Unknown Transaction type");
		}
		$factoryClass = $mapping[$discriminator];
		return call_user_func([$factoryClass, 'deserialize'], $reader);
	}
}

class NonVerifiableTransactionFactory {
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
		$parent = new NonVerifiableTransaction();
		NonVerifiableTransaction::_deserialize($reader, $parent);
		$reader->setPosition(0);
		$mapping = [
		self::toKey([NonVerifiableAccountKeyLinkTransactionV1::TRANSACTION_TYPE, NonVerifiableAccountKeyLinkTransactionV1::TRANSACTION_VERSION]) => NonVerifiableAccountKeyLinkTransactionV1::class,
		self::toKey([NonVerifiableMosaicDefinitionTransactionV1::TRANSACTION_TYPE, NonVerifiableMosaicDefinitionTransactionV1::TRANSACTION_VERSION]) => NonVerifiableMosaicDefinitionTransactionV1::class,
		self::toKey([NonVerifiableMosaicSupplyChangeTransactionV1::TRANSACTION_TYPE, NonVerifiableMosaicSupplyChangeTransactionV1::TRANSACTION_VERSION]) => NonVerifiableMosaicSupplyChangeTransactionV1::class,
		self::toKey([NonVerifiableMultisigAccountModificationTransactionV1::TRANSACTION_TYPE, NonVerifiableMultisigAccountModificationTransactionV1::TRANSACTION_VERSION]) => NonVerifiableMultisigAccountModificationTransactionV1::class,
		self::toKey([NonVerifiableMultisigAccountModificationTransactionV2::TRANSACTION_TYPE, NonVerifiableMultisigAccountModificationTransactionV2::TRANSACTION_VERSION]) => NonVerifiableMultisigAccountModificationTransactionV2::class,
		self::toKey([NonVerifiableMultisigTransactionV1::TRANSACTION_TYPE, NonVerifiableMultisigTransactionV1::TRANSACTION_VERSION]) => NonVerifiableMultisigTransactionV1::class,
		self::toKey([NonVerifiableNamespaceRegistrationTransactionV1::TRANSACTION_TYPE, NonVerifiableNamespaceRegistrationTransactionV1::TRANSACTION_VERSION]) => NonVerifiableNamespaceRegistrationTransactionV1::class,
		self::toKey([NonVerifiableTransferTransactionV1::TRANSACTION_TYPE, NonVerifiableTransferTransactionV1::TRANSACTION_VERSION]) => NonVerifiableTransferTransactionV1::class,
		self::toKey([NonVerifiableTransferTransactionV2::TRANSACTION_TYPE, NonVerifiableTransferTransactionV2::TRANSACTION_VERSION]) => NonVerifiableTransferTransactionV2::class,];
		$discriminator = self::toKey([$parent->type->value, $parent->version]);
		if (!array_key_exists($discriminator, $mapping)) {
			throw new Exception("Unknown NonVerifiableTransaction type");
		}
		$factoryClass = $mapping[$discriminator];
		return call_user_func([$factoryClass, 'deserialize'], $reader);
	}
}
