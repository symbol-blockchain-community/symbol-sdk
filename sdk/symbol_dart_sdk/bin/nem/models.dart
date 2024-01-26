import '../BaseValue.dart';
import '../ByteArray.dart';
import '../models/IDeserializable.dart';
import '../models/IEmbeddedTransaction.dart';
import '../models/INonVerifiableTransaction.dart';
import '../models/StructBase.dart';
import '../utils/converter.dart';
import '../utils/arrayHelpers.dart';
import '../utils/transform.dart';
import 'dart:typed_data';
import 'package:convert/convert.dart';
import 'package:tuple/tuple.dart';

class Amount extends BaseValue implements IDeserializable {
	static const int SIZE = 8;

	Amount([dynamic amount]) : super(SIZE, amount ?? 0);

	@override
	Amount deserialize(Uint8List payload) {
		return Amount(bytesToInt(payload.sublist(0, 8), 8));
	}

	Uint8List serialize() {
		var buffer = Uint8List(SIZE);
		buffer.setRange(0, 0 + 8, intToBytes(value, 8));
		return buffer;
	}
}


class Height extends BaseValue implements IDeserializable {
	static const int SIZE = 8;

	Height([dynamic height]) : super(SIZE, height ?? 0);

	@override
	Height deserialize(Uint8List payload) {
		return Height(bytesToInt(payload.sublist(0, 8), 8));
	}

	Uint8List serialize() {
		var buffer = Uint8List(SIZE);
		buffer.setRange(0, 0 + 8, intToBytes(value, 8));
		return buffer;
	}
}


class Timestamp extends BaseValue implements IDeserializable {
	static const int SIZE = 4;

	Timestamp([dynamic timestamp]) : super(SIZE, timestamp ?? 0);

	@override
	Timestamp deserialize(Uint8List payload) {
		return Timestamp(bytesToInt(payload.sublist(0, 4), 4));
	}

	Uint8List serialize() {
		var buffer = Uint8List(SIZE);
		buffer.setRange(0, 0 + 4, intToBytes(value, 4));
		return buffer;
	}
}


class Address extends ByteArray implements IDeserializable {
	static const int SIZE = 40;

	Address([dynamic address]) : super(SIZE, address ?? Uint8List(40));

	int get size {
		return 40;
	}

	@override
	Address deserialize(Uint8List payload) {
		payload = payload.sublist(0, SIZE);
		return Address(Uint8List.fromList(payload));
	}

	Uint8List serialize() {
		return bytes;
	}
}


class Hash256 extends ByteArray implements IDeserializable {
	static const int SIZE = 32;

	Hash256([dynamic hash256]) : super(SIZE, hash256 ?? Uint8List(32));

	int get size {
		return 32;
	}

	@override
	Hash256 deserialize(Uint8List payload) {
		payload = payload.sublist(0, SIZE);
		return Hash256(Uint8List.fromList(payload));
	}

	Uint8List serialize() {
		return bytes;
	}
}


class PublicKey extends ByteArray implements IDeserializable {
	static const int SIZE = 32;

	PublicKey([dynamic publicKey]) : super(SIZE, publicKey ?? Uint8List(32));

	int get size {
		return 32;
	}

	@override
	PublicKey deserialize(Uint8List payload) {
		payload = payload.sublist(0, SIZE);
		return PublicKey(Uint8List.fromList(payload));
	}

	Uint8List serialize() {
		return bytes;
	}
}


class Signature extends ByteArray implements IDeserializable {
	static const int SIZE = 64;

	Signature([dynamic signature]) : super(SIZE, signature ?? Uint8List(64));

	int get size {
		return 64;
	}

	@override
	Signature deserialize(Uint8List payload) {
		payload = payload.sublist(0, SIZE);
		return Signature(Uint8List.fromList(payload));
	}

	Uint8List serialize() {
		return bytes;
	}
}


class NetworkType implements IDeserializable {
	static final MAINNET = NetworkType(104);
	static final TESTNET = NetworkType(152);

	final int value;

	static final _flags = {
		104: 'MAINNET',
		152: 'TESTNET',
	};

	NetworkType([int? _value]) : value = _value ?? 104;

	int get size {
		return 1;
	}

	@override
	NetworkType deserialize(Uint8List payload) {
		var byteData = ByteData.sublistView(payload);
		return NetworkType(byteData.getUint8(0));
	}

	Uint8List serialize() {
		var byteData = ByteData(1)..setUint8(0, value);
		return byteData.buffer.asUint8List();
	}

	@override
	String toString() {
		return 'NetworkType.${_flags[value]}';
	}
}


class TransactionType implements IDeserializable {
	static final TRANSFER = TransactionType(257);
	static final ACCOUNT_KEY_LINK = TransactionType(2049);
	static final MULTISIG_ACCOUNT_MODIFICATION = TransactionType(4097);
	static final MULTISIG_COSIGNATURE = TransactionType(4098);
	static final MULTISIG = TransactionType(4100);
	static final NAMESPACE_REGISTRATION = TransactionType(8193);
	static final MOSAIC_DEFINITION = TransactionType(16385);
	static final MOSAIC_SUPPLY_CHANGE = TransactionType(16386);

	final int value;

	static final _flags = {
		257: 'TRANSFER',
		2049: 'ACCOUNT_KEY_LINK',
		4097: 'MULTISIG_ACCOUNT_MODIFICATION',
		4098: 'MULTISIG_COSIGNATURE',
		4100: 'MULTISIG',
		8193: 'NAMESPACE_REGISTRATION',
		16385: 'MOSAIC_DEFINITION',
		16386: 'MOSAIC_SUPPLY_CHANGE',
	};

	TransactionType([int? _value]) : value = _value ?? 257;

	int get size {
		return 4;
	}

	@override
	TransactionType deserialize(Uint8List payload) {
		var byteData = ByteData.sublistView(payload);
		return TransactionType(byteData.getUint32(0, Endian.little));
	}

	Uint8List serialize() {
		var byteData = ByteData(4)..setUint32(0, value, Endian.little);
		return byteData.buffer.asUint8List();
	}

	@override
	String toString() {
		return 'TransactionType.${_flags[value]}';
	}
}


class Transaction extends StructBase implements IDeserializable {

	static const Map<String, String> TYPE_HINTS = {
		'type': 'enum:TransactionType',
		'network': 'enum:NetworkType',
		'timestamp': 'pod:Timestamp',
		'signerPublicKey': 'pod:PublicKey',
		'signature': 'pod:Signature',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp'
	};

	TransactionType _type = TransactionType.TRANSFER;
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	Timestamp _timestamp = Timestamp();
	PublicKey _signerPublicKey = PublicKey();
	Signature _signature = Signature();
	Amount _fee = Amount();
	Timestamp _deadline = Timestamp();
	final int _entityBodyReserved_1 = 0; // reserved field
	final int _signerPublicKeySize = 32; // reserved field
	final int _signatureSize = 64; // reserved field

	Transaction({ 
	TransactionType? type,
	int? version,
	NetworkType? network,
	Timestamp? timestamp,
	PublicKey? signerPublicKey,
	Signature? signature,
	Amount? fee,
	Timestamp? deadline
	}) 
		: super(type == null && version == null && network == null && timestamp == null && signerPublicKey == null && signature == null && fee == null && deadline == null )
	{
		_type = type ?? TransactionType.TRANSFER;
		_version = version ?? 0;
		_network = network ?? NetworkType.MAINNET;
		_timestamp = timestamp ?? Timestamp();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_signature = signature ?? Signature();
		_fee = fee ?? Amount();
		_deadline = deadline ?? Timestamp();
	}

	void sort() {
		// empty body
	}

	TransactionType get type {
		return _type;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	Timestamp get timestamp {
		return _timestamp;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	Signature get signature {
		return _signature;
	}

	Amount get fee {
		return _fee;
	}

	Timestamp get deadline {
		return _deadline;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set timestamp(Timestamp value) {
		_timestamp = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set signature(Signature value) {
		_signature = value;
	}

	set fee(Amount value) {
		_fee = value;
	}

	set deadline(Timestamp value) {
		_deadline = value;
	}

	int get size {
		var size = 0;
		size += type.size;
		size += 1;
		size += 2;
		size += network.size;
		size += timestamp.size;
		size += 4;
		size += signerPublicKey.size;
		size += 4;
		size += signature.size;
		size += fee.size;
		size += deadline.size;
		return size;
	}

	@override
	Transaction deserialize(Uint8List payload) {
		var buffer = payload;
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var timestamp = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(timestamp.size);
		var signerPublicKeySize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (32 != signerPublicKeySize) {
			throw RangeError('Invalid value of reserved field ($signerPublicKeySize)');
		}
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var signatureSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (64 != signatureSize) {
			throw RangeError('Invalid value of reserved field ($signatureSize)');
		}
		var signature = Signature().deserialize(buffer);
		buffer = buffer.sublist(signature.size);
		var fee = Amount().deserialize(buffer);
		buffer = buffer.sublist(fee.size);
		var deadline = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(deadline.size);

		var instance = Transaction(
			type: type,
			version: version,
			network: network,
			timestamp: timestamp,
			signerPublicKey: signerPublicKey,
			signature: signature,
			fee: fee,
			deadline: deadline,
		);
		return instance;
	}

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_entityBodyReserved_1, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _timestamp.size, _timestamp.serialize());
		currentPos += timestamp.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_signerPublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_signatureSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signature.size, _signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());
		currentPos += deadline.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'Transaction(';
		result += 'type: "${_type.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'timestamp: "${_timestamp.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'signature: "${_signature.toString()}", ';
		result += 'fee: "${_fee.toString()}", ';
		result += 'deadline: "${_deadline.toString()}", ';
		result += ')';
		return result;
	}
}


class NonVerifiableTransaction extends StructBase implements IDeserializable, INonVerifiableTransaction {

	static const Map<String, String> TYPE_HINTS = {
		'type': 'enum:TransactionType',
		'network': 'enum:NetworkType',
		'timestamp': 'pod:Timestamp',
		'signerPublicKey': 'pod:PublicKey',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp'
	};

	TransactionType _type = TransactionType.TRANSFER;
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	Timestamp _timestamp = Timestamp();
	PublicKey _signerPublicKey = PublicKey();
	Amount _fee = Amount();
	Timestamp _deadline = Timestamp();
	final int _entityBodyReserved_1 = 0; // reserved field
	final int _signerPublicKeySize = 32; // reserved field

	NonVerifiableTransaction({ 
	TransactionType? type,
	int? version,
	NetworkType? network,
	Timestamp? timestamp,
	PublicKey? signerPublicKey,
	Amount? fee,
	Timestamp? deadline
	}) 
		: super(type == null && version == null && network == null && timestamp == null && signerPublicKey == null && fee == null && deadline == null )
	{
		_type = type ?? TransactionType.TRANSFER;
		_version = version ?? 0;
		_network = network ?? NetworkType.MAINNET;
		_timestamp = timestamp ?? Timestamp();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_fee = fee ?? Amount();
		_deadline = deadline ?? Timestamp();
	}

	void sort() {
		// empty body
	}

	TransactionType get type {
		return _type;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	Timestamp get timestamp {
		return _timestamp;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	Amount get fee {
		return _fee;
	}

	Timestamp get deadline {
		return _deadline;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set timestamp(Timestamp value) {
		_timestamp = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set fee(Amount value) {
		_fee = value;
	}

	set deadline(Timestamp value) {
		_deadline = value;
	}

	int get size {
		var size = 0;
		size += type.size;
		size += 1;
		size += 2;
		size += network.size;
		size += timestamp.size;
		size += 4;
		size += signerPublicKey.size;
		size += fee.size;
		size += deadline.size;
		return size;
	}

	@override
	NonVerifiableTransaction deserialize(Uint8List payload) {
		var buffer = payload;
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var timestamp = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(timestamp.size);
		var signerPublicKeySize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (32 != signerPublicKeySize) {
			throw RangeError('Invalid value of reserved field ($signerPublicKeySize)');
		}
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var fee = Amount().deserialize(buffer);
		buffer = buffer.sublist(fee.size);
		var deadline = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(deadline.size);

		var instance = NonVerifiableTransaction(
			type: type,
			version: version,
			network: network,
			timestamp: timestamp,
			signerPublicKey: signerPublicKey,
			fee: fee,
			deadline: deadline,
		);
		return instance;
	}

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_entityBodyReserved_1, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _timestamp.size, _timestamp.serialize());
		currentPos += timestamp.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_signerPublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());
		currentPos += deadline.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'NonVerifiableTransaction(';
		result += 'type: "${_type.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'timestamp: "${_timestamp.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'fee: "${_fee.toString()}", ';
		result += 'deadline: "${_deadline.toString()}", ';
		result += ')';
		return result;
	}
}


class LinkAction implements IDeserializable {
	static final LINK = LinkAction(1);
	static final UNLINK = LinkAction(2);

	final int value;

	static final _flags = {
		1: 'LINK',
		2: 'UNLINK',
	};

	LinkAction([int? _value]) : value = _value ?? 1;

	int get size {
		return 4;
	}

	@override
	LinkAction deserialize(Uint8List payload) {
		var byteData = ByteData.sublistView(payload);
		return LinkAction(byteData.getUint32(0, Endian.little));
	}

	Uint8List serialize() {
		var byteData = ByteData(4)..setUint32(0, value, Endian.little);
		return byteData.buffer.asUint8List();
	}

	@override
	String toString() {
		return 'LinkAction.${_flags[value]}';
	}
}


class AccountKeyLinkTransactionV1 extends StructBase implements IDeserializable {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.ACCOUNT_KEY_LINK.value);

	static const Map<String, String> TYPE_HINTS = {
		'type': 'enum:TransactionType',
		'network': 'enum:NetworkType',
		'timestamp': 'pod:Timestamp',
		'signerPublicKey': 'pod:PublicKey',
		'signature': 'pod:Signature',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'linkAction': 'enum:LinkAction',
		'remotePublicKey': 'pod:PublicKey'
	};

	TransactionType _type = TransactionType.TRANSFER;
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	Timestamp _timestamp = Timestamp();
	PublicKey _signerPublicKey = PublicKey();
	Signature _signature = Signature();
	Amount _fee = Amount();
	Timestamp _deadline = Timestamp();
	LinkAction _linkAction = LinkAction.LINK;
	PublicKey _remotePublicKey = PublicKey();
	final int _entityBodyReserved_1 = 0; // reserved field
	final int _signerPublicKeySize = 32; // reserved field
	final int _signatureSize = 64; // reserved field
	final int _remotePublicKeySize = 32; // reserved field

	AccountKeyLinkTransactionV1({ 
	TransactionType? type,
	int? version,
	NetworkType? network,
	Timestamp? timestamp,
	PublicKey? signerPublicKey,
	Signature? signature,
	Amount? fee,
	Timestamp? deadline,
	LinkAction? linkAction,
	PublicKey? remotePublicKey
	}) 
		: super(type == null && version == null && network == null && timestamp == null && signerPublicKey == null && signature == null && fee == null && deadline == null && linkAction == null && remotePublicKey == null )
	{
		_type = type ?? AccountKeyLinkTransactionV1.TRANSACTION_TYPE;
		_version = version ?? AccountKeyLinkTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_timestamp = timestamp ?? Timestamp();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_signature = signature ?? Signature();
		_fee = fee ?? Amount();
		_deadline = deadline ?? Timestamp();
		_linkAction = linkAction ?? LinkAction.LINK;
		_remotePublicKey = remotePublicKey ?? PublicKey();
	}

	void sort() {
		// empty body
	}

	TransactionType get type {
		return _type;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	Timestamp get timestamp {
		return _timestamp;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	Signature get signature {
		return _signature;
	}

	Amount get fee {
		return _fee;
	}

	Timestamp get deadline {
		return _deadline;
	}

	LinkAction get linkAction {
		return _linkAction;
	}

	PublicKey get remotePublicKey {
		return _remotePublicKey;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set timestamp(Timestamp value) {
		_timestamp = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set signature(Signature value) {
		_signature = value;
	}

	set fee(Amount value) {
		_fee = value;
	}

	set deadline(Timestamp value) {
		_deadline = value;
	}

	set linkAction(LinkAction value) {
		_linkAction = value;
	}

	set remotePublicKey(PublicKey value) {
		_remotePublicKey = value;
	}

	int get size {
		var size = 0;
		size += type.size;
		size += 1;
		size += 2;
		size += network.size;
		size += timestamp.size;
		size += 4;
		size += signerPublicKey.size;
		size += 4;
		size += signature.size;
		size += fee.size;
		size += deadline.size;
		size += linkAction.size;
		size += 4;
		size += remotePublicKey.size;
		return size;
	}

	@override
	AccountKeyLinkTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var timestamp = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(timestamp.size);
		var signerPublicKeySize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (32 != signerPublicKeySize) {
			throw RangeError('Invalid value of reserved field ($signerPublicKeySize)');
		}
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var signatureSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (64 != signatureSize) {
			throw RangeError('Invalid value of reserved field ($signatureSize)');
		}
		var signature = Signature().deserialize(buffer);
		buffer = buffer.sublist(signature.size);
		var fee = Amount().deserialize(buffer);
		buffer = buffer.sublist(fee.size);
		var deadline = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(deadline.size);
		var linkAction = LinkAction().deserialize(buffer);
		buffer = buffer.sublist(linkAction.size);
		var remotePublicKeySize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (32 != remotePublicKeySize) {
			throw RangeError('Invalid value of reserved field ($remotePublicKeySize)');
		}
		var remotePublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(remotePublicKey.size);

		var instance = AccountKeyLinkTransactionV1(
			type: type,
			version: version,
			network: network,
			timestamp: timestamp,
			signerPublicKey: signerPublicKey,
			signature: signature,
			fee: fee,
			deadline: deadline,
			linkAction: linkAction,
			remotePublicKey: remotePublicKey,
		);
		return instance;
	}

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_entityBodyReserved_1, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _timestamp.size, _timestamp.serialize());
		currentPos += timestamp.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_signerPublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_signatureSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signature.size, _signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + _linkAction.size, _linkAction.serialize());
		currentPos += linkAction.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_remotePublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _remotePublicKey.size, _remotePublicKey.serialize());
		currentPos += remotePublicKey.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'AccountKeyLinkTransactionV1(';
		result += 'type: "${_type.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'timestamp: "${_timestamp.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'signature: "${_signature.toString()}", ';
		result += 'fee: "${_fee.toString()}", ';
		result += 'deadline: "${_deadline.toString()}", ';
		result += 'linkAction: "${_linkAction.toString()}", ';
		result += 'remotePublicKey: "${_remotePublicKey.toString()}", ';
		result += ')';
		return result;
	}
}


