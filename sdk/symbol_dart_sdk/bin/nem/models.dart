import '../BaseValue.dart';
import '../ByteArray.dart';
import '../models/ISerializable.dart';
import './ITransaction.dart';
import '../models/IInnerTransaction.dart';
import '../utils/converter.dart';
import '../utils/arrayHelpers.dart';
import '../utils/transform.dart';
import 'dart:typed_data';
import 'package:convert/convert.dart';
import 'package:tuple/tuple.dart';

class Amount extends BaseValue implements ISerializable {
	static const int SIZE = 8;

	Amount([dynamic amount]) : super(SIZE, amount ?? 0);

	@override
	Amount deserialize(Uint8List payload) {
		return Amount(bytesToInt(payload.sublist(0, 8), 8));
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(SIZE);
		buffer.setRange(0, 0 + 8, intToBytes(value, 8));
		return buffer;
	}
}


class Height extends BaseValue implements ISerializable {
	static const int SIZE = 8;

	Height([dynamic height]) : super(SIZE, height ?? 0);

	@override
	Height deserialize(Uint8List payload) {
		return Height(bytesToInt(payload.sublist(0, 8), 8));
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(SIZE);
		buffer.setRange(0, 0 + 8, intToBytes(value, 8));
		return buffer;
	}
}


class Timestamp extends BaseValue implements ISerializable {
	static const int SIZE = 4;

	Timestamp([dynamic timestamp]) : super(SIZE, timestamp ?? 0);

	@override
	Timestamp deserialize(Uint8List payload) {
		return Timestamp(bytesToInt(payload.sublist(0, 4), 4));
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(SIZE);
		buffer.setRange(0, 0 + 4, intToBytes(value, 4));
		return buffer;
	}
}


class Address extends ByteArray implements ISerializable {
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

	@override
	Uint8List serialize() {
		return bytes;
	}
}


class Hash256 extends ByteArray implements ISerializable {
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

	@override
	Uint8List serialize() {
		return bytes;
	}
}


class PublicKey extends ByteArray implements ISerializable {
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

	@override
	Uint8List serialize() {
		return bytes;
	}
}


class Signature extends ByteArray implements ISerializable {
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

	@override
	Uint8List serialize() {
		return bytes;
	}
}


class NetworkType implements ISerializable {
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

	@override
	Uint8List serialize() {
		var byteData = ByteData(1)..setUint8(0, value);
		return byteData.buffer.asUint8List();
	}

	@override
	String toString() {
		return 'NetworkType.${_flags[value]}';
	}
}


class TransactionType implements ISerializable {
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

	@override
	Uint8List serialize() {
		var byteData = ByteData(4)..setUint32(0, value, Endian.little);
		return byteData.buffer.asUint8List();
	}

	@override
	String toString() {
		return 'TransactionType.${_flags[value]}';
	}
}


class Transaction implements ISerializable, ITransaction {

	static const Map<String, String> TYPE_HINTS = {
		'type': 'enum:TransactionType',
		'network': 'enum:NetworkType',
		'timestamp': 'pod:Timestamp',
		'signerPublicKey': 'pod:PublicKey',
		'signature': 'pod:Signature',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp'
	};

	TransactionType type = TransactionType.TRANSFER;
	int version = 0;
	NetworkType network = NetworkType.MAINNET;
	Timestamp timestamp = Timestamp();
	@override
	PublicKey signerPublicKey = PublicKey();
	@override
	Signature signature = Signature();
	Amount fee = Amount();
	Timestamp deadline = Timestamp();
	final int entityBodyReserved_1 = 0; // reserved field
	final int signerPublicKeySize = 32; // reserved field
	final int signatureSize = 64; // reserved field

	Transaction({ 
	TransactionType? type,
	int? version,
	NetworkType? network,
	Timestamp? timestamp,
	PublicKey? signerPublicKey,
	Signature? signature,
	Amount? fee,
	Timestamp? deadline
	}) {
		this.type = type ?? TransactionType.TRANSFER;
		this.version = version ?? 0;
		this.network = network ?? NetworkType.MAINNET;
		this.timestamp = timestamp ?? Timestamp();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.signature = signature ?? Signature();
		this.fee = fee ?? Amount();
		this.deadline = deadline ?? Timestamp();
	}

	@override
	void sort() {
		// empty body
	}

	@override
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

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(entityBodyReserved_1, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + timestamp.size, timestamp.serialize());
		currentPos += timestamp.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(signerPublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(signatureSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signature.size, signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + fee.size, fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + deadline.size, deadline.serialize());
		currentPos += deadline.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'Transaction(';
		result += 'type: "${type.toString()}", ';
		result += 'version: "0x${version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${network.toString()}", ';
		result += 'timestamp: "${timestamp.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'signature: "${signature.toString()}", ';
		result += 'fee: "${fee.toString()}", ';
		result += 'deadline: "${deadline.toString()}", ';
		result += ')';
		return result;
	}
}


class NonVerifiableTransaction implements ISerializable, IInnerTransaction {

	static const Map<String, String> TYPE_HINTS = {
		'type': 'enum:TransactionType',
		'network': 'enum:NetworkType',
		'timestamp': 'pod:Timestamp',
		'signerPublicKey': 'pod:PublicKey',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp'
	};

	TransactionType type = TransactionType.TRANSFER;
	int version = 0;
	NetworkType network = NetworkType.MAINNET;
	Timestamp timestamp = Timestamp();
	PublicKey signerPublicKey = PublicKey();
	Amount fee = Amount();
	Timestamp deadline = Timestamp();
	final int entityBodyReserved_1 = 0; // reserved field
	final int signerPublicKeySize = 32; // reserved field

	NonVerifiableTransaction({ 
	TransactionType? type,
	int? version,
	NetworkType? network,
	Timestamp? timestamp,
	PublicKey? signerPublicKey,
	Amount? fee,
	Timestamp? deadline
	}) {
		this.type = type ?? TransactionType.TRANSFER;
		this.version = version ?? 0;
		this.network = network ?? NetworkType.MAINNET;
		this.timestamp = timestamp ?? Timestamp();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.fee = fee ?? Amount();
		this.deadline = deadline ?? Timestamp();
	}

	@override
	void sort() {
		// empty body
	}

	@override
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

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(entityBodyReserved_1, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + timestamp.size, timestamp.serialize());
		currentPos += timestamp.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(signerPublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + fee.size, fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + deadline.size, deadline.serialize());
		currentPos += deadline.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'NonVerifiableTransaction(';
		result += 'type: "${type.toString()}", ';
		result += 'version: "0x${version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${network.toString()}", ';
		result += 'timestamp: "${timestamp.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'fee: "${fee.toString()}", ';
		result += 'deadline: "${deadline.toString()}", ';
		result += ')';
		return result;
	}
}


class LinkAction implements ISerializable {
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

	@override
	Uint8List serialize() {
		var byteData = ByteData(4)..setUint32(0, value, Endian.little);
		return byteData.buffer.asUint8List();
	}

	@override
	String toString() {
		return 'LinkAction.${_flags[value]}';
	}
}


class AccountKeyLinkTransactionV1 implements ISerializable, ITransaction {
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

	TransactionType type = AccountKeyLinkTransactionV1.TRANSACTION_TYPE;
	int version = AccountKeyLinkTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	Timestamp timestamp = Timestamp();
	@override
	PublicKey signerPublicKey = PublicKey();
	@override
	Signature signature = Signature();
	Amount fee = Amount();
	Timestamp deadline = Timestamp();
	LinkAction linkAction = LinkAction.LINK;
	PublicKey remotePublicKey = PublicKey();
	final int entityBodyReserved_1 = 0; // reserved field
	final int signerPublicKeySize = 32; // reserved field
	final int signatureSize = 64; // reserved field
	final int remotePublicKeySize = 32; // reserved field

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
	}) {
		this.type = type ?? AccountKeyLinkTransactionV1.TRANSACTION_TYPE;
		this.version = version ?? AccountKeyLinkTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.timestamp = timestamp ?? Timestamp();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.signature = signature ?? Signature();
		this.fee = fee ?? Amount();
		this.deadline = deadline ?? Timestamp();
		this.linkAction = linkAction ?? LinkAction.LINK;
		this.remotePublicKey = remotePublicKey ?? PublicKey();
	}

	@override
	void sort() {
		// empty body
	}

	@override
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

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(entityBodyReserved_1, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + timestamp.size, timestamp.serialize());
		currentPos += timestamp.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(signerPublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(signatureSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signature.size, signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + fee.size, fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + deadline.size, deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + linkAction.size, linkAction.serialize());
		currentPos += linkAction.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(remotePublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + remotePublicKey.size, remotePublicKey.serialize());
		currentPos += remotePublicKey.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'AccountKeyLinkTransactionV1(';
		result += 'type: "${type.toString()}", ';
		result += 'version: "0x${version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${network.toString()}", ';
		result += 'timestamp: "${timestamp.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'signature: "${signature.toString()}", ';
		result += 'fee: "${fee.toString()}", ';
		result += 'deadline: "${deadline.toString()}", ';
		result += 'linkAction: "${linkAction.toString()}", ';
		result += 'remotePublicKey: "${remotePublicKey.toString()}", ';
		result += ')';
		return result;
	}
}


