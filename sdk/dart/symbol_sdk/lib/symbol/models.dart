

import '../BaseValue.dart';
import '../ByteArray.dart';
import '../models/ISerializable.dart';
import './ITransaction.dart';
import '../models/IInnerTransaction.dart';
import '../utils/converter.dart';
import '../utils/arrayHelpers.dart';
import '../utils/transform.dart';
import 'dart:typed_data';
import 'package:tuple/tuple.dart';

class Amount extends BaseValue implements ISerializable {
	static const int SIZE = 8;

	Amount([dynamic amount]) : super(SIZE, amount ?? BigInt.from(0));

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


class BlockDuration extends BaseValue implements ISerializable {
	static const int SIZE = 8;

	BlockDuration([dynamic blockDuration]) : super(SIZE, blockDuration ?? BigInt.from(0));

	@override
	BlockDuration deserialize(Uint8List payload) {
		return BlockDuration(bytesToInt(payload.sublist(0, 8), 8));
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(SIZE);
		buffer.setRange(0, 0 + 8, intToBytes(value, 8));
		return buffer;
	}
}


class BlockFeeMultiplier extends BaseValue implements ISerializable {
	static const int SIZE = 4;

	BlockFeeMultiplier([dynamic blockFeeMultiplier]) : super(SIZE, blockFeeMultiplier ?? 0);

	@override
	BlockFeeMultiplier deserialize(Uint8List payload) {
		return BlockFeeMultiplier(bytesToInt(payload.sublist(0, 4), 4));
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(SIZE);
		buffer.setRange(0, 0 + 4, intToBytes(value, 4));
		return buffer;
	}
}


class Difficulty extends BaseValue implements ISerializable {
	static const int SIZE = 8;

	Difficulty([dynamic difficulty]) : super(SIZE, difficulty ?? BigInt.from(0));

	@override
	Difficulty deserialize(Uint8List payload) {
		return Difficulty(bytesToInt(payload.sublist(0, 8), 8));
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(SIZE);
		buffer.setRange(0, 0 + 8, intToBytes(value, 8));
		return buffer;
	}
}


class FinalizationEpoch extends BaseValue implements ISerializable {
	static const int SIZE = 4;

	FinalizationEpoch([dynamic finalizationEpoch]) : super(SIZE, finalizationEpoch ?? 0);

	@override
	FinalizationEpoch deserialize(Uint8List payload) {
		return FinalizationEpoch(bytesToInt(payload.sublist(0, 4), 4));
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(SIZE);
		buffer.setRange(0, 0 + 4, intToBytes(value, 4));
		return buffer;
	}
}


class FinalizationPoint extends BaseValue implements ISerializable {
	static const int SIZE = 4;

	FinalizationPoint([dynamic finalizationPoint]) : super(SIZE, finalizationPoint ?? 0);

	@override
	FinalizationPoint deserialize(Uint8List payload) {
		return FinalizationPoint(bytesToInt(payload.sublist(0, 4), 4));
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(SIZE);
		buffer.setRange(0, 0 + 4, intToBytes(value, 4));
		return buffer;
	}
}


class Height extends BaseValue implements ISerializable {
	static const int SIZE = 8;

	Height([dynamic height]) : super(SIZE, height ?? BigInt.from(0));

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


class Importance extends BaseValue implements ISerializable {
	static const int SIZE = 8;

	Importance([dynamic importance]) : super(SIZE, importance ?? BigInt.from(0));

	@override
	Importance deserialize(Uint8List payload) {
		return Importance(bytesToInt(payload.sublist(0, 8), 8));
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(SIZE);
		buffer.setRange(0, 0 + 8, intToBytes(value, 8));
		return buffer;
	}
}


class ImportanceHeight extends BaseValue implements ISerializable {
	static const int SIZE = 8;

	ImportanceHeight([dynamic importanceHeight]) : super(SIZE, importanceHeight ?? BigInt.from(0));

	@override
	ImportanceHeight deserialize(Uint8List payload) {
		return ImportanceHeight(bytesToInt(payload.sublist(0, 8), 8));
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(SIZE);
		buffer.setRange(0, 0 + 8, intToBytes(value, 8));
		return buffer;
	}
}


class UnresolvedMosaicId extends BaseValue implements ISerializable {
	static const int SIZE = 8;

	UnresolvedMosaicId([dynamic unresolvedMosaicId]) : super(SIZE, unresolvedMosaicId ?? BigInt.from(0));

	@override
	UnresolvedMosaicId deserialize(Uint8List payload) {
		return UnresolvedMosaicId(bytesToInt(payload.sublist(0, 8), 8));
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(SIZE);
		buffer.setRange(0, 0 + 8, intToBytes(value, 8));
		return buffer;
	}
}


class MosaicId extends BaseValue implements ISerializable {
	static const int SIZE = 8;

	MosaicId([dynamic mosaicId]) : super(SIZE, mosaicId ?? BigInt.from(0));

	@override
	MosaicId deserialize(Uint8List payload) {
		return MosaicId(bytesToInt(payload.sublist(0, 8), 8));
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(SIZE);
		buffer.setRange(0, 0 + 8, intToBytes(value, 8));
		return buffer;
	}
}


class Timestamp extends BaseValue implements ISerializable {
	static const int SIZE = 8;

	Timestamp([dynamic timestamp]) : super(SIZE, timestamp ?? BigInt.from(0));

	@override
	Timestamp deserialize(Uint8List payload) {
		return Timestamp(bytesToInt(payload.sublist(0, 8), 8));
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(SIZE);
		buffer.setRange(0, 0 + 8, intToBytes(value, 8));
		return buffer;
	}
}


class UnresolvedAddress extends ByteArray implements ISerializable {
	static const int SIZE = 24;

	UnresolvedAddress([dynamic unresolvedAddress]) : super(SIZE, unresolvedAddress ?? Uint8List(24));

	@override
	int get size {
		return 24;
	}

	@override
	UnresolvedAddress deserialize(Uint8List payload) {
		payload = payload.sublist(0, SIZE);
		return UnresolvedAddress(Uint8List.fromList(payload));
	}

	@override
	Uint8List serialize() {
		return bytes;
	}
}


class Address extends ByteArray implements ISerializable {
	static const int SIZE = 24;

	Address([dynamic address]) : super(SIZE, address ?? Uint8List(24));

	@override
	int get size {
		return 24;
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

	@override
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


class Hash512 extends ByteArray implements ISerializable {
	static const int SIZE = 64;

	Hash512([dynamic hash512]) : super(SIZE, hash512 ?? Uint8List(64));

	@override
	int get size {
		return 64;
	}

	@override
	Hash512 deserialize(Uint8List payload) {
		payload = payload.sublist(0, SIZE);
		return Hash512(Uint8List.fromList(payload));
	}

	@override
	Uint8List serialize() {
		return bytes;
	}
}


class PublicKey extends ByteArray implements ISerializable {
	static const int SIZE = 32;

	PublicKey([dynamic publicKey]) : super(SIZE, publicKey ?? Uint8List(32));

	@override
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


class VotingPublicKey extends ByteArray implements ISerializable {
	static const int SIZE = 32;

	VotingPublicKey([dynamic votingPublicKey]) : super(SIZE, votingPublicKey ?? Uint8List(32));

	@override
	int get size {
		return 32;
	}

	@override
	VotingPublicKey deserialize(Uint8List payload) {
		payload = payload.sublist(0, SIZE);
		return VotingPublicKey(Uint8List.fromList(payload));
	}

	@override
	Uint8List serialize() {
		return bytes;
	}
}


class Signature extends ByteArray implements ISerializable {
	static const int SIZE = 64;

	Signature([dynamic signature]) : super(SIZE, signature ?? Uint8List(64));

	@override
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


class Mosaic implements ISerializable {

	static const Map<String, String> TYPE_HINTS = {
		'mosaicId': 'pod:MosaicId',
		'amount': 'pod:Amount'
	};

	MosaicId mosaicId = MosaicId();
	Amount amount = Amount();

	Mosaic({ MosaicId? mosaicId, Amount? amount}) {
		this.mosaicId = mosaicId ?? MosaicId();
		this.amount = amount ?? Amount();
	}

	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += mosaicId.size;
		size += amount.size;
		return size;
	}

	@override
	Mosaic deserialize(Uint8List payload) {
		var buffer = payload;
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
		buffer.setRange(currentPos, currentPos + mosaicId.size, mosaicId.serialize());
		currentPos += mosaicId.size;
		buffer.setRange(currentPos, currentPos + amount.size, amount.serialize());
		currentPos += amount.size;
		return buffer;
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


class UnresolvedMosaic implements ISerializable {

	static const Map<String, String> TYPE_HINTS = {
		'mosaicId': 'pod:UnresolvedMosaicId',
		'amount': 'pod:Amount'
	};

	UnresolvedMosaicId mosaicId = UnresolvedMosaicId();
	Amount amount = Amount();

	UnresolvedMosaic({ UnresolvedMosaicId? mosaicId, Amount? amount}) {
		this.mosaicId = mosaicId ?? UnresolvedMosaicId();
		this.amount = amount ?? Amount();
	}

	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += mosaicId.size;
		size += amount.size;
		return size;
	}

	@override
	UnresolvedMosaic deserialize(Uint8List payload) {
		var buffer = payload;
		var mosaicId = UnresolvedMosaicId().deserialize(buffer);
		buffer = buffer.sublist(mosaicId.size);
		var amount = Amount().deserialize(buffer);
		buffer = buffer.sublist(amount.size);

		var instance = UnresolvedMosaic(
			mosaicId: mosaicId,
			amount: amount,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + mosaicId.size, mosaicId.serialize());
		currentPos += mosaicId.size;
		buffer.setRange(currentPos, currentPos + amount.size, amount.serialize());
		currentPos += amount.size;
		return buffer;
	}

	@override
	String toString() {
		var result = 'UnresolvedMosaic(';
		result += 'mosaicId: "${mosaicId.toString()}", ';
		result += 'amount: "${amount.toString()}", ';
		result += ')';
		return result;
	}
}


class LinkAction implements ISerializable {
	static final UNLINK = LinkAction(0);
	static final LINK = LinkAction(1);

	int value = 0;

	static final _flags = {
		0: 'UNLINK',
		1: 'LINK',
	};

	LinkAction([int? _value]) {
		value = _value ?? 0;
	}

	@override
	int get size {
		return 1;
	}

	@override
	LinkAction deserialize(Uint8List payload) {
		var byteData = ByteData.sublistView(payload);
		return LinkAction(byteData.getUint8(0));
	}

	@override
	Uint8List serialize() {
		var byteData = ByteData(1)..setUint8(0, value);
		return byteData.buffer.asUint8List();
	}

	@override
	String toString() {
		return 'LinkAction.${_flags[value]}';
	}
}


class NetworkType implements ISerializable {
	static final MAINNET = NetworkType(104);
	static final TESTNET = NetworkType(152);

	int value = 0;

	static final _flags = {
		104: 'MAINNET',
		152: 'TESTNET',
	};

	NetworkType([int? _value]) {
		value = _value ?? 104;
	}

	@override
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
	static final ACCOUNT_KEY_LINK = TransactionType(16716);
	static final NODE_KEY_LINK = TransactionType(16972);
	static final AGGREGATE_COMPLETE = TransactionType(16705);
	static final AGGREGATE_BONDED = TransactionType(16961);
	static final VOTING_KEY_LINK = TransactionType(16707);
	static final VRF_KEY_LINK = TransactionType(16963);
	static final HASH_LOCK = TransactionType(16712);
	static final SECRET_LOCK = TransactionType(16722);
	static final SECRET_PROOF = TransactionType(16978);
	static final ACCOUNT_METADATA = TransactionType(16708);
	static final MOSAIC_METADATA = TransactionType(16964);
	static final NAMESPACE_METADATA = TransactionType(17220);
	static final MOSAIC_DEFINITION = TransactionType(16717);
	static final MOSAIC_SUPPLY_CHANGE = TransactionType(16973);
	static final MOSAIC_SUPPLY_REVOCATION = TransactionType(17229);
	static final MULTISIG_ACCOUNT_MODIFICATION = TransactionType(16725);
	static final ADDRESS_ALIAS = TransactionType(16974);
	static final MOSAIC_ALIAS = TransactionType(17230);
	static final NAMESPACE_REGISTRATION = TransactionType(16718);
	static final ACCOUNT_ADDRESS_RESTRICTION = TransactionType(16720);
	static final ACCOUNT_MOSAIC_RESTRICTION = TransactionType(16976);
	static final ACCOUNT_OPERATION_RESTRICTION = TransactionType(17232);
	static final MOSAIC_ADDRESS_RESTRICTION = TransactionType(16977);
	static final MOSAIC_GLOBAL_RESTRICTION = TransactionType(16721);
	static final TRANSFER = TransactionType(16724);

	int value = 0;

	static final _flags = {
		16716: 'ACCOUNT_KEY_LINK',
		16972: 'NODE_KEY_LINK',
		16705: 'AGGREGATE_COMPLETE',
		16961: 'AGGREGATE_BONDED',
		16707: 'VOTING_KEY_LINK',
		16963: 'VRF_KEY_LINK',
		16712: 'HASH_LOCK',
		16722: 'SECRET_LOCK',
		16978: 'SECRET_PROOF',
		16708: 'ACCOUNT_METADATA',
		16964: 'MOSAIC_METADATA',
		17220: 'NAMESPACE_METADATA',
		16717: 'MOSAIC_DEFINITION',
		16973: 'MOSAIC_SUPPLY_CHANGE',
		17229: 'MOSAIC_SUPPLY_REVOCATION',
		16725: 'MULTISIG_ACCOUNT_MODIFICATION',
		16974: 'ADDRESS_ALIAS',
		17230: 'MOSAIC_ALIAS',
		16718: 'NAMESPACE_REGISTRATION',
		16720: 'ACCOUNT_ADDRESS_RESTRICTION',
		16976: 'ACCOUNT_MOSAIC_RESTRICTION',
		17232: 'ACCOUNT_OPERATION_RESTRICTION',
		16977: 'MOSAIC_ADDRESS_RESTRICTION',
		16721: 'MOSAIC_GLOBAL_RESTRICTION',
		16724: 'TRANSFER',
	};

	TransactionType([int? _value]) {
		value = _value ?? 16716;
	}

	@override
	int get size {
		return 2;
	}

	@override
	TransactionType deserialize(Uint8List payload) {
		var byteData = ByteData.sublistView(payload);
		return TransactionType(byteData.getUint16(0, Endian.little));
	}

	@override
	Uint8List serialize() {
		var byteData = ByteData(2)..setUint16(0, value, Endian.little);
		return byteData.buffer.asUint8List();
	}

	@override
	String toString() {
		return 'TransactionType.${_flags[value]}';
	}
}


class Transaction implements ISerializable, ITransaction {

	static const Map<String, String> TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp'
	};

	@override
	Signature signature = Signature();
	@override
	PublicKey signerPublicKey = PublicKey();
	int version = 0;
	NetworkType network = NetworkType.MAINNET;
	TransactionType type = TransactionType.ACCOUNT_KEY_LINK;
	Amount fee = Amount();
	Timestamp deadline = Timestamp();
	final int verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field

	Transaction({ 
	Signature? signature,
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	Amount? fee,
	Timestamp? deadline
	}) {
		this.signature = signature ?? Signature();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? 0;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? TransactionType.ACCOUNT_KEY_LINK;
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
		size += 4;
		size += 4;
		size += signature.size;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += fee.size;
		size += deadline.size;
		return size;
	}

	@override
	Transaction deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var verifiableEntityHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != verifiableEntityHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($verifiableEntityHeaderReserved_1)');
		}
		var signature = Signature().deserialize(buffer);
		buffer = buffer.sublist(signature.size);
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var fee = Amount().deserialize(buffer);
		buffer = buffer.sublist(fee.size);
		var deadline = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(deadline.size);

		var instance = Transaction(
			signature: signature,
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			fee: fee,
			deadline: deadline,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signature.size, signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + fee.size, fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + deadline.size, deadline.serialize());
		currentPos += deadline.size;
		return buffer;
	}

	@override
	String toString() {
		var result = 'Transaction(';
		result += 'signature: "${signature.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'fee: "${fee.toString()}", ';
		result += 'deadline: "${deadline.toString()}", ';
		result += ')';
		return result;
	}
}


class EmbeddedTransaction implements ISerializable, IInnerTransaction {

	static const Map<String, String> TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType'
	};

	PublicKey signerPublicKey = PublicKey();
	int version = 0;
	NetworkType network = NetworkType.MAINNET;
	TransactionType type = TransactionType.ACCOUNT_KEY_LINK;
	final int embeddedTransactionHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field

	EmbeddedTransaction({ PublicKey? signerPublicKey, int? version, NetworkType? network, TransactionType? type}) {
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? 0;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? TransactionType.ACCOUNT_KEY_LINK;
	}

	@override
	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		return size;
	}

	@override
	EmbeddedTransaction deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var embeddedTransactionHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != embeddedTransactionHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($embeddedTransactionHeaderReserved_1)');
		}
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);

		var instance = EmbeddedTransaction(
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(embeddedTransactionHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		return buffer;
	}

	@override
	String toString() {
		var result = 'EmbeddedTransaction(';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += ')';
		return result;
	}
}


class ProofGamma extends ByteArray implements ISerializable {
	static const int SIZE = 32;

	ProofGamma([dynamic proofGamma]) : super(SIZE, proofGamma ?? Uint8List(32));

	@override
	int get size {
		return 32;
	}

	@override
	ProofGamma deserialize(Uint8List payload) {
		payload = payload.sublist(0, SIZE);
		return ProofGamma(Uint8List.fromList(payload));
	}

	@override
	Uint8List serialize() {
		return bytes;
	}
}


class ProofVerificationHash extends ByteArray implements ISerializable {
	static const int SIZE = 16;

	ProofVerificationHash([dynamic proofVerificationHash]) : super(SIZE, proofVerificationHash ?? Uint8List(16));

	@override
	int get size {
		return 16;
	}

	@override
	ProofVerificationHash deserialize(Uint8List payload) {
		payload = payload.sublist(0, SIZE);
		return ProofVerificationHash(Uint8List.fromList(payload));
	}

	@override
	Uint8List serialize() {
		return bytes;
	}
}


class ProofScalar extends ByteArray implements ISerializable {
	static const int SIZE = 32;

	ProofScalar([dynamic proofScalar]) : super(SIZE, proofScalar ?? Uint8List(32));

	@override
	int get size {
		return 32;
	}

	@override
	ProofScalar deserialize(Uint8List payload) {
		payload = payload.sublist(0, SIZE);
		return ProofScalar(Uint8List.fromList(payload));
	}

	@override
	Uint8List serialize() {
		return bytes;
	}
}


class BlockType implements ISerializable {
	static final NEMESIS = BlockType(32835);
	static final NORMAL = BlockType(33091);
	static final IMPORTANCE = BlockType(33347);

	int value = 0;

	static final _flags = {
		32835: 'NEMESIS',
		33091: 'NORMAL',
		33347: 'IMPORTANCE',
	};

	BlockType([int? _value]) {
		value = _value ?? 32835;
	}

	@override
	int get size {
		return 2;
	}

	@override
	BlockType deserialize(Uint8List payload) {
		var byteData = ByteData.sublistView(payload);
		return BlockType(byteData.getUint16(0, Endian.little));
	}

	@override
	Uint8List serialize() {
		var byteData = ByteData(2)..setUint16(0, value, Endian.little);
		return byteData.buffer.asUint8List();
	}

	@override
	String toString() {
		return 'BlockType.${_flags[value]}';
	}
}


class VrfProof implements ISerializable {

	static const Map<String, String> TYPE_HINTS = {
		'gamma': 'pod:ProofGamma',
		'verificationHash': 'pod:ProofVerificationHash',
		'scalar': 'pod:ProofScalar'
	};

	ProofGamma gamma = ProofGamma();
	ProofVerificationHash verificationHash = ProofVerificationHash();
	ProofScalar scalar = ProofScalar();

	VrfProof({ ProofGamma? gamma, ProofVerificationHash? verificationHash, ProofScalar? scalar}) {
		this.gamma = gamma ?? ProofGamma();
		this.verificationHash = verificationHash ?? ProofVerificationHash();
		this.scalar = scalar ?? ProofScalar();
	}

	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += gamma.size;
		size += verificationHash.size;
		size += scalar.size;
		return size;
	}

	@override
	VrfProof deserialize(Uint8List payload) {
		var buffer = payload;
		var gamma = ProofGamma().deserialize(buffer);
		buffer = buffer.sublist(gamma.size);
		var verificationHash = ProofVerificationHash().deserialize(buffer);
		buffer = buffer.sublist(verificationHash.size);
		var scalar = ProofScalar().deserialize(buffer);
		buffer = buffer.sublist(scalar.size);

		var instance = VrfProof(
			gamma: gamma,
			verificationHash: verificationHash,
			scalar: scalar,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + gamma.size, gamma.serialize());
		currentPos += gamma.size;
		buffer.setRange(currentPos, currentPos + verificationHash.size, verificationHash.serialize());
		currentPos += verificationHash.size;
		buffer.setRange(currentPos, currentPos + scalar.size, scalar.serialize());
		currentPos += scalar.size;
		return buffer;
	}

	@override
	String toString() {
		var result = 'VrfProof(';
		result += 'gamma: "${gamma.toString()}", ';
		result += 'verificationHash: "${verificationHash.toString()}", ';
		result += 'scalar: "${scalar.toString()}", ';
		result += ')';
		return result;
	}
}


class Block implements ISerializable {

	static const Map<String, String> TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:BlockType',
		'height': 'pod:Height',
		'timestamp': 'pod:Timestamp',
		'difficulty': 'pod:Difficulty',
		'generationHashProof': 'struct:VrfProof',
		'previousBlockHash': 'pod:Hash256',
		'transactionsHash': 'pod:Hash256',
		'receiptsHash': 'pod:Hash256',
		'stateHash': 'pod:Hash256',
		'beneficiaryAddress': 'pod:Address',
		'feeMultiplier': 'pod:BlockFeeMultiplier'
	};

	Signature signature = Signature();
	PublicKey signerPublicKey = PublicKey();
	int version = 0;
	NetworkType network = NetworkType.MAINNET;
	BlockType type = BlockType.NEMESIS;
	Height height = Height();
	Timestamp timestamp = Timestamp();
	Difficulty difficulty = Difficulty();
	VrfProof generationHashProof = VrfProof();
	Hash256 previousBlockHash = Hash256();
	Hash256 transactionsHash = Hash256();
	Hash256 receiptsHash = Hash256();
	Hash256 stateHash = Hash256();
	Address beneficiaryAddress = Address();
	BlockFeeMultiplier feeMultiplier = BlockFeeMultiplier();
	final int verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field

	Block({ 
	Signature? signature,
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	BlockType? type,
	Height? height,
	Timestamp? timestamp,
	Difficulty? difficulty,
	VrfProof? generationHashProof,
	Hash256? previousBlockHash,
	Hash256? transactionsHash,
	Hash256? receiptsHash,
	Hash256? stateHash,
	Address? beneficiaryAddress,
	BlockFeeMultiplier? feeMultiplier
	}) {
		this.signature = signature ?? Signature();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? 0;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? BlockType.NEMESIS;
		this.height = height ?? Height();
		this.timestamp = timestamp ?? Timestamp();
		this.difficulty = difficulty ?? Difficulty();
		this.generationHashProof = generationHashProof ?? VrfProof();
		this.previousBlockHash = previousBlockHash ?? Hash256();
		this.transactionsHash = transactionsHash ?? Hash256();
		this.receiptsHash = receiptsHash ?? Hash256();
		this.stateHash = stateHash ?? Hash256();
		this.beneficiaryAddress = beneficiaryAddress ?? Address();
		this.feeMultiplier = feeMultiplier ?? BlockFeeMultiplier();
	}

	void sort() {
		generationHashProof.sort();
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signature.size;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += height.size;
		size += timestamp.size;
		size += difficulty.size;
		size += generationHashProof.size;
		size += previousBlockHash.size;
		size += transactionsHash.size;
		size += receiptsHash.size;
		size += stateHash.size;
		size += beneficiaryAddress.size;
		size += feeMultiplier.size;
		return size;
	}

	@override
	Block deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var verifiableEntityHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != verifiableEntityHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($verifiableEntityHeaderReserved_1)');
		}
		var signature = Signature().deserialize(buffer);
		buffer = buffer.sublist(signature.size);
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = BlockType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var height = Height().deserialize(buffer);
		buffer = buffer.sublist(height.size);
		var timestamp = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(timestamp.size);
		var difficulty = Difficulty().deserialize(buffer);
		buffer = buffer.sublist(difficulty.size);
		var generationHashProof = VrfProof().deserialize(buffer);
		buffer = buffer.sublist(generationHashProof.size);
		var previousBlockHash = Hash256().deserialize(buffer);
		buffer = buffer.sublist(previousBlockHash.size);
		var transactionsHash = Hash256().deserialize(buffer);
		buffer = buffer.sublist(transactionsHash.size);
		var receiptsHash = Hash256().deserialize(buffer);
		buffer = buffer.sublist(receiptsHash.size);
		var stateHash = Hash256().deserialize(buffer);
		buffer = buffer.sublist(stateHash.size);
		var beneficiaryAddress = Address().deserialize(buffer);
		buffer = buffer.sublist(beneficiaryAddress.size);
		var feeMultiplier = BlockFeeMultiplier().deserialize(buffer);
		buffer = buffer.sublist(feeMultiplier.size);

		var instance = Block(
			signature: signature,
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			height: height,
			timestamp: timestamp,
			difficulty: difficulty,
			generationHashProof: generationHashProof,
			previousBlockHash: previousBlockHash,
			transactionsHash: transactionsHash,
			receiptsHash: receiptsHash,
			stateHash: stateHash,
			beneficiaryAddress: beneficiaryAddress,
			feeMultiplier: feeMultiplier,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signature.size, signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + height.size, height.serialize());
		currentPos += height.size;
		buffer.setRange(currentPos, currentPos + timestamp.size, timestamp.serialize());
		currentPos += timestamp.size;
		buffer.setRange(currentPos, currentPos + difficulty.size, difficulty.serialize());
		currentPos += difficulty.size;
		buffer.setRange(currentPos, currentPos + generationHashProof.size, generationHashProof.serialize());
		currentPos += generationHashProof.size;
		buffer.setRange(currentPos, currentPos + previousBlockHash.size, previousBlockHash.serialize());
		currentPos += previousBlockHash.size;
		buffer.setRange(currentPos, currentPos + transactionsHash.size, transactionsHash.serialize());
		currentPos += transactionsHash.size;
		buffer.setRange(currentPos, currentPos + receiptsHash.size, receiptsHash.serialize());
		currentPos += receiptsHash.size;
		buffer.setRange(currentPos, currentPos + stateHash.size, stateHash.serialize());
		currentPos += stateHash.size;
		buffer.setRange(currentPos, currentPos + beneficiaryAddress.size, beneficiaryAddress.serialize());
		currentPos += beneficiaryAddress.size;
		buffer.setRange(currentPos, currentPos + feeMultiplier.size, feeMultiplier.serialize());
		currentPos += feeMultiplier.size;
		return buffer;
	}

	@override
	String toString() {
		var result = 'Block(';
		result += 'signature: "${signature.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'height: "${height.toString()}", ';
		result += 'timestamp: "${timestamp.toString()}", ';
		result += 'difficulty: "${difficulty.toString()}", ';
		result += 'generationHashProof: "${generationHashProof.toString()}", ';
		result += 'previousBlockHash: "${previousBlockHash.toString()}", ';
		result += 'transactionsHash: "${transactionsHash.toString()}", ';
		result += 'receiptsHash: "${receiptsHash.toString()}", ';
		result += 'stateHash: "${stateHash.toString()}", ';
		result += 'beneficiaryAddress: "${beneficiaryAddress.toString()}", ';
		result += 'feeMultiplier: "${feeMultiplier.toString()}", ';
		result += ')';
		return result;
	}
}


class NemesisBlockV1 implements ISerializable {
	static const int BLOCK_VERSION = 1;
	static final BlockType BLOCK_TYPE = BlockType(BlockType.NEMESIS.value);

	static const Map<String, String> TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:BlockType',
		'height': 'pod:Height',
		'timestamp': 'pod:Timestamp',
		'difficulty': 'pod:Difficulty',
		'generationHashProof': 'struct:VrfProof',
		'previousBlockHash': 'pod:Hash256',
		'transactionsHash': 'pod:Hash256',
		'receiptsHash': 'pod:Hash256',
		'stateHash': 'pod:Hash256',
		'beneficiaryAddress': 'pod:Address',
		'feeMultiplier': 'pod:BlockFeeMultiplier',
		'totalVotingBalance': 'pod:Amount',
		'previousImportanceBlockHash': 'pod:Hash256',
		'transactions': 'array[Transaction]'
	};

	Signature signature = Signature();
	PublicKey signerPublicKey = PublicKey();
	int version = NemesisBlockV1.BLOCK_VERSION;
	NetworkType network = NetworkType.MAINNET;
	BlockType type = NemesisBlockV1.BLOCK_TYPE;
	Height height = Height();
	Timestamp timestamp = Timestamp();
	Difficulty difficulty = Difficulty();
	VrfProof generationHashProof = VrfProof();
	Hash256 previousBlockHash = Hash256();
	Hash256 transactionsHash = Hash256();
	Hash256 receiptsHash = Hash256();
	Hash256 stateHash = Hash256();
	Address beneficiaryAddress = Address();
	BlockFeeMultiplier feeMultiplier = BlockFeeMultiplier();
	int votingEligibleAccountsCount = 0;
	BigInt harvestingEligibleAccountsCount = BigInt.from(0);
	Amount totalVotingBalance = Amount();
	Hash256 previousImportanceBlockHash = Hash256();
	List<ITransaction> transactions = [];
	final int verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field

	NemesisBlockV1({ 
	Signature? signature,
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	BlockType? type,
	Height? height,
	Timestamp? timestamp,
	Difficulty? difficulty,
	VrfProof? generationHashProof,
	Hash256? previousBlockHash,
	Hash256? transactionsHash,
	Hash256? receiptsHash,
	Hash256? stateHash,
	Address? beneficiaryAddress,
	BlockFeeMultiplier? feeMultiplier,
	int? votingEligibleAccountsCount,
	BigInt? harvestingEligibleAccountsCount,
	Amount? totalVotingBalance,
	Hash256? previousImportanceBlockHash,
	List<ITransaction>? transactions
	}) {
		this.signature = signature ?? Signature();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? NemesisBlockV1.BLOCK_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? NemesisBlockV1.BLOCK_TYPE;
		this.height = height ?? Height();
		this.timestamp = timestamp ?? Timestamp();
		this.difficulty = difficulty ?? Difficulty();
		this.generationHashProof = generationHashProof ?? VrfProof();
		this.previousBlockHash = previousBlockHash ?? Hash256();
		this.transactionsHash = transactionsHash ?? Hash256();
		this.receiptsHash = receiptsHash ?? Hash256();
		this.stateHash = stateHash ?? Hash256();
		this.beneficiaryAddress = beneficiaryAddress ?? Address();
		this.feeMultiplier = feeMultiplier ?? BlockFeeMultiplier();
		this.votingEligibleAccountsCount = votingEligibleAccountsCount ?? 0;
		this.harvestingEligibleAccountsCount = harvestingEligibleAccountsCount ?? BigInt.from(0);
		this.totalVotingBalance = totalVotingBalance ?? Amount();
		this.previousImportanceBlockHash = previousImportanceBlockHash ?? Hash256();
		this.transactions = transactions ?? [];
	}

	void sort() {
		generationHashProof.sort();
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signature.size;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += height.size;
		size += timestamp.size;
		size += difficulty.size;
		size += generationHashProof.size;
		size += previousBlockHash.size;
		size += transactionsHash.size;
		size += receiptsHash.size;
		size += stateHash.size;
		size += beneficiaryAddress.size;
		size += feeMultiplier.size;
		size += 4;
		size += 8;
		size += totalVotingBalance.size;
		size += previousImportanceBlockHash.size;
		size += ArrayHelpers.size(transactions, 8, true);
		return size;
	}

	@override
	NemesisBlockV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var verifiableEntityHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != verifiableEntityHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($verifiableEntityHeaderReserved_1)');
		}
		var signature = Signature().deserialize(buffer);
		buffer = buffer.sublist(signature.size);
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = BlockType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var height = Height().deserialize(buffer);
		buffer = buffer.sublist(height.size);
		var timestamp = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(timestamp.size);
		var difficulty = Difficulty().deserialize(buffer);
		buffer = buffer.sublist(difficulty.size);
		var generationHashProof = VrfProof().deserialize(buffer);
		buffer = buffer.sublist(generationHashProof.size);
		var previousBlockHash = Hash256().deserialize(buffer);
		buffer = buffer.sublist(previousBlockHash.size);
		var transactionsHash = Hash256().deserialize(buffer);
		buffer = buffer.sublist(transactionsHash.size);
		var receiptsHash = Hash256().deserialize(buffer);
		buffer = buffer.sublist(receiptsHash.size);
		var stateHash = Hash256().deserialize(buffer);
		buffer = buffer.sublist(stateHash.size);
		var beneficiaryAddress = Address().deserialize(buffer);
		buffer = buffer.sublist(beneficiaryAddress.size);
		var feeMultiplier = BlockFeeMultiplier().deserialize(buffer);
		buffer = buffer.sublist(feeMultiplier.size);
		var votingEligibleAccountsCount = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		var harvestingEligibleAccountsCount = bytesToInt(buffer.sublist(0, 8), 8);
		buffer = buffer.sublist(8);
		var totalVotingBalance = Amount().deserialize(buffer);
		buffer = buffer.sublist(totalVotingBalance.size);
		var previousImportanceBlockHash = Hash256().deserialize(buffer);
		buffer = buffer.sublist(previousImportanceBlockHash.size);
		var transactions = ArrayHelpers.readVariableSizeElements(buffer, TransactionFactory(), 8, true).map((item) => item as ITransaction).toList();
		buffer = buffer.sublist(ArrayHelpers.size(transactions, 8, true));

		var instance = NemesisBlockV1(
			signature: signature,
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			height: height,
			timestamp: timestamp,
			difficulty: difficulty,
			generationHashProof: generationHashProof,
			previousBlockHash: previousBlockHash,
			transactionsHash: transactionsHash,
			receiptsHash: receiptsHash,
			stateHash: stateHash,
			beneficiaryAddress: beneficiaryAddress,
			feeMultiplier: feeMultiplier,
			votingEligibleAccountsCount: votingEligibleAccountsCount,
			harvestingEligibleAccountsCount: harvestingEligibleAccountsCount,
			totalVotingBalance: totalVotingBalance,
			previousImportanceBlockHash: previousImportanceBlockHash,
			transactions: transactions,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signature.size, signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + height.size, height.serialize());
		currentPos += height.size;
		buffer.setRange(currentPos, currentPos + timestamp.size, timestamp.serialize());
		currentPos += timestamp.size;
		buffer.setRange(currentPos, currentPos + difficulty.size, difficulty.serialize());
		currentPos += difficulty.size;
		buffer.setRange(currentPos, currentPos + generationHashProof.size, generationHashProof.serialize());
		currentPos += generationHashProof.size;
		buffer.setRange(currentPos, currentPos + previousBlockHash.size, previousBlockHash.serialize());
		currentPos += previousBlockHash.size;
		buffer.setRange(currentPos, currentPos + transactionsHash.size, transactionsHash.serialize());
		currentPos += transactionsHash.size;
		buffer.setRange(currentPos, currentPos + receiptsHash.size, receiptsHash.serialize());
		currentPos += receiptsHash.size;
		buffer.setRange(currentPos, currentPos + stateHash.size, stateHash.serialize());
		currentPos += stateHash.size;
		buffer.setRange(currentPos, currentPos + beneficiaryAddress.size, beneficiaryAddress.serialize());
		currentPos += beneficiaryAddress.size;
		buffer.setRange(currentPos, currentPos + feeMultiplier.size, feeMultiplier.serialize());
		currentPos += feeMultiplier.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(votingEligibleAccountsCount, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 8, intToBytes(harvestingEligibleAccountsCount, 8));
		currentPos += 8;
		buffer.setRange(currentPos, currentPos + totalVotingBalance.size, totalVotingBalance.serialize());
		currentPos += totalVotingBalance.size;
		buffer.setRange(currentPos, currentPos + previousImportanceBlockHash.size, previousImportanceBlockHash.serialize());
		currentPos += previousImportanceBlockHash.size;
		sort();
		var res_transactions = ArrayHelpers.writeVariableSizeElements(buffer, transactions, 8, currentPos, true);
		currentPos = res_transactions.item2;
		buffer = res_transactions.item1;
		return buffer;
	}

	@override
	String toString() {
		var result = 'NemesisBlockV1(';
		result += 'signature: "${signature.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'height: "${height.toString()}", ';
		result += 'timestamp: "${timestamp.toString()}", ';
		result += 'difficulty: "${difficulty.toString()}", ';
		result += 'generationHashProof: "${generationHashProof.toString()}", ';
		result += 'previousBlockHash: "${previousBlockHash.toString()}", ';
		result += 'transactionsHash: "${transactionsHash.toString()}", ';
		result += 'receiptsHash: "${receiptsHash.toString()}", ';
		result += 'stateHash: "${stateHash.toString()}", ';
		result += 'beneficiaryAddress: "${beneficiaryAddress.toString()}", ';
		result += 'feeMultiplier: "${feeMultiplier.toString()}", ';
		result += 'votingEligibleAccountsCount: "0x${intToHex(votingEligibleAccountsCount)}", ';
		result += 'harvestingEligibleAccountsCount: "0x${intToHex(harvestingEligibleAccountsCount)}", ';
		result += 'totalVotingBalance: "${totalVotingBalance.toString()}", ';
		result += 'previousImportanceBlockHash: "${previousImportanceBlockHash.toString()}", ';
		result += 'transactions: "${transactions.map((e) => e.toString()).toList()}", ';
		result += ')';
		return result;
	}
}


class NormalBlockV1 implements ISerializable {
	static const int BLOCK_VERSION = 1;
	static final BlockType BLOCK_TYPE = BlockType(BlockType.NORMAL.value);

	static const Map<String, String> TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:BlockType',
		'height': 'pod:Height',
		'timestamp': 'pod:Timestamp',
		'difficulty': 'pod:Difficulty',
		'generationHashProof': 'struct:VrfProof',
		'previousBlockHash': 'pod:Hash256',
		'transactionsHash': 'pod:Hash256',
		'receiptsHash': 'pod:Hash256',
		'stateHash': 'pod:Hash256',
		'beneficiaryAddress': 'pod:Address',
		'feeMultiplier': 'pod:BlockFeeMultiplier',
		'transactions': 'array[Transaction]'
	};

	Signature signature = Signature();
	PublicKey signerPublicKey = PublicKey();
	int version = NormalBlockV1.BLOCK_VERSION;
	NetworkType network = NetworkType.MAINNET;
	BlockType type = NormalBlockV1.BLOCK_TYPE;
	Height height = Height();
	Timestamp timestamp = Timestamp();
	Difficulty difficulty = Difficulty();
	VrfProof generationHashProof = VrfProof();
	Hash256 previousBlockHash = Hash256();
	Hash256 transactionsHash = Hash256();
	Hash256 receiptsHash = Hash256();
	Hash256 stateHash = Hash256();
	Address beneficiaryAddress = Address();
	BlockFeeMultiplier feeMultiplier = BlockFeeMultiplier();
	List<ITransaction> transactions = [];
	final int verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field
	final int blockHeaderReserved_1 = 0; // reserved field

	NormalBlockV1({ 
	Signature? signature,
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	BlockType? type,
	Height? height,
	Timestamp? timestamp,
	Difficulty? difficulty,
	VrfProof? generationHashProof,
	Hash256? previousBlockHash,
	Hash256? transactionsHash,
	Hash256? receiptsHash,
	Hash256? stateHash,
	Address? beneficiaryAddress,
	BlockFeeMultiplier? feeMultiplier,
	List<ITransaction>? transactions
	}) {
		this.signature = signature ?? Signature();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? NormalBlockV1.BLOCK_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? NormalBlockV1.BLOCK_TYPE;
		this.height = height ?? Height();
		this.timestamp = timestamp ?? Timestamp();
		this.difficulty = difficulty ?? Difficulty();
		this.generationHashProof = generationHashProof ?? VrfProof();
		this.previousBlockHash = previousBlockHash ?? Hash256();
		this.transactionsHash = transactionsHash ?? Hash256();
		this.receiptsHash = receiptsHash ?? Hash256();
		this.stateHash = stateHash ?? Hash256();
		this.beneficiaryAddress = beneficiaryAddress ?? Address();
		this.feeMultiplier = feeMultiplier ?? BlockFeeMultiplier();
		this.transactions = transactions ?? [];
	}

	void sort() {
		generationHashProof.sort();
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signature.size;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += height.size;
		size += timestamp.size;
		size += difficulty.size;
		size += generationHashProof.size;
		size += previousBlockHash.size;
		size += transactionsHash.size;
		size += receiptsHash.size;
		size += stateHash.size;
		size += beneficiaryAddress.size;
		size += feeMultiplier.size;
		size += 4;
		size += ArrayHelpers.size(transactions, 8, true);
		return size;
	}

	@override
	NormalBlockV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var verifiableEntityHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != verifiableEntityHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($verifiableEntityHeaderReserved_1)');
		}
		var signature = Signature().deserialize(buffer);
		buffer = buffer.sublist(signature.size);
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = BlockType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var height = Height().deserialize(buffer);
		buffer = buffer.sublist(height.size);
		var timestamp = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(timestamp.size);
		var difficulty = Difficulty().deserialize(buffer);
		buffer = buffer.sublist(difficulty.size);
		var generationHashProof = VrfProof().deserialize(buffer);
		buffer = buffer.sublist(generationHashProof.size);
		var previousBlockHash = Hash256().deserialize(buffer);
		buffer = buffer.sublist(previousBlockHash.size);
		var transactionsHash = Hash256().deserialize(buffer);
		buffer = buffer.sublist(transactionsHash.size);
		var receiptsHash = Hash256().deserialize(buffer);
		buffer = buffer.sublist(receiptsHash.size);
		var stateHash = Hash256().deserialize(buffer);
		buffer = buffer.sublist(stateHash.size);
		var beneficiaryAddress = Address().deserialize(buffer);
		buffer = buffer.sublist(beneficiaryAddress.size);
		var feeMultiplier = BlockFeeMultiplier().deserialize(buffer);
		buffer = buffer.sublist(feeMultiplier.size);
		var blockHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != blockHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($blockHeaderReserved_1)');
		}
		var transactions = ArrayHelpers.readVariableSizeElements(buffer, TransactionFactory(), 8, true).map((item) => item as ITransaction).toList();
		buffer = buffer.sublist(ArrayHelpers.size(transactions, 8, true));

		var instance = NormalBlockV1(
			signature: signature,
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			height: height,
			timestamp: timestamp,
			difficulty: difficulty,
			generationHashProof: generationHashProof,
			previousBlockHash: previousBlockHash,
			transactionsHash: transactionsHash,
			receiptsHash: receiptsHash,
			stateHash: stateHash,
			beneficiaryAddress: beneficiaryAddress,
			feeMultiplier: feeMultiplier,
			transactions: transactions,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signature.size, signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + height.size, height.serialize());
		currentPos += height.size;
		buffer.setRange(currentPos, currentPos + timestamp.size, timestamp.serialize());
		currentPos += timestamp.size;
		buffer.setRange(currentPos, currentPos + difficulty.size, difficulty.serialize());
		currentPos += difficulty.size;
		buffer.setRange(currentPos, currentPos + generationHashProof.size, generationHashProof.serialize());
		currentPos += generationHashProof.size;
		buffer.setRange(currentPos, currentPos + previousBlockHash.size, previousBlockHash.serialize());
		currentPos += previousBlockHash.size;
		buffer.setRange(currentPos, currentPos + transactionsHash.size, transactionsHash.serialize());
		currentPos += transactionsHash.size;
		buffer.setRange(currentPos, currentPos + receiptsHash.size, receiptsHash.serialize());
		currentPos += receiptsHash.size;
		buffer.setRange(currentPos, currentPos + stateHash.size, stateHash.serialize());
		currentPos += stateHash.size;
		buffer.setRange(currentPos, currentPos + beneficiaryAddress.size, beneficiaryAddress.serialize());
		currentPos += beneficiaryAddress.size;
		buffer.setRange(currentPos, currentPos + feeMultiplier.size, feeMultiplier.serialize());
		currentPos += feeMultiplier.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(blockHeaderReserved_1, 4));
		currentPos += 4;
		sort();
		var res_transactions = ArrayHelpers.writeVariableSizeElements(buffer, transactions, 8, currentPos, true);
		currentPos = res_transactions.item2;
		buffer = res_transactions.item1;
		return buffer;
	}

	@override
	String toString() {
		var result = 'NormalBlockV1(';
		result += 'signature: "${signature.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'height: "${height.toString()}", ';
		result += 'timestamp: "${timestamp.toString()}", ';
		result += 'difficulty: "${difficulty.toString()}", ';
		result += 'generationHashProof: "${generationHashProof.toString()}", ';
		result += 'previousBlockHash: "${previousBlockHash.toString()}", ';
		result += 'transactionsHash: "${transactionsHash.toString()}", ';
		result += 'receiptsHash: "${receiptsHash.toString()}", ';
		result += 'stateHash: "${stateHash.toString()}", ';
		result += 'beneficiaryAddress: "${beneficiaryAddress.toString()}", ';
		result += 'feeMultiplier: "${feeMultiplier.toString()}", ';
		result += 'transactions: "${transactions.map((e) => e.toString()).toList()}", ';
		result += ')';
		return result;
	}
}


class ImportanceBlockV1 implements ISerializable {
	static const int BLOCK_VERSION = 1;
	static final BlockType BLOCK_TYPE = BlockType(BlockType.IMPORTANCE.value);

	static const Map<String, String> TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:BlockType',
		'height': 'pod:Height',
		'timestamp': 'pod:Timestamp',
		'difficulty': 'pod:Difficulty',
		'generationHashProof': 'struct:VrfProof',
		'previousBlockHash': 'pod:Hash256',
		'transactionsHash': 'pod:Hash256',
		'receiptsHash': 'pod:Hash256',
		'stateHash': 'pod:Hash256',
		'beneficiaryAddress': 'pod:Address',
		'feeMultiplier': 'pod:BlockFeeMultiplier',
		'totalVotingBalance': 'pod:Amount',
		'previousImportanceBlockHash': 'pod:Hash256',
		'transactions': 'array[Transaction]'
	};

	Signature signature = Signature();
	PublicKey signerPublicKey = PublicKey();
	int version = ImportanceBlockV1.BLOCK_VERSION;
	NetworkType network = NetworkType.MAINNET;
	BlockType type = ImportanceBlockV1.BLOCK_TYPE;
	Height height = Height();
	Timestamp timestamp = Timestamp();
	Difficulty difficulty = Difficulty();
	VrfProof generationHashProof = VrfProof();
	Hash256 previousBlockHash = Hash256();
	Hash256 transactionsHash = Hash256();
	Hash256 receiptsHash = Hash256();
	Hash256 stateHash = Hash256();
	Address beneficiaryAddress = Address();
	BlockFeeMultiplier feeMultiplier = BlockFeeMultiplier();
	int votingEligibleAccountsCount = 0;
	BigInt harvestingEligibleAccountsCount = BigInt.from(0);
	Amount totalVotingBalance = Amount();
	Hash256 previousImportanceBlockHash = Hash256();
	List<ITransaction> transactions = [];
	final int verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field

	ImportanceBlockV1({ 
	Signature? signature,
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	BlockType? type,
	Height? height,
	Timestamp? timestamp,
	Difficulty? difficulty,
	VrfProof? generationHashProof,
	Hash256? previousBlockHash,
	Hash256? transactionsHash,
	Hash256? receiptsHash,
	Hash256? stateHash,
	Address? beneficiaryAddress,
	BlockFeeMultiplier? feeMultiplier,
	int? votingEligibleAccountsCount,
	BigInt? harvestingEligibleAccountsCount,
	Amount? totalVotingBalance,
	Hash256? previousImportanceBlockHash,
	List<ITransaction>? transactions
	}) {
		this.signature = signature ?? Signature();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? ImportanceBlockV1.BLOCK_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? ImportanceBlockV1.BLOCK_TYPE;
		this.height = height ?? Height();
		this.timestamp = timestamp ?? Timestamp();
		this.difficulty = difficulty ?? Difficulty();
		this.generationHashProof = generationHashProof ?? VrfProof();
		this.previousBlockHash = previousBlockHash ?? Hash256();
		this.transactionsHash = transactionsHash ?? Hash256();
		this.receiptsHash = receiptsHash ?? Hash256();
		this.stateHash = stateHash ?? Hash256();
		this.beneficiaryAddress = beneficiaryAddress ?? Address();
		this.feeMultiplier = feeMultiplier ?? BlockFeeMultiplier();
		this.votingEligibleAccountsCount = votingEligibleAccountsCount ?? 0;
		this.harvestingEligibleAccountsCount = harvestingEligibleAccountsCount ?? BigInt.from(0);
		this.totalVotingBalance = totalVotingBalance ?? Amount();
		this.previousImportanceBlockHash = previousImportanceBlockHash ?? Hash256();
		this.transactions = transactions ?? [];
	}

	void sort() {
		generationHashProof.sort();
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signature.size;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += height.size;
		size += timestamp.size;
		size += difficulty.size;
		size += generationHashProof.size;
		size += previousBlockHash.size;
		size += transactionsHash.size;
		size += receiptsHash.size;
		size += stateHash.size;
		size += beneficiaryAddress.size;
		size += feeMultiplier.size;
		size += 4;
		size += 8;
		size += totalVotingBalance.size;
		size += previousImportanceBlockHash.size;
		size += ArrayHelpers.size(transactions, 8, true);
		return size;
	}

	@override
	ImportanceBlockV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var verifiableEntityHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != verifiableEntityHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($verifiableEntityHeaderReserved_1)');
		}
		var signature = Signature().deserialize(buffer);
		buffer = buffer.sublist(signature.size);
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = BlockType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var height = Height().deserialize(buffer);
		buffer = buffer.sublist(height.size);
		var timestamp = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(timestamp.size);
		var difficulty = Difficulty().deserialize(buffer);
		buffer = buffer.sublist(difficulty.size);
		var generationHashProof = VrfProof().deserialize(buffer);
		buffer = buffer.sublist(generationHashProof.size);
		var previousBlockHash = Hash256().deserialize(buffer);
		buffer = buffer.sublist(previousBlockHash.size);
		var transactionsHash = Hash256().deserialize(buffer);
		buffer = buffer.sublist(transactionsHash.size);
		var receiptsHash = Hash256().deserialize(buffer);
		buffer = buffer.sublist(receiptsHash.size);
		var stateHash = Hash256().deserialize(buffer);
		buffer = buffer.sublist(stateHash.size);
		var beneficiaryAddress = Address().deserialize(buffer);
		buffer = buffer.sublist(beneficiaryAddress.size);
		var feeMultiplier = BlockFeeMultiplier().deserialize(buffer);
		buffer = buffer.sublist(feeMultiplier.size);
		var votingEligibleAccountsCount = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		var harvestingEligibleAccountsCount = bytesToInt(buffer.sublist(0, 8), 8);
		buffer = buffer.sublist(8);
		var totalVotingBalance = Amount().deserialize(buffer);
		buffer = buffer.sublist(totalVotingBalance.size);
		var previousImportanceBlockHash = Hash256().deserialize(buffer);
		buffer = buffer.sublist(previousImportanceBlockHash.size);
		var transactions = ArrayHelpers.readVariableSizeElements(buffer, TransactionFactory(), 8, true).map((item) => item as ITransaction).toList();
		buffer = buffer.sublist(ArrayHelpers.size(transactions, 8, true));

		var instance = ImportanceBlockV1(
			signature: signature,
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			height: height,
			timestamp: timestamp,
			difficulty: difficulty,
			generationHashProof: generationHashProof,
			previousBlockHash: previousBlockHash,
			transactionsHash: transactionsHash,
			receiptsHash: receiptsHash,
			stateHash: stateHash,
			beneficiaryAddress: beneficiaryAddress,
			feeMultiplier: feeMultiplier,
			votingEligibleAccountsCount: votingEligibleAccountsCount,
			harvestingEligibleAccountsCount: harvestingEligibleAccountsCount,
			totalVotingBalance: totalVotingBalance,
			previousImportanceBlockHash: previousImportanceBlockHash,
			transactions: transactions,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signature.size, signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + height.size, height.serialize());
		currentPos += height.size;
		buffer.setRange(currentPos, currentPos + timestamp.size, timestamp.serialize());
		currentPos += timestamp.size;
		buffer.setRange(currentPos, currentPos + difficulty.size, difficulty.serialize());
		currentPos += difficulty.size;
		buffer.setRange(currentPos, currentPos + generationHashProof.size, generationHashProof.serialize());
		currentPos += generationHashProof.size;
		buffer.setRange(currentPos, currentPos + previousBlockHash.size, previousBlockHash.serialize());
		currentPos += previousBlockHash.size;
		buffer.setRange(currentPos, currentPos + transactionsHash.size, transactionsHash.serialize());
		currentPos += transactionsHash.size;
		buffer.setRange(currentPos, currentPos + receiptsHash.size, receiptsHash.serialize());
		currentPos += receiptsHash.size;
		buffer.setRange(currentPos, currentPos + stateHash.size, stateHash.serialize());
		currentPos += stateHash.size;
		buffer.setRange(currentPos, currentPos + beneficiaryAddress.size, beneficiaryAddress.serialize());
		currentPos += beneficiaryAddress.size;
		buffer.setRange(currentPos, currentPos + feeMultiplier.size, feeMultiplier.serialize());
		currentPos += feeMultiplier.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(votingEligibleAccountsCount, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 8, intToBytes(harvestingEligibleAccountsCount, 8));
		currentPos += 8;
		buffer.setRange(currentPos, currentPos + totalVotingBalance.size, totalVotingBalance.serialize());
		currentPos += totalVotingBalance.size;
		buffer.setRange(currentPos, currentPos + previousImportanceBlockHash.size, previousImportanceBlockHash.serialize());
		currentPos += previousImportanceBlockHash.size;
		sort();
		var res_transactions = ArrayHelpers.writeVariableSizeElements(buffer, transactions, 8, currentPos, true);
		currentPos = res_transactions.item2;
		buffer = res_transactions.item1;
		return buffer;
	}

	@override
	String toString() {
		var result = 'ImportanceBlockV1(';
		result += 'signature: "${signature.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'height: "${height.toString()}", ';
		result += 'timestamp: "${timestamp.toString()}", ';
		result += 'difficulty: "${difficulty.toString()}", ';
		result += 'generationHashProof: "${generationHashProof.toString()}", ';
		result += 'previousBlockHash: "${previousBlockHash.toString()}", ';
		result += 'transactionsHash: "${transactionsHash.toString()}", ';
		result += 'receiptsHash: "${receiptsHash.toString()}", ';
		result += 'stateHash: "${stateHash.toString()}", ';
		result += 'beneficiaryAddress: "${beneficiaryAddress.toString()}", ';
		result += 'feeMultiplier: "${feeMultiplier.toString()}", ';
		result += 'votingEligibleAccountsCount: "0x${intToHex(votingEligibleAccountsCount)}", ';
		result += 'harvestingEligibleAccountsCount: "0x${intToHex(harvestingEligibleAccountsCount)}", ';
		result += 'totalVotingBalance: "${totalVotingBalance.toString()}", ';
		result += 'previousImportanceBlockHash: "${previousImportanceBlockHash.toString()}", ';
		result += 'transactions: "${transactions.map((e) => e.toString()).toList()}", ';
		result += ')';
		return result;
	}
}


class FinalizationRound implements ISerializable {

	static const Map<String, String> TYPE_HINTS = {
		'epoch': 'pod:FinalizationEpoch',
		'point': 'pod:FinalizationPoint'
	};

	FinalizationEpoch epoch = FinalizationEpoch();
	FinalizationPoint point = FinalizationPoint();

	FinalizationRound({ FinalizationEpoch? epoch, FinalizationPoint? point}) {
		this.epoch = epoch ?? FinalizationEpoch();
		this.point = point ?? FinalizationPoint();
	}

	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += epoch.size;
		size += point.size;
		return size;
	}

	@override
	FinalizationRound deserialize(Uint8List payload) {
		var buffer = payload;
		var epoch = FinalizationEpoch().deserialize(buffer);
		buffer = buffer.sublist(epoch.size);
		var point = FinalizationPoint().deserialize(buffer);
		buffer = buffer.sublist(point.size);

		var instance = FinalizationRound(
			epoch: epoch,
			point: point,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + epoch.size, epoch.serialize());
		currentPos += epoch.size;
		buffer.setRange(currentPos, currentPos + point.size, point.serialize());
		currentPos += point.size;
		return buffer;
	}

	@override
	String toString() {
		var result = 'FinalizationRound(';
		result += 'epoch: "${epoch.toString()}", ';
		result += 'point: "${point.toString()}", ';
		result += ')';
		return result;
	}
}


class FinalizedBlockHeader implements ISerializable {

	static const Map<String, String> TYPE_HINTS = {
		'round': 'struct:FinalizationRound',
		'height': 'pod:Height',
		'hash': 'pod:Hash256'
	};

	FinalizationRound round = FinalizationRound();
	Height height = Height();
	Hash256 hash = Hash256();

	FinalizedBlockHeader({ FinalizationRound? round, Height? height, Hash256? hash}) {
		this.round = round ?? FinalizationRound();
		this.height = height ?? Height();
		this.hash = hash ?? Hash256();
	}

	void sort() {
		round.sort();
	}

	@override
	int get size {
		var size = 0;
		size += round.size;
		size += height.size;
		size += hash.size;
		return size;
	}

	@override
	FinalizedBlockHeader deserialize(Uint8List payload) {
		var buffer = payload;
		var round = FinalizationRound().deserialize(buffer);
		buffer = buffer.sublist(round.size);
		var height = Height().deserialize(buffer);
		buffer = buffer.sublist(height.size);
		var hash = Hash256().deserialize(buffer);
		buffer = buffer.sublist(hash.size);

		var instance = FinalizedBlockHeader(
			round: round,
			height: height,
			hash: hash,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + round.size, round.serialize());
		currentPos += round.size;
		buffer.setRange(currentPos, currentPos + height.size, height.serialize());
		currentPos += height.size;
		buffer.setRange(currentPos, currentPos + hash.size, hash.serialize());
		currentPos += hash.size;
		return buffer;
	}

	@override
	String toString() {
		var result = 'FinalizedBlockHeader(';
		result += 'round: "${round.toString()}", ';
		result += 'height: "${height.toString()}", ';
		result += 'hash: "${hash.toString()}", ';
		result += ')';
		return result;
	}
}


class ReceiptType implements ISerializable {
	static final MOSAIC_RENTAL_FEE = ReceiptType(4685);
	static final NAMESPACE_RENTAL_FEE = ReceiptType(4942);
	static final HARVEST_FEE = ReceiptType(8515);
	static final LOCK_HASH_COMPLETED = ReceiptType(8776);
	static final LOCK_HASH_EXPIRED = ReceiptType(9032);
	static final LOCK_SECRET_COMPLETED = ReceiptType(8786);
	static final LOCK_SECRET_EXPIRED = ReceiptType(9042);
	static final LOCK_HASH_CREATED = ReceiptType(12616);
	static final LOCK_SECRET_CREATED = ReceiptType(12626);
	static final MOSAIC_EXPIRED = ReceiptType(16717);
	static final NAMESPACE_EXPIRED = ReceiptType(16718);
	static final NAMESPACE_DELETED = ReceiptType(16974);
	static final INFLATION = ReceiptType(20803);
	static final TRANSACTION_GROUP = ReceiptType(57667);
	static final ADDRESS_ALIAS_RESOLUTION = ReceiptType(61763);
	static final MOSAIC_ALIAS_RESOLUTION = ReceiptType(62019);

	int value = 0;

	static final _flags = {
		4685: 'MOSAIC_RENTAL_FEE',
		4942: 'NAMESPACE_RENTAL_FEE',
		8515: 'HARVEST_FEE',
		8776: 'LOCK_HASH_COMPLETED',
		9032: 'LOCK_HASH_EXPIRED',
		8786: 'LOCK_SECRET_COMPLETED',
		9042: 'LOCK_SECRET_EXPIRED',
		12616: 'LOCK_HASH_CREATED',
		12626: 'LOCK_SECRET_CREATED',
		16717: 'MOSAIC_EXPIRED',
		16718: 'NAMESPACE_EXPIRED',
		16974: 'NAMESPACE_DELETED',
		20803: 'INFLATION',
		57667: 'TRANSACTION_GROUP',
		61763: 'ADDRESS_ALIAS_RESOLUTION',
		62019: 'MOSAIC_ALIAS_RESOLUTION',
	};

	ReceiptType([int? _value]) {
		value = _value ?? 4685;
	}

	@override
	int get size {
		return 2;
	}

	@override
	ReceiptType deserialize(Uint8List payload) {
		var byteData = ByteData.sublistView(payload);
		return ReceiptType(byteData.getUint16(0, Endian.little));
	}

	@override
	Uint8List serialize() {
		var byteData = ByteData(2)..setUint16(0, value, Endian.little);
		return byteData.buffer.asUint8List();
	}

	@override
	String toString() {
		return 'ReceiptType.${_flags[value]}';
	}
}


class Receipt implements ISerializable {

	static const Map<String, String> TYPE_HINTS = {
		'type': 'enum:ReceiptType'
	};

	int version = 0;
	ReceiptType type = ReceiptType.MOSAIC_RENTAL_FEE;

	Receipt({ int? version, ReceiptType? type}) {
		this.version = version ?? 0;
		this.type = type ?? ReceiptType.MOSAIC_RENTAL_FEE;
	}

	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 2;
		size += type.size;
		return size;
	}

	@override
	Receipt deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var version = bytesToInt(buffer.sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		var type = ReceiptType().deserialize(buffer);
		buffer = buffer.sublist(type.size);

		var instance = Receipt(
			version: version,
			type: type,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(version, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		return buffer;
	}

	@override
	String toString() {
		var result = 'Receipt(';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'type: "${type.toString()}", ';
		result += ')';
		return result;
	}
}


class HarvestFeeReceipt implements ISerializable {
	static final ReceiptType RECEIPT_TYPE = ReceiptType(ReceiptType.HARVEST_FEE.value);

	static const Map<String, String> TYPE_HINTS = {
		'type': 'enum:ReceiptType',
		'mosaic': 'struct:Mosaic',
		'targetAddress': 'pod:Address'
	};

	int version = 0;
	ReceiptType type = HarvestFeeReceipt.RECEIPT_TYPE;
	Mosaic mosaic = Mosaic();
	Address targetAddress = Address();

	HarvestFeeReceipt({ int? version, ReceiptType? type, Mosaic? mosaic, Address? targetAddress}) {
		this.version = version ?? 0;
		this.type = type ?? HarvestFeeReceipt.RECEIPT_TYPE;
		this.mosaic = mosaic ?? Mosaic();
		this.targetAddress = targetAddress ?? Address();
	}

	void sort() {
		mosaic.sort();
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 2;
		size += type.size;
		size += mosaic.size;
		size += targetAddress.size;
		return size;
	}

	@override
	HarvestFeeReceipt deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var version = bytesToInt(buffer.sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		var type = ReceiptType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var mosaic = Mosaic().deserialize(buffer);
		buffer = buffer.sublist(mosaic.size);
		var targetAddress = Address().deserialize(buffer);
		buffer = buffer.sublist(targetAddress.size);

		var instance = HarvestFeeReceipt(
			version: version,
			type: type,
			mosaic: mosaic,
			targetAddress: targetAddress,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(version, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + mosaic.size, mosaic.serialize());
		currentPos += mosaic.size;
		buffer.setRange(currentPos, currentPos + targetAddress.size, targetAddress.serialize());
		currentPos += targetAddress.size;
		return buffer;
	}

	@override
	String toString() {
		var result = 'HarvestFeeReceipt(';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'type: "${type.toString()}", ';
		result += 'mosaic: "${mosaic.toString()}", ';
		result += 'targetAddress: "${targetAddress.toString()}", ';
		result += ')';
		return result;
	}
}


class InflationReceipt implements ISerializable {
	static final ReceiptType RECEIPT_TYPE = ReceiptType(ReceiptType.INFLATION.value);

	static const Map<String, String> TYPE_HINTS = {
		'type': 'enum:ReceiptType',
		'mosaic': 'struct:Mosaic'
	};

	int version = 0;
	ReceiptType type = InflationReceipt.RECEIPT_TYPE;
	Mosaic mosaic = Mosaic();

	InflationReceipt({ int? version, ReceiptType? type, Mosaic? mosaic}) {
		this.version = version ?? 0;
		this.type = type ?? InflationReceipt.RECEIPT_TYPE;
		this.mosaic = mosaic ?? Mosaic();
	}

	void sort() {
		mosaic.sort();
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 2;
		size += type.size;
		size += mosaic.size;
		return size;
	}

	@override
	InflationReceipt deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var version = bytesToInt(buffer.sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		var type = ReceiptType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var mosaic = Mosaic().deserialize(buffer);
		buffer = buffer.sublist(mosaic.size);

		var instance = InflationReceipt(
			version: version,
			type: type,
			mosaic: mosaic,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(version, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + mosaic.size, mosaic.serialize());
		currentPos += mosaic.size;
		return buffer;
	}

	@override
	String toString() {
		var result = 'InflationReceipt(';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'type: "${type.toString()}", ';
		result += 'mosaic: "${mosaic.toString()}", ';
		result += ')';
		return result;
	}
}


class LockHashCreatedFeeReceipt implements ISerializable {
	static final ReceiptType RECEIPT_TYPE = ReceiptType(ReceiptType.LOCK_HASH_CREATED.value);

	static const Map<String, String> TYPE_HINTS = {
		'type': 'enum:ReceiptType',
		'mosaic': 'struct:Mosaic',
		'targetAddress': 'pod:Address'
	};

	int version = 0;
	ReceiptType type = LockHashCreatedFeeReceipt.RECEIPT_TYPE;
	Mosaic mosaic = Mosaic();
	Address targetAddress = Address();

	LockHashCreatedFeeReceipt({ int? version, ReceiptType? type, Mosaic? mosaic, Address? targetAddress}) {
		this.version = version ?? 0;
		this.type = type ?? LockHashCreatedFeeReceipt.RECEIPT_TYPE;
		this.mosaic = mosaic ?? Mosaic();
		this.targetAddress = targetAddress ?? Address();
	}

	void sort() {
		mosaic.sort();
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 2;
		size += type.size;
		size += mosaic.size;
		size += targetAddress.size;
		return size;
	}

	@override
	LockHashCreatedFeeReceipt deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var version = bytesToInt(buffer.sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		var type = ReceiptType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var mosaic = Mosaic().deserialize(buffer);
		buffer = buffer.sublist(mosaic.size);
		var targetAddress = Address().deserialize(buffer);
		buffer = buffer.sublist(targetAddress.size);

		var instance = LockHashCreatedFeeReceipt(
			version: version,
			type: type,
			mosaic: mosaic,
			targetAddress: targetAddress,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(version, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + mosaic.size, mosaic.serialize());
		currentPos += mosaic.size;
		buffer.setRange(currentPos, currentPos + targetAddress.size, targetAddress.serialize());
		currentPos += targetAddress.size;
		return buffer;
	}

	@override
	String toString() {
		var result = 'LockHashCreatedFeeReceipt(';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'type: "${type.toString()}", ';
		result += 'mosaic: "${mosaic.toString()}", ';
		result += 'targetAddress: "${targetAddress.toString()}", ';
		result += ')';
		return result;
	}
}


class LockHashCompletedFeeReceipt implements ISerializable {
	static final ReceiptType RECEIPT_TYPE = ReceiptType(ReceiptType.LOCK_HASH_COMPLETED.value);

	static const Map<String, String> TYPE_HINTS = {
		'type': 'enum:ReceiptType',
		'mosaic': 'struct:Mosaic',
		'targetAddress': 'pod:Address'
	};

	int version = 0;
	ReceiptType type = LockHashCompletedFeeReceipt.RECEIPT_TYPE;
	Mosaic mosaic = Mosaic();
	Address targetAddress = Address();

	LockHashCompletedFeeReceipt({ int? version, ReceiptType? type, Mosaic? mosaic, Address? targetAddress}) {
		this.version = version ?? 0;
		this.type = type ?? LockHashCompletedFeeReceipt.RECEIPT_TYPE;
		this.mosaic = mosaic ?? Mosaic();
		this.targetAddress = targetAddress ?? Address();
	}

	void sort() {
		mosaic.sort();
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 2;
		size += type.size;
		size += mosaic.size;
		size += targetAddress.size;
		return size;
	}

	@override
	LockHashCompletedFeeReceipt deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var version = bytesToInt(buffer.sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		var type = ReceiptType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var mosaic = Mosaic().deserialize(buffer);
		buffer = buffer.sublist(mosaic.size);
		var targetAddress = Address().deserialize(buffer);
		buffer = buffer.sublist(targetAddress.size);

		var instance = LockHashCompletedFeeReceipt(
			version: version,
			type: type,
			mosaic: mosaic,
			targetAddress: targetAddress,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(version, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + mosaic.size, mosaic.serialize());
		currentPos += mosaic.size;
		buffer.setRange(currentPos, currentPos + targetAddress.size, targetAddress.serialize());
		currentPos += targetAddress.size;
		return buffer;
	}

	@override
	String toString() {
		var result = 'LockHashCompletedFeeReceipt(';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'type: "${type.toString()}", ';
		result += 'mosaic: "${mosaic.toString()}", ';
		result += 'targetAddress: "${targetAddress.toString()}", ';
		result += ')';
		return result;
	}
}


class LockHashExpiredFeeReceipt implements ISerializable {
	static final ReceiptType RECEIPT_TYPE = ReceiptType(ReceiptType.LOCK_HASH_EXPIRED.value);

	static const Map<String, String> TYPE_HINTS = {
		'type': 'enum:ReceiptType',
		'mosaic': 'struct:Mosaic',
		'targetAddress': 'pod:Address'
	};

	int version = 0;
	ReceiptType type = LockHashExpiredFeeReceipt.RECEIPT_TYPE;
	Mosaic mosaic = Mosaic();
	Address targetAddress = Address();

	LockHashExpiredFeeReceipt({ int? version, ReceiptType? type, Mosaic? mosaic, Address? targetAddress}) {
		this.version = version ?? 0;
		this.type = type ?? LockHashExpiredFeeReceipt.RECEIPT_TYPE;
		this.mosaic = mosaic ?? Mosaic();
		this.targetAddress = targetAddress ?? Address();
	}

	void sort() {
		mosaic.sort();
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 2;
		size += type.size;
		size += mosaic.size;
		size += targetAddress.size;
		return size;
	}

	@override
	LockHashExpiredFeeReceipt deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var version = bytesToInt(buffer.sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		var type = ReceiptType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var mosaic = Mosaic().deserialize(buffer);
		buffer = buffer.sublist(mosaic.size);
		var targetAddress = Address().deserialize(buffer);
		buffer = buffer.sublist(targetAddress.size);

		var instance = LockHashExpiredFeeReceipt(
			version: version,
			type: type,
			mosaic: mosaic,
			targetAddress: targetAddress,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(version, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + mosaic.size, mosaic.serialize());
		currentPos += mosaic.size;
		buffer.setRange(currentPos, currentPos + targetAddress.size, targetAddress.serialize());
		currentPos += targetAddress.size;
		return buffer;
	}

	@override
	String toString() {
		var result = 'LockHashExpiredFeeReceipt(';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'type: "${type.toString()}", ';
		result += 'mosaic: "${mosaic.toString()}", ';
		result += 'targetAddress: "${targetAddress.toString()}", ';
		result += ')';
		return result;
	}
}


class LockSecretCreatedFeeReceipt implements ISerializable {
	static final ReceiptType RECEIPT_TYPE = ReceiptType(ReceiptType.LOCK_SECRET_CREATED.value);

	static const Map<String, String> TYPE_HINTS = {
		'type': 'enum:ReceiptType',
		'mosaic': 'struct:Mosaic',
		'targetAddress': 'pod:Address'
	};

	int version = 0;
	ReceiptType type = LockSecretCreatedFeeReceipt.RECEIPT_TYPE;
	Mosaic mosaic = Mosaic();
	Address targetAddress = Address();

	LockSecretCreatedFeeReceipt({ int? version, ReceiptType? type, Mosaic? mosaic, Address? targetAddress}) {
		this.version = version ?? 0;
		this.type = type ?? LockSecretCreatedFeeReceipt.RECEIPT_TYPE;
		this.mosaic = mosaic ?? Mosaic();
		this.targetAddress = targetAddress ?? Address();
	}

	void sort() {
		mosaic.sort();
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 2;
		size += type.size;
		size += mosaic.size;
		size += targetAddress.size;
		return size;
	}

	@override
	LockSecretCreatedFeeReceipt deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var version = bytesToInt(buffer.sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		var type = ReceiptType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var mosaic = Mosaic().deserialize(buffer);
		buffer = buffer.sublist(mosaic.size);
		var targetAddress = Address().deserialize(buffer);
		buffer = buffer.sublist(targetAddress.size);

		var instance = LockSecretCreatedFeeReceipt(
			version: version,
			type: type,
			mosaic: mosaic,
			targetAddress: targetAddress,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(version, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + mosaic.size, mosaic.serialize());
		currentPos += mosaic.size;
		buffer.setRange(currentPos, currentPos + targetAddress.size, targetAddress.serialize());
		currentPos += targetAddress.size;
		return buffer;
	}

	@override
	String toString() {
		var result = 'LockSecretCreatedFeeReceipt(';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'type: "${type.toString()}", ';
		result += 'mosaic: "${mosaic.toString()}", ';
		result += 'targetAddress: "${targetAddress.toString()}", ';
		result += ')';
		return result;
	}
}


class LockSecretCompletedFeeReceipt implements ISerializable {
	static final ReceiptType RECEIPT_TYPE = ReceiptType(ReceiptType.LOCK_SECRET_COMPLETED.value);

	static const Map<String, String> TYPE_HINTS = {
		'type': 'enum:ReceiptType',
		'mosaic': 'struct:Mosaic',
		'targetAddress': 'pod:Address'
	};

	int version = 0;
	ReceiptType type = LockSecretCompletedFeeReceipt.RECEIPT_TYPE;
	Mosaic mosaic = Mosaic();
	Address targetAddress = Address();

	LockSecretCompletedFeeReceipt({ int? version, ReceiptType? type, Mosaic? mosaic, Address? targetAddress}) {
		this.version = version ?? 0;
		this.type = type ?? LockSecretCompletedFeeReceipt.RECEIPT_TYPE;
		this.mosaic = mosaic ?? Mosaic();
		this.targetAddress = targetAddress ?? Address();
	}

	void sort() {
		mosaic.sort();
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 2;
		size += type.size;
		size += mosaic.size;
		size += targetAddress.size;
		return size;
	}

	@override
	LockSecretCompletedFeeReceipt deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var version = bytesToInt(buffer.sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		var type = ReceiptType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var mosaic = Mosaic().deserialize(buffer);
		buffer = buffer.sublist(mosaic.size);
		var targetAddress = Address().deserialize(buffer);
		buffer = buffer.sublist(targetAddress.size);

		var instance = LockSecretCompletedFeeReceipt(
			version: version,
			type: type,
			mosaic: mosaic,
			targetAddress: targetAddress,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(version, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + mosaic.size, mosaic.serialize());
		currentPos += mosaic.size;
		buffer.setRange(currentPos, currentPos + targetAddress.size, targetAddress.serialize());
		currentPos += targetAddress.size;
		return buffer;
	}

	@override
	String toString() {
		var result = 'LockSecretCompletedFeeReceipt(';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'type: "${type.toString()}", ';
		result += 'mosaic: "${mosaic.toString()}", ';
		result += 'targetAddress: "${targetAddress.toString()}", ';
		result += ')';
		return result;
	}
}


class LockSecretExpiredFeeReceipt implements ISerializable {
	static final ReceiptType RECEIPT_TYPE = ReceiptType(ReceiptType.LOCK_SECRET_EXPIRED.value);

	static const Map<String, String> TYPE_HINTS = {
		'type': 'enum:ReceiptType',
		'mosaic': 'struct:Mosaic',
		'targetAddress': 'pod:Address'
	};

	int version = 0;
	ReceiptType type = LockSecretExpiredFeeReceipt.RECEIPT_TYPE;
	Mosaic mosaic = Mosaic();
	Address targetAddress = Address();

	LockSecretExpiredFeeReceipt({ int? version, ReceiptType? type, Mosaic? mosaic, Address? targetAddress}) {
		this.version = version ?? 0;
		this.type = type ?? LockSecretExpiredFeeReceipt.RECEIPT_TYPE;
		this.mosaic = mosaic ?? Mosaic();
		this.targetAddress = targetAddress ?? Address();
	}

	void sort() {
		mosaic.sort();
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 2;
		size += type.size;
		size += mosaic.size;
		size += targetAddress.size;
		return size;
	}

	@override
	LockSecretExpiredFeeReceipt deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var version = bytesToInt(buffer.sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		var type = ReceiptType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var mosaic = Mosaic().deserialize(buffer);
		buffer = buffer.sublist(mosaic.size);
		var targetAddress = Address().deserialize(buffer);
		buffer = buffer.sublist(targetAddress.size);

		var instance = LockSecretExpiredFeeReceipt(
			version: version,
			type: type,
			mosaic: mosaic,
			targetAddress: targetAddress,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(version, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + mosaic.size, mosaic.serialize());
		currentPos += mosaic.size;
		buffer.setRange(currentPos, currentPos + targetAddress.size, targetAddress.serialize());
		currentPos += targetAddress.size;
		return buffer;
	}

	@override
	String toString() {
		var result = 'LockSecretExpiredFeeReceipt(';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'type: "${type.toString()}", ';
		result += 'mosaic: "${mosaic.toString()}", ';
		result += 'targetAddress: "${targetAddress.toString()}", ';
		result += ')';
		return result;
	}
}


class MosaicExpiredReceipt implements ISerializable {
	static final ReceiptType RECEIPT_TYPE = ReceiptType(ReceiptType.MOSAIC_EXPIRED.value);

	static const Map<String, String> TYPE_HINTS = {
		'type': 'enum:ReceiptType',
		'artifactId': 'pod:MosaicId'
	};

	int version = 0;
	ReceiptType type = MosaicExpiredReceipt.RECEIPT_TYPE;
	MosaicId artifactId = MosaicId();

	MosaicExpiredReceipt({ int? version, ReceiptType? type, MosaicId? artifactId}) {
		this.version = version ?? 0;
		this.type = type ?? MosaicExpiredReceipt.RECEIPT_TYPE;
		this.artifactId = artifactId ?? MosaicId();
	}

	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 2;
		size += type.size;
		size += artifactId.size;
		return size;
	}

	@override
	MosaicExpiredReceipt deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var version = bytesToInt(buffer.sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		var type = ReceiptType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var artifactId = MosaicId().deserialize(buffer);
		buffer = buffer.sublist(artifactId.size);

		var instance = MosaicExpiredReceipt(
			version: version,
			type: type,
			artifactId: artifactId,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(version, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + artifactId.size, artifactId.serialize());
		currentPos += artifactId.size;
		return buffer;
	}

	@override
	String toString() {
		var result = 'MosaicExpiredReceipt(';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'type: "${type.toString()}", ';
		result += 'artifactId: "${artifactId.toString()}", ';
		result += ')';
		return result;
	}
}


class MosaicRentalFeeReceipt implements ISerializable {
	static final ReceiptType RECEIPT_TYPE = ReceiptType(ReceiptType.MOSAIC_RENTAL_FEE.value);

	static const Map<String, String> TYPE_HINTS = {
		'type': 'enum:ReceiptType',
		'mosaic': 'struct:Mosaic',
		'senderAddress': 'pod:Address',
		'recipientAddress': 'pod:Address'
	};

	int version = 0;
	ReceiptType type = MosaicRentalFeeReceipt.RECEIPT_TYPE;
	Mosaic mosaic = Mosaic();
	Address senderAddress = Address();
	Address recipientAddress = Address();

	MosaicRentalFeeReceipt({ int? version, ReceiptType? type, Mosaic? mosaic, Address? senderAddress, Address? recipientAddress}) {
		this.version = version ?? 0;
		this.type = type ?? MosaicRentalFeeReceipt.RECEIPT_TYPE;
		this.mosaic = mosaic ?? Mosaic();
		this.senderAddress = senderAddress ?? Address();
		this.recipientAddress = recipientAddress ?? Address();
	}

	void sort() {
		mosaic.sort();
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 2;
		size += type.size;
		size += mosaic.size;
		size += senderAddress.size;
		size += recipientAddress.size;
		return size;
	}

	@override
	MosaicRentalFeeReceipt deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var version = bytesToInt(buffer.sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		var type = ReceiptType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var mosaic = Mosaic().deserialize(buffer);
		buffer = buffer.sublist(mosaic.size);
		var senderAddress = Address().deserialize(buffer);
		buffer = buffer.sublist(senderAddress.size);
		var recipientAddress = Address().deserialize(buffer);
		buffer = buffer.sublist(recipientAddress.size);

		var instance = MosaicRentalFeeReceipt(
			version: version,
			type: type,
			mosaic: mosaic,
			senderAddress: senderAddress,
			recipientAddress: recipientAddress,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(version, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + mosaic.size, mosaic.serialize());
		currentPos += mosaic.size;
		buffer.setRange(currentPos, currentPos + senderAddress.size, senderAddress.serialize());
		currentPos += senderAddress.size;
		buffer.setRange(currentPos, currentPos + recipientAddress.size, recipientAddress.serialize());
		currentPos += recipientAddress.size;
		return buffer;
	}

	@override
	String toString() {
		var result = 'MosaicRentalFeeReceipt(';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'type: "${type.toString()}", ';
		result += 'mosaic: "${mosaic.toString()}", ';
		result += 'senderAddress: "${senderAddress.toString()}", ';
		result += 'recipientAddress: "${recipientAddress.toString()}", ';
		result += ')';
		return result;
	}
}


class NamespaceId extends BaseValue implements ISerializable {
	static const int SIZE = 8;

	NamespaceId([dynamic namespaceId]) : super(SIZE, namespaceId ?? BigInt.from(0));

	@override
	NamespaceId deserialize(Uint8List payload) {
		return NamespaceId(bytesToInt(payload.sublist(0, 8), 8));
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(SIZE);
		buffer.setRange(0, 0 + 8, intToBytes(value, 8));
		return buffer;
	}
}


class NamespaceRegistrationType implements ISerializable {
	static final ROOT = NamespaceRegistrationType(0);
	static final CHILD = NamespaceRegistrationType(1);

	int value = 0;

	static final _flags = {
		0: 'ROOT',
		1: 'CHILD',
	};

	NamespaceRegistrationType([int? _value]) {
		value = _value ?? 0;
	}

	@override
	int get size {
		return 1;
	}

	@override
	NamespaceRegistrationType deserialize(Uint8List payload) {
		var byteData = ByteData.sublistView(payload);
		return NamespaceRegistrationType(byteData.getUint8(0));
	}

	@override
	Uint8List serialize() {
		var byteData = ByteData(1)..setUint8(0, value);
		return byteData.buffer.asUint8List();
	}

	@override
	String toString() {
		return 'NamespaceRegistrationType.${_flags[value]}';
	}
}


class AliasAction implements ISerializable {
	static final UNLINK = AliasAction(0);
	static final LINK = AliasAction(1);

	int value = 0;

	static final _flags = {
		0: 'UNLINK',
		1: 'LINK',
	};

	AliasAction([int? _value]) {
		value = _value ?? 0;
	}

	@override
	int get size {
		return 1;
	}

	@override
	AliasAction deserialize(Uint8List payload) {
		var byteData = ByteData.sublistView(payload);
		return AliasAction(byteData.getUint8(0));
	}

	@override
	Uint8List serialize() {
		var byteData = ByteData(1)..setUint8(0, value);
		return byteData.buffer.asUint8List();
	}

	@override
	String toString() {
		return 'AliasAction.${_flags[value]}';
	}
}


class NamespaceExpiredReceipt implements ISerializable {
	static final ReceiptType RECEIPT_TYPE = ReceiptType(ReceiptType.NAMESPACE_EXPIRED.value);

	static const Map<String, String> TYPE_HINTS = {
		'type': 'enum:ReceiptType',
		'artifactId': 'pod:NamespaceId'
	};

	int version = 0;
	ReceiptType type = NamespaceExpiredReceipt.RECEIPT_TYPE;
	NamespaceId artifactId = NamespaceId();

	NamespaceExpiredReceipt({ int? version, ReceiptType? type, NamespaceId? artifactId}) {
		this.version = version ?? 0;
		this.type = type ?? NamespaceExpiredReceipt.RECEIPT_TYPE;
		this.artifactId = artifactId ?? NamespaceId();
	}

	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 2;
		size += type.size;
		size += artifactId.size;
		return size;
	}

	@override
	NamespaceExpiredReceipt deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var version = bytesToInt(buffer.sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		var type = ReceiptType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var artifactId = NamespaceId().deserialize(buffer);
		buffer = buffer.sublist(artifactId.size);

		var instance = NamespaceExpiredReceipt(
			version: version,
			type: type,
			artifactId: artifactId,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(version, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + artifactId.size, artifactId.serialize());
		currentPos += artifactId.size;
		return buffer;
	}

	@override
	String toString() {
		var result = 'NamespaceExpiredReceipt(';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'type: "${type.toString()}", ';
		result += 'artifactId: "${artifactId.toString()}", ';
		result += ')';
		return result;
	}
}


class NamespaceDeletedReceipt implements ISerializable {
	static final ReceiptType RECEIPT_TYPE = ReceiptType(ReceiptType.NAMESPACE_DELETED.value);

	static const Map<String, String> TYPE_HINTS = {
		'type': 'enum:ReceiptType',
		'artifactId': 'pod:NamespaceId'
	};

	int version = 0;
	ReceiptType type = NamespaceDeletedReceipt.RECEIPT_TYPE;
	NamespaceId artifactId = NamespaceId();

	NamespaceDeletedReceipt({ int? version, ReceiptType? type, NamespaceId? artifactId}) {
		this.version = version ?? 0;
		this.type = type ?? NamespaceDeletedReceipt.RECEIPT_TYPE;
		this.artifactId = artifactId ?? NamespaceId();
	}

	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 2;
		size += type.size;
		size += artifactId.size;
		return size;
	}

	@override
	NamespaceDeletedReceipt deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var version = bytesToInt(buffer.sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		var type = ReceiptType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var artifactId = NamespaceId().deserialize(buffer);
		buffer = buffer.sublist(artifactId.size);

		var instance = NamespaceDeletedReceipt(
			version: version,
			type: type,
			artifactId: artifactId,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(version, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + artifactId.size, artifactId.serialize());
		currentPos += artifactId.size;
		return buffer;
	}

	@override
	String toString() {
		var result = 'NamespaceDeletedReceipt(';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'type: "${type.toString()}", ';
		result += 'artifactId: "${artifactId.toString()}", ';
		result += ')';
		return result;
	}
}


class NamespaceRentalFeeReceipt implements ISerializable {
	static final ReceiptType RECEIPT_TYPE = ReceiptType(ReceiptType.NAMESPACE_RENTAL_FEE.value);

	static const Map<String, String> TYPE_HINTS = {
		'type': 'enum:ReceiptType',
		'mosaic': 'struct:Mosaic',
		'senderAddress': 'pod:Address',
		'recipientAddress': 'pod:Address'
	};

	int version = 0;
	ReceiptType type = NamespaceRentalFeeReceipt.RECEIPT_TYPE;
	Mosaic mosaic = Mosaic();
	Address senderAddress = Address();
	Address recipientAddress = Address();

	NamespaceRentalFeeReceipt({ int? version, ReceiptType? type, Mosaic? mosaic, Address? senderAddress, Address? recipientAddress}) {
		this.version = version ?? 0;
		this.type = type ?? NamespaceRentalFeeReceipt.RECEIPT_TYPE;
		this.mosaic = mosaic ?? Mosaic();
		this.senderAddress = senderAddress ?? Address();
		this.recipientAddress = recipientAddress ?? Address();
	}

	void sort() {
		mosaic.sort();
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 2;
		size += type.size;
		size += mosaic.size;
		size += senderAddress.size;
		size += recipientAddress.size;
		return size;
	}

	@override
	NamespaceRentalFeeReceipt deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var version = bytesToInt(buffer.sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		var type = ReceiptType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var mosaic = Mosaic().deserialize(buffer);
		buffer = buffer.sublist(mosaic.size);
		var senderAddress = Address().deserialize(buffer);
		buffer = buffer.sublist(senderAddress.size);
		var recipientAddress = Address().deserialize(buffer);
		buffer = buffer.sublist(recipientAddress.size);

		var instance = NamespaceRentalFeeReceipt(
			version: version,
			type: type,
			mosaic: mosaic,
			senderAddress: senderAddress,
			recipientAddress: recipientAddress,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(version, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + mosaic.size, mosaic.serialize());
		currentPos += mosaic.size;
		buffer.setRange(currentPos, currentPos + senderAddress.size, senderAddress.serialize());
		currentPos += senderAddress.size;
		buffer.setRange(currentPos, currentPos + recipientAddress.size, recipientAddress.serialize());
		currentPos += recipientAddress.size;
		return buffer;
	}

	@override
	String toString() {
		var result = 'NamespaceRentalFeeReceipt(';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'type: "${type.toString()}", ';
		result += 'mosaic: "${mosaic.toString()}", ';
		result += 'senderAddress: "${senderAddress.toString()}", ';
		result += 'recipientAddress: "${recipientAddress.toString()}", ';
		result += ')';
		return result;
	}
}


class ReceiptSource implements ISerializable {

	static const Map<String, String> TYPE_HINTS = {
	};

	int primaryId = 0;
	int secondaryId = 0;

	ReceiptSource({ int? primaryId, int? secondaryId}) {
		this.primaryId = primaryId ?? 0;
		this.secondaryId = secondaryId ?? 0;
	}

	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		return size;
	}

	@override
	ReceiptSource deserialize(Uint8List payload) {
		var buffer = payload;
		var primaryId = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		var secondaryId = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);

		var instance = ReceiptSource(
			primaryId: primaryId,
			secondaryId: secondaryId,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(primaryId, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(secondaryId, 4));
		currentPos += 4;
		return buffer;
	}

	@override
	String toString() {
		var result = 'ReceiptSource(';
		result += 'primaryId: "0x${intToHex(primaryId)}", ';
		result += 'secondaryId: "0x${intToHex(secondaryId)}", ';
		result += ')';
		return result;
	}
}


class AddressResolutionEntry implements ISerializable {

	static const Map<String, String> TYPE_HINTS = {
		'source': 'struct:ReceiptSource',
		'resolvedValue': 'pod:Address'
	};

	ReceiptSource source = ReceiptSource();
	Address resolvedValue = Address();

	AddressResolutionEntry({ ReceiptSource? source, Address? resolvedValue}) {
		this.source = source ?? ReceiptSource();
		this.resolvedValue = resolvedValue ?? Address();
	}

	void sort() {
		source.sort();
	}

	@override
	int get size {
		var size = 0;
		size += source.size;
		size += resolvedValue.size;
		return size;
	}

	@override
	AddressResolutionEntry deserialize(Uint8List payload) {
		var buffer = payload;
		var source = ReceiptSource().deserialize(buffer);
		buffer = buffer.sublist(source.size);
		var resolvedValue = Address().deserialize(buffer);
		buffer = buffer.sublist(resolvedValue.size);

		var instance = AddressResolutionEntry(
			source: source,
			resolvedValue: resolvedValue,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + source.size, source.serialize());
		currentPos += source.size;
		buffer.setRange(currentPos, currentPos + resolvedValue.size, resolvedValue.serialize());
		currentPos += resolvedValue.size;
		return buffer;
	}

	@override
	String toString() {
		var result = 'AddressResolutionEntry(';
		result += 'source: "${source.toString()}", ';
		result += 'resolvedValue: "${resolvedValue.toString()}", ';
		result += ')';
		return result;
	}
}


class AddressResolutionStatement implements ISerializable {

	static const Map<String, String> TYPE_HINTS = {
		'unresolved': 'pod:UnresolvedAddress',
		'resolutionEntries': 'array[AddressResolutionEntry]'
	};

	UnresolvedAddress unresolved = UnresolvedAddress();
	List<AddressResolutionEntry> resolutionEntries = [];

	AddressResolutionStatement({ UnresolvedAddress? unresolved, List<AddressResolutionEntry>? resolutionEntries}) {
		this.unresolved = unresolved ?? UnresolvedAddress();
		this.resolutionEntries = resolutionEntries ?? [];
	}

	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += unresolved.size;
		size += 4;
		size += ArrayHelpers.size(resolutionEntries);
		return size;
	}

	@override
	AddressResolutionStatement deserialize(Uint8List payload) {
		var buffer = payload;
		var unresolved = UnresolvedAddress().deserialize(buffer);
		buffer = buffer.sublist(unresolved.size);
		var resolutionEntriesCount = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		var resolutionEntries = ArrayHelpers.readArrayCount(buffer, AddressResolutionEntry(), resolutionEntriesCount).map((item) => item as AddressResolutionEntry).toList();
		buffer = buffer.sublist(ArrayHelpers.size(resolutionEntries));

		var instance = AddressResolutionStatement(
			unresolved: unresolved,
			resolutionEntries: resolutionEntries,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + unresolved.size, unresolved.serialize());
		currentPos += unresolved.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(resolutionEntries.length, 4));
		currentPos += 4;
		sort();
		var res_resolutionEntries = ArrayHelpers.writeArray(buffer, resolutionEntries, currentPos);
		currentPos = res_resolutionEntries.item2;
		buffer = res_resolutionEntries.item1;
		return buffer;
	}

	@override
	String toString() {
		var result = 'AddressResolutionStatement(';
		result += 'unresolved: "${unresolved.toString()}", ';
		result += 'resolutionEntries: "${resolutionEntries.map((e) => e.toString()).toList()}", ';
		result += ')';
		return result;
	}
}


class MosaicResolutionEntry implements ISerializable {

	static const Map<String, String> TYPE_HINTS = {
		'source': 'struct:ReceiptSource',
		'resolvedValue': 'pod:MosaicId'
	};

	ReceiptSource source = ReceiptSource();
	MosaicId resolvedValue = MosaicId();

	MosaicResolutionEntry({ ReceiptSource? source, MosaicId? resolvedValue}) {
		this.source = source ?? ReceiptSource();
		this.resolvedValue = resolvedValue ?? MosaicId();
	}

	void sort() {
		source.sort();
	}

	@override
	int get size {
		var size = 0;
		size += source.size;
		size += resolvedValue.size;
		return size;
	}

	@override
	MosaicResolutionEntry deserialize(Uint8List payload) {
		var buffer = payload;
		var source = ReceiptSource().deserialize(buffer);
		buffer = buffer.sublist(source.size);
		var resolvedValue = MosaicId().deserialize(buffer);
		buffer = buffer.sublist(resolvedValue.size);

		var instance = MosaicResolutionEntry(
			source: source,
			resolvedValue: resolvedValue,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + source.size, source.serialize());
		currentPos += source.size;
		buffer.setRange(currentPos, currentPos + resolvedValue.size, resolvedValue.serialize());
		currentPos += resolvedValue.size;
		return buffer;
	}

	@override
	String toString() {
		var result = 'MosaicResolutionEntry(';
		result += 'source: "${source.toString()}", ';
		result += 'resolvedValue: "${resolvedValue.toString()}", ';
		result += ')';
		return result;
	}
}


class MosaicResolutionStatement implements ISerializable {

	static const Map<String, String> TYPE_HINTS = {
		'unresolved': 'pod:UnresolvedMosaicId',
		'resolutionEntries': 'array[MosaicResolutionEntry]'
	};

	UnresolvedMosaicId unresolved = UnresolvedMosaicId();
	List<MosaicResolutionEntry> resolutionEntries = [];

	MosaicResolutionStatement({ UnresolvedMosaicId? unresolved, List<MosaicResolutionEntry>? resolutionEntries}) {
		this.unresolved = unresolved ?? UnresolvedMosaicId();
		this.resolutionEntries = resolutionEntries ?? [];
	}

	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += unresolved.size;
		size += 4;
		size += ArrayHelpers.size(resolutionEntries);
		return size;
	}

	@override
	MosaicResolutionStatement deserialize(Uint8List payload) {
		var buffer = payload;
		var unresolved = UnresolvedMosaicId().deserialize(buffer);
		buffer = buffer.sublist(unresolved.size);
		var resolutionEntriesCount = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		var resolutionEntries = ArrayHelpers.readArrayCount(buffer, MosaicResolutionEntry(), resolutionEntriesCount).map((item) => item as MosaicResolutionEntry).toList();
		buffer = buffer.sublist(ArrayHelpers.size(resolutionEntries));

		var instance = MosaicResolutionStatement(
			unresolved: unresolved,
			resolutionEntries: resolutionEntries,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + unresolved.size, unresolved.serialize());
		currentPos += unresolved.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(resolutionEntries.length, 4));
		currentPos += 4;
		sort();
		var res_resolutionEntries = ArrayHelpers.writeArray(buffer, resolutionEntries, currentPos);
		currentPos = res_resolutionEntries.item2;
		buffer = res_resolutionEntries.item1;
		return buffer;
	}

	@override
	String toString() {
		var result = 'MosaicResolutionStatement(';
		result += 'unresolved: "${unresolved.toString()}", ';
		result += 'resolutionEntries: "${resolutionEntries.map((e) => e.toString()).toList()}", ';
		result += ')';
		return result;
	}
}


class TransactionStatement implements ISerializable {

	static const Map<String, String> TYPE_HINTS = {
		'receipts': 'array[Receipt]'
	};

	int primaryId = 0;
	int secondaryId = 0;
	List<Receipt> receipts = [];

	TransactionStatement({ int? primaryId, int? secondaryId, List<Receipt>? receipts}) {
		this.primaryId = primaryId ?? 0;
		this.secondaryId = secondaryId ?? 0;
		this.receipts = receipts ?? [];
	}

	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += 4;
		size += ArrayHelpers.size(receipts);
		return size;
	}

	@override
	TransactionStatement deserialize(Uint8List payload) {
		var buffer = payload;
		var primaryId = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		var secondaryId = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		var receiptCount = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		var receipts = ArrayHelpers.readArrayCount(buffer, ReceiptFactory(), receiptCount).map((item) => item as Receipt).toList();
		buffer = buffer.sublist(ArrayHelpers.size(receipts));

		var instance = TransactionStatement(
			primaryId: primaryId,
			secondaryId: secondaryId,
			receipts: receipts,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(primaryId, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(secondaryId, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(receipts.length, 4));
		currentPos += 4;
		sort();
		var res_receipts = ArrayHelpers.writeArray(buffer, receipts, currentPos);
		currentPos = res_receipts.item2;
		buffer = res_receipts.item1;
		return buffer;
	}

	@override
	String toString() {
		var result = 'TransactionStatement(';
		result += 'primaryId: "0x${intToHex(primaryId)}", ';
		result += 'secondaryId: "0x${intToHex(secondaryId)}", ';
		result += 'receipts: "${receipts.map((e) => e.toString()).toList()}", ';
		result += ')';
		return result;
	}
}


class BlockStatement implements ISerializable {

	static const Map<String, String> TYPE_HINTS = {
		'transactionStatements': 'array[TransactionStatement]',
		'addressResolutionStatements': 'array[AddressResolutionStatement]',
		'mosaicResolutionStatements': 'array[MosaicResolutionStatement]'
	};

	List<TransactionStatement> transactionStatements = [];
	List<AddressResolutionStatement> addressResolutionStatements = [];
	List<MosaicResolutionStatement> mosaicResolutionStatements = [];

	BlockStatement({ 
	List<TransactionStatement>? transactionStatements,
	List<AddressResolutionStatement>? addressResolutionStatements,
	List<MosaicResolutionStatement>? mosaicResolutionStatements
	}) {
		this.transactionStatements = transactionStatements ?? [];
		this.addressResolutionStatements = addressResolutionStatements ?? [];
		this.mosaicResolutionStatements = mosaicResolutionStatements ?? [];
	}

	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += ArrayHelpers.size(transactionStatements);
		size += 4;
		size += ArrayHelpers.size(addressResolutionStatements);
		size += 4;
		size += ArrayHelpers.size(mosaicResolutionStatements);
		return size;
	}

	@override
	BlockStatement deserialize(Uint8List payload) {
		var buffer = payload;
		var transactionStatementCount = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		var transactionStatements = ArrayHelpers.readArrayCount(buffer, TransactionStatement(), transactionStatementCount).map((item) => item as TransactionStatement).toList();
		buffer = buffer.sublist(ArrayHelpers.size(transactionStatements));
		var addressResolutionStatementCount = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		var addressResolutionStatements = ArrayHelpers.readArrayCount(buffer, AddressResolutionStatement(), addressResolutionStatementCount).map((item) => item as AddressResolutionStatement).toList();
		buffer = buffer.sublist(ArrayHelpers.size(addressResolutionStatements));
		var mosaicResolutionStatementCount = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		var mosaicResolutionStatements = ArrayHelpers.readArrayCount(buffer, MosaicResolutionStatement(), mosaicResolutionStatementCount).map((item) => item as MosaicResolutionStatement).toList();
		buffer = buffer.sublist(ArrayHelpers.size(mosaicResolutionStatements));

		var instance = BlockStatement(
			transactionStatements: transactionStatements,
			addressResolutionStatements: addressResolutionStatements,
			mosaicResolutionStatements: mosaicResolutionStatements,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(transactionStatements.length, 4));
		currentPos += 4;
		sort();
		var res_transactionStatements = ArrayHelpers.writeArray(buffer, transactionStatements, currentPos);
		currentPos = res_transactionStatements.item2;
		buffer = res_transactionStatements.item1;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(addressResolutionStatements.length, 4));
		currentPos += 4;
		sort();
		var res_addressResolutionStatements = ArrayHelpers.writeArray(buffer, addressResolutionStatements, currentPos);
		currentPos = res_addressResolutionStatements.item2;
		buffer = res_addressResolutionStatements.item1;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(mosaicResolutionStatements.length, 4));
		currentPos += 4;
		sort();
		var res_mosaicResolutionStatements = ArrayHelpers.writeArray(buffer, mosaicResolutionStatements, currentPos);
		currentPos = res_mosaicResolutionStatements.item2;
		buffer = res_mosaicResolutionStatements.item1;
		return buffer;
	}

	@override
	String toString() {
		var result = 'BlockStatement(';
		result += 'transactionStatements: "${transactionStatements.map((e) => e.toString()).toList()}", ';
		result += 'addressResolutionStatements: "${addressResolutionStatements.map((e) => e.toString()).toList()}", ';
		result += 'mosaicResolutionStatements: "${mosaicResolutionStatements.map((e) => e.toString()).toList()}", ';
		result += ')';
		return result;
	}
}


class AccountKeyLinkTransactionV1 implements ISerializable, ITransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.ACCOUNT_KEY_LINK.value);

	static const Map<String, String> TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'linkedPublicKey': 'pod:PublicKey',
		'linkAction': 'enum:LinkAction'
	};

	@override
	Signature signature = Signature();
	@override
	PublicKey signerPublicKey = PublicKey();
	int version = AccountKeyLinkTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	TransactionType type = AccountKeyLinkTransactionV1.TRANSACTION_TYPE;
	Amount fee = Amount();
	Timestamp deadline = Timestamp();
	PublicKey linkedPublicKey = PublicKey();
	LinkAction linkAction = LinkAction.UNLINK;
	final int verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field

	AccountKeyLinkTransactionV1({ 
	Signature? signature,
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	Amount? fee,
	Timestamp? deadline,
	PublicKey? linkedPublicKey,
	LinkAction? linkAction
	}) {
		this.signature = signature ?? Signature();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? AccountKeyLinkTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? AccountKeyLinkTransactionV1.TRANSACTION_TYPE;
		this.fee = fee ?? Amount();
		this.deadline = deadline ?? Timestamp();
		this.linkedPublicKey = linkedPublicKey ?? PublicKey();
		this.linkAction = linkAction ?? LinkAction.UNLINK;
	}

	@override
	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signature.size;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += fee.size;
		size += deadline.size;
		size += linkedPublicKey.size;
		size += linkAction.size;
		return size;
	}

	@override
	AccountKeyLinkTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var verifiableEntityHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != verifiableEntityHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($verifiableEntityHeaderReserved_1)');
		}
		var signature = Signature().deserialize(buffer);
		buffer = buffer.sublist(signature.size);
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var fee = Amount().deserialize(buffer);
		buffer = buffer.sublist(fee.size);
		var deadline = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(deadline.size);
		var linkedPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(linkedPublicKey.size);
		var linkAction = LinkAction().deserialize(buffer);
		buffer = buffer.sublist(linkAction.size);

		var instance = AccountKeyLinkTransactionV1(
			signature: signature,
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			fee: fee,
			deadline: deadline,
			linkedPublicKey: linkedPublicKey,
			linkAction: linkAction,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signature.size, signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + fee.size, fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + deadline.size, deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + linkedPublicKey.size, linkedPublicKey.serialize());
		currentPos += linkedPublicKey.size;
		buffer.setRange(currentPos, currentPos + linkAction.size, linkAction.serialize());
		currentPos += linkAction.size;
		return buffer;
	}

	@override
	String toString() {
		var result = 'AccountKeyLinkTransactionV1(';
		result += 'signature: "${signature.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'fee: "${fee.toString()}", ';
		result += 'deadline: "${deadline.toString()}", ';
		result += 'linkedPublicKey: "${linkedPublicKey.toString()}", ';
		result += 'linkAction: "${linkAction.toString()}", ';
		result += ')';
		return result;
	}
}


class EmbeddedAccountKeyLinkTransactionV1 implements ISerializable, IInnerTransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.ACCOUNT_KEY_LINK.value);

	static const Map<String, String> TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'linkedPublicKey': 'pod:PublicKey',
		'linkAction': 'enum:LinkAction'
	};

	PublicKey signerPublicKey = PublicKey();
	int version = EmbeddedAccountKeyLinkTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	TransactionType type = EmbeddedAccountKeyLinkTransactionV1.TRANSACTION_TYPE;
	PublicKey linkedPublicKey = PublicKey();
	LinkAction linkAction = LinkAction.UNLINK;
	final int embeddedTransactionHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field

	EmbeddedAccountKeyLinkTransactionV1({ 
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	PublicKey? linkedPublicKey,
	LinkAction? linkAction
	}) {
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? EmbeddedAccountKeyLinkTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? EmbeddedAccountKeyLinkTransactionV1.TRANSACTION_TYPE;
		this.linkedPublicKey = linkedPublicKey ?? PublicKey();
		this.linkAction = linkAction ?? LinkAction.UNLINK;
	}

	@override
	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += linkedPublicKey.size;
		size += linkAction.size;
		return size;
	}

	@override
	EmbeddedAccountKeyLinkTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var embeddedTransactionHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != embeddedTransactionHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($embeddedTransactionHeaderReserved_1)');
		}
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var linkedPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(linkedPublicKey.size);
		var linkAction = LinkAction().deserialize(buffer);
		buffer = buffer.sublist(linkAction.size);

		var instance = EmbeddedAccountKeyLinkTransactionV1(
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			linkedPublicKey: linkedPublicKey,
			linkAction: linkAction,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(embeddedTransactionHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + linkedPublicKey.size, linkedPublicKey.serialize());
		currentPos += linkedPublicKey.size;
		buffer.setRange(currentPos, currentPos + linkAction.size, linkAction.serialize());
		currentPos += linkAction.size;
		return buffer;
	}

	@override
	String toString() {
		var result = 'EmbeddedAccountKeyLinkTransactionV1(';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'linkedPublicKey: "${linkedPublicKey.toString()}", ';
		result += 'linkAction: "${linkAction.toString()}", ';
		result += ')';
		return result;
	}
}


class NodeKeyLinkTransactionV1 implements ISerializable, ITransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.NODE_KEY_LINK.value);

	static const Map<String, String> TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'linkedPublicKey': 'pod:PublicKey',
		'linkAction': 'enum:LinkAction'
	};

	@override
	Signature signature = Signature();
	@override
	PublicKey signerPublicKey = PublicKey();
	int version = NodeKeyLinkTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	TransactionType type = NodeKeyLinkTransactionV1.TRANSACTION_TYPE;
	Amount fee = Amount();
	Timestamp deadline = Timestamp();
	PublicKey linkedPublicKey = PublicKey();
	LinkAction linkAction = LinkAction.UNLINK;
	final int verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field

	NodeKeyLinkTransactionV1({ 
	Signature? signature,
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	Amount? fee,
	Timestamp? deadline,
	PublicKey? linkedPublicKey,
	LinkAction? linkAction
	}) {
		this.signature = signature ?? Signature();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? NodeKeyLinkTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? NodeKeyLinkTransactionV1.TRANSACTION_TYPE;
		this.fee = fee ?? Amount();
		this.deadline = deadline ?? Timestamp();
		this.linkedPublicKey = linkedPublicKey ?? PublicKey();
		this.linkAction = linkAction ?? LinkAction.UNLINK;
	}

	@override
	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signature.size;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += fee.size;
		size += deadline.size;
		size += linkedPublicKey.size;
		size += linkAction.size;
		return size;
	}

	@override
	NodeKeyLinkTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var verifiableEntityHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != verifiableEntityHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($verifiableEntityHeaderReserved_1)');
		}
		var signature = Signature().deserialize(buffer);
		buffer = buffer.sublist(signature.size);
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var fee = Amount().deserialize(buffer);
		buffer = buffer.sublist(fee.size);
		var deadline = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(deadline.size);
		var linkedPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(linkedPublicKey.size);
		var linkAction = LinkAction().deserialize(buffer);
		buffer = buffer.sublist(linkAction.size);

		var instance = NodeKeyLinkTransactionV1(
			signature: signature,
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			fee: fee,
			deadline: deadline,
			linkedPublicKey: linkedPublicKey,
			linkAction: linkAction,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signature.size, signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + fee.size, fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + deadline.size, deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + linkedPublicKey.size, linkedPublicKey.serialize());
		currentPos += linkedPublicKey.size;
		buffer.setRange(currentPos, currentPos + linkAction.size, linkAction.serialize());
		currentPos += linkAction.size;
		return buffer;
	}

	@override
	String toString() {
		var result = 'NodeKeyLinkTransactionV1(';
		result += 'signature: "${signature.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'fee: "${fee.toString()}", ';
		result += 'deadline: "${deadline.toString()}", ';
		result += 'linkedPublicKey: "${linkedPublicKey.toString()}", ';
		result += 'linkAction: "${linkAction.toString()}", ';
		result += ')';
		return result;
	}
}


class EmbeddedNodeKeyLinkTransactionV1 implements ISerializable, IInnerTransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.NODE_KEY_LINK.value);

	static const Map<String, String> TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'linkedPublicKey': 'pod:PublicKey',
		'linkAction': 'enum:LinkAction'
	};

	PublicKey signerPublicKey = PublicKey();
	int version = EmbeddedNodeKeyLinkTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	TransactionType type = EmbeddedNodeKeyLinkTransactionV1.TRANSACTION_TYPE;
	PublicKey linkedPublicKey = PublicKey();
	LinkAction linkAction = LinkAction.UNLINK;
	final int embeddedTransactionHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field

	EmbeddedNodeKeyLinkTransactionV1({ 
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	PublicKey? linkedPublicKey,
	LinkAction? linkAction
	}) {
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? EmbeddedNodeKeyLinkTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? EmbeddedNodeKeyLinkTransactionV1.TRANSACTION_TYPE;
		this.linkedPublicKey = linkedPublicKey ?? PublicKey();
		this.linkAction = linkAction ?? LinkAction.UNLINK;
	}

	@override
	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += linkedPublicKey.size;
		size += linkAction.size;
		return size;
	}

	@override
	EmbeddedNodeKeyLinkTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var embeddedTransactionHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != embeddedTransactionHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($embeddedTransactionHeaderReserved_1)');
		}
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var linkedPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(linkedPublicKey.size);
		var linkAction = LinkAction().deserialize(buffer);
		buffer = buffer.sublist(linkAction.size);

		var instance = EmbeddedNodeKeyLinkTransactionV1(
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			linkedPublicKey: linkedPublicKey,
			linkAction: linkAction,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(embeddedTransactionHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + linkedPublicKey.size, linkedPublicKey.serialize());
		currentPos += linkedPublicKey.size;
		buffer.setRange(currentPos, currentPos + linkAction.size, linkAction.serialize());
		currentPos += linkAction.size;
		return buffer;
	}

	@override
	String toString() {
		var result = 'EmbeddedNodeKeyLinkTransactionV1(';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'linkedPublicKey: "${linkedPublicKey.toString()}", ';
		result += 'linkAction: "${linkAction.toString()}", ';
		result += ')';
		return result;
	}
}


class Cosignature implements ISerializable {

	static const Map<String, String> TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'signature': 'pod:Signature'
	};

	BigInt version = BigInt.from(0);
	PublicKey signerPublicKey = PublicKey();
	Signature signature = Signature();

	Cosignature({ BigInt? version, PublicKey? signerPublicKey, Signature? signature}) {
		this.version = version ?? BigInt.from(0);
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.signature = signature ?? Signature();
	}

	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += 8;
		size += signerPublicKey.size;
		size += signature.size;
		return size;
	}

	@override
	Cosignature deserialize(Uint8List payload) {
		var buffer = payload;
		var version = bytesToInt(buffer.sublist(0, 8), 8);
		buffer = buffer.sublist(8);
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var signature = Signature().deserialize(buffer);
		buffer = buffer.sublist(signature.size);

		var instance = Cosignature(
			version: version,
			signerPublicKey: signerPublicKey,
			signature: signature,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 8, intToBytes(version, 8));
		currentPos += 8;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + signature.size, signature.serialize());
		currentPos += signature.size;
		return buffer;
	}

	@override
	String toString() {
		var result = 'Cosignature(';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'signature: "${signature.toString()}", ';
		result += ')';
		return result;
	}
}


class DetachedCosignature implements ISerializable {

	static const Map<String, String> TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'signature': 'pod:Signature',
		'parentHash': 'pod:Hash256'
	};

	BigInt version = BigInt.from(0);
	PublicKey signerPublicKey = PublicKey();
	Signature signature = Signature();
	Hash256 parentHash = Hash256();

	DetachedCosignature({ BigInt? version, PublicKey? signerPublicKey, Signature? signature, Hash256? parentHash}) {
		this.version = version ?? BigInt.from(0);
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.signature = signature ?? Signature();
		this.parentHash = parentHash ?? Hash256();
	}

	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += 8;
		size += signerPublicKey.size;
		size += signature.size;
		size += parentHash.size;
		return size;
	}

	@override
	DetachedCosignature deserialize(Uint8List payload) {
		var buffer = payload;
		var version = bytesToInt(buffer.sublist(0, 8), 8);
		buffer = buffer.sublist(8);
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var signature = Signature().deserialize(buffer);
		buffer = buffer.sublist(signature.size);
		var parentHash = Hash256().deserialize(buffer);
		buffer = buffer.sublist(parentHash.size);

		var instance = DetachedCosignature(
			version: version,
			signerPublicKey: signerPublicKey,
			signature: signature,
			parentHash: parentHash,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 8, intToBytes(version, 8));
		currentPos += 8;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + signature.size, signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + parentHash.size, parentHash.serialize());
		currentPos += parentHash.size;
		return buffer;
	}

	@override
	String toString() {
		var result = 'DetachedCosignature(';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'signature: "${signature.toString()}", ';
		result += 'parentHash: "${parentHash.toString()}", ';
		result += ')';
		return result;
	}
}


class AggregateCompleteTransactionV1 implements ISerializable, ITransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.AGGREGATE_COMPLETE.value);

	static const Map<String, String> TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'transactionsHash': 'pod:Hash256',
		'transactions': 'array[EmbeddedTransaction]',
		'cosignatures': 'array[Cosignature]'
	};

	@override
	Signature signature = Signature();
	@override
	PublicKey signerPublicKey = PublicKey();
	int version = AggregateCompleteTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	TransactionType type = AggregateCompleteTransactionV1.TRANSACTION_TYPE;
	Amount fee = Amount();
	Timestamp deadline = Timestamp();
	Hash256 transactionsHash = Hash256();
	List<IInnerTransaction> transactions = [];
	List<Cosignature> cosignatures = [];
	final int verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field
	final int aggregateTransactionHeaderReserved_1 = 0; // reserved field

	AggregateCompleteTransactionV1({ 
	Signature? signature,
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	Amount? fee,
	Timestamp? deadline,
	Hash256? transactionsHash,
	List<IInnerTransaction>? transactions,
	List<Cosignature>? cosignatures
	}) {
		this.signature = signature ?? Signature();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? AggregateCompleteTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? AggregateCompleteTransactionV1.TRANSACTION_TYPE;
		this.fee = fee ?? Amount();
		this.deadline = deadline ?? Timestamp();
		this.transactionsHash = transactionsHash ?? Hash256();
		this.transactions = transactions ?? [];
		this.cosignatures = cosignatures ?? [];
	}

	@override
	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signature.size;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += fee.size;
		size += deadline.size;
		size += transactionsHash.size;
		size += 4;
		size += 4;
		size += ArrayHelpers.size(transactions, 8, false);
		size += ArrayHelpers.size(cosignatures);
		return size;
	}

	@override
	AggregateCompleteTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var verifiableEntityHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != verifiableEntityHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($verifiableEntityHeaderReserved_1)');
		}
		var signature = Signature().deserialize(buffer);
		buffer = buffer.sublist(signature.size);
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var fee = Amount().deserialize(buffer);
		buffer = buffer.sublist(fee.size);
		var deadline = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(deadline.size);
		var transactionsHash = Hash256().deserialize(buffer);
		buffer = buffer.sublist(transactionsHash.size);
		var payloadSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		var aggregateTransactionHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != aggregateTransactionHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($aggregateTransactionHeaderReserved_1)');
		}
		var transactions = ArrayHelpers.readVariableSizeElements(buffer.sublist(0, payloadSize), EmbeddedTransactionFactory(), 8, false).map((item) => item as IInnerTransaction).toList();
		buffer = buffer.sublist(payloadSize);
		var cosignatures = ArrayHelpers.readArray(buffer, Cosignature()).map((item) => item as Cosignature).toList();
		buffer = buffer.sublist(ArrayHelpers.size(cosignatures));

		var instance = AggregateCompleteTransactionV1(
			signature: signature,
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			fee: fee,
			deadline: deadline,
			transactionsHash: transactionsHash,
			transactions: transactions,
			cosignatures: cosignatures,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signature.size, signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + fee.size, fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + deadline.size, deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + transactionsHash.size, transactionsHash.serialize());
		currentPos += transactionsHash.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(ArrayHelpers.size(transactions, 8, false), 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(aggregateTransactionHeaderReserved_1, 4));
		currentPos += 4;
		sort();
		var res_transactions = ArrayHelpers.writeVariableSizeElements(buffer, transactions, 8, currentPos, false);
		currentPos = res_transactions.item2;
		buffer = res_transactions.item1;
		sort();
		var res_cosignatures = ArrayHelpers.writeArray(buffer, cosignatures, currentPos);
		currentPos = res_cosignatures.item2;
		buffer = res_cosignatures.item1;
		return buffer;
	}

	@override
	String toString() {
		var result = 'AggregateCompleteTransactionV1(';
		result += 'signature: "${signature.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'fee: "${fee.toString()}", ';
		result += 'deadline: "${deadline.toString()}", ';
		result += 'transactionsHash: "${transactionsHash.toString()}", ';
		result += 'transactions: "${transactions.map((e) => e.toString()).toList()}", ';
		result += 'cosignatures: "${cosignatures.map((e) => e.toString()).toList()}", ';
		result += ')';
		return result;
	}
}


class AggregateCompleteTransactionV2 implements ISerializable, ITransaction {
	static const int TRANSACTION_VERSION = 2;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.AGGREGATE_COMPLETE.value);

	static const Map<String, String> TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'transactionsHash': 'pod:Hash256',
		'transactions': 'array[EmbeddedTransaction]',
		'cosignatures': 'array[Cosignature]'
	};

	@override
	Signature signature = Signature();
	@override
	PublicKey signerPublicKey = PublicKey();
	int version = AggregateCompleteTransactionV2.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	TransactionType type = AggregateCompleteTransactionV2.TRANSACTION_TYPE;
	Amount fee = Amount();
	Timestamp deadline = Timestamp();
	Hash256 transactionsHash = Hash256();
	List<IInnerTransaction> transactions = [];
	List<Cosignature> cosignatures = [];
	final int verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field
	final int aggregateTransactionHeaderReserved_1 = 0; // reserved field

	AggregateCompleteTransactionV2({ 
	Signature? signature,
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	Amount? fee,
	Timestamp? deadline,
	Hash256? transactionsHash,
	List<IInnerTransaction>? transactions,
	List<Cosignature>? cosignatures
	}) {
		this.signature = signature ?? Signature();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? AggregateCompleteTransactionV2.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? AggregateCompleteTransactionV2.TRANSACTION_TYPE;
		this.fee = fee ?? Amount();
		this.deadline = deadline ?? Timestamp();
		this.transactionsHash = transactionsHash ?? Hash256();
		this.transactions = transactions ?? [];
		this.cosignatures = cosignatures ?? [];
	}

	@override
	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signature.size;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += fee.size;
		size += deadline.size;
		size += transactionsHash.size;
		size += 4;
		size += 4;
		size += ArrayHelpers.size(transactions, 8, false);
		size += ArrayHelpers.size(cosignatures);
		return size;
	}

	@override
	AggregateCompleteTransactionV2 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var verifiableEntityHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != verifiableEntityHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($verifiableEntityHeaderReserved_1)');
		}
		var signature = Signature().deserialize(buffer);
		buffer = buffer.sublist(signature.size);
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var fee = Amount().deserialize(buffer);
		buffer = buffer.sublist(fee.size);
		var deadline = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(deadline.size);
		var transactionsHash = Hash256().deserialize(buffer);
		buffer = buffer.sublist(transactionsHash.size);
		var payloadSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		var aggregateTransactionHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != aggregateTransactionHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($aggregateTransactionHeaderReserved_1)');
		}
		var transactions = ArrayHelpers.readVariableSizeElements(buffer.sublist(0, payloadSize), EmbeddedTransactionFactory(), 8, false).map((item) => item as IInnerTransaction).toList();
		buffer = buffer.sublist(payloadSize);
		var cosignatures = ArrayHelpers.readArray(buffer, Cosignature()).map((item) => item as Cosignature).toList();
		buffer = buffer.sublist(ArrayHelpers.size(cosignatures));

		var instance = AggregateCompleteTransactionV2(
			signature: signature,
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			fee: fee,
			deadline: deadline,
			transactionsHash: transactionsHash,
			transactions: transactions,
			cosignatures: cosignatures,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signature.size, signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + fee.size, fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + deadline.size, deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + transactionsHash.size, transactionsHash.serialize());
		currentPos += transactionsHash.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(ArrayHelpers.size(transactions, 8, false), 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(aggregateTransactionHeaderReserved_1, 4));
		currentPos += 4;
		sort();
		var res_transactions = ArrayHelpers.writeVariableSizeElements(buffer, transactions, 8, currentPos, false);
		currentPos = res_transactions.item2;
		buffer = res_transactions.item1;
		sort();
		var res_cosignatures = ArrayHelpers.writeArray(buffer, cosignatures, currentPos);
		currentPos = res_cosignatures.item2;
		buffer = res_cosignatures.item1;
		return buffer;
	}

	@override
	String toString() {
		var result = 'AggregateCompleteTransactionV2(';
		result += 'signature: "${signature.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'fee: "${fee.toString()}", ';
		result += 'deadline: "${deadline.toString()}", ';
		result += 'transactionsHash: "${transactionsHash.toString()}", ';
		result += 'transactions: "${transactions.map((e) => e.toString()).toList()}", ';
		result += 'cosignatures: "${cosignatures.map((e) => e.toString()).toList()}", ';
		result += ')';
		return result;
	}
}


class AggregateBondedTransactionV1 implements ISerializable, ITransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.AGGREGATE_BONDED.value);

	static const Map<String, String> TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'transactionsHash': 'pod:Hash256',
		'transactions': 'array[EmbeddedTransaction]',
		'cosignatures': 'array[Cosignature]'
	};

	@override
	Signature signature = Signature();
	@override
	PublicKey signerPublicKey = PublicKey();
	int version = AggregateBondedTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	TransactionType type = AggregateBondedTransactionV1.TRANSACTION_TYPE;
	Amount fee = Amount();
	Timestamp deadline = Timestamp();
	Hash256 transactionsHash = Hash256();
	List<IInnerTransaction> transactions = [];
	List<Cosignature> cosignatures = [];
	final int verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field
	final int aggregateTransactionHeaderReserved_1 = 0; // reserved field

	AggregateBondedTransactionV1({ 
	Signature? signature,
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	Amount? fee,
	Timestamp? deadline,
	Hash256? transactionsHash,
	List<IInnerTransaction>? transactions,
	List<Cosignature>? cosignatures
	}) {
		this.signature = signature ?? Signature();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? AggregateBondedTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? AggregateBondedTransactionV1.TRANSACTION_TYPE;
		this.fee = fee ?? Amount();
		this.deadline = deadline ?? Timestamp();
		this.transactionsHash = transactionsHash ?? Hash256();
		this.transactions = transactions ?? [];
		this.cosignatures = cosignatures ?? [];
	}

	@override
	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signature.size;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += fee.size;
		size += deadline.size;
		size += transactionsHash.size;
		size += 4;
		size += 4;
		size += ArrayHelpers.size(transactions, 8, false);
		size += ArrayHelpers.size(cosignatures);
		return size;
	}

	@override
	AggregateBondedTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var verifiableEntityHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != verifiableEntityHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($verifiableEntityHeaderReserved_1)');
		}
		var signature = Signature().deserialize(buffer);
		buffer = buffer.sublist(signature.size);
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var fee = Amount().deserialize(buffer);
		buffer = buffer.sublist(fee.size);
		var deadline = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(deadline.size);
		var transactionsHash = Hash256().deserialize(buffer);
		buffer = buffer.sublist(transactionsHash.size);
		var payloadSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		var aggregateTransactionHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != aggregateTransactionHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($aggregateTransactionHeaderReserved_1)');
		}
		var transactions = ArrayHelpers.readVariableSizeElements(buffer.sublist(0, payloadSize), EmbeddedTransactionFactory(), 8, false).map((item) => item as IInnerTransaction).toList();
		buffer = buffer.sublist(payloadSize);
		var cosignatures = ArrayHelpers.readArray(buffer, Cosignature()).map((item) => item as Cosignature).toList();
		buffer = buffer.sublist(ArrayHelpers.size(cosignatures));

		var instance = AggregateBondedTransactionV1(
			signature: signature,
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			fee: fee,
			deadline: deadline,
			transactionsHash: transactionsHash,
			transactions: transactions,
			cosignatures: cosignatures,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signature.size, signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + fee.size, fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + deadline.size, deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + transactionsHash.size, transactionsHash.serialize());
		currentPos += transactionsHash.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(ArrayHelpers.size(transactions, 8, false), 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(aggregateTransactionHeaderReserved_1, 4));
		currentPos += 4;
		sort();
		var res_transactions = ArrayHelpers.writeVariableSizeElements(buffer, transactions, 8, currentPos, false);
		currentPos = res_transactions.item2;
		buffer = res_transactions.item1;
		sort();
		var res_cosignatures = ArrayHelpers.writeArray(buffer, cosignatures, currentPos);
		currentPos = res_cosignatures.item2;
		buffer = res_cosignatures.item1;
		return buffer;
	}

	@override
	String toString() {
		var result = 'AggregateBondedTransactionV1(';
		result += 'signature: "${signature.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'fee: "${fee.toString()}", ';
		result += 'deadline: "${deadline.toString()}", ';
		result += 'transactionsHash: "${transactionsHash.toString()}", ';
		result += 'transactions: "${transactions.map((e) => e.toString()).toList()}", ';
		result += 'cosignatures: "${cosignatures.map((e) => e.toString()).toList()}", ';
		result += ')';
		return result;
	}
}


class AggregateBondedTransactionV2 implements ISerializable, ITransaction {
	static const int TRANSACTION_VERSION = 2;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.AGGREGATE_BONDED.value);

	static const Map<String, String> TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'transactionsHash': 'pod:Hash256',
		'transactions': 'array[EmbeddedTransaction]',
		'cosignatures': 'array[Cosignature]'
	};

	@override
	Signature signature = Signature();
	@override
	PublicKey signerPublicKey = PublicKey();
	int version = AggregateBondedTransactionV2.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	TransactionType type = AggregateBondedTransactionV2.TRANSACTION_TYPE;
	Amount fee = Amount();
	Timestamp deadline = Timestamp();
	Hash256 transactionsHash = Hash256();
	List<IInnerTransaction> transactions = [];
	List<Cosignature> cosignatures = [];
	final int verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field
	final int aggregateTransactionHeaderReserved_1 = 0; // reserved field

	AggregateBondedTransactionV2({ 
	Signature? signature,
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	Amount? fee,
	Timestamp? deadline,
	Hash256? transactionsHash,
	List<IInnerTransaction>? transactions,
	List<Cosignature>? cosignatures
	}) {
		this.signature = signature ?? Signature();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? AggregateBondedTransactionV2.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? AggregateBondedTransactionV2.TRANSACTION_TYPE;
		this.fee = fee ?? Amount();
		this.deadline = deadline ?? Timestamp();
		this.transactionsHash = transactionsHash ?? Hash256();
		this.transactions = transactions ?? [];
		this.cosignatures = cosignatures ?? [];
	}

	@override
	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signature.size;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += fee.size;
		size += deadline.size;
		size += transactionsHash.size;
		size += 4;
		size += 4;
		size += ArrayHelpers.size(transactions, 8, false);
		size += ArrayHelpers.size(cosignatures);
		return size;
	}

	@override
	AggregateBondedTransactionV2 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var verifiableEntityHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != verifiableEntityHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($verifiableEntityHeaderReserved_1)');
		}
		var signature = Signature().deserialize(buffer);
		buffer = buffer.sublist(signature.size);
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var fee = Amount().deserialize(buffer);
		buffer = buffer.sublist(fee.size);
		var deadline = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(deadline.size);
		var transactionsHash = Hash256().deserialize(buffer);
		buffer = buffer.sublist(transactionsHash.size);
		var payloadSize = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		var aggregateTransactionHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != aggregateTransactionHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($aggregateTransactionHeaderReserved_1)');
		}
		var transactions = ArrayHelpers.readVariableSizeElements(buffer.sublist(0, payloadSize), EmbeddedTransactionFactory(), 8, false).map((item) => item as IInnerTransaction).toList();
		buffer = buffer.sublist(payloadSize);
		var cosignatures = ArrayHelpers.readArray(buffer, Cosignature()).map((item) => item as Cosignature).toList();
		buffer = buffer.sublist(ArrayHelpers.size(cosignatures));

		var instance = AggregateBondedTransactionV2(
			signature: signature,
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			fee: fee,
			deadline: deadline,
			transactionsHash: transactionsHash,
			transactions: transactions,
			cosignatures: cosignatures,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signature.size, signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + fee.size, fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + deadline.size, deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + transactionsHash.size, transactionsHash.serialize());
		currentPos += transactionsHash.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(ArrayHelpers.size(transactions, 8, false), 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(aggregateTransactionHeaderReserved_1, 4));
		currentPos += 4;
		sort();
		var res_transactions = ArrayHelpers.writeVariableSizeElements(buffer, transactions, 8, currentPos, false);
		currentPos = res_transactions.item2;
		buffer = res_transactions.item1;
		sort();
		var res_cosignatures = ArrayHelpers.writeArray(buffer, cosignatures, currentPos);
		currentPos = res_cosignatures.item2;
		buffer = res_cosignatures.item1;
		return buffer;
	}

	@override
	String toString() {
		var result = 'AggregateBondedTransactionV2(';
		result += 'signature: "${signature.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'fee: "${fee.toString()}", ';
		result += 'deadline: "${deadline.toString()}", ';
		result += 'transactionsHash: "${transactionsHash.toString()}", ';
		result += 'transactions: "${transactions.map((e) => e.toString()).toList()}", ';
		result += 'cosignatures: "${cosignatures.map((e) => e.toString()).toList()}", ';
		result += ')';
		return result;
	}
}


class VotingKeyLinkTransactionV1 implements ISerializable, ITransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.VOTING_KEY_LINK.value);

	static const Map<String, String> TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'linkedPublicKey': 'pod:VotingPublicKey',
		'startEpoch': 'pod:FinalizationEpoch',
		'endEpoch': 'pod:FinalizationEpoch',
		'linkAction': 'enum:LinkAction'
	};

	@override
	Signature signature = Signature();
	@override
	PublicKey signerPublicKey = PublicKey();
	int version = VotingKeyLinkTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	TransactionType type = VotingKeyLinkTransactionV1.TRANSACTION_TYPE;
	Amount fee = Amount();
	Timestamp deadline = Timestamp();
	VotingPublicKey linkedPublicKey = VotingPublicKey();
	FinalizationEpoch startEpoch = FinalizationEpoch();
	FinalizationEpoch endEpoch = FinalizationEpoch();
	LinkAction linkAction = LinkAction.UNLINK;
	final int verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field

	VotingKeyLinkTransactionV1({ 
	Signature? signature,
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	Amount? fee,
	Timestamp? deadline,
	VotingPublicKey? linkedPublicKey,
	FinalizationEpoch? startEpoch,
	FinalizationEpoch? endEpoch,
	LinkAction? linkAction
	}) {
		this.signature = signature ?? Signature();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? VotingKeyLinkTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? VotingKeyLinkTransactionV1.TRANSACTION_TYPE;
		this.fee = fee ?? Amount();
		this.deadline = deadline ?? Timestamp();
		this.linkedPublicKey = linkedPublicKey ?? VotingPublicKey();
		this.startEpoch = startEpoch ?? FinalizationEpoch();
		this.endEpoch = endEpoch ?? FinalizationEpoch();
		this.linkAction = linkAction ?? LinkAction.UNLINK;
	}

	@override
	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signature.size;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += fee.size;
		size += deadline.size;
		size += linkedPublicKey.size;
		size += startEpoch.size;
		size += endEpoch.size;
		size += linkAction.size;
		return size;
	}

	@override
	VotingKeyLinkTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var verifiableEntityHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != verifiableEntityHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($verifiableEntityHeaderReserved_1)');
		}
		var signature = Signature().deserialize(buffer);
		buffer = buffer.sublist(signature.size);
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var fee = Amount().deserialize(buffer);
		buffer = buffer.sublist(fee.size);
		var deadline = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(deadline.size);
		var linkedPublicKey = VotingPublicKey().deserialize(buffer);
		buffer = buffer.sublist(linkedPublicKey.size);
		var startEpoch = FinalizationEpoch().deserialize(buffer);
		buffer = buffer.sublist(startEpoch.size);
		var endEpoch = FinalizationEpoch().deserialize(buffer);
		buffer = buffer.sublist(endEpoch.size);
		var linkAction = LinkAction().deserialize(buffer);
		buffer = buffer.sublist(linkAction.size);

		var instance = VotingKeyLinkTransactionV1(
			signature: signature,
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			fee: fee,
			deadline: deadline,
			linkedPublicKey: linkedPublicKey,
			startEpoch: startEpoch,
			endEpoch: endEpoch,
			linkAction: linkAction,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signature.size, signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + fee.size, fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + deadline.size, deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + linkedPublicKey.size, linkedPublicKey.serialize());
		currentPos += linkedPublicKey.size;
		buffer.setRange(currentPos, currentPos + startEpoch.size, startEpoch.serialize());
		currentPos += startEpoch.size;
		buffer.setRange(currentPos, currentPos + endEpoch.size, endEpoch.serialize());
		currentPos += endEpoch.size;
		buffer.setRange(currentPos, currentPos + linkAction.size, linkAction.serialize());
		currentPos += linkAction.size;
		return buffer;
	}

	@override
	String toString() {
		var result = 'VotingKeyLinkTransactionV1(';
		result += 'signature: "${signature.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'fee: "${fee.toString()}", ';
		result += 'deadline: "${deadline.toString()}", ';
		result += 'linkedPublicKey: "${linkedPublicKey.toString()}", ';
		result += 'startEpoch: "${startEpoch.toString()}", ';
		result += 'endEpoch: "${endEpoch.toString()}", ';
		result += 'linkAction: "${linkAction.toString()}", ';
		result += ')';
		return result;
	}
}


class EmbeddedVotingKeyLinkTransactionV1 implements ISerializable, IInnerTransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.VOTING_KEY_LINK.value);

	static const Map<String, String> TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'linkedPublicKey': 'pod:VotingPublicKey',
		'startEpoch': 'pod:FinalizationEpoch',
		'endEpoch': 'pod:FinalizationEpoch',
		'linkAction': 'enum:LinkAction'
	};

	PublicKey signerPublicKey = PublicKey();
	int version = EmbeddedVotingKeyLinkTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	TransactionType type = EmbeddedVotingKeyLinkTransactionV1.TRANSACTION_TYPE;
	VotingPublicKey linkedPublicKey = VotingPublicKey();
	FinalizationEpoch startEpoch = FinalizationEpoch();
	FinalizationEpoch endEpoch = FinalizationEpoch();
	LinkAction linkAction = LinkAction.UNLINK;
	final int embeddedTransactionHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field

	EmbeddedVotingKeyLinkTransactionV1({ 
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	VotingPublicKey? linkedPublicKey,
	FinalizationEpoch? startEpoch,
	FinalizationEpoch? endEpoch,
	LinkAction? linkAction
	}) {
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? EmbeddedVotingKeyLinkTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? EmbeddedVotingKeyLinkTransactionV1.TRANSACTION_TYPE;
		this.linkedPublicKey = linkedPublicKey ?? VotingPublicKey();
		this.startEpoch = startEpoch ?? FinalizationEpoch();
		this.endEpoch = endEpoch ?? FinalizationEpoch();
		this.linkAction = linkAction ?? LinkAction.UNLINK;
	}

	@override
	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += linkedPublicKey.size;
		size += startEpoch.size;
		size += endEpoch.size;
		size += linkAction.size;
		return size;
	}

	@override
	EmbeddedVotingKeyLinkTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var embeddedTransactionHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != embeddedTransactionHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($embeddedTransactionHeaderReserved_1)');
		}
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var linkedPublicKey = VotingPublicKey().deserialize(buffer);
		buffer = buffer.sublist(linkedPublicKey.size);
		var startEpoch = FinalizationEpoch().deserialize(buffer);
		buffer = buffer.sublist(startEpoch.size);
		var endEpoch = FinalizationEpoch().deserialize(buffer);
		buffer = buffer.sublist(endEpoch.size);
		var linkAction = LinkAction().deserialize(buffer);
		buffer = buffer.sublist(linkAction.size);

		var instance = EmbeddedVotingKeyLinkTransactionV1(
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			linkedPublicKey: linkedPublicKey,
			startEpoch: startEpoch,
			endEpoch: endEpoch,
			linkAction: linkAction,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(embeddedTransactionHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + linkedPublicKey.size, linkedPublicKey.serialize());
		currentPos += linkedPublicKey.size;
		buffer.setRange(currentPos, currentPos + startEpoch.size, startEpoch.serialize());
		currentPos += startEpoch.size;
		buffer.setRange(currentPos, currentPos + endEpoch.size, endEpoch.serialize());
		currentPos += endEpoch.size;
		buffer.setRange(currentPos, currentPos + linkAction.size, linkAction.serialize());
		currentPos += linkAction.size;
		return buffer;
	}

	@override
	String toString() {
		var result = 'EmbeddedVotingKeyLinkTransactionV1(';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'linkedPublicKey: "${linkedPublicKey.toString()}", ';
		result += 'startEpoch: "${startEpoch.toString()}", ';
		result += 'endEpoch: "${endEpoch.toString()}", ';
		result += 'linkAction: "${linkAction.toString()}", ';
		result += ')';
		return result;
	}
}


class VrfKeyLinkTransactionV1 implements ISerializable, ITransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.VRF_KEY_LINK.value);

	static const Map<String, String> TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'linkedPublicKey': 'pod:PublicKey',
		'linkAction': 'enum:LinkAction'
	};

	@override
	Signature signature = Signature();
	@override
	PublicKey signerPublicKey = PublicKey();
	int version = VrfKeyLinkTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	TransactionType type = VrfKeyLinkTransactionV1.TRANSACTION_TYPE;
	Amount fee = Amount();
	Timestamp deadline = Timestamp();
	PublicKey linkedPublicKey = PublicKey();
	LinkAction linkAction = LinkAction.UNLINK;
	final int verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field

	VrfKeyLinkTransactionV1({ 
	Signature? signature,
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	Amount? fee,
	Timestamp? deadline,
	PublicKey? linkedPublicKey,
	LinkAction? linkAction
	}) {
		this.signature = signature ?? Signature();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? VrfKeyLinkTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? VrfKeyLinkTransactionV1.TRANSACTION_TYPE;
		this.fee = fee ?? Amount();
		this.deadline = deadline ?? Timestamp();
		this.linkedPublicKey = linkedPublicKey ?? PublicKey();
		this.linkAction = linkAction ?? LinkAction.UNLINK;
	}

	@override
	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signature.size;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += fee.size;
		size += deadline.size;
		size += linkedPublicKey.size;
		size += linkAction.size;
		return size;
	}

	@override
	VrfKeyLinkTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var verifiableEntityHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != verifiableEntityHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($verifiableEntityHeaderReserved_1)');
		}
		var signature = Signature().deserialize(buffer);
		buffer = buffer.sublist(signature.size);
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var fee = Amount().deserialize(buffer);
		buffer = buffer.sublist(fee.size);
		var deadline = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(deadline.size);
		var linkedPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(linkedPublicKey.size);
		var linkAction = LinkAction().deserialize(buffer);
		buffer = buffer.sublist(linkAction.size);

		var instance = VrfKeyLinkTransactionV1(
			signature: signature,
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			fee: fee,
			deadline: deadline,
			linkedPublicKey: linkedPublicKey,
			linkAction: linkAction,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signature.size, signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + fee.size, fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + deadline.size, deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + linkedPublicKey.size, linkedPublicKey.serialize());
		currentPos += linkedPublicKey.size;
		buffer.setRange(currentPos, currentPos + linkAction.size, linkAction.serialize());
		currentPos += linkAction.size;
		return buffer;
	}

	@override
	String toString() {
		var result = 'VrfKeyLinkTransactionV1(';
		result += 'signature: "${signature.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'fee: "${fee.toString()}", ';
		result += 'deadline: "${deadline.toString()}", ';
		result += 'linkedPublicKey: "${linkedPublicKey.toString()}", ';
		result += 'linkAction: "${linkAction.toString()}", ';
		result += ')';
		return result;
	}
}


class EmbeddedVrfKeyLinkTransactionV1 implements ISerializable, IInnerTransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.VRF_KEY_LINK.value);

	static const Map<String, String> TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'linkedPublicKey': 'pod:PublicKey',
		'linkAction': 'enum:LinkAction'
	};

	PublicKey signerPublicKey = PublicKey();
	int version = EmbeddedVrfKeyLinkTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	TransactionType type = EmbeddedVrfKeyLinkTransactionV1.TRANSACTION_TYPE;
	PublicKey linkedPublicKey = PublicKey();
	LinkAction linkAction = LinkAction.UNLINK;
	final int embeddedTransactionHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field

	EmbeddedVrfKeyLinkTransactionV1({ 
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	PublicKey? linkedPublicKey,
	LinkAction? linkAction
	}) {
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? EmbeddedVrfKeyLinkTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? EmbeddedVrfKeyLinkTransactionV1.TRANSACTION_TYPE;
		this.linkedPublicKey = linkedPublicKey ?? PublicKey();
		this.linkAction = linkAction ?? LinkAction.UNLINK;
	}

	@override
	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += linkedPublicKey.size;
		size += linkAction.size;
		return size;
	}

	@override
	EmbeddedVrfKeyLinkTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var embeddedTransactionHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != embeddedTransactionHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($embeddedTransactionHeaderReserved_1)');
		}
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var linkedPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(linkedPublicKey.size);
		var linkAction = LinkAction().deserialize(buffer);
		buffer = buffer.sublist(linkAction.size);

		var instance = EmbeddedVrfKeyLinkTransactionV1(
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			linkedPublicKey: linkedPublicKey,
			linkAction: linkAction,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(embeddedTransactionHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + linkedPublicKey.size, linkedPublicKey.serialize());
		currentPos += linkedPublicKey.size;
		buffer.setRange(currentPos, currentPos + linkAction.size, linkAction.serialize());
		currentPos += linkAction.size;
		return buffer;
	}

	@override
	String toString() {
		var result = 'EmbeddedVrfKeyLinkTransactionV1(';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'linkedPublicKey: "${linkedPublicKey.toString()}", ';
		result += 'linkAction: "${linkAction.toString()}", ';
		result += ')';
		return result;
	}
}


class HashLockTransactionV1 implements ISerializable, ITransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.HASH_LOCK.value);

	static const Map<String, String> TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'mosaic': 'struct:UnresolvedMosaic',
		'duration': 'pod:BlockDuration',
		'hash': 'pod:Hash256'
	};

	@override
	Signature signature = Signature();
	@override
	PublicKey signerPublicKey = PublicKey();
	int version = HashLockTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	TransactionType type = HashLockTransactionV1.TRANSACTION_TYPE;
	Amount fee = Amount();
	Timestamp deadline = Timestamp();
	UnresolvedMosaic mosaic = UnresolvedMosaic();
	BlockDuration duration = BlockDuration();
	Hash256 hash = Hash256();
	final int verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field

	HashLockTransactionV1({ 
	Signature? signature,
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	Amount? fee,
	Timestamp? deadline,
	UnresolvedMosaic? mosaic,
	BlockDuration? duration,
	Hash256? hash
	}) {
		this.signature = signature ?? Signature();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? HashLockTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? HashLockTransactionV1.TRANSACTION_TYPE;
		this.fee = fee ?? Amount();
		this.deadline = deadline ?? Timestamp();
		this.mosaic = mosaic ?? UnresolvedMosaic();
		this.duration = duration ?? BlockDuration();
		this.hash = hash ?? Hash256();
	}

	@override
	void sort() {
		mosaic.sort();
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signature.size;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += fee.size;
		size += deadline.size;
		size += mosaic.size;
		size += duration.size;
		size += hash.size;
		return size;
	}

	@override
	HashLockTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var verifiableEntityHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != verifiableEntityHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($verifiableEntityHeaderReserved_1)');
		}
		var signature = Signature().deserialize(buffer);
		buffer = buffer.sublist(signature.size);
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var fee = Amount().deserialize(buffer);
		buffer = buffer.sublist(fee.size);
		var deadline = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(deadline.size);
		var mosaic = UnresolvedMosaic().deserialize(buffer);
		buffer = buffer.sublist(mosaic.size);
		var duration = BlockDuration().deserialize(buffer);
		buffer = buffer.sublist(duration.size);
		var hash = Hash256().deserialize(buffer);
		buffer = buffer.sublist(hash.size);

		var instance = HashLockTransactionV1(
			signature: signature,
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			fee: fee,
			deadline: deadline,
			mosaic: mosaic,
			duration: duration,
			hash: hash,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signature.size, signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + fee.size, fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + deadline.size, deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + mosaic.size, mosaic.serialize());
		currentPos += mosaic.size;
		buffer.setRange(currentPos, currentPos + duration.size, duration.serialize());
		currentPos += duration.size;
		buffer.setRange(currentPos, currentPos + hash.size, hash.serialize());
		currentPos += hash.size;
		return buffer;
	}

	@override
	String toString() {
		var result = 'HashLockTransactionV1(';
		result += 'signature: "${signature.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'fee: "${fee.toString()}", ';
		result += 'deadline: "${deadline.toString()}", ';
		result += 'mosaic: "${mosaic.toString()}", ';
		result += 'duration: "${duration.toString()}", ';
		result += 'hash: "${hash.toString()}", ';
		result += ')';
		return result;
	}
}


class EmbeddedHashLockTransactionV1 implements ISerializable, IInnerTransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.HASH_LOCK.value);

	static const Map<String, String> TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'mosaic': 'struct:UnresolvedMosaic',
		'duration': 'pod:BlockDuration',
		'hash': 'pod:Hash256'
	};

	PublicKey signerPublicKey = PublicKey();
	int version = EmbeddedHashLockTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	TransactionType type = EmbeddedHashLockTransactionV1.TRANSACTION_TYPE;
	UnresolvedMosaic mosaic = UnresolvedMosaic();
	BlockDuration duration = BlockDuration();
	Hash256 hash = Hash256();
	final int embeddedTransactionHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field

	EmbeddedHashLockTransactionV1({ 
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	UnresolvedMosaic? mosaic,
	BlockDuration? duration,
	Hash256? hash
	}) {
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? EmbeddedHashLockTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? EmbeddedHashLockTransactionV1.TRANSACTION_TYPE;
		this.mosaic = mosaic ?? UnresolvedMosaic();
		this.duration = duration ?? BlockDuration();
		this.hash = hash ?? Hash256();
	}

	@override
	void sort() {
		mosaic.sort();
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += mosaic.size;
		size += duration.size;
		size += hash.size;
		return size;
	}

	@override
	EmbeddedHashLockTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var embeddedTransactionHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != embeddedTransactionHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($embeddedTransactionHeaderReserved_1)');
		}
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var mosaic = UnresolvedMosaic().deserialize(buffer);
		buffer = buffer.sublist(mosaic.size);
		var duration = BlockDuration().deserialize(buffer);
		buffer = buffer.sublist(duration.size);
		var hash = Hash256().deserialize(buffer);
		buffer = buffer.sublist(hash.size);

		var instance = EmbeddedHashLockTransactionV1(
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			mosaic: mosaic,
			duration: duration,
			hash: hash,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(embeddedTransactionHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + mosaic.size, mosaic.serialize());
		currentPos += mosaic.size;
		buffer.setRange(currentPos, currentPos + duration.size, duration.serialize());
		currentPos += duration.size;
		buffer.setRange(currentPos, currentPos + hash.size, hash.serialize());
		currentPos += hash.size;
		return buffer;
	}

	@override
	String toString() {
		var result = 'EmbeddedHashLockTransactionV1(';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'mosaic: "${mosaic.toString()}", ';
		result += 'duration: "${duration.toString()}", ';
		result += 'hash: "${hash.toString()}", ';
		result += ')';
		return result;
	}
}


class LockHashAlgorithm implements ISerializable {
	static final SHA3_256 = LockHashAlgorithm(0);
	static final HASH_160 = LockHashAlgorithm(1);
	static final HASH_256 = LockHashAlgorithm(2);

	int value = 0;

	static final _flags = {
		0: 'SHA3_256',
		1: 'HASH_160',
		2: 'HASH_256',
	};

	LockHashAlgorithm([int? _value]) {
		value = _value ?? 0;
	}

	@override
	int get size {
		return 1;
	}

	@override
	LockHashAlgorithm deserialize(Uint8List payload) {
		var byteData = ByteData.sublistView(payload);
		return LockHashAlgorithm(byteData.getUint8(0));
	}

	@override
	Uint8List serialize() {
		var byteData = ByteData(1)..setUint8(0, value);
		return byteData.buffer.asUint8List();
	}

	@override
	String toString() {
		return 'LockHashAlgorithm.${_flags[value]}';
	}
}


class SecretLockTransactionV1 implements ISerializable, ITransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.SECRET_LOCK.value);

	static const Map<String, String> TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'recipientAddress': 'pod:UnresolvedAddress',
		'secret': 'pod:Hash256',
		'mosaic': 'struct:UnresolvedMosaic',
		'duration': 'pod:BlockDuration',
		'hashAlgorithm': 'enum:LockHashAlgorithm'
	};

	@override
	Signature signature = Signature();
	@override
	PublicKey signerPublicKey = PublicKey();
	int version = SecretLockTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	TransactionType type = SecretLockTransactionV1.TRANSACTION_TYPE;
	Amount fee = Amount();
	Timestamp deadline = Timestamp();
	UnresolvedAddress recipientAddress = UnresolvedAddress();
	Hash256 secret = Hash256();
	UnresolvedMosaic mosaic = UnresolvedMosaic();
	BlockDuration duration = BlockDuration();
	LockHashAlgorithm hashAlgorithm = LockHashAlgorithm.SHA3_256;
	final int verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field

	SecretLockTransactionV1({ 
	Signature? signature,
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	Amount? fee,
	Timestamp? deadline,
	UnresolvedAddress? recipientAddress,
	Hash256? secret,
	UnresolvedMosaic? mosaic,
	BlockDuration? duration,
	LockHashAlgorithm? hashAlgorithm
	}) {
		this.signature = signature ?? Signature();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? SecretLockTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? SecretLockTransactionV1.TRANSACTION_TYPE;
		this.fee = fee ?? Amount();
		this.deadline = deadline ?? Timestamp();
		this.recipientAddress = recipientAddress ?? UnresolvedAddress();
		this.secret = secret ?? Hash256();
		this.mosaic = mosaic ?? UnresolvedMosaic();
		this.duration = duration ?? BlockDuration();
		this.hashAlgorithm = hashAlgorithm ?? LockHashAlgorithm.SHA3_256;
	}

	@override
	void sort() {
		mosaic.sort();
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signature.size;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += fee.size;
		size += deadline.size;
		size += recipientAddress.size;
		size += secret.size;
		size += mosaic.size;
		size += duration.size;
		size += hashAlgorithm.size;
		return size;
	}

	@override
	SecretLockTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var verifiableEntityHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != verifiableEntityHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($verifiableEntityHeaderReserved_1)');
		}
		var signature = Signature().deserialize(buffer);
		buffer = buffer.sublist(signature.size);
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var fee = Amount().deserialize(buffer);
		buffer = buffer.sublist(fee.size);
		var deadline = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(deadline.size);
		var recipientAddress = UnresolvedAddress().deserialize(buffer);
		buffer = buffer.sublist(recipientAddress.size);
		var secret = Hash256().deserialize(buffer);
		buffer = buffer.sublist(secret.size);
		var mosaic = UnresolvedMosaic().deserialize(buffer);
		buffer = buffer.sublist(mosaic.size);
		var duration = BlockDuration().deserialize(buffer);
		buffer = buffer.sublist(duration.size);
		var hashAlgorithm = LockHashAlgorithm().deserialize(buffer);
		buffer = buffer.sublist(hashAlgorithm.size);

		var instance = SecretLockTransactionV1(
			signature: signature,
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			fee: fee,
			deadline: deadline,
			recipientAddress: recipientAddress,
			secret: secret,
			mosaic: mosaic,
			duration: duration,
			hashAlgorithm: hashAlgorithm,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signature.size, signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + fee.size, fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + deadline.size, deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + recipientAddress.size, recipientAddress.serialize());
		currentPos += recipientAddress.size;
		buffer.setRange(currentPos, currentPos + secret.size, secret.serialize());
		currentPos += secret.size;
		buffer.setRange(currentPos, currentPos + mosaic.size, mosaic.serialize());
		currentPos += mosaic.size;
		buffer.setRange(currentPos, currentPos + duration.size, duration.serialize());
		currentPos += duration.size;
		buffer.setRange(currentPos, currentPos + hashAlgorithm.size, hashAlgorithm.serialize());
		currentPos += hashAlgorithm.size;
		return buffer;
	}

	@override
	String toString() {
		var result = 'SecretLockTransactionV1(';
		result += 'signature: "${signature.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'fee: "${fee.toString()}", ';
		result += 'deadline: "${deadline.toString()}", ';
		result += 'recipientAddress: "${recipientAddress.toString()}", ';
		result += 'secret: "${secret.toString()}", ';
		result += 'mosaic: "${mosaic.toString()}", ';
		result += 'duration: "${duration.toString()}", ';
		result += 'hashAlgorithm: "${hashAlgorithm.toString()}", ';
		result += ')';
		return result;
	}
}


class EmbeddedSecretLockTransactionV1 implements ISerializable, IInnerTransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.SECRET_LOCK.value);

	static const Map<String, String> TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'recipientAddress': 'pod:UnresolvedAddress',
		'secret': 'pod:Hash256',
		'mosaic': 'struct:UnresolvedMosaic',
		'duration': 'pod:BlockDuration',
		'hashAlgorithm': 'enum:LockHashAlgorithm'
	};

	PublicKey signerPublicKey = PublicKey();
	int version = EmbeddedSecretLockTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	TransactionType type = EmbeddedSecretLockTransactionV1.TRANSACTION_TYPE;
	UnresolvedAddress recipientAddress = UnresolvedAddress();
	Hash256 secret = Hash256();
	UnresolvedMosaic mosaic = UnresolvedMosaic();
	BlockDuration duration = BlockDuration();
	LockHashAlgorithm hashAlgorithm = LockHashAlgorithm.SHA3_256;
	final int embeddedTransactionHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field

	EmbeddedSecretLockTransactionV1({ 
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	UnresolvedAddress? recipientAddress,
	Hash256? secret,
	UnresolvedMosaic? mosaic,
	BlockDuration? duration,
	LockHashAlgorithm? hashAlgorithm
	}) {
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? EmbeddedSecretLockTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? EmbeddedSecretLockTransactionV1.TRANSACTION_TYPE;
		this.recipientAddress = recipientAddress ?? UnresolvedAddress();
		this.secret = secret ?? Hash256();
		this.mosaic = mosaic ?? UnresolvedMosaic();
		this.duration = duration ?? BlockDuration();
		this.hashAlgorithm = hashAlgorithm ?? LockHashAlgorithm.SHA3_256;
	}

	@override
	void sort() {
		mosaic.sort();
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += recipientAddress.size;
		size += secret.size;
		size += mosaic.size;
		size += duration.size;
		size += hashAlgorithm.size;
		return size;
	}

	@override
	EmbeddedSecretLockTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var embeddedTransactionHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != embeddedTransactionHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($embeddedTransactionHeaderReserved_1)');
		}
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var recipientAddress = UnresolvedAddress().deserialize(buffer);
		buffer = buffer.sublist(recipientAddress.size);
		var secret = Hash256().deserialize(buffer);
		buffer = buffer.sublist(secret.size);
		var mosaic = UnresolvedMosaic().deserialize(buffer);
		buffer = buffer.sublist(mosaic.size);
		var duration = BlockDuration().deserialize(buffer);
		buffer = buffer.sublist(duration.size);
		var hashAlgorithm = LockHashAlgorithm().deserialize(buffer);
		buffer = buffer.sublist(hashAlgorithm.size);

		var instance = EmbeddedSecretLockTransactionV1(
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			recipientAddress: recipientAddress,
			secret: secret,
			mosaic: mosaic,
			duration: duration,
			hashAlgorithm: hashAlgorithm,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(embeddedTransactionHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + recipientAddress.size, recipientAddress.serialize());
		currentPos += recipientAddress.size;
		buffer.setRange(currentPos, currentPos + secret.size, secret.serialize());
		currentPos += secret.size;
		buffer.setRange(currentPos, currentPos + mosaic.size, mosaic.serialize());
		currentPos += mosaic.size;
		buffer.setRange(currentPos, currentPos + duration.size, duration.serialize());
		currentPos += duration.size;
		buffer.setRange(currentPos, currentPos + hashAlgorithm.size, hashAlgorithm.serialize());
		currentPos += hashAlgorithm.size;
		return buffer;
	}

	@override
	String toString() {
		var result = 'EmbeddedSecretLockTransactionV1(';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'recipientAddress: "${recipientAddress.toString()}", ';
		result += 'secret: "${secret.toString()}", ';
		result += 'mosaic: "${mosaic.toString()}", ';
		result += 'duration: "${duration.toString()}", ';
		result += 'hashAlgorithm: "${hashAlgorithm.toString()}", ';
		result += ')';
		return result;
	}
}


class SecretProofTransactionV1 implements ISerializable, ITransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.SECRET_PROOF.value);

	static const Map<String, String> TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'recipientAddress': 'pod:UnresolvedAddress',
		'secret': 'pod:Hash256',
		'hashAlgorithm': 'enum:LockHashAlgorithm',
		'proof': 'bytes_array'
	};

	@override
	Signature signature = Signature();
	@override
	PublicKey signerPublicKey = PublicKey();
	int version = SecretProofTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	TransactionType type = SecretProofTransactionV1.TRANSACTION_TYPE;
	Amount fee = Amount();
	Timestamp deadline = Timestamp();
	UnresolvedAddress recipientAddress = UnresolvedAddress();
	Hash256 secret = Hash256();
	LockHashAlgorithm hashAlgorithm = LockHashAlgorithm.SHA3_256;
	Uint8List proof = Uint8List(0);
	final int verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field

	SecretProofTransactionV1({ 
	Signature? signature,
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	Amount? fee,
	Timestamp? deadline,
	UnresolvedAddress? recipientAddress,
	Hash256? secret,
	LockHashAlgorithm? hashAlgorithm,
	Uint8List? proof
	}) {
		this.signature = signature ?? Signature();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? SecretProofTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? SecretProofTransactionV1.TRANSACTION_TYPE;
		this.fee = fee ?? Amount();
		this.deadline = deadline ?? Timestamp();
		this.recipientAddress = recipientAddress ?? UnresolvedAddress();
		this.secret = secret ?? Hash256();
		this.hashAlgorithm = hashAlgorithm ?? LockHashAlgorithm.SHA3_256;
		this.proof = proof ?? Uint8List(0);
	}

	@override
	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signature.size;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += fee.size;
		size += deadline.size;
		size += recipientAddress.size;
		size += secret.size;
		size += 2;
		size += hashAlgorithm.size;
		size += proof.lengthInBytes;
		return size;
	}

	@override
	SecretProofTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var verifiableEntityHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != verifiableEntityHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($verifiableEntityHeaderReserved_1)');
		}
		var signature = Signature().deserialize(buffer);
		buffer = buffer.sublist(signature.size);
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var fee = Amount().deserialize(buffer);
		buffer = buffer.sublist(fee.size);
		var deadline = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(deadline.size);
		var recipientAddress = UnresolvedAddress().deserialize(buffer);
		buffer = buffer.sublist(recipientAddress.size);
		var secret = Hash256().deserialize(buffer);
		buffer = buffer.sublist(secret.size);
		var proofSize = bytesToInt(buffer.sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		var hashAlgorithm = LockHashAlgorithm().deserialize(buffer);
		buffer = buffer.sublist(hashAlgorithm.size);
		var proof = Uint8List.fromList(buffer.sublist(0, proofSize));
		buffer = buffer.sublist(proofSize);

		var instance = SecretProofTransactionV1(
			signature: signature,
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			fee: fee,
			deadline: deadline,
			recipientAddress: recipientAddress,
			secret: secret,
			hashAlgorithm: hashAlgorithm,
			proof: proof,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signature.size, signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + fee.size, fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + deadline.size, deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + recipientAddress.size, recipientAddress.serialize());
		currentPos += recipientAddress.size;
		buffer.setRange(currentPos, currentPos + secret.size, secret.serialize());
		currentPos += secret.size;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(proof.length, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + hashAlgorithm.size, hashAlgorithm.serialize());
		currentPos += hashAlgorithm.size;
		buffer.setRange(currentPos, currentPos + proof.lengthInBytes, proof);
		currentPos += proof.lengthInBytes;
		return buffer;
	}

	@override
	String toString() {
		var result = 'SecretProofTransactionV1(';
		result += 'signature: "${signature.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'fee: "${fee.toString()}", ';
		result += 'deadline: "${deadline.toString()}", ';
		result += 'recipientAddress: "${recipientAddress.toString()}", ';
		result += 'secret: "${secret.toString()}", ';
		result += 'hashAlgorithm: "${hashAlgorithm.toString()}", ';
		result += 'proof: "${bytesToHex(proof)}", ';
		result += ')';
		return result;
	}
}


class EmbeddedSecretProofTransactionV1 implements ISerializable, IInnerTransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.SECRET_PROOF.value);

	static const Map<String, String> TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'recipientAddress': 'pod:UnresolvedAddress',
		'secret': 'pod:Hash256',
		'hashAlgorithm': 'enum:LockHashAlgorithm',
		'proof': 'bytes_array'
	};

	PublicKey signerPublicKey = PublicKey();
	int version = EmbeddedSecretProofTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	TransactionType type = EmbeddedSecretProofTransactionV1.TRANSACTION_TYPE;
	UnresolvedAddress recipientAddress = UnresolvedAddress();
	Hash256 secret = Hash256();
	LockHashAlgorithm hashAlgorithm = LockHashAlgorithm.SHA3_256;
	Uint8List proof = Uint8List(0);
	final int embeddedTransactionHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field

	EmbeddedSecretProofTransactionV1({ 
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	UnresolvedAddress? recipientAddress,
	Hash256? secret,
	LockHashAlgorithm? hashAlgorithm,
	Uint8List? proof
	}) {
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? EmbeddedSecretProofTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? EmbeddedSecretProofTransactionV1.TRANSACTION_TYPE;
		this.recipientAddress = recipientAddress ?? UnresolvedAddress();
		this.secret = secret ?? Hash256();
		this.hashAlgorithm = hashAlgorithm ?? LockHashAlgorithm.SHA3_256;
		this.proof = proof ?? Uint8List(0);
	}

	@override
	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += recipientAddress.size;
		size += secret.size;
		size += 2;
		size += hashAlgorithm.size;
		size += proof.lengthInBytes;
		return size;
	}

	@override
	EmbeddedSecretProofTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var embeddedTransactionHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != embeddedTransactionHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($embeddedTransactionHeaderReserved_1)');
		}
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var recipientAddress = UnresolvedAddress().deserialize(buffer);
		buffer = buffer.sublist(recipientAddress.size);
		var secret = Hash256().deserialize(buffer);
		buffer = buffer.sublist(secret.size);
		var proofSize = bytesToInt(buffer.sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		var hashAlgorithm = LockHashAlgorithm().deserialize(buffer);
		buffer = buffer.sublist(hashAlgorithm.size);
		var proof = Uint8List.fromList(buffer.sublist(0, proofSize));
		buffer = buffer.sublist(proofSize);

		var instance = EmbeddedSecretProofTransactionV1(
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			recipientAddress: recipientAddress,
			secret: secret,
			hashAlgorithm: hashAlgorithm,
			proof: proof,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(embeddedTransactionHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + recipientAddress.size, recipientAddress.serialize());
		currentPos += recipientAddress.size;
		buffer.setRange(currentPos, currentPos + secret.size, secret.serialize());
		currentPos += secret.size;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(proof.length, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + hashAlgorithm.size, hashAlgorithm.serialize());
		currentPos += hashAlgorithm.size;
		buffer.setRange(currentPos, currentPos + proof.lengthInBytes, proof);
		currentPos += proof.lengthInBytes;
		return buffer;
	}

	@override
	String toString() {
		var result = 'EmbeddedSecretProofTransactionV1(';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'recipientAddress: "${recipientAddress.toString()}", ';
		result += 'secret: "${secret.toString()}", ';
		result += 'hashAlgorithm: "${hashAlgorithm.toString()}", ';
		result += 'proof: "${bytesToHex(proof)}", ';
		result += ')';
		return result;
	}
}


class AccountMetadataTransactionV1 implements ISerializable, ITransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.ACCOUNT_METADATA.value);

	static const Map<String, String> TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'targetAddress': 'pod:UnresolvedAddress',
		'value': 'bytes_array'
	};

	@override
	Signature signature = Signature();
	@override
	PublicKey signerPublicKey = PublicKey();
	int version = AccountMetadataTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	TransactionType type = AccountMetadataTransactionV1.TRANSACTION_TYPE;
	Amount fee = Amount();
	Timestamp deadline = Timestamp();
	UnresolvedAddress targetAddress = UnresolvedAddress();
	BigInt scopedMetadataKey = BigInt.from(0);
	int valueSizeDelta = 0;
	Uint8List value = Uint8List(0);
	final int verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field

	AccountMetadataTransactionV1({ 
	Signature? signature,
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	Amount? fee,
	Timestamp? deadline,
	UnresolvedAddress? targetAddress,
	BigInt? scopedMetadataKey,
	int? valueSizeDelta,
	Uint8List? value
	}) {
		this.signature = signature ?? Signature();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? AccountMetadataTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? AccountMetadataTransactionV1.TRANSACTION_TYPE;
		this.fee = fee ?? Amount();
		this.deadline = deadline ?? Timestamp();
		this.targetAddress = targetAddress ?? UnresolvedAddress();
		this.scopedMetadataKey = scopedMetadataKey ?? BigInt.from(0);
		this.valueSizeDelta = valueSizeDelta ?? 0;
		this.value = value ?? Uint8List(0);
	}

	@override
	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signature.size;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += fee.size;
		size += deadline.size;
		size += targetAddress.size;
		size += 8;
		size += 2;
		size += 2;
		size += value.lengthInBytes;
		return size;
	}

	@override
	AccountMetadataTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var verifiableEntityHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != verifiableEntityHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($verifiableEntityHeaderReserved_1)');
		}
		var signature = Signature().deserialize(buffer);
		buffer = buffer.sublist(signature.size);
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var fee = Amount().deserialize(buffer);
		buffer = buffer.sublist(fee.size);
		var deadline = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(deadline.size);
		var targetAddress = UnresolvedAddress().deserialize(buffer);
		buffer = buffer.sublist(targetAddress.size);
		var scopedMetadataKey = bytesToInt(buffer.sublist(0, 8), 8);
		buffer = buffer.sublist(8);
		var valueSizeDelta = bytesToInt(buffer.sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		var valueSize = bytesToInt(buffer.sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		var value = Uint8List.fromList(buffer.sublist(0, valueSize));
		buffer = buffer.sublist(valueSize);

		var instance = AccountMetadataTransactionV1(
			signature: signature,
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			fee: fee,
			deadline: deadline,
			targetAddress: targetAddress,
			scopedMetadataKey: scopedMetadataKey,
			valueSizeDelta: valueSizeDelta,
			value: value,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signature.size, signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + fee.size, fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + deadline.size, deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + targetAddress.size, targetAddress.serialize());
		currentPos += targetAddress.size;
		buffer.setRange(currentPos, currentPos + 8, intToBytes(scopedMetadataKey, 8));
		currentPos += 8;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(valueSizeDelta, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(value.length, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + value.lengthInBytes, value);
		currentPos += value.lengthInBytes;
		return buffer;
	}

	@override
	String toString() {
		var result = 'AccountMetadataTransactionV1(';
		result += 'signature: "${signature.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'fee: "${fee.toString()}", ';
		result += 'deadline: "${deadline.toString()}", ';
		result += 'targetAddress: "${targetAddress.toString()}", ';
		result += 'scopedMetadataKey: "0x${intToHex(scopedMetadataKey)}", ';
		result += 'valueSizeDelta: "0x${intToHex(valueSizeDelta)}", ';
		result += 'value: "${bytesToHex(value)}", ';
		result += ')';
		return result;
	}
}


class EmbeddedAccountMetadataTransactionV1 implements ISerializable, IInnerTransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.ACCOUNT_METADATA.value);

	static const Map<String, String> TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'targetAddress': 'pod:UnresolvedAddress',
		'value': 'bytes_array'
	};

	PublicKey signerPublicKey = PublicKey();
	int version = EmbeddedAccountMetadataTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	TransactionType type = EmbeddedAccountMetadataTransactionV1.TRANSACTION_TYPE;
	UnresolvedAddress targetAddress = UnresolvedAddress();
	BigInt scopedMetadataKey = BigInt.from(0);
	int valueSizeDelta = 0;
	Uint8List value = Uint8List(0);
	final int embeddedTransactionHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field

	EmbeddedAccountMetadataTransactionV1({ 
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	UnresolvedAddress? targetAddress,
	BigInt? scopedMetadataKey,
	int? valueSizeDelta,
	Uint8List? value
	}) {
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? EmbeddedAccountMetadataTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? EmbeddedAccountMetadataTransactionV1.TRANSACTION_TYPE;
		this.targetAddress = targetAddress ?? UnresolvedAddress();
		this.scopedMetadataKey = scopedMetadataKey ?? BigInt.from(0);
		this.valueSizeDelta = valueSizeDelta ?? 0;
		this.value = value ?? Uint8List(0);
	}

	@override
	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += targetAddress.size;
		size += 8;
		size += 2;
		size += 2;
		size += value.lengthInBytes;
		return size;
	}

	@override
	EmbeddedAccountMetadataTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var embeddedTransactionHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != embeddedTransactionHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($embeddedTransactionHeaderReserved_1)');
		}
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var targetAddress = UnresolvedAddress().deserialize(buffer);
		buffer = buffer.sublist(targetAddress.size);
		var scopedMetadataKey = bytesToInt(buffer.sublist(0, 8), 8);
		buffer = buffer.sublist(8);
		var valueSizeDelta = bytesToInt(buffer.sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		var valueSize = bytesToInt(buffer.sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		var value = Uint8List.fromList(buffer.sublist(0, valueSize));
		buffer = buffer.sublist(valueSize);

		var instance = EmbeddedAccountMetadataTransactionV1(
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			targetAddress: targetAddress,
			scopedMetadataKey: scopedMetadataKey,
			valueSizeDelta: valueSizeDelta,
			value: value,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(embeddedTransactionHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + targetAddress.size, targetAddress.serialize());
		currentPos += targetAddress.size;
		buffer.setRange(currentPos, currentPos + 8, intToBytes(scopedMetadataKey, 8));
		currentPos += 8;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(valueSizeDelta, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(value.length, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + value.lengthInBytes, value);
		currentPos += value.lengthInBytes;
		return buffer;
	}

	@override
	String toString() {
		var result = 'EmbeddedAccountMetadataTransactionV1(';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'targetAddress: "${targetAddress.toString()}", ';
		result += 'scopedMetadataKey: "0x${intToHex(scopedMetadataKey)}", ';
		result += 'valueSizeDelta: "0x${intToHex(valueSizeDelta)}", ';
		result += 'value: "${bytesToHex(value)}", ';
		result += ')';
		return result;
	}
}


class MosaicMetadataTransactionV1 implements ISerializable, ITransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.MOSAIC_METADATA.value);

	static const Map<String, String> TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'targetAddress': 'pod:UnresolvedAddress',
		'targetMosaicId': 'pod:UnresolvedMosaicId',
		'value': 'bytes_array'
	};

	@override
	Signature signature = Signature();
	@override
	PublicKey signerPublicKey = PublicKey();
	int version = MosaicMetadataTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	TransactionType type = MosaicMetadataTransactionV1.TRANSACTION_TYPE;
	Amount fee = Amount();
	Timestamp deadline = Timestamp();
	UnresolvedAddress targetAddress = UnresolvedAddress();
	BigInt scopedMetadataKey = BigInt.from(0);
	UnresolvedMosaicId targetMosaicId = UnresolvedMosaicId();
	int valueSizeDelta = 0;
	Uint8List value = Uint8List(0);
	final int verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field

	MosaicMetadataTransactionV1({ 
	Signature? signature,
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	Amount? fee,
	Timestamp? deadline,
	UnresolvedAddress? targetAddress,
	BigInt? scopedMetadataKey,
	UnresolvedMosaicId? targetMosaicId,
	int? valueSizeDelta,
	Uint8List? value
	}) {
		this.signature = signature ?? Signature();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? MosaicMetadataTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? MosaicMetadataTransactionV1.TRANSACTION_TYPE;
		this.fee = fee ?? Amount();
		this.deadline = deadline ?? Timestamp();
		this.targetAddress = targetAddress ?? UnresolvedAddress();
		this.scopedMetadataKey = scopedMetadataKey ?? BigInt.from(0);
		this.targetMosaicId = targetMosaicId ?? UnresolvedMosaicId();
		this.valueSizeDelta = valueSizeDelta ?? 0;
		this.value = value ?? Uint8List(0);
	}

	@override
	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signature.size;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += fee.size;
		size += deadline.size;
		size += targetAddress.size;
		size += 8;
		size += targetMosaicId.size;
		size += 2;
		size += 2;
		size += value.lengthInBytes;
		return size;
	}

	@override
	MosaicMetadataTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var verifiableEntityHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != verifiableEntityHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($verifiableEntityHeaderReserved_1)');
		}
		var signature = Signature().deserialize(buffer);
		buffer = buffer.sublist(signature.size);
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var fee = Amount().deserialize(buffer);
		buffer = buffer.sublist(fee.size);
		var deadline = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(deadline.size);
		var targetAddress = UnresolvedAddress().deserialize(buffer);
		buffer = buffer.sublist(targetAddress.size);
		var scopedMetadataKey = bytesToInt(buffer.sublist(0, 8), 8);
		buffer = buffer.sublist(8);
		var targetMosaicId = UnresolvedMosaicId().deserialize(buffer);
		buffer = buffer.sublist(targetMosaicId.size);
		var valueSizeDelta = bytesToInt(buffer.sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		var valueSize = bytesToInt(buffer.sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		var value = Uint8List.fromList(buffer.sublist(0, valueSize));
		buffer = buffer.sublist(valueSize);

		var instance = MosaicMetadataTransactionV1(
			signature: signature,
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			fee: fee,
			deadline: deadline,
			targetAddress: targetAddress,
			scopedMetadataKey: scopedMetadataKey,
			targetMosaicId: targetMosaicId,
			valueSizeDelta: valueSizeDelta,
			value: value,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signature.size, signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + fee.size, fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + deadline.size, deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + targetAddress.size, targetAddress.serialize());
		currentPos += targetAddress.size;
		buffer.setRange(currentPos, currentPos + 8, intToBytes(scopedMetadataKey, 8));
		currentPos += 8;
		buffer.setRange(currentPos, currentPos + targetMosaicId.size, targetMosaicId.serialize());
		currentPos += targetMosaicId.size;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(valueSizeDelta, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(value.length, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + value.lengthInBytes, value);
		currentPos += value.lengthInBytes;
		return buffer;
	}

	@override
	String toString() {
		var result = 'MosaicMetadataTransactionV1(';
		result += 'signature: "${signature.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'fee: "${fee.toString()}", ';
		result += 'deadline: "${deadline.toString()}", ';
		result += 'targetAddress: "${targetAddress.toString()}", ';
		result += 'scopedMetadataKey: "0x${intToHex(scopedMetadataKey)}", ';
		result += 'targetMosaicId: "${targetMosaicId.toString()}", ';
		result += 'valueSizeDelta: "0x${intToHex(valueSizeDelta)}", ';
		result += 'value: "${bytesToHex(value)}", ';
		result += ')';
		return result;
	}
}


class EmbeddedMosaicMetadataTransactionV1 implements ISerializable, IInnerTransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.MOSAIC_METADATA.value);

	static const Map<String, String> TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'targetAddress': 'pod:UnresolvedAddress',
		'targetMosaicId': 'pod:UnresolvedMosaicId',
		'value': 'bytes_array'
	};

	PublicKey signerPublicKey = PublicKey();
	int version = EmbeddedMosaicMetadataTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	TransactionType type = EmbeddedMosaicMetadataTransactionV1.TRANSACTION_TYPE;
	UnresolvedAddress targetAddress = UnresolvedAddress();
	BigInt scopedMetadataKey = BigInt.from(0);
	UnresolvedMosaicId targetMosaicId = UnresolvedMosaicId();
	int valueSizeDelta = 0;
	Uint8List value = Uint8List(0);
	final int embeddedTransactionHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field

	EmbeddedMosaicMetadataTransactionV1({ 
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	UnresolvedAddress? targetAddress,
	BigInt? scopedMetadataKey,
	UnresolvedMosaicId? targetMosaicId,
	int? valueSizeDelta,
	Uint8List? value
	}) {
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? EmbeddedMosaicMetadataTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? EmbeddedMosaicMetadataTransactionV1.TRANSACTION_TYPE;
		this.targetAddress = targetAddress ?? UnresolvedAddress();
		this.scopedMetadataKey = scopedMetadataKey ?? BigInt.from(0);
		this.targetMosaicId = targetMosaicId ?? UnresolvedMosaicId();
		this.valueSizeDelta = valueSizeDelta ?? 0;
		this.value = value ?? Uint8List(0);
	}

	@override
	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += targetAddress.size;
		size += 8;
		size += targetMosaicId.size;
		size += 2;
		size += 2;
		size += value.lengthInBytes;
		return size;
	}

	@override
	EmbeddedMosaicMetadataTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var embeddedTransactionHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != embeddedTransactionHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($embeddedTransactionHeaderReserved_1)');
		}
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var targetAddress = UnresolvedAddress().deserialize(buffer);
		buffer = buffer.sublist(targetAddress.size);
		var scopedMetadataKey = bytesToInt(buffer.sublist(0, 8), 8);
		buffer = buffer.sublist(8);
		var targetMosaicId = UnresolvedMosaicId().deserialize(buffer);
		buffer = buffer.sublist(targetMosaicId.size);
		var valueSizeDelta = bytesToInt(buffer.sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		var valueSize = bytesToInt(buffer.sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		var value = Uint8List.fromList(buffer.sublist(0, valueSize));
		buffer = buffer.sublist(valueSize);

		var instance = EmbeddedMosaicMetadataTransactionV1(
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			targetAddress: targetAddress,
			scopedMetadataKey: scopedMetadataKey,
			targetMosaicId: targetMosaicId,
			valueSizeDelta: valueSizeDelta,
			value: value,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(embeddedTransactionHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + targetAddress.size, targetAddress.serialize());
		currentPos += targetAddress.size;
		buffer.setRange(currentPos, currentPos + 8, intToBytes(scopedMetadataKey, 8));
		currentPos += 8;
		buffer.setRange(currentPos, currentPos + targetMosaicId.size, targetMosaicId.serialize());
		currentPos += targetMosaicId.size;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(valueSizeDelta, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(value.length, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + value.lengthInBytes, value);
		currentPos += value.lengthInBytes;
		return buffer;
	}

	@override
	String toString() {
		var result = 'EmbeddedMosaicMetadataTransactionV1(';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'targetAddress: "${targetAddress.toString()}", ';
		result += 'scopedMetadataKey: "0x${intToHex(scopedMetadataKey)}", ';
		result += 'targetMosaicId: "${targetMosaicId.toString()}", ';
		result += 'valueSizeDelta: "0x${intToHex(valueSizeDelta)}", ';
		result += 'value: "${bytesToHex(value)}", ';
		result += ')';
		return result;
	}
}


class NamespaceMetadataTransactionV1 implements ISerializable, ITransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.NAMESPACE_METADATA.value);

	static const Map<String, String> TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'targetAddress': 'pod:UnresolvedAddress',
		'targetNamespaceId': 'pod:NamespaceId',
		'value': 'bytes_array'
	};

	@override
	Signature signature = Signature();
	@override
	PublicKey signerPublicKey = PublicKey();
	int version = NamespaceMetadataTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	TransactionType type = NamespaceMetadataTransactionV1.TRANSACTION_TYPE;
	Amount fee = Amount();
	Timestamp deadline = Timestamp();
	UnresolvedAddress targetAddress = UnresolvedAddress();
	BigInt scopedMetadataKey = BigInt.from(0);
	NamespaceId targetNamespaceId = NamespaceId();
	int valueSizeDelta = 0;
	Uint8List value = Uint8List(0);
	final int verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field

	NamespaceMetadataTransactionV1({ 
	Signature? signature,
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	Amount? fee,
	Timestamp? deadline,
	UnresolvedAddress? targetAddress,
	BigInt? scopedMetadataKey,
	NamespaceId? targetNamespaceId,
	int? valueSizeDelta,
	Uint8List? value
	}) {
		this.signature = signature ?? Signature();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? NamespaceMetadataTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? NamespaceMetadataTransactionV1.TRANSACTION_TYPE;
		this.fee = fee ?? Amount();
		this.deadline = deadline ?? Timestamp();
		this.targetAddress = targetAddress ?? UnresolvedAddress();
		this.scopedMetadataKey = scopedMetadataKey ?? BigInt.from(0);
		this.targetNamespaceId = targetNamespaceId ?? NamespaceId();
		this.valueSizeDelta = valueSizeDelta ?? 0;
		this.value = value ?? Uint8List(0);
	}

	@override
	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signature.size;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += fee.size;
		size += deadline.size;
		size += targetAddress.size;
		size += 8;
		size += targetNamespaceId.size;
		size += 2;
		size += 2;
		size += value.lengthInBytes;
		return size;
	}

	@override
	NamespaceMetadataTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var verifiableEntityHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != verifiableEntityHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($verifiableEntityHeaderReserved_1)');
		}
		var signature = Signature().deserialize(buffer);
		buffer = buffer.sublist(signature.size);
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var fee = Amount().deserialize(buffer);
		buffer = buffer.sublist(fee.size);
		var deadline = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(deadline.size);
		var targetAddress = UnresolvedAddress().deserialize(buffer);
		buffer = buffer.sublist(targetAddress.size);
		var scopedMetadataKey = bytesToInt(buffer.sublist(0, 8), 8);
		buffer = buffer.sublist(8);
		var targetNamespaceId = NamespaceId().deserialize(buffer);
		buffer = buffer.sublist(targetNamespaceId.size);
		var valueSizeDelta = bytesToInt(buffer.sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		var valueSize = bytesToInt(buffer.sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		var value = Uint8List.fromList(buffer.sublist(0, valueSize));
		buffer = buffer.sublist(valueSize);

		var instance = NamespaceMetadataTransactionV1(
			signature: signature,
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			fee: fee,
			deadline: deadline,
			targetAddress: targetAddress,
			scopedMetadataKey: scopedMetadataKey,
			targetNamespaceId: targetNamespaceId,
			valueSizeDelta: valueSizeDelta,
			value: value,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signature.size, signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + fee.size, fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + deadline.size, deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + targetAddress.size, targetAddress.serialize());
		currentPos += targetAddress.size;
		buffer.setRange(currentPos, currentPos + 8, intToBytes(scopedMetadataKey, 8));
		currentPos += 8;
		buffer.setRange(currentPos, currentPos + targetNamespaceId.size, targetNamespaceId.serialize());
		currentPos += targetNamespaceId.size;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(valueSizeDelta, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(value.length, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + value.lengthInBytes, value);
		currentPos += value.lengthInBytes;
		return buffer;
	}

	@override
	String toString() {
		var result = 'NamespaceMetadataTransactionV1(';
		result += 'signature: "${signature.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'fee: "${fee.toString()}", ';
		result += 'deadline: "${deadline.toString()}", ';
		result += 'targetAddress: "${targetAddress.toString()}", ';
		result += 'scopedMetadataKey: "0x${intToHex(scopedMetadataKey)}", ';
		result += 'targetNamespaceId: "${targetNamespaceId.toString()}", ';
		result += 'valueSizeDelta: "0x${intToHex(valueSizeDelta)}", ';
		result += 'value: "${bytesToHex(value)}", ';
		result += ')';
		return result;
	}
}


class EmbeddedNamespaceMetadataTransactionV1 implements ISerializable, IInnerTransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.NAMESPACE_METADATA.value);

	static const Map<String, String> TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'targetAddress': 'pod:UnresolvedAddress',
		'targetNamespaceId': 'pod:NamespaceId',
		'value': 'bytes_array'
	};

	PublicKey signerPublicKey = PublicKey();
	int version = EmbeddedNamespaceMetadataTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	TransactionType type = EmbeddedNamespaceMetadataTransactionV1.TRANSACTION_TYPE;
	UnresolvedAddress targetAddress = UnresolvedAddress();
	BigInt scopedMetadataKey = BigInt.from(0);
	NamespaceId targetNamespaceId = NamespaceId();
	int valueSizeDelta = 0;
	Uint8List value = Uint8List(0);
	final int embeddedTransactionHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field

	EmbeddedNamespaceMetadataTransactionV1({ 
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	UnresolvedAddress? targetAddress,
	BigInt? scopedMetadataKey,
	NamespaceId? targetNamespaceId,
	int? valueSizeDelta,
	Uint8List? value
	}) {
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? EmbeddedNamespaceMetadataTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? EmbeddedNamespaceMetadataTransactionV1.TRANSACTION_TYPE;
		this.targetAddress = targetAddress ?? UnresolvedAddress();
		this.scopedMetadataKey = scopedMetadataKey ?? BigInt.from(0);
		this.targetNamespaceId = targetNamespaceId ?? NamespaceId();
		this.valueSizeDelta = valueSizeDelta ?? 0;
		this.value = value ?? Uint8List(0);
	}

	@override
	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += targetAddress.size;
		size += 8;
		size += targetNamespaceId.size;
		size += 2;
		size += 2;
		size += value.lengthInBytes;
		return size;
	}

	@override
	EmbeddedNamespaceMetadataTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var embeddedTransactionHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != embeddedTransactionHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($embeddedTransactionHeaderReserved_1)');
		}
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var targetAddress = UnresolvedAddress().deserialize(buffer);
		buffer = buffer.sublist(targetAddress.size);
		var scopedMetadataKey = bytesToInt(buffer.sublist(0, 8), 8);
		buffer = buffer.sublist(8);
		var targetNamespaceId = NamespaceId().deserialize(buffer);
		buffer = buffer.sublist(targetNamespaceId.size);
		var valueSizeDelta = bytesToInt(buffer.sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		var valueSize = bytesToInt(buffer.sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		var value = Uint8List.fromList(buffer.sublist(0, valueSize));
		buffer = buffer.sublist(valueSize);

		var instance = EmbeddedNamespaceMetadataTransactionV1(
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			targetAddress: targetAddress,
			scopedMetadataKey: scopedMetadataKey,
			targetNamespaceId: targetNamespaceId,
			valueSizeDelta: valueSizeDelta,
			value: value,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(embeddedTransactionHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + targetAddress.size, targetAddress.serialize());
		currentPos += targetAddress.size;
		buffer.setRange(currentPos, currentPos + 8, intToBytes(scopedMetadataKey, 8));
		currentPos += 8;
		buffer.setRange(currentPos, currentPos + targetNamespaceId.size, targetNamespaceId.serialize());
		currentPos += targetNamespaceId.size;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(valueSizeDelta, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(value.length, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + value.lengthInBytes, value);
		currentPos += value.lengthInBytes;
		return buffer;
	}

	@override
	String toString() {
		var result = 'EmbeddedNamespaceMetadataTransactionV1(';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'targetAddress: "${targetAddress.toString()}", ';
		result += 'scopedMetadataKey: "0x${intToHex(scopedMetadataKey)}", ';
		result += 'targetNamespaceId: "${targetNamespaceId.toString()}", ';
		result += 'valueSizeDelta: "0x${intToHex(valueSizeDelta)}", ';
		result += 'value: "${bytesToHex(value)}", ';
		result += ')';
		return result;
	}
}


class MosaicNonce extends BaseValue implements ISerializable {
	static const int SIZE = 4;

	MosaicNonce([dynamic mosaicNonce]) : super(SIZE, mosaicNonce ?? 0);

	@override
	MosaicNonce deserialize(Uint8List payload) {
		return MosaicNonce(bytesToInt(payload.sublist(0, 4), 4));
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(SIZE);
		buffer.setRange(0, 0 + 4, intToBytes(value, 4));
		return buffer;
	}
}


class MosaicFlags implements ISerializable {
	static final NONE = MosaicFlags(0);
	static final SUPPLY_MUTABLE = MosaicFlags(1);
	static final TRANSFERABLE = MosaicFlags(2);
	static final RESTRICTABLE = MosaicFlags(4);
	static final REVOKABLE = MosaicFlags(8);

	int value = 0;

	static final _flags = {
		0: 'NONE',
		1: 'SUPPLY_MUTABLE',
		2: 'TRANSFERABLE',
		4: 'RESTRICTABLE',
		8: 'REVOKABLE',
	};

	MosaicFlags([int? _value]) {
		value = _value ?? 0;
	}

	@override
	int get size {
		return 1;
	}

	@override
	MosaicFlags deserialize(Uint8List payload) {
		var byteData = ByteData.sublistView(payload);
		return MosaicFlags(byteData.getUint8(0));
	}

	@override
	Uint8List serialize() {
		var byteData = ByteData(1)..setUint8(0, value);
		return byteData.buffer.asUint8List();
	}

	@override
	String toString() {
		if (value == 0) {
			return 'NONE';
		}
		return _flags.entries
		.where((e) => value & e.key != 0)
		.map((e) => e.value)
		.join(' | ');
	}
}


class MosaicSupplyChangeAction implements ISerializable {
	static final DECREASE = MosaicSupplyChangeAction(0);
	static final INCREASE = MosaicSupplyChangeAction(1);

	int value = 0;

	static final _flags = {
		0: 'DECREASE',
		1: 'INCREASE',
	};

	MosaicSupplyChangeAction([int? _value]) {
		value = _value ?? 0;
	}

	@override
	int get size {
		return 1;
	}

	@override
	MosaicSupplyChangeAction deserialize(Uint8List payload) {
		var byteData = ByteData.sublistView(payload);
		return MosaicSupplyChangeAction(byteData.getUint8(0));
	}

	@override
	Uint8List serialize() {
		var byteData = ByteData(1)..setUint8(0, value);
		return byteData.buffer.asUint8List();
	}

	@override
	String toString() {
		return 'MosaicSupplyChangeAction.${_flags[value]}';
	}
}


class MosaicDefinitionTransactionV1 implements ISerializable, ITransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.MOSAIC_DEFINITION.value);

	static const Map<String, String> TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'id': 'pod:MosaicId',
		'duration': 'pod:BlockDuration',
		'nonce': 'pod:MosaicNonce',
		'flags': 'enum:MosaicFlags'
	};

	@override
	Signature signature = Signature();
	@override
	PublicKey signerPublicKey = PublicKey();
	int version = MosaicDefinitionTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	TransactionType type = MosaicDefinitionTransactionV1.TRANSACTION_TYPE;
	Amount fee = Amount();
	Timestamp deadline = Timestamp();
	MosaicId id = MosaicId();
	BlockDuration duration = BlockDuration();
	MosaicNonce nonce = MosaicNonce();
	MosaicFlags flags = MosaicFlags.NONE;
	int divisibility = 0;
	final int verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field

	MosaicDefinitionTransactionV1({ 
	Signature? signature,
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	Amount? fee,
	Timestamp? deadline,
	MosaicId? id,
	BlockDuration? duration,
	MosaicNonce? nonce,
	MosaicFlags? flags,
	int? divisibility
	}) {
		this.signature = signature ?? Signature();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? MosaicDefinitionTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? MosaicDefinitionTransactionV1.TRANSACTION_TYPE;
		this.fee = fee ?? Amount();
		this.deadline = deadline ?? Timestamp();
		this.id = id ?? MosaicId();
		this.duration = duration ?? BlockDuration();
		this.nonce = nonce ?? MosaicNonce();
		this.flags = flags ?? MosaicFlags.NONE;
		this.divisibility = divisibility ?? 0;
	}

	@override
	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signature.size;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += fee.size;
		size += deadline.size;
		size += id.size;
		size += duration.size;
		size += nonce.size;
		size += flags.size;
		size += 1;
		return size;
	}

	@override
	MosaicDefinitionTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var verifiableEntityHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != verifiableEntityHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($verifiableEntityHeaderReserved_1)');
		}
		var signature = Signature().deserialize(buffer);
		buffer = buffer.sublist(signature.size);
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var fee = Amount().deserialize(buffer);
		buffer = buffer.sublist(fee.size);
		var deadline = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(deadline.size);
		var id = MosaicId().deserialize(buffer);
		buffer = buffer.sublist(id.size);
		var duration = BlockDuration().deserialize(buffer);
		buffer = buffer.sublist(duration.size);
		var nonce = MosaicNonce().deserialize(buffer);
		buffer = buffer.sublist(nonce.size);
		var flags = MosaicFlags().deserialize(buffer);
		buffer = buffer.sublist(flags.size);
		var divisibility = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);

		var instance = MosaicDefinitionTransactionV1(
			signature: signature,
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			fee: fee,
			deadline: deadline,
			id: id,
			duration: duration,
			nonce: nonce,
			flags: flags,
			divisibility: divisibility,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signature.size, signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + fee.size, fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + deadline.size, deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + id.size, id.serialize());
		currentPos += id.size;
		buffer.setRange(currentPos, currentPos + duration.size, duration.serialize());
		currentPos += duration.size;
		buffer.setRange(currentPos, currentPos + nonce.size, nonce.serialize());
		currentPos += nonce.size;
		buffer.setRange(currentPos, currentPos + flags.size, flags.serialize());
		currentPos += flags.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(divisibility, 1));
		currentPos += 1;
		return buffer;
	}

	@override
	String toString() {
		var result = 'MosaicDefinitionTransactionV1(';
		result += 'signature: "${signature.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'fee: "${fee.toString()}", ';
		result += 'deadline: "${deadline.toString()}", ';
		result += 'id: "${id.toString()}", ';
		result += 'duration: "${duration.toString()}", ';
		result += 'nonce: "${nonce.toString()}", ';
		result += 'flags: "${flags.toString()}", ';
		result += 'divisibility: "0x${intToHex(divisibility)}", ';
		result += ')';
		return result;
	}
}


class EmbeddedMosaicDefinitionTransactionV1 implements ISerializable, IInnerTransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.MOSAIC_DEFINITION.value);

	static const Map<String, String> TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'id': 'pod:MosaicId',
		'duration': 'pod:BlockDuration',
		'nonce': 'pod:MosaicNonce',
		'flags': 'enum:MosaicFlags'
	};

	PublicKey signerPublicKey = PublicKey();
	int version = EmbeddedMosaicDefinitionTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	TransactionType type = EmbeddedMosaicDefinitionTransactionV1.TRANSACTION_TYPE;
	MosaicId id = MosaicId();
	BlockDuration duration = BlockDuration();
	MosaicNonce nonce = MosaicNonce();
	MosaicFlags flags = MosaicFlags.NONE;
	int divisibility = 0;
	final int embeddedTransactionHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field

	EmbeddedMosaicDefinitionTransactionV1({ 
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	MosaicId? id,
	BlockDuration? duration,
	MosaicNonce? nonce,
	MosaicFlags? flags,
	int? divisibility
	}) {
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? EmbeddedMosaicDefinitionTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? EmbeddedMosaicDefinitionTransactionV1.TRANSACTION_TYPE;
		this.id = id ?? MosaicId();
		this.duration = duration ?? BlockDuration();
		this.nonce = nonce ?? MosaicNonce();
		this.flags = flags ?? MosaicFlags.NONE;
		this.divisibility = divisibility ?? 0;
	}

	@override
	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += id.size;
		size += duration.size;
		size += nonce.size;
		size += flags.size;
		size += 1;
		return size;
	}

	@override
	EmbeddedMosaicDefinitionTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var embeddedTransactionHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != embeddedTransactionHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($embeddedTransactionHeaderReserved_1)');
		}
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var id = MosaicId().deserialize(buffer);
		buffer = buffer.sublist(id.size);
		var duration = BlockDuration().deserialize(buffer);
		buffer = buffer.sublist(duration.size);
		var nonce = MosaicNonce().deserialize(buffer);
		buffer = buffer.sublist(nonce.size);
		var flags = MosaicFlags().deserialize(buffer);
		buffer = buffer.sublist(flags.size);
		var divisibility = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);

		var instance = EmbeddedMosaicDefinitionTransactionV1(
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			id: id,
			duration: duration,
			nonce: nonce,
			flags: flags,
			divisibility: divisibility,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(embeddedTransactionHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + id.size, id.serialize());
		currentPos += id.size;
		buffer.setRange(currentPos, currentPos + duration.size, duration.serialize());
		currentPos += duration.size;
		buffer.setRange(currentPos, currentPos + nonce.size, nonce.serialize());
		currentPos += nonce.size;
		buffer.setRange(currentPos, currentPos + flags.size, flags.serialize());
		currentPos += flags.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(divisibility, 1));
		currentPos += 1;
		return buffer;
	}

	@override
	String toString() {
		var result = 'EmbeddedMosaicDefinitionTransactionV1(';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'id: "${id.toString()}", ';
		result += 'duration: "${duration.toString()}", ';
		result += 'nonce: "${nonce.toString()}", ';
		result += 'flags: "${flags.toString()}", ';
		result += 'divisibility: "0x${intToHex(divisibility)}", ';
		result += ')';
		return result;
	}
}


class MosaicSupplyChangeTransactionV1 implements ISerializable, ITransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.MOSAIC_SUPPLY_CHANGE.value);

	static const Map<String, String> TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'mosaicId': 'pod:UnresolvedMosaicId',
		'delta': 'pod:Amount',
		'action': 'enum:MosaicSupplyChangeAction'
	};

	@override
	Signature signature = Signature();
	@override
	PublicKey signerPublicKey = PublicKey();
	int version = MosaicSupplyChangeTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	TransactionType type = MosaicSupplyChangeTransactionV1.TRANSACTION_TYPE;
	Amount fee = Amount();
	Timestamp deadline = Timestamp();
	UnresolvedMosaicId mosaicId = UnresolvedMosaicId();
	Amount delta = Amount();
	MosaicSupplyChangeAction action = MosaicSupplyChangeAction.DECREASE;
	final int verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field

	MosaicSupplyChangeTransactionV1({ 
	Signature? signature,
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	Amount? fee,
	Timestamp? deadline,
	UnresolvedMosaicId? mosaicId,
	Amount? delta,
	MosaicSupplyChangeAction? action
	}) {
		this.signature = signature ?? Signature();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? MosaicSupplyChangeTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? MosaicSupplyChangeTransactionV1.TRANSACTION_TYPE;
		this.fee = fee ?? Amount();
		this.deadline = deadline ?? Timestamp();
		this.mosaicId = mosaicId ?? UnresolvedMosaicId();
		this.delta = delta ?? Amount();
		this.action = action ?? MosaicSupplyChangeAction.DECREASE;
	}

	@override
	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signature.size;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += fee.size;
		size += deadline.size;
		size += mosaicId.size;
		size += delta.size;
		size += action.size;
		return size;
	}

	@override
	MosaicSupplyChangeTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var verifiableEntityHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != verifiableEntityHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($verifiableEntityHeaderReserved_1)');
		}
		var signature = Signature().deserialize(buffer);
		buffer = buffer.sublist(signature.size);
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var fee = Amount().deserialize(buffer);
		buffer = buffer.sublist(fee.size);
		var deadline = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(deadline.size);
		var mosaicId = UnresolvedMosaicId().deserialize(buffer);
		buffer = buffer.sublist(mosaicId.size);
		var delta = Amount().deserialize(buffer);
		buffer = buffer.sublist(delta.size);
		var action = MosaicSupplyChangeAction().deserialize(buffer);
		buffer = buffer.sublist(action.size);

		var instance = MosaicSupplyChangeTransactionV1(
			signature: signature,
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			fee: fee,
			deadline: deadline,
			mosaicId: mosaicId,
			delta: delta,
			action: action,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signature.size, signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + fee.size, fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + deadline.size, deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + mosaicId.size, mosaicId.serialize());
		currentPos += mosaicId.size;
		buffer.setRange(currentPos, currentPos + delta.size, delta.serialize());
		currentPos += delta.size;
		buffer.setRange(currentPos, currentPos + action.size, action.serialize());
		currentPos += action.size;
		return buffer;
	}

	@override
	String toString() {
		var result = 'MosaicSupplyChangeTransactionV1(';
		result += 'signature: "${signature.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'fee: "${fee.toString()}", ';
		result += 'deadline: "${deadline.toString()}", ';
		result += 'mosaicId: "${mosaicId.toString()}", ';
		result += 'delta: "${delta.toString()}", ';
		result += 'action: "${action.toString()}", ';
		result += ')';
		return result;
	}
}


class EmbeddedMosaicSupplyChangeTransactionV1 implements ISerializable, IInnerTransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.MOSAIC_SUPPLY_CHANGE.value);

	static const Map<String, String> TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'mosaicId': 'pod:UnresolvedMosaicId',
		'delta': 'pod:Amount',
		'action': 'enum:MosaicSupplyChangeAction'
	};

	PublicKey signerPublicKey = PublicKey();
	int version = EmbeddedMosaicSupplyChangeTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	TransactionType type = EmbeddedMosaicSupplyChangeTransactionV1.TRANSACTION_TYPE;
	UnresolvedMosaicId mosaicId = UnresolvedMosaicId();
	Amount delta = Amount();
	MosaicSupplyChangeAction action = MosaicSupplyChangeAction.DECREASE;
	final int embeddedTransactionHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field

	EmbeddedMosaicSupplyChangeTransactionV1({ 
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	UnresolvedMosaicId? mosaicId,
	Amount? delta,
	MosaicSupplyChangeAction? action
	}) {
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? EmbeddedMosaicSupplyChangeTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? EmbeddedMosaicSupplyChangeTransactionV1.TRANSACTION_TYPE;
		this.mosaicId = mosaicId ?? UnresolvedMosaicId();
		this.delta = delta ?? Amount();
		this.action = action ?? MosaicSupplyChangeAction.DECREASE;
	}

	@override
	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += mosaicId.size;
		size += delta.size;
		size += action.size;
		return size;
	}

	@override
	EmbeddedMosaicSupplyChangeTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var embeddedTransactionHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != embeddedTransactionHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($embeddedTransactionHeaderReserved_1)');
		}
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var mosaicId = UnresolvedMosaicId().deserialize(buffer);
		buffer = buffer.sublist(mosaicId.size);
		var delta = Amount().deserialize(buffer);
		buffer = buffer.sublist(delta.size);
		var action = MosaicSupplyChangeAction().deserialize(buffer);
		buffer = buffer.sublist(action.size);

		var instance = EmbeddedMosaicSupplyChangeTransactionV1(
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			mosaicId: mosaicId,
			delta: delta,
			action: action,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(embeddedTransactionHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + mosaicId.size, mosaicId.serialize());
		currentPos += mosaicId.size;
		buffer.setRange(currentPos, currentPos + delta.size, delta.serialize());
		currentPos += delta.size;
		buffer.setRange(currentPos, currentPos + action.size, action.serialize());
		currentPos += action.size;
		return buffer;
	}

	@override
	String toString() {
		var result = 'EmbeddedMosaicSupplyChangeTransactionV1(';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'mosaicId: "${mosaicId.toString()}", ';
		result += 'delta: "${delta.toString()}", ';
		result += 'action: "${action.toString()}", ';
		result += ')';
		return result;
	}
}


class MosaicSupplyRevocationTransactionV1 implements ISerializable, ITransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.MOSAIC_SUPPLY_REVOCATION.value);

	static const Map<String, String> TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'sourceAddress': 'pod:UnresolvedAddress',
		'mosaic': 'struct:UnresolvedMosaic'
	};

	@override
	Signature signature = Signature();
	@override
	PublicKey signerPublicKey = PublicKey();
	int version = MosaicSupplyRevocationTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	TransactionType type = MosaicSupplyRevocationTransactionV1.TRANSACTION_TYPE;
	Amount fee = Amount();
	Timestamp deadline = Timestamp();
	UnresolvedAddress sourceAddress = UnresolvedAddress();
	UnresolvedMosaic mosaic = UnresolvedMosaic();
	final int verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field

	MosaicSupplyRevocationTransactionV1({ 
	Signature? signature,
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	Amount? fee,
	Timestamp? deadline,
	UnresolvedAddress? sourceAddress,
	UnresolvedMosaic? mosaic
	}) {
		this.signature = signature ?? Signature();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? MosaicSupplyRevocationTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? MosaicSupplyRevocationTransactionV1.TRANSACTION_TYPE;
		this.fee = fee ?? Amount();
		this.deadline = deadline ?? Timestamp();
		this.sourceAddress = sourceAddress ?? UnresolvedAddress();
		this.mosaic = mosaic ?? UnresolvedMosaic();
	}

	@override
	void sort() {
		mosaic.sort();
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signature.size;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += fee.size;
		size += deadline.size;
		size += sourceAddress.size;
		size += mosaic.size;
		return size;
	}

	@override
	MosaicSupplyRevocationTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var verifiableEntityHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != verifiableEntityHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($verifiableEntityHeaderReserved_1)');
		}
		var signature = Signature().deserialize(buffer);
		buffer = buffer.sublist(signature.size);
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var fee = Amount().deserialize(buffer);
		buffer = buffer.sublist(fee.size);
		var deadline = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(deadline.size);
		var sourceAddress = UnresolvedAddress().deserialize(buffer);
		buffer = buffer.sublist(sourceAddress.size);
		var mosaic = UnresolvedMosaic().deserialize(buffer);
		buffer = buffer.sublist(mosaic.size);

		var instance = MosaicSupplyRevocationTransactionV1(
			signature: signature,
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			fee: fee,
			deadline: deadline,
			sourceAddress: sourceAddress,
			mosaic: mosaic,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signature.size, signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + fee.size, fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + deadline.size, deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + sourceAddress.size, sourceAddress.serialize());
		currentPos += sourceAddress.size;
		buffer.setRange(currentPos, currentPos + mosaic.size, mosaic.serialize());
		currentPos += mosaic.size;
		return buffer;
	}

	@override
	String toString() {
		var result = 'MosaicSupplyRevocationTransactionV1(';
		result += 'signature: "${signature.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'fee: "${fee.toString()}", ';
		result += 'deadline: "${deadline.toString()}", ';
		result += 'sourceAddress: "${sourceAddress.toString()}", ';
		result += 'mosaic: "${mosaic.toString()}", ';
		result += ')';
		return result;
	}
}


class EmbeddedMosaicSupplyRevocationTransactionV1 implements ISerializable, IInnerTransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.MOSAIC_SUPPLY_REVOCATION.value);

	static const Map<String, String> TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'sourceAddress': 'pod:UnresolvedAddress',
		'mosaic': 'struct:UnresolvedMosaic'
	};

	PublicKey signerPublicKey = PublicKey();
	int version = EmbeddedMosaicSupplyRevocationTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	TransactionType type = EmbeddedMosaicSupplyRevocationTransactionV1.TRANSACTION_TYPE;
	UnresolvedAddress sourceAddress = UnresolvedAddress();
	UnresolvedMosaic mosaic = UnresolvedMosaic();
	final int embeddedTransactionHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field

	EmbeddedMosaicSupplyRevocationTransactionV1({ 
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	UnresolvedAddress? sourceAddress,
	UnresolvedMosaic? mosaic
	}) {
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? EmbeddedMosaicSupplyRevocationTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? EmbeddedMosaicSupplyRevocationTransactionV1.TRANSACTION_TYPE;
		this.sourceAddress = sourceAddress ?? UnresolvedAddress();
		this.mosaic = mosaic ?? UnresolvedMosaic();
	}

	@override
	void sort() {
		mosaic.sort();
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += sourceAddress.size;
		size += mosaic.size;
		return size;
	}

	@override
	EmbeddedMosaicSupplyRevocationTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var embeddedTransactionHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != embeddedTransactionHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($embeddedTransactionHeaderReserved_1)');
		}
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var sourceAddress = UnresolvedAddress().deserialize(buffer);
		buffer = buffer.sublist(sourceAddress.size);
		var mosaic = UnresolvedMosaic().deserialize(buffer);
		buffer = buffer.sublist(mosaic.size);

		var instance = EmbeddedMosaicSupplyRevocationTransactionV1(
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			sourceAddress: sourceAddress,
			mosaic: mosaic,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(embeddedTransactionHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + sourceAddress.size, sourceAddress.serialize());
		currentPos += sourceAddress.size;
		buffer.setRange(currentPos, currentPos + mosaic.size, mosaic.serialize());
		currentPos += mosaic.size;
		return buffer;
	}

	@override
	String toString() {
		var result = 'EmbeddedMosaicSupplyRevocationTransactionV1(';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'sourceAddress: "${sourceAddress.toString()}", ';
		result += 'mosaic: "${mosaic.toString()}", ';
		result += ')';
		return result;
	}
}


class MultisigAccountModificationTransactionV1 implements ISerializable, ITransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.MULTISIG_ACCOUNT_MODIFICATION.value);

	static const Map<String, String> TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'addressAdditions': 'array[UnresolvedAddress]',
		'addressDeletions': 'array[UnresolvedAddress]'
	};

	@override
	Signature signature = Signature();
	@override
	PublicKey signerPublicKey = PublicKey();
	int version = MultisigAccountModificationTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	TransactionType type = MultisigAccountModificationTransactionV1.TRANSACTION_TYPE;
	Amount fee = Amount();
	Timestamp deadline = Timestamp();
	int minRemovalDelta = 0;
	int minApprovalDelta = 0;
	List<UnresolvedAddress> addressAdditions = [];
	List<UnresolvedAddress> addressDeletions = [];
	final int verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field
	final int multisigAccountModificationTransactionBodyReserved_1 = 0; // reserved field

	MultisigAccountModificationTransactionV1({ 
	Signature? signature,
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	Amount? fee,
	Timestamp? deadline,
	int? minRemovalDelta,
	int? minApprovalDelta,
	List<UnresolvedAddress>? addressAdditions,
	List<UnresolvedAddress>? addressDeletions
	}) {
		this.signature = signature ?? Signature();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? MultisigAccountModificationTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? MultisigAccountModificationTransactionV1.TRANSACTION_TYPE;
		this.fee = fee ?? Amount();
		this.deadline = deadline ?? Timestamp();
		this.minRemovalDelta = minRemovalDelta ?? 0;
		this.minApprovalDelta = minApprovalDelta ?? 0;
		this.addressAdditions = addressAdditions ?? [];
		this.addressDeletions = addressDeletions ?? [];
	}

	@override
	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signature.size;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += fee.size;
		size += deadline.size;
		size += 1;
		size += 1;
		size += 1;
		size += 1;
		size += 4;
		size += ArrayHelpers.size(addressAdditions);
		size += ArrayHelpers.size(addressDeletions);
		return size;
	}

	@override
	MultisigAccountModificationTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var verifiableEntityHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != verifiableEntityHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($verifiableEntityHeaderReserved_1)');
		}
		var signature = Signature().deserialize(buffer);
		buffer = buffer.sublist(signature.size);
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var fee = Amount().deserialize(buffer);
		buffer = buffer.sublist(fee.size);
		var deadline = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(deadline.size);
		var minRemovalDelta = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var minApprovalDelta = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var addressAdditionsCount = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var addressDeletionsCount = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var multisigAccountModificationTransactionBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != multisigAccountModificationTransactionBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($multisigAccountModificationTransactionBodyReserved_1)');
		}
		var addressAdditions = ArrayHelpers.readArrayCount(buffer, UnresolvedAddress(), addressAdditionsCount).map((item) => item as UnresolvedAddress).toList();
		buffer = buffer.sublist(ArrayHelpers.size(addressAdditions));
		var addressDeletions = ArrayHelpers.readArrayCount(buffer, UnresolvedAddress(), addressDeletionsCount).map((item) => item as UnresolvedAddress).toList();
		buffer = buffer.sublist(ArrayHelpers.size(addressDeletions));

		var instance = MultisigAccountModificationTransactionV1(
			signature: signature,
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			fee: fee,
			deadline: deadline,
			minRemovalDelta: minRemovalDelta,
			minApprovalDelta: minApprovalDelta,
			addressAdditions: addressAdditions,
			addressDeletions: addressDeletions,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signature.size, signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + fee.size, fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + deadline.size, deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(minRemovalDelta, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(minApprovalDelta, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(addressAdditions.length, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(addressDeletions.length, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(multisigAccountModificationTransactionBodyReserved_1, 4));
		currentPos += 4;
		sort();
		var res_addressAdditions = ArrayHelpers.writeArray(buffer, addressAdditions, currentPos);
		currentPos = res_addressAdditions.item2;
		buffer = res_addressAdditions.item1;
		sort();
		var res_addressDeletions = ArrayHelpers.writeArray(buffer, addressDeletions, currentPos);
		currentPos = res_addressDeletions.item2;
		buffer = res_addressDeletions.item1;
		return buffer;
	}

	@override
	String toString() {
		var result = 'MultisigAccountModificationTransactionV1(';
		result += 'signature: "${signature.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'fee: "${fee.toString()}", ';
		result += 'deadline: "${deadline.toString()}", ';
		result += 'minRemovalDelta: "0x${intToHex(minRemovalDelta)}", ';
		result += 'minApprovalDelta: "0x${intToHex(minApprovalDelta)}", ';
		result += 'addressAdditions: "${addressAdditions.map((e) => e.toString()).toList()}", ';
		result += 'addressDeletions: "${addressDeletions.map((e) => e.toString()).toList()}", ';
		result += ')';
		return result;
	}
}


class EmbeddedMultisigAccountModificationTransactionV1 implements ISerializable, IInnerTransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.MULTISIG_ACCOUNT_MODIFICATION.value);

	static const Map<String, String> TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'addressAdditions': 'array[UnresolvedAddress]',
		'addressDeletions': 'array[UnresolvedAddress]'
	};

	PublicKey signerPublicKey = PublicKey();
	int version = EmbeddedMultisigAccountModificationTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	TransactionType type = EmbeddedMultisigAccountModificationTransactionV1.TRANSACTION_TYPE;
	int minRemovalDelta = 0;
	int minApprovalDelta = 0;
	List<UnresolvedAddress> addressAdditions = [];
	List<UnresolvedAddress> addressDeletions = [];
	final int embeddedTransactionHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field
	final int multisigAccountModificationTransactionBodyReserved_1 = 0; // reserved field

	EmbeddedMultisigAccountModificationTransactionV1({ 
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	int? minRemovalDelta,
	int? minApprovalDelta,
	List<UnresolvedAddress>? addressAdditions,
	List<UnresolvedAddress>? addressDeletions
	}) {
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? EmbeddedMultisigAccountModificationTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? EmbeddedMultisigAccountModificationTransactionV1.TRANSACTION_TYPE;
		this.minRemovalDelta = minRemovalDelta ?? 0;
		this.minApprovalDelta = minApprovalDelta ?? 0;
		this.addressAdditions = addressAdditions ?? [];
		this.addressDeletions = addressDeletions ?? [];
	}

	@override
	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += 1;
		size += 1;
		size += 1;
		size += 1;
		size += 4;
		size += ArrayHelpers.size(addressAdditions);
		size += ArrayHelpers.size(addressDeletions);
		return size;
	}

	@override
	EmbeddedMultisigAccountModificationTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var embeddedTransactionHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != embeddedTransactionHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($embeddedTransactionHeaderReserved_1)');
		}
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var minRemovalDelta = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var minApprovalDelta = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var addressAdditionsCount = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var addressDeletionsCount = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var multisigAccountModificationTransactionBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != multisigAccountModificationTransactionBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($multisigAccountModificationTransactionBodyReserved_1)');
		}
		var addressAdditions = ArrayHelpers.readArrayCount(buffer, UnresolvedAddress(), addressAdditionsCount).map((item) => item as UnresolvedAddress).toList();
		buffer = buffer.sublist(ArrayHelpers.size(addressAdditions));
		var addressDeletions = ArrayHelpers.readArrayCount(buffer, UnresolvedAddress(), addressDeletionsCount).map((item) => item as UnresolvedAddress).toList();
		buffer = buffer.sublist(ArrayHelpers.size(addressDeletions));

		var instance = EmbeddedMultisigAccountModificationTransactionV1(
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			minRemovalDelta: minRemovalDelta,
			minApprovalDelta: minApprovalDelta,
			addressAdditions: addressAdditions,
			addressDeletions: addressDeletions,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(embeddedTransactionHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(minRemovalDelta, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(minApprovalDelta, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(addressAdditions.length, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(addressDeletions.length, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(multisigAccountModificationTransactionBodyReserved_1, 4));
		currentPos += 4;
		sort();
		var res_addressAdditions = ArrayHelpers.writeArray(buffer, addressAdditions, currentPos);
		currentPos = res_addressAdditions.item2;
		buffer = res_addressAdditions.item1;
		sort();
		var res_addressDeletions = ArrayHelpers.writeArray(buffer, addressDeletions, currentPos);
		currentPos = res_addressDeletions.item2;
		buffer = res_addressDeletions.item1;
		return buffer;
	}

	@override
	String toString() {
		var result = 'EmbeddedMultisigAccountModificationTransactionV1(';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'minRemovalDelta: "0x${intToHex(minRemovalDelta)}", ';
		result += 'minApprovalDelta: "0x${intToHex(minApprovalDelta)}", ';
		result += 'addressAdditions: "${addressAdditions.map((e) => e.toString()).toList()}", ';
		result += 'addressDeletions: "${addressDeletions.map((e) => e.toString()).toList()}", ';
		result += ')';
		return result;
	}
}


class AddressAliasTransactionV1 implements ISerializable, ITransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.ADDRESS_ALIAS.value);

	static const Map<String, String> TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'namespaceId': 'pod:NamespaceId',
		'address': 'pod:Address',
		'aliasAction': 'enum:AliasAction'
	};

	@override
	Signature signature = Signature();
	@override
	PublicKey signerPublicKey = PublicKey();
	int version = AddressAliasTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	TransactionType type = AddressAliasTransactionV1.TRANSACTION_TYPE;
	Amount fee = Amount();
	Timestamp deadline = Timestamp();
	NamespaceId namespaceId = NamespaceId();
	Address address = Address();
	AliasAction aliasAction = AliasAction.UNLINK;
	final int verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field

	AddressAliasTransactionV1({ 
	Signature? signature,
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	Amount? fee,
	Timestamp? deadline,
	NamespaceId? namespaceId,
	Address? address,
	AliasAction? aliasAction
	}) {
		this.signature = signature ?? Signature();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? AddressAliasTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? AddressAliasTransactionV1.TRANSACTION_TYPE;
		this.fee = fee ?? Amount();
		this.deadline = deadline ?? Timestamp();
		this.namespaceId = namespaceId ?? NamespaceId();
		this.address = address ?? Address();
		this.aliasAction = aliasAction ?? AliasAction.UNLINK;
	}

	@override
	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signature.size;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += fee.size;
		size += deadline.size;
		size += namespaceId.size;
		size += address.size;
		size += aliasAction.size;
		return size;
	}

	@override
	AddressAliasTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var verifiableEntityHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != verifiableEntityHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($verifiableEntityHeaderReserved_1)');
		}
		var signature = Signature().deserialize(buffer);
		buffer = buffer.sublist(signature.size);
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var fee = Amount().deserialize(buffer);
		buffer = buffer.sublist(fee.size);
		var deadline = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(deadline.size);
		var namespaceId = NamespaceId().deserialize(buffer);
		buffer = buffer.sublist(namespaceId.size);
		var address = Address().deserialize(buffer);
		buffer = buffer.sublist(address.size);
		var aliasAction = AliasAction().deserialize(buffer);
		buffer = buffer.sublist(aliasAction.size);

		var instance = AddressAliasTransactionV1(
			signature: signature,
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			fee: fee,
			deadline: deadline,
			namespaceId: namespaceId,
			address: address,
			aliasAction: aliasAction,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signature.size, signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + fee.size, fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + deadline.size, deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + namespaceId.size, namespaceId.serialize());
		currentPos += namespaceId.size;
		buffer.setRange(currentPos, currentPos + address.size, address.serialize());
		currentPos += address.size;
		buffer.setRange(currentPos, currentPos + aliasAction.size, aliasAction.serialize());
		currentPos += aliasAction.size;
		return buffer;
	}

	@override
	String toString() {
		var result = 'AddressAliasTransactionV1(';
		result += 'signature: "${signature.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'fee: "${fee.toString()}", ';
		result += 'deadline: "${deadline.toString()}", ';
		result += 'namespaceId: "${namespaceId.toString()}", ';
		result += 'address: "${address.toString()}", ';
		result += 'aliasAction: "${aliasAction.toString()}", ';
		result += ')';
		return result;
	}
}


class EmbeddedAddressAliasTransactionV1 implements ISerializable, IInnerTransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.ADDRESS_ALIAS.value);

	static const Map<String, String> TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'namespaceId': 'pod:NamespaceId',
		'address': 'pod:Address',
		'aliasAction': 'enum:AliasAction'
	};

	PublicKey signerPublicKey = PublicKey();
	int version = EmbeddedAddressAliasTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	TransactionType type = EmbeddedAddressAliasTransactionV1.TRANSACTION_TYPE;
	NamespaceId namespaceId = NamespaceId();
	Address address = Address();
	AliasAction aliasAction = AliasAction.UNLINK;
	final int embeddedTransactionHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field

	EmbeddedAddressAliasTransactionV1({ 
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	NamespaceId? namespaceId,
	Address? address,
	AliasAction? aliasAction
	}) {
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? EmbeddedAddressAliasTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? EmbeddedAddressAliasTransactionV1.TRANSACTION_TYPE;
		this.namespaceId = namespaceId ?? NamespaceId();
		this.address = address ?? Address();
		this.aliasAction = aliasAction ?? AliasAction.UNLINK;
	}

	@override
	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += namespaceId.size;
		size += address.size;
		size += aliasAction.size;
		return size;
	}

	@override
	EmbeddedAddressAliasTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var embeddedTransactionHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != embeddedTransactionHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($embeddedTransactionHeaderReserved_1)');
		}
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var namespaceId = NamespaceId().deserialize(buffer);
		buffer = buffer.sublist(namespaceId.size);
		var address = Address().deserialize(buffer);
		buffer = buffer.sublist(address.size);
		var aliasAction = AliasAction().deserialize(buffer);
		buffer = buffer.sublist(aliasAction.size);

		var instance = EmbeddedAddressAliasTransactionV1(
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			namespaceId: namespaceId,
			address: address,
			aliasAction: aliasAction,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(embeddedTransactionHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + namespaceId.size, namespaceId.serialize());
		currentPos += namespaceId.size;
		buffer.setRange(currentPos, currentPos + address.size, address.serialize());
		currentPos += address.size;
		buffer.setRange(currentPos, currentPos + aliasAction.size, aliasAction.serialize());
		currentPos += aliasAction.size;
		return buffer;
	}

	@override
	String toString() {
		var result = 'EmbeddedAddressAliasTransactionV1(';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'namespaceId: "${namespaceId.toString()}", ';
		result += 'address: "${address.toString()}", ';
		result += 'aliasAction: "${aliasAction.toString()}", ';
		result += ')';
		return result;
	}
}


class MosaicAliasTransactionV1 implements ISerializable, ITransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.MOSAIC_ALIAS.value);

	static const Map<String, String> TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'namespaceId': 'pod:NamespaceId',
		'mosaicId': 'pod:MosaicId',
		'aliasAction': 'enum:AliasAction'
	};

	@override
	Signature signature = Signature();
	@override
	PublicKey signerPublicKey = PublicKey();
	int version = MosaicAliasTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	TransactionType type = MosaicAliasTransactionV1.TRANSACTION_TYPE;
	Amount fee = Amount();
	Timestamp deadline = Timestamp();
	NamespaceId namespaceId = NamespaceId();
	MosaicId mosaicId = MosaicId();
	AliasAction aliasAction = AliasAction.UNLINK;
	final int verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field

	MosaicAliasTransactionV1({ 
	Signature? signature,
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	Amount? fee,
	Timestamp? deadline,
	NamespaceId? namespaceId,
	MosaicId? mosaicId,
	AliasAction? aliasAction
	}) {
		this.signature = signature ?? Signature();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? MosaicAliasTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? MosaicAliasTransactionV1.TRANSACTION_TYPE;
		this.fee = fee ?? Amount();
		this.deadline = deadline ?? Timestamp();
		this.namespaceId = namespaceId ?? NamespaceId();
		this.mosaicId = mosaicId ?? MosaicId();
		this.aliasAction = aliasAction ?? AliasAction.UNLINK;
	}

	@override
	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signature.size;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += fee.size;
		size += deadline.size;
		size += namespaceId.size;
		size += mosaicId.size;
		size += aliasAction.size;
		return size;
	}

	@override
	MosaicAliasTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var verifiableEntityHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != verifiableEntityHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($verifiableEntityHeaderReserved_1)');
		}
		var signature = Signature().deserialize(buffer);
		buffer = buffer.sublist(signature.size);
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var fee = Amount().deserialize(buffer);
		buffer = buffer.sublist(fee.size);
		var deadline = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(deadline.size);
		var namespaceId = NamespaceId().deserialize(buffer);
		buffer = buffer.sublist(namespaceId.size);
		var mosaicId = MosaicId().deserialize(buffer);
		buffer = buffer.sublist(mosaicId.size);
		var aliasAction = AliasAction().deserialize(buffer);
		buffer = buffer.sublist(aliasAction.size);

		var instance = MosaicAliasTransactionV1(
			signature: signature,
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			fee: fee,
			deadline: deadline,
			namespaceId: namespaceId,
			mosaicId: mosaicId,
			aliasAction: aliasAction,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signature.size, signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + fee.size, fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + deadline.size, deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + namespaceId.size, namespaceId.serialize());
		currentPos += namespaceId.size;
		buffer.setRange(currentPos, currentPos + mosaicId.size, mosaicId.serialize());
		currentPos += mosaicId.size;
		buffer.setRange(currentPos, currentPos + aliasAction.size, aliasAction.serialize());
		currentPos += aliasAction.size;
		return buffer;
	}

	@override
	String toString() {
		var result = 'MosaicAliasTransactionV1(';
		result += 'signature: "${signature.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'fee: "${fee.toString()}", ';
		result += 'deadline: "${deadline.toString()}", ';
		result += 'namespaceId: "${namespaceId.toString()}", ';
		result += 'mosaicId: "${mosaicId.toString()}", ';
		result += 'aliasAction: "${aliasAction.toString()}", ';
		result += ')';
		return result;
	}
}


class EmbeddedMosaicAliasTransactionV1 implements ISerializable, IInnerTransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.MOSAIC_ALIAS.value);

	static const Map<String, String> TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'namespaceId': 'pod:NamespaceId',
		'mosaicId': 'pod:MosaicId',
		'aliasAction': 'enum:AliasAction'
	};

	PublicKey signerPublicKey = PublicKey();
	int version = EmbeddedMosaicAliasTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	TransactionType type = EmbeddedMosaicAliasTransactionV1.TRANSACTION_TYPE;
	NamespaceId namespaceId = NamespaceId();
	MosaicId mosaicId = MosaicId();
	AliasAction aliasAction = AliasAction.UNLINK;
	final int embeddedTransactionHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field

	EmbeddedMosaicAliasTransactionV1({ 
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	NamespaceId? namespaceId,
	MosaicId? mosaicId,
	AliasAction? aliasAction
	}) {
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? EmbeddedMosaicAliasTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? EmbeddedMosaicAliasTransactionV1.TRANSACTION_TYPE;
		this.namespaceId = namespaceId ?? NamespaceId();
		this.mosaicId = mosaicId ?? MosaicId();
		this.aliasAction = aliasAction ?? AliasAction.UNLINK;
	}

	@override
	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += namespaceId.size;
		size += mosaicId.size;
		size += aliasAction.size;
		return size;
	}

	@override
	EmbeddedMosaicAliasTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var embeddedTransactionHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != embeddedTransactionHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($embeddedTransactionHeaderReserved_1)');
		}
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var namespaceId = NamespaceId().deserialize(buffer);
		buffer = buffer.sublist(namespaceId.size);
		var mosaicId = MosaicId().deserialize(buffer);
		buffer = buffer.sublist(mosaicId.size);
		var aliasAction = AliasAction().deserialize(buffer);
		buffer = buffer.sublist(aliasAction.size);

		var instance = EmbeddedMosaicAliasTransactionV1(
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			namespaceId: namespaceId,
			mosaicId: mosaicId,
			aliasAction: aliasAction,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(embeddedTransactionHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + namespaceId.size, namespaceId.serialize());
		currentPos += namespaceId.size;
		buffer.setRange(currentPos, currentPos + mosaicId.size, mosaicId.serialize());
		currentPos += mosaicId.size;
		buffer.setRange(currentPos, currentPos + aliasAction.size, aliasAction.serialize());
		currentPos += aliasAction.size;
		return buffer;
	}

	@override
	String toString() {
		var result = 'EmbeddedMosaicAliasTransactionV1(';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'namespaceId: "${namespaceId.toString()}", ';
		result += 'mosaicId: "${mosaicId.toString()}", ';
		result += 'aliasAction: "${aliasAction.toString()}", ';
		result += ')';
		return result;
	}
}


class NamespaceRegistrationTransactionV1 implements ISerializable, ITransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.NAMESPACE_REGISTRATION.value);

	static const Map<String, String> TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'duration': 'pod:BlockDuration',
		'parentId': 'pod:NamespaceId',
		'id': 'pod:NamespaceId',
		'registrationType': 'enum:NamespaceRegistrationType',
		'name': 'bytes_array'
	};

	@override
	Signature signature = Signature();
	@override
	PublicKey signerPublicKey = PublicKey();
	int version = NamespaceRegistrationTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	TransactionType type = NamespaceRegistrationTransactionV1.TRANSACTION_TYPE;
	Amount fee = Amount();
	Timestamp deadline = Timestamp();
	BlockDuration duration = BlockDuration();
	NamespaceId? parentId;
	NamespaceId id = NamespaceId();
	NamespaceRegistrationType registrationType = NamespaceRegistrationType.ROOT;
	Uint8List name = Uint8List(0);
	final int verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field

	NamespaceRegistrationTransactionV1({ 
	Signature? signature,
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	Amount? fee,
	Timestamp? deadline,
	BlockDuration? duration,
	NamespaceId? parentId,
	NamespaceId? id,
	NamespaceRegistrationType? registrationType,
	Uint8List? name
	}) {
		this.signature = signature ?? Signature();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? NamespaceRegistrationTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? NamespaceRegistrationTransactionV1.TRANSACTION_TYPE;
		this.fee = fee ?? Amount();
		this.deadline = deadline ?? Timestamp();
		this.duration = duration ?? BlockDuration();
		this.parentId = parentId ?? null;
		this.id = id ?? NamespaceId();
		this.registrationType = registrationType ?? NamespaceRegistrationType.ROOT;
		this.name = name ?? Uint8List(0);
	}

	@override
	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signature.size;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += fee.size;
		size += deadline.size;
		if (NamespaceRegistrationType.ROOT.value == registrationType.value)
		{
			size += duration.size;
		}
		if (NamespaceRegistrationType.CHILD.value == registrationType.value)
		{
			size += parentId!.size;
		}
		size += id.size;
		size += registrationType.size;
		size += 1;
		size += name.lengthInBytes;
		return size;
	}

	@override
	NamespaceRegistrationTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var verifiableEntityHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != verifiableEntityHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($verifiableEntityHeaderReserved_1)');
		}
		var signature = Signature().deserialize(buffer);
		buffer = buffer.sublist(signature.size);
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var fee = Amount().deserialize(buffer);
		buffer = buffer.sublist(fee.size);
		var deadline = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(deadline.size);
		// deserialize to temporary buffer for further processing
		var durationTemporary = BlockDuration().deserialize(buffer);
		var registrationTypeCondition = buffer.sublist(0, durationTemporary.size);
		buffer = buffer.sublist(durationTemporary.size);

		var id = NamespaceId().deserialize(buffer);
		buffer = buffer.sublist(id.size);
		var registrationType = NamespaceRegistrationType().deserialize(buffer);
		buffer = buffer.sublist(registrationType.size);
		var duration = null;
		if (NamespaceRegistrationType.ROOT.value == registrationType.value)
		{
			duration = BlockDuration().deserialize(registrationTypeCondition);
			registrationTypeCondition = registrationTypeCondition.sublist(duration.size);
		}
		var parentId = null;
		if (NamespaceRegistrationType.CHILD.value == registrationType.value)
		{
			parentId = NamespaceId().deserialize(registrationTypeCondition);
			registrationTypeCondition = registrationTypeCondition.sublist(parentId.size);
		}
		var nameSize = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var name = Uint8List.fromList(buffer.sublist(0, nameSize));
		buffer = buffer.sublist(nameSize);

		var instance = NamespaceRegistrationTransactionV1(
			signature: signature,
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			fee: fee,
			deadline: deadline,
			duration: duration,
			parentId: parentId,
			id: id,
			registrationType: registrationType,
			name: name,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signature.size, signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + fee.size, fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + deadline.size, deadline.serialize());
		currentPos += deadline.size;
		if (NamespaceRegistrationType.ROOT.value == registrationType.value)
		{
			buffer.setRange(currentPos, currentPos + duration.size, duration.serialize());
			currentPos += duration.size;
		}
		if (NamespaceRegistrationType.CHILD.value == registrationType.value)
		{
			buffer.setRange(currentPos, currentPos + parentId!.size, parentId!.serialize());
			currentPos += parentId!.size;
		}
		buffer.setRange(currentPos, currentPos + id.size, id.serialize());
		currentPos += id.size;
		buffer.setRange(currentPos, currentPos + registrationType.size, registrationType.serialize());
		currentPos += registrationType.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(name.length, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + name.lengthInBytes, name);
		currentPos += name.lengthInBytes;
		return buffer;
	}

	@override
	String toString() {
		var result = 'NamespaceRegistrationTransactionV1(';
		result += 'signature: "${signature.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'fee: "${fee.toString()}", ';
		result += 'deadline: "${deadline.toString()}", ';
		if (NamespaceRegistrationType.ROOT.value == registrationType.value)
		{
			result += 'duration: "${duration.toString()}", ';
		}
		if (NamespaceRegistrationType.CHILD.value == registrationType.value)
		{
			result += 'parentId: "${parentId!.toString()}", ';
		}
		result += 'id: "${id.toString()}", ';
		result += 'registrationType: "${registrationType.toString()}", ';
		result += 'name: "${bytesToHex(name)}", ';
		result += ')';
		return result;
	}
}


class EmbeddedNamespaceRegistrationTransactionV1 implements ISerializable, IInnerTransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.NAMESPACE_REGISTRATION.value);

	static const Map<String, String> TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'duration': 'pod:BlockDuration',
		'parentId': 'pod:NamespaceId',
		'id': 'pod:NamespaceId',
		'registrationType': 'enum:NamespaceRegistrationType',
		'name': 'bytes_array'
	};

	PublicKey signerPublicKey = PublicKey();
	int version = EmbeddedNamespaceRegistrationTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	TransactionType type = EmbeddedNamespaceRegistrationTransactionV1.TRANSACTION_TYPE;
	BlockDuration duration = BlockDuration();
	NamespaceId? parentId;
	NamespaceId id = NamespaceId();
	NamespaceRegistrationType registrationType = NamespaceRegistrationType.ROOT;
	Uint8List name = Uint8List(0);
	final int embeddedTransactionHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field

	EmbeddedNamespaceRegistrationTransactionV1({ 
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	BlockDuration? duration,
	NamespaceId? parentId,
	NamespaceId? id,
	NamespaceRegistrationType? registrationType,
	Uint8List? name
	}) {
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? EmbeddedNamespaceRegistrationTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? EmbeddedNamespaceRegistrationTransactionV1.TRANSACTION_TYPE;
		this.duration = duration ?? BlockDuration();
		this.parentId = parentId ?? null;
		this.id = id ?? NamespaceId();
		this.registrationType = registrationType ?? NamespaceRegistrationType.ROOT;
		this.name = name ?? Uint8List(0);
	}

	@override
	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		if (NamespaceRegistrationType.ROOT.value == registrationType.value)
		{
			size += duration.size;
		}
		if (NamespaceRegistrationType.CHILD.value == registrationType.value)
		{
			size += parentId!.size;
		}
		size += id.size;
		size += registrationType.size;
		size += 1;
		size += name.lengthInBytes;
		return size;
	}

	@override
	EmbeddedNamespaceRegistrationTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var embeddedTransactionHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != embeddedTransactionHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($embeddedTransactionHeaderReserved_1)');
		}
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		// deserialize to temporary buffer for further processing
		var durationTemporary = BlockDuration().deserialize(buffer);
		var registrationTypeCondition = buffer.sublist(0, durationTemporary.size);
		buffer = buffer.sublist(durationTemporary.size);

		var id = NamespaceId().deserialize(buffer);
		buffer = buffer.sublist(id.size);
		var registrationType = NamespaceRegistrationType().deserialize(buffer);
		buffer = buffer.sublist(registrationType.size);
		var duration = null;
		if (NamespaceRegistrationType.ROOT.value == registrationType.value)
		{
			duration = BlockDuration().deserialize(registrationTypeCondition);
			registrationTypeCondition = registrationTypeCondition.sublist(duration.size);
		}
		var parentId = null;
		if (NamespaceRegistrationType.CHILD.value == registrationType.value)
		{
			parentId = NamespaceId().deserialize(registrationTypeCondition);
			registrationTypeCondition = registrationTypeCondition.sublist(parentId.size);
		}
		var nameSize = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var name = Uint8List.fromList(buffer.sublist(0, nameSize));
		buffer = buffer.sublist(nameSize);

		var instance = EmbeddedNamespaceRegistrationTransactionV1(
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			duration: duration,
			parentId: parentId,
			id: id,
			registrationType: registrationType,
			name: name,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(embeddedTransactionHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		if (NamespaceRegistrationType.ROOT.value == registrationType.value)
		{
			buffer.setRange(currentPos, currentPos + duration.size, duration.serialize());
			currentPos += duration.size;
		}
		if (NamespaceRegistrationType.CHILD.value == registrationType.value)
		{
			buffer.setRange(currentPos, currentPos + parentId!.size, parentId!.serialize());
			currentPos += parentId!.size;
		}
		buffer.setRange(currentPos, currentPos + id.size, id.serialize());
		currentPos += id.size;
		buffer.setRange(currentPos, currentPos + registrationType.size, registrationType.serialize());
		currentPos += registrationType.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(name.length, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + name.lengthInBytes, name);
		currentPos += name.lengthInBytes;
		return buffer;
	}

	@override
	String toString() {
		var result = 'EmbeddedNamespaceRegistrationTransactionV1(';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		if (NamespaceRegistrationType.ROOT.value == registrationType.value)
		{
			result += 'duration: "${duration.toString()}", ';
		}
		if (NamespaceRegistrationType.CHILD.value == registrationType.value)
		{
			result += 'parentId: "${parentId!.toString()}", ';
		}
		result += 'id: "${id.toString()}", ';
		result += 'registrationType: "${registrationType.toString()}", ';
		result += 'name: "${bytesToHex(name)}", ';
		result += ')';
		return result;
	}
}


class AccountRestrictionFlags implements ISerializable {
	static final ADDRESS = AccountRestrictionFlags(1);
	static final MOSAIC_ID = AccountRestrictionFlags(2);
	static final TRANSACTION_TYPE = AccountRestrictionFlags(4);
	static final OUTGOING = AccountRestrictionFlags(16384);
	static final BLOCK = AccountRestrictionFlags(32768);

	int value = 0;

	static final _flags = {
		1: 'ADDRESS',
		2: 'MOSAIC_ID',
		4: 'TRANSACTION_TYPE',
		16384: 'OUTGOING',
		32768: 'BLOCK',
	};

	AccountRestrictionFlags([int? _value]) {
		value = _value ?? 1;
	}

	@override
	int get size {
		return 2;
	}

	@override
	AccountRestrictionFlags deserialize(Uint8List payload) {
		var byteData = ByteData.sublistView(payload);
		return AccountRestrictionFlags(byteData.getUint16(0, Endian.little));
	}

	@override
	Uint8List serialize() {
		var byteData = ByteData(2)..setUint16(0, value, Endian.little);
		return byteData.buffer.asUint8List();
	}

	@override
	String toString() {
		return _flags.entries
		.where((e) => value & e.key != 0)
		.map((e) => e.value)
		.join(' | ');
	}
}


class AccountAddressRestrictionTransactionV1 implements ISerializable, ITransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.ACCOUNT_ADDRESS_RESTRICTION.value);

	static const Map<String, String> TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'restrictionFlags': 'enum:AccountRestrictionFlags',
		'restrictionAdditions': 'array[UnresolvedAddress]',
		'restrictionDeletions': 'array[UnresolvedAddress]'
	};

	@override
	Signature signature = Signature();
	@override
	PublicKey signerPublicKey = PublicKey();
	int version = AccountAddressRestrictionTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	TransactionType type = AccountAddressRestrictionTransactionV1.TRANSACTION_TYPE;
	Amount fee = Amount();
	Timestamp deadline = Timestamp();
	AccountRestrictionFlags restrictionFlags = AccountRestrictionFlags.ADDRESS;
	List<UnresolvedAddress> restrictionAdditions = [];
	List<UnresolvedAddress> restrictionDeletions = [];
	final int verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field
	final int accountRestrictionTransactionBodyReserved_1 = 0; // reserved field

	AccountAddressRestrictionTransactionV1({ 
	Signature? signature,
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	Amount? fee,
	Timestamp? deadline,
	AccountRestrictionFlags? restrictionFlags,
	List<UnresolvedAddress>? restrictionAdditions,
	List<UnresolvedAddress>? restrictionDeletions
	}) {
		this.signature = signature ?? Signature();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? AccountAddressRestrictionTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? AccountAddressRestrictionTransactionV1.TRANSACTION_TYPE;
		this.fee = fee ?? Amount();
		this.deadline = deadline ?? Timestamp();
		this.restrictionFlags = restrictionFlags ?? AccountRestrictionFlags.ADDRESS;
		this.restrictionAdditions = restrictionAdditions ?? [];
		this.restrictionDeletions = restrictionDeletions ?? [];
	}

	@override
	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signature.size;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += fee.size;
		size += deadline.size;
		size += restrictionFlags.size;
		size += 1;
		size += 1;
		size += 4;
		size += ArrayHelpers.size(restrictionAdditions);
		size += ArrayHelpers.size(restrictionDeletions);
		return size;
	}

	@override
	AccountAddressRestrictionTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var verifiableEntityHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != verifiableEntityHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($verifiableEntityHeaderReserved_1)');
		}
		var signature = Signature().deserialize(buffer);
		buffer = buffer.sublist(signature.size);
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var fee = Amount().deserialize(buffer);
		buffer = buffer.sublist(fee.size);
		var deadline = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(deadline.size);
		var restrictionFlags = AccountRestrictionFlags().deserialize(buffer);
		buffer = buffer.sublist(restrictionFlags.size);
		var restrictionAdditionsCount = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var restrictionDeletionsCount = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var accountRestrictionTransactionBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != accountRestrictionTransactionBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($accountRestrictionTransactionBodyReserved_1)');
		}
		var restrictionAdditions = ArrayHelpers.readArrayCount(buffer, UnresolvedAddress(), restrictionAdditionsCount).map((item) => item as UnresolvedAddress).toList();
		buffer = buffer.sublist(ArrayHelpers.size(restrictionAdditions));
		var restrictionDeletions = ArrayHelpers.readArrayCount(buffer, UnresolvedAddress(), restrictionDeletionsCount).map((item) => item as UnresolvedAddress).toList();
		buffer = buffer.sublist(ArrayHelpers.size(restrictionDeletions));

		var instance = AccountAddressRestrictionTransactionV1(
			signature: signature,
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			fee: fee,
			deadline: deadline,
			restrictionFlags: restrictionFlags,
			restrictionAdditions: restrictionAdditions,
			restrictionDeletions: restrictionDeletions,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signature.size, signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + fee.size, fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + deadline.size, deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + restrictionFlags.size, restrictionFlags.serialize());
		currentPos += restrictionFlags.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(restrictionAdditions.length, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(restrictionDeletions.length, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(accountRestrictionTransactionBodyReserved_1, 4));
		currentPos += 4;
		sort();
		var res_restrictionAdditions = ArrayHelpers.writeArray(buffer, restrictionAdditions, currentPos);
		currentPos = res_restrictionAdditions.item2;
		buffer = res_restrictionAdditions.item1;
		sort();
		var res_restrictionDeletions = ArrayHelpers.writeArray(buffer, restrictionDeletions, currentPos);
		currentPos = res_restrictionDeletions.item2;
		buffer = res_restrictionDeletions.item1;
		return buffer;
	}

	@override
	String toString() {
		var result = 'AccountAddressRestrictionTransactionV1(';
		result += 'signature: "${signature.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'fee: "${fee.toString()}", ';
		result += 'deadline: "${deadline.toString()}", ';
		result += 'restrictionFlags: "${restrictionFlags.toString()}", ';
		result += 'restrictionAdditions: "${restrictionAdditions.map((e) => e.toString()).toList()}", ';
		result += 'restrictionDeletions: "${restrictionDeletions.map((e) => e.toString()).toList()}", ';
		result += ')';
		return result;
	}
}


class EmbeddedAccountAddressRestrictionTransactionV1 implements ISerializable, IInnerTransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.ACCOUNT_ADDRESS_RESTRICTION.value);

	static const Map<String, String> TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'restrictionFlags': 'enum:AccountRestrictionFlags',
		'restrictionAdditions': 'array[UnresolvedAddress]',
		'restrictionDeletions': 'array[UnresolvedAddress]'
	};

	PublicKey signerPublicKey = PublicKey();
	int version = EmbeddedAccountAddressRestrictionTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	TransactionType type = EmbeddedAccountAddressRestrictionTransactionV1.TRANSACTION_TYPE;
	AccountRestrictionFlags restrictionFlags = AccountRestrictionFlags.ADDRESS;
	List<UnresolvedAddress> restrictionAdditions = [];
	List<UnresolvedAddress> restrictionDeletions = [];
	final int embeddedTransactionHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field
	final int accountRestrictionTransactionBodyReserved_1 = 0; // reserved field

	EmbeddedAccountAddressRestrictionTransactionV1({ 
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	AccountRestrictionFlags? restrictionFlags,
	List<UnresolvedAddress>? restrictionAdditions,
	List<UnresolvedAddress>? restrictionDeletions
	}) {
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? EmbeddedAccountAddressRestrictionTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? EmbeddedAccountAddressRestrictionTransactionV1.TRANSACTION_TYPE;
		this.restrictionFlags = restrictionFlags ?? AccountRestrictionFlags.ADDRESS;
		this.restrictionAdditions = restrictionAdditions ?? [];
		this.restrictionDeletions = restrictionDeletions ?? [];
	}

	@override
	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += restrictionFlags.size;
		size += 1;
		size += 1;
		size += 4;
		size += ArrayHelpers.size(restrictionAdditions);
		size += ArrayHelpers.size(restrictionDeletions);
		return size;
	}

	@override
	EmbeddedAccountAddressRestrictionTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var embeddedTransactionHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != embeddedTransactionHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($embeddedTransactionHeaderReserved_1)');
		}
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var restrictionFlags = AccountRestrictionFlags().deserialize(buffer);
		buffer = buffer.sublist(restrictionFlags.size);
		var restrictionAdditionsCount = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var restrictionDeletionsCount = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var accountRestrictionTransactionBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != accountRestrictionTransactionBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($accountRestrictionTransactionBodyReserved_1)');
		}
		var restrictionAdditions = ArrayHelpers.readArrayCount(buffer, UnresolvedAddress(), restrictionAdditionsCount).map((item) => item as UnresolvedAddress).toList();
		buffer = buffer.sublist(ArrayHelpers.size(restrictionAdditions));
		var restrictionDeletions = ArrayHelpers.readArrayCount(buffer, UnresolvedAddress(), restrictionDeletionsCount).map((item) => item as UnresolvedAddress).toList();
		buffer = buffer.sublist(ArrayHelpers.size(restrictionDeletions));

		var instance = EmbeddedAccountAddressRestrictionTransactionV1(
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			restrictionFlags: restrictionFlags,
			restrictionAdditions: restrictionAdditions,
			restrictionDeletions: restrictionDeletions,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(embeddedTransactionHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + restrictionFlags.size, restrictionFlags.serialize());
		currentPos += restrictionFlags.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(restrictionAdditions.length, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(restrictionDeletions.length, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(accountRestrictionTransactionBodyReserved_1, 4));
		currentPos += 4;
		sort();
		var res_restrictionAdditions = ArrayHelpers.writeArray(buffer, restrictionAdditions, currentPos);
		currentPos = res_restrictionAdditions.item2;
		buffer = res_restrictionAdditions.item1;
		sort();
		var res_restrictionDeletions = ArrayHelpers.writeArray(buffer, restrictionDeletions, currentPos);
		currentPos = res_restrictionDeletions.item2;
		buffer = res_restrictionDeletions.item1;
		return buffer;
	}

	@override
	String toString() {
		var result = 'EmbeddedAccountAddressRestrictionTransactionV1(';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'restrictionFlags: "${restrictionFlags.toString()}", ';
		result += 'restrictionAdditions: "${restrictionAdditions.map((e) => e.toString()).toList()}", ';
		result += 'restrictionDeletions: "${restrictionDeletions.map((e) => e.toString()).toList()}", ';
		result += ')';
		return result;
	}
}


class AccountMosaicRestrictionTransactionV1 implements ISerializable, ITransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.ACCOUNT_MOSAIC_RESTRICTION.value);

	static const Map<String, String> TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'restrictionFlags': 'enum:AccountRestrictionFlags',
		'restrictionAdditions': 'array[UnresolvedMosaicId]',
		'restrictionDeletions': 'array[UnresolvedMosaicId]'
	};

	@override
	Signature signature = Signature();
	@override
	PublicKey signerPublicKey = PublicKey();
	int version = AccountMosaicRestrictionTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	TransactionType type = AccountMosaicRestrictionTransactionV1.TRANSACTION_TYPE;
	Amount fee = Amount();
	Timestamp deadline = Timestamp();
	AccountRestrictionFlags restrictionFlags = AccountRestrictionFlags.ADDRESS;
	List<UnresolvedMosaicId> restrictionAdditions = [];
	List<UnresolvedMosaicId> restrictionDeletions = [];
	final int verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field
	final int accountRestrictionTransactionBodyReserved_1 = 0; // reserved field

	AccountMosaicRestrictionTransactionV1({ 
	Signature? signature,
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	Amount? fee,
	Timestamp? deadline,
	AccountRestrictionFlags? restrictionFlags,
	List<UnresolvedMosaicId>? restrictionAdditions,
	List<UnresolvedMosaicId>? restrictionDeletions
	}) {
		this.signature = signature ?? Signature();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? AccountMosaicRestrictionTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? AccountMosaicRestrictionTransactionV1.TRANSACTION_TYPE;
		this.fee = fee ?? Amount();
		this.deadline = deadline ?? Timestamp();
		this.restrictionFlags = restrictionFlags ?? AccountRestrictionFlags.ADDRESS;
		this.restrictionAdditions = restrictionAdditions ?? [];
		this.restrictionDeletions = restrictionDeletions ?? [];
	}

	@override
	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signature.size;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += fee.size;
		size += deadline.size;
		size += restrictionFlags.size;
		size += 1;
		size += 1;
		size += 4;
		size += ArrayHelpers.size(restrictionAdditions);
		size += ArrayHelpers.size(restrictionDeletions);
		return size;
	}

	@override
	AccountMosaicRestrictionTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var verifiableEntityHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != verifiableEntityHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($verifiableEntityHeaderReserved_1)');
		}
		var signature = Signature().deserialize(buffer);
		buffer = buffer.sublist(signature.size);
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var fee = Amount().deserialize(buffer);
		buffer = buffer.sublist(fee.size);
		var deadline = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(deadline.size);
		var restrictionFlags = AccountRestrictionFlags().deserialize(buffer);
		buffer = buffer.sublist(restrictionFlags.size);
		var restrictionAdditionsCount = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var restrictionDeletionsCount = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var accountRestrictionTransactionBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != accountRestrictionTransactionBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($accountRestrictionTransactionBodyReserved_1)');
		}
		var restrictionAdditions = ArrayHelpers.readArrayCount(buffer, UnresolvedMosaicId(), restrictionAdditionsCount).map((item) => item as UnresolvedMosaicId).toList();
		buffer = buffer.sublist(ArrayHelpers.size(restrictionAdditions));
		var restrictionDeletions = ArrayHelpers.readArrayCount(buffer, UnresolvedMosaicId(), restrictionDeletionsCount).map((item) => item as UnresolvedMosaicId).toList();
		buffer = buffer.sublist(ArrayHelpers.size(restrictionDeletions));

		var instance = AccountMosaicRestrictionTransactionV1(
			signature: signature,
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			fee: fee,
			deadline: deadline,
			restrictionFlags: restrictionFlags,
			restrictionAdditions: restrictionAdditions,
			restrictionDeletions: restrictionDeletions,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signature.size, signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + fee.size, fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + deadline.size, deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + restrictionFlags.size, restrictionFlags.serialize());
		currentPos += restrictionFlags.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(restrictionAdditions.length, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(restrictionDeletions.length, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(accountRestrictionTransactionBodyReserved_1, 4));
		currentPos += 4;
		sort();
		var res_restrictionAdditions = ArrayHelpers.writeArray(buffer, restrictionAdditions, currentPos);
		currentPos = res_restrictionAdditions.item2;
		buffer = res_restrictionAdditions.item1;
		sort();
		var res_restrictionDeletions = ArrayHelpers.writeArray(buffer, restrictionDeletions, currentPos);
		currentPos = res_restrictionDeletions.item2;
		buffer = res_restrictionDeletions.item1;
		return buffer;
	}

	@override
	String toString() {
		var result = 'AccountMosaicRestrictionTransactionV1(';
		result += 'signature: "${signature.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'fee: "${fee.toString()}", ';
		result += 'deadline: "${deadline.toString()}", ';
		result += 'restrictionFlags: "${restrictionFlags.toString()}", ';
		result += 'restrictionAdditions: "${restrictionAdditions.map((e) => e.toString()).toList()}", ';
		result += 'restrictionDeletions: "${restrictionDeletions.map((e) => e.toString()).toList()}", ';
		result += ')';
		return result;
	}
}


class EmbeddedAccountMosaicRestrictionTransactionV1 implements ISerializable, IInnerTransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.ACCOUNT_MOSAIC_RESTRICTION.value);

	static const Map<String, String> TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'restrictionFlags': 'enum:AccountRestrictionFlags',
		'restrictionAdditions': 'array[UnresolvedMosaicId]',
		'restrictionDeletions': 'array[UnresolvedMosaicId]'
	};

	PublicKey signerPublicKey = PublicKey();
	int version = EmbeddedAccountMosaicRestrictionTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	TransactionType type = EmbeddedAccountMosaicRestrictionTransactionV1.TRANSACTION_TYPE;
	AccountRestrictionFlags restrictionFlags = AccountRestrictionFlags.ADDRESS;
	List<UnresolvedMosaicId> restrictionAdditions = [];
	List<UnresolvedMosaicId> restrictionDeletions = [];
	final int embeddedTransactionHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field
	final int accountRestrictionTransactionBodyReserved_1 = 0; // reserved field

	EmbeddedAccountMosaicRestrictionTransactionV1({ 
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	AccountRestrictionFlags? restrictionFlags,
	List<UnresolvedMosaicId>? restrictionAdditions,
	List<UnresolvedMosaicId>? restrictionDeletions
	}) {
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? EmbeddedAccountMosaicRestrictionTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? EmbeddedAccountMosaicRestrictionTransactionV1.TRANSACTION_TYPE;
		this.restrictionFlags = restrictionFlags ?? AccountRestrictionFlags.ADDRESS;
		this.restrictionAdditions = restrictionAdditions ?? [];
		this.restrictionDeletions = restrictionDeletions ?? [];
	}

	@override
	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += restrictionFlags.size;
		size += 1;
		size += 1;
		size += 4;
		size += ArrayHelpers.size(restrictionAdditions);
		size += ArrayHelpers.size(restrictionDeletions);
		return size;
	}

	@override
	EmbeddedAccountMosaicRestrictionTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var embeddedTransactionHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != embeddedTransactionHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($embeddedTransactionHeaderReserved_1)');
		}
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var restrictionFlags = AccountRestrictionFlags().deserialize(buffer);
		buffer = buffer.sublist(restrictionFlags.size);
		var restrictionAdditionsCount = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var restrictionDeletionsCount = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var accountRestrictionTransactionBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != accountRestrictionTransactionBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($accountRestrictionTransactionBodyReserved_1)');
		}
		var restrictionAdditions = ArrayHelpers.readArrayCount(buffer, UnresolvedMosaicId(), restrictionAdditionsCount).map((item) => item as UnresolvedMosaicId).toList();
		buffer = buffer.sublist(ArrayHelpers.size(restrictionAdditions));
		var restrictionDeletions = ArrayHelpers.readArrayCount(buffer, UnresolvedMosaicId(), restrictionDeletionsCount).map((item) => item as UnresolvedMosaicId).toList();
		buffer = buffer.sublist(ArrayHelpers.size(restrictionDeletions));

		var instance = EmbeddedAccountMosaicRestrictionTransactionV1(
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			restrictionFlags: restrictionFlags,
			restrictionAdditions: restrictionAdditions,
			restrictionDeletions: restrictionDeletions,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(embeddedTransactionHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + restrictionFlags.size, restrictionFlags.serialize());
		currentPos += restrictionFlags.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(restrictionAdditions.length, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(restrictionDeletions.length, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(accountRestrictionTransactionBodyReserved_1, 4));
		currentPos += 4;
		sort();
		var res_restrictionAdditions = ArrayHelpers.writeArray(buffer, restrictionAdditions, currentPos);
		currentPos = res_restrictionAdditions.item2;
		buffer = res_restrictionAdditions.item1;
		sort();
		var res_restrictionDeletions = ArrayHelpers.writeArray(buffer, restrictionDeletions, currentPos);
		currentPos = res_restrictionDeletions.item2;
		buffer = res_restrictionDeletions.item1;
		return buffer;
	}

	@override
	String toString() {
		var result = 'EmbeddedAccountMosaicRestrictionTransactionV1(';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'restrictionFlags: "${restrictionFlags.toString()}", ';
		result += 'restrictionAdditions: "${restrictionAdditions.map((e) => e.toString()).toList()}", ';
		result += 'restrictionDeletions: "${restrictionDeletions.map((e) => e.toString()).toList()}", ';
		result += ')';
		return result;
	}
}


class AccountOperationRestrictionTransactionV1 implements ISerializable, ITransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.ACCOUNT_OPERATION_RESTRICTION.value);

	static const Map<String, String> TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'restrictionFlags': 'enum:AccountRestrictionFlags',
		'restrictionAdditions': 'array[TransactionType]',
		'restrictionDeletions': 'array[TransactionType]'
	};

	@override
	Signature signature = Signature();
	@override
	PublicKey signerPublicKey = PublicKey();
	int version = AccountOperationRestrictionTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	TransactionType type = AccountOperationRestrictionTransactionV1.TRANSACTION_TYPE;
	Amount fee = Amount();
	Timestamp deadline = Timestamp();
	AccountRestrictionFlags restrictionFlags = AccountRestrictionFlags.ADDRESS;
	List<TransactionType> restrictionAdditions = [];
	List<TransactionType> restrictionDeletions = [];
	final int verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field
	final int accountRestrictionTransactionBodyReserved_1 = 0; // reserved field

	AccountOperationRestrictionTransactionV1({ 
	Signature? signature,
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	Amount? fee,
	Timestamp? deadline,
	AccountRestrictionFlags? restrictionFlags,
	List<TransactionType>? restrictionAdditions,
	List<TransactionType>? restrictionDeletions
	}) {
		this.signature = signature ?? Signature();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? AccountOperationRestrictionTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? AccountOperationRestrictionTransactionV1.TRANSACTION_TYPE;
		this.fee = fee ?? Amount();
		this.deadline = deadline ?? Timestamp();
		this.restrictionFlags = restrictionFlags ?? AccountRestrictionFlags.ADDRESS;
		this.restrictionAdditions = restrictionAdditions ?? [];
		this.restrictionDeletions = restrictionDeletions ?? [];
	}

	@override
	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signature.size;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += fee.size;
		size += deadline.size;
		size += restrictionFlags.size;
		size += 1;
		size += 1;
		size += 4;
		size += ArrayHelpers.size(restrictionAdditions);
		size += ArrayHelpers.size(restrictionDeletions);
		return size;
	}

	@override
	AccountOperationRestrictionTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var verifiableEntityHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != verifiableEntityHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($verifiableEntityHeaderReserved_1)');
		}
		var signature = Signature().deserialize(buffer);
		buffer = buffer.sublist(signature.size);
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var fee = Amount().deserialize(buffer);
		buffer = buffer.sublist(fee.size);
		var deadline = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(deadline.size);
		var restrictionFlags = AccountRestrictionFlags().deserialize(buffer);
		buffer = buffer.sublist(restrictionFlags.size);
		var restrictionAdditionsCount = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var restrictionDeletionsCount = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var accountRestrictionTransactionBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != accountRestrictionTransactionBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($accountRestrictionTransactionBodyReserved_1)');
		}
		var restrictionAdditions = ArrayHelpers.readArrayCount(buffer, TransactionType(), restrictionAdditionsCount).map((item) => item as TransactionType).toList();
		buffer = buffer.sublist(ArrayHelpers.size(restrictionAdditions));
		var restrictionDeletions = ArrayHelpers.readArrayCount(buffer, TransactionType(), restrictionDeletionsCount).map((item) => item as TransactionType).toList();
		buffer = buffer.sublist(ArrayHelpers.size(restrictionDeletions));

		var instance = AccountOperationRestrictionTransactionV1(
			signature: signature,
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			fee: fee,
			deadline: deadline,
			restrictionFlags: restrictionFlags,
			restrictionAdditions: restrictionAdditions,
			restrictionDeletions: restrictionDeletions,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signature.size, signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + fee.size, fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + deadline.size, deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + restrictionFlags.size, restrictionFlags.serialize());
		currentPos += restrictionFlags.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(restrictionAdditions.length, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(restrictionDeletions.length, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(accountRestrictionTransactionBodyReserved_1, 4));
		currentPos += 4;
		sort();
		var res_restrictionAdditions = ArrayHelpers.writeArray(buffer, restrictionAdditions, currentPos);
		currentPos = res_restrictionAdditions.item2;
		buffer = res_restrictionAdditions.item1;
		sort();
		var res_restrictionDeletions = ArrayHelpers.writeArray(buffer, restrictionDeletions, currentPos);
		currentPos = res_restrictionDeletions.item2;
		buffer = res_restrictionDeletions.item1;
		return buffer;
	}

	@override
	String toString() {
		var result = 'AccountOperationRestrictionTransactionV1(';
		result += 'signature: "${signature.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'fee: "${fee.toString()}", ';
		result += 'deadline: "${deadline.toString()}", ';
		result += 'restrictionFlags: "${restrictionFlags.toString()}", ';
		result += 'restrictionAdditions: "${restrictionAdditions.map((e) => e.toString()).toList()}", ';
		result += 'restrictionDeletions: "${restrictionDeletions.map((e) => e.toString()).toList()}", ';
		result += ')';
		return result;
	}
}


class EmbeddedAccountOperationRestrictionTransactionV1 implements ISerializable, IInnerTransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.ACCOUNT_OPERATION_RESTRICTION.value);

	static const Map<String, String> TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'restrictionFlags': 'enum:AccountRestrictionFlags',
		'restrictionAdditions': 'array[TransactionType]',
		'restrictionDeletions': 'array[TransactionType]'
	};

	PublicKey signerPublicKey = PublicKey();
	int version = EmbeddedAccountOperationRestrictionTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	TransactionType type = EmbeddedAccountOperationRestrictionTransactionV1.TRANSACTION_TYPE;
	AccountRestrictionFlags restrictionFlags = AccountRestrictionFlags.ADDRESS;
	List<TransactionType> restrictionAdditions = [];
	List<TransactionType> restrictionDeletions = [];
	final int embeddedTransactionHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field
	final int accountRestrictionTransactionBodyReserved_1 = 0; // reserved field

	EmbeddedAccountOperationRestrictionTransactionV1({ 
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	AccountRestrictionFlags? restrictionFlags,
	List<TransactionType>? restrictionAdditions,
	List<TransactionType>? restrictionDeletions
	}) {
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? EmbeddedAccountOperationRestrictionTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? EmbeddedAccountOperationRestrictionTransactionV1.TRANSACTION_TYPE;
		this.restrictionFlags = restrictionFlags ?? AccountRestrictionFlags.ADDRESS;
		this.restrictionAdditions = restrictionAdditions ?? [];
		this.restrictionDeletions = restrictionDeletions ?? [];
	}

	@override
	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += restrictionFlags.size;
		size += 1;
		size += 1;
		size += 4;
		size += ArrayHelpers.size(restrictionAdditions);
		size += ArrayHelpers.size(restrictionDeletions);
		return size;
	}

	@override
	EmbeddedAccountOperationRestrictionTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var embeddedTransactionHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != embeddedTransactionHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($embeddedTransactionHeaderReserved_1)');
		}
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var restrictionFlags = AccountRestrictionFlags().deserialize(buffer);
		buffer = buffer.sublist(restrictionFlags.size);
		var restrictionAdditionsCount = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var restrictionDeletionsCount = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var accountRestrictionTransactionBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != accountRestrictionTransactionBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($accountRestrictionTransactionBodyReserved_1)');
		}
		var restrictionAdditions = ArrayHelpers.readArrayCount(buffer, TransactionType(), restrictionAdditionsCount).map((item) => item as TransactionType).toList();
		buffer = buffer.sublist(ArrayHelpers.size(restrictionAdditions));
		var restrictionDeletions = ArrayHelpers.readArrayCount(buffer, TransactionType(), restrictionDeletionsCount).map((item) => item as TransactionType).toList();
		buffer = buffer.sublist(ArrayHelpers.size(restrictionDeletions));

		var instance = EmbeddedAccountOperationRestrictionTransactionV1(
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			restrictionFlags: restrictionFlags,
			restrictionAdditions: restrictionAdditions,
			restrictionDeletions: restrictionDeletions,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(embeddedTransactionHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + restrictionFlags.size, restrictionFlags.serialize());
		currentPos += restrictionFlags.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(restrictionAdditions.length, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(restrictionDeletions.length, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(accountRestrictionTransactionBodyReserved_1, 4));
		currentPos += 4;
		sort();
		var res_restrictionAdditions = ArrayHelpers.writeArray(buffer, restrictionAdditions, currentPos);
		currentPos = res_restrictionAdditions.item2;
		buffer = res_restrictionAdditions.item1;
		sort();
		var res_restrictionDeletions = ArrayHelpers.writeArray(buffer, restrictionDeletions, currentPos);
		currentPos = res_restrictionDeletions.item2;
		buffer = res_restrictionDeletions.item1;
		return buffer;
	}

	@override
	String toString() {
		var result = 'EmbeddedAccountOperationRestrictionTransactionV1(';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'restrictionFlags: "${restrictionFlags.toString()}", ';
		result += 'restrictionAdditions: "${restrictionAdditions.map((e) => e.toString()).toList()}", ';
		result += 'restrictionDeletions: "${restrictionDeletions.map((e) => e.toString()).toList()}", ';
		result += ')';
		return result;
	}
}


class MosaicAddressRestrictionTransactionV1 implements ISerializable, ITransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.MOSAIC_ADDRESS_RESTRICTION.value);

	static const Map<String, String> TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'mosaicId': 'pod:UnresolvedMosaicId',
		'targetAddress': 'pod:UnresolvedAddress'
	};

	@override
	Signature signature = Signature();
	@override
	PublicKey signerPublicKey = PublicKey();
	int version = MosaicAddressRestrictionTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	TransactionType type = MosaicAddressRestrictionTransactionV1.TRANSACTION_TYPE;
	Amount fee = Amount();
	Timestamp deadline = Timestamp();
	UnresolvedMosaicId mosaicId = UnresolvedMosaicId();
	BigInt restrictionKey = BigInt.from(0);
	BigInt previousRestrictionValue = BigInt.from(0);
	BigInt newRestrictionValue = BigInt.from(0);
	UnresolvedAddress targetAddress = UnresolvedAddress();
	final int verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field

	MosaicAddressRestrictionTransactionV1({ 
	Signature? signature,
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	Amount? fee,
	Timestamp? deadline,
	UnresolvedMosaicId? mosaicId,
	BigInt? restrictionKey,
	BigInt? previousRestrictionValue,
	BigInt? newRestrictionValue,
	UnresolvedAddress? targetAddress
	}) {
		this.signature = signature ?? Signature();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? MosaicAddressRestrictionTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? MosaicAddressRestrictionTransactionV1.TRANSACTION_TYPE;
		this.fee = fee ?? Amount();
		this.deadline = deadline ?? Timestamp();
		this.mosaicId = mosaicId ?? UnresolvedMosaicId();
		this.restrictionKey = restrictionKey ?? BigInt.from(0);
		this.previousRestrictionValue = previousRestrictionValue ?? BigInt.from(0);
		this.newRestrictionValue = newRestrictionValue ?? BigInt.from(0);
		this.targetAddress = targetAddress ?? UnresolvedAddress();
	}

	@override
	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signature.size;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += fee.size;
		size += deadline.size;
		size += mosaicId.size;
		size += 8;
		size += 8;
		size += 8;
		size += targetAddress.size;
		return size;
	}

	@override
	MosaicAddressRestrictionTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var verifiableEntityHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != verifiableEntityHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($verifiableEntityHeaderReserved_1)');
		}
		var signature = Signature().deserialize(buffer);
		buffer = buffer.sublist(signature.size);
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var fee = Amount().deserialize(buffer);
		buffer = buffer.sublist(fee.size);
		var deadline = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(deadline.size);
		var mosaicId = UnresolvedMosaicId().deserialize(buffer);
		buffer = buffer.sublist(mosaicId.size);
		var restrictionKey = bytesToInt(buffer.sublist(0, 8), 8);
		buffer = buffer.sublist(8);
		var previousRestrictionValue = bytesToInt(buffer.sublist(0, 8), 8);
		buffer = buffer.sublist(8);
		var newRestrictionValue = bytesToInt(buffer.sublist(0, 8), 8);
		buffer = buffer.sublist(8);
		var targetAddress = UnresolvedAddress().deserialize(buffer);
		buffer = buffer.sublist(targetAddress.size);

		var instance = MosaicAddressRestrictionTransactionV1(
			signature: signature,
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			fee: fee,
			deadline: deadline,
			mosaicId: mosaicId,
			restrictionKey: restrictionKey,
			previousRestrictionValue: previousRestrictionValue,
			newRestrictionValue: newRestrictionValue,
			targetAddress: targetAddress,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signature.size, signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + fee.size, fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + deadline.size, deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + mosaicId.size, mosaicId.serialize());
		currentPos += mosaicId.size;
		buffer.setRange(currentPos, currentPos + 8, intToBytes(restrictionKey, 8));
		currentPos += 8;
		buffer.setRange(currentPos, currentPos + 8, intToBytes(previousRestrictionValue, 8));
		currentPos += 8;
		buffer.setRange(currentPos, currentPos + 8, intToBytes(newRestrictionValue, 8));
		currentPos += 8;
		buffer.setRange(currentPos, currentPos + targetAddress.size, targetAddress.serialize());
		currentPos += targetAddress.size;
		return buffer;
	}

	@override
	String toString() {
		var result = 'MosaicAddressRestrictionTransactionV1(';
		result += 'signature: "${signature.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'fee: "${fee.toString()}", ';
		result += 'deadline: "${deadline.toString()}", ';
		result += 'mosaicId: "${mosaicId.toString()}", ';
		result += 'restrictionKey: "0x${intToHex(restrictionKey)}", ';
		result += 'previousRestrictionValue: "0x${intToHex(previousRestrictionValue)}", ';
		result += 'newRestrictionValue: "0x${intToHex(newRestrictionValue)}", ';
		result += 'targetAddress: "${targetAddress.toString()}", ';
		result += ')';
		return result;
	}
}


class EmbeddedMosaicAddressRestrictionTransactionV1 implements ISerializable, IInnerTransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.MOSAIC_ADDRESS_RESTRICTION.value);

	static const Map<String, String> TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'mosaicId': 'pod:UnresolvedMosaicId',
		'targetAddress': 'pod:UnresolvedAddress'
	};

	PublicKey signerPublicKey = PublicKey();
	int version = EmbeddedMosaicAddressRestrictionTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	TransactionType type = EmbeddedMosaicAddressRestrictionTransactionV1.TRANSACTION_TYPE;
	UnresolvedMosaicId mosaicId = UnresolvedMosaicId();
	BigInt restrictionKey = BigInt.from(0);
	BigInt previousRestrictionValue = BigInt.from(0);
	BigInt newRestrictionValue = BigInt.from(0);
	UnresolvedAddress targetAddress = UnresolvedAddress();
	final int embeddedTransactionHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field

	EmbeddedMosaicAddressRestrictionTransactionV1({ 
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	UnresolvedMosaicId? mosaicId,
	BigInt? restrictionKey,
	BigInt? previousRestrictionValue,
	BigInt? newRestrictionValue,
	UnresolvedAddress? targetAddress
	}) {
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? EmbeddedMosaicAddressRestrictionTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? EmbeddedMosaicAddressRestrictionTransactionV1.TRANSACTION_TYPE;
		this.mosaicId = mosaicId ?? UnresolvedMosaicId();
		this.restrictionKey = restrictionKey ?? BigInt.from(0);
		this.previousRestrictionValue = previousRestrictionValue ?? BigInt.from(0);
		this.newRestrictionValue = newRestrictionValue ?? BigInt.from(0);
		this.targetAddress = targetAddress ?? UnresolvedAddress();
	}

	@override
	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += mosaicId.size;
		size += 8;
		size += 8;
		size += 8;
		size += targetAddress.size;
		return size;
	}

	@override
	EmbeddedMosaicAddressRestrictionTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var embeddedTransactionHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != embeddedTransactionHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($embeddedTransactionHeaderReserved_1)');
		}
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var mosaicId = UnresolvedMosaicId().deserialize(buffer);
		buffer = buffer.sublist(mosaicId.size);
		var restrictionKey = bytesToInt(buffer.sublist(0, 8), 8);
		buffer = buffer.sublist(8);
		var previousRestrictionValue = bytesToInt(buffer.sublist(0, 8), 8);
		buffer = buffer.sublist(8);
		var newRestrictionValue = bytesToInt(buffer.sublist(0, 8), 8);
		buffer = buffer.sublist(8);
		var targetAddress = UnresolvedAddress().deserialize(buffer);
		buffer = buffer.sublist(targetAddress.size);

		var instance = EmbeddedMosaicAddressRestrictionTransactionV1(
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			mosaicId: mosaicId,
			restrictionKey: restrictionKey,
			previousRestrictionValue: previousRestrictionValue,
			newRestrictionValue: newRestrictionValue,
			targetAddress: targetAddress,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(embeddedTransactionHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + mosaicId.size, mosaicId.serialize());
		currentPos += mosaicId.size;
		buffer.setRange(currentPos, currentPos + 8, intToBytes(restrictionKey, 8));
		currentPos += 8;
		buffer.setRange(currentPos, currentPos + 8, intToBytes(previousRestrictionValue, 8));
		currentPos += 8;
		buffer.setRange(currentPos, currentPos + 8, intToBytes(newRestrictionValue, 8));
		currentPos += 8;
		buffer.setRange(currentPos, currentPos + targetAddress.size, targetAddress.serialize());
		currentPos += targetAddress.size;
		return buffer;
	}

	@override
	String toString() {
		var result = 'EmbeddedMosaicAddressRestrictionTransactionV1(';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'mosaicId: "${mosaicId.toString()}", ';
		result += 'restrictionKey: "0x${intToHex(restrictionKey)}", ';
		result += 'previousRestrictionValue: "0x${intToHex(previousRestrictionValue)}", ';
		result += 'newRestrictionValue: "0x${intToHex(newRestrictionValue)}", ';
		result += 'targetAddress: "${targetAddress.toString()}", ';
		result += ')';
		return result;
	}
}


class MosaicRestrictionKey extends BaseValue implements ISerializable {
	static const int SIZE = 8;

	MosaicRestrictionKey([dynamic mosaicRestrictionKey]) : super(SIZE, mosaicRestrictionKey ?? BigInt.from(0));

	@override
	MosaicRestrictionKey deserialize(Uint8List payload) {
		return MosaicRestrictionKey(bytesToInt(payload.sublist(0, 8), 8));
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(SIZE);
		buffer.setRange(0, 0 + 8, intToBytes(value, 8));
		return buffer;
	}
}


class MosaicRestrictionType implements ISerializable {
	static final NONE = MosaicRestrictionType(0);
	static final EQ = MosaicRestrictionType(1);
	static final NE = MosaicRestrictionType(2);
	static final LT = MosaicRestrictionType(3);
	static final LE = MosaicRestrictionType(4);
	static final GT = MosaicRestrictionType(5);
	static final GE = MosaicRestrictionType(6);

	int value = 0;

	static final _flags = {
		0: 'NONE',
		1: 'EQ',
		2: 'NE',
		3: 'LT',
		4: 'LE',
		5: 'GT',
		6: 'GE',
	};

	MosaicRestrictionType([int? _value]) {
		value = _value ?? 0;
	}

	@override
	int get size {
		return 1;
	}

	@override
	MosaicRestrictionType deserialize(Uint8List payload) {
		var byteData = ByteData.sublistView(payload);
		return MosaicRestrictionType(byteData.getUint8(0));
	}

	@override
	Uint8List serialize() {
		var byteData = ByteData(1)..setUint8(0, value);
		return byteData.buffer.asUint8List();
	}

	@override
	String toString() {
		return 'MosaicRestrictionType.${_flags[value]}';
	}
}


class MosaicGlobalRestrictionTransactionV1 implements ISerializable, ITransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.MOSAIC_GLOBAL_RESTRICTION.value);

	static const Map<String, String> TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'mosaicId': 'pod:UnresolvedMosaicId',
		'referenceMosaicId': 'pod:UnresolvedMosaicId',
		'previousRestrictionType': 'enum:MosaicRestrictionType',
		'newRestrictionType': 'enum:MosaicRestrictionType'
	};

	@override
	Signature signature = Signature();
	@override
	PublicKey signerPublicKey = PublicKey();
	int version = MosaicGlobalRestrictionTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	TransactionType type = MosaicGlobalRestrictionTransactionV1.TRANSACTION_TYPE;
	Amount fee = Amount();
	Timestamp deadline = Timestamp();
	UnresolvedMosaicId mosaicId = UnresolvedMosaicId();
	UnresolvedMosaicId referenceMosaicId = UnresolvedMosaicId();
	BigInt restrictionKey = BigInt.from(0);
	BigInt previousRestrictionValue = BigInt.from(0);
	BigInt newRestrictionValue = BigInt.from(0);
	MosaicRestrictionType previousRestrictionType = MosaicRestrictionType.NONE;
	MosaicRestrictionType newRestrictionType = MosaicRestrictionType.NONE;
	final int verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field

	MosaicGlobalRestrictionTransactionV1({ 
	Signature? signature,
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	Amount? fee,
	Timestamp? deadline,
	UnresolvedMosaicId? mosaicId,
	UnresolvedMosaicId? referenceMosaicId,
	BigInt? restrictionKey,
	BigInt? previousRestrictionValue,
	BigInt? newRestrictionValue,
	MosaicRestrictionType? previousRestrictionType,
	MosaicRestrictionType? newRestrictionType
	}) {
		this.signature = signature ?? Signature();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? MosaicGlobalRestrictionTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? MosaicGlobalRestrictionTransactionV1.TRANSACTION_TYPE;
		this.fee = fee ?? Amount();
		this.deadline = deadline ?? Timestamp();
		this.mosaicId = mosaicId ?? UnresolvedMosaicId();
		this.referenceMosaicId = referenceMosaicId ?? UnresolvedMosaicId();
		this.restrictionKey = restrictionKey ?? BigInt.from(0);
		this.previousRestrictionValue = previousRestrictionValue ?? BigInt.from(0);
		this.newRestrictionValue = newRestrictionValue ?? BigInt.from(0);
		this.previousRestrictionType = previousRestrictionType ?? MosaicRestrictionType.NONE;
		this.newRestrictionType = newRestrictionType ?? MosaicRestrictionType.NONE;
	}

	@override
	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signature.size;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += fee.size;
		size += deadline.size;
		size += mosaicId.size;
		size += referenceMosaicId.size;
		size += 8;
		size += 8;
		size += 8;
		size += previousRestrictionType.size;
		size += newRestrictionType.size;
		return size;
	}

	@override
	MosaicGlobalRestrictionTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var verifiableEntityHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != verifiableEntityHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($verifiableEntityHeaderReserved_1)');
		}
		var signature = Signature().deserialize(buffer);
		buffer = buffer.sublist(signature.size);
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var fee = Amount().deserialize(buffer);
		buffer = buffer.sublist(fee.size);
		var deadline = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(deadline.size);
		var mosaicId = UnresolvedMosaicId().deserialize(buffer);
		buffer = buffer.sublist(mosaicId.size);
		var referenceMosaicId = UnresolvedMosaicId().deserialize(buffer);
		buffer = buffer.sublist(referenceMosaicId.size);
		var restrictionKey = bytesToInt(buffer.sublist(0, 8), 8);
		buffer = buffer.sublist(8);
		var previousRestrictionValue = bytesToInt(buffer.sublist(0, 8), 8);
		buffer = buffer.sublist(8);
		var newRestrictionValue = bytesToInt(buffer.sublist(0, 8), 8);
		buffer = buffer.sublist(8);
		var previousRestrictionType = MosaicRestrictionType().deserialize(buffer);
		buffer = buffer.sublist(previousRestrictionType.size);
		var newRestrictionType = MosaicRestrictionType().deserialize(buffer);
		buffer = buffer.sublist(newRestrictionType.size);

		var instance = MosaicGlobalRestrictionTransactionV1(
			signature: signature,
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			fee: fee,
			deadline: deadline,
			mosaicId: mosaicId,
			referenceMosaicId: referenceMosaicId,
			restrictionKey: restrictionKey,
			previousRestrictionValue: previousRestrictionValue,
			newRestrictionValue: newRestrictionValue,
			previousRestrictionType: previousRestrictionType,
			newRestrictionType: newRestrictionType,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signature.size, signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + fee.size, fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + deadline.size, deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + mosaicId.size, mosaicId.serialize());
		currentPos += mosaicId.size;
		buffer.setRange(currentPos, currentPos + referenceMosaicId.size, referenceMosaicId.serialize());
		currentPos += referenceMosaicId.size;
		buffer.setRange(currentPos, currentPos + 8, intToBytes(restrictionKey, 8));
		currentPos += 8;
		buffer.setRange(currentPos, currentPos + 8, intToBytes(previousRestrictionValue, 8));
		currentPos += 8;
		buffer.setRange(currentPos, currentPos + 8, intToBytes(newRestrictionValue, 8));
		currentPos += 8;
		buffer.setRange(currentPos, currentPos + previousRestrictionType.size, previousRestrictionType.serialize());
		currentPos += previousRestrictionType.size;
		buffer.setRange(currentPos, currentPos + newRestrictionType.size, newRestrictionType.serialize());
		currentPos += newRestrictionType.size;
		return buffer;
	}

	@override
	String toString() {
		var result = 'MosaicGlobalRestrictionTransactionV1(';
		result += 'signature: "${signature.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'fee: "${fee.toString()}", ';
		result += 'deadline: "${deadline.toString()}", ';
		result += 'mosaicId: "${mosaicId.toString()}", ';
		result += 'referenceMosaicId: "${referenceMosaicId.toString()}", ';
		result += 'restrictionKey: "0x${intToHex(restrictionKey)}", ';
		result += 'previousRestrictionValue: "0x${intToHex(previousRestrictionValue)}", ';
		result += 'newRestrictionValue: "0x${intToHex(newRestrictionValue)}", ';
		result += 'previousRestrictionType: "${previousRestrictionType.toString()}", ';
		result += 'newRestrictionType: "${newRestrictionType.toString()}", ';
		result += ')';
		return result;
	}
}


class EmbeddedMosaicGlobalRestrictionTransactionV1 implements ISerializable, IInnerTransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.MOSAIC_GLOBAL_RESTRICTION.value);

	static const Map<String, String> TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'mosaicId': 'pod:UnresolvedMosaicId',
		'referenceMosaicId': 'pod:UnresolvedMosaicId',
		'previousRestrictionType': 'enum:MosaicRestrictionType',
		'newRestrictionType': 'enum:MosaicRestrictionType'
	};

	PublicKey signerPublicKey = PublicKey();
	int version = EmbeddedMosaicGlobalRestrictionTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	TransactionType type = EmbeddedMosaicGlobalRestrictionTransactionV1.TRANSACTION_TYPE;
	UnresolvedMosaicId mosaicId = UnresolvedMosaicId();
	UnresolvedMosaicId referenceMosaicId = UnresolvedMosaicId();
	BigInt restrictionKey = BigInt.from(0);
	BigInt previousRestrictionValue = BigInt.from(0);
	BigInt newRestrictionValue = BigInt.from(0);
	MosaicRestrictionType previousRestrictionType = MosaicRestrictionType.NONE;
	MosaicRestrictionType newRestrictionType = MosaicRestrictionType.NONE;
	final int embeddedTransactionHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field

	EmbeddedMosaicGlobalRestrictionTransactionV1({ 
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	UnresolvedMosaicId? mosaicId,
	UnresolvedMosaicId? referenceMosaicId,
	BigInt? restrictionKey,
	BigInt? previousRestrictionValue,
	BigInt? newRestrictionValue,
	MosaicRestrictionType? previousRestrictionType,
	MosaicRestrictionType? newRestrictionType
	}) {
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? EmbeddedMosaicGlobalRestrictionTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? EmbeddedMosaicGlobalRestrictionTransactionV1.TRANSACTION_TYPE;
		this.mosaicId = mosaicId ?? UnresolvedMosaicId();
		this.referenceMosaicId = referenceMosaicId ?? UnresolvedMosaicId();
		this.restrictionKey = restrictionKey ?? BigInt.from(0);
		this.previousRestrictionValue = previousRestrictionValue ?? BigInt.from(0);
		this.newRestrictionValue = newRestrictionValue ?? BigInt.from(0);
		this.previousRestrictionType = previousRestrictionType ?? MosaicRestrictionType.NONE;
		this.newRestrictionType = newRestrictionType ?? MosaicRestrictionType.NONE;
	}

	@override
	void sort() {
		// empty body
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += mosaicId.size;
		size += referenceMosaicId.size;
		size += 8;
		size += 8;
		size += 8;
		size += previousRestrictionType.size;
		size += newRestrictionType.size;
		return size;
	}

	@override
	EmbeddedMosaicGlobalRestrictionTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var embeddedTransactionHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != embeddedTransactionHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($embeddedTransactionHeaderReserved_1)');
		}
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var mosaicId = UnresolvedMosaicId().deserialize(buffer);
		buffer = buffer.sublist(mosaicId.size);
		var referenceMosaicId = UnresolvedMosaicId().deserialize(buffer);
		buffer = buffer.sublist(referenceMosaicId.size);
		var restrictionKey = bytesToInt(buffer.sublist(0, 8), 8);
		buffer = buffer.sublist(8);
		var previousRestrictionValue = bytesToInt(buffer.sublist(0, 8), 8);
		buffer = buffer.sublist(8);
		var newRestrictionValue = bytesToInt(buffer.sublist(0, 8), 8);
		buffer = buffer.sublist(8);
		var previousRestrictionType = MosaicRestrictionType().deserialize(buffer);
		buffer = buffer.sublist(previousRestrictionType.size);
		var newRestrictionType = MosaicRestrictionType().deserialize(buffer);
		buffer = buffer.sublist(newRestrictionType.size);

		var instance = EmbeddedMosaicGlobalRestrictionTransactionV1(
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			mosaicId: mosaicId,
			referenceMosaicId: referenceMosaicId,
			restrictionKey: restrictionKey,
			previousRestrictionValue: previousRestrictionValue,
			newRestrictionValue: newRestrictionValue,
			previousRestrictionType: previousRestrictionType,
			newRestrictionType: newRestrictionType,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(embeddedTransactionHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + mosaicId.size, mosaicId.serialize());
		currentPos += mosaicId.size;
		buffer.setRange(currentPos, currentPos + referenceMosaicId.size, referenceMosaicId.serialize());
		currentPos += referenceMosaicId.size;
		buffer.setRange(currentPos, currentPos + 8, intToBytes(restrictionKey, 8));
		currentPos += 8;
		buffer.setRange(currentPos, currentPos + 8, intToBytes(previousRestrictionValue, 8));
		currentPos += 8;
		buffer.setRange(currentPos, currentPos + 8, intToBytes(newRestrictionValue, 8));
		currentPos += 8;
		buffer.setRange(currentPos, currentPos + previousRestrictionType.size, previousRestrictionType.serialize());
		currentPos += previousRestrictionType.size;
		buffer.setRange(currentPos, currentPos + newRestrictionType.size, newRestrictionType.serialize());
		currentPos += newRestrictionType.size;
		return buffer;
	}

	@override
	String toString() {
		var result = 'EmbeddedMosaicGlobalRestrictionTransactionV1(';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'mosaicId: "${mosaicId.toString()}", ';
		result += 'referenceMosaicId: "${referenceMosaicId.toString()}", ';
		result += 'restrictionKey: "0x${intToHex(restrictionKey)}", ';
		result += 'previousRestrictionValue: "0x${intToHex(previousRestrictionValue)}", ';
		result += 'newRestrictionValue: "0x${intToHex(newRestrictionValue)}", ';
		result += 'previousRestrictionType: "${previousRestrictionType.toString()}", ';
		result += 'newRestrictionType: "${newRestrictionType.toString()}", ';
		result += ')';
		return result;
	}
}


class TransferTransactionV1 implements ISerializable, ITransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.TRANSFER.value);

	static const Map<String, String> TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'recipientAddress': 'pod:UnresolvedAddress',
		'mosaics': 'array[UnresolvedMosaic]',
		'message': 'bytes_array'
	};

	@override
	Signature signature = Signature();
	@override
	PublicKey signerPublicKey = PublicKey();
	int version = TransferTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	TransactionType type = TransferTransactionV1.TRANSACTION_TYPE;
	Amount fee = Amount();
	Timestamp deadline = Timestamp();
	UnresolvedAddress recipientAddress = UnresolvedAddress();
	List<UnresolvedMosaic> mosaics = [];
	Uint8List message = Uint8List(0);
	final int verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field
	final int transferTransactionBodyReserved_1 = 0; // reserved field
	final int transferTransactionBodyReserved_2 = 0; // reserved field

	TransferTransactionV1({ 
	Signature? signature,
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	Amount? fee,
	Timestamp? deadline,
	UnresolvedAddress? recipientAddress,
	List<UnresolvedMosaic>? mosaics,
	Uint8List? message
	}) {
		this.signature = signature ?? Signature();
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? TransferTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? TransferTransactionV1.TRANSACTION_TYPE;
		this.fee = fee ?? Amount();
		this.deadline = deadline ?? Timestamp();
		this.recipientAddress = recipientAddress ?? UnresolvedAddress();
		this.mosaics = mosaics ?? [];
		this.message = message ?? Uint8List(0);
	}

	@override
	void sort() {
		mosaics.sort((lhs, rhs) {
			return ArrayHelpers.deepCompare(ArrayHelpers.getValue(lhs.mosaicId), ArrayHelpers.getValue(rhs.mosaicId));
		});
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signature.size;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += fee.size;
		size += deadline.size;
		size += recipientAddress.size;
		size += 2;
		size += 1;
		size += 1;
		size += 4;
		size += ArrayHelpers.size(mosaics);
		size += message.lengthInBytes;
		return size;
	}

	@override
	TransferTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var verifiableEntityHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != verifiableEntityHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($verifiableEntityHeaderReserved_1)');
		}
		var signature = Signature().deserialize(buffer);
		buffer = buffer.sublist(signature.size);
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var fee = Amount().deserialize(buffer);
		buffer = buffer.sublist(fee.size);
		var deadline = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(deadline.size);
		var recipientAddress = UnresolvedAddress().deserialize(buffer);
		buffer = buffer.sublist(recipientAddress.size);
		var messageSize = bytesToInt(buffer.sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		var mosaicsCount = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var transferTransactionBodyReserved_1 = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		if (0 != transferTransactionBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($transferTransactionBodyReserved_1)');
		}
		var transferTransactionBodyReserved_2 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != transferTransactionBodyReserved_2) {
			throw RangeError('Invalid value of reserved field ($transferTransactionBodyReserved_2)');
		}
		var mosaics = ArrayHelpers.readArrayCount(buffer, UnresolvedMosaic(), mosaicsCount, (e) { return ArrayHelpers.getValue(e.mosaicId);}).map((item) => item as UnresolvedMosaic).toList();
		buffer = buffer.sublist(ArrayHelpers.size(mosaics));
		var message = Uint8List.fromList(buffer.sublist(0, messageSize));
		buffer = buffer.sublist(messageSize);

		var instance = TransferTransactionV1(
			signature: signature,
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			fee: fee,
			deadline: deadline,
			recipientAddress: recipientAddress,
			mosaics: mosaics,
			message: message,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signature.size, signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + fee.size, fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + deadline.size, deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + recipientAddress.size, recipientAddress.serialize());
		currentPos += recipientAddress.size;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(message.length, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(mosaics.length, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(transferTransactionBodyReserved_1, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(transferTransactionBodyReserved_2, 4));
		currentPos += 4;
		sort();
		var res_mosaics = ArrayHelpers.writeArray(buffer, mosaics, currentPos, (e) { return ArrayHelpers.getValue(e.mosaicId);});
		currentPos = res_mosaics.item2;
		buffer = res_mosaics.item1;
		buffer.setRange(currentPos, currentPos + message.lengthInBytes, message);
		currentPos += message.lengthInBytes;
		return buffer;
	}

	@override
	String toString() {
		var result = 'TransferTransactionV1(';
		result += 'signature: "${signature.toString()}", ';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'fee: "${fee.toString()}", ';
		result += 'deadline: "${deadline.toString()}", ';
		result += 'recipientAddress: "${recipientAddress.toString()}", ';
		result += 'mosaics: "${mosaics.map((e) => e.toString()).toList()}", ';
		result += 'message: "${bytesToHex(message)}", ';
		result += ')';
		return result;
	}
}


class EmbeddedTransferTransactionV1 implements ISerializable, IInnerTransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.TRANSFER.value);

	static const Map<String, String> TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'recipientAddress': 'pod:UnresolvedAddress',
		'mosaics': 'array[UnresolvedMosaic]',
		'message': 'bytes_array'
	};

	PublicKey signerPublicKey = PublicKey();
	int version = EmbeddedTransferTransactionV1.TRANSACTION_VERSION;
	NetworkType network = NetworkType.MAINNET;
	TransactionType type = EmbeddedTransferTransactionV1.TRANSACTION_TYPE;
	UnresolvedAddress recipientAddress = UnresolvedAddress();
	List<UnresolvedMosaic> mosaics = [];
	Uint8List message = Uint8List(0);
	final int embeddedTransactionHeaderReserved_1 = 0; // reserved field
	final int entityBodyReserved_1 = 0; // reserved field
	final int transferTransactionBodyReserved_1 = 0; // reserved field
	final int transferTransactionBodyReserved_2 = 0; // reserved field

	EmbeddedTransferTransactionV1({ 
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	UnresolvedAddress? recipientAddress,
	List<UnresolvedMosaic>? mosaics,
	Uint8List? message
	}) {
		this.signerPublicKey = signerPublicKey ?? PublicKey();
		this.version = version ?? EmbeddedTransferTransactionV1.TRANSACTION_VERSION;
		this.network = network ?? NetworkType.MAINNET;
		this.type = type ?? EmbeddedTransferTransactionV1.TRANSACTION_TYPE;
		this.recipientAddress = recipientAddress ?? UnresolvedAddress();
		this.mosaics = mosaics ?? [];
		this.message = message ?? Uint8List(0);
	}

	@override
	void sort() {
		mosaics.sort((lhs, rhs) {
			return ArrayHelpers.deepCompare(ArrayHelpers.getValue(lhs.mosaicId), ArrayHelpers.getValue(rhs.mosaicId));
		});
	}

	@override
	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		size += recipientAddress.size;
		size += 2;
		size += 1;
		size += 1;
		size += 4;
		size += ArrayHelpers.size(mosaics);
		size += message.lengthInBytes;
		return size;
	}

	@override
	EmbeddedTransferTransactionV1 deserialize(Uint8List payload) {
		var buffer = payload;
		var size = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(0, size);
		buffer = buffer.sublist(4);
		var embeddedTransactionHeaderReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != embeddedTransactionHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($embeddedTransactionHeaderReserved_1)');
		}
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var recipientAddress = UnresolvedAddress().deserialize(buffer);
		buffer = buffer.sublist(recipientAddress.size);
		var messageSize = bytesToInt(buffer.sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		var mosaicsCount = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var transferTransactionBodyReserved_1 = bytesToInt(buffer.sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		if (0 != transferTransactionBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($transferTransactionBodyReserved_1)');
		}
		var transferTransactionBodyReserved_2 = bytesToInt(buffer.sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != transferTransactionBodyReserved_2) {
			throw RangeError('Invalid value of reserved field ($transferTransactionBodyReserved_2)');
		}
		var mosaics = ArrayHelpers.readArrayCount(buffer, UnresolvedMosaic(), mosaicsCount, (e) { return ArrayHelpers.getValue(e.mosaicId);}).map((item) => item as UnresolvedMosaic).toList();
		buffer = buffer.sublist(ArrayHelpers.size(mosaics));
		var message = Uint8List.fromList(buffer.sublist(0, messageSize));
		buffer = buffer.sublist(messageSize);

		var instance = EmbeddedTransferTransactionV1(
			signerPublicKey: signerPublicKey,
			version: version,
			network: network,
			type: type,
			recipientAddress: recipientAddress,
			mosaics: mosaics,
			message: message,
		);
		return instance;
	}

	@override
	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(embeddedTransactionHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + signerPublicKey.size, signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + network.size, network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + type.size, type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + recipientAddress.size, recipientAddress.serialize());
		currentPos += recipientAddress.size;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(message.length, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(mosaics.length, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(transferTransactionBodyReserved_1, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(transferTransactionBodyReserved_2, 4));
		currentPos += 4;
		sort();
		var res_mosaics = ArrayHelpers.writeArray(buffer, mosaics, currentPos, (e) { return ArrayHelpers.getValue(e.mosaicId);});
		currentPos = res_mosaics.item2;
		buffer = res_mosaics.item1;
		buffer.setRange(currentPos, currentPos + message.lengthInBytes, message);
		currentPos += message.lengthInBytes;
		return buffer;
	}

	@override
	String toString() {
		var result = 'EmbeddedTransferTransactionV1(';
		result += 'signerPublicKey: "${signerPublicKey.toString()}", ';
		result += 'version: "0x${intToHex(version)}", ';
		result += 'network: "${network.toString()}", ';
		result += 'type: "${type.toString()}", ';
		result += 'recipientAddress: "${recipientAddress.toString()}", ';
		result += 'mosaics: "${mosaics.map((e) => e.toString()).toList()}", ';
		result += 'message: "${bytesToHex(message)}", ';
		result += ')';
		return result;
	}
}


class TransactionFactory implements ISerializable {
	@override
	dynamic deserialize(dynamic payload) {
		if(payload is String){
			tryHexString(payload);
			payload = hexToBytes(payload);
		}
		Uint8List buffer = payload;
		var parent = Transaction().deserialize(buffer);
		var mapping = <(int, int), ISerializable>{
			(AccountKeyLinkTransactionV1.TRANSACTION_TYPE.value, AccountKeyLinkTransactionV1.TRANSACTION_VERSION): AccountKeyLinkTransactionV1(),
			(NodeKeyLinkTransactionV1.TRANSACTION_TYPE.value, NodeKeyLinkTransactionV1.TRANSACTION_VERSION): NodeKeyLinkTransactionV1(),
			(AggregateCompleteTransactionV1.TRANSACTION_TYPE.value, AggregateCompleteTransactionV1.TRANSACTION_VERSION): AggregateCompleteTransactionV1(),
			(AggregateCompleteTransactionV2.TRANSACTION_TYPE.value, AggregateCompleteTransactionV2.TRANSACTION_VERSION): AggregateCompleteTransactionV2(),
			(AggregateBondedTransactionV1.TRANSACTION_TYPE.value, AggregateBondedTransactionV1.TRANSACTION_VERSION): AggregateBondedTransactionV1(),
			(AggregateBondedTransactionV2.TRANSACTION_TYPE.value, AggregateBondedTransactionV2.TRANSACTION_VERSION): AggregateBondedTransactionV2(),
			(VotingKeyLinkTransactionV1.TRANSACTION_TYPE.value, VotingKeyLinkTransactionV1.TRANSACTION_VERSION): VotingKeyLinkTransactionV1(),
			(VrfKeyLinkTransactionV1.TRANSACTION_TYPE.value, VrfKeyLinkTransactionV1.TRANSACTION_VERSION): VrfKeyLinkTransactionV1(),
			(HashLockTransactionV1.TRANSACTION_TYPE.value, HashLockTransactionV1.TRANSACTION_VERSION): HashLockTransactionV1(),
			(SecretLockTransactionV1.TRANSACTION_TYPE.value, SecretLockTransactionV1.TRANSACTION_VERSION): SecretLockTransactionV1(),
			(SecretProofTransactionV1.TRANSACTION_TYPE.value, SecretProofTransactionV1.TRANSACTION_VERSION): SecretProofTransactionV1(),
			(AccountMetadataTransactionV1.TRANSACTION_TYPE.value, AccountMetadataTransactionV1.TRANSACTION_VERSION): AccountMetadataTransactionV1(),
			(MosaicMetadataTransactionV1.TRANSACTION_TYPE.value, MosaicMetadataTransactionV1.TRANSACTION_VERSION): MosaicMetadataTransactionV1(),
			(NamespaceMetadataTransactionV1.TRANSACTION_TYPE.value, NamespaceMetadataTransactionV1.TRANSACTION_VERSION): NamespaceMetadataTransactionV1(),
			(MosaicDefinitionTransactionV1.TRANSACTION_TYPE.value, MosaicDefinitionTransactionV1.TRANSACTION_VERSION): MosaicDefinitionTransactionV1(),
			(MosaicSupplyChangeTransactionV1.TRANSACTION_TYPE.value, MosaicSupplyChangeTransactionV1.TRANSACTION_VERSION): MosaicSupplyChangeTransactionV1(),
			(MosaicSupplyRevocationTransactionV1.TRANSACTION_TYPE.value, MosaicSupplyRevocationTransactionV1.TRANSACTION_VERSION): MosaicSupplyRevocationTransactionV1(),
			(MultisigAccountModificationTransactionV1.TRANSACTION_TYPE.value, MultisigAccountModificationTransactionV1.TRANSACTION_VERSION): MultisigAccountModificationTransactionV1(),
			(AddressAliasTransactionV1.TRANSACTION_TYPE.value, AddressAliasTransactionV1.TRANSACTION_VERSION): AddressAliasTransactionV1(),
			(MosaicAliasTransactionV1.TRANSACTION_TYPE.value, MosaicAliasTransactionV1.TRANSACTION_VERSION): MosaicAliasTransactionV1(),
			(NamespaceRegistrationTransactionV1.TRANSACTION_TYPE.value, NamespaceRegistrationTransactionV1.TRANSACTION_VERSION): NamespaceRegistrationTransactionV1(),
			(AccountAddressRestrictionTransactionV1.TRANSACTION_TYPE.value, AccountAddressRestrictionTransactionV1.TRANSACTION_VERSION): AccountAddressRestrictionTransactionV1(),
			(AccountMosaicRestrictionTransactionV1.TRANSACTION_TYPE.value, AccountMosaicRestrictionTransactionV1.TRANSACTION_VERSION): AccountMosaicRestrictionTransactionV1(),
			(AccountOperationRestrictionTransactionV1.TRANSACTION_TYPE.value, AccountOperationRestrictionTransactionV1.TRANSACTION_VERSION): AccountOperationRestrictionTransactionV1(),
			(MosaicAddressRestrictionTransactionV1.TRANSACTION_TYPE.value, MosaicAddressRestrictionTransactionV1.TRANSACTION_VERSION): MosaicAddressRestrictionTransactionV1(),
			(MosaicGlobalRestrictionTransactionV1.TRANSACTION_TYPE.value, MosaicGlobalRestrictionTransactionV1.TRANSACTION_VERSION): MosaicGlobalRestrictionTransactionV1(),
			(TransferTransactionV1.TRANSACTION_TYPE.value, TransferTransactionV1.TRANSACTION_VERSION): TransferTransactionV1()
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
			'node_key_link_transaction_v1': () => NodeKeyLinkTransactionV1(),
			'aggregate_complete_transaction_v1': () => AggregateCompleteTransactionV1(),
			'aggregate_complete_transaction_v2': () => AggregateCompleteTransactionV2(),
			'aggregate_bonded_transaction_v1': () => AggregateBondedTransactionV1(),
			'aggregate_bonded_transaction_v2': () => AggregateBondedTransactionV2(),
			'voting_key_link_transaction_v1': () => VotingKeyLinkTransactionV1(),
			'vrf_key_link_transaction_v1': () => VrfKeyLinkTransactionV1(),
			'hash_lock_transaction_v1': () => HashLockTransactionV1(),
			'secret_lock_transaction_v1': () => SecretLockTransactionV1(),
			'secret_proof_transaction_v1': () => SecretProofTransactionV1(),
			'account_metadata_transaction_v1': () => AccountMetadataTransactionV1(),
			'mosaic_metadata_transaction_v1': () => MosaicMetadataTransactionV1(),
			'namespace_metadata_transaction_v1': () => NamespaceMetadataTransactionV1(),
			'mosaic_definition_transaction_v1': () => MosaicDefinitionTransactionV1(),
			'mosaic_supply_change_transaction_v1': () => MosaicSupplyChangeTransactionV1(),
			'mosaic_supply_revocation_transaction_v1': () => MosaicSupplyRevocationTransactionV1(),
			'multisig_account_modification_transaction_v1': () => MultisigAccountModificationTransactionV1(),
			'address_alias_transaction_v1': () => AddressAliasTransactionV1(),
			'mosaic_alias_transaction_v1': () => MosaicAliasTransactionV1(),
			'namespace_registration_transaction_v1': () => NamespaceRegistrationTransactionV1(),
			'account_address_restriction_transaction_v1': () => AccountAddressRestrictionTransactionV1(),
			'account_mosaic_restriction_transaction_v1': () => AccountMosaicRestrictionTransactionV1(),
			'account_operation_restriction_transaction_v1': () => AccountOperationRestrictionTransactionV1(),
			'mosaic_address_restriction_transaction_v1': () => MosaicAddressRestrictionTransactionV1(),
			'mosaic_global_restriction_transaction_v1': () => MosaicGlobalRestrictionTransactionV1(),
			'transfer_transaction_v1': () => TransferTransactionV1()
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

	@override
	int get size {
		throw UnimplementedError('do not need size for factory');
	}
}


class EmbeddedTransactionFactory implements ISerializable {
	@override
	dynamic deserialize(dynamic payload) {
		if(payload is String){
			tryHexString(payload);
			payload = hexToBytes(payload);
		}
		Uint8List buffer = payload;
		var parent = EmbeddedTransaction().deserialize(buffer);
		var mapping = <(int, int), ISerializable>{
			(EmbeddedAccountKeyLinkTransactionV1.TRANSACTION_TYPE.value, EmbeddedAccountKeyLinkTransactionV1.TRANSACTION_VERSION): EmbeddedAccountKeyLinkTransactionV1(),
			(EmbeddedNodeKeyLinkTransactionV1.TRANSACTION_TYPE.value, EmbeddedNodeKeyLinkTransactionV1.TRANSACTION_VERSION): EmbeddedNodeKeyLinkTransactionV1(),
			(EmbeddedVotingKeyLinkTransactionV1.TRANSACTION_TYPE.value, EmbeddedVotingKeyLinkTransactionV1.TRANSACTION_VERSION): EmbeddedVotingKeyLinkTransactionV1(),
			(EmbeddedVrfKeyLinkTransactionV1.TRANSACTION_TYPE.value, EmbeddedVrfKeyLinkTransactionV1.TRANSACTION_VERSION): EmbeddedVrfKeyLinkTransactionV1(),
			(EmbeddedHashLockTransactionV1.TRANSACTION_TYPE.value, EmbeddedHashLockTransactionV1.TRANSACTION_VERSION): EmbeddedHashLockTransactionV1(),
			(EmbeddedSecretLockTransactionV1.TRANSACTION_TYPE.value, EmbeddedSecretLockTransactionV1.TRANSACTION_VERSION): EmbeddedSecretLockTransactionV1(),
			(EmbeddedSecretProofTransactionV1.TRANSACTION_TYPE.value, EmbeddedSecretProofTransactionV1.TRANSACTION_VERSION): EmbeddedSecretProofTransactionV1(),
			(EmbeddedAccountMetadataTransactionV1.TRANSACTION_TYPE.value, EmbeddedAccountMetadataTransactionV1.TRANSACTION_VERSION): EmbeddedAccountMetadataTransactionV1(),
			(EmbeddedMosaicMetadataTransactionV1.TRANSACTION_TYPE.value, EmbeddedMosaicMetadataTransactionV1.TRANSACTION_VERSION): EmbeddedMosaicMetadataTransactionV1(),
			(EmbeddedNamespaceMetadataTransactionV1.TRANSACTION_TYPE.value, EmbeddedNamespaceMetadataTransactionV1.TRANSACTION_VERSION): EmbeddedNamespaceMetadataTransactionV1(),
			(EmbeddedMosaicDefinitionTransactionV1.TRANSACTION_TYPE.value, EmbeddedMosaicDefinitionTransactionV1.TRANSACTION_VERSION): EmbeddedMosaicDefinitionTransactionV1(),
			(EmbeddedMosaicSupplyChangeTransactionV1.TRANSACTION_TYPE.value, EmbeddedMosaicSupplyChangeTransactionV1.TRANSACTION_VERSION): EmbeddedMosaicSupplyChangeTransactionV1(),
			(EmbeddedMosaicSupplyRevocationTransactionV1.TRANSACTION_TYPE.value, EmbeddedMosaicSupplyRevocationTransactionV1.TRANSACTION_VERSION): EmbeddedMosaicSupplyRevocationTransactionV1(),
			(EmbeddedMultisigAccountModificationTransactionV1.TRANSACTION_TYPE.value, EmbeddedMultisigAccountModificationTransactionV1.TRANSACTION_VERSION): EmbeddedMultisigAccountModificationTransactionV1(),
			(EmbeddedAddressAliasTransactionV1.TRANSACTION_TYPE.value, EmbeddedAddressAliasTransactionV1.TRANSACTION_VERSION): EmbeddedAddressAliasTransactionV1(),
			(EmbeddedMosaicAliasTransactionV1.TRANSACTION_TYPE.value, EmbeddedMosaicAliasTransactionV1.TRANSACTION_VERSION): EmbeddedMosaicAliasTransactionV1(),
			(EmbeddedNamespaceRegistrationTransactionV1.TRANSACTION_TYPE.value, EmbeddedNamespaceRegistrationTransactionV1.TRANSACTION_VERSION): EmbeddedNamespaceRegistrationTransactionV1(),
			(EmbeddedAccountAddressRestrictionTransactionV1.TRANSACTION_TYPE.value, EmbeddedAccountAddressRestrictionTransactionV1.TRANSACTION_VERSION): EmbeddedAccountAddressRestrictionTransactionV1(),
			(EmbeddedAccountMosaicRestrictionTransactionV1.TRANSACTION_TYPE.value, EmbeddedAccountMosaicRestrictionTransactionV1.TRANSACTION_VERSION): EmbeddedAccountMosaicRestrictionTransactionV1(),
			(EmbeddedAccountOperationRestrictionTransactionV1.TRANSACTION_TYPE.value, EmbeddedAccountOperationRestrictionTransactionV1.TRANSACTION_VERSION): EmbeddedAccountOperationRestrictionTransactionV1(),
			(EmbeddedMosaicAddressRestrictionTransactionV1.TRANSACTION_TYPE.value, EmbeddedMosaicAddressRestrictionTransactionV1.TRANSACTION_VERSION): EmbeddedMosaicAddressRestrictionTransactionV1(),
			(EmbeddedMosaicGlobalRestrictionTransactionV1.TRANSACTION_TYPE.value, EmbeddedMosaicGlobalRestrictionTransactionV1.TRANSACTION_VERSION): EmbeddedMosaicGlobalRestrictionTransactionV1(),
			(EmbeddedTransferTransactionV1.TRANSACTION_TYPE.value, EmbeddedTransferTransactionV1.TRANSACTION_VERSION): EmbeddedTransferTransactionV1()
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
			'account_key_link_transaction_v1': () => EmbeddedAccountKeyLinkTransactionV1(),
			'node_key_link_transaction_v1': () => EmbeddedNodeKeyLinkTransactionV1(),
			'voting_key_link_transaction_v1': () => EmbeddedVotingKeyLinkTransactionV1(),
			'vrf_key_link_transaction_v1': () => EmbeddedVrfKeyLinkTransactionV1(),
			'hash_lock_transaction_v1': () => EmbeddedHashLockTransactionV1(),
			'secret_lock_transaction_v1': () => EmbeddedSecretLockTransactionV1(),
			'secret_proof_transaction_v1': () => EmbeddedSecretProofTransactionV1(),
			'account_metadata_transaction_v1': () => EmbeddedAccountMetadataTransactionV1(),
			'mosaic_metadata_transaction_v1': () => EmbeddedMosaicMetadataTransactionV1(),
			'namespace_metadata_transaction_v1': () => EmbeddedNamespaceMetadataTransactionV1(),
			'mosaic_definition_transaction_v1': () => EmbeddedMosaicDefinitionTransactionV1(),
			'mosaic_supply_change_transaction_v1': () => EmbeddedMosaicSupplyChangeTransactionV1(),
			'mosaic_supply_revocation_transaction_v1': () => EmbeddedMosaicSupplyRevocationTransactionV1(),
			'multisig_account_modification_transaction_v1': () => EmbeddedMultisigAccountModificationTransactionV1(),
			'address_alias_transaction_v1': () => EmbeddedAddressAliasTransactionV1(),
			'mosaic_alias_transaction_v1': () => EmbeddedMosaicAliasTransactionV1(),
			'namespace_registration_transaction_v1': () => EmbeddedNamespaceRegistrationTransactionV1(),
			'account_address_restriction_transaction_v1': () => EmbeddedAccountAddressRestrictionTransactionV1(),
			'account_mosaic_restriction_transaction_v1': () => EmbeddedAccountMosaicRestrictionTransactionV1(),
			'account_operation_restriction_transaction_v1': () => EmbeddedAccountOperationRestrictionTransactionV1(),
			'mosaic_address_restriction_transaction_v1': () => EmbeddedMosaicAddressRestrictionTransactionV1(),
			'mosaic_global_restriction_transaction_v1': () => EmbeddedMosaicGlobalRestrictionTransactionV1(),
			'transfer_transaction_v1': () => EmbeddedTransferTransactionV1()
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

	@override
	int get size {
		throw UnimplementedError('do not need size for factory');
	}
}


class BlockFactory implements ISerializable {
	@override
	dynamic deserialize(dynamic payload) {
		if(payload is String){
			tryHexString(payload);
			payload = hexToBytes(payload);
		}
		Uint8List buffer = payload;
		var parent = Block().deserialize(buffer);
		var mapping = <int, ISerializable>{
			NemesisBlockV1.BLOCK_TYPE.value: NemesisBlockV1(),
			NormalBlockV1.BLOCK_TYPE.value: NormalBlockV1(),
			ImportanceBlockV1.BLOCK_TYPE.value: ImportanceBlockV1()
		};
		var discriminator = (parent.type.value);
		if (mapping[discriminator] != null) {
			var factory_class = mapping[discriminator]!;
			return factory_class.deserialize(buffer);
		} else {
			throw Exception('Null value found for mapping[discriminator]');
		}
	}

	ISerializable createByName(String entityName) {
		var mapping = <String, ISerializable Function()>{
			'nemesis_block_v1': () => NemesisBlockV1(),
			'normal_block_v1': () => NormalBlockV1(),
			'importance_block_v1': () => ImportanceBlockV1()
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

	@override
	int get size {
		throw UnimplementedError('do not need size for factory');
	}
}


class ReceiptFactory implements ISerializable {
	@override
	dynamic deserialize(dynamic payload) {
		if(payload is String){
			tryHexString(payload);
			payload = hexToBytes(payload);
		}
		Uint8List buffer = payload;
		var parent = Receipt().deserialize(buffer);
		var mapping = <int, ISerializable>{
			HarvestFeeReceipt.RECEIPT_TYPE.value: HarvestFeeReceipt(),
			InflationReceipt.RECEIPT_TYPE.value: InflationReceipt(),
			LockHashCreatedFeeReceipt.RECEIPT_TYPE.value: LockHashCreatedFeeReceipt(),
			LockHashCompletedFeeReceipt.RECEIPT_TYPE.value: LockHashCompletedFeeReceipt(),
			LockHashExpiredFeeReceipt.RECEIPT_TYPE.value: LockHashExpiredFeeReceipt(),
			LockSecretCreatedFeeReceipt.RECEIPT_TYPE.value: LockSecretCreatedFeeReceipt(),
			LockSecretCompletedFeeReceipt.RECEIPT_TYPE.value: LockSecretCompletedFeeReceipt(),
			LockSecretExpiredFeeReceipt.RECEIPT_TYPE.value: LockSecretExpiredFeeReceipt(),
			MosaicExpiredReceipt.RECEIPT_TYPE.value: MosaicExpiredReceipt(),
			MosaicRentalFeeReceipt.RECEIPT_TYPE.value: MosaicRentalFeeReceipt(),
			NamespaceExpiredReceipt.RECEIPT_TYPE.value: NamespaceExpiredReceipt(),
			NamespaceDeletedReceipt.RECEIPT_TYPE.value: NamespaceDeletedReceipt(),
			NamespaceRentalFeeReceipt.RECEIPT_TYPE.value: NamespaceRentalFeeReceipt()
		};
		var discriminator = (parent.type.value);
		if (mapping[discriminator] != null) {
			var factory_class = mapping[discriminator]!;
			return factory_class.deserialize(buffer);
		} else {
			throw Exception('Null value found for mapping[discriminator]');
		}
	}

	ISerializable createByName(String entityName) {
		var mapping = <String, ISerializable Function()>{
			'harvest_fee_receipt': () => HarvestFeeReceipt(),
			'inflation_receipt': () => InflationReceipt(),
			'lock_hash_created_fee_receipt': () => LockHashCreatedFeeReceipt(),
			'lock_hash_completed_fee_receipt': () => LockHashCompletedFeeReceipt(),
			'lock_hash_expired_fee_receipt': () => LockHashExpiredFeeReceipt(),
			'lock_secret_created_fee_receipt': () => LockSecretCreatedFeeReceipt(),
			'lock_secret_completed_fee_receipt': () => LockSecretCompletedFeeReceipt(),
			'lock_secret_expired_fee_receipt': () => LockSecretExpiredFeeReceipt(),
			'mosaic_expired_receipt': () => MosaicExpiredReceipt(),
			'mosaic_rental_fee_receipt': () => MosaicRentalFeeReceipt(),
			'namespace_expired_receipt': () => NamespaceExpiredReceipt(),
			'namespace_deleted_receipt': () => NamespaceDeletedReceipt(),
			'namespace_rental_fee_receipt': () => NamespaceRentalFeeReceipt()
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

	@override
	int get size {
		throw UnimplementedError('do not need size for factory');
	}
}