class NonVerifiableAccountKeyLinkTransactionV1 extends StructBase implements IDeserializable, INonVerifiableTransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.ACCOUNT_KEY_LINK.value);

	static const Map<String, String> TYPE_HINTS = {
		'type': 'enum:TransactionType',
		'network': 'enum:NetworkType',
		'timestamp': 'pod:Timestamp',
		'signerPublicKey': 'pod:PublicKey',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'linkAction': 'enum:LinkAction',
		'remotePublicKey': 'pod:PublicKey'
	};

	TransactionType _type = TransactionType.TRANSFER;
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	Timestamp _timestamp = Timestamp();
	PublicKey _signerPublicKey = PublicKey();
	Amount _fee = Amount();
	Timestamp _deadline = Timestamp();
	LinkAction _linkAction = LinkAction.LINK;
	PublicKey _remotePublicKey = PublicKey();
	final int _entityBodyReserved_1 = 0; // reserved field
	final int _signerPublicKeySize = 32; // reserved field
	final int _remotePublicKeySize = 32; // reserved field

	NonVerifiableAccountKeyLinkTransactionV1({ 
	TransactionType? type,
	int? version,
	NetworkType? network,
	Timestamp? timestamp,
	PublicKey? signerPublicKey,
	Amount? fee,
	Timestamp? deadline,
	LinkAction? linkAction,
	PublicKey? remotePublicKey
	}) 
		: super(type == null && version == null && network == null && timestamp == null && signerPublicKey == null && fee == null && deadline == null && linkAction == null && remotePublicKey == null )
	{
		_type = type ?? NonVerifiableAccountKeyLinkTransactionV1.TRANSACTION_TYPE;
		_version = version ?? NonVerifiableAccountKeyLinkTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_timestamp = timestamp ?? Timestamp();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_fee = fee ?? Amount();
		_deadline = deadline ?? Timestamp();
		_linkAction = linkAction ?? LinkAction.LINK;
		_remotePublicKey = remotePublicKey ?? PublicKey();
	}

	void sort() {
		// empty body
	}

	TransactionType get type {
		return _type;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	Timestamp get timestamp {
		return _timestamp;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	Amount get fee {
		return _fee;
	}

	Timestamp get deadline {
		return _deadline;
	}

	LinkAction get linkAction {
		return _linkAction;
	}

	PublicKey get remotePublicKey {
		return _remotePublicKey;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set timestamp(Timestamp value) {
		_timestamp = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set fee(Amount value) {
		_fee = value;
	}

	set deadline(Timestamp value) {
		_deadline = value;
	}

	set linkAction(LinkAction value) {
		_linkAction = value;
	}

	set remotePublicKey(PublicKey value) {
		_remotePublicKey = value;
	}

	int get size {
		var size = 0;
		size += type.size;
		size += 1;
		size += 2;
		size += network.size;
		size += timestamp.size;
		size += 4;
		size += signerPublicKey.size;
		size += fee.size;
		size += deadline.size;
		size += linkAction.size;
		size += 4;
		size += remotePublicKey.size;
		return size;
	}

	@override
	NonVerifiableAccountKeyLinkTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var timestamp = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(timestamp.size);
		var signerPublicKeySize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (32 != signerPublicKeySize) {
			throw RangeError('Invalid value of reserved field ($signerPublicKeySize)');
		}
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var fee = Amount().deserialize(buffer);
		buffer = buffer.sublist(fee.size);
		var deadline = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(deadline.size);
		var linkAction = LinkAction().deserialize(buffer);
		buffer = buffer.sublist(linkAction.size);
		var remotePublicKeySize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (32 != remotePublicKeySize) {
			throw RangeError('Invalid value of reserved field ($remotePublicKeySize)');
		}
		var remotePublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(remotePublicKey.size);

		var instance = NonVerifiableAccountKeyLinkTransactionV1(
			type: type,
			version: version,
			network: network,
			timestamp: timestamp,
			signerPublicKey: signerPublicKey,
			fee: fee,
			deadline: deadline,
			linkAction: linkAction,
			remotePublicKey: remotePublicKey,
		);
		return instance;
	}

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_entityBodyReserved_1, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _timestamp.size, _timestamp.serialize());
		currentPos += timestamp.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_signerPublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + _linkAction.size, _linkAction.serialize());
		currentPos += linkAction.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_remotePublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _remotePublicKey.size, _remotePublicKey.serialize());
		currentPos += remotePublicKey.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'NonVerifiableAccountKeyLinkTransactionV1(';
		result += 'type: "${_type.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'timestamp: "${_timestamp.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'fee: "${_fee.toString()}", ';
		result += 'deadline: "${_deadline.toString()}", ';
		result += 'linkAction: "${_linkAction.toString()}", ';
		result += 'remotePublicKey: "${_remotePublicKey.toString()}", ';
		result += ')';
		return result;
	}
}


class NamespaceId extends StructBase implements IDeserializable {

	static const Map<String, String> TYPE_HINTS = {
		'name': 'bytes_array'
	};

	Uint8List _name = Uint8List(0);

	NamespaceId([name]) 
		: super(name == null )
	{
		_name = name ?? Uint8List(0);
	}

	void sort() {
		// empty body
	}

	Uint8List get name {
		return _name;
	}

	set name(Uint8List value) {
		_name = value;
	}

	int get size {
		var size = 0;
		size += 4;
		size += name.lengthInBytes;
		return size;
	}

	@override
	NamespaceId deserialize(Uint8List payload) {
		var buffer = payload;
		var nameSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		var name = Uint8List.fromList(buffer.sublist(0, nameSize));
		buffer = buffer.sublist(nameSize);

		var instance = NamespaceId(name);
		return instance;
	}

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_name.length, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _name.lengthInBytes, _name);
		currentPos += name.lengthInBytes;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'NamespaceId(';
		result += 'name: "${hex.encode(_name.toList()).toUpperCase()}", ';
		result += ')';
		return result;
	}
}


class MosaicId extends StructBase implements IDeserializable {

	static const Map<String, String> TYPE_HINTS = {
		'namespaceId': 'struct:NamespaceId',
		'name': 'bytes_array'
	};

	NamespaceId _namespaceId = NamespaceId();
	Uint8List _name = Uint8List(0);

	MosaicId({ NamespaceId? namespaceId, Uint8List? name}) 
		: super(namespaceId == null && name == null )
	{
		_namespaceId = namespaceId ?? NamespaceId();
		_name = name ?? Uint8List(0);
	}

	void sort() {
		_namespaceId.sort();
	}

	NamespaceId get namespaceId {
		return _namespaceId;
	}

	Uint8List get name {
		return _name;
	}

	set namespaceId(NamespaceId value) {
		_namespaceId = value;
	}

	set name(Uint8List value) {
		_name = value;
	}

	int get size {
		var size = 0;
		size += namespaceId.size;
		size += 4;
		size += name.lengthInBytes;
		return size;
	}

	@override
	MosaicId deserialize(Uint8List payload) {
		var buffer = payload;
		var namespaceId = NamespaceId().deserialize(buffer);
		buffer = buffer.sublist(namespaceId.size);
		var nameSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		var name = Uint8List.fromList(buffer.sublist(0, nameSize));
		buffer = buffer.sublist(nameSize);

		var instance = MosaicId(
			namespaceId: namespaceId,
			name: name,
		);
		return instance;
	}

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + _namespaceId.size, _namespaceId.serialize());
		currentPos += namespaceId.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_name.length, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _name.lengthInBytes, _name);
		currentPos += name.lengthInBytes;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'MosaicId(';
		result += 'namespaceId: "${_namespaceId.toString()}", ';
		result += 'name: "${hex.encode(_name.toList()).toUpperCase()}", ';
		result += ')';
		return result;
	}
}


class Mosaic extends StructBase implements IDeserializable {

	static const Map<String, String> TYPE_HINTS = {
		'mosaicId': 'struct:MosaicId',
		'amount': 'pod:Amount'
	};

	MosaicId _mosaicId = MosaicId();
	Amount _amount = Amount();

	Mosaic({ MosaicId? mosaicId, Amount? amount}) 
		: super(mosaicId == null && amount == null )
	{
		_mosaicId = mosaicId ?? MosaicId();
		_amount = amount ?? Amount();
	}

	void sort() {
		_mosaicId.sort();
	}

	MosaicId get mosaicId {
		return _mosaicId;
	}

	Amount get amount {
		return _amount;
	}

	set mosaicId(MosaicId value) {
		_mosaicId = value;
	}

	set amount(Amount value) {
		_amount = value;
	}

	int get size {
		var size = 0;
		size += 4;
		size += mosaicId.size;
		size += amount.size;
		return size;
	}

	@override
	Mosaic deserialize(Uint8List payload) {
		var buffer = payload;
		var mosaicIdSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		//marking sizeof field
		var mosaicId = MosaicId().deserialize(buffer);
		buffer = buffer.sublist(mosaicId.size);
		var amount = Amount().deserialize(buffer);
		buffer = buffer.sublist(amount.size);

		var instance = Mosaic(
			mosaicId: mosaicId,
			amount: amount,
		);
		return instance;
	}

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(mosaicId.size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _mosaicId.size, _mosaicId.serialize());
		currentPos += mosaicId.size;
		buffer.setRange(currentPos, currentPos + _amount.size, _amount.serialize());
		currentPos += amount.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'Mosaic(';
		result += 'mosaicId: "${_mosaicId.toString()}", ';
		result += 'amount: "${_amount.toString()}", ';
		result += ')';
		return result;
	}
}


class SizePrefixedMosaic extends StructBase implements IDeserializable {

	static const Map<String, String> TYPE_HINTS = {
		'mosaic': 'struct:Mosaic'
	};

	Mosaic _mosaic = Mosaic();

	SizePrefixedMosaic([mosaic]) 
		: super(mosaic == null )
	{
		_mosaic = mosaic ?? Mosaic();
	}

	void sort() {
		_mosaic.sort();
	}

	Mosaic get mosaic {
		return _mosaic;
	}

	set mosaic(Mosaic value) {
		_mosaic = value;
	}

	int get size {
		var size = 0;
		size += 4;
		size += mosaic.size;
		return size;
	}

	@override
	SizePrefixedMosaic deserialize(Uint8List payload) {
		var buffer = payload;
		var mosaicSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		//marking sizeof field
		var mosaic = Mosaic().deserialize(buffer);
		buffer = buffer.sublist(mosaic.size);

		var instance = SizePrefixedMosaic(mosaic);
		return instance;
	}

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(mosaic.size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _mosaic.size, _mosaic.serialize());
		currentPos += mosaic.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'SizePrefixedMosaic(';
		result += 'mosaic: "${_mosaic.toString()}", ';
		result += ')';
		return result;
	}
}


class MosaicTransferFeeType implements IDeserializable {
	static final ABSOLUTE = MosaicTransferFeeType(1);
	static final PERCENTILE = MosaicTransferFeeType(2);

	final int value;

	static final _flags = {
		1: 'ABSOLUTE',
		2: 'PERCENTILE',
	};

	MosaicTransferFeeType([int? _value]) : value = _value ?? 1;

	int get size {
		return 4;
	}

	@override
	MosaicTransferFeeType deserialize(Uint8List payload) {
		var byteData = ByteData.sublistView(payload);
		return MosaicTransferFeeType(byteData.getUint32(0, Endian.little));
	}

	Uint8List serialize() {
		var byteData = ByteData(4)..setUint32(0, value, Endian.little);
		return byteData.buffer.asUint8List();
	}

	@override
	String toString() {
		return 'MosaicTransferFeeType.${_flags[value]}';
	}
}


class MosaicLevy extends StructBase implements IDeserializable {

	static const Map<String, String> TYPE_HINTS = {
		'transferFeeType': 'enum:MosaicTransferFeeType',
		'recipientAddress': 'pod:Address',
		'mosaicId': 'struct:MosaicId',
		'fee': 'pod:Amount'
	};

	MosaicTransferFeeType _transferFeeType = MosaicTransferFeeType.ABSOLUTE;
	Address _recipientAddress = Address();
	MosaicId _mosaicId = MosaicId();
	Amount _fee = Amount();
	final int _recipientAddressSize = 40; // reserved field

	MosaicLevy({ MosaicTransferFeeType? transferFeeType, Address? recipientAddress, MosaicId? mosaicId, Amount? fee}) 
		: super(transferFeeType == null && recipientAddress == null && mosaicId == null && fee == null )
	{
		_transferFeeType = transferFeeType ?? MosaicTransferFeeType.ABSOLUTE;
		_recipientAddress = recipientAddress ?? Address();
		_mosaicId = mosaicId ?? MosaicId();
		_fee = fee ?? Amount();
	}

	void sort() {
		_mosaicId.sort();
	}

	MosaicTransferFeeType get transferFeeType {
		return _transferFeeType;
	}

	Address get recipientAddress {
		return _recipientAddress;
	}

	MosaicId get mosaicId {
		return _mosaicId;
	}

	Amount get fee {
		return _fee;
	}

	set transferFeeType(MosaicTransferFeeType value) {
		_transferFeeType = value;
	}

	set recipientAddress(Address value) {
		_recipientAddress = value;
	}

	set mosaicId(MosaicId value) {
		_mosaicId = value;
	}

	set fee(Amount value) {
		_fee = value;
	}

	int get size {
		var size = 0;
		size += transferFeeType.size;
		size += 4;
		size += recipientAddress.size;
		size += 4;
		size += mosaicId.size;
		size += fee.size;
		return size;
	}

	@override
	MosaicLevy deserialize(Uint8List payload) {
		var buffer = payload;
		var transferFeeType = MosaicTransferFeeType().deserialize(buffer);
		buffer = buffer.sublist(transferFeeType.size);
		var recipientAddressSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (40 != recipientAddressSize) {
			throw RangeError('Invalid value of reserved field ($recipientAddressSize)');
		}
		var recipientAddress = Address().deserialize(buffer);
		buffer = buffer.sublist(recipientAddress.size);
		var mosaicIdSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		//marking sizeof field
		var mosaicId = MosaicId().deserialize(buffer);
		buffer = buffer.sublist(mosaicId.size);
		var fee = Amount().deserialize(buffer);
		buffer = buffer.sublist(fee.size);

		var instance = MosaicLevy(
			transferFeeType: transferFeeType,
			recipientAddress: recipientAddress,
			mosaicId: mosaicId,
			fee: fee,
		);
		return instance;
	}

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + _transferFeeType.size, _transferFeeType.serialize());
		currentPos += transferFeeType.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_recipientAddressSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _recipientAddress.size, _recipientAddress.serialize());
		currentPos += recipientAddress.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(mosaicId.size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _mosaicId.size, _mosaicId.serialize());
		currentPos += mosaicId.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());
		currentPos += fee.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'MosaicLevy(';
		result += 'transferFeeType: "${_transferFeeType.toString()}", ';
		result += 'recipientAddress: "${_recipientAddress.toString()}", ';
		result += 'mosaicId: "${_mosaicId.toString()}", ';
		result += 'fee: "${_fee.toString()}", ';
		result += ')';
		return result;
	}
}


class MosaicProperty extends StructBase implements IDeserializable {

	static const Map<String, String> TYPE_HINTS = {
		'name': 'bytes_array',
		'value': 'bytes_array'
	};

	Uint8List _name = Uint8List(0);
	Uint8List _value = Uint8List(0);

	MosaicProperty({ Uint8List? name, Uint8List? value}) 
		: super(name == null && value == null )
	{
		_name = name ?? Uint8List(0);
		_value = value ?? Uint8List(0);
	}

	void sort() {
		// empty body
	}

	Uint8List get name {
		return _name;
	}

	Uint8List get value {
		return _value;
	}

	set name(Uint8List value) {
		_name = value;
	}

	set value(Uint8List value) {
		_value = value;
	}

	int get size {
		var size = 0;
		size += 4;
		size += name.lengthInBytes;
		size += 4;
		size += value.lengthInBytes;
		return size;
	}

	@override
	MosaicProperty deserialize(Uint8List payload) {
		var buffer = payload;
		var nameSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		var name = Uint8List.fromList(buffer.sublist(0, nameSize));
		buffer = buffer.sublist(nameSize);
		var valueSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		var value = Uint8List.fromList(buffer.sublist(0, valueSize));
		buffer = buffer.sublist(valueSize);

		var instance = MosaicProperty(
			name: name,
			value: value,
		);
		return instance;
	}

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_name.length, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _name.lengthInBytes, _name);
		currentPos += name.lengthInBytes;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_value.length, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _value.lengthInBytes, _value);
		currentPos += value.lengthInBytes;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'MosaicProperty(';
		result += 'name: "${hex.encode(_name.toList()).toUpperCase()}", ';
		result += 'value: "${hex.encode(_value.toList()).toUpperCase()}", ';
		result += ')';
		return result;
	}
}


class SizePrefixedMosaicProperty extends StructBase implements IDeserializable {

	static const Map<String, String> TYPE_HINTS = {
		'property': 'struct:MosaicProperty'
	};

	MosaicProperty _property = MosaicProperty();

	SizePrefixedMosaicProperty([property]) 
		: super(property == null )
	{
		_property = property ?? MosaicProperty();
	}

	void sort() {
		_property.sort();
	}

	MosaicProperty get property {
		return _property;
	}

	set property(MosaicProperty value) {
		_property = value;
	}

	int get size {
		var size = 0;
		size += 4;
		size += property.size;
		return size;
	}

	@override
	SizePrefixedMosaicProperty deserialize(Uint8List payload) {
		var buffer = payload;
		var propertySize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		//marking sizeof field
		var property = MosaicProperty().deserialize(buffer);
		buffer = buffer.sublist(property.size);

		var instance = SizePrefixedMosaicProperty(property);
		return instance;
	}

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(property.size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _property.size, _property.serialize());
		currentPos += property.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'SizePrefixedMosaicProperty(';
		result += 'property: "${_property.toString()}", ';
		result += ')';
		return result;
	}
}


class MosaicDefinition extends StructBase implements IDeserializable {

	static const Map<String, String> TYPE_HINTS = {
		'ownerPublicKey': 'pod:PublicKey',
		'id': 'struct:MosaicId',
		'description': 'bytes_array',
		'properties': 'array[SizePrefixedMosaicProperty]',
		'levy': 'struct:MosaicLevy'
	};

	PublicKey _ownerPublicKey = PublicKey();
	MosaicId _id = MosaicId();
	Uint8List _description = Uint8List(0);
	List<SizePrefixedMosaicProperty> _properties = [];
	MosaicLevy _levy = MosaicLevy();
	final int _ownerPublicKeySize = 32; // reserved field

	MosaicDefinition({ 
	PublicKey? ownerPublicKey,
	MosaicId? id,
	Uint8List? description,
	List<SizePrefixedMosaicProperty>? properties,
	MosaicLevy? levy
	}) 
		: super(ownerPublicKey == null && id == null && description == null && properties == null && levy == null )
	{
		_ownerPublicKey = ownerPublicKey ?? PublicKey();
		_id = id ?? MosaicId();
		_description = description ?? Uint8List(0);
		_properties = properties ?? [];
		_levy = levy ?? MosaicLevy();
	}

	void sort() {
		_id.sort();
		if (0 != levySizeComputed)
		{
			_levy.sort();
		}
	}

	PublicKey get ownerPublicKey {
		return _ownerPublicKey;
	}

	MosaicId get id {
		return _id;
	}

	Uint8List get description {
		return _description;
	}

	List<SizePrefixedMosaicProperty> get properties {
		return _properties;
	}

	MosaicLevy get levy {
		return _levy;
	}

	int get levySizeComputed {
		return levy.isDefault ? 0 : levy.size + 0;
	}

	set ownerPublicKey(PublicKey value) {
		_ownerPublicKey = value;
	}

	set id(MosaicId value) {
		_id = value;
	}

	set description(Uint8List value) {
		_description = value;
	}

	set properties(List<SizePrefixedMosaicProperty> value) {
		_properties = value;
	}

	set levy(MosaicLevy value) {
		_levy = value;
	}

	int get size {
		var size = 0;
		size += 4;
		size += ownerPublicKey.size;
		size += 4;
		size += id.size;
		size += 4;
		size += description.lengthInBytes;
		size += 4;
		size += ArrayHelpers.size(properties);
		size += 4;
		if (0 != levySizeComputed)
		{
			size += levy.size;
		}
		return size;
	}