class NonVerifiableAccountKeyLinkTransactionV1 implements ISerializable, IInnerTransaction {
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

	TransactionType type = NonVerifiableAccountKeyLinkTransactionV1.TRANSACTION_TYPE;
	int version = NonVerifiableAccountKeyLinkTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	Timestamp timestamp = Timestamp();
	PublicKey signerPublicKey = PublicKey();
	Amount fee = Amount();
	Timestamp deadline = Timestamp();
	LinkAction linkAction = LinkAction.LINK;
	PublicKey remotePublicKey = PublicKey();
	final int entityBodyReserved_1 = 0; // reserved field
	final int signerPublicKeySize = 32; // reserved field
	final int remotePublicKeySize = 32; // reserved field

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
	}) {
		this.type = type ?? NonVerifiableAccountKeyLinkTransactionV1.TRANSACTION_TYPE;
		this.version = version ?? NonVerifiableAccountKeyLinkTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.timestamp = timestamp ?? Timestamp();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.fee = fee ?? Amount();
		this.deadline = deadline ?? Timestamp();
		this.linkAction = linkAction ?? LinkAction.LINK;
		this.remotePublicKey = remotePublicKey ?? PublicKey();
	}

	@override
	void sort() {
		// empty body
	}

	@override
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

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(entityBodyReserved_1, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + timestamp.size, timestamp.serialize());
		currentPos += timestamp.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(signerPublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + fee.size, fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + deadline.size, deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + linkAction.size, linkAction.serialize());
		currentPos += linkAction.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(remotePublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + remotePublicKey.size, remotePublicKey.serialize());
		currentPos += remotePublicKey.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'NonVerifiableAccountKeyLinkTransactionV1(';
		result += 'type: "${type.toString()}", ';
		result += 'version: "0x${version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${network.toString()}", ';
		result += 'timestamp: "${timestamp.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'fee: "${fee.toString()}", ';
		result += 'deadline: "${deadline.toString()}", ';
		result += 'linkAction: "${linkAction.toString()}", ';
		result += 'remotePublicKey: "${remotePublicKey.toString()}", ';
		result += ')';
		return result;
	}
}


class NamespaceId implements ISerializable {

	static const Map<String, String> TYPE_HINTS = {
		'name': 'bytes_array'
	};

	Uint8List name = Uint8List(0);

	NamespaceId([name]) {
		this.name = name ?? Uint8List(0);
	}

	void sort() {
		// empty body
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

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(name.length, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + name.lengthInBytes, name);
		currentPos += name.lengthInBytes;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'NamespaceId(';
		result += 'name: "${hex.encode(name.toList()).toUpperCase()}", ';
		result += ')';
		return result;
	}
}


class MosaicId implements ISerializable {

	static const Map<String, String> TYPE_HINTS = {
		'namespaceId': 'struct:NamespaceId',
		'name': 'bytes_array'
	};

	NamespaceId namespaceId = NamespaceId();
	Uint8List name = Uint8List(0);

	MosaicId({ NamespaceId? namespaceId, Uint8List? name}) {
		this.namespaceId = namespaceId ?? NamespaceId();
		this.name = name ?? Uint8List(0);
	}

	void sort() {
		namespaceId.sort();
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

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + namespaceId.size, namespaceId.serialize());
		currentPos += namespaceId.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(name.length, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + name.lengthInBytes, name);
		currentPos += name.lengthInBytes;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'MosaicId(';
		result += 'namespaceId: "${namespaceId.toString()}", ';
		result += 'name: "${hex.encode(name.toList()).toUpperCase()}", ';
		result += ')';
		return result;
	}
}


class Mosaic implements ISerializable {

	static const Map<String, String> TYPE_HINTS = {
		'mosaicId': 'struct:MosaicId',
		'amount': 'pod:Amount'
	};

	MosaicId mosaicId = MosaicId();
	Amount amount = Amount();

	Mosaic({ MosaicId? mosaicId, Amount? amount}) {
		this.mosaicId = mosaicId ?? MosaicId();
		this.amount = amount ?? Amount();
	}

	void sort() {
		mosaicId.sort();
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

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(mosaicId.size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + mosaicId.size, mosaicId.serialize());
		currentPos += mosaicId.size;
		buffer.setRange(currentPos, currentPos + amount.size, amount.serialize());
		currentPos += amount.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'Mosaic(';
		result += 'mosaicId: "${mosaicId.toString()}", ';
		result += 'amount: "${amount.toString()}", ';
		result += ')';
		return result;
	}
}


class SizePrefixedMosaic implements ISerializable {

	static const Map<String, String> TYPE_HINTS = {
		'mosaic': 'struct:Mosaic'
	};

	Mosaic mosaic = Mosaic();

	SizePrefixedMosaic([mosaic]) {
		this.mosaic = mosaic ?? Mosaic();
	}

	void sort() {
		mosaic.sort();
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

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(mosaic.size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + mosaic.size, mosaic.serialize());
		currentPos += mosaic.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'SizePrefixedMosaic(';
		result += 'mosaic: "${mosaic.toString()}", ';
		result += ')';
		return result;
	}
}


class MosaicTransferFeeType implements ISerializable {
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

	@override
	Uint8List serialize() {
		var byteData = ByteData(4)..setUint32(0, value, Endian.little);
		return byteData.buffer.asUint8List();
	}

	@override
	String toString() {
		return 'MosaicTransferFeeType.${_flags[value]}';
	}
}


class MosaicLevy implements ISerializable {

	static const Map<String, String> TYPE_HINTS = {
		'transferFeeType': 'enum:MosaicTransferFeeType',
		'recipientAddress': 'pod:Address',
		'mosaicId': 'struct:MosaicId',
		'fee': 'pod:Amount'
	};

	MosaicTransferFeeType transferFeeType = MosaicTransferFeeType.ABSOLUTE;
	Address recipientAddress = Address();
	MosaicId mosaicId = MosaicId();
	Amount fee = Amount();
	final int recipientAddressSize = 40; // reserved field

	MosaicLevy({ MosaicTransferFeeType? transferFeeType, Address? recipientAddress, MosaicId? mosaicId, Amount? fee}) {
		this.transferFeeType = transferFeeType ?? MosaicTransferFeeType.ABSOLUTE;
		this.recipientAddress = recipientAddress ?? Address();
		this.mosaicId = mosaicId ?? MosaicId();
		this.fee = fee ?? Amount();
	}

	void sort() {
		mosaicId.sort();
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

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + transferFeeType.size, transferFeeType.serialize());
		currentPos += transferFeeType.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(recipientAddressSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + recipientAddress.size, recipientAddress.serialize());
		currentPos += recipientAddress.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(mosaicId.size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + mosaicId.size, mosaicId.serialize());
		currentPos += mosaicId.size;
		buffer.setRange(currentPos, currentPos + fee.size, fee.serialize());
		currentPos += fee.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'MosaicLevy(';
		result += 'transferFeeType: "${transferFeeType.toString()}", ';
		result += 'recipientAddress: "${recipientAddress.toString()}", ';
		result += 'mosaicId: "${mosaicId.toString()}", ';
		result += 'fee: "${fee.toString()}", ';
		result += ')';
		return result;
	}
}


class MosaicProperty implements ISerializable {

	static const Map<String, String> TYPE_HINTS = {
		'name': 'bytes_array',
		'value': 'bytes_array'
	};

	Uint8List name = Uint8List(0);
	Uint8List value = Uint8List(0);

	MosaicProperty({ Uint8List? name, Uint8List? value}) {
		this.name = name ?? Uint8List(0);
		this.value = value ?? Uint8List(0);
	}

	void sort() {
		// empty body
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

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(name.length, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + name.lengthInBytes, name);
		currentPos += name.lengthInBytes;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(value.length, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + value.lengthInBytes, value);
		currentPos += value.lengthInBytes;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'MosaicProperty(';
		result += 'name: "${hex.encode(name.toList()).toUpperCase()}", ';
		result += 'value: "${hex.encode(value.toList()).toUpperCase()}", ';
		result += ')';
		return result;
	}
}


class SizePrefixedMosaicProperty implements ISerializable {

	static const Map<String, String> TYPE_HINTS = {
		'property': 'struct:MosaicProperty'
	};

	MosaicProperty property = MosaicProperty();

	SizePrefixedMosaicProperty([property]) {
		this.property = property ?? MosaicProperty();
	}

