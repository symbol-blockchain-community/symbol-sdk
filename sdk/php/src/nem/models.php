<?php
$base_path = dirname(dirname(__FILE__));
require_once $base_path . '/BaseValue.php';
require_once $base_path . '/utils/converter.php';

/*
import BaseValue from '../BaseValue.js';
import ByteArray from '../ByteArray.js';
import BufferView from '../utils/BufferView.js';
import Writer from '../utils/Writer.js';
import * as arrayHelpers from '../utils/arrayHelpers.js';
import * as converter from '../utils/converter.js';
import { ripemdKeccak256 } from '../utils/transforms.js';

class Amount extends BaseValue {
	const SIZE = 8;

	public function __construct($amount = 0) {
		parent::__construct(self::SIZE, $amount);
	}

	public static function deserialize($payload) {
		$hexBinary = $payload;
		return new self(Converter::hexToInt($hexBinary, 8));
	}

	public static function deserializeAligned($payload) {
		$hexBinary = $payload;
		return new Amount(Converter::hexToInt($hexBinary, 8));
	}

	public function serialize() {
		return Converter::intToHex($this->value, 8);
	}
}

class Height extends BaseValue {
	const SIZE = 8;

	public function __construct($height = 0) {
		parent::__construct(self::SIZE, $height);
	}

	public static function deserialize($payload) {
		$hexBinary = $payload;
		return new self(Converter::hexToInt($hexBinary, 8));
	}

	public static function deserializeAligned($payload) {
		$hexBinary = $payload;
		return new Height(Converter::hexToInt($hexBinary, 8));
	}

	public function serialize() {
		return Converter::intToHex($this->value, 8);
	}
}

class Timestamp extends BaseValue {
	const SIZE = 4;

	public function __construct($timestamp = 0) {
		parent::__construct(self::SIZE, $timestamp);
	}

	public static function deserialize($payload) {
		$hexBinary = $payload;
		return new self(Converter::hexToInt($hexBinary, 4));
	}

	public static function deserializeAligned($payload) {
		$hexBinary = $payload;
		return new Timestamp(Converter::hexToInt($hexBinary, 4));
	}

	public function serialize() {
		return Converter::intToHex($this->value, 4);
	}
}

class Address extends ByteArray {
	const SIZE = 40;

	public function __construct($address = new Uint8Array(40)) {
		parent::__construct(self::SIZE, $address);
	}

	get size() {
		return 40;
	}

	public static function deserialize($payload) {
		$hexBinary = $payload;
		return new self(new Uint8Array(byteArray.buffer, byteArray.byteOffset, 40));
	}

	public function serialize() {
		return this.bytes;
	}
}

class Hash256 extends ByteArray {
	const SIZE = 32;

	public function __construct($hash256 = new Uint8Array(32)) {
		parent::__construct(self::SIZE, $hash256);
	}

	get size() {
		return 32;
	}

	public static function deserialize($payload) {
		$hexBinary = $payload;
		return new self(new Uint8Array(byteArray.buffer, byteArray.byteOffset, 32));
	}

	public function serialize() {
		return this.bytes;
	}
}

class PublicKey extends ByteArray {
	const SIZE = 32;

	public function __construct($publicKey = new Uint8Array(32)) {
		parent::__construct(self::SIZE, $publicKey);
	}

	get size() {
		return 32;
	}

	public static function deserialize($payload) {
		$hexBinary = $payload;
		return new self(new Uint8Array(byteArray.buffer, byteArray.byteOffset, 32));
	}

	public function serialize() {
		return this.bytes;
	}
}

class Signature extends ByteArray {
	const SIZE = 64;

	public function __construct($signature = new Uint8Array(64)) {
		parent::__construct(self::SIZE, $signature);
	}

	get size() {
		return 64;
	}

	public static function deserialize($payload) {
		$hexBinary = $payload;
		return new self(new Uint8Array(byteArray.buffer, byteArray.byteOffset, 64));
	}

	public function serialize() {
		return this.bytes;
	}
}

class NetworkType {
	static MAINNET = new NetworkType(104);

	static TESTNET = new NetworkType(152);

	public function __construct(value) {
		this.value = value;
	}

	static valueToKey(value) {
		const values = [
			104, 152
		];
		const keys = [
			'MAINNET', 'TESTNET'
		];

		const index = values.indexOf(value);
		if (-1 === index)
			throw RangeError(`invalid enum value ${value}`);

		return keys[index];
	}

	static fromValue(value) {
		return NetworkType[this.valueToKey(value)];
	}

	get size() {
		return 1;
	}

	public static function deserialize($payload) {
		const byteArray = payload;
		return this.fromValue(Converter::hexToInt(byteArray, 1));
	}

	public static function deserializeAligned($payload) {
		const byteArray = payload;
		return this.fromValue(Converter::hexToInt(byteArray, 1));
	}

	public function serialize() {
		return Converter::intToHex(this.value, 1);
	}

	toString() {
		return `NetworkType.${NetworkType.valueToKey(this.value)}`;
	}
}

class TransactionType {
	static TRANSFER = new TransactionType(257);

	static ACCOUNT_KEY_LINK = new TransactionType(2049);

	static MULTISIG_ACCOUNT_MODIFICATION = new TransactionType(4097);

	static MULTISIG_COSIGNATURE = new TransactionType(4098);

	static MULTISIG = new TransactionType(4100);

	static NAMESPACE_REGISTRATION = new TransactionType(8193);

	static MOSAIC_DEFINITION = new TransactionType(16385);

	static MOSAIC_SUPPLY_CHANGE = new TransactionType(16386);

	public function __construct(value) {
		this.value = value;
	}

	static valueToKey(value) {
		const values = [
			257, 2049, 4097, 4098, 4100, 8193, 16385, 16386
		];
		const keys = [
			'TRANSFER', 'ACCOUNT_KEY_LINK', 'MULTISIG_ACCOUNT_MODIFICATION', 'MULTISIG_COSIGNATURE', 'MULTISIG', 'NAMESPACE_REGISTRATION',
			'MOSAIC_DEFINITION', 'MOSAIC_SUPPLY_CHANGE'
		];

		const index = values.indexOf(value);
		if (-1 === index)
			throw RangeError(`invalid enum value ${value}`);

		return keys[index];
	}

	static fromValue(value) {
		return TransactionType[this.valueToKey(value)];
	}

	get size() {
		return 4;
	}

	public static function deserialize($payload) {
		const byteArray = payload;
		return this.fromValue(Converter::hexToInt(byteArray, 4));
	}

	public static function deserializeAligned($payload) {
		const byteArray = payload;
		return this.fromValue(Converter::hexToInt(byteArray, 4));
	}

	public function serialize() {
		return Converter::intToHex(this.value, 4);
	}

	toString() {
		return `TransactionType.${TransactionType.valueToKey(this.value)}`;
	}
}

class Transaction {
	static TYPE_HINTS = {
		$type: 'enum:TransactionType',
		$network: 'enum:NetworkType',
		$timestamp: 'pod:Timestamp',
		$signerPublicKey: 'pod:PublicKey',
		$signature: 'pod:Signature',
		$fee: 'pod:Amount',
		$deadline: 'pod:Timestamp'
	};

	public function __construct() {
		this._$type = TransactionType.TRANSFER;
		this._$version = 0;
		this._$network = NetworkType.MAINNET;
		this._$timestamp = new Timestamp();
		this._$signerPublicKey = new PublicKey();
		this._$signature = new Signature();
		this._$fee = new Amount();
		this._$deadline = new Timestamp();
		this._$entityBodyReserved_1 = 0; // reserved field
		this._$signerPublicKeySize = 32; // reserved field
		this._$signatureSize = 64; // reserved field
	}

	sort() {
	}

	get $type() {
		return this._$type;
	}

	set $type(value) {
		this._$type = value;
	}

	get $version() {
		return this._$version;
	}

	set $version(value) {
		this._$version = value;
	}

	get $network() {
		return this._$network;
	}

	set $network(value) {
		this._$network = value;
	}

	get $timestamp() {
		return this._$timestamp;
	}

	set $timestamp(value) {
		this._$timestamp = value;
	}

	get $signerPublicKey() {
		return this._$signerPublicKey;
	}

	set $signerPublicKey(value) {
		this._$signerPublicKey = value;
	}

	get $signature() {
		return this._$signature;
	}

	set $signature(value) {
		this._$signature = value;
	}

	get $fee() {
		return this._$fee;
	}

	set $fee(value) {
		this._$fee = value;
	}

	get $deadline() {
		return this._$deadline;
	}

	set $deadline(value) {
		this._$deadline = value;
	}

	get size() {
		let size = 0;
		size += this.$type.size;
		size += 1;
		size += 2;
		size += this.$network.size;
		size += this.$timestamp.size;
		size += 4;
		size += this.$signerPublicKey.size;
		size += 4;
		size += this.$signature.size;
		size += this.$fee.size;
		size += this.$deadline.size;
		return size;
	}

	public static function deserialize($payload) {
		const view = new BufferView(payload);
		const $type = TransactionType.deserialize(view.buffer);
		view.shiftRight($type.size);
		const $version = Converter::hexToInt(view.buffer, 1);
		view.shiftRight(1);
		const $entityBodyReserved_1 = Converter::hexToInt(view.buffer, 2);
		view.shiftRight(2);
		if (0 !== $entityBodyReserved_1)
			throw RangeError(`Invalid value of reserved field (${$entityBodyReserved_1})`);
		const $network = NetworkType.deserialize(view.buffer);
		view.shiftRight($network.size);
		const $timestamp = Timestamp.deserialize(view.buffer);
		view.shiftRight($timestamp.size);
		const $signerPublicKeySize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		if (32 !== $signerPublicKeySize)
			throw RangeError(`Invalid value of reserved field (${$signerPublicKeySize})`);
		const $signerPublicKey = PublicKey.deserialize(view.buffer);
		view.shiftRight($signerPublicKey.size);
		const $signatureSize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		if (64 !== $signatureSize)
			throw RangeError(`Invalid value of reserved field (${$signatureSize})`);
		const $signature = Signature.deserialize(view.buffer);
		view.shiftRight($signature.size);
		const $fee = Amount.deserialize(view.buffer);
		view.shiftRight($fee.size);
		const $deadline = Timestamp.deserialize(view.buffer);
		view.shiftRight($deadline.size);

		const instance = new Transaction();
		instance._$type = $type;
		instance._$version = $version;
		instance._$network = $network;
		instance._$timestamp = $timestamp;
		instance._$signerPublicKey = $signerPublicKey;
		instance._$signature = $signature;
		instance._$fee = $fee;
		instance._$deadline = $deadline;
		return instance;
	}

	public function serialize() {
		const buffer = new Writer(this.size);
		buffer.write(this._$type.serialize());
		buffer.write(Converter::intToHex(this._$version, 1));
		buffer.write(Converter::intToHex(this._$entityBodyReserved_1, 2));
		buffer.write(this._$network.serialize());
		buffer.write(this._$timestamp.serialize());
		buffer.write(Converter::intToHex(this._$signerPublicKeySize, 4));
		buffer.write(this._$signerPublicKey.serialize());
		buffer.write(Converter::intToHex(this._$signatureSize, 4));
		buffer.write(this._$signature.serialize());
		buffer.write(this._$fee.serialize());
		buffer.write(this._$deadline.serialize());
		return buffer.storage;
	}

	toString() {
		let result = '(';
		result += `$type: ${this._$type.toString()}, `;
		result += `$version: ${'0x'.concat(this._$version.toString(16))}, `;
		result += `$network: ${this._$network.toString()}, `;
		result += `$timestamp: ${this._$timestamp.toString()}, `;
		result += `$signerPublicKey: ${this._$signerPublicKey.toString()}, `;
		result += `$signature: ${this._$signature.toString()}, `;
		result += `$fee: ${this._$fee.toString()}, `;
		result += `$deadline: ${this._$deadline.toString()}, `;
		result += ')';
		return result;
	}
}

class NonVerifiableTransaction {
	static TYPE_HINTS = {
		$type: 'enum:TransactionType',
		$network: 'enum:NetworkType',
		$timestamp: 'pod:Timestamp',
		$signerPublicKey: 'pod:PublicKey',
		$fee: 'pod:Amount',
		$deadline: 'pod:Timestamp'
	};

	public function __construct() {
		this._$type = TransactionType.TRANSFER;
		this._$version = 0;
		this._$network = NetworkType.MAINNET;
		this._$timestamp = new Timestamp();
		this._$signerPublicKey = new PublicKey();
		this._$fee = new Amount();
		this._$deadline = new Timestamp();
		this._$entityBodyReserved_1 = 0; // reserved field
		this._$signerPublicKeySize = 32; // reserved field
	}

	sort() {
	}

	get $type() {
		return this._$type;
	}

	set $type(value) {
		this._$type = value;
	}

	get $version() {
		return this._$version;
	}

	set $version(value) {
		this._$version = value;
	}

	get $network() {
		return this._$network;
	}

	set $network(value) {
		this._$network = value;
	}

	get $timestamp() {
		return this._$timestamp;
	}

	set $timestamp(value) {
		this._$timestamp = value;
	}

	get $signerPublicKey() {
		return this._$signerPublicKey;
	}

	set $signerPublicKey(value) {
		this._$signerPublicKey = value;
	}

	get $fee() {
		return this._$fee;
	}

	set $fee(value) {
		this._$fee = value;
	}

	get $deadline() {
		return this._$deadline;
	}

	set $deadline(value) {
		this._$deadline = value;
	}

	get size() {
		let size = 0;
		size += this.$type.size;
		size += 1;
		size += 2;
		size += this.$network.size;
		size += this.$timestamp.size;
		size += 4;
		size += this.$signerPublicKey.size;
		size += this.$fee.size;
		size += this.$deadline.size;
		return size;
	}

	public static function deserialize($payload) {
		const view = new BufferView(payload);
		const $type = TransactionType.deserialize(view.buffer);
		view.shiftRight($type.size);
		const $version = Converter::hexToInt(view.buffer, 1);
		view.shiftRight(1);
		const $entityBodyReserved_1 = Converter::hexToInt(view.buffer, 2);
		view.shiftRight(2);
		if (0 !== $entityBodyReserved_1)
			throw RangeError(`Invalid value of reserved field (${$entityBodyReserved_1})`);
		const $network = NetworkType.deserialize(view.buffer);
		view.shiftRight($network.size);
		const $timestamp = Timestamp.deserialize(view.buffer);
		view.shiftRight($timestamp.size);
		const $signerPublicKeySize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		if (32 !== $signerPublicKeySize)
			throw RangeError(`Invalid value of reserved field (${$signerPublicKeySize})`);
		const $signerPublicKey = PublicKey.deserialize(view.buffer);
		view.shiftRight($signerPublicKey.size);
		const $fee = Amount.deserialize(view.buffer);
		view.shiftRight($fee.size);
		const $deadline = Timestamp.deserialize(view.buffer);
		view.shiftRight($deadline.size);

		const instance = new NonVerifiableTransaction();
		instance._$type = $type;
		instance._$version = $version;
		instance._$network = $network;
		instance._$timestamp = $timestamp;
		instance._$signerPublicKey = $signerPublicKey;
		instance._$fee = $fee;
		instance._$deadline = $deadline;
		return instance;
	}

	public function serialize() {
		const buffer = new Writer(this.size);
		buffer.write(this._$type.serialize());
		buffer.write(Converter::intToHex(this._$version, 1));
		buffer.write(Converter::intToHex(this._$entityBodyReserved_1, 2));
		buffer.write(this._$network.serialize());
		buffer.write(this._$timestamp.serialize());
		buffer.write(Converter::intToHex(this._$signerPublicKeySize, 4));
		buffer.write(this._$signerPublicKey.serialize());
		buffer.write(this._$fee.serialize());
		buffer.write(this._$deadline.serialize());
		return buffer.storage;
	}

	toString() {
		let result = '(';
		result += `$type: ${this._$type.toString()}, `;
		result += `$version: ${'0x'.concat(this._$version.toString(16))}, `;
		result += `$network: ${this._$network.toString()}, `;
		result += `$timestamp: ${this._$timestamp.toString()}, `;
		result += `$signerPublicKey: ${this._$signerPublicKey.toString()}, `;
		result += `$fee: ${this._$fee.toString()}, `;
		result += `$deadline: ${this._$deadline.toString()}, `;
		result += ')';
		return result;
	}
}

class LinkAction {
	static LINK = new LinkAction(1);

	static UNLINK = new LinkAction(2);

	public function __construct(value) {
		this.value = value;
	}

	static valueToKey(value) {
		const values = [
			1, 2
		];
		const keys = [
			'LINK', 'UNLINK'
		];

		const index = values.indexOf(value);
		if (-1 === index)
			throw RangeError(`invalid enum value ${value}`);

		return keys[index];
	}

	static fromValue(value) {
		return LinkAction[this.valueToKey(value)];
	}

	get size() {
		return 4;
	}

	public static function deserialize($payload) {
		const byteArray = payload;
		return this.fromValue(Converter::hexToInt(byteArray, 4));
	}

	public static function deserializeAligned($payload) {
		const byteArray = payload;
		return this.fromValue(Converter::hexToInt(byteArray, 4));
	}

	public function serialize() {
		return Converter::intToHex(this.value, 4);
	}

	toString() {
		return `LinkAction.${LinkAction.valueToKey(this.value)}`;
	}
}

class AccountKeyLinkTransactionV1 {
	static TRANSACTION_VERSION = 1;

	static TRANSACTION_TYPE = TransactionType.ACCOUNT_KEY_LINK;

	static TYPE_HINTS = {
		$type: 'enum:TransactionType',
		$network: 'enum:NetworkType',
		$timestamp: 'pod:Timestamp',
		$signerPublicKey: 'pod:PublicKey',
		$signature: 'pod:Signature',
		$fee: 'pod:Amount',
		$deadline: 'pod:Timestamp',
		$linkAction: 'enum:LinkAction',
		$remotePublicKey: 'pod:PublicKey'
	};

	public function __construct() {
		this._$type = AccountKeyLinkTransactionV1.TRANSACTION_TYPE;
		this._$version = AccountKeyLinkTransactionV1.TRANSACTION_VERSION;
		this._$network = NetworkType.MAINNET;
		this._$timestamp = new Timestamp();
		this._$signerPublicKey = new PublicKey();
		this._$signature = new Signature();
		this._$fee = new Amount();
		this._$deadline = new Timestamp();
		this._$linkAction = LinkAction.LINK;
		this._$remotePublicKey = new PublicKey();
		this._$entityBodyReserved_1 = 0; // reserved field
		this._$signerPublicKeySize = 32; // reserved field
		this._$signatureSize = 64; // reserved field
		this._$remotePublicKeySize = 32; // reserved field
	}

	sort() {
	}

	get $type() {
		return this._$type;
	}

	set $type(value) {
		this._$type = value;
	}

	get $version() {
		return this._$version;
	}

	set $version(value) {
		this._$version = value;
	}

	get $network() {
		return this._$network;
	}

	set $network(value) {
		this._$network = value;
	}

	get $timestamp() {
		return this._$timestamp;
	}

	set $timestamp(value) {
		this._$timestamp = value;
	}

	get $signerPublicKey() {
		return this._$signerPublicKey;
	}

	set $signerPublicKey(value) {
		this._$signerPublicKey = value;
	}

	get $signature() {
		return this._$signature;
	}

	set $signature(value) {
		this._$signature = value;
	}

	get $fee() {
		return this._$fee;
	}

	set $fee(value) {
		this._$fee = value;
	}

	get $deadline() {
		return this._$deadline;
	}

	set $deadline(value) {
		this._$deadline = value;
	}

	get $linkAction() {
		return this._$linkAction;
	}

	set $linkAction(value) {
		this._$linkAction = value;
	}

	get $remotePublicKey() {
		return this._$remotePublicKey;
	}

	set $remotePublicKey(value) {
		this._$remotePublicKey = value;
	}

	get size() {
		let size = 0;
		size += this.$type.size;
		size += 1;
		size += 2;
		size += this.$network.size;
		size += this.$timestamp.size;
		size += 4;
		size += this.$signerPublicKey.size;
		size += 4;
		size += this.$signature.size;
		size += this.$fee.size;
		size += this.$deadline.size;
		size += this.$linkAction.size;
		size += 4;
		size += this.$remotePublicKey.size;
		return size;
	}

	public static function deserialize($payload) {
		const view = new BufferView(payload);
		const $type = TransactionType.deserialize(view.buffer);
		view.shiftRight($type.size);
		const $version = Converter::hexToInt(view.buffer, 1);
		view.shiftRight(1);
		const $entityBodyReserved_1 = Converter::hexToInt(view.buffer, 2);
		view.shiftRight(2);
		if (0 !== $entityBodyReserved_1)
			throw RangeError(`Invalid value of reserved field (${$entityBodyReserved_1})`);
		const $network = NetworkType.deserialize(view.buffer);
		view.shiftRight($network.size);
		const $timestamp = Timestamp.deserialize(view.buffer);
		view.shiftRight($timestamp.size);
		const $signerPublicKeySize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		if (32 !== $signerPublicKeySize)
			throw RangeError(`Invalid value of reserved field (${$signerPublicKeySize})`);
		const $signerPublicKey = PublicKey.deserialize(view.buffer);
		view.shiftRight($signerPublicKey.size);
		const $signatureSize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		if (64 !== $signatureSize)
			throw RangeError(`Invalid value of reserved field (${$signatureSize})`);
		const $signature = Signature.deserialize(view.buffer);
		view.shiftRight($signature.size);
		const $fee = Amount.deserialize(view.buffer);
		view.shiftRight($fee.size);
		const $deadline = Timestamp.deserialize(view.buffer);
		view.shiftRight($deadline.size);
		const $linkAction = LinkAction.deserialize(view.buffer);
		view.shiftRight($linkAction.size);
		const $remotePublicKeySize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		if (32 !== $remotePublicKeySize)
			throw RangeError(`Invalid value of reserved field (${$remotePublicKeySize})`);
		const $remotePublicKey = PublicKey.deserialize(view.buffer);
		view.shiftRight($remotePublicKey.size);

		const instance = new AccountKeyLinkTransactionV1();
		instance._$type = $type;
		instance._$version = $version;
		instance._$network = $network;
		instance._$timestamp = $timestamp;
		instance._$signerPublicKey = $signerPublicKey;
		instance._$signature = $signature;
		instance._$fee = $fee;
		instance._$deadline = $deadline;
		instance._$linkAction = $linkAction;
		instance._$remotePublicKey = $remotePublicKey;
		return instance;
	}

	public function serialize() {
		const buffer = new Writer(this.size);
		buffer.write(this._$type.serialize());
		buffer.write(Converter::intToHex(this._$version, 1));
		buffer.write(Converter::intToHex(this._$entityBodyReserved_1, 2));
		buffer.write(this._$network.serialize());
		buffer.write(this._$timestamp.serialize());
		buffer.write(Converter::intToHex(this._$signerPublicKeySize, 4));
		buffer.write(this._$signerPublicKey.serialize());
		buffer.write(Converter::intToHex(this._$signatureSize, 4));
		buffer.write(this._$signature.serialize());
		buffer.write(this._$fee.serialize());
		buffer.write(this._$deadline.serialize());
		buffer.write(this._$linkAction.serialize());
		buffer.write(Converter::intToHex(this._$remotePublicKeySize, 4));
		buffer.write(this._$remotePublicKey.serialize());
		return buffer.storage;
	}

	toString() {
		let result = '(';
		result += `$type: ${this._$type.toString()}, `;
		result += `$version: ${'0x'.concat(this._$version.toString(16))}, `;
		result += `$network: ${this._$network.toString()}, `;
		result += `$timestamp: ${this._$timestamp.toString()}, `;
		result += `$signerPublicKey: ${this._$signerPublicKey.toString()}, `;
		result += `$signature: ${this._$signature.toString()}, `;
		result += `$fee: ${this._$fee.toString()}, `;
		result += `$deadline: ${this._$deadline.toString()}, `;
		result += `$linkAction: ${this._$linkAction.toString()}, `;
		result += `$remotePublicKey: ${this._$remotePublicKey.toString()}, `;
		result += ')';
		return result;
	}
}

class NonVerifiableAccountKeyLinkTransactionV1 {
	static TRANSACTION_VERSION = 1;

	static TRANSACTION_TYPE = TransactionType.ACCOUNT_KEY_LINK;

	static TYPE_HINTS = {
		$type: 'enum:TransactionType',
		$network: 'enum:NetworkType',
		$timestamp: 'pod:Timestamp',
		$signerPublicKey: 'pod:PublicKey',
		$fee: 'pod:Amount',
		$deadline: 'pod:Timestamp',
		$linkAction: 'enum:LinkAction',
		$remotePublicKey: 'pod:PublicKey'
	};

	public function __construct() {
		this._$type = NonVerifiableAccountKeyLinkTransactionV1.TRANSACTION_TYPE;
		this._$version = NonVerifiableAccountKeyLinkTransactionV1.TRANSACTION_VERSION;
		this._$network = NetworkType.MAINNET;
		this._$timestamp = new Timestamp();
		this._$signerPublicKey = new PublicKey();
		this._$fee = new Amount();
		this._$deadline = new Timestamp();
		this._$linkAction = LinkAction.LINK;
		this._$remotePublicKey = new PublicKey();
		this._$entityBodyReserved_1 = 0; // reserved field
		this._$signerPublicKeySize = 32; // reserved field
		this._$remotePublicKeySize = 32; // reserved field
	}

	sort() {
	}

	get $type() {
		return this._$type;
	}

	set $type(value) {
		this._$type = value;
	}

	get $version() {
		return this._$version;
	}

	set $version(value) {
		this._$version = value;
	}

	get $network() {
		return this._$network;
	}

	set $network(value) {
		this._$network = value;
	}

	get $timestamp() {
		return this._$timestamp;
	}

	set $timestamp(value) {
		this._$timestamp = value;
	}

	get $signerPublicKey() {
		return this._$signerPublicKey;
	}

	set $signerPublicKey(value) {
		this._$signerPublicKey = value;
	}

	get $fee() {
		return this._$fee;
	}

	set $fee(value) {
		this._$fee = value;
	}

	get $deadline() {
		return this._$deadline;
	}

	set $deadline(value) {
		this._$deadline = value;
	}

	get $linkAction() {
		return this._$linkAction;
	}

	set $linkAction(value) {
		this._$linkAction = value;
	}

	get $remotePublicKey() {
		return this._$remotePublicKey;
	}

	set $remotePublicKey(value) {
		this._$remotePublicKey = value;
	}

	get size() {
		let size = 0;
		size += this.$type.size;
		size += 1;
		size += 2;
		size += this.$network.size;
		size += this.$timestamp.size;
		size += 4;
		size += this.$signerPublicKey.size;
		size += this.$fee.size;
		size += this.$deadline.size;
		size += this.$linkAction.size;
		size += 4;
		size += this.$remotePublicKey.size;
		return size;
	}

	public static function deserialize($payload) {
		const view = new BufferView(payload);
		const $type = TransactionType.deserialize(view.buffer);
		view.shiftRight($type.size);
		const $version = Converter::hexToInt(view.buffer, 1);
		view.shiftRight(1);
		const $entityBodyReserved_1 = Converter::hexToInt(view.buffer, 2);
		view.shiftRight(2);
		if (0 !== $entityBodyReserved_1)
			throw RangeError(`Invalid value of reserved field (${$entityBodyReserved_1})`);
		const $network = NetworkType.deserialize(view.buffer);
		view.shiftRight($network.size);
		const $timestamp = Timestamp.deserialize(view.buffer);
		view.shiftRight($timestamp.size);
		const $signerPublicKeySize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		if (32 !== $signerPublicKeySize)
			throw RangeError(`Invalid value of reserved field (${$signerPublicKeySize})`);
		const $signerPublicKey = PublicKey.deserialize(view.buffer);
		view.shiftRight($signerPublicKey.size);
		const $fee = Amount.deserialize(view.buffer);
		view.shiftRight($fee.size);
		const $deadline = Timestamp.deserialize(view.buffer);
		view.shiftRight($deadline.size);
		const $linkAction = LinkAction.deserialize(view.buffer);
		view.shiftRight($linkAction.size);
		const $remotePublicKeySize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		if (32 !== $remotePublicKeySize)
			throw RangeError(`Invalid value of reserved field (${$remotePublicKeySize})`);
		const $remotePublicKey = PublicKey.deserialize(view.buffer);
		view.shiftRight($remotePublicKey.size);

		const instance = new NonVerifiableAccountKeyLinkTransactionV1();
		instance._$type = $type;
		instance._$version = $version;
		instance._$network = $network;
		instance._$timestamp = $timestamp;
		instance._$signerPublicKey = $signerPublicKey;
		instance._$fee = $fee;
		instance._$deadline = $deadline;
		instance._$linkAction = $linkAction;
		instance._$remotePublicKey = $remotePublicKey;
		return instance;
	}

	public function serialize() {
		const buffer = new Writer(this.size);
		buffer.write(this._$type.serialize());
		buffer.write(Converter::intToHex(this._$version, 1));
		buffer.write(Converter::intToHex(this._$entityBodyReserved_1, 2));
		buffer.write(this._$network.serialize());
		buffer.write(this._$timestamp.serialize());
		buffer.write(Converter::intToHex(this._$signerPublicKeySize, 4));
		buffer.write(this._$signerPublicKey.serialize());
		buffer.write(this._$fee.serialize());
		buffer.write(this._$deadline.serialize());
		buffer.write(this._$linkAction.serialize());
		buffer.write(Converter::intToHex(this._$remotePublicKeySize, 4));
		buffer.write(this._$remotePublicKey.serialize());
		return buffer.storage;
	}

	toString() {
		let result = '(';
		result += `$type: ${this._$type.toString()}, `;
		result += `$version: ${'0x'.concat(this._$version.toString(16))}, `;
		result += `$network: ${this._$network.toString()}, `;
		result += `$timestamp: ${this._$timestamp.toString()}, `;
		result += `$signerPublicKey: ${this._$signerPublicKey.toString()}, `;
		result += `$fee: ${this._$fee.toString()}, `;
		result += `$deadline: ${this._$deadline.toString()}, `;
		result += `$linkAction: ${this._$linkAction.toString()}, `;
		result += `$remotePublicKey: ${this._$remotePublicKey.toString()}, `;
		result += ')';
		return result;
	}
}

class NamespaceId {
	static TYPE_HINTS = {
		$name: 'bytes_array'
	};

	public function __construct() {
		this._$name = new Uint8Array();
	}

	sort() {
	}

	get $name() {
		return this._$name;
	}

	set $name(value) {
		this._$name = value;
	}

	get size() {
		let size = 0;
		size += 4;
		size += this._$name.length;
		return size;
	}

	public static function deserialize($payload) {
		const view = new BufferView(payload);
		const $nameSize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		const $name = new Uint8Array(view.buffer.buffer, view.buffer.byteOffset, nameSize);
		view.shiftRight(nameSize);

		const instance = new NamespaceId();
		instance._$name = $name;
		return instance;
	}

	public function serialize() {
		const buffer = new Writer(this.size);
		buffer.write(Converter::intToHex(this._$name.length, 4)); // bound: name_size
		buffer.write(this._$name);
		return buffer.storage;
	}

	toString() {
		let result = '(';
		result += `$name: hex(${converter.uint8ToHex(this._$name)}), `;
		result += ')';
		return result;
	}
}

class MosaicId {
	static TYPE_HINTS = {
		$namespaceId: 'struct:NamespaceId',
		$name: 'bytes_array'
	};

	public function __construct() {
		this._$namespaceId = new NamespaceId();
		this._$name = new Uint8Array();
	}

	sort() {
		this._$namespaceId.sort();
	}

	get $namespaceId() {
		return this._$namespaceId;
	}

	set $namespaceId(value) {
		this._$namespaceId = value;
	}

	get $name() {
		return this._$name;
	}

	set $name(value) {
		this._$name = value;
	}

	get size() {
		let size = 0;
		size += this.$namespaceId.size;
		size += 4;
		size += this._$name.length;
		return size;
	}

	public static function deserialize($payload) {
		const view = new BufferView(payload);
		const $namespaceId = NamespaceId.deserialize(view.buffer);
		view.shiftRight($namespaceId.size);
		const $nameSize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		const $name = new Uint8Array(view.buffer.buffer, view.buffer.byteOffset, nameSize);
		view.shiftRight(nameSize);

		const instance = new MosaicId();
		instance._$namespaceId = $namespaceId;
		instance._$name = $name;
		return instance;
	}

	public function serialize() {
		const buffer = new Writer(this.size);
		buffer.write(this._$namespaceId.serialize());
		buffer.write(Converter::intToHex(this._$name.length, 4)); // bound: name_size
		buffer.write(this._$name);
		return buffer.storage;
	}

	toString() {
		let result = '(';
		result += `$namespaceId: ${this._$namespaceId.toString()}, `;
		result += `$name: hex(${converter.uint8ToHex(this._$name)}), `;
		result += ')';
		return result;
	}
}

class Mosaic {
	static TYPE_HINTS = {
		$mosaicId: 'struct:MosaicId',
		$amount: 'pod:Amount'
	};

	public function __construct() {
		this._$mosaicId = new MosaicId();
		this._$amount = new Amount();
	}

	sort() {
		this._$mosaicId.sort();
	}

	get $mosaicId() {
		return this._$mosaicId;
	}

	set $mosaicId(value) {
		this._$mosaicId = value;
	}

	get $amount() {
		return this._$amount;
	}

	set $amount(value) {
		this._$amount = value;
	}

	get size() {
		let size = 0;
		size += 4;
		size += this.$mosaicId.size;
		size += this.$amount.size;
		return size;
	}

	public static function deserialize($payload) {
		const view = new BufferView(payload);
		const $mosaicIdSize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		// marking sizeof field
		const $mosaicId = MosaicId.deserialize(view.window(mosaicIdSize));
		view.shiftRight($mosaicId.size);
		const $amount = Amount.deserialize(view.buffer);
		view.shiftRight($amount.size);

		const instance = new Mosaic();
		instance._$mosaicId = $mosaicId;
		instance._$amount = $amount;
		return instance;
	}

	public function serialize() {
		const buffer = new Writer(this.size);
		buffer.write(Converter::intToHex(this.$mosaicId.size, 4)); // bound: mosaic_id_size
		buffer.write(this._$mosaicId.serialize());
		buffer.write(this._$amount.serialize());
		return buffer.storage;
	}

	toString() {
		let result = '(';
		result += `$mosaicId: ${this._$mosaicId.toString()}, `;
		result += `$amount: ${this._$amount.toString()}, `;
		result += ')';
		return result;
	}
}

class SizePrefixedMosaic {
	static TYPE_HINTS = {
		$mosaic: 'struct:Mosaic'
	};

	public function __construct() {
		this._$mosaic = new Mosaic();
	}

	sort() {
		this._$mosaic.sort();
	}

	get $mosaic() {
		return this._$mosaic;
	}

	set $mosaic(value) {
		this._$mosaic = value;
	}

	get size() {
		let size = 0;
		size += 4;
		size += this.$mosaic.size;
		return size;
	}

	public static function deserialize($payload) {
		const view = new BufferView(payload);
		const $mosaicSize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		// marking sizeof field
		const $mosaic = Mosaic.deserialize(view.window(mosaicSize));
		view.shiftRight($mosaic.size);

		const instance = new SizePrefixedMosaic();
		instance._$mosaic = $mosaic;
		return instance;
	}

	public function serialize() {
		const buffer = new Writer(this.size);
		buffer.write(Converter::intToHex(this.$mosaic.size, 4)); // bound: mosaic_size
		buffer.write(this._$mosaic.serialize());
		return buffer.storage;
	}

	toString() {
		let result = '(';
		result += `$mosaic: ${this._$mosaic.toString()}, `;
		result += ')';
		return result;
	}
}

class MosaicTransferFeeType {
	static ABSOLUTE = new MosaicTransferFeeType(1);

	static PERCENTILE = new MosaicTransferFeeType(2);

	public function __construct(value) {
		this.value = value;
	}

	static valueToKey(value) {
		const values = [
			1, 2
		];
		const keys = [
			'ABSOLUTE', 'PERCENTILE'
		];

		const index = values.indexOf(value);
		if (-1 === index)
			throw RangeError(`invalid enum value ${value}`);

		return keys[index];
	}

	static fromValue(value) {
		return MosaicTransferFeeType[this.valueToKey(value)];
	}

	get size() {
		return 4;
	}

	public static function deserialize($payload) {
		const byteArray = payload;
		return this.fromValue(Converter::hexToInt(byteArray, 4));
	}

	public static function deserializeAligned($payload) {
		const byteArray = payload;
		return this.fromValue(Converter::hexToInt(byteArray, 4));
	}

	public function serialize() {
		return Converter::intToHex(this.value, 4);
	}

	toString() {
		return `MosaicTransferFeeType.${MosaicTransferFeeType.valueToKey(this.value)}`;
	}
}

class MosaicLevy {
	static TYPE_HINTS = {
		$transferFeeType: 'enum:MosaicTransferFeeType',
		$recipientAddress: 'pod:Address',
		$mosaicId: 'struct:MosaicId',
		$fee: 'pod:Amount'
	};

	public function __construct() {
		this._$transferFeeType = MosaicTransferFeeType.ABSOLUTE;
		this._$recipientAddress = new Address();
		this._$mosaicId = new MosaicId();
		this._$fee = new Amount();
		this._$recipientAddressSize = 40; // reserved field
	}

	sort() {
		this._$mosaicId.sort();
	}

	get $transferFeeType() {
		return this._$transferFeeType;
	}

	set $transferFeeType(value) {
		this._$transferFeeType = value;
	}

	get $recipientAddress() {
		return this._$recipientAddress;
	}

	set $recipientAddress(value) {
		this._$recipientAddress = value;
	}

	get $mosaicId() {
		return this._$mosaicId;
	}

	set $mosaicId(value) {
		this._$mosaicId = value;
	}

	get $fee() {
		return this._$fee;
	}

	set $fee(value) {
		this._$fee = value;
	}

	get size() {
		let size = 0;
		size += this.$transferFeeType.size;
		size += 4;
		size += this.$recipientAddress.size;
		size += 4;
		size += this.$mosaicId.size;
		size += this.$fee.size;
		return size;
	}

	public static function deserialize($payload) {
		const view = new BufferView(payload);
		const $transferFeeType = MosaicTransferFeeType.deserialize(view.buffer);
		view.shiftRight($transferFeeType.size);
		const $recipientAddressSize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		if (40 !== $recipientAddressSize)
			throw RangeError(`Invalid value of reserved field (${$recipientAddressSize})`);
		const $recipientAddress = Address.deserialize(view.buffer);
		view.shiftRight($recipientAddress.size);
		const $mosaicIdSize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		// marking sizeof field
		const $mosaicId = MosaicId.deserialize(view.window(mosaicIdSize));
		view.shiftRight($mosaicId.size);
		const $fee = Amount.deserialize(view.buffer);
		view.shiftRight($fee.size);

		const instance = new MosaicLevy();
		instance._$transferFeeType = $transferFeeType;
		instance._$recipientAddress = $recipientAddress;
		instance._$mosaicId = $mosaicId;
		instance._$fee = $fee;
		return instance;
	}

	public function serialize() {
		const buffer = new Writer(this.size);
		buffer.write(this._$transferFeeType.serialize());
		buffer.write(Converter::intToHex(this._$recipientAddressSize, 4));
		buffer.write(this._$recipientAddress.serialize());
		buffer.write(Converter::intToHex(this.$mosaicId.size, 4)); // bound: mosaic_id_size
		buffer.write(this._$mosaicId.serialize());
		buffer.write(this._$fee.serialize());
		return buffer.storage;
	}

	toString() {
		let result = '(';
		result += `$transferFeeType: ${this._$transferFeeType.toString()}, `;
		result += `$recipientAddress: ${this._$recipientAddress.toString()}, `;
		result += `$mosaicId: ${this._$mosaicId.toString()}, `;
		result += `$fee: ${this._$fee.toString()}, `;
		result += ')';
		return result;
	}
}

class MosaicProperty {
	static TYPE_HINTS = {
		$name: 'bytes_array',
		$value: 'bytes_array'
	};

	public function __construct() {
		this._$name = new Uint8Array();
		this._$value = new Uint8Array();
	}

	sort() {
	}

	get $name() {
		return this._$name;
	}

	set $name(value) {
		this._$name = value;
	}

	get $value() {
		return this._$value;
	}

	set $value(value) {
		this._$value = value;
	}

	get size() {
		let size = 0;
		size += 4;
		size += this._$name.length;
		size += 4;
		size += this._$value.length;
		return size;
	}

	public static function deserialize($payload) {
		const view = new BufferView(payload);
		const $nameSize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		const $name = new Uint8Array(view.buffer.buffer, view.buffer.byteOffset, nameSize);
		view.shiftRight(nameSize);
		const $valueSize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		const $value = new Uint8Array(view.buffer.buffer, view.buffer.byteOffset, valueSize);
		view.shiftRight(valueSize);

		const instance = new MosaicProperty();
		instance._$name = $name;
		instance._$value = $value;
		return instance;
	}

	public function serialize() {
		const buffer = new Writer(this.size);
		buffer.write(Converter::intToHex(this._$name.length, 4)); // bound: name_size
		buffer.write(this._$name);
		buffer.write(Converter::intToHex(this._$value.length, 4)); // bound: value_size
		buffer.write(this._$value);
		return buffer.storage;
	}

	toString() {
		let result = '(';
		result += `$name: hex(${converter.uint8ToHex(this._$name)}), `;
		result += `$value: hex(${converter.uint8ToHex(this._$value)}), `;
		result += ')';
		return result;
	}
}

class SizePrefixedMosaicProperty {
	static TYPE_HINTS = {
		$property: 'struct:MosaicProperty'
	};

	public function __construct() {
		this._$property = new MosaicProperty();
	}

	sort() {
		this._$property.sort();
	}

	get $property() {
		return this._$property;
	}

	set $property(value) {
		this._$property = value;
	}

	get size() {
		let size = 0;
		size += 4;
		size += this.$property.size;
		return size;
	}

	public static function deserialize($payload) {
		const view = new BufferView(payload);
		const $propertySize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		// marking sizeof field
		const $property = MosaicProperty.deserialize(view.window(propertySize));
		view.shiftRight($property.size);

		const instance = new SizePrefixedMosaicProperty();
		instance._$property = $property;
		return instance;
	}

	public function serialize() {
		const buffer = new Writer(this.size);
		buffer.write(Converter::intToHex(this.$property.size, 4)); // bound: property_size
		buffer.write(this._$property.serialize());
		return buffer.storage;
	}

	toString() {
		let result = '(';
		result += `$property: ${this._$property.toString()}, `;
		result += ')';
		return result;
	}
}

class MosaicDefinition {
	static TYPE_HINTS = {
		$ownerPublicKey: 'pod:PublicKey',
		$id: 'struct:MosaicId',
		$description: 'bytes_array',
		$properties: 'array[SizePrefixedMosaicProperty]',
		$levy: 'struct:MosaicLevy'
	};

	public function __construct() {
		this._$ownerPublicKey = new PublicKey();
		this._$id = new MosaicId();
		this._$description = new Uint8Array();
		this._$properties = [];
		this._$levy = null;
		this._$ownerPublicKeySize = 32; // reserved field
	}

	sort() {
		this._$id.sort();
		if (0 !== this.levySizeComputed)
			this._$levy.sort();
	}

	get $ownerPublicKey() {
		return this._$ownerPublicKey;
	}

	set $ownerPublicKey(value) {
		this._$ownerPublicKey = value;
	}

	get $id() {
		return this._$id;
	}

	set $id(value) {
		this._$id = value;
	}

	get $description() {
		return this._$description;
	}

	set $description(value) {
		this._$description = value;
	}

	get $properties() {
		return this._$properties;
	}

	set $properties(value) {
		this._$properties = value;
	}

	get $levy() {
		return this._$levy;
	}

	set $levy(value) {
		this._$levy = value;
	}

	get $levySizeComputed() {
		return this.levy ? this.levy.size + 0 : 0;
	}

	get size() {
		let size = 0;
		size += 4;
		size += this.$ownerPublicKey.size;
		size += 4;
		size += this.$id.size;
		size += 4;
		size += this._$description.length;
		size += 4;
		size += arrayHelpers.size(this.$properties);
		size += 4;
		if (0 !== this.levySizeComputed)
			size += this.$levy.size;

		return size;
	}

	public static function deserialize($payload) {
		const view = new BufferView(payload);
		const $ownerPublicKeySize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		if (32 !== $ownerPublicKeySize)
			throw RangeError(`Invalid value of reserved field (${$ownerPublicKeySize})`);
		const $ownerPublicKey = PublicKey.deserialize(view.buffer);
		view.shiftRight($ownerPublicKey.size);
		const $idSize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		// marking sizeof field
		const $id = MosaicId.deserialize(view.window(idSize));
		view.shiftRight($id.size);
		const $descriptionSize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		const $description = new Uint8Array(view.buffer.buffer, view.buffer.byteOffset, descriptionSize);
		view.shiftRight(descriptionSize);
		const $propertiesCount = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		const $properties = arrayHelpers.readArrayCount(view.buffer, SizePrefixedMosaicProperty, propertiesCount);
		view.shiftRight(arrayHelpers.size($properties));
		const $levySize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		let $levy = null;
		if (0 !== levySize) {
			$levy = MosaicLevy.deserialize(view.buffer);
			view.shiftRight($levy.size);
		}

		const instance = new MosaicDefinition();
		instance._$ownerPublicKey = $ownerPublicKey;
		instance._$id = $id;
		instance._$description = $description;
		instance._$properties = $properties;
		instance._$levy = $levy;
		return instance;
	}

	public function serialize() {
		const buffer = new Writer(this.size);
		buffer.write(Converter::intToHex(this._$ownerPublicKeySize, 4));
		buffer.write(this._$ownerPublicKey.serialize());
		buffer.write(Converter::intToHex(this.$id.size, 4)); // bound: id_size
		buffer.write(this._$id.serialize());
		buffer.write(Converter::intToHex(this._$description.length, 4)); // bound: description_size
		buffer.write(this._$description);
		buffer.write(Converter::intToHex(this._$properties.length, 4)); // bound: properties_count
		arrayHelpers.writeArray(buffer, this._$properties);
		buffer.write(Converter::intToHex(this.$levySizeComputed, 4));
		if (0 !== this.levySizeComputed)
			buffer.write(this._$levy.serialize());

		return buffer.storage;
	}

	toString() {
		let result = '(';
		result += `$ownerPublicKey: ${this._$ownerPublicKey.toString()}, `;
		result += `$id: ${this._$id.toString()}, `;
		result += `$description: hex(${converter.uint8ToHex(this._$description)}), `;
		result += `$properties: [${this._$properties.map(e => e.toString()).join(',')}], `;
		if (0 !== this.levySizeComputed)
			result += `$levy: ${this._$levy.toString()}, `;

		result += ')';
		return result;
	}
}

class MosaicDefinitionTransactionV1 {
	static TRANSACTION_VERSION = 1;

	static TRANSACTION_TYPE = TransactionType.MOSAIC_DEFINITION;

	static TYPE_HINTS = {
		$type: 'enum:TransactionType',
		$network: 'enum:NetworkType',
		$timestamp: 'pod:Timestamp',
		$signerPublicKey: 'pod:PublicKey',
		$signature: 'pod:Signature',
		$fee: 'pod:Amount',
		$deadline: 'pod:Timestamp',
		$mosaicDefinition: 'struct:MosaicDefinition',
		$rentalFeeSink: 'pod:Address',
		$rentalFee: 'pod:Amount'
	};

	public function __construct() {
		this._$type = MosaicDefinitionTransactionV1.TRANSACTION_TYPE;
		this._$version = MosaicDefinitionTransactionV1.TRANSACTION_VERSION;
		this._$network = NetworkType.MAINNET;
		this._$timestamp = new Timestamp();
		this._$signerPublicKey = new PublicKey();
		this._$signature = new Signature();
		this._$fee = new Amount();
		this._$deadline = new Timestamp();
		this._$mosaicDefinition = new MosaicDefinition();
		this._$rentalFeeSink = new Address();
		this._$rentalFee = new Amount();
		this._$entityBodyReserved_1 = 0; // reserved field
		this._$signerPublicKeySize = 32; // reserved field
		this._$signatureSize = 64; // reserved field
		this._$rentalFeeSinkSize = 40; // reserved field
	}

	sort() {
		this._$mosaicDefinition.sort();
	}

	get $type() {
		return this._$type;
	}

	set $type(value) {
		this._$type = value;
	}

	get $version() {
		return this._$version;
	}

	set $version(value) {
		this._$version = value;
	}

	get $network() {
		return this._$network;
	}

	set $network(value) {
		this._$network = value;
	}

	get $timestamp() {
		return this._$timestamp;
	}

	set $timestamp(value) {
		this._$timestamp = value;
	}

	get $signerPublicKey() {
		return this._$signerPublicKey;
	}

	set $signerPublicKey(value) {
		this._$signerPublicKey = value;
	}

	get $signature() {
		return this._$signature;
	}

	set $signature(value) {
		this._$signature = value;
	}

	get $fee() {
		return this._$fee;
	}

	set $fee(value) {
		this._$fee = value;
	}

	get $deadline() {
		return this._$deadline;
	}

	set $deadline(value) {
		this._$deadline = value;
	}

	get $mosaicDefinition() {
		return this._$mosaicDefinition;
	}

	set $mosaicDefinition(value) {
		this._$mosaicDefinition = value;
	}

	get $rentalFeeSink() {
		return this._$rentalFeeSink;
	}

	set $rentalFeeSink(value) {
		this._$rentalFeeSink = value;
	}

	get $rentalFee() {
		return this._$rentalFee;
	}

	set $rentalFee(value) {
		this._$rentalFee = value;
	}

	get size() {
		let size = 0;
		size += this.$type.size;
		size += 1;
		size += 2;
		size += this.$network.size;
		size += this.$timestamp.size;
		size += 4;
		size += this.$signerPublicKey.size;
		size += 4;
		size += this.$signature.size;
		size += this.$fee.size;
		size += this.$deadline.size;
		size += 4;
		size += this.$mosaicDefinition.size;
		size += 4;
		size += this.$rentalFeeSink.size;
		size += this.$rentalFee.size;
		return size;
	}

	public static function deserialize($payload) {
		const view = new BufferView(payload);
		const $type = TransactionType.deserialize(view.buffer);
		view.shiftRight($type.size);
		const $version = Converter::hexToInt(view.buffer, 1);
		view.shiftRight(1);
		const $entityBodyReserved_1 = Converter::hexToInt(view.buffer, 2);
		view.shiftRight(2);
		if (0 !== $entityBodyReserved_1)
			throw RangeError(`Invalid value of reserved field (${$entityBodyReserved_1})`);
		const $network = NetworkType.deserialize(view.buffer);
		view.shiftRight($network.size);
		const $timestamp = Timestamp.deserialize(view.buffer);
		view.shiftRight($timestamp.size);
		const $signerPublicKeySize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		if (32 !== $signerPublicKeySize)
			throw RangeError(`Invalid value of reserved field (${$signerPublicKeySize})`);
		const $signerPublicKey = PublicKey.deserialize(view.buffer);
		view.shiftRight($signerPublicKey.size);
		const $signatureSize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		if (64 !== $signatureSize)
			throw RangeError(`Invalid value of reserved field (${$signatureSize})`);
		const $signature = Signature.deserialize(view.buffer);
		view.shiftRight($signature.size);
		const $fee = Amount.deserialize(view.buffer);
		view.shiftRight($fee.size);
		const $deadline = Timestamp.deserialize(view.buffer);
		view.shiftRight($deadline.size);
		const $mosaicDefinitionSize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		// marking sizeof field
		const $mosaicDefinition = MosaicDefinition.deserialize(view.window(mosaicDefinitionSize));
		view.shiftRight($mosaicDefinition.size);
		const $rentalFeeSinkSize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		if (40 !== $rentalFeeSinkSize)
			throw RangeError(`Invalid value of reserved field (${$rentalFeeSinkSize})`);
		const $rentalFeeSink = Address.deserialize(view.buffer);
		view.shiftRight($rentalFeeSink.size);
		const $rentalFee = Amount.deserialize(view.buffer);
		view.shiftRight($rentalFee.size);

		const instance = new MosaicDefinitionTransactionV1();
		instance._$type = $type;
		instance._$version = $version;
		instance._$network = $network;
		instance._$timestamp = $timestamp;
		instance._$signerPublicKey = $signerPublicKey;
		instance._$signature = $signature;
		instance._$fee = $fee;
		instance._$deadline = $deadline;
		instance._$mosaicDefinition = $mosaicDefinition;
		instance._$rentalFeeSink = $rentalFeeSink;
		instance._$rentalFee = $rentalFee;
		return instance;
	}

	public function serialize() {
		const buffer = new Writer(this.size);
		buffer.write(this._$type.serialize());
		buffer.write(Converter::intToHex(this._$version, 1));
		buffer.write(Converter::intToHex(this._$entityBodyReserved_1, 2));
		buffer.write(this._$network.serialize());
		buffer.write(this._$timestamp.serialize());
		buffer.write(Converter::intToHex(this._$signerPublicKeySize, 4));
		buffer.write(this._$signerPublicKey.serialize());
		buffer.write(Converter::intToHex(this._$signatureSize, 4));
		buffer.write(this._$signature.serialize());
		buffer.write(this._$fee.serialize());
		buffer.write(this._$deadline.serialize());
		buffer.write(Converter::intToHex(this.$mosaicDefinition.size, 4)); // bound: mosaic_definition_size
		buffer.write(this._$mosaicDefinition.serialize());
		buffer.write(Converter::intToHex(this._$rentalFeeSinkSize, 4));
		buffer.write(this._$rentalFeeSink.serialize());
		buffer.write(this._$rentalFee.serialize());
		return buffer.storage;
	}

	toString() {
		let result = '(';
		result += `$type: ${this._$type.toString()}, `;
		result += `$version: ${'0x'.concat(this._$version.toString(16))}, `;
		result += `$network: ${this._$network.toString()}, `;
		result += `$timestamp: ${this._$timestamp.toString()}, `;
		result += `$signerPublicKey: ${this._$signerPublicKey.toString()}, `;
		result += `$signature: ${this._$signature.toString()}, `;
		result += `$fee: ${this._$fee.toString()}, `;
		result += `$deadline: ${this._$deadline.toString()}, `;
		result += `$mosaicDefinition: ${this._$mosaicDefinition.toString()}, `;
		result += `$rentalFeeSink: ${this._$rentalFeeSink.toString()}, `;
		result += `$rentalFee: ${this._$rentalFee.toString()}, `;
		result += ')';
		return result;
	}
}

class NonVerifiableMosaicDefinitionTransactionV1 {
	static TRANSACTION_VERSION = 1;

	static TRANSACTION_TYPE = TransactionType.MOSAIC_DEFINITION;

	static TYPE_HINTS = {
		$type: 'enum:TransactionType',
		$network: 'enum:NetworkType',
		$timestamp: 'pod:Timestamp',
		$signerPublicKey: 'pod:PublicKey',
		$fee: 'pod:Amount',
		$deadline: 'pod:Timestamp',
		$mosaicDefinition: 'struct:MosaicDefinition',
		$rentalFeeSink: 'pod:Address',
		$rentalFee: 'pod:Amount'
	};

	public function __construct() {
		this._$type = NonVerifiableMosaicDefinitionTransactionV1.TRANSACTION_TYPE;
		this._$version = NonVerifiableMosaicDefinitionTransactionV1.TRANSACTION_VERSION;
		this._$network = NetworkType.MAINNET;
		this._$timestamp = new Timestamp();
		this._$signerPublicKey = new PublicKey();
		this._$fee = new Amount();
		this._$deadline = new Timestamp();
		this._$mosaicDefinition = new MosaicDefinition();
		this._$rentalFeeSink = new Address();
		this._$rentalFee = new Amount();
		this._$entityBodyReserved_1 = 0; // reserved field
		this._$signerPublicKeySize = 32; // reserved field
		this._$rentalFeeSinkSize = 40; // reserved field
	}

	sort() {
		this._$mosaicDefinition.sort();
	}

	get $type() {
		return this._$type;
	}

	set $type(value) {
		this._$type = value;
	}

	get $version() {
		return this._$version;
	}

	set $version(value) {
		this._$version = value;
	}

	get $network() {
		return this._$network;
	}

	set $network(value) {
		this._$network = value;
	}

	get $timestamp() {
		return this._$timestamp;
	}

	set $timestamp(value) {
		this._$timestamp = value;
	}

	get $signerPublicKey() {
		return this._$signerPublicKey;
	}

	set $signerPublicKey(value) {
		this._$signerPublicKey = value;
	}

	get $fee() {
		return this._$fee;
	}

	set $fee(value) {
		this._$fee = value;
	}

	get $deadline() {
		return this._$deadline;
	}

	set $deadline(value) {
		this._$deadline = value;
	}

	get $mosaicDefinition() {
		return this._$mosaicDefinition;
	}

	set $mosaicDefinition(value) {
		this._$mosaicDefinition = value;
	}

	get $rentalFeeSink() {
		return this._$rentalFeeSink;
	}

	set $rentalFeeSink(value) {
		this._$rentalFeeSink = value;
	}

	get $rentalFee() {
		return this._$rentalFee;
	}

	set $rentalFee(value) {
		this._$rentalFee = value;
	}

	get size() {
		let size = 0;
		size += this.$type.size;
		size += 1;
		size += 2;
		size += this.$network.size;
		size += this.$timestamp.size;
		size += 4;
		size += this.$signerPublicKey.size;
		size += this.$fee.size;
		size += this.$deadline.size;
		size += 4;
		size += this.$mosaicDefinition.size;
		size += 4;
		size += this.$rentalFeeSink.size;
		size += this.$rentalFee.size;
		return size;
	}

	public static function deserialize($payload) {
		const view = new BufferView(payload);
		const $type = TransactionType.deserialize(view.buffer);
		view.shiftRight($type.size);
		const $version = Converter::hexToInt(view.buffer, 1);
		view.shiftRight(1);
		const $entityBodyReserved_1 = Converter::hexToInt(view.buffer, 2);
		view.shiftRight(2);
		if (0 !== $entityBodyReserved_1)
			throw RangeError(`Invalid value of reserved field (${$entityBodyReserved_1})`);
		const $network = NetworkType.deserialize(view.buffer);
		view.shiftRight($network.size);
		const $timestamp = Timestamp.deserialize(view.buffer);
		view.shiftRight($timestamp.size);
		const $signerPublicKeySize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		if (32 !== $signerPublicKeySize)
			throw RangeError(`Invalid value of reserved field (${$signerPublicKeySize})`);
		const $signerPublicKey = PublicKey.deserialize(view.buffer);
		view.shiftRight($signerPublicKey.size);
		const $fee = Amount.deserialize(view.buffer);
		view.shiftRight($fee.size);
		const $deadline = Timestamp.deserialize(view.buffer);
		view.shiftRight($deadline.size);
		const $mosaicDefinitionSize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		// marking sizeof field
		const $mosaicDefinition = MosaicDefinition.deserialize(view.window(mosaicDefinitionSize));
		view.shiftRight($mosaicDefinition.size);
		const $rentalFeeSinkSize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		if (40 !== $rentalFeeSinkSize)
			throw RangeError(`Invalid value of reserved field (${$rentalFeeSinkSize})`);
		const $rentalFeeSink = Address.deserialize(view.buffer);
		view.shiftRight($rentalFeeSink.size);
		const $rentalFee = Amount.deserialize(view.buffer);
		view.shiftRight($rentalFee.size);

		const instance = new NonVerifiableMosaicDefinitionTransactionV1();
		instance._$type = $type;
		instance._$version = $version;
		instance._$network = $network;
		instance._$timestamp = $timestamp;
		instance._$signerPublicKey = $signerPublicKey;
		instance._$fee = $fee;
		instance._$deadline = $deadline;
		instance._$mosaicDefinition = $mosaicDefinition;
		instance._$rentalFeeSink = $rentalFeeSink;
		instance._$rentalFee = $rentalFee;
		return instance;
	}

	public function serialize() {
		const buffer = new Writer(this.size);
		buffer.write(this._$type.serialize());
		buffer.write(Converter::intToHex(this._$version, 1));
		buffer.write(Converter::intToHex(this._$entityBodyReserved_1, 2));
		buffer.write(this._$network.serialize());
		buffer.write(this._$timestamp.serialize());
		buffer.write(Converter::intToHex(this._$signerPublicKeySize, 4));
		buffer.write(this._$signerPublicKey.serialize());
		buffer.write(this._$fee.serialize());
		buffer.write(this._$deadline.serialize());
		buffer.write(Converter::intToHex(this.$mosaicDefinition.size, 4)); // bound: mosaic_definition_size
		buffer.write(this._$mosaicDefinition.serialize());
		buffer.write(Converter::intToHex(this._$rentalFeeSinkSize, 4));
		buffer.write(this._$rentalFeeSink.serialize());
		buffer.write(this._$rentalFee.serialize());
		return buffer.storage;
	}

	toString() {
		let result = '(';
		result += `$type: ${this._$type.toString()}, `;
		result += `$version: ${'0x'.concat(this._$version.toString(16))}, `;
		result += `$network: ${this._$network.toString()}, `;
		result += `$timestamp: ${this._$timestamp.toString()}, `;
		result += `$signerPublicKey: ${this._$signerPublicKey.toString()}, `;
		result += `$fee: ${this._$fee.toString()}, `;
		result += `$deadline: ${this._$deadline.toString()}, `;
		result += `$mosaicDefinition: ${this._$mosaicDefinition.toString()}, `;
		result += `$rentalFeeSink: ${this._$rentalFeeSink.toString()}, `;
		result += `$rentalFee: ${this._$rentalFee.toString()}, `;
		result += ')';
		return result;
	}
}

class MosaicSupplyChangeAction {
	static INCREASE = new MosaicSupplyChangeAction(1);

	static DECREASE = new MosaicSupplyChangeAction(2);

	public function __construct(value) {
		this.value = value;
	}

	static valueToKey(value) {
		const values = [
			1, 2
		];
		const keys = [
			'INCREASE', 'DECREASE'
		];

		const index = values.indexOf(value);
		if (-1 === index)
			throw RangeError(`invalid enum value ${value}`);

		return keys[index];
	}

	static fromValue(value) {
		return MosaicSupplyChangeAction[this.valueToKey(value)];
	}

	get size() {
		return 4;
	}

	public static function deserialize($payload) {
		const byteArray = payload;
		return this.fromValue(Converter::hexToInt(byteArray, 4));
	}

	public static function deserializeAligned($payload) {
		const byteArray = payload;
		return this.fromValue(Converter::hexToInt(byteArray, 4));
	}

	public function serialize() {
		return Converter::intToHex(this.value, 4);
	}

	toString() {
		return `MosaicSupplyChangeAction.${MosaicSupplyChangeAction.valueToKey(this.value)}`;
	}
}

class MosaicSupplyChangeTransactionV1 {
	static TRANSACTION_VERSION = 1;

	static TRANSACTION_TYPE = TransactionType.MOSAIC_SUPPLY_CHANGE;

	static TYPE_HINTS = {
		$type: 'enum:TransactionType',
		$network: 'enum:NetworkType',
		$timestamp: 'pod:Timestamp',
		$signerPublicKey: 'pod:PublicKey',
		$signature: 'pod:Signature',
		$fee: 'pod:Amount',
		$deadline: 'pod:Timestamp',
		$mosaicId: 'struct:MosaicId',
		$action: 'enum:MosaicSupplyChangeAction',
		$delta: 'pod:Amount'
	};

	public function __construct() {
		this._$type = MosaicSupplyChangeTransactionV1.TRANSACTION_TYPE;
		this._$version = MosaicSupplyChangeTransactionV1.TRANSACTION_VERSION;
		this._$network = NetworkType.MAINNET;
		this._$timestamp = new Timestamp();
		this._$signerPublicKey = new PublicKey();
		this._$signature = new Signature();
		this._$fee = new Amount();
		this._$deadline = new Timestamp();
		this._$mosaicId = new MosaicId();
		this._$action = MosaicSupplyChangeAction.INCREASE;
		this._$delta = new Amount();
		this._$entityBodyReserved_1 = 0; // reserved field
		this._$signerPublicKeySize = 32; // reserved field
		this._$signatureSize = 64; // reserved field
	}

	sort() {
		this._$mosaicId.sort();
	}

	get $type() {
		return this._$type;
	}

	set $type(value) {
		this._$type = value;
	}

	get $version() {
		return this._$version;
	}

	set $version(value) {
		this._$version = value;
	}

	get $network() {
		return this._$network;
	}

	set $network(value) {
		this._$network = value;
	}

	get $timestamp() {
		return this._$timestamp;
	}

	set $timestamp(value) {
		this._$timestamp = value;
	}

	get $signerPublicKey() {
		return this._$signerPublicKey;
	}

	set $signerPublicKey(value) {
		this._$signerPublicKey = value;
	}

	get $signature() {
		return this._$signature;
	}

	set $signature(value) {
		this._$signature = value;
	}

	get $fee() {
		return this._$fee;
	}

	set $fee(value) {
		this._$fee = value;
	}

	get $deadline() {
		return this._$deadline;
	}

	set $deadline(value) {
		this._$deadline = value;
	}

	get $mosaicId() {
		return this._$mosaicId;
	}

	set $mosaicId(value) {
		this._$mosaicId = value;
	}

	get $action() {
		return this._$action;
	}

	set $action(value) {
		this._$action = value;
	}

	get $delta() {
		return this._$delta;
	}

	set $delta(value) {
		this._$delta = value;
	}

	get size() {
		let size = 0;
		size += this.$type.size;
		size += 1;
		size += 2;
		size += this.$network.size;
		size += this.$timestamp.size;
		size += 4;
		size += this.$signerPublicKey.size;
		size += 4;
		size += this.$signature.size;
		size += this.$fee.size;
		size += this.$deadline.size;
		size += 4;
		size += this.$mosaicId.size;
		size += this.$action.size;
		size += this.$delta.size;
		return size;
	}

	public static function deserialize($payload) {
		const view = new BufferView(payload);
		const $type = TransactionType.deserialize(view.buffer);
		view.shiftRight($type.size);
		const $version = Converter::hexToInt(view.buffer, 1);
		view.shiftRight(1);
		const $entityBodyReserved_1 = Converter::hexToInt(view.buffer, 2);
		view.shiftRight(2);
		if (0 !== $entityBodyReserved_1)
			throw RangeError(`Invalid value of reserved field (${$entityBodyReserved_1})`);
		const $network = NetworkType.deserialize(view.buffer);
		view.shiftRight($network.size);
		const $timestamp = Timestamp.deserialize(view.buffer);
		view.shiftRight($timestamp.size);
		const $signerPublicKeySize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		if (32 !== $signerPublicKeySize)
			throw RangeError(`Invalid value of reserved field (${$signerPublicKeySize})`);
		const $signerPublicKey = PublicKey.deserialize(view.buffer);
		view.shiftRight($signerPublicKey.size);
		const $signatureSize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		if (64 !== $signatureSize)
			throw RangeError(`Invalid value of reserved field (${$signatureSize})`);
		const $signature = Signature.deserialize(view.buffer);
		view.shiftRight($signature.size);
		const $fee = Amount.deserialize(view.buffer);
		view.shiftRight($fee.size);
		const $deadline = Timestamp.deserialize(view.buffer);
		view.shiftRight($deadline.size);
		const $mosaicIdSize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		// marking sizeof field
		const $mosaicId = MosaicId.deserialize(view.window(mosaicIdSize));
		view.shiftRight($mosaicId.size);
		const $action = MosaicSupplyChangeAction.deserialize(view.buffer);
		view.shiftRight($action.size);
		const $delta = Amount.deserialize(view.buffer);
		view.shiftRight($delta.size);

		const instance = new MosaicSupplyChangeTransactionV1();
		instance._$type = $type;
		instance._$version = $version;
		instance._$network = $network;
		instance._$timestamp = $timestamp;
		instance._$signerPublicKey = $signerPublicKey;
		instance._$signature = $signature;
		instance._$fee = $fee;
		instance._$deadline = $deadline;
		instance._$mosaicId = $mosaicId;
		instance._$action = $action;
		instance._$delta = $delta;
		return instance;
	}

	public function serialize() {
		const buffer = new Writer(this.size);
		buffer.write(this._$type.serialize());
		buffer.write(Converter::intToHex(this._$version, 1));
		buffer.write(Converter::intToHex(this._$entityBodyReserved_1, 2));
		buffer.write(this._$network.serialize());
		buffer.write(this._$timestamp.serialize());
		buffer.write(Converter::intToHex(this._$signerPublicKeySize, 4));
		buffer.write(this._$signerPublicKey.serialize());
		buffer.write(Converter::intToHex(this._$signatureSize, 4));
		buffer.write(this._$signature.serialize());
		buffer.write(this._$fee.serialize());
		buffer.write(this._$deadline.serialize());
		buffer.write(Converter::intToHex(this.$mosaicId.size, 4)); // bound: mosaic_id_size
		buffer.write(this._$mosaicId.serialize());
		buffer.write(this._$action.serialize());
		buffer.write(this._$delta.serialize());
		return buffer.storage;
	}

	toString() {
		let result = '(';
		result += `$type: ${this._$type.toString()}, `;
		result += `$version: ${'0x'.concat(this._$version.toString(16))}, `;
		result += `$network: ${this._$network.toString()}, `;
		result += `$timestamp: ${this._$timestamp.toString()}, `;
		result += `$signerPublicKey: ${this._$signerPublicKey.toString()}, `;
		result += `$signature: ${this._$signature.toString()}, `;
		result += `$fee: ${this._$fee.toString()}, `;
		result += `$deadline: ${this._$deadline.toString()}, `;
		result += `$mosaicId: ${this._$mosaicId.toString()}, `;
		result += `$action: ${this._$action.toString()}, `;
		result += `$delta: ${this._$delta.toString()}, `;
		result += ')';
		return result;
	}
}

class NonVerifiableMosaicSupplyChangeTransactionV1 {
	static TRANSACTION_VERSION = 1;

	static TRANSACTION_TYPE = TransactionType.MOSAIC_SUPPLY_CHANGE;

	static TYPE_HINTS = {
		$type: 'enum:TransactionType',
		$network: 'enum:NetworkType',
		$timestamp: 'pod:Timestamp',
		$signerPublicKey: 'pod:PublicKey',
		$fee: 'pod:Amount',
		$deadline: 'pod:Timestamp',
		$mosaicId: 'struct:MosaicId',
		$action: 'enum:MosaicSupplyChangeAction',
		$delta: 'pod:Amount'
	};

	public function __construct() {
		this._$type = NonVerifiableMosaicSupplyChangeTransactionV1.TRANSACTION_TYPE;
		this._$version = NonVerifiableMosaicSupplyChangeTransactionV1.TRANSACTION_VERSION;
		this._$network = NetworkType.MAINNET;
		this._$timestamp = new Timestamp();
		this._$signerPublicKey = new PublicKey();
		this._$fee = new Amount();
		this._$deadline = new Timestamp();
		this._$mosaicId = new MosaicId();
		this._$action = MosaicSupplyChangeAction.INCREASE;
		this._$delta = new Amount();
		this._$entityBodyReserved_1 = 0; // reserved field
		this._$signerPublicKeySize = 32; // reserved field
	}

	sort() {
		this._$mosaicId.sort();
	}

	get $type() {
		return this._$type;
	}

	set $type(value) {
		this._$type = value;
	}

	get $version() {
		return this._$version;
	}

	set $version(value) {
		this._$version = value;
	}

	get $network() {
		return this._$network;
	}

	set $network(value) {
		this._$network = value;
	}

	get $timestamp() {
		return this._$timestamp;
	}

	set $timestamp(value) {
		this._$timestamp = value;
	}

	get $signerPublicKey() {
		return this._$signerPublicKey;
	}

	set $signerPublicKey(value) {
		this._$signerPublicKey = value;
	}

	get $fee() {
		return this._$fee;
	}

	set $fee(value) {
		this._$fee = value;
	}

	get $deadline() {
		return this._$deadline;
	}

	set $deadline(value) {
		this._$deadline = value;
	}

	get $mosaicId() {
		return this._$mosaicId;
	}

	set $mosaicId(value) {
		this._$mosaicId = value;
	}

	get $action() {
		return this._$action;
	}

	set $action(value) {
		this._$action = value;
	}

	get $delta() {
		return this._$delta;
	}

	set $delta(value) {
		this._$delta = value;
	}

	get size() {
		let size = 0;
		size += this.$type.size;
		size += 1;
		size += 2;
		size += this.$network.size;
		size += this.$timestamp.size;
		size += 4;
		size += this.$signerPublicKey.size;
		size += this.$fee.size;
		size += this.$deadline.size;
		size += 4;
		size += this.$mosaicId.size;
		size += this.$action.size;
		size += this.$delta.size;
		return size;
	}

	public static function deserialize($payload) {
		const view = new BufferView(payload);
		const $type = TransactionType.deserialize(view.buffer);
		view.shiftRight($type.size);
		const $version = Converter::hexToInt(view.buffer, 1);
		view.shiftRight(1);
		const $entityBodyReserved_1 = Converter::hexToInt(view.buffer, 2);
		view.shiftRight(2);
		if (0 !== $entityBodyReserved_1)
			throw RangeError(`Invalid value of reserved field (${$entityBodyReserved_1})`);
		const $network = NetworkType.deserialize(view.buffer);
		view.shiftRight($network.size);
		const $timestamp = Timestamp.deserialize(view.buffer);
		view.shiftRight($timestamp.size);
		const $signerPublicKeySize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		if (32 !== $signerPublicKeySize)
			throw RangeError(`Invalid value of reserved field (${$signerPublicKeySize})`);
		const $signerPublicKey = PublicKey.deserialize(view.buffer);
		view.shiftRight($signerPublicKey.size);
		const $fee = Amount.deserialize(view.buffer);
		view.shiftRight($fee.size);
		const $deadline = Timestamp.deserialize(view.buffer);
		view.shiftRight($deadline.size);
		const $mosaicIdSize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		// marking sizeof field
		const $mosaicId = MosaicId.deserialize(view.window(mosaicIdSize));
		view.shiftRight($mosaicId.size);
		const $action = MosaicSupplyChangeAction.deserialize(view.buffer);
		view.shiftRight($action.size);
		const $delta = Amount.deserialize(view.buffer);
		view.shiftRight($delta.size);

		const instance = new NonVerifiableMosaicSupplyChangeTransactionV1();
		instance._$type = $type;
		instance._$version = $version;
		instance._$network = $network;
		instance._$timestamp = $timestamp;
		instance._$signerPublicKey = $signerPublicKey;
		instance._$fee = $fee;
		instance._$deadline = $deadline;
		instance._$mosaicId = $mosaicId;
		instance._$action = $action;
		instance._$delta = $delta;
		return instance;
	}

	public function serialize() {
		const buffer = new Writer(this.size);
		buffer.write(this._$type.serialize());
		buffer.write(Converter::intToHex(this._$version, 1));
		buffer.write(Converter::intToHex(this._$entityBodyReserved_1, 2));
		buffer.write(this._$network.serialize());
		buffer.write(this._$timestamp.serialize());
		buffer.write(Converter::intToHex(this._$signerPublicKeySize, 4));
		buffer.write(this._$signerPublicKey.serialize());
		buffer.write(this._$fee.serialize());
		buffer.write(this._$deadline.serialize());
		buffer.write(Converter::intToHex(this.$mosaicId.size, 4)); // bound: mosaic_id_size
		buffer.write(this._$mosaicId.serialize());
		buffer.write(this._$action.serialize());
		buffer.write(this._$delta.serialize());
		return buffer.storage;
	}

	toString() {
		let result = '(';
		result += `$type: ${this._$type.toString()}, `;
		result += `$version: ${'0x'.concat(this._$version.toString(16))}, `;
		result += `$network: ${this._$network.toString()}, `;
		result += `$timestamp: ${this._$timestamp.toString()}, `;
		result += `$signerPublicKey: ${this._$signerPublicKey.toString()}, `;
		result += `$fee: ${this._$fee.toString()}, `;
		result += `$deadline: ${this._$deadline.toString()}, `;
		result += `$mosaicId: ${this._$mosaicId.toString()}, `;
		result += `$action: ${this._$action.toString()}, `;
		result += `$delta: ${this._$delta.toString()}, `;
		result += ')';
		return result;
	}
}

class MultisigAccountModificationType {
	static ADD_COSIGNATORY = new MultisigAccountModificationType(1);

	static DELETE_COSIGNATORY = new MultisigAccountModificationType(2);

	public function __construct(value) {
		this.value = value;
	}

	static valueToKey(value) {
		const values = [
			1, 2
		];
		const keys = [
			'ADD_COSIGNATORY', 'DELETE_COSIGNATORY'
		];

		const index = values.indexOf(value);
		if (-1 === index)
			throw RangeError(`invalid enum value ${value}`);

		return keys[index];
	}

	static fromValue(value) {
		return MultisigAccountModificationType[this.valueToKey(value)];
	}

	get size() {
		return 4;
	}

	public static function deserialize($payload) {
		const byteArray = payload;
		return this.fromValue(Converter::hexToInt(byteArray, 4));
	}

	public static function deserializeAligned($payload) {
		const byteArray = payload;
		return this.fromValue(Converter::hexToInt(byteArray, 4));
	}

	public function serialize() {
		return Converter::intToHex(this.value, 4);
	}

	toString() {
		return `MultisigAccountModificationType.${MultisigAccountModificationType.valueToKey(this.value)}`;
	}
}

class MultisigAccountModification {
	static TYPE_HINTS = {
		$modificationType: 'enum:MultisigAccountModificationType',
		$cosignatoryPublicKey: 'pod:PublicKey'
	};

	public function __construct() {
		this._$modificationType = MultisigAccountModificationType.ADD_COSIGNATORY;
		this._$cosignatoryPublicKey = new PublicKey();
		this._$cosignatoryPublicKeySize = 32; // reserved field
	}

	comparer() {
		return [
			this.modificationType,
			ripemdKeccak256(this.cosignatoryPublicKey.bytes)
		];
	}

	sort() {
	}

	get $modificationType() {
		return this._$modificationType;
	}

	set $modificationType(value) {
		this._$modificationType = value;
	}

	get $cosignatoryPublicKey() {
		return this._$cosignatoryPublicKey;
	}

	set $cosignatoryPublicKey(value) {
		this._$cosignatoryPublicKey = value;
	}

	get size() {
		let size = 0;
		size += this.$modificationType.size;
		size += 4;
		size += this.$cosignatoryPublicKey.size;
		return size;
	}

	public static function deserialize($payload) {
		const view = new BufferView(payload);
		const $modificationType = MultisigAccountModificationType.deserialize(view.buffer);
		view.shiftRight($modificationType.size);
		const $cosignatoryPublicKeySize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		if (32 !== $cosignatoryPublicKeySize)
			throw RangeError(`Invalid value of reserved field (${$cosignatoryPublicKeySize})`);
		const $cosignatoryPublicKey = PublicKey.deserialize(view.buffer);
		view.shiftRight($cosignatoryPublicKey.size);

		const instance = new MultisigAccountModification();
		instance._$modificationType = $modificationType;
		instance._$cosignatoryPublicKey = $cosignatoryPublicKey;
		return instance;
	}

	public function serialize() {
		const buffer = new Writer(this.size);
		buffer.write(this._$modificationType.serialize());
		buffer.write(Converter::intToHex(this._$cosignatoryPublicKeySize, 4));
		buffer.write(this._$cosignatoryPublicKey.serialize());
		return buffer.storage;
	}

	toString() {
		let result = '(';
		result += `$modificationType: ${this._$modificationType.toString()}, `;
		result += `$cosignatoryPublicKey: ${this._$cosignatoryPublicKey.toString()}, `;
		result += ')';
		return result;
	}
}

class SizePrefixedMultisigAccountModification {
	static TYPE_HINTS = {
		$modification: 'struct:MultisigAccountModification'
	};

	public function __construct() {
		this._$modification = new MultisigAccountModification();
	}

	sort() {
		this._$modification.sort();
	}

	get $modification() {
		return this._$modification;
	}

	set $modification(value) {
		this._$modification = value;
	}

	get size() {
		let size = 0;
		size += 4;
		size += this.$modification.size;
		return size;
	}

	public static function deserialize($payload) {
		const view = new BufferView(payload);
		const $modificationSize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		// marking sizeof field
		const $modification = MultisigAccountModification.deserialize(view.window(modificationSize));
		view.shiftRight($modification.size);

		const instance = new SizePrefixedMultisigAccountModification();
		instance._$modification = $modification;
		return instance;
	}

	public function serialize() {
		const buffer = new Writer(this.size);
		buffer.write(Converter::intToHex(this.$modification.size, 4)); // bound: modification_size
		buffer.write(this._$modification.serialize());
		return buffer.storage;
	}

	toString() {
		let result = '(';
		result += `$modification: ${this._$modification.toString()}, `;
		result += ')';
		return result;
	}
}

class MultisigAccountModificationTransactionV1 {
	static TRANSACTION_VERSION = 1;

	static TRANSACTION_TYPE = TransactionType.MULTISIG_ACCOUNT_MODIFICATION;

	static TYPE_HINTS = {
		$type: 'enum:TransactionType',
		$network: 'enum:NetworkType',
		$timestamp: 'pod:Timestamp',
		$signerPublicKey: 'pod:PublicKey',
		$signature: 'pod:Signature',
		$fee: 'pod:Amount',
		$deadline: 'pod:Timestamp',
		$modifications: 'array[SizePrefixedMultisigAccountModification]'
	};

	public function __construct() {
		this._$type = MultisigAccountModificationTransactionV1.TRANSACTION_TYPE;
		this._$version = MultisigAccountModificationTransactionV1.TRANSACTION_VERSION;
		this._$network = NetworkType.MAINNET;
		this._$timestamp = new Timestamp();
		this._$signerPublicKey = new PublicKey();
		this._$signature = new Signature();
		this._$fee = new Amount();
		this._$deadline = new Timestamp();
		this._$modifications = [];
		this._$entityBodyReserved_1 = 0; // reserved field
		this._$signerPublicKeySize = 32; // reserved field
		this._$signatureSize = 64; // reserved field
	}

	sort() {
		this._$modifications = this._$modifications.sort((lhs, rhs) => arrayHelpers.deepCompare(
			(lhs.modification.comparer ? lhs.modification.comparer() : lhs.modification.value),
			(rhs.modification.comparer ? rhs.modification.comparer() : rhs.modification.value)
		));
	}

	get $type() {
		return this._$type;
	}

	set $type(value) {
		this._$type = value;
	}

	get $version() {
		return this._$version;
	}

	set $version(value) {
		this._$version = value;
	}

	get $network() {
		return this._$network;
	}

	set $network(value) {
		this._$network = value;
	}

	get $timestamp() {
		return this._$timestamp;
	}

	set $timestamp(value) {
		this._$timestamp = value;
	}

	get $signerPublicKey() {
		return this._$signerPublicKey;
	}

	set $signerPublicKey(value) {
		this._$signerPublicKey = value;
	}

	get $signature() {
		return this._$signature;
	}

	set $signature(value) {
		this._$signature = value;
	}

	get $fee() {
		return this._$fee;
	}

	set $fee(value) {
		this._$fee = value;
	}

	get $deadline() {
		return this._$deadline;
	}

	set $deadline(value) {
		this._$deadline = value;
	}

	get $modifications() {
		return this._$modifications;
	}

	set $modifications(value) {
		this._$modifications = value;
	}

	get size() {
		let size = 0;
		size += this.$type.size;
		size += 1;
		size += 2;
		size += this.$network.size;
		size += this.$timestamp.size;
		size += 4;
		size += this.$signerPublicKey.size;
		size += 4;
		size += this.$signature.size;
		size += this.$fee.size;
		size += this.$deadline.size;
		size += 4;
		size += arrayHelpers.size(this.$modifications);
		return size;
	}

	public static function deserialize($payload) {
		const view = new BufferView(payload);
		const $type = TransactionType.deserialize(view.buffer);
		view.shiftRight($type.size);
		const $version = Converter::hexToInt(view.buffer, 1);
		view.shiftRight(1);
		const $entityBodyReserved_1 = Converter::hexToInt(view.buffer, 2);
		view.shiftRight(2);
		if (0 !== $entityBodyReserved_1)
			throw RangeError(`Invalid value of reserved field (${$entityBodyReserved_1})`);
		const $network = NetworkType.deserialize(view.buffer);
		view.shiftRight($network.size);
		const $timestamp = Timestamp.deserialize(view.buffer);
		view.shiftRight($timestamp.size);
		const $signerPublicKeySize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		if (32 !== $signerPublicKeySize)
			throw RangeError(`Invalid value of reserved field (${$signerPublicKeySize})`);
		const $signerPublicKey = PublicKey.deserialize(view.buffer);
		view.shiftRight($signerPublicKey.size);
		const $signatureSize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		if (64 !== $signatureSize)
			throw RangeError(`Invalid value of reserved field (${$signatureSize})`);
		const $signature = Signature.deserialize(view.buffer);
		view.shiftRight($signature.size);
		const $fee = Amount.deserialize(view.buffer);
		view.shiftRight($fee.size);
		const $deadline = Timestamp.deserialize(view.buffer);
		view.shiftRight($deadline.size);
		const $modificationsCount = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		const $modifications = arrayHelpers.readArrayCount(view.buffer, SizePrefixedMultisigAccountModification, modificationsCount, e => ((e.modification.comparer ? e.modification.comparer() : e.modification.value)));
		view.shiftRight(arrayHelpers.size($modifications));

		const instance = new MultisigAccountModificationTransactionV1();
		instance._$type = $type;
		instance._$version = $version;
		instance._$network = $network;
		instance._$timestamp = $timestamp;
		instance._$signerPublicKey = $signerPublicKey;
		instance._$signature = $signature;
		instance._$fee = $fee;
		instance._$deadline = $deadline;
		instance._$modifications = $modifications;
		return instance;
	}

	public function serialize() {
		const buffer = new Writer(this.size);
		buffer.write(this._$type.serialize());
		buffer.write(Converter::intToHex(this._$version, 1));
		buffer.write(Converter::intToHex(this._$entityBodyReserved_1, 2));
		buffer.write(this._$network.serialize());
		buffer.write(this._$timestamp.serialize());
		buffer.write(Converter::intToHex(this._$signerPublicKeySize, 4));
		buffer.write(this._$signerPublicKey.serialize());
		buffer.write(Converter::intToHex(this._$signatureSize, 4));
		buffer.write(this._$signature.serialize());
		buffer.write(this._$fee.serialize());
		buffer.write(this._$deadline.serialize());
		buffer.write(Converter::intToHex(this._$modifications.length, 4)); // bound: modifications_count
		arrayHelpers.writeArray(buffer, this._$modifications, e => ((e.modification.comparer ? e.modification.comparer() : e.modification.value)));
		return buffer.storage;
	}

	toString() {
		let result = '(';
		result += `$type: ${this._$type.toString()}, `;
		result += `$version: ${'0x'.concat(this._$version.toString(16))}, `;
		result += `$network: ${this._$network.toString()}, `;
		result += `$timestamp: ${this._$timestamp.toString()}, `;
		result += `$signerPublicKey: ${this._$signerPublicKey.toString()}, `;
		result += `$signature: ${this._$signature.toString()}, `;
		result += `$fee: ${this._$fee.toString()}, `;
		result += `$deadline: ${this._$deadline.toString()}, `;
		result += `$modifications: [${this._$modifications.map(e => e.toString()).join(',')}], `;
		result += ')';
		return result;
	}
}

class NonVerifiableMultisigAccountModificationTransactionV1 {
	static TRANSACTION_VERSION = 1;

	static TRANSACTION_TYPE = TransactionType.MULTISIG_ACCOUNT_MODIFICATION;

	static TYPE_HINTS = {
		$type: 'enum:TransactionType',
		$network: 'enum:NetworkType',
		$timestamp: 'pod:Timestamp',
		$signerPublicKey: 'pod:PublicKey',
		$fee: 'pod:Amount',
		$deadline: 'pod:Timestamp',
		$modifications: 'array[SizePrefixedMultisigAccountModification]'
	};

	public function __construct() {
		this._$type = NonVerifiableMultisigAccountModificationTransactionV1.TRANSACTION_TYPE;
		this._$version = NonVerifiableMultisigAccountModificationTransactionV1.TRANSACTION_VERSION;
		this._$network = NetworkType.MAINNET;
		this._$timestamp = new Timestamp();
		this._$signerPublicKey = new PublicKey();
		this._$fee = new Amount();
		this._$deadline = new Timestamp();
		this._$modifications = [];
		this._$entityBodyReserved_1 = 0; // reserved field
		this._$signerPublicKeySize = 32; // reserved field
	}

	sort() {
		this._$modifications = this._$modifications.sort((lhs, rhs) => arrayHelpers.deepCompare(
			(lhs.modification.comparer ? lhs.modification.comparer() : lhs.modification.value),
			(rhs.modification.comparer ? rhs.modification.comparer() : rhs.modification.value)
		));
	}

	get $type() {
		return this._$type;
	}

	set $type(value) {
		this._$type = value;
	}

	get $version() {
		return this._$version;
	}

	set $version(value) {
		this._$version = value;
	}

	get $network() {
		return this._$network;
	}

	set $network(value) {
		this._$network = value;
	}

	get $timestamp() {
		return this._$timestamp;
	}

	set $timestamp(value) {
		this._$timestamp = value;
	}

	get $signerPublicKey() {
		return this._$signerPublicKey;
	}

	set $signerPublicKey(value) {
		this._$signerPublicKey = value;
	}

	get $fee() {
		return this._$fee;
	}

	set $fee(value) {
		this._$fee = value;
	}

	get $deadline() {
		return this._$deadline;
	}

	set $deadline(value) {
		this._$deadline = value;
	}

	get $modifications() {
		return this._$modifications;
	}

	set $modifications(value) {
		this._$modifications = value;
	}

	get size() {
		let size = 0;
		size += this.$type.size;
		size += 1;
		size += 2;
		size += this.$network.size;
		size += this.$timestamp.size;
		size += 4;
		size += this.$signerPublicKey.size;
		size += this.$fee.size;
		size += this.$deadline.size;
		size += 4;
		size += arrayHelpers.size(this.$modifications);
		return size;
	}

	public static function deserialize($payload) {
		const view = new BufferView(payload);
		const $type = TransactionType.deserialize(view.buffer);
		view.shiftRight($type.size);
		const $version = Converter::hexToInt(view.buffer, 1);
		view.shiftRight(1);
		const $entityBodyReserved_1 = Converter::hexToInt(view.buffer, 2);
		view.shiftRight(2);
		if (0 !== $entityBodyReserved_1)
			throw RangeError(`Invalid value of reserved field (${$entityBodyReserved_1})`);
		const $network = NetworkType.deserialize(view.buffer);
		view.shiftRight($network.size);
		const $timestamp = Timestamp.deserialize(view.buffer);
		view.shiftRight($timestamp.size);
		const $signerPublicKeySize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		if (32 !== $signerPublicKeySize)
			throw RangeError(`Invalid value of reserved field (${$signerPublicKeySize})`);
		const $signerPublicKey = PublicKey.deserialize(view.buffer);
		view.shiftRight($signerPublicKey.size);
		const $fee = Amount.deserialize(view.buffer);
		view.shiftRight($fee.size);
		const $deadline = Timestamp.deserialize(view.buffer);
		view.shiftRight($deadline.size);
		const $modificationsCount = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		const $modifications = arrayHelpers.readArrayCount(view.buffer, SizePrefixedMultisigAccountModification, modificationsCount, e => ((e.modification.comparer ? e.modification.comparer() : e.modification.value)));
		view.shiftRight(arrayHelpers.size($modifications));

		const instance = new NonVerifiableMultisigAccountModificationTransactionV1();
		instance._$type = $type;
		instance._$version = $version;
		instance._$network = $network;
		instance._$timestamp = $timestamp;
		instance._$signerPublicKey = $signerPublicKey;
		instance._$fee = $fee;
		instance._$deadline = $deadline;
		instance._$modifications = $modifications;
		return instance;
	}

	public function serialize() {
		const buffer = new Writer(this.size);
		buffer.write(this._$type.serialize());
		buffer.write(Converter::intToHex(this._$version, 1));
		buffer.write(Converter::intToHex(this._$entityBodyReserved_1, 2));
		buffer.write(this._$network.serialize());
		buffer.write(this._$timestamp.serialize());
		buffer.write(Converter::intToHex(this._$signerPublicKeySize, 4));
		buffer.write(this._$signerPublicKey.serialize());
		buffer.write(this._$fee.serialize());
		buffer.write(this._$deadline.serialize());
		buffer.write(Converter::intToHex(this._$modifications.length, 4)); // bound: modifications_count
		arrayHelpers.writeArray(buffer, this._$modifications, e => ((e.modification.comparer ? e.modification.comparer() : e.modification.value)));
		return buffer.storage;
	}

	toString() {
		let result = '(';
		result += `$type: ${this._$type.toString()}, `;
		result += `$version: ${'0x'.concat(this._$version.toString(16))}, `;
		result += `$network: ${this._$network.toString()}, `;
		result += `$timestamp: ${this._$timestamp.toString()}, `;
		result += `$signerPublicKey: ${this._$signerPublicKey.toString()}, `;
		result += `$fee: ${this._$fee.toString()}, `;
		result += `$deadline: ${this._$deadline.toString()}, `;
		result += `$modifications: [${this._$modifications.map(e => e.toString()).join(',')}], `;
		result += ')';
		return result;
	}
}

class MultisigAccountModificationTransactionV2 {
	static TRANSACTION_VERSION = 2;

	static TRANSACTION_TYPE = TransactionType.MULTISIG_ACCOUNT_MODIFICATION;

	static TYPE_HINTS = {
		$type: 'enum:TransactionType',
		$network: 'enum:NetworkType',
		$timestamp: 'pod:Timestamp',
		$signerPublicKey: 'pod:PublicKey',
		$signature: 'pod:Signature',
		$fee: 'pod:Amount',
		$deadline: 'pod:Timestamp',
		$modifications: 'array[SizePrefixedMultisigAccountModification]'
	};

	public function __construct() {
		this._$type = MultisigAccountModificationTransactionV2.TRANSACTION_TYPE;
		this._$version = MultisigAccountModificationTransactionV2.TRANSACTION_VERSION;
		this._$network = NetworkType.MAINNET;
		this._$timestamp = new Timestamp();
		this._$signerPublicKey = new PublicKey();
		this._$signature = new Signature();
		this._$fee = new Amount();
		this._$deadline = new Timestamp();
		this._$modifications = [];
		this._$minApprovalDelta = 0;
		this._$entityBodyReserved_1 = 0; // reserved field
		this._$signerPublicKeySize = 32; // reserved field
		this._$signatureSize = 64; // reserved field
		this._$minApprovalDeltaSize = 4; // reserved field
	}

	sort() {
		this._$modifications = this._$modifications.sort((lhs, rhs) => arrayHelpers.deepCompare(
			(lhs.modification.comparer ? lhs.modification.comparer() : lhs.modification.value),
			(rhs.modification.comparer ? rhs.modification.comparer() : rhs.modification.value)
		));
	}

	get $type() {
		return this._$type;
	}

	set $type(value) {
		this._$type = value;
	}

	get $version() {
		return this._$version;
	}

	set $version(value) {
		this._$version = value;
	}

	get $network() {
		return this._$network;
	}

	set $network(value) {
		this._$network = value;
	}

	get $timestamp() {
		return this._$timestamp;
	}

	set $timestamp(value) {
		this._$timestamp = value;
	}

	get $signerPublicKey() {
		return this._$signerPublicKey;
	}

	set $signerPublicKey(value) {
		this._$signerPublicKey = value;
	}

	get $signature() {
		return this._$signature;
	}

	set $signature(value) {
		this._$signature = value;
	}

	get $fee() {
		return this._$fee;
	}

	set $fee(value) {
		this._$fee = value;
	}

	get $deadline() {
		return this._$deadline;
	}

	set $deadline(value) {
		this._$deadline = value;
	}

	get $modifications() {
		return this._$modifications;
	}

	set $modifications(value) {
		this._$modifications = value;
	}

	get $minApprovalDelta() {
		return this._$minApprovalDelta;
	}

	set $minApprovalDelta(value) {
		this._$minApprovalDelta = value;
	}

	get size() {
		let size = 0;
		size += this.$type.size;
		size += 1;
		size += 2;
		size += this.$network.size;
		size += this.$timestamp.size;
		size += 4;
		size += this.$signerPublicKey.size;
		size += 4;
		size += this.$signature.size;
		size += this.$fee.size;
		size += this.$deadline.size;
		size += 4;
		size += arrayHelpers.size(this.$modifications);
		size += 4;
		size += 4;
		return size;
	}

	public static function deserialize($payload) {
		const view = new BufferView(payload);
		const $type = TransactionType.deserialize(view.buffer);
		view.shiftRight($type.size);
		const $version = Converter::hexToInt(view.buffer, 1);
		view.shiftRight(1);
		const $entityBodyReserved_1 = Converter::hexToInt(view.buffer, 2);
		view.shiftRight(2);
		if (0 !== $entityBodyReserved_1)
			throw RangeError(`Invalid value of reserved field (${$entityBodyReserved_1})`);
		const $network = NetworkType.deserialize(view.buffer);
		view.shiftRight($network.size);
		const $timestamp = Timestamp.deserialize(view.buffer);
		view.shiftRight($timestamp.size);
		const $signerPublicKeySize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		if (32 !== $signerPublicKeySize)
			throw RangeError(`Invalid value of reserved field (${$signerPublicKeySize})`);
		const $signerPublicKey = PublicKey.deserialize(view.buffer);
		view.shiftRight($signerPublicKey.size);
		const $signatureSize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		if (64 !== $signatureSize)
			throw RangeError(`Invalid value of reserved field (${$signatureSize})`);
		const $signature = Signature.deserialize(view.buffer);
		view.shiftRight($signature.size);
		const $fee = Amount.deserialize(view.buffer);
		view.shiftRight($fee.size);
		const $deadline = Timestamp.deserialize(view.buffer);
		view.shiftRight($deadline.size);
		const $modificationsCount = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		const $modifications = arrayHelpers.readArrayCount(view.buffer, SizePrefixedMultisigAccountModification, modificationsCount, e => ((e.modification.comparer ? e.modification.comparer() : e.modification.value)));
		view.shiftRight(arrayHelpers.size($modifications));
		const $minApprovalDeltaSize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		if (4 !== $minApprovalDeltaSize)
			throw RangeError(`Invalid value of reserved field (${$minApprovalDeltaSize})`);
		const $minApprovalDelta = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);

		const instance = new MultisigAccountModificationTransactionV2();
		instance._$type = $type;
		instance._$version = $version;
		instance._$network = $network;
		instance._$timestamp = $timestamp;
		instance._$signerPublicKey = $signerPublicKey;
		instance._$signature = $signature;
		instance._$fee = $fee;
		instance._$deadline = $deadline;
		instance._$modifications = $modifications;
		instance._$minApprovalDelta = $minApprovalDelta;
		return instance;
	}

	public function serialize() {
		const buffer = new Writer(this.size);
		buffer.write(this._$type.serialize());
		buffer.write(Converter::intToHex(this._$version, 1));
		buffer.write(Converter::intToHex(this._$entityBodyReserved_1, 2));
		buffer.write(this._$network.serialize());
		buffer.write(this._$timestamp.serialize());
		buffer.write(Converter::intToHex(this._$signerPublicKeySize, 4));
		buffer.write(this._$signerPublicKey.serialize());
		buffer.write(Converter::intToHex(this._$signatureSize, 4));
		buffer.write(this._$signature.serialize());
		buffer.write(this._$fee.serialize());
		buffer.write(this._$deadline.serialize());
		buffer.write(Converter::intToHex(this._$modifications.length, 4)); // bound: modifications_count
		arrayHelpers.writeArray(buffer, this._$modifications, e => ((e.modification.comparer ? e.modification.comparer() : e.modification.value)));
		buffer.write(Converter::intToHex(this._$minApprovalDeltaSize, 4));
		buffer.write(Converter::intToHex(this._$minApprovalDelta, 4));
		return buffer.storage;
	}

	toString() {
		let result = '(';
		result += `$type: ${this._$type.toString()}, `;
		result += `$version: ${'0x'.concat(this._$version.toString(16))}, `;
		result += `$network: ${this._$network.toString()}, `;
		result += `$timestamp: ${this._$timestamp.toString()}, `;
		result += `$signerPublicKey: ${this._$signerPublicKey.toString()}, `;
		result += `$signature: ${this._$signature.toString()}, `;
		result += `$fee: ${this._$fee.toString()}, `;
		result += `$deadline: ${this._$deadline.toString()}, `;
		result += `$modifications: [${this._$modifications.map(e => e.toString()).join(',')}], `;
		result += `$minApprovalDelta: ${'0x'.concat(this._$minApprovalDelta.toString(16))}, `;
		result += ')';
		return result;
	}
}

class NonVerifiableMultisigAccountModificationTransactionV2 {
	static TRANSACTION_VERSION = 2;

	static TRANSACTION_TYPE = TransactionType.MULTISIG_ACCOUNT_MODIFICATION;

	static TYPE_HINTS = {
		$type: 'enum:TransactionType',
		$network: 'enum:NetworkType',
		$timestamp: 'pod:Timestamp',
		$signerPublicKey: 'pod:PublicKey',
		$fee: 'pod:Amount',
		$deadline: 'pod:Timestamp',
		$modifications: 'array[SizePrefixedMultisigAccountModification]'
	};

	public function __construct() {
		this._$type = NonVerifiableMultisigAccountModificationTransactionV2.TRANSACTION_TYPE;
		this._$version = NonVerifiableMultisigAccountModificationTransactionV2.TRANSACTION_VERSION;
		this._$network = NetworkType.MAINNET;
		this._$timestamp = new Timestamp();
		this._$signerPublicKey = new PublicKey();
		this._$fee = new Amount();
		this._$deadline = new Timestamp();
		this._$modifications = [];
		this._$minApprovalDelta = 0;
		this._$entityBodyReserved_1 = 0; // reserved field
		this._$signerPublicKeySize = 32; // reserved field
		this._$minApprovalDeltaSize = 4; // reserved field
	}

	sort() {
		this._$modifications = this._$modifications.sort((lhs, rhs) => arrayHelpers.deepCompare(
			(lhs.modification.comparer ? lhs.modification.comparer() : lhs.modification.value),
			(rhs.modification.comparer ? rhs.modification.comparer() : rhs.modification.value)
		));
	}

	get $type() {
		return this._$type;
	}

	set $type(value) {
		this._$type = value;
	}

	get $version() {
		return this._$version;
	}

	set $version(value) {
		this._$version = value;
	}

	get $network() {
		return this._$network;
	}

	set $network(value) {
		this._$network = value;
	}

	get $timestamp() {
		return this._$timestamp;
	}

	set $timestamp(value) {
		this._$timestamp = value;
	}

	get $signerPublicKey() {
		return this._$signerPublicKey;
	}

	set $signerPublicKey(value) {
		this._$signerPublicKey = value;
	}

	get $fee() {
		return this._$fee;
	}

	set $fee(value) {
		this._$fee = value;
	}

	get $deadline() {
		return this._$deadline;
	}

	set $deadline(value) {
		this._$deadline = value;
	}

	get $modifications() {
		return this._$modifications;
	}

	set $modifications(value) {
		this._$modifications = value;
	}

	get $minApprovalDelta() {
		return this._$minApprovalDelta;
	}

	set $minApprovalDelta(value) {
		this._$minApprovalDelta = value;
	}

	get size() {
		let size = 0;
		size += this.$type.size;
		size += 1;
		size += 2;
		size += this.$network.size;
		size += this.$timestamp.size;
		size += 4;
		size += this.$signerPublicKey.size;
		size += this.$fee.size;
		size += this.$deadline.size;
		size += 4;
		size += arrayHelpers.size(this.$modifications);
		size += 4;
		size += 4;
		return size;
	}

	public static function deserialize($payload) {
		const view = new BufferView(payload);
		const $type = TransactionType.deserialize(view.buffer);
		view.shiftRight($type.size);
		const $version = Converter::hexToInt(view.buffer, 1);
		view.shiftRight(1);
		const $entityBodyReserved_1 = Converter::hexToInt(view.buffer, 2);
		view.shiftRight(2);
		if (0 !== $entityBodyReserved_1)
			throw RangeError(`Invalid value of reserved field (${$entityBodyReserved_1})`);
		const $network = NetworkType.deserialize(view.buffer);
		view.shiftRight($network.size);
		const $timestamp = Timestamp.deserialize(view.buffer);
		view.shiftRight($timestamp.size);
		const $signerPublicKeySize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		if (32 !== $signerPublicKeySize)
			throw RangeError(`Invalid value of reserved field (${$signerPublicKeySize})`);
		const $signerPublicKey = PublicKey.deserialize(view.buffer);
		view.shiftRight($signerPublicKey.size);
		const $fee = Amount.deserialize(view.buffer);
		view.shiftRight($fee.size);
		const $deadline = Timestamp.deserialize(view.buffer);
		view.shiftRight($deadline.size);
		const $modificationsCount = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		const $modifications = arrayHelpers.readArrayCount(view.buffer, SizePrefixedMultisigAccountModification, modificationsCount, e => ((e.modification.comparer ? e.modification.comparer() : e.modification.value)));
		view.shiftRight(arrayHelpers.size($modifications));
		const $minApprovalDeltaSize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		if (4 !== $minApprovalDeltaSize)
			throw RangeError(`Invalid value of reserved field (${$minApprovalDeltaSize})`);
		const $minApprovalDelta = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);

		const instance = new NonVerifiableMultisigAccountModificationTransactionV2();
		instance._$type = $type;
		instance._$version = $version;
		instance._$network = $network;
		instance._$timestamp = $timestamp;
		instance._$signerPublicKey = $signerPublicKey;
		instance._$fee = $fee;
		instance._$deadline = $deadline;
		instance._$modifications = $modifications;
		instance._$minApprovalDelta = $minApprovalDelta;
		return instance;
	}

	public function serialize() {
		const buffer = new Writer(this.size);
		buffer.write(this._$type.serialize());
		buffer.write(Converter::intToHex(this._$version, 1));
		buffer.write(Converter::intToHex(this._$entityBodyReserved_1, 2));
		buffer.write(this._$network.serialize());
		buffer.write(this._$timestamp.serialize());
		buffer.write(Converter::intToHex(this._$signerPublicKeySize, 4));
		buffer.write(this._$signerPublicKey.serialize());
		buffer.write(this._$fee.serialize());
		buffer.write(this._$deadline.serialize());
		buffer.write(Converter::intToHex(this._$modifications.length, 4)); // bound: modifications_count
		arrayHelpers.writeArray(buffer, this._$modifications, e => ((e.modification.comparer ? e.modification.comparer() : e.modification.value)));
		buffer.write(Converter::intToHex(this._$minApprovalDeltaSize, 4));
		buffer.write(Converter::intToHex(this._$minApprovalDelta, 4));
		return buffer.storage;
	}

	toString() {
		let result = '(';
		result += `$type: ${this._$type.toString()}, `;
		result += `$version: ${'0x'.concat(this._$version.toString(16))}, `;
		result += `$network: ${this._$network.toString()}, `;
		result += `$timestamp: ${this._$timestamp.toString()}, `;
		result += `$signerPublicKey: ${this._$signerPublicKey.toString()}, `;
		result += `$fee: ${this._$fee.toString()}, `;
		result += `$deadline: ${this._$deadline.toString()}, `;
		result += `$modifications: [${this._$modifications.map(e => e.toString()).join(',')}], `;
		result += `$minApprovalDelta: ${'0x'.concat(this._$minApprovalDelta.toString(16))}, `;
		result += ')';
		return result;
	}
}

class CosignatureV1 {
	static TRANSACTION_VERSION = 1;

	static TRANSACTION_TYPE = TransactionType.MULTISIG_COSIGNATURE;

	static TYPE_HINTS = {
		$type: 'enum:TransactionType',
		$network: 'enum:NetworkType',
		$timestamp: 'pod:Timestamp',
		$signerPublicKey: 'pod:PublicKey',
		$signature: 'pod:Signature',
		$fee: 'pod:Amount',
		$deadline: 'pod:Timestamp',
		$multisigTransactionHash: 'pod:Hash256',
		$multisigAccountAddress: 'pod:Address'
	};

	public function __construct() {
		this._$type = CosignatureV1.TRANSACTION_TYPE;
		this._$version = CosignatureV1.TRANSACTION_VERSION;
		this._$network = NetworkType.MAINNET;
		this._$timestamp = new Timestamp();
		this._$signerPublicKey = new PublicKey();
		this._$signature = new Signature();
		this._$fee = new Amount();
		this._$deadline = new Timestamp();
		this._$multisigTransactionHash = new Hash256();
		this._$multisigAccountAddress = new Address();
		this._$entityBodyReserved_1 = 0; // reserved field
		this._$signerPublicKeySize = 32; // reserved field
		this._$signatureSize = 64; // reserved field
		this._$multisigTransactionHashOuterSize = 36; // reserved field
		this._$multisigTransactionHashSize = 32; // reserved field
		this._$multisigAccountAddressSize = 40; // reserved field
	}

	sort() {
	}

	get $type() {
		return this._$type;
	}

	set $type(value) {
		this._$type = value;
	}

	get $version() {
		return this._$version;
	}

	set $version(value) {
		this._$version = value;
	}

	get $network() {
		return this._$network;
	}

	set $network(value) {
		this._$network = value;
	}

	get $timestamp() {
		return this._$timestamp;
	}

	set $timestamp(value) {
		this._$timestamp = value;
	}

	get $signerPublicKey() {
		return this._$signerPublicKey;
	}

	set $signerPublicKey(value) {
		this._$signerPublicKey = value;
	}

	get $signature() {
		return this._$signature;
	}

	set $signature(value) {
		this._$signature = value;
	}

	get $fee() {
		return this._$fee;
	}

	set $fee(value) {
		this._$fee = value;
	}

	get $deadline() {
		return this._$deadline;
	}

	set $deadline(value) {
		this._$deadline = value;
	}

	get $multisigTransactionHash() {
		return this._$multisigTransactionHash;
	}

	set $multisigTransactionHash(value) {
		this._$multisigTransactionHash = value;
	}

	get $multisigAccountAddress() {
		return this._$multisigAccountAddress;
	}

	set $multisigAccountAddress(value) {
		this._$multisigAccountAddress = value;
	}

	get size() {
		let size = 0;
		size += this.$type.size;
		size += 1;
		size += 2;
		size += this.$network.size;
		size += this.$timestamp.size;
		size += 4;
		size += this.$signerPublicKey.size;
		size += 4;
		size += this.$signature.size;
		size += this.$fee.size;
		size += this.$deadline.size;
		size += 4;
		size += 4;
		size += this.$multisigTransactionHash.size;
		size += 4;
		size += this.$multisigAccountAddress.size;
		return size;
	}

	public static function deserialize($payload) {
		const view = new BufferView(payload);
		const $type = TransactionType.deserialize(view.buffer);
		view.shiftRight($type.size);
		const $version = Converter::hexToInt(view.buffer, 1);
		view.shiftRight(1);
		const $entityBodyReserved_1 = Converter::hexToInt(view.buffer, 2);
		view.shiftRight(2);
		if (0 !== $entityBodyReserved_1)
			throw RangeError(`Invalid value of reserved field (${$entityBodyReserved_1})`);
		const $network = NetworkType.deserialize(view.buffer);
		view.shiftRight($network.size);
		const $timestamp = Timestamp.deserialize(view.buffer);
		view.shiftRight($timestamp.size);
		const $signerPublicKeySize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		if (32 !== $signerPublicKeySize)
			throw RangeError(`Invalid value of reserved field (${$signerPublicKeySize})`);
		const $signerPublicKey = PublicKey.deserialize(view.buffer);
		view.shiftRight($signerPublicKey.size);
		const $signatureSize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		if (64 !== $signatureSize)
			throw RangeError(`Invalid value of reserved field (${$signatureSize})`);
		const $signature = Signature.deserialize(view.buffer);
		view.shiftRight($signature.size);
		const $fee = Amount.deserialize(view.buffer);
		view.shiftRight($fee.size);
		const $deadline = Timestamp.deserialize(view.buffer);
		view.shiftRight($deadline.size);
		const $multisigTransactionHashOuterSize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		if (36 !== $multisigTransactionHashOuterSize)
			throw RangeError(`Invalid value of reserved field (${$multisigTransactionHashOuterSize})`);
		const $multisigTransactionHashSize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		if (32 !== $multisigTransactionHashSize)
			throw RangeError(`Invalid value of reserved field (${$multisigTransactionHashSize})`);
		const $multisigTransactionHash = Hash256.deserialize(view.buffer);
		view.shiftRight($multisigTransactionHash.size);
		const $multisigAccountAddressSize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		if (40 !== $multisigAccountAddressSize)
			throw RangeError(`Invalid value of reserved field (${$multisigAccountAddressSize})`);
		const $multisigAccountAddress = Address.deserialize(view.buffer);
		view.shiftRight($multisigAccountAddress.size);

		const instance = new CosignatureV1();
		instance._$type = $type;
		instance._$version = $version;
		instance._$network = $network;
		instance._$timestamp = $timestamp;
		instance._$signerPublicKey = $signerPublicKey;
		instance._$signature = $signature;
		instance._$fee = $fee;
		instance._$deadline = $deadline;
		instance._$multisigTransactionHash = $multisigTransactionHash;
		instance._$multisigAccountAddress = $multisigAccountAddress;
		return instance;
	}

	public function serialize() {
		const buffer = new Writer(this.size);
		buffer.write(this._$type.serialize());
		buffer.write(Converter::intToHex(this._$version, 1));
		buffer.write(Converter::intToHex(this._$entityBodyReserved_1, 2));
		buffer.write(this._$network.serialize());
		buffer.write(this._$timestamp.serialize());
		buffer.write(Converter::intToHex(this._$signerPublicKeySize, 4));
		buffer.write(this._$signerPublicKey.serialize());
		buffer.write(Converter::intToHex(this._$signatureSize, 4));
		buffer.write(this._$signature.serialize());
		buffer.write(this._$fee.serialize());
		buffer.write(this._$deadline.serialize());
		buffer.write(Converter::intToHex(this._$multisigTransactionHashOuterSize, 4));
		buffer.write(Converter::intToHex(this._$multisigTransactionHashSize, 4));
		buffer.write(this._$multisigTransactionHash.serialize());
		buffer.write(Converter::intToHex(this._$multisigAccountAddressSize, 4));
		buffer.write(this._$multisigAccountAddress.serialize());
		return buffer.storage;
	}

	toString() {
		let result = '(';
		result += `$type: ${this._$type.toString()}, `;
		result += `$version: ${'0x'.concat(this._$version.toString(16))}, `;
		result += `$network: ${this._$network.toString()}, `;
		result += `$timestamp: ${this._$timestamp.toString()}, `;
		result += `$signerPublicKey: ${this._$signerPublicKey.toString()}, `;
		result += `$signature: ${this._$signature.toString()}, `;
		result += `$fee: ${this._$fee.toString()}, `;
		result += `$deadline: ${this._$deadline.toString()}, `;
		result += `$multisigTransactionHash: ${this._$multisigTransactionHash.toString()}, `;
		result += `$multisigAccountAddress: ${this._$multisigAccountAddress.toString()}, `;
		result += ')';
		return result;
	}
}

class SizePrefixedCosignatureV1 {
	static TYPE_HINTS = {
		$cosignature: 'struct:CosignatureV1'
	};

	public function __construct() {
		this._$cosignature = new CosignatureV1();
	}

	sort() {
		this._$cosignature.sort();
	}

	get $cosignature() {
		return this._$cosignature;
	}

	set $cosignature(value) {
		this._$cosignature = value;
	}

	get size() {
		let size = 0;
		size += 4;
		size += this.$cosignature.size;
		return size;
	}

	public static function deserialize($payload) {
		const view = new BufferView(payload);
		const $cosignatureSize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		// marking sizeof field
		const $cosignature = CosignatureV1.deserialize(view.window(cosignatureSize));
		view.shiftRight($cosignature.size);

		const instance = new SizePrefixedCosignatureV1();
		instance._$cosignature = $cosignature;
		return instance;
	}

	public function serialize() {
		const buffer = new Writer(this.size);
		buffer.write(Converter::intToHex(this.$cosignature.size, 4)); // bound: cosignature_size
		buffer.write(this._$cosignature.serialize());
		return buffer.storage;
	}

	toString() {
		let result = '(';
		result += `$cosignature: ${this._$cosignature.toString()}, `;
		result += ')';
		return result;
	}
}

class MultisigTransactionV1 {
	static TRANSACTION_VERSION = 1;

	static TRANSACTION_TYPE = TransactionType.MULTISIG;

	static TYPE_HINTS = {
		$type: 'enum:TransactionType',
		$network: 'enum:NetworkType',
		$timestamp: 'pod:Timestamp',
		$signerPublicKey: 'pod:PublicKey',
		$signature: 'pod:Signature',
		$fee: 'pod:Amount',
		$deadline: 'pod:Timestamp',
		$innerTransaction: 'struct:NonVerifiableTransaction',
		$cosignatures: 'array[SizePrefixedCosignatureV1]'
	};

	public function __construct() {
		this._$type = MultisigTransactionV1.TRANSACTION_TYPE;
		this._$version = MultisigTransactionV1.TRANSACTION_VERSION;
		this._$network = NetworkType.MAINNET;
		this._$timestamp = new Timestamp();
		this._$signerPublicKey = new PublicKey();
		this._$signature = new Signature();
		this._$fee = new Amount();
		this._$deadline = new Timestamp();
		this._$innerTransaction = new NonVerifiableTransaction();
		this._$cosignatures = [];
		this._$entityBodyReserved_1 = 0; // reserved field
		this._$signerPublicKeySize = 32; // reserved field
		this._$signatureSize = 64; // reserved field
	}

	sort() {
		this._$innerTransaction.sort();
	}

	get $type() {
		return this._$type;
	}

	set $type(value) {
		this._$type = value;
	}

	get $version() {
		return this._$version;
	}

	set $version(value) {
		this._$version = value;
	}

	get $network() {
		return this._$network;
	}

	set $network(value) {
		this._$network = value;
	}

	get $timestamp() {
		return this._$timestamp;
	}

	set $timestamp(value) {
		this._$timestamp = value;
	}

	get $signerPublicKey() {
		return this._$signerPublicKey;
	}

	set $signerPublicKey(value) {
		this._$signerPublicKey = value;
	}

	get $signature() {
		return this._$signature;
	}

	set $signature(value) {
		this._$signature = value;
	}

	get $fee() {
		return this._$fee;
	}

	set $fee(value) {
		this._$fee = value;
	}

	get $deadline() {
		return this._$deadline;
	}

	set $deadline(value) {
		this._$deadline = value;
	}

	get $innerTransaction() {
		return this._$innerTransaction;
	}

	set $innerTransaction(value) {
		this._$innerTransaction = value;
	}

	get $cosignatures() {
		return this._$cosignatures;
	}

	set $cosignatures(value) {
		this._$cosignatures = value;
	}

	get size() {
		let size = 0;
		size += this.$type.size;
		size += 1;
		size += 2;
		size += this.$network.size;
		size += this.$timestamp.size;
		size += 4;
		size += this.$signerPublicKey.size;
		size += 4;
		size += this.$signature.size;
		size += this.$fee.size;
		size += this.$deadline.size;
		size += 4;
		size += this.$innerTransaction.size;
		size += 4;
		size += arrayHelpers.size(this.$cosignatures);
		return size;
	}

	public static function deserialize($payload) {
		const view = new BufferView(payload);
		const $type = TransactionType.deserialize(view.buffer);
		view.shiftRight($type.size);
		const $version = Converter::hexToInt(view.buffer, 1);
		view.shiftRight(1);
		const $entityBodyReserved_1 = Converter::hexToInt(view.buffer, 2);
		view.shiftRight(2);
		if (0 !== $entityBodyReserved_1)
			throw RangeError(`Invalid value of reserved field (${$entityBodyReserved_1})`);
		const $network = NetworkType.deserialize(view.buffer);
		view.shiftRight($network.size);
		const $timestamp = Timestamp.deserialize(view.buffer);
		view.shiftRight($timestamp.size);
		const $signerPublicKeySize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		if (32 !== $signerPublicKeySize)
			throw RangeError(`Invalid value of reserved field (${$signerPublicKeySize})`);
		const $signerPublicKey = PublicKey.deserialize(view.buffer);
		view.shiftRight($signerPublicKey.size);
		const $signatureSize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		if (64 !== $signatureSize)
			throw RangeError(`Invalid value of reserved field (${$signatureSize})`);
		const $signature = Signature.deserialize(view.buffer);
		view.shiftRight($signature.size);
		const $fee = Amount.deserialize(view.buffer);
		view.shiftRight($fee.size);
		const $deadline = Timestamp.deserialize(view.buffer);
		view.shiftRight($deadline.size);
		const $innerTransactionSize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		// marking sizeof field
		const $innerTransaction = NonVerifiableTransactionFactory.deserialize(view.window(innerTransactionSize));
		view.shiftRight($innerTransaction.size);
		const $cosignaturesCount = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		const $cosignatures = arrayHelpers.readArrayCount(view.buffer, SizePrefixedCosignatureV1, cosignaturesCount);
		view.shiftRight(arrayHelpers.size($cosignatures));

		const instance = new MultisigTransactionV1();
		instance._$type = $type;
		instance._$version = $version;
		instance._$network = $network;
		instance._$timestamp = $timestamp;
		instance._$signerPublicKey = $signerPublicKey;
		instance._$signature = $signature;
		instance._$fee = $fee;
		instance._$deadline = $deadline;
		instance._$innerTransaction = $innerTransaction;
		instance._$cosignatures = $cosignatures;
		return instance;
	}

	public function serialize() {
		const buffer = new Writer(this.size);
		buffer.write(this._$type.serialize());
		buffer.write(Converter::intToHex(this._$version, 1));
		buffer.write(Converter::intToHex(this._$entityBodyReserved_1, 2));
		buffer.write(this._$network.serialize());
		buffer.write(this._$timestamp.serialize());
		buffer.write(Converter::intToHex(this._$signerPublicKeySize, 4));
		buffer.write(this._$signerPublicKey.serialize());
		buffer.write(Converter::intToHex(this._$signatureSize, 4));
		buffer.write(this._$signature.serialize());
		buffer.write(this._$fee.serialize());
		buffer.write(this._$deadline.serialize());
		buffer.write(Converter::intToHex(this.$innerTransaction.size, 4)); // bound: inner_transaction_size
		buffer.write(this._$innerTransaction.serialize());
		buffer.write(Converter::intToHex(this._$cosignatures.length, 4)); // bound: cosignatures_count
		arrayHelpers.writeArray(buffer, this._$cosignatures);
		return buffer.storage;
	}

	toString() {
		let result = '(';
		result += `$type: ${this._$type.toString()}, `;
		result += `$version: ${'0x'.concat(this._$version.toString(16))}, `;
		result += `$network: ${this._$network.toString()}, `;
		result += `$timestamp: ${this._$timestamp.toString()}, `;
		result += `$signerPublicKey: ${this._$signerPublicKey.toString()}, `;
		result += `$signature: ${this._$signature.toString()}, `;
		result += `$fee: ${this._$fee.toString()}, `;
		result += `$deadline: ${this._$deadline.toString()}, `;
		result += `$innerTransaction: ${this._$innerTransaction.toString()}, `;
		result += `$cosignatures: [${this._$cosignatures.map(e => e.toString()).join(',')}], `;
		result += ')';
		return result;
	}
}

class NonVerifiableMultisigTransactionV1 {
	static TRANSACTION_VERSION = 1;

	static TRANSACTION_TYPE = TransactionType.MULTISIG;

	static TYPE_HINTS = {
		$type: 'enum:TransactionType',
		$network: 'enum:NetworkType',
		$timestamp: 'pod:Timestamp',
		$signerPublicKey: 'pod:PublicKey',
		$fee: 'pod:Amount',
		$deadline: 'pod:Timestamp',
		$innerTransaction: 'struct:NonVerifiableTransaction'
	};

	public function __construct() {
		this._$type = NonVerifiableMultisigTransactionV1.TRANSACTION_TYPE;
		this._$version = NonVerifiableMultisigTransactionV1.TRANSACTION_VERSION;
		this._$network = NetworkType.MAINNET;
		this._$timestamp = new Timestamp();
		this._$signerPublicKey = new PublicKey();
		this._$fee = new Amount();
		this._$deadline = new Timestamp();
		this._$innerTransaction = new NonVerifiableTransaction();
		this._$entityBodyReserved_1 = 0; // reserved field
		this._$signerPublicKeySize = 32; // reserved field
	}

	sort() {
		this._$innerTransaction.sort();
	}

	get $type() {
		return this._$type;
	}

	set $type(value) {
		this._$type = value;
	}

	get $version() {
		return this._$version;
	}

	set $version(value) {
		this._$version = value;
	}

	get $network() {
		return this._$network;
	}

	set $network(value) {
		this._$network = value;
	}

	get $timestamp() {
		return this._$timestamp;
	}

	set $timestamp(value) {
		this._$timestamp = value;
	}

	get $signerPublicKey() {
		return this._$signerPublicKey;
	}

	set $signerPublicKey(value) {
		this._$signerPublicKey = value;
	}

	get $fee() {
		return this._$fee;
	}

	set $fee(value) {
		this._$fee = value;
	}

	get $deadline() {
		return this._$deadline;
	}

	set $deadline(value) {
		this._$deadline = value;
	}

	get $innerTransaction() {
		return this._$innerTransaction;
	}

	set $innerTransaction(value) {
		this._$innerTransaction = value;
	}

	get size() {
		let size = 0;
		size += this.$type.size;
		size += 1;
		size += 2;
		size += this.$network.size;
		size += this.$timestamp.size;
		size += 4;
		size += this.$signerPublicKey.size;
		size += this.$fee.size;
		size += this.$deadline.size;
		size += 4;
		size += this.$innerTransaction.size;
		return size;
	}

	public static function deserialize($payload) {
		const view = new BufferView(payload);
		const $type = TransactionType.deserialize(view.buffer);
		view.shiftRight($type.size);
		const $version = Converter::hexToInt(view.buffer, 1);
		view.shiftRight(1);
		const $entityBodyReserved_1 = Converter::hexToInt(view.buffer, 2);
		view.shiftRight(2);
		if (0 !== $entityBodyReserved_1)
			throw RangeError(`Invalid value of reserved field (${$entityBodyReserved_1})`);
		const $network = NetworkType.deserialize(view.buffer);
		view.shiftRight($network.size);
		const $timestamp = Timestamp.deserialize(view.buffer);
		view.shiftRight($timestamp.size);
		const $signerPublicKeySize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		if (32 !== $signerPublicKeySize)
			throw RangeError(`Invalid value of reserved field (${$signerPublicKeySize})`);
		const $signerPublicKey = PublicKey.deserialize(view.buffer);
		view.shiftRight($signerPublicKey.size);
		const $fee = Amount.deserialize(view.buffer);
		view.shiftRight($fee.size);
		const $deadline = Timestamp.deserialize(view.buffer);
		view.shiftRight($deadline.size);
		const $innerTransactionSize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		// marking sizeof field
		const $innerTransaction = NonVerifiableTransactionFactory.deserialize(view.window(innerTransactionSize));
		view.shiftRight($innerTransaction.size);

		const instance = new NonVerifiableMultisigTransactionV1();
		instance._$type = $type;
		instance._$version = $version;
		instance._$network = $network;
		instance._$timestamp = $timestamp;
		instance._$signerPublicKey = $signerPublicKey;
		instance._$fee = $fee;
		instance._$deadline = $deadline;
		instance._$innerTransaction = $innerTransaction;
		return instance;
	}

	public function serialize() {
		const buffer = new Writer(this.size);
		buffer.write(this._$type.serialize());
		buffer.write(Converter::intToHex(this._$version, 1));
		buffer.write(Converter::intToHex(this._$entityBodyReserved_1, 2));
		buffer.write(this._$network.serialize());
		buffer.write(this._$timestamp.serialize());
		buffer.write(Converter::intToHex(this._$signerPublicKeySize, 4));
		buffer.write(this._$signerPublicKey.serialize());
		buffer.write(this._$fee.serialize());
		buffer.write(this._$deadline.serialize());
		buffer.write(Converter::intToHex(this.$innerTransaction.size, 4)); // bound: inner_transaction_size
		buffer.write(this._$innerTransaction.serialize());
		return buffer.storage;
	}

	toString() {
		let result = '(';
		result += `$type: ${this._$type.toString()}, `;
		result += `$version: ${'0x'.concat(this._$version.toString(16))}, `;
		result += `$network: ${this._$network.toString()}, `;
		result += `$timestamp: ${this._$timestamp.toString()}, `;
		result += `$signerPublicKey: ${this._$signerPublicKey.toString()}, `;
		result += `$fee: ${this._$fee.toString()}, `;
		result += `$deadline: ${this._$deadline.toString()}, `;
		result += `$innerTransaction: ${this._$innerTransaction.toString()}, `;
		result += ')';
		return result;
	}
}

class NamespaceRegistrationTransactionV1 {
	static TRANSACTION_VERSION = 1;

	static TRANSACTION_TYPE = TransactionType.NAMESPACE_REGISTRATION;

	static TYPE_HINTS = {
		$type: 'enum:TransactionType',
		$network: 'enum:NetworkType',
		$timestamp: 'pod:Timestamp',
		$signerPublicKey: 'pod:PublicKey',
		$signature: 'pod:Signature',
		$fee: 'pod:Amount',
		$deadline: 'pod:Timestamp',
		$rentalFeeSink: 'pod:Address',
		$rentalFee: 'pod:Amount',
		$name: 'bytes_array',
		$parentName: 'bytes_array'
	};

	public function __construct() {
		this._$type = NamespaceRegistrationTransactionV1.TRANSACTION_TYPE;
		this._$version = NamespaceRegistrationTransactionV1.TRANSACTION_VERSION;
		this._$network = NetworkType.MAINNET;
		this._$timestamp = new Timestamp();
		this._$signerPublicKey = new PublicKey();
		this._$signature = new Signature();
		this._$fee = new Amount();
		this._$deadline = new Timestamp();
		this._$rentalFeeSink = new Address();
		this._$rentalFee = new Amount();
		this._$name = new Uint8Array();
		this._$parentName = null;
		this._$entityBodyReserved_1 = 0; // reserved field
		this._$signerPublicKeySize = 32; // reserved field
		this._$signatureSize = 64; // reserved field
		this._$rentalFeeSinkSize = 40; // reserved field
	}

	sort() {
	}

	get $type() {
		return this._$type;
	}

	set $type(value) {
		this._$type = value;
	}

	get $version() {
		return this._$version;
	}

	set $version(value) {
		this._$version = value;
	}

	get $network() {
		return this._$network;
	}

	set $network(value) {
		this._$network = value;
	}

	get $timestamp() {
		return this._$timestamp;
	}

	set $timestamp(value) {
		this._$timestamp = value;
	}

	get $signerPublicKey() {
		return this._$signerPublicKey;
	}

	set $signerPublicKey(value) {
		this._$signerPublicKey = value;
	}

	get $signature() {
		return this._$signature;
	}

	set $signature(value) {
		this._$signature = value;
	}

	get $fee() {
		return this._$fee;
	}

	set $fee(value) {
		this._$fee = value;
	}

	get $deadline() {
		return this._$deadline;
	}

	set $deadline(value) {
		this._$deadline = value;
	}

	get $rentalFeeSink() {
		return this._$rentalFeeSink;
	}

	set $rentalFeeSink(value) {
		this._$rentalFeeSink = value;
	}

	get $rentalFee() {
		return this._$rentalFee;
	}

	set $rentalFee(value) {
		this._$rentalFee = value;
	}

	get $name() {
		return this._$name;
	}

	set $name(value) {
		this._$name = value;
	}

	get $parentName() {
		return this._$parentName;
	}

	set $parentName(value) {
		this._$parentName = value;
	}

	get size() {
		let size = 0;
		size += this.$type.size;
		size += 1;
		size += 2;
		size += this.$network.size;
		size += this.$timestamp.size;
		size += 4;
		size += this.$signerPublicKey.size;
		size += 4;
		size += this.$signature.size;
		size += this.$fee.size;
		size += this.$deadline.size;
		size += 4;
		size += this.$rentalFeeSink.size;
		size += this.$rentalFee.size;
		size += 4;
		size += this._$name.length;
		size += 4;
		if (this.$parentName)
			size += this._$parentName.length;

		return size;
	}

	public static function deserialize($payload) {
		const view = new BufferView(payload);
		const $type = TransactionType.deserialize(view.buffer);
		view.shiftRight($type.size);
		const $version = Converter::hexToInt(view.buffer, 1);
		view.shiftRight(1);
		const $entityBodyReserved_1 = Converter::hexToInt(view.buffer, 2);
		view.shiftRight(2);
		if (0 !== $entityBodyReserved_1)
			throw RangeError(`Invalid value of reserved field (${$entityBodyReserved_1})`);
		const $network = NetworkType.deserialize(view.buffer);
		view.shiftRight($network.size);
		const $timestamp = Timestamp.deserialize(view.buffer);
		view.shiftRight($timestamp.size);
		const $signerPublicKeySize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		if (32 !== $signerPublicKeySize)
			throw RangeError(`Invalid value of reserved field (${$signerPublicKeySize})`);
		const $signerPublicKey = PublicKey.deserialize(view.buffer);
		view.shiftRight($signerPublicKey.size);
		const $signatureSize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		if (64 !== $signatureSize)
			throw RangeError(`Invalid value of reserved field (${$signatureSize})`);
		const $signature = Signature.deserialize(view.buffer);
		view.shiftRight($signature.size);
		const $fee = Amount.deserialize(view.buffer);
		view.shiftRight($fee.size);
		const $deadline = Timestamp.deserialize(view.buffer);
		view.shiftRight($deadline.size);
		const $rentalFeeSinkSize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		if (40 !== $rentalFeeSinkSize)
			throw RangeError(`Invalid value of reserved field (${$rentalFeeSinkSize})`);
		const $rentalFeeSink = Address.deserialize(view.buffer);
		view.shiftRight($rentalFeeSink.size);
		const $rentalFee = Amount.deserialize(view.buffer);
		view.shiftRight($rentalFee.size);
		const $nameSize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		const $name = new Uint8Array(view.buffer.buffer, view.buffer.byteOffset, nameSize);
		view.shiftRight(nameSize);
		const $parentNameSize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		let $parentName = null;
		if (4294967295 !== parentNameSize) {
			$parentName = new Uint8Array(view.buffer.buffer, view.buffer.byteOffset, parentNameSize);
			view.shiftRight(parentNameSize);
		}

		const instance = new NamespaceRegistrationTransactionV1();
		instance._$type = $type;
		instance._$version = $version;
		instance._$network = $network;
		instance._$timestamp = $timestamp;
		instance._$signerPublicKey = $signerPublicKey;
		instance._$signature = $signature;
		instance._$fee = $fee;
		instance._$deadline = $deadline;
		instance._$rentalFeeSink = $rentalFeeSink;
		instance._$rentalFee = $rentalFee;
		instance._$name = $name;
		instance._$parentName = $parentName;
		return instance;
	}

	public function serialize() {
		const buffer = new Writer(this.size);
		buffer.write(this._$type.serialize());
		buffer.write(Converter::intToHex(this._$version, 1));
		buffer.write(Converter::intToHex(this._$entityBodyReserved_1, 2));
		buffer.write(this._$network.serialize());
		buffer.write(this._$timestamp.serialize());
		buffer.write(Converter::intToHex(this._$signerPublicKeySize, 4));
		buffer.write(this._$signerPublicKey.serialize());
		buffer.write(Converter::intToHex(this._$signatureSize, 4));
		buffer.write(this._$signature.serialize());
		buffer.write(this._$fee.serialize());
		buffer.write(this._$deadline.serialize());
		buffer.write(Converter::intToHex(this._$rentalFeeSinkSize, 4));
		buffer.write(this._$rentalFeeSink.serialize());
		buffer.write(this._$rentalFee.serialize());
		buffer.write(Converter::intToHex(this._$name.length, 4)); // bound: name_size
		buffer.write(this._$name);
		buffer.write(Converter::intToHex((this._$parentName ? this._$parentName.length : 4294967295), 4)); // bound: parent_name_size
		if (this.$parentName)
			buffer.write(this._$parentName);

		return buffer.storage;
	}

	toString() {
		let result = '(';
		result += `$type: ${this._$type.toString()}, `;
		result += `$version: ${'0x'.concat(this._$version.toString(16))}, `;
		result += `$network: ${this._$network.toString()}, `;
		result += `$timestamp: ${this._$timestamp.toString()}, `;
		result += `$signerPublicKey: ${this._$signerPublicKey.toString()}, `;
		result += `$signature: ${this._$signature.toString()}, `;
		result += `$fee: ${this._$fee.toString()}, `;
		result += `$deadline: ${this._$deadline.toString()}, `;
		result += `$rentalFeeSink: ${this._$rentalFeeSink.toString()}, `;
		result += `$rentalFee: ${this._$rentalFee.toString()}, `;
		result += `$name: hex(${converter.uint8ToHex(this._$name)}), `;
		if (this.$parentName)
			result += `$parentName: hex(${converter.uint8ToHex(this._$parentName)}), `;

		result += ')';
		return result;
	}
}

class NonVerifiableNamespaceRegistrationTransactionV1 {
	static TRANSACTION_VERSION = 1;

	static TRANSACTION_TYPE = TransactionType.NAMESPACE_REGISTRATION;

	static TYPE_HINTS = {
		$type: 'enum:TransactionType',
		$network: 'enum:NetworkType',
		$timestamp: 'pod:Timestamp',
		$signerPublicKey: 'pod:PublicKey',
		$fee: 'pod:Amount',
		$deadline: 'pod:Timestamp',
		$rentalFeeSink: 'pod:Address',
		$rentalFee: 'pod:Amount',
		$name: 'bytes_array',
		$parentName: 'bytes_array'
	};

	public function __construct() {
		this._$type = NonVerifiableNamespaceRegistrationTransactionV1.TRANSACTION_TYPE;
		this._$version = NonVerifiableNamespaceRegistrationTransactionV1.TRANSACTION_VERSION;
		this._$network = NetworkType.MAINNET;
		this._$timestamp = new Timestamp();
		this._$signerPublicKey = new PublicKey();
		this._$fee = new Amount();
		this._$deadline = new Timestamp();
		this._$rentalFeeSink = new Address();
		this._$rentalFee = new Amount();
		this._$name = new Uint8Array();
		this._$parentName = null;
		this._$entityBodyReserved_1 = 0; // reserved field
		this._$signerPublicKeySize = 32; // reserved field
		this._$rentalFeeSinkSize = 40; // reserved field
	}

	sort() {
	}

	get $type() {
		return this._$type;
	}

	set $type(value) {
		this._$type = value;
	}

	get $version() {
		return this._$version;
	}

	set $version(value) {
		this._$version = value;
	}

	get $network() {
		return this._$network;
	}

	set $network(value) {
		this._$network = value;
	}

	get $timestamp() {
		return this._$timestamp;
	}

	set $timestamp(value) {
		this._$timestamp = value;
	}

	get $signerPublicKey() {
		return this._$signerPublicKey;
	}

	set $signerPublicKey(value) {
		this._$signerPublicKey = value;
	}

	get $fee() {
		return this._$fee;
	}

	set $fee(value) {
		this._$fee = value;
	}

	get $deadline() {
		return this._$deadline;
	}

	set $deadline(value) {
		this._$deadline = value;
	}

	get $rentalFeeSink() {
		return this._$rentalFeeSink;
	}

	set $rentalFeeSink(value) {
		this._$rentalFeeSink = value;
	}

	get $rentalFee() {
		return this._$rentalFee;
	}

	set $rentalFee(value) {
		this._$rentalFee = value;
	}

	get $name() {
		return this._$name;
	}

	set $name(value) {
		this._$name = value;
	}

	get $parentName() {
		return this._$parentName;
	}

	set $parentName(value) {
		this._$parentName = value;
	}

	get size() {
		let size = 0;
		size += this.$type.size;
		size += 1;
		size += 2;
		size += this.$network.size;
		size += this.$timestamp.size;
		size += 4;
		size += this.$signerPublicKey.size;
		size += this.$fee.size;
		size += this.$deadline.size;
		size += 4;
		size += this.$rentalFeeSink.size;
		size += this.$rentalFee.size;
		size += 4;
		size += this._$name.length;
		size += 4;
		if (this.$parentName)
			size += this._$parentName.length;

		return size;
	}

	public static function deserialize($payload) {
		const view = new BufferView(payload);
		const $type = TransactionType.deserialize(view.buffer);
		view.shiftRight($type.size);
		const $version = Converter::hexToInt(view.buffer, 1);
		view.shiftRight(1);
		const $entityBodyReserved_1 = Converter::hexToInt(view.buffer, 2);
		view.shiftRight(2);
		if (0 !== $entityBodyReserved_1)
			throw RangeError(`Invalid value of reserved field (${$entityBodyReserved_1})`);
		const $network = NetworkType.deserialize(view.buffer);
		view.shiftRight($network.size);
		const $timestamp = Timestamp.deserialize(view.buffer);
		view.shiftRight($timestamp.size);
		const $signerPublicKeySize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		if (32 !== $signerPublicKeySize)
			throw RangeError(`Invalid value of reserved field (${$signerPublicKeySize})`);
		const $signerPublicKey = PublicKey.deserialize(view.buffer);
		view.shiftRight($signerPublicKey.size);
		const $fee = Amount.deserialize(view.buffer);
		view.shiftRight($fee.size);
		const $deadline = Timestamp.deserialize(view.buffer);
		view.shiftRight($deadline.size);
		const $rentalFeeSinkSize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		if (40 !== $rentalFeeSinkSize)
			throw RangeError(`Invalid value of reserved field (${$rentalFeeSinkSize})`);
		const $rentalFeeSink = Address.deserialize(view.buffer);
		view.shiftRight($rentalFeeSink.size);
		const $rentalFee = Amount.deserialize(view.buffer);
		view.shiftRight($rentalFee.size);
		const $nameSize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		const $name = new Uint8Array(view.buffer.buffer, view.buffer.byteOffset, nameSize);
		view.shiftRight(nameSize);
		const $parentNameSize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		let $parentName = null;
		if (4294967295 !== parentNameSize) {
			$parentName = new Uint8Array(view.buffer.buffer, view.buffer.byteOffset, parentNameSize);
			view.shiftRight(parentNameSize);
		}

		const instance = new NonVerifiableNamespaceRegistrationTransactionV1();
		instance._$type = $type;
		instance._$version = $version;
		instance._$network = $network;
		instance._$timestamp = $timestamp;
		instance._$signerPublicKey = $signerPublicKey;
		instance._$fee = $fee;
		instance._$deadline = $deadline;
		instance._$rentalFeeSink = $rentalFeeSink;
		instance._$rentalFee = $rentalFee;
		instance._$name = $name;
		instance._$parentName = $parentName;
		return instance;
	}

	public function serialize() {
		const buffer = new Writer(this.size);
		buffer.write(this._$type.serialize());
		buffer.write(Converter::intToHex(this._$version, 1));
		buffer.write(Converter::intToHex(this._$entityBodyReserved_1, 2));
		buffer.write(this._$network.serialize());
		buffer.write(this._$timestamp.serialize());
		buffer.write(Converter::intToHex(this._$signerPublicKeySize, 4));
		buffer.write(this._$signerPublicKey.serialize());
		buffer.write(this._$fee.serialize());
		buffer.write(this._$deadline.serialize());
		buffer.write(Converter::intToHex(this._$rentalFeeSinkSize, 4));
		buffer.write(this._$rentalFeeSink.serialize());
		buffer.write(this._$rentalFee.serialize());
		buffer.write(Converter::intToHex(this._$name.length, 4)); // bound: name_size
		buffer.write(this._$name);
		buffer.write(Converter::intToHex((this._$parentName ? this._$parentName.length : 4294967295), 4)); // bound: parent_name_size
		if (this.$parentName)
			buffer.write(this._$parentName);

		return buffer.storage;
	}

	toString() {
		let result = '(';
		result += `$type: ${this._$type.toString()}, `;
		result += `$version: ${'0x'.concat(this._$version.toString(16))}, `;
		result += `$network: ${this._$network.toString()}, `;
		result += `$timestamp: ${this._$timestamp.toString()}, `;
		result += `$signerPublicKey: ${this._$signerPublicKey.toString()}, `;
		result += `$fee: ${this._$fee.toString()}, `;
		result += `$deadline: ${this._$deadline.toString()}, `;
		result += `$rentalFeeSink: ${this._$rentalFeeSink.toString()}, `;
		result += `$rentalFee: ${this._$rentalFee.toString()}, `;
		result += `$name: hex(${converter.uint8ToHex(this._$name)}), `;
		if (this.$parentName)
			result += `$parentName: hex(${converter.uint8ToHex(this._$parentName)}), `;

		result += ')';
		return result;
	}
}

class MessageType {
	static PLAIN = new MessageType(1);

	static ENCRYPTED = new MessageType(2);

	public function __construct(value) {
		this.value = value;
	}

	static valueToKey(value) {
		const values = [
			1, 2
		];
		const keys = [
			'PLAIN', 'ENCRYPTED'
		];

		const index = values.indexOf(value);
		if (-1 === index)
			throw RangeError(`invalid enum value ${value}`);

		return keys[index];
	}

	static fromValue(value) {
		return MessageType[this.valueToKey(value)];
	}

	get size() {
		return 4;
	}

	public static function deserialize($payload) {
		const byteArray = payload;
		return this.fromValue(Converter::hexToInt(byteArray, 4));
	}

	public static function deserializeAligned($payload) {
		const byteArray = payload;
		return this.fromValue(Converter::hexToInt(byteArray, 4));
	}

	public function serialize() {
		return Converter::intToHex(this.value, 4);
	}

	toString() {
		return `MessageType.${MessageType.valueToKey(this.value)}`;
	}
}

class Message {
	static TYPE_HINTS = {
		$messageType: 'enum:MessageType',
		$message: 'bytes_array'
	};

	public function __construct() {
		this._$messageType = MessageType.PLAIN;
		this._$message = new Uint8Array();
	}

	sort() {
	}

	get $messageType() {
		return this._$messageType;
	}

	set $messageType(value) {
		this._$messageType = value;
	}

	get $message() {
		return this._$message;
	}

	set $message(value) {
		this._$message = value;
	}

	get size() {
		let size = 0;
		size += this.$messageType.size;
		size += 4;
		size += this._$message.length;
		return size;
	}

	public static function deserialize($payload) {
		const view = new BufferView(payload);
		const $messageType = MessageType.deserialize(view.buffer);
		view.shiftRight($messageType.size);
		const $messageSize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		const $message = new Uint8Array(view.buffer.buffer, view.buffer.byteOffset, messageSize);
		view.shiftRight(messageSize);

		const instance = new Message();
		instance._$messageType = $messageType;
		instance._$message = $message;
		return instance;
	}

	public function serialize() {
		const buffer = new Writer(this.size);
		buffer.write(this._$messageType.serialize());
		buffer.write(Converter::intToHex(this._$message.length, 4)); // bound: message_size
		buffer.write(this._$message);
		return buffer.storage;
	}

	toString() {
		let result = '(';
		result += `$messageType: ${this._$messageType.toString()}, `;
		result += `$message: hex(${converter.uint8ToHex(this._$message)}), `;
		result += ')';
		return result;
	}
}

class TransferTransactionV1 {
	static TRANSACTION_VERSION = 1;

	static TRANSACTION_TYPE = TransactionType.TRANSFER;

	static TYPE_HINTS = {
		$type: 'enum:TransactionType',
		$network: 'enum:NetworkType',
		$timestamp: 'pod:Timestamp',
		$signerPublicKey: 'pod:PublicKey',
		$signature: 'pod:Signature',
		$fee: 'pod:Amount',
		$deadline: 'pod:Timestamp',
		$recipientAddress: 'pod:Address',
		$amount: 'pod:Amount',
		$message: 'struct:Message'
	};

	public function __construct() {
		this._$type = TransferTransactionV1.TRANSACTION_TYPE;
		this._$version = TransferTransactionV1.TRANSACTION_VERSION;
		this._$network = NetworkType.MAINNET;
		this._$timestamp = new Timestamp();
		this._$signerPublicKey = new PublicKey();
		this._$signature = new Signature();
		this._$fee = new Amount();
		this._$deadline = new Timestamp();
		this._$recipientAddress = new Address();
		this._$amount = new Amount();
		this._$message = null;
		this._$entityBodyReserved_1 = 0; // reserved field
		this._$signerPublicKeySize = 32; // reserved field
		this._$signatureSize = 64; // reserved field
		this._$recipientAddressSize = 40; // reserved field
	}

	sort() {
		if (0 !== this.messageEnvelopeSizeComputed)
			this._$message.sort();
	}

	get $type() {
		return this._$type;
	}

	set $type(value) {
		this._$type = value;
	}

	get $version() {
		return this._$version;
	}

	set $version(value) {
		this._$version = value;
	}

	get $network() {
		return this._$network;
	}

	set $network(value) {
		this._$network = value;
	}

	get $timestamp() {
		return this._$timestamp;
	}

	set $timestamp(value) {
		this._$timestamp = value;
	}

	get $signerPublicKey() {
		return this._$signerPublicKey;
	}

	set $signerPublicKey(value) {
		this._$signerPublicKey = value;
	}

	get $signature() {
		return this._$signature;
	}

	set $signature(value) {
		this._$signature = value;
	}

	get $fee() {
		return this._$fee;
	}

	set $fee(value) {
		this._$fee = value;
	}

	get $deadline() {
		return this._$deadline;
	}

	set $deadline(value) {
		this._$deadline = value;
	}

	get $recipientAddress() {
		return this._$recipientAddress;
	}

	set $recipientAddress(value) {
		this._$recipientAddress = value;
	}

	get $amount() {
		return this._$amount;
	}

	set $amount(value) {
		this._$amount = value;
	}

	get $message() {
		return this._$message;
	}

	set $message(value) {
		this._$message = value;
	}

	get $messageEnvelopeSizeComputed() {
		return this.message ? this.message.size + 0 : 0;
	}

	get size() {
		let size = 0;
		size += this.$type.size;
		size += 1;
		size += 2;
		size += this.$network.size;
		size += this.$timestamp.size;
		size += 4;
		size += this.$signerPublicKey.size;
		size += 4;
		size += this.$signature.size;
		size += this.$fee.size;
		size += this.$deadline.size;
		size += 4;
		size += this.$recipientAddress.size;
		size += this.$amount.size;
		size += 4;
		if (0 !== this.messageEnvelopeSizeComputed)
			size += this.$message.size;

		return size;
	}

	public static function deserialize($payload) {
		const view = new BufferView(payload);
		const $type = TransactionType.deserialize(view.buffer);
		view.shiftRight($type.size);
		const $version = Converter::hexToInt(view.buffer, 1);
		view.shiftRight(1);
		const $entityBodyReserved_1 = Converter::hexToInt(view.buffer, 2);
		view.shiftRight(2);
		if (0 !== $entityBodyReserved_1)
			throw RangeError(`Invalid value of reserved field (${$entityBodyReserved_1})`);
		const $network = NetworkType.deserialize(view.buffer);
		view.shiftRight($network.size);
		const $timestamp = Timestamp.deserialize(view.buffer);
		view.shiftRight($timestamp.size);
		const $signerPublicKeySize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		if (32 !== $signerPublicKeySize)
			throw RangeError(`Invalid value of reserved field (${$signerPublicKeySize})`);
		const $signerPublicKey = PublicKey.deserialize(view.buffer);
		view.shiftRight($signerPublicKey.size);
		const $signatureSize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		if (64 !== $signatureSize)
			throw RangeError(`Invalid value of reserved field (${$signatureSize})`);
		const $signature = Signature.deserialize(view.buffer);
		view.shiftRight($signature.size);
		const $fee = Amount.deserialize(view.buffer);
		view.shiftRight($fee.size);
		const $deadline = Timestamp.deserialize(view.buffer);
		view.shiftRight($deadline.size);
		const $recipientAddressSize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		if (40 !== $recipientAddressSize)
			throw RangeError(`Invalid value of reserved field (${$recipientAddressSize})`);
		const $recipientAddress = Address.deserialize(view.buffer);
		view.shiftRight($recipientAddress.size);
		const $amount = Amount.deserialize(view.buffer);
		view.shiftRight($amount.size);
		const $messageEnvelopeSize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		let $message = null;
		if (0 !== messageEnvelopeSize) {
			$message = Message.deserialize(view.buffer);
			view.shiftRight($message.size);
		}

		const instance = new TransferTransactionV1();
		instance._$type = $type;
		instance._$version = $version;
		instance._$network = $network;
		instance._$timestamp = $timestamp;
		instance._$signerPublicKey = $signerPublicKey;
		instance._$signature = $signature;
		instance._$fee = $fee;
		instance._$deadline = $deadline;
		instance._$recipientAddress = $recipientAddress;
		instance._$amount = $amount;
		instance._$message = $message;
		return instance;
	}

	public function serialize() {
		const buffer = new Writer(this.size);
		buffer.write(this._$type.serialize());
		buffer.write(Converter::intToHex(this._$version, 1));
		buffer.write(Converter::intToHex(this._$entityBodyReserved_1, 2));
		buffer.write(this._$network.serialize());
		buffer.write(this._$timestamp.serialize());
		buffer.write(Converter::intToHex(this._$signerPublicKeySize, 4));
		buffer.write(this._$signerPublicKey.serialize());
		buffer.write(Converter::intToHex(this._$signatureSize, 4));
		buffer.write(this._$signature.serialize());
		buffer.write(this._$fee.serialize());
		buffer.write(this._$deadline.serialize());
		buffer.write(Converter::intToHex(this._$recipientAddressSize, 4));
		buffer.write(this._$recipientAddress.serialize());
		buffer.write(this._$amount.serialize());
		buffer.write(Converter::intToHex(this.$messageEnvelopeSizeComputed, 4));
		if (0 !== this.messageEnvelopeSizeComputed)
			buffer.write(this._$message.serialize());

		return buffer.storage;
	}

	toString() {
		let result = '(';
		result += `$type: ${this._$type.toString()}, `;
		result += `$version: ${'0x'.concat(this._$version.toString(16))}, `;
		result += `$network: ${this._$network.toString()}, `;
		result += `$timestamp: ${this._$timestamp.toString()}, `;
		result += `$signerPublicKey: ${this._$signerPublicKey.toString()}, `;
		result += `$signature: ${this._$signature.toString()}, `;
		result += `$fee: ${this._$fee.toString()}, `;
		result += `$deadline: ${this._$deadline.toString()}, `;
		result += `$recipientAddress: ${this._$recipientAddress.toString()}, `;
		result += `$amount: ${this._$amount.toString()}, `;
		if (0 !== this.messageEnvelopeSizeComputed)
			result += `$message: ${this._$message.toString()}, `;

		result += ')';
		return result;
	}
}

class NonVerifiableTransferTransactionV1 {
	static TRANSACTION_VERSION = 1;

	static TRANSACTION_TYPE = TransactionType.TRANSFER;

	static TYPE_HINTS = {
		$type: 'enum:TransactionType',
		$network: 'enum:NetworkType',
		$timestamp: 'pod:Timestamp',
		$signerPublicKey: 'pod:PublicKey',
		$fee: 'pod:Amount',
		$deadline: 'pod:Timestamp',
		$recipientAddress: 'pod:Address',
		$amount: 'pod:Amount',
		$message: 'struct:Message'
	};

	public function __construct() {
		this._$type = NonVerifiableTransferTransactionV1.TRANSACTION_TYPE;
		this._$version = NonVerifiableTransferTransactionV1.TRANSACTION_VERSION;
		this._$network = NetworkType.MAINNET;
		this._$timestamp = new Timestamp();
		this._$signerPublicKey = new PublicKey();
		this._$fee = new Amount();
		this._$deadline = new Timestamp();
		this._$recipientAddress = new Address();
		this._$amount = new Amount();
		this._$message = null;
		this._$entityBodyReserved_1 = 0; // reserved field
		this._$signerPublicKeySize = 32; // reserved field
		this._$recipientAddressSize = 40; // reserved field
	}

	sort() {
		if (0 !== this.messageEnvelopeSizeComputed)
			this._$message.sort();
	}

	get $type() {
		return this._$type;
	}

	set $type(value) {
		this._$type = value;
	}

	get $version() {
		return this._$version;
	}

	set $version(value) {
		this._$version = value;
	}

	get $network() {
		return this._$network;
	}

	set $network(value) {
		this._$network = value;
	}

	get $timestamp() {
		return this._$timestamp;
	}

	set $timestamp(value) {
		this._$timestamp = value;
	}

	get $signerPublicKey() {
		return this._$signerPublicKey;
	}

	set $signerPublicKey(value) {
		this._$signerPublicKey = value;
	}

	get $fee() {
		return this._$fee;
	}

	set $fee(value) {
		this._$fee = value;
	}

	get $deadline() {
		return this._$deadline;
	}

	set $deadline(value) {
		this._$deadline = value;
	}

	get $recipientAddress() {
		return this._$recipientAddress;
	}

	set $recipientAddress(value) {
		this._$recipientAddress = value;
	}

	get $amount() {
		return this._$amount;
	}

	set $amount(value) {
		this._$amount = value;
	}

	get $message() {
		return this._$message;
	}

	set $message(value) {
		this._$message = value;
	}

	get $messageEnvelopeSizeComputed() {
		return this.message ? this.message.size + 0 : 0;
	}

	get size() {
		let size = 0;
		size += this.$type.size;
		size += 1;
		size += 2;
		size += this.$network.size;
		size += this.$timestamp.size;
		size += 4;
		size += this.$signerPublicKey.size;
		size += this.$fee.size;
		size += this.$deadline.size;
		size += 4;
		size += this.$recipientAddress.size;
		size += this.$amount.size;
		size += 4;
		if (0 !== this.messageEnvelopeSizeComputed)
			size += this.$message.size;

		return size;
	}

	public static function deserialize($payload) {
		const view = new BufferView(payload);
		const $type = TransactionType.deserialize(view.buffer);
		view.shiftRight($type.size);
		const $version = Converter::hexToInt(view.buffer, 1);
		view.shiftRight(1);
		const $entityBodyReserved_1 = Converter::hexToInt(view.buffer, 2);
		view.shiftRight(2);
		if (0 !== $entityBodyReserved_1)
			throw RangeError(`Invalid value of reserved field (${$entityBodyReserved_1})`);
		const $network = NetworkType.deserialize(view.buffer);
		view.shiftRight($network.size);
		const $timestamp = Timestamp.deserialize(view.buffer);
		view.shiftRight($timestamp.size);
		const $signerPublicKeySize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		if (32 !== $signerPublicKeySize)
			throw RangeError(`Invalid value of reserved field (${$signerPublicKeySize})`);
		const $signerPublicKey = PublicKey.deserialize(view.buffer);
		view.shiftRight($signerPublicKey.size);
		const $fee = Amount.deserialize(view.buffer);
		view.shiftRight($fee.size);
		const $deadline = Timestamp.deserialize(view.buffer);
		view.shiftRight($deadline.size);
		const $recipientAddressSize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		if (40 !== $recipientAddressSize)
			throw RangeError(`Invalid value of reserved field (${$recipientAddressSize})`);
		const $recipientAddress = Address.deserialize(view.buffer);
		view.shiftRight($recipientAddress.size);
		const $amount = Amount.deserialize(view.buffer);
		view.shiftRight($amount.size);
		const $messageEnvelopeSize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		let $message = null;
		if (0 !== messageEnvelopeSize) {
			$message = Message.deserialize(view.buffer);
			view.shiftRight($message.size);
		}

		const instance = new NonVerifiableTransferTransactionV1();
		instance._$type = $type;
		instance._$version = $version;
		instance._$network = $network;
		instance._$timestamp = $timestamp;
		instance._$signerPublicKey = $signerPublicKey;
		instance._$fee = $fee;
		instance._$deadline = $deadline;
		instance._$recipientAddress = $recipientAddress;
		instance._$amount = $amount;
		instance._$message = $message;
		return instance;
	}

	public function serialize() {
		const buffer = new Writer(this.size);
		buffer.write(this._$type.serialize());
		buffer.write(Converter::intToHex(this._$version, 1));
		buffer.write(Converter::intToHex(this._$entityBodyReserved_1, 2));
		buffer.write(this._$network.serialize());
		buffer.write(this._$timestamp.serialize());
		buffer.write(Converter::intToHex(this._$signerPublicKeySize, 4));
		buffer.write(this._$signerPublicKey.serialize());
		buffer.write(this._$fee.serialize());
		buffer.write(this._$deadline.serialize());
		buffer.write(Converter::intToHex(this._$recipientAddressSize, 4));
		buffer.write(this._$recipientAddress.serialize());
		buffer.write(this._$amount.serialize());
		buffer.write(Converter::intToHex(this.$messageEnvelopeSizeComputed, 4));
		if (0 !== this.messageEnvelopeSizeComputed)
			buffer.write(this._$message.serialize());

		return buffer.storage;
	}

	toString() {
		let result = '(';
		result += `$type: ${this._$type.toString()}, `;
		result += `$version: ${'0x'.concat(this._$version.toString(16))}, `;
		result += `$network: ${this._$network.toString()}, `;
		result += `$timestamp: ${this._$timestamp.toString()}, `;
		result += `$signerPublicKey: ${this._$signerPublicKey.toString()}, `;
		result += `$fee: ${this._$fee.toString()}, `;
		result += `$deadline: ${this._$deadline.toString()}, `;
		result += `$recipientAddress: ${this._$recipientAddress.toString()}, `;
		result += `$amount: ${this._$amount.toString()}, `;
		if (0 !== this.messageEnvelopeSizeComputed)
			result += `$message: ${this._$message.toString()}, `;

		result += ')';
		return result;
	}
}

class TransferTransactionV2 {
	static TRANSACTION_VERSION = 2;

	static TRANSACTION_TYPE = TransactionType.TRANSFER;

	static TYPE_HINTS = {
		$type: 'enum:TransactionType',
		$network: 'enum:NetworkType',
		$timestamp: 'pod:Timestamp',
		$signerPublicKey: 'pod:PublicKey',
		$signature: 'pod:Signature',
		$fee: 'pod:Amount',
		$deadline: 'pod:Timestamp',
		$recipientAddress: 'pod:Address',
		$amount: 'pod:Amount',
		$message: 'struct:Message',
		$mosaics: 'array[SizePrefixedMosaic]'
	};

	public function __construct() {
		this._$type = TransferTransactionV2.TRANSACTION_TYPE;
		this._$version = TransferTransactionV2.TRANSACTION_VERSION;
		this._$network = NetworkType.MAINNET;
		this._$timestamp = new Timestamp();
		this._$signerPublicKey = new PublicKey();
		this._$signature = new Signature();
		this._$fee = new Amount();
		this._$deadline = new Timestamp();
		this._$recipientAddress = new Address();
		this._$amount = new Amount();
		this._$message = null;
		this._$mosaics = [];
		this._$entityBodyReserved_1 = 0; // reserved field
		this._$signerPublicKeySize = 32; // reserved field
		this._$signatureSize = 64; // reserved field
		this._$recipientAddressSize = 40; // reserved field
	}

	sort() {
		if (0 !== this.messageEnvelopeSizeComputed)
			this._$message.sort();
	}

	get $type() {
		return this._$type;
	}

	set $type(value) {
		this._$type = value;
	}

	get $version() {
		return this._$version;
	}

	set $version(value) {
		this._$version = value;
	}

	get $network() {
		return this._$network;
	}

	set $network(value) {
		this._$network = value;
	}

	get $timestamp() {
		return this._$timestamp;
	}

	set $timestamp(value) {
		this._$timestamp = value;
	}

	get $signerPublicKey() {
		return this._$signerPublicKey;
	}

	set $signerPublicKey(value) {
		this._$signerPublicKey = value;
	}

	get $signature() {
		return this._$signature;
	}

	set $signature(value) {
		this._$signature = value;
	}

	get $fee() {
		return this._$fee;
	}

	set $fee(value) {
		this._$fee = value;
	}

	get $deadline() {
		return this._$deadline;
	}

	set $deadline(value) {
		this._$deadline = value;
	}

	get $recipientAddress() {
		return this._$recipientAddress;
	}

	set $recipientAddress(value) {
		this._$recipientAddress = value;
	}

	get $amount() {
		return this._$amount;
	}

	set $amount(value) {
		this._$amount = value;
	}

	get $message() {
		return this._$message;
	}

	set $message(value) {
		this._$message = value;
	}

	get $mosaics() {
		return this._$mosaics;
	}

	set $mosaics(value) {
		this._$mosaics = value;
	}

	get $messageEnvelopeSizeComputed() {
		return this.message ? this.message.size + 0 : 0;
	}

	get size() {
		let size = 0;
		size += this.$type.size;
		size += 1;
		size += 2;
		size += this.$network.size;
		size += this.$timestamp.size;
		size += 4;
		size += this.$signerPublicKey.size;
		size += 4;
		size += this.$signature.size;
		size += this.$fee.size;
		size += this.$deadline.size;
		size += 4;
		size += this.$recipientAddress.size;
		size += this.$amount.size;
		size += 4;
		if (0 !== this.messageEnvelopeSizeComputed)
			size += this.$message.size;

		size += 4;
		size += arrayHelpers.size(this.$mosaics);
		return size;
	}

	public static function deserialize($payload) {
		const view = new BufferView(payload);
		const $type = TransactionType.deserialize(view.buffer);
		view.shiftRight($type.size);
		const $version = Converter::hexToInt(view.buffer, 1);
		view.shiftRight(1);
		const $entityBodyReserved_1 = Converter::hexToInt(view.buffer, 2);
		view.shiftRight(2);
		if (0 !== $entityBodyReserved_1)
			throw RangeError(`Invalid value of reserved field (${$entityBodyReserved_1})`);
		const $network = NetworkType.deserialize(view.buffer);
		view.shiftRight($network.size);
		const $timestamp = Timestamp.deserialize(view.buffer);
		view.shiftRight($timestamp.size);
		const $signerPublicKeySize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		if (32 !== $signerPublicKeySize)
			throw RangeError(`Invalid value of reserved field (${$signerPublicKeySize})`);
		const $signerPublicKey = PublicKey.deserialize(view.buffer);
		view.shiftRight($signerPublicKey.size);
		const $signatureSize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		if (64 !== $signatureSize)
			throw RangeError(`Invalid value of reserved field (${$signatureSize})`);
		const $signature = Signature.deserialize(view.buffer);
		view.shiftRight($signature.size);
		const $fee = Amount.deserialize(view.buffer);
		view.shiftRight($fee.size);
		const $deadline = Timestamp.deserialize(view.buffer);
		view.shiftRight($deadline.size);
		const $recipientAddressSize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		if (40 !== $recipientAddressSize)
			throw RangeError(`Invalid value of reserved field (${$recipientAddressSize})`);
		const $recipientAddress = Address.deserialize(view.buffer);
		view.shiftRight($recipientAddress.size);
		const $amount = Amount.deserialize(view.buffer);
		view.shiftRight($amount.size);
		const $messageEnvelopeSize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		let $message = null;
		if (0 !== messageEnvelopeSize) {
			$message = Message.deserialize(view.buffer);
			view.shiftRight($message.size);
		}
		const $mosaicsCount = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		const $mosaics = arrayHelpers.readArrayCount(view.buffer, SizePrefixedMosaic, mosaicsCount);
		view.shiftRight(arrayHelpers.size($mosaics));

		const instance = new TransferTransactionV2();
		instance._$type = $type;
		instance._$version = $version;
		instance._$network = $network;
		instance._$timestamp = $timestamp;
		instance._$signerPublicKey = $signerPublicKey;
		instance._$signature = $signature;
		instance._$fee = $fee;
		instance._$deadline = $deadline;
		instance._$recipientAddress = $recipientAddress;
		instance._$amount = $amount;
		instance._$message = $message;
		instance._$mosaics = $mosaics;
		return instance;
	}

	public function serialize() {
		const buffer = new Writer(this.size);
		buffer.write(this._$type.serialize());
		buffer.write(Converter::intToHex(this._$version, 1));
		buffer.write(Converter::intToHex(this._$entityBodyReserved_1, 2));
		buffer.write(this._$network.serialize());
		buffer.write(this._$timestamp.serialize());
		buffer.write(Converter::intToHex(this._$signerPublicKeySize, 4));
		buffer.write(this._$signerPublicKey.serialize());
		buffer.write(Converter::intToHex(this._$signatureSize, 4));
		buffer.write(this._$signature.serialize());
		buffer.write(this._$fee.serialize());
		buffer.write(this._$deadline.serialize());
		buffer.write(Converter::intToHex(this._$recipientAddressSize, 4));
		buffer.write(this._$recipientAddress.serialize());
		buffer.write(this._$amount.serialize());
		buffer.write(Converter::intToHex(this.$messageEnvelopeSizeComputed, 4));
		if (0 !== this.messageEnvelopeSizeComputed)
			buffer.write(this._$message.serialize());

		buffer.write(Converter::intToHex(this._$mosaics.length, 4)); // bound: mosaics_count
		arrayHelpers.writeArray(buffer, this._$mosaics);
		return buffer.storage;
	}

	toString() {
		let result = '(';
		result += `$type: ${this._$type.toString()}, `;
		result += `$version: ${'0x'.concat(this._$version.toString(16))}, `;
		result += `$network: ${this._$network.toString()}, `;
		result += `$timestamp: ${this._$timestamp.toString()}, `;
		result += `$signerPublicKey: ${this._$signerPublicKey.toString()}, `;
		result += `$signature: ${this._$signature.toString()}, `;
		result += `$fee: ${this._$fee.toString()}, `;
		result += `$deadline: ${this._$deadline.toString()}, `;
		result += `$recipientAddress: ${this._$recipientAddress.toString()}, `;
		result += `$amount: ${this._$amount.toString()}, `;
		if (0 !== this.messageEnvelopeSizeComputed)
			result += `$message: ${this._$message.toString()}, `;

		result += `$mosaics: [${this._$mosaics.map(e => e.toString()).join(',')}], `;
		result += ')';
		return result;
	}
}

class NonVerifiableTransferTransactionV2 {
	static TRANSACTION_VERSION = 2;

	static TRANSACTION_TYPE = TransactionType.TRANSFER;

	static TYPE_HINTS = {
		$type: 'enum:TransactionType',
		$network: 'enum:NetworkType',
		$timestamp: 'pod:Timestamp',
		$signerPublicKey: 'pod:PublicKey',
		$fee: 'pod:Amount',
		$deadline: 'pod:Timestamp',
		$recipientAddress: 'pod:Address',
		$amount: 'pod:Amount',
		$message: 'struct:Message',
		$mosaics: 'array[SizePrefixedMosaic]'
	};

	public function __construct() {
		this._$type = NonVerifiableTransferTransactionV2.TRANSACTION_TYPE;
		this._$version = NonVerifiableTransferTransactionV2.TRANSACTION_VERSION;
		this._$network = NetworkType.MAINNET;
		this._$timestamp = new Timestamp();
		this._$signerPublicKey = new PublicKey();
		this._$fee = new Amount();
		this._$deadline = new Timestamp();
		this._$recipientAddress = new Address();
		this._$amount = new Amount();
		this._$message = null;
		this._$mosaics = [];
		this._$entityBodyReserved_1 = 0; // reserved field
		this._$signerPublicKeySize = 32; // reserved field
		this._$recipientAddressSize = 40; // reserved field
	}

	sort() {
		if (0 !== this.messageEnvelopeSizeComputed)
			this._$message.sort();
	}

	get $type() {
		return this._$type;
	}

	set $type(value) {
		this._$type = value;
	}

	get $version() {
		return this._$version;
	}

	set $version(value) {
		this._$version = value;
	}

	get $network() {
		return this._$network;
	}

	set $network(value) {
		this._$network = value;
	}

	get $timestamp() {
		return this._$timestamp;
	}

	set $timestamp(value) {
		this._$timestamp = value;
	}

	get $signerPublicKey() {
		return this._$signerPublicKey;
	}

	set $signerPublicKey(value) {
		this._$signerPublicKey = value;
	}

	get $fee() {
		return this._$fee;
	}

	set $fee(value) {
		this._$fee = value;
	}

	get $deadline() {
		return this._$deadline;
	}

	set $deadline(value) {
		this._$deadline = value;
	}

	get $recipientAddress() {
		return this._$recipientAddress;
	}

	set $recipientAddress(value) {
		this._$recipientAddress = value;
	}

	get $amount() {
		return this._$amount;
	}

	set $amount(value) {
		this._$amount = value;
	}

	get $message() {
		return this._$message;
	}

	set $message(value) {
		this._$message = value;
	}

	get $mosaics() {
		return this._$mosaics;
	}

	set $mosaics(value) {
		this._$mosaics = value;
	}

	get $messageEnvelopeSizeComputed() {
		return this.message ? this.message.size + 0 : 0;
	}

	get size() {
		let size = 0;
		size += this.$type.size;
		size += 1;
		size += 2;
		size += this.$network.size;
		size += this.$timestamp.size;
		size += 4;
		size += this.$signerPublicKey.size;
		size += this.$fee.size;
		size += this.$deadline.size;
		size += 4;
		size += this.$recipientAddress.size;
		size += this.$amount.size;
		size += 4;
		if (0 !== this.messageEnvelopeSizeComputed)
			size += this.$message.size;

		size += 4;
		size += arrayHelpers.size(this.$mosaics);
		return size;
	}

	public static function deserialize($payload) {
		const view = new BufferView(payload);
		const $type = TransactionType.deserialize(view.buffer);
		view.shiftRight($type.size);
		const $version = Converter::hexToInt(view.buffer, 1);
		view.shiftRight(1);
		const $entityBodyReserved_1 = Converter::hexToInt(view.buffer, 2);
		view.shiftRight(2);
		if (0 !== $entityBodyReserved_1)
			throw RangeError(`Invalid value of reserved field (${$entityBodyReserved_1})`);
		const $network = NetworkType.deserialize(view.buffer);
		view.shiftRight($network.size);
		const $timestamp = Timestamp.deserialize(view.buffer);
		view.shiftRight($timestamp.size);
		const $signerPublicKeySize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		if (32 !== $signerPublicKeySize)
			throw RangeError(`Invalid value of reserved field (${$signerPublicKeySize})`);
		const $signerPublicKey = PublicKey.deserialize(view.buffer);
		view.shiftRight($signerPublicKey.size);
		const $fee = Amount.deserialize(view.buffer);
		view.shiftRight($fee.size);
		const $deadline = Timestamp.deserialize(view.buffer);
		view.shiftRight($deadline.size);
		const $recipientAddressSize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		if (40 !== $recipientAddressSize)
			throw RangeError(`Invalid value of reserved field (${$recipientAddressSize})`);
		const $recipientAddress = Address.deserialize(view.buffer);
		view.shiftRight($recipientAddress.size);
		const $amount = Amount.deserialize(view.buffer);
		view.shiftRight($amount.size);
		const $messageEnvelopeSize = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		let $message = null;
		if (0 !== messageEnvelopeSize) {
			$message = Message.deserialize(view.buffer);
			view.shiftRight($message.size);
		}
		const $mosaicsCount = Converter::hexToInt(view.buffer, 4);
		view.shiftRight(4);
		const $mosaics = arrayHelpers.readArrayCount(view.buffer, SizePrefixedMosaic, mosaicsCount);
		view.shiftRight(arrayHelpers.size($mosaics));

		const instance = new NonVerifiableTransferTransactionV2();
		instance._$type = $type;
		instance._$version = $version;
		instance._$network = $network;
		instance._$timestamp = $timestamp;
		instance._$signerPublicKey = $signerPublicKey;
		instance._$fee = $fee;
		instance._$deadline = $deadline;
		instance._$recipientAddress = $recipientAddress;
		instance._$amount = $amount;
		instance._$message = $message;
		instance._$mosaics = $mosaics;
		return instance;
	}

	public function serialize() {
		const buffer = new Writer(this.size);
		buffer.write(this._$type.serialize());
		buffer.write(Converter::intToHex(this._$version, 1));
		buffer.write(Converter::intToHex(this._$entityBodyReserved_1, 2));
		buffer.write(this._$network.serialize());
		buffer.write(this._$timestamp.serialize());
		buffer.write(Converter::intToHex(this._$signerPublicKeySize, 4));
		buffer.write(this._$signerPublicKey.serialize());
		buffer.write(this._$fee.serialize());
		buffer.write(this._$deadline.serialize());
		buffer.write(Converter::intToHex(this._$recipientAddressSize, 4));
		buffer.write(this._$recipientAddress.serialize());
		buffer.write(this._$amount.serialize());
		buffer.write(Converter::intToHex(this.$messageEnvelopeSizeComputed, 4));
		if (0 !== this.messageEnvelopeSizeComputed)
			buffer.write(this._$message.serialize());

		buffer.write(Converter::intToHex(this._$mosaics.length, 4)); // bound: mosaics_count
		arrayHelpers.writeArray(buffer, this._$mosaics);
		return buffer.storage;
	}

	toString() {
		let result = '(';
		result += `$type: ${this._$type.toString()}, `;
		result += `$version: ${'0x'.concat(this._$version.toString(16))}, `;
		result += `$network: ${this._$network.toString()}, `;
		result += `$timestamp: ${this._$timestamp.toString()}, `;
		result += `$signerPublicKey: ${this._$signerPublicKey.toString()}, `;
		result += `$fee: ${this._$fee.toString()}, `;
		result += `$deadline: ${this._$deadline.toString()}, `;
		result += `$recipientAddress: ${this._$recipientAddress.toString()}, `;
		result += `$amount: ${this._$amount.toString()}, `;
		if (0 !== this.messageEnvelopeSizeComputed)
			result += `$message: ${this._$message.toString()}, `;

		result += `$mosaics: [${this._$mosaics.map(e => e.toString()).join(',')}], `;
		result += ')';
		return result;
	}
}

class TransactionFactory {
	static toKey(values) {
		if (1 === values.length)
			return values[0];

		// assume each key is at most 32bits
		return values.map(n => BigInt(n)).reduce((accumulator, value) => (accumulator << 32n) + value);
	}

	static deserialize(payload) {
		const view = new BufferView(payload);
		const $parent = TransactionFactory.deserialize(view.buffer);
		const mapping = new Map();
		mapping.set(TransactionFactory.toKey([AccountKeyLinkTransactionV1.TRANSACTION_TYPE.value, AccountKeyLinkTransactionV1.TRANSACTION_VERSION]), AccountKeyLinkTransactionV1);
		mapping.set(TransactionFactory.toKey([MosaicDefinitionTransactionV1.TRANSACTION_TYPE.value, MosaicDefinitionTransactionV1.TRANSACTION_VERSION]), MosaicDefinitionTransactionV1);
		mapping.set(TransactionFactory.toKey([MosaicSupplyChangeTransactionV1.TRANSACTION_TYPE.value, MosaicSupplyChangeTransactionV1.TRANSACTION_VERSION]), MosaicSupplyChangeTransactionV1);
		mapping.set(TransactionFactory.toKey([MultisigAccountModificationTransactionV1.TRANSACTION_TYPE.value, MultisigAccountModificationTransactionV1.TRANSACTION_VERSION]), MultisigAccountModificationTransactionV1);
		mapping.set(TransactionFactory.toKey([MultisigAccountModificationTransactionV2.TRANSACTION_TYPE.value, MultisigAccountModificationTransactionV2.TRANSACTION_VERSION]), MultisigAccountModificationTransactionV2);
		mapping.set(TransactionFactory.toKey([CosignatureV1.TRANSACTION_TYPE.value, CosignatureV1.TRANSACTION_VERSION]), CosignatureV1);
		mapping.set(TransactionFactory.toKey([MultisigTransactionV1.TRANSACTION_TYPE.value, MultisigTransactionV1.TRANSACTION_VERSION]), MultisigTransactionV1);
		mapping.set(TransactionFactory.toKey([NamespaceRegistrationTransactionV1.TRANSACTION_TYPE.value, NamespaceRegistrationTransactionV1.TRANSACTION_VERSION]), NamespaceRegistrationTransactionV1);
		mapping.set(TransactionFactory.toKey([TransferTransactionV1.TRANSACTION_TYPE.value, TransferTransactionV1.TRANSACTION_VERSION]), TransferTransactionV1);
		mapping.set(TransactionFactory.toKey([TransferTransactionV2.TRANSACTION_TYPE.value, TransferTransactionV2.TRANSACTION_VERSION]), TransferTransactionV2);
		const discriminator = TransactionFactory.toKey([$parent.$type.value, $parent.$version]);
		const factory_class = mapping.get(discriminator);
		return factory_class.deserialize(view.buffer);
	}

	static createByName(entityName) {
		const mapping = {
			account_key_link_transaction_v1: AccountKeyLinkTransactionV1,
			mosaic_definition_transaction_v1: MosaicDefinitionTransactionV1,
			mosaic_supply_change_transaction_v1: MosaicSupplyChangeTransactionV1,
			multisig_account_modification_transaction_v1: MultisigAccountModificationTransactionV1,
			multisig_account_modification_transaction_v2: MultisigAccountModificationTransactionV2,
			cosignature_v1: CosignatureV1,
			multisig_transaction_v1: MultisigTransactionV1,
			namespace_registration_transaction_v1: NamespaceRegistrationTransactionV1,
			transfer_transaction_v1: TransferTransactionV1,
			transfer_transaction_v2: TransferTransactionV2
		};

		if (!Object.prototype.hasOwnProperty.call(mapping, entityName))
			throw RangeError(`unknown Transaction type ${entityName}`);

		return new mapping[entityName]();
	}
}

class NonVerifiableTransactionFactory {
	static toKey(values) {
		if (1 === values.length)
			return values[0];

		// assume each key is at most 32bits
		return values.map(n => BigInt(n)).reduce((accumulator, value) => (accumulator << 32n) + value);
	}

	static deserialize(payload) {
		const view = new BufferView(payload);
		const $parent = NonVerifiableTransactionFactory.deserialize(view.buffer);
		const mapping = new Map();
		mapping.set(NonVerifiableTransactionFactory.toKey([NonVerifiableAccountKeyLinkTransactionV1.TRANSACTION_TYPE.value, NonVerifiableAccountKeyLinkTransactionV1.TRANSACTION_VERSION]), NonVerifiableAccountKeyLinkTransactionV1);
		mapping.set(NonVerifiableTransactionFactory.toKey([NonVerifiableMosaicDefinitionTransactionV1.TRANSACTION_TYPE.value, NonVerifiableMosaicDefinitionTransactionV1.TRANSACTION_VERSION]), NonVerifiableMosaicDefinitionTransactionV1);
		mapping.set(NonVerifiableTransactionFactory.toKey([NonVerifiableMosaicSupplyChangeTransactionV1.TRANSACTION_TYPE.value, NonVerifiableMosaicSupplyChangeTransactionV1.TRANSACTION_VERSION]), NonVerifiableMosaicSupplyChangeTransactionV1);
		mapping.set(NonVerifiableTransactionFactory.toKey([NonVerifiableMultisigAccountModificationTransactionV1.TRANSACTION_TYPE.value, NonVerifiableMultisigAccountModificationTransactionV1.TRANSACTION_VERSION]), NonVerifiableMultisigAccountModificationTransactionV1);
		mapping.set(NonVerifiableTransactionFactory.toKey([NonVerifiableMultisigAccountModificationTransactionV2.TRANSACTION_TYPE.value, NonVerifiableMultisigAccountModificationTransactionV2.TRANSACTION_VERSION]), NonVerifiableMultisigAccountModificationTransactionV2);
		mapping.set(NonVerifiableTransactionFactory.toKey([NonVerifiableMultisigTransactionV1.TRANSACTION_TYPE.value, NonVerifiableMultisigTransactionV1.TRANSACTION_VERSION]), NonVerifiableMultisigTransactionV1);
		mapping.set(NonVerifiableTransactionFactory.toKey([NonVerifiableNamespaceRegistrationTransactionV1.TRANSACTION_TYPE.value, NonVerifiableNamespaceRegistrationTransactionV1.TRANSACTION_VERSION]), NonVerifiableNamespaceRegistrationTransactionV1);
		mapping.set(NonVerifiableTransactionFactory.toKey([NonVerifiableTransferTransactionV1.TRANSACTION_TYPE.value, NonVerifiableTransferTransactionV1.TRANSACTION_VERSION]), NonVerifiableTransferTransactionV1);
		mapping.set(NonVerifiableTransactionFactory.toKey([NonVerifiableTransferTransactionV2.TRANSACTION_TYPE.value, NonVerifiableTransferTransactionV2.TRANSACTION_VERSION]), NonVerifiableTransferTransactionV2);
		const discriminator = NonVerifiableTransactionFactory.toKey([$parent.$type.value, $parent.$version]);
		const factory_class = mapping.get(discriminator);
		return factory_class.deserialize(view.buffer);
	}

	static createByName(entityName) {
		const mapping = {
			non_verifiable_account_key_link_transaction_v1: NonVerifiableAccountKeyLinkTransactionV1,
			non_verifiable_mosaic_definition_transaction_v1: NonVerifiableMosaicDefinitionTransactionV1,
			non_verifiable_mosaic_supply_change_transaction_v1: NonVerifiableMosaicSupplyChangeTransactionV1,
			non_verifiable_multisig_account_modification_transaction_v1: NonVerifiableMultisigAccountModificationTransactionV1,
			non_verifiable_multisig_account_modification_transaction_v2: NonVerifiableMultisigAccountModificationTransactionV2,
			non_verifiable_multisig_transaction_v1: NonVerifiableMultisigTransactionV1,
			non_verifiable_namespace_registration_transaction_v1: NonVerifiableNamespaceRegistrationTransactionV1,
			non_verifiable_transfer_transaction_v1: NonVerifiableTransferTransactionV1,
			non_verifiable_transfer_transaction_v2: NonVerifiableTransferTransactionV2
		};

		if (!Object.prototype.hasOwnProperty.call(mapping, entityName))
			throw RangeError(`unknown NonVerifiableTransaction type ${entityName}`);

		return new mapping[entityName]();
	}
}