	@override
	MosaicDefinition deserialize(Uint8List payload) {
		var buffer = payload;
		var ownerPublicKeySize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (32 != ownerPublicKeySize) {
			throw RangeError('Invalid value of reserved field ($ownerPublicKeySize)');
		}
		var ownerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(ownerPublicKey.size);
		var idSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		//marking sizeof field
		var id = MosaicId().deserialize(buffer);
		buffer = buffer.sublist(id.size);
		var descriptionSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		var description = Uint8List.fromList(buffer.sublist(0, descriptionSize));
		buffer = buffer.sublist(descriptionSize);
		var propertiesCount = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		var properties = ArrayHelpers.readArrayCount(buffer, SizePrefixedMosaicProperty(), propertiesCount).map((item) => item as SizePrefixedMosaicProperty).toList();
		buffer = buffer.sublist(ArrayHelpers.size(properties));
		var levySize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		var levy = MosaicLevy();
		if (0 != levySize)
		{
			levy = MosaicLevy().deserialize(buffer);
			buffer = buffer.sublist(levy.size);
		}

		var instance = MosaicDefinition(
			ownerPublicKey: ownerPublicKey,
			id: id,
			description: description,
			properties: properties,
			levy: levy,
		);
		return instance;
	}

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_ownerPublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _ownerPublicKey.size, _ownerPublicKey.serialize());
		currentPos += ownerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(id.size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _id.size, _id.serialize());
		currentPos += id.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_description.length, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _description.lengthInBytes, _description);
		currentPos += description.lengthInBytes;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_properties.length, 4));
		currentPos += 4;
		sort();
		var res_properties = ArrayHelpers.writeArray(buffer, _properties, currentPos);
		currentPos = res_properties.item2;
		buffer = res_properties.item1;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(levySizeComputed, 4));
		currentPos += 4;
		if (0 != levySizeComputed)
		{
			buffer.setRange(currentPos, currentPos + _levy.size, _levy.serialize());
			currentPos += levy.size;
		}
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'MosaicDefinition(';
		result += 'ownerPublicKey: "${_ownerPublicKey.toString()}", ';
		result += 'id: "${_id.toString()}", ';
		result += 'description: "${hex.encode(_description.toList()).toUpperCase()}", ';
		result += 'properties: "${_properties.map((e) => e.toString()).toList()}", ';
		if (0 != levySizeComputed)
		{
			result += 'levy: "${_levy.toString()}", ';
		}
		result += ')';
		return result;
	}
}


class MosaicDefinitionTransactionV1 extends StructBase implements IDeserializable {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.MOSAIC_DEFINITION.value);

	static const Map<String, String> TYPE_HINTS = {
		'type': 'enum:TransactionType',
		'network': 'enum:NetworkType',
		'timestamp': 'pod:Timestamp',
		'signerPublicKey': 'pod:PublicKey',
		'signature': 'pod:Signature',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'mosaicDefinition': 'struct:MosaicDefinition',
		'rentalFeeSink': 'pod:Address',
		'rentalFee': 'pod:Amount'
	};

	TransactionType _type = TransactionType.TRANSFER;
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	Timestamp _timestamp = Timestamp();
	PublicKey _signerPublicKey = PublicKey();
	Signature _signature = Signature();
	Amount _fee = Amount();
	Timestamp _deadline = Timestamp();
	MosaicDefinition _mosaicDefinition = MosaicDefinition();
	Address _rentalFeeSink = Address();
	Amount _rentalFee = Amount();
	final int _entityBodyReserved_1 = 0; // reserved field
	final int _signerPublicKeySize = 32; // reserved field
	final int _signatureSize = 64; // reserved field
	final int _rentalFeeSinkSize = 40; // reserved field

	MosaicDefinitionTransactionV1({ 
	TransactionType? type,
	int? version,
	NetworkType? network,
	Timestamp? timestamp,
	PublicKey? signerPublicKey,
	Signature? signature,
	Amount? fee,
	Timestamp? deadline,
	MosaicDefinition? mosaicDefinition,
	Address? rentalFeeSink,
	Amount? rentalFee
	}) 
		: super(type == null && version == null && network == null && timestamp == null && signerPublicKey == null && signature == null && fee == null && deadline == null && mosaicDefinition == null && rentalFeeSink == null && rentalFee == null )
	{
		_type = type ?? MosaicDefinitionTransactionV1.TRANSACTION_TYPE;
		_version = version ?? MosaicDefinitionTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_timestamp = timestamp ?? Timestamp();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_signature = signature ?? Signature();
		_fee = fee ?? Amount();
		_deadline = deadline ?? Timestamp();
		_mosaicDefinition = mosaicDefinition ?? MosaicDefinition();
		_rentalFeeSink = rentalFeeSink ?? Address();
		_rentalFee = rentalFee ?? Amount();
	}

	void sort() {
		_mosaicDefinition.sort();
	}

	TransactionType get type {
		return _type;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	Timestamp get timestamp {
		return _timestamp;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	Signature get signature {
		return _signature;
	}

	Amount get fee {
		return _fee;
	}

	Timestamp get deadline {
		return _deadline;
	}

	MosaicDefinition get mosaicDefinition {
		return _mosaicDefinition;
	}

	Address get rentalFeeSink {
		return _rentalFeeSink;
	}

	Amount get rentalFee {
		return _rentalFee;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set timestamp(Timestamp value) {
		_timestamp = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set signature(Signature value) {
		_signature = value;
	}

	set fee(Amount value) {
		_fee = value;
	}

	set deadline(Timestamp value) {
		_deadline = value;
	}

	set mosaicDefinition(MosaicDefinition value) {
		_mosaicDefinition = value;
	}

	set rentalFeeSink(Address value) {
		_rentalFeeSink = value;
	}

	set rentalFee(Amount value) {
		_rentalFee = value;
	}

	int get size {
		var size = 0;
		size += type.size;
		size += 1;
		size += 2;
		size += network.size;
		size += timestamp.size;
		size += 4;
		size += signerPublicKey.size;
		size += 4;
		size += signature.size;
		size += fee.size;
		size += deadline.size;
		size += 4;
		size += mosaicDefinition.size;
		size += 4;
		size += rentalFeeSink.size;
		size += rentalFee.size;
		return size;
	}

	@override
	MosaicDefinitionTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var timestamp = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(timestamp.size);
		var signerPublicKeySize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (32 != signerPublicKeySize) {
			throw RangeError('Invalid value of reserved field ($signerPublicKeySize)');
		}
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var signatureSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (64 != signatureSize) {
			throw RangeError('Invalid value of reserved field ($signatureSize)');
		}
		var signature = Signature().deserialize(buffer);
		buffer = buffer.sublist(signature.size);
		var fee = Amount().deserialize(buffer);
		buffer = buffer.sublist(fee.size);
		var deadline = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(deadline.size);
		var mosaicDefinitionSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		//marking sizeof field
		var mosaicDefinition = MosaicDefinition().deserialize(buffer);
		buffer = buffer.sublist(mosaicDefinition.size);
		var rentalFeeSinkSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (40 != rentalFeeSinkSize) {
			throw RangeError('Invalid value of reserved field ($rentalFeeSinkSize)');
		}
		var rentalFeeSink = Address().deserialize(buffer);
		buffer = buffer.sublist(rentalFeeSink.size);
		var rentalFee = Amount().deserialize(buffer);
		buffer = buffer.sublist(rentalFee.size);

		var instance = MosaicDefinitionTransactionV1(
			type: type,
			version: version,
			network: network,
			timestamp: timestamp,
			signerPublicKey: signerPublicKey,
			signature: signature,
			fee: fee,
			deadline: deadline,
			mosaicDefinition: mosaicDefinition,
			rentalFeeSink: rentalFeeSink,
			rentalFee: rentalFee,
		);
		return instance;
	}

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_entityBodyReserved_1, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _timestamp.size, _timestamp.serialize());
		currentPos += timestamp.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_signerPublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_signatureSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signature.size, _signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(mosaicDefinition.size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _mosaicDefinition.size, _mosaicDefinition.serialize());
		currentPos += mosaicDefinition.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_rentalFeeSinkSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _rentalFeeSink.size, _rentalFeeSink.serialize());
		currentPos += rentalFeeSink.size;
		buffer.setRange(currentPos, currentPos + _rentalFee.size, _rentalFee.serialize());
		currentPos += rentalFee.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'MosaicDefinitionTransactionV1(';
		result += 'type: "${_type.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'timestamp: "${_timestamp.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'signature: "${_signature.toString()}", ';
		result += 'fee: "${_fee.toString()}", ';
		result += 'deadline: "${_deadline.toString()}", ';
		result += 'mosaicDefinition: "${_mosaicDefinition.toString()}", ';
		result += 'rentalFeeSink: "${_rentalFeeSink.toString()}", ';
		result += 'rentalFee: "${_rentalFee.toString()}", ';
		result += ')';
		return result;
	}
}


class NonVerifiableMosaicDefinitionTransactionV1 extends StructBase implements IDeserializable, INonVerifiableTransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.MOSAIC_DEFINITION.value);

	static const Map<String, String> TYPE_HINTS = {
		'type': 'enum:TransactionType',
		'network': 'enum:NetworkType',
		'timestamp': 'pod:Timestamp',
		'signerPublicKey': 'pod:PublicKey',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'mosaicDefinition': 'struct:MosaicDefinition',
		'rentalFeeSink': 'pod:Address',
		'rentalFee': 'pod:Amount'
	};

	TransactionType _type = TransactionType.TRANSFER;
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	Timestamp _timestamp = Timestamp();
	PublicKey _signerPublicKey = PublicKey();
	Amount _fee = Amount();
	Timestamp _deadline = Timestamp();
	MosaicDefinition _mosaicDefinition = MosaicDefinition();
	Address _rentalFeeSink = Address();
	Amount _rentalFee = Amount();
	final int _entityBodyReserved_1 = 0; // reserved field
	final int _signerPublicKeySize = 32; // reserved field
	final int _rentalFeeSinkSize = 40; // reserved field

	NonVerifiableMosaicDefinitionTransactionV1({ 
	TransactionType? type,
	int? version,
	NetworkType? network,
	Timestamp? timestamp,
	PublicKey? signerPublicKey,
	Amount? fee,
	Timestamp? deadline,
	MosaicDefinition? mosaicDefinition,
	Address? rentalFeeSink,
	Amount? rentalFee
	}) 
		: super(type == null && version == null && network == null && timestamp == null && signerPublicKey == null && fee == null && deadline == null && mosaicDefinition == null && rentalFeeSink == null && rentalFee == null )
	{
		_type = type ?? NonVerifiableMosaicDefinitionTransactionV1.TRANSACTION_TYPE;
		_version = version ?? NonVerifiableMosaicDefinitionTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_timestamp = timestamp ?? Timestamp();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_fee = fee ?? Amount();
		_deadline = deadline ?? Timestamp();
		_mosaicDefinition = mosaicDefinition ?? MosaicDefinition();
		_rentalFeeSink = rentalFeeSink ?? Address();
		_rentalFee = rentalFee ?? Amount();
	}

	void sort() {
		_mosaicDefinition.sort();
	}

	TransactionType get type {
		return _type;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	Timestamp get timestamp {
		return _timestamp;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	Amount get fee {
		return _fee;
	}

	Timestamp get deadline {
		return _deadline;
	}

	MosaicDefinition get mosaicDefinition {
		return _mosaicDefinition;
	}

	Address get rentalFeeSink {
		return _rentalFeeSink;
	}

	Amount get rentalFee {
		return _rentalFee;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set timestamp(Timestamp value) {
		_timestamp = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set fee(Amount value) {
		_fee = value;
	}

	set deadline(Timestamp value) {
		_deadline = value;
	}

	set mosaicDefinition(MosaicDefinition value) {
		_mosaicDefinition = value;
	}

	set rentalFeeSink(Address value) {
		_rentalFeeSink = value;
	}

	set rentalFee(Amount value) {
		_rentalFee = value;
	}

	int get size {
		var size = 0;
		size += type.size;
		size += 1;
		size += 2;
		size += network.size;
		size += timestamp.size;
		size += 4;
		size += signerPublicKey.size;
		size += fee.size;
		size += deadline.size;
		size += 4;
		size += mosaicDefinition.size;
		size += 4;
		size += rentalFeeSink.size;
		size += rentalFee.size;
		return size;
	}

	@override
	NonVerifiableMosaicDefinitionTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var timestamp = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(timestamp.size);
		var signerPublicKeySize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (32 != signerPublicKeySize) {
			throw RangeError('Invalid value of reserved field ($signerPublicKeySize)');
		}
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var fee = Amount().deserialize(buffer);
		buffer = buffer.sublist(fee.size);
		var deadline = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(deadline.size);
		var mosaicDefinitionSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		//marking sizeof field
		var mosaicDefinition = MosaicDefinition().deserialize(buffer);
		buffer = buffer.sublist(mosaicDefinition.size);
		var rentalFeeSinkSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (40 != rentalFeeSinkSize) {
			throw RangeError('Invalid value of reserved field ($rentalFeeSinkSize)');
		}
		var rentalFeeSink = Address().deserialize(buffer);
		buffer = buffer.sublist(rentalFeeSink.size);
		var rentalFee = Amount().deserialize(buffer);
		buffer = buffer.sublist(rentalFee.size);

		var instance = NonVerifiableMosaicDefinitionTransactionV1(
			type: type,
			version: version,
			network: network,
			timestamp: timestamp,
			signerPublicKey: signerPublicKey,
			fee: fee,
			deadline: deadline,
			mosaicDefinition: mosaicDefinition,
			rentalFeeSink: rentalFeeSink,
			rentalFee: rentalFee,
		);
		return instance;
	}

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_entityBodyReserved_1, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _timestamp.size, _timestamp.serialize());
		currentPos += timestamp.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_signerPublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(mosaicDefinition.size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _mosaicDefinition.size, _mosaicDefinition.serialize());
		currentPos += mosaicDefinition.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_rentalFeeSinkSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _rentalFeeSink.size, _rentalFeeSink.serialize());
		currentPos += rentalFeeSink.size;
		buffer.setRange(currentPos, currentPos + _rentalFee.size, _rentalFee.serialize());
		currentPos += rentalFee.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'NonVerifiableMosaicDefinitionTransactionV1(';
		result += 'type: "${_type.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'timestamp: "${_timestamp.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'fee: "${_fee.toString()}", ';
		result += 'deadline: "${_deadline.toString()}", ';
		result += 'mosaicDefinition: "${_mosaicDefinition.toString()}", ';
		result += 'rentalFeeSink: "${_rentalFeeSink.toString()}", ';
		result += 'rentalFee: "${_rentalFee.toString()}", ';
		result += ')';
		return result;
	}
}


class MosaicSupplyChangeAction implements IDeserializable {
	static final INCREASE = MosaicSupplyChangeAction(1);
	static final DECREASE = MosaicSupplyChangeAction(2);

	final int value;

	static final _flags = {
		1: 'INCREASE',
		2: 'DECREASE',
	};

	MosaicSupplyChangeAction([int? _value]) : value = _value ?? 1;

	int get size {
		return 4;
	}

	@override
	MosaicSupplyChangeAction deserialize(Uint8List payload) {
		var byteData = ByteData.sublistView(payload);
		return MosaicSupplyChangeAction(byteData.getUint32(0, Endian.little));
	}

	Uint8List serialize() {
		var byteData = ByteData(4)..setUint32(0, value, Endian.little);
		return byteData.buffer.asUint8List();
	}

	@override
	String toString() {
		return 'MosaicSupplyChangeAction.${_flags[value]}';
	}
}


class MosaicSupplyChangeTransactionV1 extends StructBase implements IDeserializable {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.MOSAIC_SUPPLY_CHANGE.value);

	static const Map<String, String> TYPE_HINTS = {
		'type': 'enum:TransactionType',
		'network': 'enum:NetworkType',
		'timestamp': 'pod:Timestamp',
		'signerPublicKey': 'pod:PublicKey',
		'signature': 'pod:Signature',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'mosaicId': 'struct:MosaicId',
		'action': 'enum:MosaicSupplyChangeAction',
		'delta': 'pod:Amount'
	};

	TransactionType _type = TransactionType.TRANSFER;
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	Timestamp _timestamp = Timestamp();
	PublicKey _signerPublicKey = PublicKey();
	Signature _signature = Signature();
	Amount _fee = Amount();
	Timestamp _deadline = Timestamp();
	MosaicId _mosaicId = MosaicId();
	MosaicSupplyChangeAction _action = MosaicSupplyChangeAction.INCREASE;
	Amount _delta = Amount();
	final int _entityBodyReserved_1 = 0; // reserved field
	final int _signerPublicKeySize = 32; // reserved field
	final int _signatureSize = 64; // reserved field

	MosaicSupplyChangeTransactionV1({ 
	TransactionType? type,
	int? version,
	NetworkType? network,
	Timestamp? timestamp,
	PublicKey? signerPublicKey,
	Signature? signature,
	Amount? fee,
	Timestamp? deadline,
	MosaicId? mosaicId,
	MosaicSupplyChangeAction? action,
	Amount? delta
	}) 
		: super(type == null && version == null && network == null && timestamp == null && signerPublicKey == null && signature == null && fee == null && deadline == null && mosaicId == null && action == null && delta == null )
	{
		_type = type ?? MosaicSupplyChangeTransactionV1.TRANSACTION_TYPE;
		_version = version ?? MosaicSupplyChangeTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_timestamp = timestamp ?? Timestamp();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_signature = signature ?? Signature();
		_fee = fee ?? Amount();
		_deadline = deadline ?? Timestamp();
		_mosaicId = mosaicId ?? MosaicId();
		_action = action ?? MosaicSupplyChangeAction.INCREASE;
		_delta = delta ?? Amount();
	}

	void sort() {
		_mosaicId.sort();
	}

	TransactionType get type {
		return _type;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	Timestamp get timestamp {
		return _timestamp;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	Signature get signature {
		return _signature;
	}

	Amount get fee {
		return _fee;
	}

	Timestamp get deadline {
		return _deadline;
	}

	MosaicId get mosaicId {
		return _mosaicId;
	}

	MosaicSupplyChangeAction get action {
		return _action;
	}

	Amount get delta {
		return _delta;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set timestamp(Timestamp value) {
		_timestamp = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set signature(Signature value) {
		_signature = value;
	}

	set fee(Amount value) {
		_fee = value;
	}

	set deadline(Timestamp value) {
		_deadline = value;
	}

	set mosaicId(MosaicId value) {
		_mosaicId = value;
	}

	set action(MosaicSupplyChangeAction value) {
		_action = value;
	}

	set delta(Amount value) {
		_delta = value;
	}

	int get size {
		var size = 0;
		size += type.size;
		size += 1;
		size += 2;
		size += network.size;
		size += timestamp.size;
		size += 4;
		size += signerPublicKey.size;
		size += 4;
		size += signature.size;
		size += fee.size;
		size += deadline.size;
		size += 4;
		size += mosaicId.size;
		size += action.size;
		size += delta.size;
		return size;
	}

	@override
	MosaicSupplyChangeTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var timestamp = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(timestamp.size);
		var signerPublicKeySize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (32 != signerPublicKeySize) {
			throw RangeError('Invalid value of reserved field ($signerPublicKeySize)');
		}
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var signatureSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (64 != signatureSize) {
			throw RangeError('Invalid value of reserved field ($signatureSize)');
		}
		var signature = Signature().deserialize(buffer);
		buffer = buffer.sublist(signature.size);
		var fee = Amount().deserialize(buffer);
		buffer = buffer.sublist(fee.size);
		var deadline = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(deadline.size);
		var mosaicIdSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		//marking sizeof field
		var mosaicId = MosaicId().deserialize(buffer);
		buffer = buffer.sublist(mosaicId.size);
		var action = MosaicSupplyChangeAction().deserialize(buffer);
		buffer = buffer.sublist(action.size);
		var delta = Amount().deserialize(buffer);
		buffer = buffer.sublist(delta.size);

		var instance = MosaicSupplyChangeTransactionV1(
			type: type,
			version: version,
			network: network,
			timestamp: timestamp,
			signerPublicKey: signerPublicKey,
			signature: signature,
			fee: fee,
			deadline: deadline,
			mosaicId: mosaicId,
			action: action,
			delta: delta,
		);
		return instance;
	}

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_entityBodyReserved_1, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _timestamp.size, _timestamp.serialize());
		currentPos += timestamp.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_signerPublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_signatureSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signature.size, _signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(mosaicId.size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _mosaicId.size, _mosaicId.serialize());
		currentPos += mosaicId.size;
		buffer.setRange(currentPos, currentPos + _action.size, _action.serialize());
		currentPos += action.size;
		buffer.setRange(currentPos, currentPos + _delta.size, _delta.serialize());
		currentPos += delta.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'MosaicSupplyChangeTransactionV1(';
		result += 'type: "${_type.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'timestamp: "${_timestamp.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'signature: "${_signature.toString()}", ';
		result += 'fee: "${_fee.toString()}", ';
		result += 'deadline: "${_deadline.toString()}", ';
		result += 'mosaicId: "${_mosaicId.toString()}", ';
		result += 'action: "${_action.toString()}", ';
		result += 'delta: "${_delta.toString()}", ';
		result += ')';
		return result;
	}
}