	void sort() {
		property.sort();
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

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(property.size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + property.size, property.serialize());
		currentPos += property.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'SizePrefixedMosaicProperty(';
		result += 'property: "${property.toString()}", ';
		result += ')';
		return result;
	}
}


class MosaicDefinition implements ISerializable {

	static const Map<String, String> TYPE_HINTS = {
		'ownerPublicKey': 'pod:PublicKey',
		'id': 'struct:MosaicId',
		'description': 'bytes_array',
		'properties': 'array[SizePrefixedMosaicProperty]',
		'levy': 'struct:MosaicLevy'
	};

	PublicKey ownerPublicKey = PublicKey();
	MosaicId id = MosaicId();
	Uint8List description = Uint8List(0);
	List<SizePrefixedMosaicProperty> properties = [];
	MosaicLevy? levy;
	final int ownerPublicKeySize = 32; // reserved field

	MosaicDefinition({ 
	PublicKey? ownerPublicKey,
	MosaicId? id,
	Uint8List? description,
	List<SizePrefixedMosaicProperty>? properties,
	MosaicLevy? levy
	}) {
		this.ownerPublicKey = ownerPublicKey ?? PublicKey();
		this.id = id ?? MosaicId();
		this.description = description ?? Uint8List(0);
		this.properties = properties ?? [];
		this.levy = levy ?? null;
	}

	void sort() {
		id.sort();
		if (0 != levySizeComputed)
		{
			levy?.sort();
		}
	}

	int get levySizeComputed {
		return levy?.size ?? 0;
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
			size += levy!.size;
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
		var levy = null;
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

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(ownerPublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + ownerPublicKey.size, ownerPublicKey.serialize());
		currentPos += ownerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(id.size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + id.size, id.serialize());
		currentPos += id.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(description.length, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + description.lengthInBytes, description);
		currentPos += description.lengthInBytes;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(properties.length, 4));
		currentPos += 4;
		sort();
		var res_properties = ArrayHelpers.writeArray(buffer, properties, currentPos);
		currentPos = res_properties.item2;
		buffer = res_properties.item1;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(levySizeComputed, 4));
		currentPos += 4;
		if (0 != levySizeComputed)
		{
			buffer.setRange(currentPos, currentPos + levy!.size, levy!.serialize());
			currentPos += levy!.size;
		}
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'MosaicDefinition(';
		result += 'ownerPublicKey: "${ownerPublicKey.toString()}", ';
		result += 'id: "${id.toString()}", ';
		result += 'description: "${hex.encode(description.toList()).toUpperCase()}", ';
		result += 'properties: "${properties.map((e) => e.toString()).toList()}", ';
		if (0 != levySizeComputed)
		{
			result += 'levy: "${levy!.toString()}", ';
		}
		result += ')';
		return result;
	}
}


class MosaicDefinitionTransactionV1 implements ISerializable, ITransaction {
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

	TransactionType type = MosaicDefinitionTransactionV1.TRANSACTION_TYPE;
	int version = MosaicDefinitionTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	Timestamp timestamp = Timestamp();
	@override
	PublicKey signerPublicKey = PublicKey();
	@override
	Signature signature = Signature();
	Amount fee = Amount();
	Timestamp deadline = Timestamp();
	MosaicDefinition mosaicDefinition = MosaicDefinition();
	Address rentalFeeSink = Address();
	Amount rentalFee = Amount();
	final int entityBodyReserved_1 = 0; // reserved field
	final int signerPublicKeySize = 32; // reserved field
	final int signatureSize = 64; // reserved field
	final int rentalFeeSinkSize = 40; // reserved field

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
	}) {
		this.type = type ?? MosaicDefinitionTransactionV1.TRANSACTION_TYPE;
		this.version = version ?? MosaicDefinitionTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.timestamp = timestamp ?? Timestamp();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.signature = signature ?? Signature();
		this.fee = fee ?? Amount();
		this.deadline = deadline ?? Timestamp();
		this.mosaicDefinition = mosaicDefinition ?? MosaicDefinition();
		this.rentalFeeSink = rentalFeeSink ?? Address();
		this.rentalFee = rentalFee ?? Amount();
	}

	@override
	void sort() {
		mosaicDefinition.sort();
	}

	@override
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

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(entityBodyReserved_1, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + timestamp.size, timestamp.serialize());
		currentPos += timestamp.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(signerPublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(signatureSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signature.size, signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + fee.size, fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + deadline.size, deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(mosaicDefinition.size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + mosaicDefinition.size, mosaicDefinition.serialize());
		currentPos += mosaicDefinition.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(rentalFeeSinkSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + rentalFeeSink.size, rentalFeeSink.serialize());
		currentPos += rentalFeeSink.size;
		buffer.setRange(currentPos, currentPos + rentalFee.size, rentalFee.serialize());
		currentPos += rentalFee.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'MosaicDefinitionTransactionV1(';
		result += 'type: "${type.toString()}", ';
		result += 'version: "0x${version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${network.toString()}", ';
		result += 'timestamp: "${timestamp.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'signature: "${signature.toString()}", ';
		result += 'fee: "${fee.toString()}", ';
		result += 'deadline: "${deadline.toString()}", ';
		result += 'mosaicDefinition: "${mosaicDefinition.toString()}", ';
		result += 'rentalFeeSink: "${rentalFeeSink.toString()}", ';
		result += 'rentalFee: "${rentalFee.toString()}", ';
		result += ')';
		return result;
	}
}


class NonVerifiableMosaicDefinitionTransactionV1 implements ISerializable, IInnerTransaction {
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

	TransactionType type = NonVerifiableMosaicDefinitionTransactionV1.TRANSACTION_TYPE;
	int version = NonVerifiableMosaicDefinitionTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	Timestamp timestamp = Timestamp();
	PublicKey signerPublicKey = PublicKey();
	Amount fee = Amount();
	Timestamp deadline = Timestamp();
	MosaicDefinition mosaicDefinition = MosaicDefinition();
	Address rentalFeeSink = Address();
	Amount rentalFee = Amount();
	final int entityBodyReserved_1 = 0; // reserved field
	final int signerPublicKeySize = 32; // reserved field
	final int rentalFeeSinkSize = 40; // reserved field

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
	}) {
		this.type = type ?? NonVerifiableMosaicDefinitionTransactionV1.TRANSACTION_TYPE;
		this.version = version ?? NonVerifiableMosaicDefinitionTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.timestamp = timestamp ?? Timestamp();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.fee = fee ?? Amount();
		this.deadline = deadline ?? Timestamp();
		this.mosaicDefinition = mosaicDefinition ?? MosaicDefinition();
		this.rentalFeeSink = rentalFeeSink ?? Address();
		this.rentalFee = rentalFee ?? Amount();
	}

	@override
	void sort() {
		mosaicDefinition.sort();
	}

	@override
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

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(entityBodyReserved_1, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + timestamp.size, timestamp.serialize());
		currentPos += timestamp.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(signerPublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + fee.size, fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + deadline.size, deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(mosaicDefinition.size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + mosaicDefinition.size, mosaicDefinition.serialize());
		currentPos += mosaicDefinition.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(rentalFeeSinkSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + rentalFeeSink.size, rentalFeeSink.serialize());
		currentPos += rentalFeeSink.size;
		buffer.setRange(currentPos, currentPos + rentalFee.size, rentalFee.serialize());
		currentPos += rentalFee.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'NonVerifiableMosaicDefinitionTransactionV1(';
		result += 'type: "${type.toString()}", ';
		result += 'version: "0x${version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${network.toString()}", ';
		result += 'timestamp: "${timestamp.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'fee: "${fee.toString()}", ';
		result += 'deadline: "${deadline.toString()}", ';
		result += 'mosaicDefinition: "${mosaicDefinition.toString()}", ';
		result += 'rentalFeeSink: "${rentalFeeSink.toString()}", ';
		result += 'rentalFee: "${rentalFee.toString()}", ';
		result += ')';
		return result;
	}
}


class MosaicSupplyChangeAction implements ISerializable {
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

	@override
	Uint8List serialize() {
		var byteData = ByteData(4)..setUint32(0, value, Endian.little);
		return byteData.buffer.asUint8List();
	}

	@override
	String toString() {
		return 'MosaicSupplyChangeAction.${_flags[value]}';
	}
}


class MosaicSupplyChangeTransactionV1 implements ISerializable, ITransaction {
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