class NonVerifiableMosaicSupplyChangeTransactionV1 extends StructBase implements IDeserializable, INonVerifiableTransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.MOSAIC_SUPPLY_CHANGE.value);

	static const Map<String, String> TYPE_HINTS = {
		'type': 'enum:TransactionType',
		'network': 'enum:NetworkType',
		'timestamp': 'pod:Timestamp',
		'signerPublicKey': 'pod:PublicKey',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'mosaicId': 'struct:MosaicId',
		'action': 'enum:MosaicSupplyChangeAction',
		'delta': 'pod:Amount'
	};

	TransactionType _type = TransactionType.TRANSFER;
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	Timestamp _timestamp = Timestamp();
	PublicKey _signerPublicKey = PublicKey();
	Amount _fee = Amount();
	Timestamp _deadline = Timestamp();
	MosaicId _mosaicId = MosaicId();
	MosaicSupplyChangeAction _action = MosaicSupplyChangeAction.INCREASE;
	Amount _delta = Amount();
	final int _entityBodyReserved_1 = 0; // reserved field
	final int _signerPublicKeySize = 32; // reserved field

	NonVerifiableMosaicSupplyChangeTransactionV1({ 
	TransactionType? type,
	int? version,
	NetworkType? network,
	Timestamp? timestamp,
	PublicKey? signerPublicKey,
	Amount? fee,
	Timestamp? deadline,
	MosaicId? mosaicId,
	MosaicSupplyChangeAction? action,
	Amount? delta
	}) 
		: super(type == null && version == null && network == null && timestamp == null && signerPublicKey == null && fee == null && deadline == null && mosaicId == null && action == null && delta == null )
	{
		_type = type ?? NonVerifiableMosaicSupplyChangeTransactionV1.TRANSACTION_TYPE;
		_version = version ?? NonVerifiableMosaicSupplyChangeTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_timestamp = timestamp ?? Timestamp();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_fee = fee ?? Amount();
		_deadline = deadline ?? Timestamp();
		_mosaicId = mosaicId ?? MosaicId();
		_action = action ?? MosaicSupplyChangeAction.INCREASE;
		_delta = delta ?? Amount();
	}

	void sort() {
		_mosaicId.sort();
	}

	TransactionType get type {
		return _type;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	Timestamp get timestamp {
		return _timestamp;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	Amount get fee {
		return _fee;
	}

	Timestamp get deadline {
		return _deadline;
	}

	MosaicId get mosaicId {
		return _mosaicId;
	}

	MosaicSupplyChangeAction get action {
		return _action;
	}

	Amount get delta {
		return _delta;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set timestamp(Timestamp value) {
		_timestamp = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set fee(Amount value) {
		_fee = value;
	}

	set deadline(Timestamp value) {
		_deadline = value;
	}

	set mosaicId(MosaicId value) {
		_mosaicId = value;
	}

	set action(MosaicSupplyChangeAction value) {
		_action = value;
	}

	set delta(Amount value) {
		_delta = value;
	}

	int get size {
		var size = 0;
		size += type.size;
		size += 1;
		size += 2;
		size += network.size;
		size += timestamp.size;
		size += 4;
		size += signerPublicKey.size;
		size += fee.size;
		size += deadline.size;
		size += 4;
		size += mosaicId.size;
		size += action.size;
		size += delta.size;
		return size;
	}

	@override
	NonVerifiableMosaicSupplyChangeTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var timestamp = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(timestamp.size);
		var signerPublicKeySize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (32 != signerPublicKeySize) {
			throw RangeError('Invalid value of reserved field ($signerPublicKeySize)');
		}
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var fee = Amount().deserialize(buffer);
		buffer = buffer.sublist(fee.size);
		var deadline = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(deadline.size);
		var mosaicIdSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		//marking sizeof field
		var mosaicId = MosaicId().deserialize(buffer);
		buffer = buffer.sublist(mosaicId.size);
		var action = MosaicSupplyChangeAction().deserialize(buffer);
		buffer = buffer.sublist(action.size);
		var delta = Amount().deserialize(buffer);
		buffer = buffer.sublist(delta.size);

		var instance = NonVerifiableMosaicSupplyChangeTransactionV1(
			type: type,
			version: version,
			network: network,
			timestamp: timestamp,
			signerPublicKey: signerPublicKey,
			fee: fee,
			deadline: deadline,
			mosaicId: mosaicId,
			action: action,
			delta: delta,
		);
		return instance;
	}

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_entityBodyReserved_1, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _timestamp.size, _timestamp.serialize());
		currentPos += timestamp.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_signerPublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(mosaicId.size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _mosaicId.size, _mosaicId.serialize());
		currentPos += mosaicId.size;
		buffer.setRange(currentPos, currentPos + _action.size, _action.serialize());
		currentPos += action.size;
		buffer.setRange(currentPos, currentPos + _delta.size, _delta.serialize());
		currentPos += delta.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'NonVerifiableMosaicSupplyChangeTransactionV1(';
		result += 'type: "${_type.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'timestamp: "${_timestamp.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'fee: "${_fee.toString()}", ';
		result += 'deadline: "${_deadline.toString()}", ';
		result += 'mosaicId: "${_mosaicId.toString()}", ';
		result += 'action: "${_action.toString()}", ';
		result += 'delta: "${_delta.toString()}", ';
		result += ')';
		return result;
	}
}


class MultisigAccountModificationType implements IDeserializable {
	static final ADD_COSIGNATORY = MultisigAccountModificationType(1);
	static final DELETE_COSIGNATORY = MultisigAccountModificationType(2);

	final int value;

	static final _flags = {
		1: 'ADD_COSIGNATORY',
		2: 'DELETE_COSIGNATORY',
	};

	MultisigAccountModificationType([int? _value]) : value = _value ?? 1;

	int get size {
		return 4;
	}

	@override
	MultisigAccountModificationType deserialize(Uint8List payload) {
		var byteData = ByteData.sublistView(payload);
		return MultisigAccountModificationType(byteData.getUint32(0, Endian.little));
	}

	Uint8List serialize() {
		var byteData = ByteData(4)..setUint32(0, value, Endian.little);
		return byteData.buffer.asUint8List();
	}

	@override
	String toString() {
		return 'MultisigAccountModificationType.${_flags[value]}';
	}
}


class MultisigAccountModification extends StructBase implements IDeserializable {

	static const Map<String, String> TYPE_HINTS = {
		'modificationType': 'enum:MultisigAccountModificationType',
		'cosignatoryPublicKey': 'pod:PublicKey'
	};

	MultisigAccountModificationType _modificationType = MultisigAccountModificationType.ADD_COSIGNATORY;
	PublicKey _cosignatoryPublicKey = PublicKey();
	final int _cosignatoryPublicKeySize = 32; // reserved field

	MultisigAccountModification({ MultisigAccountModificationType? modificationType, PublicKey? cosignatoryPublicKey}) 
		: super(modificationType == null && cosignatoryPublicKey == null )
	{
		_modificationType = modificationType ?? MultisigAccountModificationType.ADD_COSIGNATORY;
		_cosignatoryPublicKey = cosignatoryPublicKey ?? PublicKey();
	}

	Tuple2 comparer() {
		return Tuple2(
			modificationType.value,
			ripemdKeccak256(cosignatoryPublicKey.bytes),
		);
	}

	void sort() {
		// empty body
	}

	MultisigAccountModificationType get modificationType {
		return _modificationType;
	}

	PublicKey get cosignatoryPublicKey {
		return _cosignatoryPublicKey;
	}

	set modificationType(MultisigAccountModificationType value) {
		_modificationType = value;
	}

	set cosignatoryPublicKey(PublicKey value) {
		_cosignatoryPublicKey = value;
	}

	int get size {
		var size = 0;
		size += modificationType.size;
		size += 4;
		size += cosignatoryPublicKey.size;
		return size;
	}

	@override
	MultisigAccountModification deserialize(Uint8List payload) {
		var buffer = payload;
		var modificationType = MultisigAccountModificationType().deserialize(buffer);
		buffer = buffer.sublist(modificationType.size);
		var cosignatoryPublicKeySize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (32 != cosignatoryPublicKeySize) {
			throw RangeError('Invalid value of reserved field ($cosignatoryPublicKeySize)');
		}
		var cosignatoryPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(cosignatoryPublicKey.size);

		var instance = MultisigAccountModification(
			modificationType: modificationType,
			cosignatoryPublicKey: cosignatoryPublicKey,
		);
		return instance;
	}

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + _modificationType.size, _modificationType.serialize());
		currentPos += modificationType.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_cosignatoryPublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _cosignatoryPublicKey.size, _cosignatoryPublicKey.serialize());
		currentPos += cosignatoryPublicKey.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'MultisigAccountModification(';
		result += 'modificationType: "${_modificationType.toString()}", ';
		result += 'cosignatoryPublicKey: "${_cosignatoryPublicKey.toString()}", ';
		result += ')';
		return result;
	}
}


class SizePrefixedMultisigAccountModification extends StructBase implements IDeserializable {

	static const Map<String, String> TYPE_HINTS = {
		'modification': 'struct:MultisigAccountModification'
	};

	MultisigAccountModification _modification = MultisigAccountModification();

	SizePrefixedMultisigAccountModification([modification]) 
		: super(modification == null )
	{
		_modification = modification ?? MultisigAccountModification();
	}

	void sort() {
		_modification.sort();
	}

	MultisigAccountModification get modification {
		return _modification;
	}

	set modification(MultisigAccountModification value) {
		_modification = value;
	}

	int get size {
		var size = 0;
		size += 4;
		size += modification.size;
		return size;
	}

	@override
	SizePrefixedMultisigAccountModification deserialize(Uint8List payload) {
		var buffer = payload;
		var modificationSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		//marking sizeof field
		var modification = MultisigAccountModification().deserialize(buffer);
		buffer = buffer.sublist(modification.size);

		var instance = SizePrefixedMultisigAccountModification(modification);
		return instance;
	}

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(modification.size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _modification.size, _modification.serialize());
		currentPos += modification.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'SizePrefixedMultisigAccountModification(';
		result += 'modification: "${_modification.toString()}", ';
		result += ')';
		return result;
	}
}


class MultisigAccountModificationTransactionV1 extends StructBase implements IDeserializable {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.MULTISIG_ACCOUNT_MODIFICATION.value);

	static const Map<String, String> TYPE_HINTS = {
		'type': 'enum:TransactionType',
		'network': 'enum:NetworkType',
		'timestamp': 'pod:Timestamp',
		'signerPublicKey': 'pod:PublicKey',
		'signature': 'pod:Signature',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'modifications': 'array[SizePrefixedMultisigAccountModification]'
	};

	TransactionType _type = TransactionType.TRANSFER;
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	Timestamp _timestamp = Timestamp();
	PublicKey _signerPublicKey = PublicKey();
	Signature _signature = Signature();
	Amount _fee = Amount();
	Timestamp _deadline = Timestamp();
	List<SizePrefixedMultisigAccountModification> _modifications = [];
	final int _entityBodyReserved_1 = 0; // reserved field
	final int _signerPublicKeySize = 32; // reserved field
	final int _signatureSize = 64; // reserved field

	MultisigAccountModificationTransactionV1({ 
	TransactionType? type,
	int? version,
	NetworkType? network,
	Timestamp? timestamp,
	PublicKey? signerPublicKey,
	Signature? signature,
	Amount? fee,
	Timestamp? deadline,
	List<SizePrefixedMultisigAccountModification>? modifications
	}) 
		: super(type == null && version == null && network == null && timestamp == null && signerPublicKey == null && signature == null && fee == null && deadline == null && modifications == null )
	{
		_type = type ?? MultisigAccountModificationTransactionV1.TRANSACTION_TYPE;
		_version = version ?? MultisigAccountModificationTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_timestamp = timestamp ?? Timestamp();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_signature = signature ?? Signature();
		_fee = fee ?? Amount();
		_deadline = deadline ?? Timestamp();
		_modifications = modifications ?? [];
	}

	void sort() {
		_modifications.sort((lhs, rhs) {
			return ArrayHelpers.deepCompare(ArrayHelpers.getValue(lhs.modification), ArrayHelpers.getValue(rhs.modification));
		});
	}

	TransactionType get type {
		return _type;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	Timestamp get timestamp {
		return _timestamp;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	Signature get signature {
		return _signature;
	}

	Amount get fee {
		return _fee;
	}

	Timestamp get deadline {
		return _deadline;
	}

	List<SizePrefixedMultisigAccountModification> get modifications {
		return _modifications;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set timestamp(Timestamp value) {
		_timestamp = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set signature(Signature value) {
		_signature = value;
	}

	set fee(Amount value) {
		_fee = value;
	}

	set deadline(Timestamp value) {
		_deadline = value;
	}

	set modifications(List<SizePrefixedMultisigAccountModification> value) {
		_modifications = value;
	}

	int get size {
		var size = 0;
		size += type.size;
		size += 1;
		size += 2;
		size += network.size;
		size += timestamp.size;
		size += 4;
		size += signerPublicKey.size;
		size += 4;
		size += signature.size;
		size += fee.size;
		size += deadline.size;
		size += 4;
		size += ArrayHelpers.size(modifications);
		return size;
	}

	@override
	MultisigAccountModificationTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var timestamp = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(timestamp.size);
		var signerPublicKeySize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (32 != signerPublicKeySize) {
			throw RangeError('Invalid value of reserved field ($signerPublicKeySize)');
		}
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var signatureSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (64 != signatureSize) {
			throw RangeError('Invalid value of reserved field ($signatureSize)');
		}
		var signature = Signature().deserialize(buffer);
		buffer = buffer.sublist(signature.size);
		var fee = Amount().deserialize(buffer);
		buffer = buffer.sublist(fee.size);
		var deadline = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(deadline.size);
		var modificationsCount = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		var modifications = ArrayHelpers.readArrayCount(buffer, SizePrefixedMultisigAccountModification(), modificationsCount, (e) { return ArrayHelpers.getValue(e.modification);}).map((item) => item as SizePrefixedMultisigAccountModification).toList();
		buffer = buffer.sublist(ArrayHelpers.size(modifications));

		var instance = MultisigAccountModificationTransactionV1(
			type: type,
			version: version,
			network: network,
			timestamp: timestamp,
			signerPublicKey: signerPublicKey,
			signature: signature,
			fee: fee,
			deadline: deadline,
			modifications: modifications,
		);
		return instance;
	}

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_entityBodyReserved_1, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _timestamp.size, _timestamp.serialize());
		currentPos += timestamp.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_signerPublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_signatureSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signature.size, _signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_modifications.length, 4));
		currentPos += 4;
		sort();
		var res_modifications = ArrayHelpers.writeArray(buffer, _modifications, currentPos, (e) { return ArrayHelpers.getValue(e.modification);});
		currentPos = res_modifications.item2;
		buffer = res_modifications.item1;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'MultisigAccountModificationTransactionV1(';
		result += 'type: "${_type.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'timestamp: "${_timestamp.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'signature: "${_signature.toString()}", ';
		result += 'fee: "${_fee.toString()}", ';
		result += 'deadline: "${_deadline.toString()}", ';
		result += 'modifications: "${_modifications.map((e) => e.toString()).toList()}", ';
		result += ')';
		return result;
	}
}


class NonVerifiableMultisigAccountModificationTransactionV1 extends StructBase implements IDeserializable, INonVerifiableTransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.MULTISIG_ACCOUNT_MODIFICATION.value);

	static const Map<String, String> TYPE_HINTS = {
		'type': 'enum:TransactionType',
		'network': 'enum:NetworkType',
		'timestamp': 'pod:Timestamp',
		'signerPublicKey': 'pod:PublicKey',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'modifications': 'array[SizePrefixedMultisigAccountModification]'
	};

	TransactionType _type = TransactionType.TRANSFER;
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	Timestamp _timestamp = Timestamp();
	PublicKey _signerPublicKey = PublicKey();
	Amount _fee = Amount();
	Timestamp _deadline = Timestamp();
	List<SizePrefixedMultisigAccountModification> _modifications = [];
	final int _entityBodyReserved_1 = 0; // reserved field
	final int _signerPublicKeySize = 32; // reserved field

	NonVerifiableMultisigAccountModificationTransactionV1({ 
	TransactionType? type,
	int? version,
	NetworkType? network,
	Timestamp? timestamp,
	PublicKey? signerPublicKey,
	Amount? fee,
	Timestamp? deadline,
	List<SizePrefixedMultisigAccountModification>? modifications
	}) 
		: super(type == null && version == null && network == null && timestamp == null && signerPublicKey == null && fee == null && deadline == null && modifications == null )
	{
		_type = type ?? NonVerifiableMultisigAccountModificationTransactionV1.TRANSACTION_TYPE;
		_version = version ?? NonVerifiableMultisigAccountModificationTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_timestamp = timestamp ?? Timestamp();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_fee = fee ?? Amount();
		_deadline = deadline ?? Timestamp();
		_modifications = modifications ?? [];
	}

	void sort() {
		_modifications.sort((lhs, rhs) {
			return ArrayHelpers.deepCompare(ArrayHelpers.getValue(lhs.modification), ArrayHelpers.getValue(rhs.modification));
		});
	}

	TransactionType get type {
		return _type;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	Timestamp get timestamp {
		return _timestamp;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	Amount get fee {
		return _fee;
	}

	Timestamp get deadline {
		return _deadline;
	}

	List<SizePrefixedMultisigAccountModification> get modifications {
		return _modifications;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set timestamp(Timestamp value) {
		_timestamp = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set fee(Amount value) {
		_fee = value;
	}

	set deadline(Timestamp value) {
		_deadline = value;
	}

	set modifications(List<SizePrefixedMultisigAccountModification> value) {
		_modifications = value;
	}

	int get size {
		var size = 0;
		size += type.size;
		size += 1;
		size += 2;
		size += network.size;
		size += timestamp.size;
		size += 4;
		size += signerPublicKey.size;
		size += fee.size;
		size += deadline.size;
		size += 4;
		size += ArrayHelpers.size(modifications);
		return size;
	}

	@override
	NonVerifiableMultisigAccountModificationTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var timestamp = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(timestamp.size);
		var signerPublicKeySize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (32 != signerPublicKeySize) {
			throw RangeError('Invalid value of reserved field ($signerPublicKeySize)');
		}
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var fee = Amount().deserialize(buffer);
		buffer = buffer.sublist(fee.size);
		var deadline = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(deadline.size);
		var modificationsCount = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		var modifications = ArrayHelpers.readArrayCount(buffer, SizePrefixedMultisigAccountModification(), modificationsCount, (e) { return ArrayHelpers.getValue(e.modification);}).map((item) => item as SizePrefixedMultisigAccountModification).toList();
		buffer = buffer.sublist(ArrayHelpers.size(modifications));

		var instance = NonVerifiableMultisigAccountModificationTransactionV1(
			type: type,
			version: version,
			network: network,
			timestamp: timestamp,
			signerPublicKey: signerPublicKey,
			fee: fee,
			deadline: deadline,
			modifications: modifications,
		);
		return instance;
	}

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_entityBodyReserved_1, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _timestamp.size, _timestamp.serialize());
		currentPos += timestamp.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_signerPublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_modifications.length, 4));
		currentPos += 4;
		sort();
		var res_modifications = ArrayHelpers.writeArray(buffer, _modifications, currentPos, (e) { return ArrayHelpers.getValue(e.modification);});
		currentPos = res_modifications.item2;
		buffer = res_modifications.item1;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'NonVerifiableMultisigAccountModificationTransactionV1(';
		result += 'type: "${_type.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'timestamp: "${_timestamp.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'fee: "${_fee.toString()}", ';
		result += 'deadline: "${_deadline.toString()}", ';
		result += 'modifications: "${_modifications.map((e) => e.toString()).toList()}", ';
		result += ')';
		return result;
	}
}


class MultisigAccountModificationTransactionV2 extends StructBase implements IDeserializable {
	static const int TRANSACTION_VERSION = 2;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.MULTISIG_ACCOUNT_MODIFICATION.value);

	static const Map<String, String> TYPE_HINTS = {
		'type': 'enum:TransactionType',
		'network': 'enum:NetworkType',
		'timestamp': 'pod:Timestamp',
		'signerPublicKey': 'pod:PublicKey',
		'signature': 'pod:Signature',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'modifications': 'array[SizePrefixedMultisigAccountModification]'
	};

	TransactionType _type = TransactionType.TRANSFER;
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	Timestamp _timestamp = Timestamp();
	PublicKey _signerPublicKey = PublicKey();
	Signature _signature = Signature();
	Amount _fee = Amount();
	Timestamp _deadline = Timestamp();
	List<SizePrefixedMultisigAccountModification> _modifications = [];
	int _minApprovalDelta = 0;
	final int _entityBodyReserved_1 = 0; // reserved field
	final int _signerPublicKeySize = 32; // reserved field
	final int _signatureSize = 64; // reserved field
	final int _minApprovalDeltaSize = 4; // reserved field

	MultisigAccountModificationTransactionV2({ 
	TransactionType? type,
	int? version,
	NetworkType? network,
	Timestamp? timestamp,
	PublicKey? signerPublicKey,
	Signature? signature,
	Amount? fee,
	Timestamp? deadline,
	List<SizePrefixedMultisigAccountModification>? modifications,
	int? minApprovalDelta
	}) 
		: super(type == null && version == null && network == null && timestamp == null && signerPublicKey == null && signature == null && fee == null && deadline == null && modifications == null && minApprovalDelta == null )
	{
		_type = type ?? MultisigAccountModificationTransactionV2.TRANSACTION_TYPE;
		_version = version ?? MultisigAccountModificationTransactionV2.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_timestamp = timestamp ?? Timestamp();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_signature = signature ?? Signature();
		_fee = fee ?? Amount();
		_deadline = deadline ?? Timestamp();
		_modifications = modifications ?? [];
		_minApprovalDelta = minApprovalDelta ?? 0;
	}

	void sort() {
		_modifications.sort((lhs, rhs) {
			return ArrayHelpers.deepCompare(ArrayHelpers.getValue(lhs.modification), ArrayHelpers.getValue(rhs.modification));
		});
	}

	TransactionType get type {
		return _type;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	Timestamp get timestamp {
		return _timestamp;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	Signature get signature {
		return _signature;
	}

	Amount get fee {
		return _fee;
	}

	Timestamp get deadline {
		return _deadline;
	}

	List<SizePrefixedMultisigAccountModification> get modifications {
		return _modifications;
	}

	int get minApprovalDelta {
		return _minApprovalDelta;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set timestamp(Timestamp value) {
		_timestamp = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set signature(Signature value) {
		_signature = value;
	}

	set fee(Amount value) {
		_fee = value;
	}

	set deadline(Timestamp value) {
		_deadline = value;
	}

	set modifications(List<SizePrefixedMultisigAccountModification> value) {
		_modifications = value;
	}

	set minApprovalDelta(int value) {
		_minApprovalDelta = value;
	}

	int get size {
		var size = 0;
		size += type.size;
		size += 1;
		size += 2;
		size += network.size;
		size += timestamp.size;
		size += 4;
		size += signerPublicKey.size;
		size += 4;
		size += signature.size;
		size += fee.size;
		size += deadline.size;
		size += 4;
		size += ArrayHelpers.size(modifications);
		size += 4;
		size += 4;
		return size;
	}

	@override
	MultisigAccountModificationTransactionV2 deserialize(Uint8List payload) {
		var buffer = payload;
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var timestamp = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(timestamp.size);
		var signerPublicKeySize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (32 != signerPublicKeySize) {
			throw RangeError('Invalid value of reserved field ($signerPublicKeySize)');
		}
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var signatureSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (64 != signatureSize) {
			throw RangeError('Invalid value of reserved field ($signatureSize)');
		}
		var signature = Signature().deserialize(buffer);
		buffer = buffer.sublist(signature.size);
		var fee = Amount().deserialize(buffer);
		buffer = buffer.sublist(fee.size);
		var deadline = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(deadline.size);
		var modificationsCount = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		var modifications = ArrayHelpers.readArrayCount(buffer, SizePrefixedMultisigAccountModification(), modificationsCount, (e) { return ArrayHelpers.getValue(e.modification);}).map((item) => item as SizePrefixedMultisigAccountModification).toList();
		buffer = buffer.sublist(ArrayHelpers.size(modifications));
		var minApprovalDeltaSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (4 != minApprovalDeltaSize) {
			throw RangeError('Invalid value of reserved field ($minApprovalDeltaSize)');
		}
		var minApprovalDelta = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);

		var instance = MultisigAccountModificationTransactionV2(
			type: type,
			version: version,
			network: network,
			timestamp: timestamp,
			signerPublicKey: signerPublicKey,
			signature: signature,
			fee: fee,
			deadline: deadline,
			modifications: modifications,
			minApprovalDelta: minApprovalDelta,
		);
		return instance;
	}

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_entityBodyReserved_1, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _timestamp.size, _timestamp.serialize());
		currentPos += timestamp.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_signerPublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_signatureSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signature.size, _signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_modifications.length, 4));
		currentPos += 4;
		sort();
		var res_modifications = ArrayHelpers.writeArray(buffer, _modifications, currentPos, (e) { return ArrayHelpers.getValue(e.modification);});
		currentPos = res_modifications.item2;
		buffer = res_modifications.item1;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_minApprovalDeltaSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_minApprovalDelta, 4));
		currentPos += 4;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'MultisigAccountModificationTransactionV2(';
		result += 'type: "${_type.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'timestamp: "${_timestamp.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'signature: "${_signature.toString()}", ';
		result += 'fee: "${_fee.toString()}", ';
		result += 'deadline: "${_deadline.toString()}", ';
		result += 'modifications: "${_modifications.map((e) => e.toString()).toList()}", ';
		result += 'minApprovalDelta: "0x${_minApprovalDelta.toRadixString(16).padLeft(4 * 2, '0').toUpperCase()}", ';
		result += ')';
		return result;
	}
}


class NonVerifiableMultisigAccountModificationTransactionV2 extends StructBase implements IDeserializable, INonVerifiableTransaction {
	static const int TRANSACTION_VERSION = 2;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.MULTISIG_ACCOUNT_MODIFICATION.value);

	static const Map<String, String> TYPE_HINTS = {
		'type': 'enum:TransactionType',
		'network': 'enum:NetworkType',
		'timestamp': 'pod:Timestamp',
		'signerPublicKey': 'pod:PublicKey',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'modifications': 'array[SizePrefixedMultisigAccountModification]'
	};

	TransactionType _type = TransactionType.TRANSFER;
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	Timestamp _timestamp = Timestamp();
	PublicKey _signerPublicKey = PublicKey();
	Amount _fee = Amount();
	Timestamp _deadline = Timestamp();
	List<SizePrefixedMultisigAccountModification> _modifications = [];
	int _minApprovalDelta = 0;
	final int _entityBodyReserved_1 = 0; // reserved field
	final int _signerPublicKeySize = 32; // reserved field
	final int _minApprovalDeltaSize = 4; // reserved field

	NonVerifiableMultisigAccountModificationTransactionV2({ 
	TransactionType? type,
	int? version,
	NetworkType? network,
	Timestamp? timestamp,
	PublicKey? signerPublicKey,
	Amount? fee,
	Timestamp? deadline,
	List<SizePrefixedMultisigAccountModification>? modifications,
	int? minApprovalDelta
	}) 
		: super(type == null && version == null && network == null && timestamp == null && signerPublicKey == null && fee == null && deadline == null && modifications == null && minApprovalDelta == null )
	{
		_type = type ?? NonVerifiableMultisigAccountModificationTransactionV2.TRANSACTION_TYPE;
		_version = version ?? NonVerifiableMultisigAccountModificationTransactionV2.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_timestamp = timestamp ?? Timestamp();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_fee = fee ?? Amount();
		_deadline = deadline ?? Timestamp();
		_modifications = modifications ?? [];
		_minApprovalDelta = minApprovalDelta ?? 0;
	}

	void sort() {
		_modifications.sort((lhs, rhs) {
			return ArrayHelpers.deepCompare(ArrayHelpers.getValue(lhs.modification), ArrayHelpers.getValue(rhs.modification));
		});
	}

	TransactionType get type {
		return _type;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	Timestamp get timestamp {
		return _timestamp;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	Amount get fee {
		return _fee;
	}

	Timestamp get deadline {
		return _deadline;
	}

	List<SizePrefixedMultisigAccountModification> get modifications {
		return _modifications;
	}

	int get minApprovalDelta {
		return _minApprovalDelta;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set timestamp(Timestamp value) {
		_timestamp = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set fee(Amount value) {
		_fee = value;
	}

	set deadline(Timestamp value) {
		_deadline = value;
	}

	set modifications(List<SizePrefixedMultisigAccountModification> value) {
		_modifications = value;
	}

	set minApprovalDelta(int value) {
		_minApprovalDelta = value;
	}

	int get size {
		var size = 0;
		size += type.size;
		size += 1;
		size += 2;
		size += network.size;
		size += timestamp.size;
		size += 4;
		size += signerPublicKey.size;
		size += fee.size;
		size += deadline.size;
		size += 4;
		size += ArrayHelpers.size(modifications);
		size += 4;
		size += 4;
		return size;
	}

	@override
	NonVerifiableMultisigAccountModificationTransactionV2 deserialize(Uint8List payload) {
		var buffer = payload;
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var timestamp = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(timestamp.size);
		var signerPublicKeySize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (32 != signerPublicKeySize) {
			throw RangeError('Invalid value of reserved field ($signerPublicKeySize)');
		}
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var fee = Amount().deserialize(buffer);
		buffer = buffer.sublist(fee.size);
		var deadline = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(deadline.size);
		var modificationsCount = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		var modifications = ArrayHelpers.readArrayCount(buffer, SizePrefixedMultisigAccountModification(), modificationsCount, (e) { return ArrayHelpers.getValue(e.modification);}).map((item) => item as SizePrefixedMultisigAccountModification).toList();
		buffer = buffer.sublist(ArrayHelpers.size(modifications));
		var minApprovalDeltaSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (4 != minApprovalDeltaSize) {
			throw RangeError('Invalid value of reserved field ($minApprovalDeltaSize)');
		}
		var minApprovalDelta = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);

		var instance = NonVerifiableMultisigAccountModificationTransactionV2(
			type: type,
			version: version,
			network: network,
			timestamp: timestamp,
			signerPublicKey: signerPublicKey,
			fee: fee,
			deadline: deadline,
			modifications: modifications,
			minApprovalDelta: minApprovalDelta,
		);
		return instance;
	}

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_entityBodyReserved_1, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _timestamp.size, _timestamp.serialize());
		currentPos += timestamp.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_signerPublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_modifications.length, 4));
		currentPos += 4;
		sort();
		var res_modifications = ArrayHelpers.writeArray(buffer, _modifications, currentPos, (e) { return ArrayHelpers.getValue(e.modification);});
		currentPos = res_modifications.item2;
		buffer = res_modifications.item1;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_minApprovalDeltaSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_minApprovalDelta, 4));
		currentPos += 4;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'NonVerifiableMultisigAccountModificationTransactionV2(';
		result += 'type: "${_type.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'timestamp: "${_timestamp.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'fee: "${_fee.toString()}", ';
		result += 'deadline: "${_deadline.toString()}", ';
		result += 'modifications: "${_modifications.map((e) => e.toString()).toList()}", ';
		result += 'minApprovalDelta: "0x${_minApprovalDelta.toRadixString(16).padLeft(4 * 2, '0').toUpperCase()}", ';
		result += ')';
		return result;
	}
}


class CosignatureV1 extends StructBase implements IDeserializable {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.MULTISIG_COSIGNATURE.value);

	static const Map<String, String> TYPE_HINTS = {
		'type': 'enum:TransactionType',
		'network': 'enum:NetworkType',
		'timestamp': 'pod:Timestamp',
		'signerPublicKey': 'pod:PublicKey',
		'signature': 'pod:Signature',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'multisigTransactionHash': 'pod:Hash256',
		'multisigAccountAddress': 'pod:Address'
	};

	TransactionType _type = TransactionType.TRANSFER;
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	Timestamp _timestamp = Timestamp();
	PublicKey _signerPublicKey = PublicKey();
	Signature _signature = Signature();
	Amount _fee = Amount();
	Timestamp _deadline = Timestamp();
	Hash256 _multisigTransactionHash = Hash256();
	Address _multisigAccountAddress = Address();
	final int _entityBodyReserved_1 = 0; // reserved field
	final int _signerPublicKeySize = 32; // reserved field
	final int _signatureSize = 64; // reserved field
	final int _multisigTransactionHashOuterSize = 36; // reserved field
	final int _multisigTransactionHashSize = 32; // reserved field
	final int _multisigAccountAddressSize = 40; // reserved field

	CosignatureV1({ 
	TransactionType? type,
	int? version,
	NetworkType? network,
	Timestamp? timestamp,
	PublicKey? signerPublicKey,
	Signature? signature,
	Amount? fee,
	Timestamp? deadline,
	Hash256? multisigTransactionHash,
	Address? multisigAccountAddress
	}) 
		: super(type == null && version == null && network == null && timestamp == null && signerPublicKey == null && signature == null && fee == null && deadline == null && multisigTransactionHash == null && multisigAccountAddress == null )
	{
		_type = type ?? CosignatureV1.TRANSACTION_TYPE;
		_version = version ?? CosignatureV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_timestamp = timestamp ?? Timestamp();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_signature = signature ?? Signature();
		_fee = fee ?? Amount();
		_deadline = deadline ?? Timestamp();
		_multisigTransactionHash = multisigTransactionHash ?? Hash256();
		_multisigAccountAddress = multisigAccountAddress ?? Address();
	}

	void sort() {
		// empty body
	}

	TransactionType get type {
		return _type;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	Timestamp get timestamp {
		return _timestamp;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	Signature get signature {
		return _signature;
	}

	Amount get fee {
		return _fee;
	}

	Timestamp get deadline {
		return _deadline;
	}

	Hash256 get multisigTransactionHash {
		return _multisigTransactionHash;
	}

	Address get multisigAccountAddress {
		return _multisigAccountAddress;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set timestamp(Timestamp value) {
		_timestamp = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set signature(Signature value) {
		_signature = value;
	}

	set fee(Amount value) {
		_fee = value;
	}

	set deadline(Timestamp value) {
		_deadline = value;
	}

	set multisigTransactionHash(Hash256 value) {
		_multisigTransactionHash = value;
	}

	set multisigAccountAddress(Address value) {
		_multisigAccountAddress = value;
	}

	int get size {
		var size = 0;
		size += type.size;
		size += 1;
		size += 2;
		size += network.size;
		size += timestamp.size;
		size += 4;
		size += signerPublicKey.size;
		size += 4;
		size += signature.size;
		size += fee.size;
		size += deadline.size;
		size += 4;
		size += 4;
		size += multisigTransactionHash.size;
		size += 4;
		size += multisigAccountAddress.size;
		return size;
	}

	@override
	CosignatureV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var timestamp = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(timestamp.size);
		var signerPublicKeySize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (32 != signerPublicKeySize) {
			throw RangeError('Invalid value of reserved field ($signerPublicKeySize)');
		}
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var signatureSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (64 != signatureSize) {
			throw RangeError('Invalid value of reserved field ($signatureSize)');
		}
		var signature = Signature().deserialize(buffer);
		buffer = buffer.sublist(signature.size);
		var fee = Amount().deserialize(buffer);
		buffer = buffer.sublist(fee.size);
		var deadline = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(deadline.size);
		var multisigTransactionHashOuterSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (36 != multisigTransactionHashOuterSize) {
			throw RangeError('Invalid value of reserved field ($multisigTransactionHashOuterSize)');
		}
		var multisigTransactionHashSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (32 != multisigTransactionHashSize) {
			throw RangeError('Invalid value of reserved field ($multisigTransactionHashSize)');
		}
		var multisigTransactionHash = Hash256().deserialize(buffer);
		buffer = buffer.sublist(multisigTransactionHash.size);
		var multisigAccountAddressSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (40 != multisigAccountAddressSize) {
			throw RangeError('Invalid value of reserved field ($multisigAccountAddressSize)');
		}
		var multisigAccountAddress = Address().deserialize(buffer);
		buffer = buffer.sublist(multisigAccountAddress.size);

		var instance = CosignatureV1(
			type: type,
			version: version,
			network: network,
			timestamp: timestamp,
			signerPublicKey: signerPublicKey,
			signature: signature,
			fee: fee,
			deadline: deadline,
			multisigTransactionHash: multisigTransactionHash,
			multisigAccountAddress: multisigAccountAddress,
		);
		return instance;
	}

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_entityBodyReserved_1, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _timestamp.size, _timestamp.serialize());
		currentPos += timestamp.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_signerPublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_signatureSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signature.size, _signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_multisigTransactionHashOuterSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_multisigTransactionHashSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _multisigTransactionHash.size, _multisigTransactionHash.serialize());
		currentPos += multisigTransactionHash.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_multisigAccountAddressSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _multisigAccountAddress.size, _multisigAccountAddress.serialize());
		currentPos += multisigAccountAddress.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'CosignatureV1(';
		result += 'type: "${_type.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'timestamp: "${_timestamp.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'signature: "${_signature.toString()}", ';
		result += 'fee: "${_fee.toString()}", ';
		result += 'deadline: "${_deadline.toString()}", ';
		result += 'multisigTransactionHash: "${_multisigTransactionHash.toString()}", ';
		result += 'multisigAccountAddress: "${_multisigAccountAddress.toString()}", ';
		result += ')';
		return result;
	}
}


class SizePrefixedCosignatureV1 extends StructBase implements IDeserializable {

	static const Map<String, String> TYPE_HINTS = {
		'cosignature': 'struct:CosignatureV1'
	};

	CosignatureV1 _cosignature = CosignatureV1();

	SizePrefixedCosignatureV1([cosignature]) 
		: super(cosignature == null )
	{
		_cosignature = cosignature ?? CosignatureV1();
	}

	void sort() {
		_cosignature.sort();
	}

	CosignatureV1 get cosignature {
		return _cosignature;
	}

	set cosignature(CosignatureV1 value) {
		_cosignature = value;
	}

	int get size {
		var size = 0;
		size += 4;
		size += cosignature.size;
		return size;
	}

	@override
	SizePrefixedCosignatureV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var cosignatureSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		//marking sizeof field
		var cosignature = CosignatureV1().deserialize(buffer);
		buffer = buffer.sublist(cosignature.size);