	TransactionType type = MosaicSupplyChangeTransactionV1.TRANSACTION_TYPE;
	int version = MosaicSupplyChangeTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	Timestamp timestamp = Timestamp();
	@override
	PublicKey signerPublicKey = PublicKey();
	@override
	Signature signature = Signature();
	Amount fee = Amount();
	Timestamp deadline = Timestamp();
	MosaicId mosaicId = MosaicId();
	MosaicSupplyChangeAction action = MosaicSupplyChangeAction.INCREASE;
	Amount delta = Amount();
	final int entityBodyReserved_1 = 0; // reserved field
	final int signerPublicKeySize = 32; // reserved field
	final int signatureSize = 64; // reserved field

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
	}) {
		this.type = type ?? MosaicSupplyChangeTransactionV1.TRANSACTION_TYPE;
		this.version = version ?? MosaicSupplyChangeTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.timestamp = timestamp ?? Timestamp();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.signature = signature ?? Signature();
		this.fee = fee ?? Amount();
		this.deadline = deadline ?? Timestamp();
		this.mosaicId = mosaicId ?? MosaicId();
		this.action = action ?? MosaicSupplyChangeAction.INCREASE;
		this.delta = delta ?? Amount();
	}

	@override
	void sort() {
		mosaicId.sort();
	}

	@override
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

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(entityBodyReserved_1, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + timestamp.size, timestamp.serialize());
		currentPos += timestamp.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(signerPublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(signatureSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signature.size, signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + fee.size, fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + deadline.size, deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(mosaicId.size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + mosaicId.size, mosaicId.serialize());
		currentPos += mosaicId.size;
		buffer.setRange(currentPos, currentPos + action.size, action.serialize());
		currentPos += action.size;
		buffer.setRange(currentPos, currentPos + delta.size, delta.serialize());
		currentPos += delta.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'MosaicSupplyChangeTransactionV1(';
		result += 'type: "${type.toString()}", ';
		result += 'version: "0x${version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${network.toString()}", ';
		result += 'timestamp: "${timestamp.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'signature: "${signature.toString()}", ';
		result += 'fee: "${fee.toString()}", ';
		result += 'deadline: "${deadline.toString()}", ';
		result += 'mosaicId: "${mosaicId.toString()}", ';
		result += 'action: "${action.toString()}", ';
		result += 'delta: "${delta.toString()}", ';
		result += ')';
		return result;
	}
}


class NonVerifiableMosaicSupplyChangeTransactionV1 implements ISerializable, IInnerTransaction {
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

	TransactionType type = NonVerifiableMosaicSupplyChangeTransactionV1.TRANSACTION_TYPE;
	int version = NonVerifiableMosaicSupplyChangeTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	Timestamp timestamp = Timestamp();
	PublicKey signerPublicKey = PublicKey();
	Amount fee = Amount();
	Timestamp deadline = Timestamp();
	MosaicId mosaicId = MosaicId();
	MosaicSupplyChangeAction action = MosaicSupplyChangeAction.INCREASE;
	Amount delta = Amount();
	final int entityBodyReserved_1 = 0; // reserved field
	final int signerPublicKeySize = 32; // reserved field

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
	}) {
		this.type = type ?? NonVerifiableMosaicSupplyChangeTransactionV1.TRANSACTION_TYPE;
		this.version = version ?? NonVerifiableMosaicSupplyChangeTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.timestamp = timestamp ?? Timestamp();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.fee = fee ?? Amount();
		this.deadline = deadline ?? Timestamp();
		this.mosaicId = mosaicId ?? MosaicId();
		this.action = action ?? MosaicSupplyChangeAction.INCREASE;
		this.delta = delta ?? Amount();
	}

	@override
	void sort() {
		mosaicId.sort();
	}

	@override
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

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(entityBodyReserved_1, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + timestamp.size, timestamp.serialize());
		currentPos += timestamp.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(signerPublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + fee.size, fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + deadline.size, deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(mosaicId.size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + mosaicId.size, mosaicId.serialize());
		currentPos += mosaicId.size;
		buffer.setRange(currentPos, currentPos + action.size, action.serialize());
		currentPos += action.size;
		buffer.setRange(currentPos, currentPos + delta.size, delta.serialize());
		currentPos += delta.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'NonVerifiableMosaicSupplyChangeTransactionV1(';
		result += 'type: "${type.toString()}", ';
		result += 'version: "0x${version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${network.toString()}", ';
		result += 'timestamp: "${timestamp.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'fee: "${fee.toString()}", ';
		result += 'deadline: "${deadline.toString()}", ';
		result += 'mosaicId: "${mosaicId.toString()}", ';
		result += 'action: "${action.toString()}", ';
		result += 'delta: "${delta.toString()}", ';
		result += ')';
		return result;
	}
}


class MultisigAccountModificationType implements ISerializable {
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

	@override
	Uint8List serialize() {
		var byteData = ByteData(4)..setUint32(0, value, Endian.little);
		return byteData.buffer.asUint8List();
	}

	@override
	String toString() {
		return 'MultisigAccountModificationType.${_flags[value]}';
	}
}


class MultisigAccountModification implements ISerializable {

	static const Map<String, String> TYPE_HINTS = {
		'modificationType': 'enum:MultisigAccountModificationType',
		'cosignatoryPublicKey': 'pod:PublicKey'
	};

	MultisigAccountModificationType modificationType = MultisigAccountModificationType.ADD_COSIGNATORY;
	PublicKey cosignatoryPublicKey = PublicKey();
	final int cosignatoryPublicKeySize = 32; // reserved field

	MultisigAccountModification({ MultisigAccountModificationType? modificationType, PublicKey? cosignatoryPublicKey}) {
		this.modificationType = modificationType ?? MultisigAccountModificationType.ADD_COSIGNATORY;
		this.cosignatoryPublicKey = cosignatoryPublicKey ?? PublicKey();
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

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + modificationType.size, modificationType.serialize());
		currentPos += modificationType.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(cosignatoryPublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + cosignatoryPublicKey.size, cosignatoryPublicKey.serialize());
		currentPos += cosignatoryPublicKey.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'MultisigAccountModification(';
		result += 'modificationType: "${modificationType.toString()}", ';
		result += 'cosignatoryPublicKey: "${cosignatoryPublicKey.toString()}", ';
		result += ')';
		return result;
	}
}


class SizePrefixedMultisigAccountModification implements ISerializable {

	static const Map<String, String> TYPE_HINTS = {
		'modification': 'struct:MultisigAccountModification'
	};

	MultisigAccountModification modification = MultisigAccountModification();

	SizePrefixedMultisigAccountModification([modification]) {
		this.modification = modification ?? MultisigAccountModification();
	}

	void sort() {
		modification.sort();
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

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(modification.size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + modification.size, modification.serialize());
		currentPos += modification.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'SizePrefixedMultisigAccountModification(';
		result += 'modification: "${modification.toString()}", ';
		result += ')';
		return result;
	}
}


class MultisigAccountModificationTransactionV1 implements ISerializable, ITransaction {
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

	TransactionType type = MultisigAccountModificationTransactionV1.TRANSACTION_TYPE;
	int version = MultisigAccountModificationTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	Timestamp timestamp = Timestamp();
	@override
	PublicKey signerPublicKey = PublicKey();
	@override
	Signature signature = Signature();
	Amount fee = Amount();
	Timestamp deadline = Timestamp();
	List<SizePrefixedMultisigAccountModification> modifications = [];
	final int entityBodyReserved_1 = 0; // reserved field
	final int signerPublicKeySize = 32; // reserved field
	final int signatureSize = 64; // reserved field

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
	}) {
		this.type = type ?? MultisigAccountModificationTransactionV1.TRANSACTION_TYPE;
		this.version = version ?? MultisigAccountModificationTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.timestamp = timestamp ?? Timestamp();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.signature = signature ?? Signature();
		this.fee = fee ?? Amount();
		this.deadline = deadline ?? Timestamp();
		this.modifications = modifications ?? [];
	}

	@override
	void sort() {
		modifications.sort((lhs, rhs) {
			return ArrayHelpers.deepCompare(ArrayHelpers.getValue(lhs.modification), ArrayHelpers.getValue(rhs.modification));
		});
	}

	@override
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

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(entityBodyReserved_1, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + timestamp.size, timestamp.serialize());
		currentPos += timestamp.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(signerPublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(signatureSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signature.size, signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + fee.size, fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + deadline.size, deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(modifications.length, 4));
		currentPos += 4;
		sort();
		var res_modifications = ArrayHelpers.writeArray(buffer, modifications, currentPos, (e) { return ArrayHelpers.getValue(e.modification);});
		currentPos = res_modifications.item2;
		buffer = res_modifications.item1;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'MultisigAccountModificationTransactionV1(';
		result += 'type: "${type.toString()}", ';
		result += 'version: "0x${version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${network.toString()}", ';
		result += 'timestamp: "${timestamp.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'signature: "${signature.toString()}", ';
		result += 'fee: "${fee.toString()}", ';
		result += 'deadline: "${deadline.toString()}", ';
		result += 'modifications: "${modifications.map((e) => e.toString()).toList()}", ';
		result += ')';
		return result;
	}
}


class NonVerifiableMultisigAccountModificationTransactionV1 implements ISerializable, IInnerTransaction {
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