		var instance = SizePrefixedCosignatureV1(cosignature);
		return instance;
	}

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(cosignature.size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _cosignature.size, _cosignature.serialize());
		currentPos += cosignature.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'SizePrefixedCosignatureV1(';
		result += 'cosignature: "${_cosignature.toString()}", ';
		result += ')';
		return result;
	}
}


class MultisigTransactionV1 extends StructBase implements IDeserializable {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.MULTISIG.value);

	static const Map<String, String> TYPE_HINTS = {
		'type': 'enum:TransactionType',
		'network': 'enum:NetworkType',
		'timestamp': 'pod:Timestamp',
		'signerPublicKey': 'pod:PublicKey',
		'signature': 'pod:Signature',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'innerTransaction': 'struct:NonVerifiableTransaction',
		'cosignatures': 'array[SizePrefixedCosignatureV1]'
	};

	TransactionType _type = TransactionType.TRANSFER;
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	Timestamp _timestamp = Timestamp();
	PublicKey _signerPublicKey = PublicKey();
	Signature _signature = Signature();
	Amount _fee = Amount();
	Timestamp _deadline = Timestamp();
	INonVerifiableTransaction _innerTransaction = INonVerifiableTransaction();
	List<SizePrefixedCosignatureV1> _cosignatures = [];
	final int _entityBodyReserved_1 = 0; // reserved field
	final int _signerPublicKeySize = 32; // reserved field
	final int _signatureSize = 64; // reserved field

	MultisigTransactionV1({ 
	TransactionType? type,
	int? version,
	NetworkType? network,
	Timestamp? timestamp,
	PublicKey? signerPublicKey,
	Signature? signature,
	Amount? fee,
	Timestamp? deadline,
	INonVerifiableTransaction? innerTransaction,
	List<SizePrefixedCosignatureV1>? cosignatures
	}) 
		: super(type == null && version == null && network == null && timestamp == null && signerPublicKey == null && signature == null && fee == null && deadline == null && innerTransaction == null && cosignatures == null )
	{
		_type = type ?? MultisigTransactionV1.TRANSACTION_TYPE;
		_version = version ?? MultisigTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_timestamp = timestamp ?? Timestamp();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_signature = signature ?? Signature();
		_fee = fee ?? Amount();
		_deadline = deadline ?? Timestamp();
		_innerTransaction = innerTransaction ?? NonVerifiableTransaction();
		_cosignatures = cosignatures ?? [];
	}

	void sort() {
		_innerTransaction.sort();
	}

	TransactionType get type {
		return _type;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	Timestamp get timestamp {
		return _timestamp;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	Signature get signature {
		return _signature;
	}

	Amount get fee {
		return _fee;
	}

	Timestamp get deadline {
		return _deadline;
	}

	INonVerifiableTransaction get innerTransaction {
		return _innerTransaction;
	}

	List<SizePrefixedCosignatureV1> get cosignatures {
		return _cosignatures;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set timestamp(Timestamp value) {
		_timestamp = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set signature(Signature value) {
		_signature = value;
	}

	set fee(Amount value) {
		_fee = value;
	}

	set deadline(Timestamp value) {
		_deadline = value;
	}

	set innerTransaction(INonVerifiableTransaction value) {
		_innerTransaction = value;
	}

	set cosignatures(List<SizePrefixedCosignatureV1> value) {
		_cosignatures = value;
	}

	int get size {
		var size = 0;
		size += type.size;
		size += 1;
		size += 2;
		size += network.size;
		size += timestamp.size;
		size += 4;
		size += signerPublicKey.size;
		size += 4;
		size += signature.size;
		size += fee.size;
		size += deadline.size;
		size += 4;
		size += innerTransaction.size;
		size += 4;
		size += ArrayHelpers.size(cosignatures);
		return size;
	}

	@override
	MultisigTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var timestamp = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(timestamp.size);
		var signerPublicKeySize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (32 != signerPublicKeySize) {
			throw RangeError('Invalid value of reserved field ($signerPublicKeySize)');
		}
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var signatureSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (64 != signatureSize) {
			throw RangeError('Invalid value of reserved field ($signatureSize)');
		}
		var signature = Signature().deserialize(buffer);
		buffer = buffer.sublist(signature.size);
		var fee = Amount().deserialize(buffer);
		buffer = buffer.sublist(fee.size);
		var deadline = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(deadline.size);
		var innerTransactionSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		//marking sizeof field
		var innerTransaction = NonVerifiableTransactionFactory().deserialize(buffer);
		buffer = buffer.sublist(innerTransaction.size);
		var cosignaturesCount = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		var cosignatures = ArrayHelpers.readArrayCount(buffer, SizePrefixedCosignatureV1(), cosignaturesCount).map((item) => item as SizePrefixedCosignatureV1).toList();
		buffer = buffer.sublist(ArrayHelpers.size(cosignatures));

		var instance = MultisigTransactionV1(
			type: type,
			version: version,
			network: network,
			timestamp: timestamp,
			signerPublicKey: signerPublicKey,
			signature: signature,
			fee: fee,
			deadline: deadline,
			innerTransaction: innerTransaction,
			cosignatures: cosignatures,
		);
		return instance;
	}

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_entityBodyReserved_1, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _timestamp.size, _timestamp.serialize());
		currentPos += timestamp.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_signerPublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_signatureSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signature.size, _signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(innerTransaction.size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _innerTransaction.size, _innerTransaction.serialize());
		currentPos += innerTransaction.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_cosignatures.length, 4));
		currentPos += 4;
		sort();
		var res_cosignatures = ArrayHelpers.writeArray(buffer, _cosignatures, currentPos);
		currentPos = res_cosignatures.item2;
		buffer = res_cosignatures.item1;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'MultisigTransactionV1(';
		result += 'type: "${_type.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'timestamp: "${_timestamp.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'signature: "${_signature.toString()}", ';
		result += 'fee: "${_fee.toString()}", ';
		result += 'deadline: "${_deadline.toString()}", ';
		result += 'innerTransaction: "${_innerTransaction.toString()}", ';
		result += 'cosignatures: "${_cosignatures.map((e) => e.toString()).toList()}", ';
		result += ')';
		return result;
	}
}


class NonVerifiableMultisigTransactionV1 extends StructBase implements IDeserializable, INonVerifiableTransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.MULTISIG.value);

	static const Map<String, String> TYPE_HINTS = {
		'type': 'enum:TransactionType',
		'network': 'enum:NetworkType',
		'timestamp': 'pod:Timestamp',
		'signerPublicKey': 'pod:PublicKey',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'innerTransaction': 'struct:NonVerifiableTransaction'
	};

	TransactionType _type = TransactionType.TRANSFER;
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	Timestamp _timestamp = Timestamp();
	PublicKey _signerPublicKey = PublicKey();
	Amount _fee = Amount();
	Timestamp _deadline = Timestamp();
	INonVerifiableTransaction _innerTransaction = INonVerifiableTransaction();
	final int _entityBodyReserved_1 = 0; // reserved field
	final int _signerPublicKeySize = 32; // reserved field

	NonVerifiableMultisigTransactionV1({ 
	TransactionType? type,
	int? version,
	NetworkType? network,
	Timestamp? timestamp,
	PublicKey? signerPublicKey,
	Amount? fee,
	Timestamp? deadline,
	INonVerifiableTransaction? innerTransaction
	}) 
		: super(type == null && version == null && network == null && timestamp == null && signerPublicKey == null && fee == null && deadline == null && innerTransaction == null )
	{
		_type = type ?? NonVerifiableMultisigTransactionV1.TRANSACTION_TYPE;
		_version = version ?? NonVerifiableMultisigTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_timestamp = timestamp ?? Timestamp();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_fee = fee ?? Amount();
		_deadline = deadline ?? Timestamp();
		_innerTransaction = innerTransaction ?? NonVerifiableTransaction();
	}

	void sort() {
		_innerTransaction.sort();
	}

	TransactionType get type {
		return _type;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	Timestamp get timestamp {
		return _timestamp;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	Amount get fee {
		return _fee;
	}

	Timestamp get deadline {
		return _deadline;
	}

	INonVerifiableTransaction get innerTransaction {
		return _innerTransaction;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set timestamp(Timestamp value) {
		_timestamp = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set fee(Amount value) {
		_fee = value;
	}

	set deadline(Timestamp value) {
		_deadline = value;
	}

	set innerTransaction(INonVerifiableTransaction value) {
		_innerTransaction = value;
	}

	int get size {
		var size = 0;
		size += type.size;
		size += 1;
		size += 2;
		size += network.size;
		size += timestamp.size;
		size += 4;
		size += signerPublicKey.size;
		size += fee.size;
		size += deadline.size;
		size += 4;
		size += innerTransaction.size;
		return size;
	}

	@override
	NonVerifiableMultisigTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var timestamp = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(timestamp.size);
		var signerPublicKeySize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (32 != signerPublicKeySize) {
			throw RangeError('Invalid value of reserved field ($signerPublicKeySize)');
		}
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var fee = Amount().deserialize(buffer);
		buffer = buffer.sublist(fee.size);
		var deadline = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(deadline.size);
		var innerTransactionSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		//marking sizeof field
		var innerTransaction = NonVerifiableTransactionFactory().deserialize(buffer);
		buffer = buffer.sublist(innerTransaction.size);

		var instance = NonVerifiableMultisigTransactionV1(
			type: type,
			version: version,
			network: network,
			timestamp: timestamp,
			signerPublicKey: signerPublicKey,
			fee: fee,
			deadline: deadline,
			innerTransaction: innerTransaction,
		);
		return instance;
	}

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_entityBodyReserved_1, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _timestamp.size, _timestamp.serialize());
		currentPos += timestamp.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_signerPublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(innerTransaction.size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _innerTransaction.size, _innerTransaction.serialize());
		currentPos += innerTransaction.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'NonVerifiableMultisigTransactionV1(';
		result += 'type: "${_type.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'timestamp: "${_timestamp.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'fee: "${_fee.toString()}", ';
		result += 'deadline: "${_deadline.toString()}", ';
		result += 'innerTransaction: "${_innerTransaction.toString()}", ';
		result += ')';
		return result;
	}
}


class NamespaceRegistrationTransactionV1 extends StructBase implements IDeserializable {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.NAMESPACE_REGISTRATION.value);

	static const Map<String, String> TYPE_HINTS = {
		'type': 'enum:TransactionType',
		'network': 'enum:NetworkType',
		'timestamp': 'pod:Timestamp',
		'signerPublicKey': 'pod:PublicKey',
		'signature': 'pod:Signature',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'rentalFeeSink': 'pod:Address',
		'rentalFee': 'pod:Amount',
		'name': 'bytes_array',
		'parentName': 'bytes_array'
	};

	TransactionType _type = TransactionType.TRANSFER;
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	Timestamp _timestamp = Timestamp();
	PublicKey _signerPublicKey = PublicKey();
	Signature _signature = Signature();
	Amount _fee = Amount();
	Timestamp _deadline = Timestamp();
	Address _rentalFeeSink = Address();
	Amount _rentalFee = Amount();
	Uint8List _name = Uint8List(0);
	Uint8List _parentName = Uint8List(0);
	final int _entityBodyReserved_1 = 0; // reserved field
	final int _signerPublicKeySize = 32; // reserved field
	final int _signatureSize = 64; // reserved field
	final int _rentalFeeSinkSize = 40; // reserved field

	NamespaceRegistrationTransactionV1({ 
	TransactionType? type,
	int? version,
	NetworkType? network,
	Timestamp? timestamp,
	PublicKey? signerPublicKey,
	Signature? signature,
	Amount? fee,
	Timestamp? deadline,
	Address? rentalFeeSink,
	Amount? rentalFee,
	Uint8List? name,
	Uint8List? parentName
	}) 
		: super(type == null && version == null && network == null && timestamp == null && signerPublicKey == null && signature == null && fee == null && deadline == null && rentalFeeSink == null && rentalFee == null && name == null && parentName == null )
	{
		_type = type ?? NamespaceRegistrationTransactionV1.TRANSACTION_TYPE;
		_version = version ?? NamespaceRegistrationTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_timestamp = timestamp ?? Timestamp();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_signature = signature ?? Signature();
		_fee = fee ?? Amount();
		_deadline = deadline ?? Timestamp();
		_rentalFeeSink = rentalFeeSink ?? Address();
		_rentalFee = rentalFee ?? Amount();
		_name = name ?? Uint8List(0);
		_parentName = parentName ?? Uint8List(0);
	}

	void sort() {
		// empty body
	}

	TransactionType get type {
		return _type;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	Timestamp get timestamp {
		return _timestamp;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	Signature get signature {
		return _signature;
	}

	Amount get fee {
		return _fee;
	}

	Timestamp get deadline {
		return _deadline;
	}

	Address get rentalFeeSink {
		return _rentalFeeSink;
	}

	Amount get rentalFee {
		return _rentalFee;
	}

	Uint8List get name {
		return _name;
	}

	Uint8List get parentName {
		return _parentName;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set timestamp(Timestamp value) {
		_timestamp = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set signature(Signature value) {
		_signature = value;
	}

	set fee(Amount value) {
		_fee = value;
	}

	set deadline(Timestamp value) {
		_deadline = value;
	}

	set rentalFeeSink(Address value) {
		_rentalFeeSink = value;
	}

	set rentalFee(Amount value) {
		_rentalFee = value;
	}

	set name(Uint8List value) {
		_name = value;
	}

	set parentName(Uint8List value) {
		_parentName = value;
	}

	int get size {
		var size = 0;
		size += type.size;
		size += 1;
		size += 2;
		size += network.size;
		size += timestamp.size;
		size += 4;
		size += signerPublicKey.size;
		size += 4;
		size += signature.size;
		size += fee.size;
		size += deadline.size;
		size += 4;
		size += rentalFeeSink.size;
		size += rentalFee.size;
		size += 4;
		size += name.lengthInBytes;
		size += 4;
		if (parentName.isNotEmpty)
		{
			size += parentName.lengthInBytes;
		}
		return size;
	}

	@override
	NamespaceRegistrationTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var timestamp = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(timestamp.size);
		var signerPublicKeySize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (32 != signerPublicKeySize) {
			throw RangeError('Invalid value of reserved field ($signerPublicKeySize)');
		}
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var signatureSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (64 != signatureSize) {
			throw RangeError('Invalid value of reserved field ($signatureSize)');
		}
		var signature = Signature().deserialize(buffer);
		buffer = buffer.sublist(signature.size);
		var fee = Amount().deserialize(buffer);
		buffer = buffer.sublist(fee.size);
		var deadline = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(deadline.size);
		var rentalFeeSinkSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (40 != rentalFeeSinkSize) {
			throw RangeError('Invalid value of reserved field ($rentalFeeSinkSize)');
		}
		var rentalFeeSink = Address().deserialize(buffer);
		buffer = buffer.sublist(rentalFeeSink.size);
		var rentalFee = Amount().deserialize(buffer);
		buffer = buffer.sublist(rentalFee.size);
		var nameSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		var name = Uint8List.fromList(buffer.sublist(0, nameSize));
		buffer = buffer.sublist(nameSize);
		var parentNameSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		var parentName = Uint8List(0);
		if (-1 != parentNameSize)
		{
			parentName = Uint8List.fromList(buffer.sublist(0, parentNameSize));
			buffer = buffer.sublist(parentNameSize);
		}

		var instance = NamespaceRegistrationTransactionV1(
			type: type,
			version: version,
			network: network,
			timestamp: timestamp,
			signerPublicKey: signerPublicKey,
			signature: signature,
			fee: fee,
			deadline: deadline,
			rentalFeeSink: rentalFeeSink,
			rentalFee: rentalFee,
			name: name,
			parentName: parentName,
		);
		return instance;
	}

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_entityBodyReserved_1, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _timestamp.size, _timestamp.serialize());
		currentPos += timestamp.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_signerPublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_signatureSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signature.size, _signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_rentalFeeSinkSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _rentalFeeSink.size, _rentalFeeSink.serialize());
		currentPos += rentalFeeSink.size;
		buffer.setRange(currentPos, currentPos + _rentalFee.size, _rentalFee.serialize());
		currentPos += rentalFee.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_name.length, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _name.lengthInBytes, _name);
		currentPos += name.lengthInBytes;
		buffer.setRange(currentPos, currentPos + 4, intToBytes((_parentName.isNotEmpty ? _parentName.length : 4294967295), 4));
		currentPos += 4;
		if (parentName.isNotEmpty)
		{
			buffer.setRange(currentPos, currentPos + _parentName.lengthInBytes, _parentName);
			currentPos += parentName.lengthInBytes;
		}
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'NamespaceRegistrationTransactionV1(';
		result += 'type: "${_type.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'timestamp: "${_timestamp.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'signature: "${_signature.toString()}", ';
		result += 'fee: "${_fee.toString()}", ';
		result += 'deadline: "${_deadline.toString()}", ';
		result += 'rentalFeeSink: "${_rentalFeeSink.toString()}", ';
		result += 'rentalFee: "${_rentalFee.toString()}", ';
		result += 'name: "${hex.encode(_name.toList()).toUpperCase()}", ';
		if (parentName.isNotEmpty)
		{
			result += 'parentName: "${hex.encode(_parentName.toList()).toUpperCase()}", ';
		}
		result += ')';
		return result;
	}
}


class NonVerifiableNamespaceRegistrationTransactionV1 extends StructBase implements IDeserializable, INonVerifiableTransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.NAMESPACE_REGISTRATION.value);

	static const Map<String, String> TYPE_HINTS = {
		'type': 'enum:TransactionType',
		'network': 'enum:NetworkType',
		'timestamp': 'pod:Timestamp',
		'signerPublicKey': 'pod:PublicKey',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'rentalFeeSink': 'pod:Address',
		'rentalFee': 'pod:Amount',
		'name': 'bytes_array',
		'parentName': 'bytes_array'
	};

	TransactionType _type = TransactionType.TRANSFER;
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	Timestamp _timestamp = Timestamp();
	PublicKey _signerPublicKey = PublicKey();
	Amount _fee = Amount();
	Timestamp _deadline = Timestamp();
	Address _rentalFeeSink = Address();
	Amount _rentalFee = Amount();
	Uint8List _name = Uint8List(0);
	Uint8List _parentName = Uint8List(0);
	final int _entityBodyReserved_1 = 0; // reserved field
	final int _signerPublicKeySize = 32; // reserved field
	final int _rentalFeeSinkSize = 40; // reserved field

	NonVerifiableNamespaceRegistrationTransactionV1({ 
	TransactionType? type,
	int? version,
	NetworkType? network,
	Timestamp? timestamp,
	PublicKey? signerPublicKey,
	Amount? fee,
	Timestamp? deadline,
	Address? rentalFeeSink,
	Amount? rentalFee,
	Uint8List? name,
	Uint8List? parentName
	}) 
		: super(type == null && version == null && network == null && timestamp == null && signerPublicKey == null && fee == null && deadline == null && rentalFeeSink == null && rentalFee == null && name == null && parentName == null )
	{
		_type = type ?? NonVerifiableNamespaceRegistrationTransactionV1.TRANSACTION_TYPE;
		_version = version ?? NonVerifiableNamespaceRegistrationTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_timestamp = timestamp ?? Timestamp();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_fee = fee ?? Amount();
		_deadline = deadline ?? Timestamp();
		_rentalFeeSink = rentalFeeSink ?? Address();
		_rentalFee = rentalFee ?? Amount();
		_name = name ?? Uint8List(0);
		_parentName = parentName ?? Uint8List(0);
	}

	void sort() {
		// empty body
	}

	TransactionType get type {
		return _type;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	Timestamp get timestamp {
		return _timestamp;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	Amount get fee {
		return _fee;
	}

	Timestamp get deadline {
		return _deadline;
	}

	Address get rentalFeeSink {
		return _rentalFeeSink;
	}

	Amount get rentalFee {
		return _rentalFee;
	}

	Uint8List get name {
		return _name;
	}

	Uint8List get parentName {
		return _parentName;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set timestamp(Timestamp value) {
		_timestamp = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set fee(Amount value) {
		_fee = value;
	}

	set deadline(Timestamp value) {
		_deadline = value;
	}

	set rentalFeeSink(Address value) {
		_rentalFeeSink = value;
	}

	set rentalFee(Amount value) {
		_rentalFee = value;
	}

	set name(Uint8List value) {
		_name = value;
	}

	set parentName(Uint8List value) {
		_parentName = value;
	}

	int get size {
		var size = 0;
		size += type.size;
		size += 1;
		size += 2;
		size += network.size;
		size += timestamp.size;
		size += 4;
		size += signerPublicKey.size;
		size += fee.size;
		size += deadline.size;
		size += 4;
		size += rentalFeeSink.size;
		size += rentalFee.size;
		size += 4;
		size += name.lengthInBytes;
		size += 4;
		if (parentName.isNotEmpty)
		{
			size += parentName.lengthInBytes;
		}
		return size;
	}

	@override
	NonVerifiableNamespaceRegistrationTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var timestamp = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(timestamp.size);
		var signerPublicKeySize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (32 != signerPublicKeySize) {
			throw RangeError('Invalid value of reserved field ($signerPublicKeySize)');
		}
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var fee = Amount().deserialize(buffer);
		buffer = buffer.sublist(fee.size);
		var deadline = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(deadline.size);
		var rentalFeeSinkSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (40 != rentalFeeSinkSize) {
			throw RangeError('Invalid value of reserved field ($rentalFeeSinkSize)');
		}
		var rentalFeeSink = Address().deserialize(buffer);
		buffer = buffer.sublist(rentalFeeSink.size);
		var rentalFee = Amount().deserialize(buffer);
		buffer = buffer.sublist(rentalFee.size);
		var nameSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		var name = Uint8List.fromList(buffer.sublist(0, nameSize));
		buffer = buffer.sublist(nameSize);
		var parentNameSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		var parentName = Uint8List(0);
		if (-1 != parentNameSize)
		{
			parentName = Uint8List.fromList(buffer.sublist(0, parentNameSize));
			buffer = buffer.sublist(parentNameSize);
		}

		var instance = NonVerifiableNamespaceRegistrationTransactionV1(
			type: type,
			version: version,
			network: network,
			timestamp: timestamp,
			signerPublicKey: signerPublicKey,
			fee: fee,
			deadline: deadline,
			rentalFeeSink: rentalFeeSink,
			rentalFee: rentalFee,
			name: name,
			parentName: parentName,
		);
		return instance;
	}

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_entityBodyReserved_1, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _timestamp.size, _timestamp.serialize());
		currentPos += timestamp.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_signerPublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_rentalFeeSinkSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _rentalFeeSink.size, _rentalFeeSink.serialize());
		currentPos += rentalFeeSink.size;
		buffer.setRange(currentPos, currentPos + _rentalFee.size, _rentalFee.serialize());
		currentPos += rentalFee.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_name.length, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _name.lengthInBytes, _name);
		currentPos += name.lengthInBytes;
		buffer.setRange(currentPos, currentPos + 4, intToBytes((_parentName.isNotEmpty ? _parentName.length : 4294967295), 4));
		currentPos += 4;
		if (parentName.isNotEmpty)
		{
			buffer.setRange(currentPos, currentPos + _parentName.lengthInBytes, _parentName);
			currentPos += parentName.lengthInBytes;
		}
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'NonVerifiableNamespaceRegistrationTransactionV1(';
		result += 'type: "${_type.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'timestamp: "${_timestamp.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'fee: "${_fee.toString()}", ';
		result += 'deadline: "${_deadline.toString()}", ';
		result += 'rentalFeeSink: "${_rentalFeeSink.toString()}", ';
		result += 'rentalFee: "${_rentalFee.toString()}", ';
		result += 'name: "${hex.encode(_name.toList()).toUpperCase()}", ';
		if (parentName.isNotEmpty)
		{
			result += 'parentName: "${hex.encode(_parentName.toList()).toUpperCase()}", ';
		}
		result += ')';
		return result;
	}
}


class MessageType implements IDeserializable {
	static final PLAIN = MessageType(1);
	static final ENCRYPTED = MessageType(2);

	final int value;

	static final _flags = {
		1: 'PLAIN',
		2: 'ENCRYPTED',
	};

	MessageType([int? _value]) : value = _value ?? 1;

	int get size {
		return 4;
	}

	@override
	MessageType deserialize(Uint8List payload) {
		var byteData = ByteData.sublistView(payload);
		return MessageType(byteData.getUint32(0, Endian.little));
	}

	Uint8List serialize() {
		var byteData = ByteData(4)..setUint32(0, value, Endian.little);
		return byteData.buffer.asUint8List();
	}

	@override
	String toString() {
		return 'MessageType.${_flags[value]}';
	}
}


class Message extends StructBase implements IDeserializable {

	static const Map<String, String> TYPE_HINTS = {
		'messageType': 'enum:MessageType',
		'message': 'bytes_array'
	};

	MessageType _messageType = MessageType.PLAIN;
	Uint8List _message = Uint8List(0);

	Message({ MessageType? messageType, Uint8List? message}) 
		: super(messageType == null && message == null )
	{
		_messageType = messageType ?? MessageType.PLAIN;
		_message = message ?? Uint8List(0);
	}

	void sort() {
		// empty body
	}

	MessageType get messageType {
		return _messageType;
	}

	Uint8List get message {
		return _message;
	}

	set messageType(MessageType value) {
		_messageType = value;
	}

	set message(Uint8List value) {
		_message = value;
	}

	int get size {
		var size = 0;
		size += messageType.size;
		size += 4;
		size += message.lengthInBytes;
		return size;
	}

	@override
	Message deserialize(Uint8List payload) {
		var buffer = payload;
		var messageType = MessageType().deserialize(buffer);
		buffer = buffer.sublist(messageType.size);
		var messageSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		var message = Uint8List.fromList(buffer.sublist(0, messageSize));
		buffer = buffer.sublist(messageSize);

		var instance = Message(
			messageType: messageType,
			message: message,
		);
		return instance;
	}

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + _messageType.size, _messageType.serialize());
		currentPos += messageType.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_message.length, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _message.lengthInBytes, _message);
		currentPos += message.lengthInBytes;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'Message(';
		result += 'messageType: "${_messageType.toString()}", ';
		result += 'message: "${hex.encode(_message.toList()).toUpperCase()}", ';
		result += ')';
		return result;
	}
}


class TransferTransactionV1 extends StructBase implements IDeserializable {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.TRANSFER.value);

	static const Map<String, String> TYPE_HINTS = {
		'type': 'enum:TransactionType',
		'network': 'enum:NetworkType',
		'timestamp': 'pod:Timestamp',
		'signerPublicKey': 'pod:PublicKey',
		'signature': 'pod:Signature',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'recipientAddress': 'pod:Address',
		'amount': 'pod:Amount',
		'message': 'struct:Message'
	};

	TransactionType _type = TransactionType.TRANSFER;
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	Timestamp _timestamp = Timestamp();
	PublicKey _signerPublicKey = PublicKey();
	Signature _signature = Signature();
	Amount _fee = Amount();
	Timestamp _deadline = Timestamp();
	Address _recipientAddress = Address();
	Amount _amount = Amount();
	Message _message = Message();
	final int _entityBodyReserved_1 = 0; // reserved field
	final int _signerPublicKeySize = 32; // reserved field
	final int _signatureSize = 64; // reserved field
	final int _recipientAddressSize = 40; // reserved field

	TransferTransactionV1({ 
	TransactionType? type,
	int? version,
	NetworkType? network,
	Timestamp? timestamp,
	PublicKey? signerPublicKey,
	Signature? signature,
	Amount? fee,
	Timestamp? deadline,
	Address? recipientAddress,
	Amount? amount,
	Message? message
	}) 
		: super(type == null && version == null && network == null && timestamp == null && signerPublicKey == null && signature == null && fee == null && deadline == null && recipientAddress == null && amount == null && message == null )
	{
		_type = type ?? TransferTransactionV1.TRANSACTION_TYPE;
		_version = version ?? TransferTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_timestamp = timestamp ?? Timestamp();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_signature = signature ?? Signature();
		_fee = fee ?? Amount();
		_deadline = deadline ?? Timestamp();
		_recipientAddress = recipientAddress ?? Address();
		_amount = amount ?? Amount();
		_message = message ?? Message();
	}

	void sort() {
		if (0 != messageEnvelopeSizeComputed)
		{
			_message.sort();
		}
	}

	TransactionType get type {
		return _type;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	Timestamp get timestamp {
		return _timestamp;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	Signature get signature {
		return _signature;
	}

	Amount get fee {
		return _fee;
	}

	Timestamp get deadline {
		return _deadline;
	}

	Address get recipientAddress {
		return _recipientAddress;
	}

	Amount get amount {
		return _amount;
	}

	Message get message {
		return _message;
	}

	int get messageEnvelopeSizeComputed {
		return message.isDefault ? 0 : message.size + 0;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set timestamp(Timestamp value) {
		_timestamp = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set signature(Signature value) {
		_signature = value;
	}

	set fee(Amount value) {
		_fee = value;
	}

	set deadline(Timestamp value) {
		_deadline = value;
	}

	set recipientAddress(Address value) {
		_recipientAddress = value;
	}

	set amount(Amount value) {
		_amount = value;
	}

	set message(Message value) {
		_message = value;
	}

	int get size {
		var size = 0;
		size += type.size;
		size += 1;
		size += 2;
		size += network.size;
		size += timestamp.size;
		size += 4;
		size += signerPublicKey.size;
		size += 4;
		size += signature.size;
		size += fee.size;
		size += deadline.size;
		size += 4;
		size += recipientAddress.size;
		size += amount.size;
		size += 4;
		if (0 != messageEnvelopeSizeComputed)
		{
			size += message.size;
		}
		return size;
	}

	@override
	TransferTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var timestamp = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(timestamp.size);
		var signerPublicKeySize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (32 != signerPublicKeySize) {
			throw RangeError('Invalid value of reserved field ($signerPublicKeySize)');
		}
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var signatureSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (64 != signatureSize) {
			throw RangeError('Invalid value of reserved field ($signatureSize)');
		}
		var signature = Signature().deserialize(buffer);
		buffer = buffer.sublist(signature.size);
		var fee = Amount().deserialize(buffer);
		buffer = buffer.sublist(fee.size);
		var deadline = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(deadline.size);
		var recipientAddressSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (40 != recipientAddressSize) {
			throw RangeError('Invalid value of reserved field ($recipientAddressSize)');
		}
		var recipientAddress = Address().deserialize(buffer);
		buffer = buffer.sublist(recipientAddress.size);
		var amount = Amount().deserialize(buffer);
		buffer = buffer.sublist(amount.size);
		var messageEnvelopeSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		var message = Message();
		if (0 != messageEnvelopeSize)
		{
			message = Message().deserialize(buffer);
			buffer = buffer.sublist(message.size);
		}

		var instance = TransferTransactionV1(
			type: type,
			version: version,
			network: network,
			timestamp: timestamp,
			signerPublicKey: signerPublicKey,
			signature: signature,
			fee: fee,
			deadline: deadline,
			recipientAddress: recipientAddress,
			amount: amount,
			message: message,
		);
		return instance;
	}

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_entityBodyReserved_1, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _timestamp.size, _timestamp.serialize());
		currentPos += timestamp.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_signerPublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_signatureSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signature.size, _signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_recipientAddressSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _recipientAddress.size, _recipientAddress.serialize());
		currentPos += recipientAddress.size;
		buffer.setRange(currentPos, currentPos + _amount.size, _amount.serialize());
		currentPos += amount.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(messageEnvelopeSizeComputed, 4));
		currentPos += 4;
		if (0 != messageEnvelopeSizeComputed)
		{
			buffer.setRange(currentPos, currentPos + _message.size, _message.serialize());
			currentPos += message.size;
		}
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'TransferTransactionV1(';
		result += 'type: "${_type.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'timestamp: "${_timestamp.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'signature: "${_signature.toString()}", ';
		result += 'fee: "${_fee.toString()}", ';
		result += 'deadline: "${_deadline.toString()}", ';
		result += 'recipientAddress: "${_recipientAddress.toString()}", ';
		result += 'amount: "${_amount.toString()}", ';
		if (0 != messageEnvelopeSizeComputed)
		{
			result += 'message: "${_message.toString()}", ';
		}
		result += ')';
		return result;
	}
}


class NonVerifiableTransferTransactionV1 extends StructBase implements IDeserializable, INonVerifiableTransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.TRANSFER.value);

	static const Map<String, String> TYPE_HINTS = {
		'type': 'enum:TransactionType',
		'network': 'enum:NetworkType',
		'timestamp': 'pod:Timestamp',
		'signerPublicKey': 'pod:PublicKey',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'recipientAddress': 'pod:Address',
		'amount': 'pod:Amount',
		'message': 'struct:Message'
	};

	TransactionType _type = TransactionType.TRANSFER;
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	Timestamp _timestamp = Timestamp();
	PublicKey _signerPublicKey = PublicKey();
	Amount _fee = Amount();
	Timestamp _deadline = Timestamp();
	Address _recipientAddress = Address();
	Amount _amount = Amount();
	Message _message = Message();
	final int _entityBodyReserved_1 = 0; // reserved field
	final int _signerPublicKeySize = 32; // reserved field
	final int _recipientAddressSize = 40; // reserved field

	NonVerifiableTransferTransactionV1({ 
	TransactionType? type,
	int? version,
	NetworkType? network,
	Timestamp? timestamp,
	PublicKey? signerPublicKey,
	Amount? fee,
	Timestamp? deadline,
	Address? recipientAddress,
	Amount? amount,
	Message? message
	}) 
		: super(type == null && version == null && network == null && timestamp == null && signerPublicKey == null && fee == null && deadline == null && recipientAddress == null && amount == null && message == null )
	{
		_type = type ?? NonVerifiableTransferTransactionV1.TRANSACTION_TYPE;
		_version = version ?? NonVerifiableTransferTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_timestamp = timestamp ?? Timestamp();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_fee = fee ?? Amount();
		_deadline = deadline ?? Timestamp();
		_recipientAddress = recipientAddress ?? Address();
		_amount = amount ?? Amount();
		_message = message ?? Message();
	}

	void sort() {
		if (0 != messageEnvelopeSizeComputed)
		{
			_message.sort();
		}
	}

	TransactionType get type {
		return _type;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	Timestamp get timestamp {
		return _timestamp;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	Amount get fee {
		return _fee;
	}

	Timestamp get deadline {
		return _deadline;
	}

	Address get recipientAddress {
		return _recipientAddress;
	}

	Amount get amount {
		return _amount;
	}

	Message get message {
		return _message;
	}

	int get messageEnvelopeSizeComputed {
		return message.isDefault ? 0 : message.size + 0;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set timestamp(Timestamp value) {
		_timestamp = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set fee(Amount value) {
		_fee = value;
	}

	set deadline(Timestamp value) {
		_deadline = value;
	}

	set recipientAddress(Address value) {
		_recipientAddress = value;
	}

	set amount(Amount value) {
		_amount = value;
	}

	set message(Message value) {
		_message = value;
	}

	int get size {
		var size = 0;
		size += type.size;
		size += 1;
		size += 2;
		size += network.size;
		size += timestamp.size;
		size += 4;
		size += signerPublicKey.size;
		size += fee.size;
		size += deadline.size;
		size += 4;
		size += recipientAddress.size;
		size += amount.size;
		size += 4;
		if (0 != messageEnvelopeSizeComputed)
		{
			size += message.size;
		}
		return size;
	}

	@override
	NonVerifiableTransferTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var timestamp = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(timestamp.size);
		var signerPublicKeySize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (32 != signerPublicKeySize) {
			throw RangeError('Invalid value of reserved field ($signerPublicKeySize)');
		}
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var fee = Amount().deserialize(buffer);
		buffer = buffer.sublist(fee.size);
		var deadline = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(deadline.size);
		var recipientAddressSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (40 != recipientAddressSize) {
			throw RangeError('Invalid value of reserved field ($recipientAddressSize)');
		}
		var recipientAddress = Address().deserialize(buffer);
		buffer = buffer.sublist(recipientAddress.size);
		var amount = Amount().deserialize(buffer);
		buffer = buffer.sublist(amount.size);
		var messageEnvelopeSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		var message = Message();
		if (0 != messageEnvelopeSize)
		{
			message = Message().deserialize(buffer);
			buffer = buffer.sublist(message.size);
		}

		var instance = NonVerifiableTransferTransactionV1(
			type: type,
			version: version,
			network: network,
			timestamp: timestamp,
			signerPublicKey: signerPublicKey,
			fee: fee,
			deadline: deadline,
			recipientAddress: recipientAddress,
			amount: amount,
			message: message,
		);
		return instance;
	}

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_entityBodyReserved_1, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _timestamp.size, _timestamp.serialize());
		currentPos += timestamp.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_signerPublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_recipientAddressSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _recipientAddress.size, _recipientAddress.serialize());
		currentPos += recipientAddress.size;
		buffer.setRange(currentPos, currentPos + _amount.size, _amount.serialize());
		currentPos += amount.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(messageEnvelopeSizeComputed, 4));
		currentPos += 4;
		if (0 != messageEnvelopeSizeComputed)
		{
			buffer.setRange(currentPos, currentPos + _message.size, _message.serialize());
			currentPos += message.size;
		}
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'NonVerifiableTransferTransactionV1(';
		result += 'type: "${_type.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'timestamp: "${_timestamp.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'fee: "${_fee.toString()}", ';
		result += 'deadline: "${_deadline.toString()}", ';
		result += 'recipientAddress: "${_recipientAddress.toString()}", ';
		result += 'amount: "${_amount.toString()}", ';
		if (0 != messageEnvelopeSizeComputed)
		{
			result += 'message: "${_message.toString()}", ';
		}
		result += ')';
		return result;
	}
}