	TransactionType type = NonVerifiableMultisigAccountModificationTransactionV1.TRANSACTION_TYPE;
	int version = NonVerifiableMultisigAccountModificationTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	Timestamp timestamp = Timestamp();
	PublicKey signerPublicKey = PublicKey();
	Amount fee = Amount();
	Timestamp deadline = Timestamp();
	List<SizePrefixedMultisigAccountModification> modifications = [];
	final int entityBodyReserved_1 = 0; // reserved field
	final int signerPublicKeySize = 32; // reserved field

	NonVerifiableMultisigAccountModificationTransactionV1({ 
	TransactionType? type,
	int? version,
	NetworkType? network,
	Timestamp? timestamp,
	PublicKey? signerPublicKey,
	Amount? fee,
	Timestamp? deadline,
	List<SizePrefixedMultisigAccountModification>? modifications
	}) {
		this.type = type ?? NonVerifiableMultisigAccountModificationTransactionV1.TRANSACTION_TYPE;
		this.version = version ?? NonVerifiableMultisigAccountModificationTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.timestamp = timestamp ?? Timestamp();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.fee = fee ?? Amount();
		this.deadline = deadline ?? Timestamp();
		this.modifications = modifications ?? [];
	}

	@override
	void sort() {
		modifications.sort((lhs, rhs) {
			return ArrayHelpers.deepCompare(ArrayHelpers.getValue(lhs.modification), ArrayHelpers.getValue(rhs.modification));
		});
	}

	@override
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

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(entityBodyReserved_1, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + timestamp.size, timestamp.serialize());
		currentPos += timestamp.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(signerPublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + fee.size, fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + deadline.size, deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(modifications.length, 4));
		currentPos += 4;
		sort();
		var res_modifications = ArrayHelpers.writeArray(buffer, modifications, currentPos, (e) { return ArrayHelpers.getValue(e.modification);});
		currentPos = res_modifications.item2;
		buffer = res_modifications.item1;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'NonVerifiableMultisigAccountModificationTransactionV1(';
		result += 'type: "${type.toString()}", ';
		result += 'version: "0x${version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${network.toString()}", ';
		result += 'timestamp: "${timestamp.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'fee: "${fee.toString()}", ';
		result += 'deadline: "${deadline.toString()}", ';
		result += 'modifications: "${modifications.map((e) => e.toString()).toList()}", ';
		result += ')';
		return result;
	}
}


class MultisigAccountModificationTransactionV2 implements ISerializable, ITransaction {
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

	TransactionType type = MultisigAccountModificationTransactionV2.TRANSACTION_TYPE;
	int version = MultisigAccountModificationTransactionV2.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	Timestamp timestamp = Timestamp();
	@override
	PublicKey signerPublicKey = PublicKey();
	@override
	Signature signature = Signature();
	Amount fee = Amount();
	Timestamp deadline = Timestamp();
	List<SizePrefixedMultisigAccountModification> modifications = [];
	int minApprovalDelta = 0;
	final int entityBodyReserved_1 = 0; // reserved field
	final int signerPublicKeySize = 32; // reserved field
	final int signatureSize = 64; // reserved field
	final int minApprovalDeltaSize = 4; // reserved field

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
	}) {
		this.type = type ?? MultisigAccountModificationTransactionV2.TRANSACTION_TYPE;
		this.version = version ?? MultisigAccountModificationTransactionV2.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.timestamp = timestamp ?? Timestamp();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.signature = signature ?? Signature();
		this.fee = fee ?? Amount();
		this.deadline = deadline ?? Timestamp();
		this.modifications = modifications ?? [];
		this.minApprovalDelta = minApprovalDelta ?? 0;
	}

	@override
	void sort() {
		modifications.sort((lhs, rhs) {
			return ArrayHelpers.deepCompare(ArrayHelpers.getValue(lhs.modification), ArrayHelpers.getValue(rhs.modification));
		});
	}

	@override
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

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(entityBodyReserved_1, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + timestamp.size, timestamp.serialize());
		currentPos += timestamp.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(signerPublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(signatureSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signature.size, signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + fee.size, fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + deadline.size, deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(modifications.length, 4));
		currentPos += 4;
		sort();
		var res_modifications = ArrayHelpers.writeArray(buffer, modifications, currentPos, (e) { return ArrayHelpers.getValue(e.modification);});
		currentPos = res_modifications.item2;
		buffer = res_modifications.item1;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(minApprovalDeltaSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(minApprovalDelta, 4));
		currentPos += 4;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'MultisigAccountModificationTransactionV2(';
		result += 'type: "${type.toString()}", ';
		result += 'version: "0x${version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${network.toString()}", ';
		result += 'timestamp: "${timestamp.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'signature: "${signature.toString()}", ';
		result += 'fee: "${fee.toString()}", ';
		result += 'deadline: "${deadline.toString()}", ';
		result += 'modifications: "${modifications.map((e) => e.toString()).toList()}", ';
		result += 'minApprovalDelta: "0x${minApprovalDelta.toRadixString(16).padLeft(4 * 2, '0').toUpperCase()}", ';
		result += ')';
		return result;
	}
}


class NonVerifiableMultisigAccountModificationTransactionV2 implements ISerializable, IInnerTransaction {
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

	TransactionType type = NonVerifiableMultisigAccountModificationTransactionV2.TRANSACTION_TYPE;
	int version = NonVerifiableMultisigAccountModificationTransactionV2.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	Timestamp timestamp = Timestamp();
	PublicKey signerPublicKey = PublicKey();
	Amount fee = Amount();
	Timestamp deadline = Timestamp();
	List<SizePrefixedMultisigAccountModification> modifications = [];
	int minApprovalDelta = 0;
	final int entityBodyReserved_1 = 0; // reserved field
	final int signerPublicKeySize = 32; // reserved field
	final int minApprovalDeltaSize = 4; // reserved field

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
	}) {
		this.type = type ?? NonVerifiableMultisigAccountModificationTransactionV2.TRANSACTION_TYPE;
		this.version = version ?? NonVerifiableMultisigAccountModificationTransactionV2.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.timestamp = timestamp ?? Timestamp();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.fee = fee ?? Amount();
		this.deadline = deadline ?? Timestamp();
		this.modifications = modifications ?? [];
		this.minApprovalDelta = minApprovalDelta ?? 0;
	}

	@override
	void sort() {
		modifications.sort((lhs, rhs) {
			return ArrayHelpers.deepCompare(ArrayHelpers.getValue(lhs.modification), ArrayHelpers.getValue(rhs.modification));
		});
	}

	@override
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

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(entityBodyReserved_1, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + timestamp.size, timestamp.serialize());
		currentPos += timestamp.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(signerPublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + fee.size, fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + deadline.size, deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(modifications.length, 4));
		currentPos += 4;
		sort();
		var res_modifications = ArrayHelpers.writeArray(buffer, modifications, currentPos, (e) { return ArrayHelpers.getValue(e.modification);});
		currentPos = res_modifications.item2;
		buffer = res_modifications.item1;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(minApprovalDeltaSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(minApprovalDelta, 4));
		currentPos += 4;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'NonVerifiableMultisigAccountModificationTransactionV2(';
		result += 'type: "${type.toString()}", ';
		result += 'version: "0x${version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${network.toString()}", ';
		result += 'timestamp: "${timestamp.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'fee: "${fee.toString()}", ';
		result += 'deadline: "${deadline.toString()}", ';
		result += 'modifications: "${modifications.map((e) => e.toString()).toList()}", ';
		result += 'minApprovalDelta: "0x${minApprovalDelta.toRadixString(16).padLeft(4 * 2, '0').toUpperCase()}", ';
		result += ')';
		return result;
	}
}


class CosignatureV1 implements ISerializable {
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