class TransferTransactionV2 extends StructBase implements IDeserializable {
	static const int TRANSACTION_VERSION = 2;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.TRANSFER.value);

	static const Map<String, String> TYPE_HINTS = {
		'type': 'enum:TransactionType',
		'network': 'enum:NetworkType',
		'timestamp': 'pod:Timestamp',
		'signerPublicKey': 'pod:PublicKey',
		'signature': 'pod:Signature',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'recipientAddress': 'pod:Address',
		'amount': 'pod:Amount',
		'message': 'struct:Message',
		'mosaics': 'array[SizePrefixedMosaic]'
	};

	TransactionType _type = TransactionType.TRANSFER;
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	Timestamp _timestamp = Timestamp();
	PublicKey _signerPublicKey = PublicKey();
	Signature _signature = Signature();
	Amount _fee = Amount();
	Timestamp _deadline = Timestamp();
	Address _recipientAddress = Address();
	Amount _amount = Amount();
	Message _message = Message();
	List<SizePrefixedMosaic> _mosaics = [];
	final int _entityBodyReserved_1 = 0; // reserved field
	final int _signerPublicKeySize = 32; // reserved field
	final int _signatureSize = 64; // reserved field
	final int _recipientAddressSize = 40; // reserved field

	TransferTransactionV2({ 
	TransactionType? type,
	int? version,
	NetworkType? network,
	Timestamp? timestamp,
	PublicKey? signerPublicKey,
	Signature? signature,
	Amount? fee,
	Timestamp? deadline,
	Address? recipientAddress,
	Amount? amount,
	Message? message,
	List<SizePrefixedMosaic>? mosaics
	}) 
		: super(type == null && version == null && network == null && timestamp == null && signerPublicKey == null && signature == null && fee == null && deadline == null && recipientAddress == null && amount == null && message == null && mosaics == null )
	{
		_type = type ?? TransferTransactionV2.TRANSACTION_TYPE;
		_version = version ?? TransferTransactionV2.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_timestamp = timestamp ?? Timestamp();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_signature = signature ?? Signature();
		_fee = fee ?? Amount();
		_deadline = deadline ?? Timestamp();
		_recipientAddress = recipientAddress ?? Address();
		_amount = amount ?? Amount();
		_message = message ?? Message();
		_mosaics = mosaics ?? [];
	}

	void sort() {
		if (0 != messageEnvelopeSizeComputed)
		{
			_message.sort();
		}
	}

	TransactionType get type {
		return _type;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	Timestamp get timestamp {
		return _timestamp;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	Signature get signature {
		return _signature;
	}

	Amount get fee {
		return _fee;
	}

	Timestamp get deadline {
		return _deadline;
	}

	Address get recipientAddress {
		return _recipientAddress;
	}

	Amount get amount {
		return _amount;
	}

	Message get message {
		return _message;
	}

	List<SizePrefixedMosaic> get mosaics {
		return _mosaics;
	}

	int get messageEnvelopeSizeComputed {
		return message.isDefault ? 0 : message.size + 0;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set timestamp(Timestamp value) {
		_timestamp = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set signature(Signature value) {
		_signature = value;
	}

	set fee(Amount value) {
		_fee = value;
	}

	set deadline(Timestamp value) {
		_deadline = value;
	}

	set recipientAddress(Address value) {
		_recipientAddress = value;
	}

	set amount(Amount value) {
		_amount = value;
	}

	set message(Message value) {
		_message = value;
	}

	set mosaics(List<SizePrefixedMosaic> value) {
		_mosaics = value;
	}

	int get size {
		var size = 0;
		size += type.size;
		size += 1;
		size += 2;
		size += network.size;
		size += timestamp.size;
		size += 4;
		size += signerPublicKey.size;
		size += 4;
		size += signature.size;
		size += fee.size;
		size += deadline.size;
		size += 4;
		size += recipientAddress.size;
		size += amount.size;
		size += 4;
		if (0 != messageEnvelopeSizeComputed)
		{
			size += message.size;
		}
		size += 4;
		size += ArrayHelpers.size(mosaics);
		return size;
	}

	@override
	TransferTransactionV2 deserialize(Uint8List payload) {
		var buffer = payload;
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var timestamp = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(timestamp.size);
		var signerPublicKeySize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (32 != signerPublicKeySize) {
			throw RangeError('Invalid value of reserved field ($signerPublicKeySize)');
		}
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var signatureSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (64 != signatureSize) {
			throw RangeError('Invalid value of reserved field ($signatureSize)');
		}
		var signature = Signature().deserialize(buffer);
		buffer = buffer.sublist(signature.size);
		var fee = Amount().deserialize(buffer);
		buffer = buffer.sublist(fee.size);
		var deadline = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(deadline.size);
		var recipientAddressSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (40 != recipientAddressSize) {
			throw RangeError('Invalid value of reserved field ($recipientAddressSize)');
		}
		var recipientAddress = Address().deserialize(buffer);
		buffer = buffer.sublist(recipientAddress.size);
		var amount = Amount().deserialize(buffer);
		buffer = buffer.sublist(amount.size);
		var messageEnvelopeSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		var message = Message();
		if (0 != messageEnvelopeSize)
		{
			message = Message().deserialize(buffer);
			buffer = buffer.sublist(message.size);
		}
		var mosaicsCount = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		var mosaics = ArrayHelpers.readArrayCount(buffer, SizePrefixedMosaic(), mosaicsCount).map((item) => item as SizePrefixedMosaic).toList();
		buffer = buffer.sublist(ArrayHelpers.size(mosaics));

		var instance = TransferTransactionV2(
			type: type,
			version: version,
			network: network,
			timestamp: timestamp,
			signerPublicKey: signerPublicKey,
			signature: signature,
			fee: fee,
			deadline: deadline,
			recipientAddress: recipientAddress,
			amount: amount,
			message: message,
			mosaics: mosaics,
		);
		return instance;
	}

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_entityBodyReserved_1, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _timestamp.size, _timestamp.serialize());
		currentPos += timestamp.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_signerPublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_signatureSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signature.size, _signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_recipientAddressSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _recipientAddress.size, _recipientAddress.serialize());
		currentPos += recipientAddress.size;
		buffer.setRange(currentPos, currentPos + _amount.size, _amount.serialize());
		currentPos += amount.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(messageEnvelopeSizeComputed, 4));
		currentPos += 4;
		if (0 != messageEnvelopeSizeComputed)
		{
			buffer.setRange(currentPos, currentPos + _message.size, _message.serialize());
			currentPos += message.size;
		}
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_mosaics.length, 4));
		currentPos += 4;
		sort();
		var res_mosaics = ArrayHelpers.writeArray(buffer, _mosaics, currentPos);
		currentPos = res_mosaics.item2;
		buffer = res_mosaics.item1;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'TransferTransactionV2(';
		result += 'type: "${_type.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'timestamp: "${_timestamp.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'signature: "${_signature.toString()}", ';
		result += 'fee: "${_fee.toString()}", ';
		result += 'deadline: "${_deadline.toString()}", ';
		result += 'recipientAddress: "${_recipientAddress.toString()}", ';
		result += 'amount: "${_amount.toString()}", ';
		if (0 != messageEnvelopeSizeComputed)
		{
			result += 'message: "${_message.toString()}", ';
		}
		result += 'mosaics: "${_mosaics.map((e) => e.toString()).toList()}", ';
		result += ')';
		return result;
	}
}


class NonVerifiableTransferTransactionV2 extends StructBase implements IDeserializable, INonVerifiableTransaction {
	static const int TRANSACTION_VERSION = 2;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.TRANSFER.value);

	static const Map<String, String> TYPE_HINTS = {
		'type': 'enum:TransactionType',
		'network': 'enum:NetworkType',
		'timestamp': 'pod:Timestamp',
		'signerPublicKey': 'pod:PublicKey',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'recipientAddress': 'pod:Address',
		'amount': 'pod:Amount',
		'message': 'struct:Message',
		'mosaics': 'array[SizePrefixedMosaic]'
	};

	TransactionType _type = TransactionType.TRANSFER;
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	Timestamp _timestamp = Timestamp();
	PublicKey _signerPublicKey = PublicKey();
	Amount _fee = Amount();
	Timestamp _deadline = Timestamp();
	Address _recipientAddress = Address();
	Amount _amount = Amount();
	Message _message = Message();
	List<SizePrefixedMosaic> _mosaics = [];
	final int _entityBodyReserved_1 = 0; // reserved field
	final int _signerPublicKeySize = 32; // reserved field
	final int _recipientAddressSize = 40; // reserved field

	NonVerifiableTransferTransactionV2({ 
	TransactionType? type,
	int? version,
	NetworkType? network,
	Timestamp? timestamp,
	PublicKey? signerPublicKey,
	Amount? fee,
	Timestamp? deadline,
	Address? recipientAddress,
	Amount? amount,
	Message? message,
	List<SizePrefixedMosaic>? mosaics
	}) 
		: super(type == null && version == null && network == null && timestamp == null && signerPublicKey == null && fee == null && deadline == null && recipientAddress == null && amount == null && message == null && mosaics == null )
	{
		_type = type ?? NonVerifiableTransferTransactionV2.TRANSACTION_TYPE;
		_version = version ?? NonVerifiableTransferTransactionV2.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_timestamp = timestamp ?? Timestamp();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_fee = fee ?? Amount();
		_deadline = deadline ?? Timestamp();
		_recipientAddress = recipientAddress ?? Address();
		_amount = amount ?? Amount();
		_message = message ?? Message();
		_mosaics = mosaics ?? [];
	}

	void sort() {
		if (0 != messageEnvelopeSizeComputed)
		{
			_message.sort();
		}
	}

	TransactionType get type {
		return _type;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	Timestamp get timestamp {
		return _timestamp;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	Amount get fee {
		return _fee;
	}

	Timestamp get deadline {
		return _deadline;
	}

	Address get recipientAddress {
		return _recipientAddress;
	}

	Amount get amount {
		return _amount;
	}

	Message get message {
		return _message;
	}

	List<SizePrefixedMosaic> get mosaics {
		return _mosaics;
	}

	int get messageEnvelopeSizeComputed {
		return message.isDefault ? 0 : message.size + 0;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set timestamp(Timestamp value) {
		_timestamp = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set fee(Amount value) {
		_fee = value;
	}

	set deadline(Timestamp value) {
		_deadline = value;
	}

	set recipientAddress(Address value) {
		_recipientAddress = value;
	}

	set amount(Amount value) {
		_amount = value;
	}

	set message(Message value) {
		_message = value;
	}

	set mosaics(List<SizePrefixedMosaic> value) {
		_mosaics = value;
	}

	int get size {
		var size = 0;
		size += type.size;
		size += 1;
		size += 2;
		size += network.size;
		size += timestamp.size;
		size += 4;
		size += signerPublicKey.size;
		size += fee.size;
		size += deadline.size;
		size += 4;
		size += recipientAddress.size;
		size += amount.size;
		size += 4;
		if (0 != messageEnvelopeSizeComputed)
		{
			size += message.size;
		}
		size += 4;
		size += ArrayHelpers.size(mosaics);
		return size;
	}

	@override
	NonVerifiableTransferTransactionV2 deserialize(Uint8List payload) {
		var buffer = payload;
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var timestamp = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(timestamp.size);
		var signerPublicKeySize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (32 != signerPublicKeySize) {
			throw RangeError('Invalid value of reserved field ($signerPublicKeySize)');
		}
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var fee = Amount().deserialize(buffer);
		buffer = buffer.sublist(fee.size);
		var deadline = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(deadline.size);
		var recipientAddressSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (40 != recipientAddressSize) {
			throw RangeError('Invalid value of reserved field ($recipientAddressSize)');
		}
		var recipientAddress = Address().deserialize(buffer);
		buffer = buffer.sublist(recipientAddress.size);
		var amount = Amount().deserialize(buffer);
		buffer = buffer.sublist(amount.size);
		var messageEnvelopeSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		var message = Message();
		if (0 != messageEnvelopeSize)
		{
			message = Message().deserialize(buffer);
			buffer = buffer.sublist(message.size);
		}
		var mosaicsCount = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		var mosaics = ArrayHelpers.readArrayCount(buffer, SizePrefixedMosaic(), mosaicsCount).map((item) => item as SizePrefixedMosaic).toList();
		buffer = buffer.sublist(ArrayHelpers.size(mosaics));

		var instance = NonVerifiableTransferTransactionV2(
			type: type,
			version: version,
			network: network,
			timestamp: timestamp,
			signerPublicKey: signerPublicKey,
			fee: fee,
			deadline: deadline,
			recipientAddress: recipientAddress,
			amount: amount,
			message: message,
			mosaics: mosaics,
		);
		return instance;
	}

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_entityBodyReserved_1, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _timestamp.size, _timestamp.serialize());
		currentPos += timestamp.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_signerPublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_recipientAddressSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _recipientAddress.size, _recipientAddress.serialize());
		currentPos += recipientAddress.size;
		buffer.setRange(currentPos, currentPos + _amount.size, _amount.serialize());
		currentPos += amount.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(messageEnvelopeSizeComputed, 4));
		currentPos += 4;
		if (0 != messageEnvelopeSizeComputed)
		{
			buffer.setRange(currentPos, currentPos + _message.size, _message.serialize());
			currentPos += message.size;
		}
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_mosaics.length, 4));
		currentPos += 4;
		sort();
		var res_mosaics = ArrayHelpers.writeArray(buffer, _mosaics, currentPos);
		currentPos = res_mosaics.item2;
		buffer = res_mosaics.item1;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'NonVerifiableTransferTransactionV2(';
		result += 'type: "${_type.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'timestamp: "${_timestamp.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'fee: "${_fee.toString()}", ';
		result += 'deadline: "${_deadline.toString()}", ';
		result += 'recipientAddress: "${_recipientAddress.toString()}", ';
		result += 'amount: "${_amount.toString()}", ';
		if (0 != messageEnvelopeSizeComputed)
		{
			result += 'message: "${_message.toString()}", ';
		}
		result += 'mosaics: "${_mosaics.map((e) => e.toString()).toList()}", ';
		result += ')';
		return result;
	}
}


class TransactionFactory implements IDeserializable {
	@override
	dynamic deserialize(dynamic payload) {
		if(payload is String){
			tryHexString(payload);
			payload = hex.decode(payload);
		}
		Uint8List buffer = payload.buffer.asUint8List();
		var parent = Transaction().deserialize(buffer);
		var mapping = {
			(AccountKeyLinkTransactionV1.TRANSACTION_TYPE.value, AccountKeyLinkTransactionV1.TRANSACTION_VERSION): AccountKeyLinkTransactionV1(),
			(MosaicDefinitionTransactionV1.TRANSACTION_TYPE.value, MosaicDefinitionTransactionV1.TRANSACTION_VERSION): MosaicDefinitionTransactionV1(),
			(MosaicSupplyChangeTransactionV1.TRANSACTION_TYPE.value, MosaicSupplyChangeTransactionV1.TRANSACTION_VERSION): MosaicSupplyChangeTransactionV1(),
			(MultisigAccountModificationTransactionV1.TRANSACTION_TYPE.value, MultisigAccountModificationTransactionV1.TRANSACTION_VERSION): MultisigAccountModificationTransactionV1(),
			(MultisigAccountModificationTransactionV2.TRANSACTION_TYPE.value, MultisigAccountModificationTransactionV2.TRANSACTION_VERSION): MultisigAccountModificationTransactionV2(),
			(CosignatureV1.TRANSACTION_TYPE.value, CosignatureV1.TRANSACTION_VERSION): CosignatureV1(),
			(MultisigTransactionV1.TRANSACTION_TYPE.value, MultisigTransactionV1.TRANSACTION_VERSION): MultisigTransactionV1(),
			(NamespaceRegistrationTransactionV1.TRANSACTION_TYPE.value, NamespaceRegistrationTransactionV1.TRANSACTION_VERSION): NamespaceRegistrationTransactionV1(),
			(TransferTransactionV1.TRANSACTION_TYPE.value, TransferTransactionV1.TRANSACTION_VERSION): TransferTransactionV1(),
			(TransferTransactionV2.TRANSACTION_TYPE.value, TransferTransactionV2.TRANSACTION_VERSION): TransferTransactionV2()
		};
		var discriminator = (parent.type.value, parent.version);
		if (mapping[discriminator] != null) {
			var factory_class = mapping[discriminator]!;
			return factory_class.deserialize(buffer);
		} else {
			throw Exception('Null value found for mapping[discriminator]');
		}
	}

	IDeserializable createByName(String entityName) {
		var mapping = {
			'account_key_link_transaction_v1': () => AccountKeyLinkTransactionV1(),
			'mosaic_definition_transaction_v1': () => MosaicDefinitionTransactionV1(),
			'mosaic_supply_change_transaction_v1': () => MosaicSupplyChangeTransactionV1(),
			'multisig_account_modification_transaction_v1': () => MultisigAccountModificationTransactionV1(),
			'multisig_account_modification_transaction_v2': () => MultisigAccountModificationTransactionV2(),
			'cosignature_v1': () => CosignatureV1(),
			'multisig_transaction_v1': () => MultisigTransactionV1(),
			'namespace_registration_transaction_v1': () => NamespaceRegistrationTransactionV1(),
			'transfer_transaction_v1': () => TransferTransactionV1(),
			'transfer_transaction_v2': () => TransferTransactionV2()
		};

		if (!mapping.containsKey(entityName)) {
			throw Exception('Unknown Transaction type $entityName');
		}

		return mapping[entityName]!();
	}
}


class NonVerifiableTransactionFactory implements IDeserializable {
	@override
	dynamic deserialize(dynamic payload) {
		if(payload is String){
			tryHexString(payload);
			payload = hex.decode(payload);
		}
		Uint8List buffer = payload.buffer.asUint8List();
		var parent = NonVerifiableTransaction().deserialize(buffer);
		var mapping = {
			(NonVerifiableAccountKeyLinkTransactionV1.TRANSACTION_TYPE.value, NonVerifiableAccountKeyLinkTransactionV1.TRANSACTION_VERSION): NonVerifiableAccountKeyLinkTransactionV1(),
			(NonVerifiableMosaicDefinitionTransactionV1.TRANSACTION_TYPE.value, NonVerifiableMosaicDefinitionTransactionV1.TRANSACTION_VERSION): NonVerifiableMosaicDefinitionTransactionV1(),
			(NonVerifiableMosaicSupplyChangeTransactionV1.TRANSACTION_TYPE.value, NonVerifiableMosaicSupplyChangeTransactionV1.TRANSACTION_VERSION): NonVerifiableMosaicSupplyChangeTransactionV1(),
			(NonVerifiableMultisigAccountModificationTransactionV1.TRANSACTION_TYPE.value, NonVerifiableMultisigAccountModificationTransactionV1.TRANSACTION_VERSION): NonVerifiableMultisigAccountModificationTransactionV1(),
			(NonVerifiableMultisigAccountModificationTransactionV2.TRANSACTION_TYPE.value, NonVerifiableMultisigAccountModificationTransactionV2.TRANSACTION_VERSION): NonVerifiableMultisigAccountModificationTransactionV2(),
			(NonVerifiableMultisigTransactionV1.TRANSACTION_TYPE.value, NonVerifiableMultisigTransactionV1.TRANSACTION_VERSION): NonVerifiableMultisigTransactionV1(),
			(NonVerifiableNamespaceRegistrationTransactionV1.TRANSACTION_TYPE.value, NonVerifiableNamespaceRegistrationTransactionV1.TRANSACTION_VERSION): NonVerifiableNamespaceRegistrationTransactionV1(),
			(NonVerifiableTransferTransactionV1.TRANSACTION_TYPE.value, NonVerifiableTransferTransactionV1.TRANSACTION_VERSION): NonVerifiableTransferTransactionV1(),
			(NonVerifiableTransferTransactionV2.TRANSACTION_TYPE.value, NonVerifiableTransferTransactionV2.TRANSACTION_VERSION): NonVerifiableTransferTransactionV2()
		};
		var discriminator = (parent.type.value, parent.version);
		if (mapping[discriminator] != null) {
			var factory_class = mapping[discriminator]!;
			return factory_class.deserialize(buffer);
		} else {
			throw Exception('Null value found for mapping[discriminator]');
		}
	}

	IDeserializable createByName(String entityName) {
		var mapping = {
			'non_verifiable_account_key_link_transaction_v1': () => NonVerifiableAccountKeyLinkTransactionV1(),
			'non_verifiable_mosaic_definition_transaction_v1': () => NonVerifiableMosaicDefinitionTransactionV1(),
			'non_verifiable_mosaic_supply_change_transaction_v1': () => NonVerifiableMosaicSupplyChangeTransactionV1(),
			'non_verifiable_multisig_account_modification_transaction_v1': () => NonVerifiableMultisigAccountModificationTransactionV1(),
			'non_verifiable_multisig_account_modification_transaction_v2': () => NonVerifiableMultisigAccountModificationTransactionV2(),
			'non_verifiable_multisig_transaction_v1': () => NonVerifiableMultisigTransactionV1(),
			'non_verifiable_namespace_registration_transaction_v1': () => NonVerifiableNamespaceRegistrationTransactionV1(),
			'non_verifiable_transfer_transaction_v1': () => NonVerifiableTransferTransactionV1(),
			'non_verifiable_transfer_transaction_v2': () => NonVerifiableTransferTransactionV2()
		};

		if (!mapping.containsKey(entityName)) {
			throw Exception('Unknown Transaction type $entityName');
		}

		return mapping[entityName]!();
	}
}