	TransactionType type = CosignatureV1.TRANSACTION_TYPE;
	int version = CosignatureV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	Timestamp timestamp = Timestamp();
	PublicKey signerPublicKey = PublicKey();
	Signature signature = Signature();
	Amount fee = Amount();
	Timestamp deadline = Timestamp();
	Hash256 multisigTransactionHash = Hash256();
	Address multisigAccountAddress = Address();
	final int entityBodyReserved_1 = 0; // reserved field
	final int signerPublicKeySize = 32; // reserved field
	final int signatureSize = 64; // reserved field
	final int multisigTransactionHashOuterSize = 36; // reserved field
	final int multisigTransactionHashSize = 32; // reserved field
	final int multisigAccountAddressSize = 40; // reserved field

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
	}) {
		this.type = type ?? CosignatureV1.TRANSACTION_TYPE;
		this.version = version ?? CosignatureV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.timestamp = timestamp ?? Timestamp();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.signature = signature ?? Signature();
		this.fee = fee ?? Amount();
		this.deadline = deadline ?? Timestamp();
		this.multisigTransactionHash = multisigTransactionHash ?? Hash256();
		this.multisigAccountAddress = multisigAccountAddress ?? Address();
	}

	void sort() {
		// empty body
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

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(entityBodyReserved_1, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + timestamp.size, timestamp.serialize());
		currentPos += timestamp.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(signerPublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(signatureSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signature.size, signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + fee.size, fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + deadline.size, deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(multisigTransactionHashOuterSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(multisigTransactionHashSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + multisigTransactionHash.size, multisigTransactionHash.serialize());
		currentPos += multisigTransactionHash.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(multisigAccountAddressSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + multisigAccountAddress.size, multisigAccountAddress.serialize());
		currentPos += multisigAccountAddress.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'CosignatureV1(';
		result += 'type: "${type.toString()}", ';
		result += 'version: "0x${version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${network.toString()}", ';
		result += 'timestamp: "${timestamp.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'signature: "${signature.toString()}", ';
		result += 'fee: "${fee.toString()}", ';
		result += 'deadline: "${deadline.toString()}", ';
		result += 'multisigTransactionHash: "${multisigTransactionHash.toString()}", ';
		result += 'multisigAccountAddress: "${multisigAccountAddress.toString()}", ';
		result += ')';
		return result;
	}
}


class SizePrefixedCosignatureV1 implements ISerializable {

	static const Map<String, String> TYPE_HINTS = {
		'cosignature': 'struct:CosignatureV1'
	};

	CosignatureV1 cosignature = CosignatureV1();

	SizePrefixedCosignatureV1([cosignature]) {
		this.cosignature = cosignature ?? CosignatureV1();
	}

	void sort() {
		cosignature.sort();
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

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(cosignature.size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + cosignature.size, cosignature.serialize());
		currentPos += cosignature.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'SizePrefixedCosignatureV1(';
		result += 'cosignature: "${cosignature.toString()}", ';
		result += ')';
		return result;
	}
}


class MultisigTransactionV1 implements ISerializable, ITransaction {
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

	TransactionType type = MultisigTransactionV1.TRANSACTION_TYPE;
	int version = MultisigTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	Timestamp timestamp = Timestamp();
	@override
	PublicKey signerPublicKey = PublicKey();
	@override
	Signature signature = Signature();
	Amount fee = Amount();
	Timestamp deadline = Timestamp();
	IInnerTransaction innerTransaction = NonVerifiableTransaction();
	List<SizePrefixedCosignatureV1> cosignatures = [];
	final int entityBodyReserved_1 = 0; // reserved field
	final int signerPublicKeySize = 32; // reserved field
	final int signatureSize = 64; // reserved field

	MultisigTransactionV1({ 
	TransactionType? type,
	int? version,
	NetworkType? network,
	Timestamp? timestamp,
	PublicKey? signerPublicKey,
	Signature? signature,
	Amount? fee,
	Timestamp? deadline,
	IInnerTransaction? innerTransaction,
	List<SizePrefixedCosignatureV1>? cosignatures
	}) {
		this.type = type ?? MultisigTransactionV1.TRANSACTION_TYPE;
		this.version = version ?? MultisigTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.timestamp = timestamp ?? Timestamp();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.signature = signature ?? Signature();
		this.fee = fee ?? Amount();
		this.deadline = deadline ?? Timestamp();
		this.innerTransaction = innerTransaction ?? NonVerifiableTransaction();
		this.cosignatures = cosignatures ?? [];
	}

	@override
	void sort() {
		innerTransaction.sort();
	}

	@override
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

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(entityBodyReserved_1, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + timestamp.size, timestamp.serialize());
		currentPos += timestamp.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(signerPublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(signatureSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signature.size, signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + fee.size, fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + deadline.size, deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(innerTransaction.size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + innerTransaction.size, innerTransaction.serialize());
		currentPos += innerTransaction.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(cosignatures.length, 4));
		currentPos += 4;
		sort();
		var res_cosignatures = ArrayHelpers.writeArray(buffer, cosignatures, currentPos);
		currentPos = res_cosignatures.item2;
		buffer = res_cosignatures.item1;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'MultisigTransactionV1(';
		result += 'type: "${type.toString()}", ';
		result += 'version: "0x${version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${network.toString()}", ';
		result += 'timestamp: "${timestamp.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'signature: "${signature.toString()}", ';
		result += 'fee: "${fee.toString()}", ';
		result += 'deadline: "${deadline.toString()}", ';
		result += 'innerTransaction: "${innerTransaction.toString()}", ';
		result += 'cosignatures: "${cosignatures.map((e) => e.toString()).toList()}", ';
		result += ')';
		return result;
	}
}


class NonVerifiableMultisigTransactionV1 implements ISerializable, IInnerTransaction {
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

	TransactionType type = NonVerifiableMultisigTransactionV1.TRANSACTION_TYPE;
	int version = NonVerifiableMultisigTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	Timestamp timestamp = Timestamp();
	PublicKey signerPublicKey = PublicKey();
	Amount fee = Amount();
	Timestamp deadline = Timestamp();
	IInnerTransaction innerTransaction = NonVerifiableTransaction();
	final int entityBodyReserved_1 = 0; // reserved field
	final int signerPublicKeySize = 32; // reserved field

	NonVerifiableMultisigTransactionV1({ 
	TransactionType? type,
	int? version,
	NetworkType? network,
	Timestamp? timestamp,
	PublicKey? signerPublicKey,
	Amount? fee,
	Timestamp? deadline,
	IInnerTransaction? innerTransaction
	}) {
		this.type = type ?? NonVerifiableMultisigTransactionV1.TRANSACTION_TYPE;
		this.version = version ?? NonVerifiableMultisigTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.timestamp = timestamp ?? Timestamp();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.fee = fee ?? Amount();
		this.deadline = deadline ?? Timestamp();
		this.innerTransaction = innerTransaction ?? NonVerifiableTransaction();
	}

	@override
	void sort() {
		innerTransaction.sort();
	}

	@override
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

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(entityBodyReserved_1, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + timestamp.size, timestamp.serialize());
		currentPos += timestamp.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(signerPublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + fee.size, fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + deadline.size, deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(innerTransaction.size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + innerTransaction.size, innerTransaction.serialize());
		currentPos += innerTransaction.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'NonVerifiableMultisigTransactionV1(';
		result += 'type: "${type.toString()}", ';
		result += 'version: "0x${version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${network.toString()}", ';
		result += 'timestamp: "${timestamp.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'fee: "${fee.toString()}", ';
		result += 'deadline: "${deadline.toString()}", ';
		result += 'innerTransaction: "${innerTransaction.toString()}", ';
		result += ')';
		return result;
	}
}


class NamespaceRegistrationTransactionV1 implements ISerializable, ITransaction {
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

	TransactionType type = NamespaceRegistrationTransactionV1.TRANSACTION_TYPE;
	int version = NamespaceRegistrationTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	Timestamp timestamp = Timestamp();
	@override
	PublicKey signerPublicKey = PublicKey();
	@override
	Signature signature = Signature();
	Amount fee = Amount();
	Timestamp deadline = Timestamp();
	Address rentalFeeSink = Address();
	Amount rentalFee = Amount();
	Uint8List name = Uint8List(0);
	Uint8List? parentName;
	final int entityBodyReserved_1 = 0; // reserved field
	final int signerPublicKeySize = 32; // reserved field
	final int signatureSize = 64; // reserved field
	final int rentalFeeSinkSize = 40; // reserved field

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
	}) {
		this.type = type ?? NamespaceRegistrationTransactionV1.TRANSACTION_TYPE;
		this.version = version ?? NamespaceRegistrationTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.timestamp = timestamp ?? Timestamp();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.signature = signature ?? Signature();
		this.fee = fee ?? Amount();
		this.deadline = deadline ?? Timestamp();
		this.rentalFeeSink = rentalFeeSink ?? Address();
		this.rentalFee = rentalFee ?? Amount();
		this.name = name ?? Uint8List(0);
		this.parentName = parentName ?? null;
	}

	@override
	void sort() {
		// empty body
	}

	@override
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
		if (parentName != null)
		{
			size += parentName!.lengthInBytes;
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
		var parentName = null;
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

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(entityBodyReserved_1, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + timestamp.size, timestamp.serialize());
		currentPos += timestamp.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(signerPublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(signatureSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signature.size, signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + fee.size, fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + deadline.size, deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(rentalFeeSinkSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + rentalFeeSink.size, rentalFeeSink.serialize());
		currentPos += rentalFeeSink.size;
		buffer.setRange(currentPos, currentPos + rentalFee.size, rentalFee.serialize());
		currentPos += rentalFee.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(name.length, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + name.lengthInBytes, name);
		currentPos += name.lengthInBytes;
		buffer.setRange(currentPos, currentPos + 4, intToBytes((parentName != null ? parentName!.length : 4294967295), 4));
		currentPos += 4;
		if (parentName != null)
		{
			buffer.setRange(currentPos, currentPos + parentName!.lengthInBytes, parentName!);
			currentPos += parentName!.lengthInBytes;
		}
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'NamespaceRegistrationTransactionV1(';
		result += 'type: "${type.toString()}", ';
		result += 'version: "0x${version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${network.toString()}", ';
		result += 'timestamp: "${timestamp.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'signature: "${signature.toString()}", ';
		result += 'fee: "${fee.toString()}", ';
		result += 'deadline: "${deadline.toString()}", ';
		result += 'rentalFeeSink: "${rentalFeeSink.toString()}", ';
		result += 'rentalFee: "${rentalFee.toString()}", ';
		result += 'name: "${hex.encode(name.toList()).toUpperCase()}", ';
		if (parentName != null)
		{
			result += 'parentName: "${hex.encode(parentName!.toList()).toUpperCase()}", ';
		}
		result += ')';
		return result;
	}
}


class NonVerifiableNamespaceRegistrationTransactionV1 implements ISerializable, IInnerTransaction {
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

	TransactionType type = NonVerifiableNamespaceRegistrationTransactionV1.TRANSACTION_TYPE;
	int version = NonVerifiableNamespaceRegistrationTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	Timestamp timestamp = Timestamp();
	PublicKey signerPublicKey = PublicKey();
	Amount fee = Amount();
	Timestamp deadline = Timestamp();
	Address rentalFeeSink = Address();
	Amount rentalFee = Amount();
	Uint8List name = Uint8List(0);
	Uint8List? parentName;
	final int entityBodyReserved_1 = 0; // reserved field
	final int signerPublicKeySize = 32; // reserved field
	final int rentalFeeSinkSize = 40; // reserved field

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
	}) {
		this.type = type ?? NonVerifiableNamespaceRegistrationTransactionV1.TRANSACTION_TYPE;
		this.version = version ?? NonVerifiableNamespaceRegistrationTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.timestamp = timestamp ?? Timestamp();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.fee = fee ?? Amount();
		this.deadline = deadline ?? Timestamp();
		this.rentalFeeSink = rentalFeeSink ?? Address();
		this.rentalFee = rentalFee ?? Amount();
		this.name = name ?? Uint8List(0);
		this.parentName = parentName ?? null;
	}

	@override
	void sort() {
		// empty body
	}

	@override
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
		if (parentName != null)
		{
			size += parentName!.lengthInBytes;
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
		var parentName = null;
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

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(entityBodyReserved_1, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + timestamp.size, timestamp.serialize());
		currentPos += timestamp.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(signerPublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + fee.size, fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + deadline.size, deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(rentalFeeSinkSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + rentalFeeSink.size, rentalFeeSink.serialize());
		currentPos += rentalFeeSink.size;
		buffer.setRange(currentPos, currentPos + rentalFee.size, rentalFee.serialize());
		currentPos += rentalFee.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(name.length, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + name.lengthInBytes, name);
		currentPos += name.lengthInBytes;
		buffer.setRange(currentPos, currentPos + 4, intToBytes((parentName != null ? parentName!.length : 4294967295), 4));
		currentPos += 4;
		if (parentName != null)
		{
			buffer.setRange(currentPos, currentPos + parentName!.lengthInBytes, parentName!);
			currentPos += parentName!.lengthInBytes;
		}
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'NonVerifiableNamespaceRegistrationTransactionV1(';
		result += 'type: "${type.toString()}", ';
		result += 'version: "0x${version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${network.toString()}", ';
		result += 'timestamp: "${timestamp.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'fee: "${fee.toString()}", ';
		result += 'deadline: "${deadline.toString()}", ';
		result += 'rentalFeeSink: "${rentalFeeSink.toString()}", ';
		result += 'rentalFee: "${rentalFee.toString()}", ';
		result += 'name: "${hex.encode(name.toList()).toUpperCase()}", ';
		if (parentName != null)
		{
			result += 'parentName: "${hex.encode(parentName!.toList()).toUpperCase()}", ';
		}
		result += ')';
		return result;
	}
}


class MessageType implements ISerializable {
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

	@override
	Uint8List serialize() {
		var byteData = ByteData(4)..setUint32(0, value, Endian.little);
		return byteData.buffer.asUint8List();
	}

	@override
	String toString() {
		return 'MessageType.${_flags[value]}';
	}
}


class Message implements ISerializable {

	static const Map<String, String> TYPE_HINTS = {
		'messageType': 'enum:MessageType',
		'message': 'bytes_array'
	};

	MessageType messageType = MessageType.PLAIN;
	Uint8List message = Uint8List(0);

	Message({ MessageType? messageType, Uint8List? message}) {
		this.messageType = messageType ?? MessageType.PLAIN;
		this.message = message ?? Uint8List(0);
	}

	void sort() {
		// empty body
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

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + messageType.size, messageType.serialize());
		currentPos += messageType.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(message.length, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + message.lengthInBytes, message);
		currentPos += message.lengthInBytes;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'Message(';
		result += 'messageType: "${messageType.toString()}", ';
		result += 'message: "${hex.encode(message.toList()).toUpperCase()}", ';
		result += ')';
		return result;
	}
}


class TransferTransactionV1 implements ISerializable, ITransaction {
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

	TransactionType type = TransferTransactionV1.TRANSACTION_TYPE;
	int version = TransferTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	Timestamp timestamp = Timestamp();
	@override
	PublicKey signerPublicKey = PublicKey();
	@override
	Signature signature = Signature();
	Amount fee = Amount();
	Timestamp deadline = Timestamp();
	Address recipientAddress = Address();
	Amount amount = Amount();
	Message? message;
	final int entityBodyReserved_1 = 0; // reserved field
	final int signerPublicKeySize = 32; // reserved field
	final int signatureSize = 64; // reserved field
	final int recipientAddressSize = 40; // reserved field

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
	}) {
		this.type = type ?? TransferTransactionV1.TRANSACTION_TYPE;
		this.version = version ?? TransferTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.timestamp = timestamp ?? Timestamp();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.signature = signature ?? Signature();
		this.fee = fee ?? Amount();
		this.deadline = deadline ?? Timestamp();
		this.recipientAddress = recipientAddress ?? Address();
		this.amount = amount ?? Amount();
		this.message = message ?? null;
	}

	@override
	void sort() {
		if (0 != messageEnvelopeSizeComputed)
		{
			message?.sort();
		}
	}

	int get messageEnvelopeSizeComputed {
		return message?.size ?? 0;
	}

	@override
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
			size += message!.size;
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
		var message = null;
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

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(entityBodyReserved_1, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + timestamp.size, timestamp.serialize());
		currentPos += timestamp.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(signerPublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(signatureSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signature.size, signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + fee.size, fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + deadline.size, deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(recipientAddressSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + recipientAddress.size, recipientAddress.serialize());
		currentPos += recipientAddress.size;
		buffer.setRange(currentPos, currentPos + amount.size, amount.serialize());
		currentPos += amount.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(messageEnvelopeSizeComputed, 4));
		currentPos += 4;
		if (0 != messageEnvelopeSizeComputed)
		{
			buffer.setRange(currentPos, currentPos + message!.size, message!.serialize());
			currentPos += message!.size;
		}
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'TransferTransactionV1(';
		result += 'type: "${type.toString()}", ';
		result += 'version: "0x${version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${network.toString()}", ';
		result += 'timestamp: "${timestamp.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'signature: "${signature.toString()}", ';
		result += 'fee: "${fee.toString()}", ';
		result += 'deadline: "${deadline.toString()}", ';
		result += 'recipientAddress: "${recipientAddress.toString()}", ';
		result += 'amount: "${amount.toString()}", ';
		if (0 != messageEnvelopeSizeComputed)
		{
			result += 'message: "${message!.toString()}", ';
		}
		result += ')';
		return result;
	}
}


class NonVerifiableTransferTransactionV1 implements ISerializable, IInnerTransaction {
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

	TransactionType type = NonVerifiableTransferTransactionV1.TRANSACTION_TYPE;
	int version = NonVerifiableTransferTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	Timestamp timestamp = Timestamp();
	PublicKey signerPublicKey = PublicKey();
	Amount fee = Amount();
	Timestamp deadline = Timestamp();
	Address recipientAddress = Address();
	Amount amount = Amount();
	Message? message;
	final int entityBodyReserved_1 = 0; // reserved field
	final int signerPublicKeySize = 32; // reserved field
	final int recipientAddressSize = 40; // reserved field

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
	}) {
		this.type = type ?? NonVerifiableTransferTransactionV1.TRANSACTION_TYPE;
		this.version = version ?? NonVerifiableTransferTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.timestamp = timestamp ?? Timestamp();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.fee = fee ?? Amount();
		this.deadline = deadline ?? Timestamp();
		this.recipientAddress = recipientAddress ?? Address();
		this.amount = amount ?? Amount();
		this.message = message ?? null;
	}

	@override
	void sort() {
		if (0 != messageEnvelopeSizeComputed)
		{
			message?.sort();
		}
	}

	int get messageEnvelopeSizeComputed {
		return message?.size ?? 0;
	}

	@override
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
			size += message!.size;
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
		var message = null;
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

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(entityBodyReserved_1, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + timestamp.size, timestamp.serialize());
		currentPos += timestamp.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(signerPublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + fee.size, fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + deadline.size, deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(recipientAddressSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + recipientAddress.size, recipientAddress.serialize());
		currentPos += recipientAddress.size;
		buffer.setRange(currentPos, currentPos + amount.size, amount.serialize());
		currentPos += amount.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(messageEnvelopeSizeComputed, 4));
		currentPos += 4;
		if (0 != messageEnvelopeSizeComputed)
		{
			buffer.setRange(currentPos, currentPos + message!.size, message!.serialize());
			currentPos += message!.size;
		}
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'NonVerifiableTransferTransactionV1(';
		result += 'type: "${type.toString()}", ';
		result += 'version: "0x${version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${network.toString()}", ';
		result += 'timestamp: "${timestamp.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'fee: "${fee.toString()}", ';
		result += 'deadline: "${deadline.toString()}", ';
		result += 'recipientAddress: "${recipientAddress.toString()}", ';
		result += 'amount: "${amount.toString()}", ';
		if (0 != messageEnvelopeSizeComputed)
		{
			result += 'message: "${message!.toString()}", ';
		}
		result += ')';
		return result;
	}
}


class TransferTransactionV2 implements ISerializable, ITransaction {
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

	TransactionType type = TransferTransactionV2.TRANSACTION_TYPE;
	int version = TransferTransactionV2.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	Timestamp timestamp = Timestamp();
	@override
	PublicKey signerPublicKey = PublicKey();
	@override
	Signature signature = Signature();
	Amount fee = Amount();
	Timestamp deadline = Timestamp();
	Address recipientAddress = Address();
	Amount amount = Amount();
	Message? message;
	List<SizePrefixedMosaic> mosaics = [];
	final int entityBodyReserved_1 = 0; // reserved field
	final int signerPublicKeySize = 32; // reserved field
	final int signatureSize = 64; // reserved field
	final int recipientAddressSize = 40; // reserved field

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
	}) {
		this.type = type ?? TransferTransactionV2.TRANSACTION_TYPE;
		this.version = version ?? TransferTransactionV2.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.timestamp = timestamp ?? Timestamp();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.signature = signature ?? Signature();
		this.fee = fee ?? Amount();
		this.deadline = deadline ?? Timestamp();
		this.recipientAddress = recipientAddress ?? Address();
		this.amount = amount ?? Amount();
		this.message = message ?? null;
		this.mosaics = mosaics ?? [];
	}

	@override
	void sort() {
		if (0 != messageEnvelopeSizeComputed)
		{
			message?.sort();
		}
	}

	int get messageEnvelopeSizeComputed {
		return message?.size ?? 0;
	}

	@override
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
			size += message!.size;
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
		var message = null;
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

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(entityBodyReserved_1, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + timestamp.size, timestamp.serialize());
		currentPos += timestamp.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(signerPublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(signatureSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signature.size, signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + fee.size, fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + deadline.size, deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(recipientAddressSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + recipientAddress.size, recipientAddress.serialize());
		currentPos += recipientAddress.size;
		buffer.setRange(currentPos, currentPos + amount.size, amount.serialize());
		currentPos += amount.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(messageEnvelopeSizeComputed, 4));
		currentPos += 4;
		if (0 != messageEnvelopeSizeComputed)
		{
			buffer.setRange(currentPos, currentPos + message!.size, message!.serialize());
			currentPos += message!.size;
		}
		buffer.setRange(currentPos, currentPos + 4, intToBytes(mosaics.length, 4));
		currentPos += 4;
		sort();
		var res_mosaics = ArrayHelpers.writeArray(buffer, mosaics, currentPos);
		currentPos = res_mosaics.item2;
		buffer = res_mosaics.item1;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'TransferTransactionV2(';
		result += 'type: "${type.toString()}", ';
		result += 'version: "0x${version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${network.toString()}", ';
		result += 'timestamp: "${timestamp.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'signature: "${signature.toString()}", ';
		result += 'fee: "${fee.toString()}", ';
		result += 'deadline: "${deadline.toString()}", ';
		result += 'recipientAddress: "${recipientAddress.toString()}", ';
		result += 'amount: "${amount.toString()}", ';
		if (0 != messageEnvelopeSizeComputed)
		{
			result += 'message: "${message!.toString()}", ';
		}
		result += 'mosaics: "${mosaics.map((e) => e.toString()).toList()}", ';
		result += ')';
		return result;
	}
}


class NonVerifiableTransferTransactionV2 implements ISerializable, IInnerTransaction {
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

	TransactionType type = NonVerifiableTransferTransactionV2.TRANSACTION_TYPE;
	int version = NonVerifiableTransferTransactionV2.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	Timestamp timestamp = Timestamp();
	PublicKey signerPublicKey = PublicKey();
	Amount fee = Amount();
	Timestamp deadline = Timestamp();
	Address recipientAddress = Address();
	Amount amount = Amount();
	Message? message;
	List<SizePrefixedMosaic> mosaics = [];
	final int entityBodyReserved_1 = 0; // reserved field
	final int signerPublicKeySize = 32; // reserved field
	final int recipientAddressSize = 40; // reserved field

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
	}) {
		this.type = type ?? NonVerifiableTransferTransactionV2.TRANSACTION_TYPE;
		this.version = version ?? NonVerifiableTransferTransactionV2.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.timestamp = timestamp ?? Timestamp();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.fee = fee ?? Amount();
		this.deadline = deadline ?? Timestamp();
		this.recipientAddress = recipientAddress ?? Address();
		this.amount = amount ?? Amount();
		this.message = message ?? null;
		this.mosaics = mosaics ?? [];
	}

	@override
	void sort() {
		if (0 != messageEnvelopeSizeComputed)
		{
			message?.sort();
		}
	}

	int get messageEnvelopeSizeComputed {
		return message?.size ?? 0;
	}

	@override
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
			size += message!.size;
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
		var message = null;
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

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(entityBodyReserved_1, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + timestamp.size, timestamp.serialize());
		currentPos += timestamp.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(signerPublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + fee.size, fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + deadline.size, deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(recipientAddressSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + recipientAddress.size, recipientAddress.serialize());
		currentPos += recipientAddress.size;
		buffer.setRange(currentPos, currentPos + amount.size, amount.serialize());
		currentPos += amount.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(messageEnvelopeSizeComputed, 4));
		currentPos += 4;
		if (0 != messageEnvelopeSizeComputed)
		{
			buffer.setRange(currentPos, currentPos + message!.size, message!.serialize());
			currentPos += message!.size;
		}
		buffer.setRange(currentPos, currentPos + 4, intToBytes(mosaics.length, 4));
		currentPos += 4;
		sort();
		var res_mosaics = ArrayHelpers.writeArray(buffer, mosaics, currentPos);
		currentPos = res_mosaics.item2;
		buffer = res_mosaics.item1;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'NonVerifiableTransferTransactionV2(';
		result += 'type: "${type.toString()}", ';
		result += 'version: "0x${version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${network.toString()}", ';
		result += 'timestamp: "${timestamp.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'fee: "${fee.toString()}", ';
		result += 'deadline: "${deadline.toString()}", ';
		result += 'recipientAddress: "${recipientAddress.toString()}", ';
		result += 'amount: "${amount.toString()}", ';
		if (0 != messageEnvelopeSizeComputed)
		{
			result += 'message: "${message!.toString()}", ';
		}
		result += 'mosaics: "${mosaics.map((e) => e.toString()).toList()}", ';
		result += ')';
		return result;
	}
}


class TransactionFactory implements ISerializable {
	@override
	dynamic deserialize(dynamic payload) {
		if(payload is String){
			tryHexString(payload);
			payload = hex.decode(payload);
		}
		Uint8List buffer = payload.buffer.asUint8List();
		var parent = Transaction().deserialize(buffer);
		var mapping = <(int, int), ISerializable>{
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

	ISerializable createByName(String entityName) {
		var mapping = <String, ISerializable Function()>{
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

	@override
	Uint8List serialize() {
		throw UnimplementedError('do not need serialize for factory');
	}
}


class NonVerifiableTransactionFactory implements ISerializable {
	@override
	dynamic deserialize(dynamic payload) {
		if(payload is String){
			tryHexString(payload);
			payload = hex.decode(payload);
		}
		Uint8List buffer = payload.buffer.asUint8List();
		var parent = NonVerifiableTransaction().deserialize(buffer);
		var mapping = <(int, int), ISerializable>{
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

	ISerializable createByName(String entityName) {
		var mapping = <String, ISerializable Function()>{
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

	@override
	Uint8List serialize() {
		throw UnimplementedError('do not need serialize for factory');
	}
}
