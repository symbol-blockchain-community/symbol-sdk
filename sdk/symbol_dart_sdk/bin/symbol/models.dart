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


class BlockDuration extends BaseValue implements IDeserializable {
	static const int SIZE = 8;

	BlockDuration([dynamic blockDuration]) : super(SIZE, blockDuration ?? 0);

	@override
	BlockDuration deserialize(Uint8List payload) {
		return BlockDuration(bytesToInt(payload.sublist(0, 8), 8));
	}

	Uint8List serialize() {
		var buffer = Uint8List(SIZE);
		buffer.setRange(0, 0 + 8, intToBytes(value, 8));
		return buffer;
	}
}


class BlockFeeMultiplier extends BaseValue implements IDeserializable {
	static const int SIZE = 4;

	BlockFeeMultiplier([dynamic blockFeeMultiplier]) : super(SIZE, blockFeeMultiplier ?? 0);

	@override
	BlockFeeMultiplier deserialize(Uint8List payload) {
		return BlockFeeMultiplier(bytesToInt(payload.sublist(0, 4), 4));
	}

	Uint8List serialize() {
		var buffer = Uint8List(SIZE);
		buffer.setRange(0, 0 + 4, intToBytes(value, 4));
		return buffer;
	}
}


class Difficulty extends BaseValue implements IDeserializable {
	static const int SIZE = 8;

	Difficulty([dynamic difficulty]) : super(SIZE, difficulty ?? 0);

	@override
	Difficulty deserialize(Uint8List payload) {
		return Difficulty(bytesToInt(payload.sublist(0, 8), 8));
	}

	Uint8List serialize() {
		var buffer = Uint8List(SIZE);
		buffer.setRange(0, 0 + 8, intToBytes(value, 8));
		return buffer;
	}
}


class FinalizationEpoch extends BaseValue implements IDeserializable {
	static const int SIZE = 4;

	FinalizationEpoch([dynamic finalizationEpoch]) : super(SIZE, finalizationEpoch ?? 0);

	@override
	FinalizationEpoch deserialize(Uint8List payload) {
		return FinalizationEpoch(bytesToInt(payload.sublist(0, 4), 4));
	}

	Uint8List serialize() {
		var buffer = Uint8List(SIZE);
		buffer.setRange(0, 0 + 4, intToBytes(value, 4));
		return buffer;
	}
}


class FinalizationPoint extends BaseValue implements IDeserializable {
	static const int SIZE = 4;

	FinalizationPoint([dynamic finalizationPoint]) : super(SIZE, finalizationPoint ?? 0);

	@override
	FinalizationPoint deserialize(Uint8List payload) {
		return FinalizationPoint(bytesToInt(payload.sublist(0, 4), 4));
	}

	Uint8List serialize() {
		var buffer = Uint8List(SIZE);
		buffer.setRange(0, 0 + 4, intToBytes(value, 4));
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


class Importance extends BaseValue implements IDeserializable {
	static const int SIZE = 8;

	Importance([dynamic importance]) : super(SIZE, importance ?? 0);

	@override
	Importance deserialize(Uint8List payload) {
		return Importance(bytesToInt(payload.sublist(0, 8), 8));
	}

	Uint8List serialize() {
		var buffer = Uint8List(SIZE);
		buffer.setRange(0, 0 + 8, intToBytes(value, 8));
		return buffer;
	}
}


class ImportanceHeight extends BaseValue implements IDeserializable {
	static const int SIZE = 8;

	ImportanceHeight([dynamic importanceHeight]) : super(SIZE, importanceHeight ?? 0);

	@override
	ImportanceHeight deserialize(Uint8List payload) {
		return ImportanceHeight(bytesToInt(payload.sublist(0, 8), 8));
	}

	Uint8List serialize() {
		var buffer = Uint8List(SIZE);
		buffer.setRange(0, 0 + 8, intToBytes(value, 8));
		return buffer;
	}
}


class UnresolvedMosaicId extends BaseValue implements IDeserializable {
	static const int SIZE = 8;

	UnresolvedMosaicId([dynamic unresolvedMosaicId]) : super(SIZE, unresolvedMosaicId ?? 0);

	@override
	UnresolvedMosaicId deserialize(Uint8List payload) {
		return UnresolvedMosaicId(bytesToInt(payload.sublist(0, 8), 8));
	}

	Uint8List serialize() {
		var buffer = Uint8List(SIZE);
		buffer.setRange(0, 0 + 8, intToBytes(value, 8));
		return buffer;
	}
}


class MosaicId extends BaseValue implements IDeserializable {
	static const int SIZE = 8;

	MosaicId([dynamic mosaicId]) : super(SIZE, mosaicId ?? 0);

	@override
	MosaicId deserialize(Uint8List payload) {
		return MosaicId(bytesToInt(payload.sublist(0, 8), 8));
	}

	Uint8List serialize() {
		var buffer = Uint8List(SIZE);
		buffer.setRange(0, 0 + 8, intToBytes(value, 8));
		return buffer;
	}
}


class Timestamp extends BaseValue implements IDeserializable {
	static const int SIZE = 8;

	Timestamp([dynamic timestamp]) : super(SIZE, timestamp ?? 0);

	@override
	Timestamp deserialize(Uint8List payload) {
		return Timestamp(bytesToInt(payload.sublist(0, 8), 8));
	}

	Uint8List serialize() {
		var buffer = Uint8List(SIZE);
		buffer.setRange(0, 0 + 8, intToBytes(value, 8));
		return buffer;
	}
}


class UnresolvedAddress extends ByteArray implements IDeserializable {
	static const int SIZE = 24;

	UnresolvedAddress([dynamic unresolvedAddress]) : super(SIZE, unresolvedAddress ?? Uint8List(24));

	int get size {
		return 24;
	}

	@override
	UnresolvedAddress deserialize(Uint8List payload) {
		payload = payload.sublist(0, SIZE);
		return UnresolvedAddress(Uint8List.fromList(payload));
	}

	Uint8List serialize() {
		return bytes;
	}
}


class Address extends ByteArray implements IDeserializable {
	static const int SIZE = 24;

	Address([dynamic address]) : super(SIZE, address ?? Uint8List(24));

	int get size {
		return 24;
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


class Hash512 extends ByteArray implements IDeserializable {
	static const int SIZE = 64;

	Hash512([dynamic hash512]) : super(SIZE, hash512 ?? Uint8List(64));

	int get size {
		return 64;
	}

	@override
	Hash512 deserialize(Uint8List payload) {
		payload = payload.sublist(0, SIZE);
		return Hash512(Uint8List.fromList(payload));
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


class VotingPublicKey extends ByteArray implements IDeserializable {
	static const int SIZE = 32;

	VotingPublicKey([dynamic votingPublicKey]) : super(SIZE, votingPublicKey ?? Uint8List(32));

	int get size {
		return 32;
	}

	@override
	VotingPublicKey deserialize(Uint8List payload) {
		payload = payload.sublist(0, SIZE);
		return VotingPublicKey(Uint8List.fromList(payload));
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


class Mosaic extends StructBase implements IDeserializable {

	static const Map<String, String> TYPE_HINTS = {
		'mosaicId': 'pod:MosaicId',
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
		// empty body
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
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


class UnresolvedMosaic extends StructBase implements IDeserializable {

	static const Map<String, String> TYPE_HINTS = {
		'mosaicId': 'pod:UnresolvedMosaicId',
		'amount': 'pod:Amount'
	};

	UnresolvedMosaicId _mosaicId = UnresolvedMosaicId();
	Amount _amount = Amount();

	UnresolvedMosaic({ UnresolvedMosaicId? mosaicId, Amount? amount}) 
		: super(mosaicId == null && amount == null )
	{
		_mosaicId = mosaicId ?? UnresolvedMosaicId();
		_amount = amount ?? Amount();
	}

	void sort() {
		// empty body
	}

	UnresolvedMosaicId get mosaicId {
		return _mosaicId;
	}

	Amount get amount {
		return _amount;
	}

	set mosaicId(UnresolvedMosaicId value) {
		_mosaicId = value;
	}

	set amount(Amount value) {
		_amount = value;
	}

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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + _mosaicId.size, _mosaicId.serialize());
		currentPos += mosaicId.size;
		buffer.setRange(currentPos, currentPos + _amount.size, _amount.serialize());
		currentPos += amount.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'UnresolvedMosaic(';
		result += 'mosaicId: "${_mosaicId.toString()}", ';
		result += 'amount: "${_amount.toString()}", ';
		result += ')';
		return result;
	}
}


class LinkAction implements IDeserializable {
	static final UNLINK = LinkAction(0);
	static final LINK = LinkAction(1);

	final int value;

	static final _flags = {
		0: 'UNLINK',
		1: 'LINK',
	};

	LinkAction([int? _value]) : value = _value ?? 0;

	int get size {
		return 1;
	}

	@override
	LinkAction deserialize(Uint8List payload) {
		var byteData = ByteData.sublistView(payload);
		return LinkAction(byteData.getUint8(0));
	}

	Uint8List serialize() {
		var byteData = ByteData(1)..setUint8(0, value);
		return byteData.buffer.asUint8List();
	}

	@override
	String toString() {
		return 'LinkAction.${_flags[value]}';
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

	final int value;

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

	TransactionType([int? _value]) : value = _value ?? 16716;

	int get size {
		return 2;
	}

	@override
	TransactionType deserialize(Uint8List payload) {
		var byteData = ByteData.sublistView(payload);
		return TransactionType(byteData.getUint16(0, Endian.little));
	}

	Uint8List serialize() {
		var byteData = ByteData(2)..setUint16(0, value, Endian.little);
		return byteData.buffer.asUint8List();
	}

	@override
	String toString() {
		return 'TransactionType.${_flags[value]}';
	}
}


class Transaction extends StructBase implements IDeserializable {

	static const Map<String, String> TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp'
	};

	Signature _signature = Signature();
	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	TransactionType _type = TransactionType.ACCOUNT_KEY_LINK;
	Amount _fee = Amount();
	Timestamp _deadline = Timestamp();
	final int _verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field

	Transaction({ 
	Signature? signature,
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	Amount? fee,
	Timestamp? deadline
	}) 
		: super(signature == null && signerPublicKey == null && version == null && network == null && type == null && fee == null && deadline == null )
	{
		_signature = signature ?? Signature();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? 0;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? TransactionType.ACCOUNT_KEY_LINK;
		_fee = fee ?? Amount();
		_deadline = deadline ?? Timestamp();
	}

	void sort() {
		// empty body
	}

	Signature get signature {
		return _signature;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	TransactionType get type {
		return _type;
	}

	Amount get fee {
		return _fee;
	}

	Timestamp get deadline {
		return _deadline;
	}

	set signature(Signature value) {
		_signature = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set fee(Amount value) {
		_fee = value;
	}

	set deadline(Timestamp value) {
		_deadline = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signature.size, _signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());
		currentPos += deadline.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'Transaction(';
		result += 'signature: "${_signature.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'fee: "${_fee.toString()}", ';
		result += 'deadline: "${_deadline.toString()}", ';
		result += ')';
		return result;
	}
}


class EmbeddedTransaction extends StructBase implements IDeserializable, IEmbeddedTransaction {

	static const Map<String, String> TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType'
	};

	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	TransactionType _type = TransactionType.ACCOUNT_KEY_LINK;
	final int _embeddedTransactionHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field

	EmbeddedTransaction({ PublicKey? signerPublicKey, int? version, NetworkType? network, TransactionType? type}) 
		: super(signerPublicKey == null && version == null && network == null && type == null )
	{
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? 0;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? TransactionType.ACCOUNT_KEY_LINK;
	}

	void sort() {
		// empty body
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	TransactionType get type {
		return _type;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(TransactionType value) {
		_type = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_embeddedTransactionHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'EmbeddedTransaction(';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += ')';
		return result;
	}
}


class ProofGamma extends ByteArray implements IDeserializable {
	static const int SIZE = 32;

	ProofGamma([dynamic proofGamma]) : super(SIZE, proofGamma ?? Uint8List(32));

	int get size {
		return 32;
	}

	@override
	ProofGamma deserialize(Uint8List payload) {
		payload = payload.sublist(0, SIZE);
		return ProofGamma(Uint8List.fromList(payload));
	}

	Uint8List serialize() {
		return bytes;
	}
}


class ProofVerificationHash extends ByteArray implements IDeserializable {
	static const int SIZE = 16;

	ProofVerificationHash([dynamic proofVerificationHash]) : super(SIZE, proofVerificationHash ?? Uint8List(16));

	int get size {
		return 16;
	}

	@override
	ProofVerificationHash deserialize(Uint8List payload) {
		payload = payload.sublist(0, SIZE);
		return ProofVerificationHash(Uint8List.fromList(payload));
	}

	Uint8List serialize() {
		return bytes;
	}
}


class ProofScalar extends ByteArray implements IDeserializable {
	static const int SIZE = 32;

	ProofScalar([dynamic proofScalar]) : super(SIZE, proofScalar ?? Uint8List(32));

	int get size {
		return 32;
	}

	@override
	ProofScalar deserialize(Uint8List payload) {
		payload = payload.sublist(0, SIZE);
		return ProofScalar(Uint8List.fromList(payload));
	}

	Uint8List serialize() {
		return bytes;
	}
}


class BlockType implements IDeserializable {
	static final NEMESIS = BlockType(32835);
	static final NORMAL = BlockType(33091);
	static final IMPORTANCE = BlockType(33347);

	final int value;

	static final _flags = {
		32835: 'NEMESIS',
		33091: 'NORMAL',
		33347: 'IMPORTANCE',
	};

	BlockType([int? _value]) : value = _value ?? 32835;

	int get size {
		return 2;
	}

	@override
	BlockType deserialize(Uint8List payload) {
		var byteData = ByteData.sublistView(payload);
		return BlockType(byteData.getUint16(0, Endian.little));
	}

	Uint8List serialize() {
		var byteData = ByteData(2)..setUint16(0, value, Endian.little);
		return byteData.buffer.asUint8List();
	}

	@override
	String toString() {
		return 'BlockType.${_flags[value]}';
	}
}


class VrfProof extends StructBase implements IDeserializable {

	static const Map<String, String> TYPE_HINTS = {
		'gamma': 'pod:ProofGamma',
		'verificationHash': 'pod:ProofVerificationHash',
		'scalar': 'pod:ProofScalar'
	};

	ProofGamma _gamma = ProofGamma();
	ProofVerificationHash _verificationHash = ProofVerificationHash();
	ProofScalar _scalar = ProofScalar();

	VrfProof({ ProofGamma? gamma, ProofVerificationHash? verificationHash, ProofScalar? scalar}) 
		: super(gamma == null && verificationHash == null && scalar == null )
	{
		_gamma = gamma ?? ProofGamma();
		_verificationHash = verificationHash ?? ProofVerificationHash();
		_scalar = scalar ?? ProofScalar();
	}

	void sort() {
		// empty body
	}

	ProofGamma get gamma {
		return _gamma;
	}

	ProofVerificationHash get verificationHash {
		return _verificationHash;
	}

	ProofScalar get scalar {
		return _scalar;
	}

	set gamma(ProofGamma value) {
		_gamma = value;
	}

	set verificationHash(ProofVerificationHash value) {
		_verificationHash = value;
	}

	set scalar(ProofScalar value) {
		_scalar = value;
	}

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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + _gamma.size, _gamma.serialize());
		currentPos += gamma.size;
		buffer.setRange(currentPos, currentPos + _verificationHash.size, _verificationHash.serialize());
		currentPos += verificationHash.size;
		buffer.setRange(currentPos, currentPos + _scalar.size, _scalar.serialize());
		currentPos += scalar.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'VrfProof(';
		result += 'gamma: "${_gamma.toString()}", ';
		result += 'verificationHash: "${_verificationHash.toString()}", ';
		result += 'scalar: "${_scalar.toString()}", ';
		result += ')';
		return result;
	}
}


class Block extends StructBase implements IDeserializable {

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

	Signature _signature = Signature();
	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	BlockType _type = BlockType.NEMESIS;
	Height _height = Height();
	Timestamp _timestamp = Timestamp();
	Difficulty _difficulty = Difficulty();
	VrfProof _generationHashProof = VrfProof();
	Hash256 _previousBlockHash = Hash256();
	Hash256 _transactionsHash = Hash256();
	Hash256 _receiptsHash = Hash256();
	Hash256 _stateHash = Hash256();
	Address _beneficiaryAddress = Address();
	BlockFeeMultiplier _feeMultiplier = BlockFeeMultiplier();
	final int _verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field

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
	}) 
		: super(signature == null && signerPublicKey == null && version == null && network == null && type == null && height == null && timestamp == null && difficulty == null && generationHashProof == null && previousBlockHash == null && transactionsHash == null && receiptsHash == null && stateHash == null && beneficiaryAddress == null && feeMultiplier == null )
	{
		_signature = signature ?? Signature();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? 0;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? BlockType.NEMESIS;
		_height = height ?? Height();
		_timestamp = timestamp ?? Timestamp();
		_difficulty = difficulty ?? Difficulty();
		_generationHashProof = generationHashProof ?? VrfProof();
		_previousBlockHash = previousBlockHash ?? Hash256();
		_transactionsHash = transactionsHash ?? Hash256();
		_receiptsHash = receiptsHash ?? Hash256();
		_stateHash = stateHash ?? Hash256();
		_beneficiaryAddress = beneficiaryAddress ?? Address();
		_feeMultiplier = feeMultiplier ?? BlockFeeMultiplier();
	}

	void sort() {
		_generationHashProof.sort();
	}

	Signature get signature {
		return _signature;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	BlockType get type {
		return _type;
	}

	Height get height {
		return _height;
	}

	Timestamp get timestamp {
		return _timestamp;
	}

	Difficulty get difficulty {
		return _difficulty;
	}

	VrfProof get generationHashProof {
		return _generationHashProof;
	}

	Hash256 get previousBlockHash {
		return _previousBlockHash;
	}

	Hash256 get transactionsHash {
		return _transactionsHash;
	}

	Hash256 get receiptsHash {
		return _receiptsHash;
	}

	Hash256 get stateHash {
		return _stateHash;
	}

	Address get beneficiaryAddress {
		return _beneficiaryAddress;
	}

	BlockFeeMultiplier get feeMultiplier {
		return _feeMultiplier;
	}

	set signature(Signature value) {
		_signature = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(BlockType value) {
		_type = value;
	}

	set height(Height value) {
		_height = value;
	}

	set timestamp(Timestamp value) {
		_timestamp = value;
	}

	set difficulty(Difficulty value) {
		_difficulty = value;
	}

	set generationHashProof(VrfProof value) {
		_generationHashProof = value;
	}

	set previousBlockHash(Hash256 value) {
		_previousBlockHash = value;
	}

	set transactionsHash(Hash256 value) {
		_transactionsHash = value;
	}

	set receiptsHash(Hash256 value) {
		_receiptsHash = value;
	}

	set stateHash(Hash256 value) {
		_stateHash = value;
	}

	set beneficiaryAddress(Address value) {
		_beneficiaryAddress = value;
	}

	set feeMultiplier(BlockFeeMultiplier value) {
		_feeMultiplier = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signature.size, _signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _height.size, _height.serialize());
		currentPos += height.size;
		buffer.setRange(currentPos, currentPos + _timestamp.size, _timestamp.serialize());
		currentPos += timestamp.size;
		buffer.setRange(currentPos, currentPos + _difficulty.size, _difficulty.serialize());
		currentPos += difficulty.size;
		buffer.setRange(currentPos, currentPos + _generationHashProof.size, _generationHashProof.serialize());
		currentPos += generationHashProof.size;
		buffer.setRange(currentPos, currentPos + _previousBlockHash.size, _previousBlockHash.serialize());
		currentPos += previousBlockHash.size;
		buffer.setRange(currentPos, currentPos + _transactionsHash.size, _transactionsHash.serialize());
		currentPos += transactionsHash.size;
		buffer.setRange(currentPos, currentPos + _receiptsHash.size, _receiptsHash.serialize());
		currentPos += receiptsHash.size;
		buffer.setRange(currentPos, currentPos + _stateHash.size, _stateHash.serialize());
		currentPos += stateHash.size;
		buffer.setRange(currentPos, currentPos + _beneficiaryAddress.size, _beneficiaryAddress.serialize());
		currentPos += beneficiaryAddress.size;
		buffer.setRange(currentPos, currentPos + _feeMultiplier.size, _feeMultiplier.serialize());
		currentPos += feeMultiplier.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'Block(';
		result += 'signature: "${_signature.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'height: "${_height.toString()}", ';
		result += 'timestamp: "${_timestamp.toString()}", ';
		result += 'difficulty: "${_difficulty.toString()}", ';
		result += 'generationHashProof: "${_generationHashProof.toString()}", ';
		result += 'previousBlockHash: "${_previousBlockHash.toString()}", ';
		result += 'transactionsHash: "${_transactionsHash.toString()}", ';
		result += 'receiptsHash: "${_receiptsHash.toString()}", ';
		result += 'stateHash: "${_stateHash.toString()}", ';
		result += 'beneficiaryAddress: "${_beneficiaryAddress.toString()}", ';
		result += 'feeMultiplier: "${_feeMultiplier.toString()}", ';
		result += ')';
		return result;
	}
}


class NemesisBlockV1 extends StructBase implements IDeserializable {
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

	Signature _signature = Signature();
	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	BlockType _type = BlockType.NEMESIS;
	Height _height = Height();
	Timestamp _timestamp = Timestamp();
	Difficulty _difficulty = Difficulty();
	VrfProof _generationHashProof = VrfProof();
	Hash256 _previousBlockHash = Hash256();
	Hash256 _transactionsHash = Hash256();
	Hash256 _receiptsHash = Hash256();
	Hash256 _stateHash = Hash256();
	Address _beneficiaryAddress = Address();
	BlockFeeMultiplier _feeMultiplier = BlockFeeMultiplier();
	int _votingEligibleAccountsCount = 0;
	int _harvestingEligibleAccountsCount = 0;
	Amount _totalVotingBalance = Amount();
	Hash256 _previousImportanceBlockHash = Hash256();
	List<Transaction> _transactions = [];
	final int _verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field

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
	int? harvestingEligibleAccountsCount,
	Amount? totalVotingBalance,
	Hash256? previousImportanceBlockHash,
	List<Transaction>? transactions
	}) 
		: super(signature == null && signerPublicKey == null && version == null && network == null && type == null && height == null && timestamp == null && difficulty == null && generationHashProof == null && previousBlockHash == null && transactionsHash == null && receiptsHash == null && stateHash == null && beneficiaryAddress == null && feeMultiplier == null && votingEligibleAccountsCount == null && harvestingEligibleAccountsCount == null && totalVotingBalance == null && previousImportanceBlockHash == null && transactions == null )
	{
		_signature = signature ?? Signature();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? NemesisBlockV1.BLOCK_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? NemesisBlockV1.BLOCK_TYPE;
		_height = height ?? Height();
		_timestamp = timestamp ?? Timestamp();
		_difficulty = difficulty ?? Difficulty();
		_generationHashProof = generationHashProof ?? VrfProof();
		_previousBlockHash = previousBlockHash ?? Hash256();
		_transactionsHash = transactionsHash ?? Hash256();
		_receiptsHash = receiptsHash ?? Hash256();
		_stateHash = stateHash ?? Hash256();
		_beneficiaryAddress = beneficiaryAddress ?? Address();
		_feeMultiplier = feeMultiplier ?? BlockFeeMultiplier();
		_votingEligibleAccountsCount = votingEligibleAccountsCount ?? 0;
		_harvestingEligibleAccountsCount = harvestingEligibleAccountsCount ?? 0;
		_totalVotingBalance = totalVotingBalance ?? Amount();
		_previousImportanceBlockHash = previousImportanceBlockHash ?? Hash256();
		_transactions = transactions ?? [];
	}

	void sort() {
		_generationHashProof.sort();
	}

	Signature get signature {
		return _signature;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	BlockType get type {
		return _type;
	}

	Height get height {
		return _height;
	}

	Timestamp get timestamp {
		return _timestamp;
	}

	Difficulty get difficulty {
		return _difficulty;
	}

	VrfProof get generationHashProof {
		return _generationHashProof;
	}

	Hash256 get previousBlockHash {
		return _previousBlockHash;
	}

	Hash256 get transactionsHash {
		return _transactionsHash;
	}

	Hash256 get receiptsHash {
		return _receiptsHash;
	}

	Hash256 get stateHash {
		return _stateHash;
	}

	Address get beneficiaryAddress {
		return _beneficiaryAddress;
	}

	BlockFeeMultiplier get feeMultiplier {
		return _feeMultiplier;
	}

	int get votingEligibleAccountsCount {
		return _votingEligibleAccountsCount;
	}

	int get harvestingEligibleAccountsCount {
		return _harvestingEligibleAccountsCount;
	}

	Amount get totalVotingBalance {
		return _totalVotingBalance;
	}

	Hash256 get previousImportanceBlockHash {
		return _previousImportanceBlockHash;
	}

	List<Transaction> get transactions {
		return _transactions;
	}

	set signature(Signature value) {
		_signature = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(BlockType value) {
		_type = value;
	}

	set height(Height value) {
		_height = value;
	}

	set timestamp(Timestamp value) {
		_timestamp = value;
	}

	set difficulty(Difficulty value) {
		_difficulty = value;
	}

	set generationHashProof(VrfProof value) {
		_generationHashProof = value;
	}

	set previousBlockHash(Hash256 value) {
		_previousBlockHash = value;
	}

	set transactionsHash(Hash256 value) {
		_transactionsHash = value;
	}

	set receiptsHash(Hash256 value) {
		_receiptsHash = value;
	}

	set stateHash(Hash256 value) {
		_stateHash = value;
	}

	set beneficiaryAddress(Address value) {
		_beneficiaryAddress = value;
	}

	set feeMultiplier(BlockFeeMultiplier value) {
		_feeMultiplier = value;
	}

	set votingEligibleAccountsCount(int value) {
		_votingEligibleAccountsCount = value;
	}

	set harvestingEligibleAccountsCount(int value) {
		_harvestingEligibleAccountsCount = value;
	}

	set totalVotingBalance(Amount value) {
		_totalVotingBalance = value;
	}

	set previousImportanceBlockHash(Hash256 value) {
		_previousImportanceBlockHash = value;
	}

	set transactions(List<Transaction> value) {
		_transactions = value;
	}

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
		// nothing to do for size
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
		var transactions = ArrayHelpers.readVariableSizeElements(buffer, TransactionFactory(), 8, true).map((item) => item as Transaction).toList();
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signature.size, _signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _height.size, _height.serialize());
		currentPos += height.size;
		buffer.setRange(currentPos, currentPos + _timestamp.size, _timestamp.serialize());
		currentPos += timestamp.size;
		buffer.setRange(currentPos, currentPos + _difficulty.size, _difficulty.serialize());
		currentPos += difficulty.size;
		buffer.setRange(currentPos, currentPos + _generationHashProof.size, _generationHashProof.serialize());
		currentPos += generationHashProof.size;
		buffer.setRange(currentPos, currentPos + _previousBlockHash.size, _previousBlockHash.serialize());
		currentPos += previousBlockHash.size;
		buffer.setRange(currentPos, currentPos + _transactionsHash.size, _transactionsHash.serialize());
		currentPos += transactionsHash.size;
		buffer.setRange(currentPos, currentPos + _receiptsHash.size, _receiptsHash.serialize());
		currentPos += receiptsHash.size;
		buffer.setRange(currentPos, currentPos + _stateHash.size, _stateHash.serialize());
		currentPos += stateHash.size;
		buffer.setRange(currentPos, currentPos + _beneficiaryAddress.size, _beneficiaryAddress.serialize());
		currentPos += beneficiaryAddress.size;
		buffer.setRange(currentPos, currentPos + _feeMultiplier.size, _feeMultiplier.serialize());
		currentPos += feeMultiplier.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_votingEligibleAccountsCount, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 8, intToBytes(_harvestingEligibleAccountsCount, 8));
		currentPos += 8;
		buffer.setRange(currentPos, currentPos + _totalVotingBalance.size, _totalVotingBalance.serialize());
		currentPos += totalVotingBalance.size;
		buffer.setRange(currentPos, currentPos + _previousImportanceBlockHash.size, _previousImportanceBlockHash.serialize());
		currentPos += previousImportanceBlockHash.size;
		sort();
		var res_transactions = ArrayHelpers.writeVariableSizeElements(buffer, _transactions, 8, currentPos, true);
		currentPos = res_transactions.item2;
		buffer = res_transactions.item1;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'NemesisBlockV1(';
		result += 'signature: "${_signature.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'height: "${_height.toString()}", ';
		result += 'timestamp: "${_timestamp.toString()}", ';
		result += 'difficulty: "${_difficulty.toString()}", ';
		result += 'generationHashProof: "${_generationHashProof.toString()}", ';
		result += 'previousBlockHash: "${_previousBlockHash.toString()}", ';
		result += 'transactionsHash: "${_transactionsHash.toString()}", ';
		result += 'receiptsHash: "${_receiptsHash.toString()}", ';
		result += 'stateHash: "${_stateHash.toString()}", ';
		result += 'beneficiaryAddress: "${_beneficiaryAddress.toString()}", ';
		result += 'feeMultiplier: "${_feeMultiplier.toString()}", ';
		result += 'votingEligibleAccountsCount: "0x${_votingEligibleAccountsCount.toRadixString(16).padLeft(4 * 2, '0').toUpperCase()}", ';
		result += 'harvestingEligibleAccountsCount: "0x${_harvestingEligibleAccountsCount.toRadixString(16).padLeft(8 * 2, '0').toUpperCase()}", ';
		result += 'totalVotingBalance: "${_totalVotingBalance.toString()}", ';
		result += 'previousImportanceBlockHash: "${_previousImportanceBlockHash.toString()}", ';
		result += 'transactions: "${_transactions.map((e) => e.toString()).toList()}", ';
		result += ')';
		return result;
	}
}


class NormalBlockV1 extends StructBase implements IDeserializable {
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

	Signature _signature = Signature();
	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	BlockType _type = BlockType.NEMESIS;
	Height _height = Height();
	Timestamp _timestamp = Timestamp();
	Difficulty _difficulty = Difficulty();
	VrfProof _generationHashProof = VrfProof();
	Hash256 _previousBlockHash = Hash256();
	Hash256 _transactionsHash = Hash256();
	Hash256 _receiptsHash = Hash256();
	Hash256 _stateHash = Hash256();
	Address _beneficiaryAddress = Address();
	BlockFeeMultiplier _feeMultiplier = BlockFeeMultiplier();
	List<Transaction> _transactions = [];
	final int _verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field
	final int _blockHeaderReserved_1 = 0; // reserved field

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
	List<Transaction>? transactions
	}) 
		: super(signature == null && signerPublicKey == null && version == null && network == null && type == null && height == null && timestamp == null && difficulty == null && generationHashProof == null && previousBlockHash == null && transactionsHash == null && receiptsHash == null && stateHash == null && beneficiaryAddress == null && feeMultiplier == null && transactions == null )
	{
		_signature = signature ?? Signature();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? NormalBlockV1.BLOCK_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? NormalBlockV1.BLOCK_TYPE;
		_height = height ?? Height();
		_timestamp = timestamp ?? Timestamp();
		_difficulty = difficulty ?? Difficulty();
		_generationHashProof = generationHashProof ?? VrfProof();
		_previousBlockHash = previousBlockHash ?? Hash256();
		_transactionsHash = transactionsHash ?? Hash256();
		_receiptsHash = receiptsHash ?? Hash256();
		_stateHash = stateHash ?? Hash256();
		_beneficiaryAddress = beneficiaryAddress ?? Address();
		_feeMultiplier = feeMultiplier ?? BlockFeeMultiplier();
		_transactions = transactions ?? [];
	}

	void sort() {
		_generationHashProof.sort();
	}

	Signature get signature {
		return _signature;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	BlockType get type {
		return _type;
	}

	Height get height {
		return _height;
	}

	Timestamp get timestamp {
		return _timestamp;
	}

	Difficulty get difficulty {
		return _difficulty;
	}

	VrfProof get generationHashProof {
		return _generationHashProof;
	}

	Hash256 get previousBlockHash {
		return _previousBlockHash;
	}

	Hash256 get transactionsHash {
		return _transactionsHash;
	}

	Hash256 get receiptsHash {
		return _receiptsHash;
	}

	Hash256 get stateHash {
		return _stateHash;
	}

	Address get beneficiaryAddress {
		return _beneficiaryAddress;
	}

	BlockFeeMultiplier get feeMultiplier {
		return _feeMultiplier;
	}

	List<Transaction> get transactions {
		return _transactions;
	}

	set signature(Signature value) {
		_signature = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(BlockType value) {
		_type = value;
	}

	set height(Height value) {
		_height = value;
	}

	set timestamp(Timestamp value) {
		_timestamp = value;
	}

	set difficulty(Difficulty value) {
		_difficulty = value;
	}

	set generationHashProof(VrfProof value) {
		_generationHashProof = value;
	}

	set previousBlockHash(Hash256 value) {
		_previousBlockHash = value;
	}

	set transactionsHash(Hash256 value) {
		_transactionsHash = value;
	}

	set receiptsHash(Hash256 value) {
		_receiptsHash = value;
	}

	set stateHash(Hash256 value) {
		_stateHash = value;
	}

	set beneficiaryAddress(Address value) {
		_beneficiaryAddress = value;
	}

	set feeMultiplier(BlockFeeMultiplier value) {
		_feeMultiplier = value;
	}

	set transactions(List<Transaction> value) {
		_transactions = value;
	}

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
		// nothing to do for size
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
		var transactions = ArrayHelpers.readVariableSizeElements(buffer, TransactionFactory(), 8, true).map((item) => item as Transaction).toList();
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signature.size, _signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _height.size, _height.serialize());
		currentPos += height.size;
		buffer.setRange(currentPos, currentPos + _timestamp.size, _timestamp.serialize());
		currentPos += timestamp.size;
		buffer.setRange(currentPos, currentPos + _difficulty.size, _difficulty.serialize());
		currentPos += difficulty.size;
		buffer.setRange(currentPos, currentPos + _generationHashProof.size, _generationHashProof.serialize());
		currentPos += generationHashProof.size;
		buffer.setRange(currentPos, currentPos + _previousBlockHash.size, _previousBlockHash.serialize());
		currentPos += previousBlockHash.size;
		buffer.setRange(currentPos, currentPos + _transactionsHash.size, _transactionsHash.serialize());
		currentPos += transactionsHash.size;
		buffer.setRange(currentPos, currentPos + _receiptsHash.size, _receiptsHash.serialize());
		currentPos += receiptsHash.size;
		buffer.setRange(currentPos, currentPos + _stateHash.size, _stateHash.serialize());
		currentPos += stateHash.size;
		buffer.setRange(currentPos, currentPos + _beneficiaryAddress.size, _beneficiaryAddress.serialize());
		currentPos += beneficiaryAddress.size;
		buffer.setRange(currentPos, currentPos + _feeMultiplier.size, _feeMultiplier.serialize());
		currentPos += feeMultiplier.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_blockHeaderReserved_1, 4));
		currentPos += 4;
		sort();
		var res_transactions = ArrayHelpers.writeVariableSizeElements(buffer, _transactions, 8, currentPos, true);
		currentPos = res_transactions.item2;
		buffer = res_transactions.item1;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'NormalBlockV1(';
		result += 'signature: "${_signature.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'height: "${_height.toString()}", ';
		result += 'timestamp: "${_timestamp.toString()}", ';
		result += 'difficulty: "${_difficulty.toString()}", ';
		result += 'generationHashProof: "${_generationHashProof.toString()}", ';
		result += 'previousBlockHash: "${_previousBlockHash.toString()}", ';
		result += 'transactionsHash: "${_transactionsHash.toString()}", ';
		result += 'receiptsHash: "${_receiptsHash.toString()}", ';
		result += 'stateHash: "${_stateHash.toString()}", ';
		result += 'beneficiaryAddress: "${_beneficiaryAddress.toString()}", ';
		result += 'feeMultiplier: "${_feeMultiplier.toString()}", ';
		result += 'transactions: "${_transactions.map((e) => e.toString()).toList()}", ';
		result += ')';
		return result;
	}
}


class ImportanceBlockV1 extends StructBase implements IDeserializable {
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

	Signature _signature = Signature();
	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	BlockType _type = BlockType.NEMESIS;
	Height _height = Height();
	Timestamp _timestamp = Timestamp();
	Difficulty _difficulty = Difficulty();
	VrfProof _generationHashProof = VrfProof();
	Hash256 _previousBlockHash = Hash256();
	Hash256 _transactionsHash = Hash256();
	Hash256 _receiptsHash = Hash256();
	Hash256 _stateHash = Hash256();
	Address _beneficiaryAddress = Address();
	BlockFeeMultiplier _feeMultiplier = BlockFeeMultiplier();
	int _votingEligibleAccountsCount = 0;
	int _harvestingEligibleAccountsCount = 0;
	Amount _totalVotingBalance = Amount();
	Hash256 _previousImportanceBlockHash = Hash256();
	List<Transaction> _transactions = [];
	final int _verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field

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
	int? harvestingEligibleAccountsCount,
	Amount? totalVotingBalance,
	Hash256? previousImportanceBlockHash,
	List<Transaction>? transactions
	}) 
		: super(signature == null && signerPublicKey == null && version == null && network == null && type == null && height == null && timestamp == null && difficulty == null && generationHashProof == null && previousBlockHash == null && transactionsHash == null && receiptsHash == null && stateHash == null && beneficiaryAddress == null && feeMultiplier == null && votingEligibleAccountsCount == null && harvestingEligibleAccountsCount == null && totalVotingBalance == null && previousImportanceBlockHash == null && transactions == null )
	{
		_signature = signature ?? Signature();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? ImportanceBlockV1.BLOCK_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? ImportanceBlockV1.BLOCK_TYPE;
		_height = height ?? Height();
		_timestamp = timestamp ?? Timestamp();
		_difficulty = difficulty ?? Difficulty();
		_generationHashProof = generationHashProof ?? VrfProof();
		_previousBlockHash = previousBlockHash ?? Hash256();
		_transactionsHash = transactionsHash ?? Hash256();
		_receiptsHash = receiptsHash ?? Hash256();
		_stateHash = stateHash ?? Hash256();
		_beneficiaryAddress = beneficiaryAddress ?? Address();
		_feeMultiplier = feeMultiplier ?? BlockFeeMultiplier();
		_votingEligibleAccountsCount = votingEligibleAccountsCount ?? 0;
		_harvestingEligibleAccountsCount = harvestingEligibleAccountsCount ?? 0;
		_totalVotingBalance = totalVotingBalance ?? Amount();
		_previousImportanceBlockHash = previousImportanceBlockHash ?? Hash256();
		_transactions = transactions ?? [];
	}

	void sort() {
		_generationHashProof.sort();
	}

	Signature get signature {
		return _signature;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	BlockType get type {
		return _type;
	}

	Height get height {
		return _height;
	}

	Timestamp get timestamp {
		return _timestamp;
	}

	Difficulty get difficulty {
		return _difficulty;
	}

	VrfProof get generationHashProof {
		return _generationHashProof;
	}

	Hash256 get previousBlockHash {
		return _previousBlockHash;
	}

	Hash256 get transactionsHash {
		return _transactionsHash;
	}

	Hash256 get receiptsHash {
		return _receiptsHash;
	}

	Hash256 get stateHash {
		return _stateHash;
	}

	Address get beneficiaryAddress {
		return _beneficiaryAddress;
	}

	BlockFeeMultiplier get feeMultiplier {
		return _feeMultiplier;
	}

	int get votingEligibleAccountsCount {
		return _votingEligibleAccountsCount;
	}

	int get harvestingEligibleAccountsCount {
		return _harvestingEligibleAccountsCount;
	}

	Amount get totalVotingBalance {
		return _totalVotingBalance;
	}

	Hash256 get previousImportanceBlockHash {
		return _previousImportanceBlockHash;
	}

	List<Transaction> get transactions {
		return _transactions;
	}

	set signature(Signature value) {
		_signature = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(BlockType value) {
		_type = value;
	}

	set height(Height value) {
		_height = value;
	}

	set timestamp(Timestamp value) {
		_timestamp = value;
	}

	set difficulty(Difficulty value) {
		_difficulty = value;
	}

	set generationHashProof(VrfProof value) {
		_generationHashProof = value;
	}

	set previousBlockHash(Hash256 value) {
		_previousBlockHash = value;
	}

	set transactionsHash(Hash256 value) {
		_transactionsHash = value;
	}

	set receiptsHash(Hash256 value) {
		_receiptsHash = value;
	}

	set stateHash(Hash256 value) {
		_stateHash = value;
	}

	set beneficiaryAddress(Address value) {
		_beneficiaryAddress = value;
	}

	set feeMultiplier(BlockFeeMultiplier value) {
		_feeMultiplier = value;
	}

	set votingEligibleAccountsCount(int value) {
		_votingEligibleAccountsCount = value;
	}

	set harvestingEligibleAccountsCount(int value) {
		_harvestingEligibleAccountsCount = value;
	}

	set totalVotingBalance(Amount value) {
		_totalVotingBalance = value;
	}

	set previousImportanceBlockHash(Hash256 value) {
		_previousImportanceBlockHash = value;
	}

	set transactions(List<Transaction> value) {
		_transactions = value;
	}

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
		// nothing to do for size
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
		var transactions = ArrayHelpers.readVariableSizeElements(buffer, TransactionFactory(), 8, true).map((item) => item as Transaction).toList();
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signature.size, _signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _height.size, _height.serialize());
		currentPos += height.size;
		buffer.setRange(currentPos, currentPos + _timestamp.size, _timestamp.serialize());
		currentPos += timestamp.size;
		buffer.setRange(currentPos, currentPos + _difficulty.size, _difficulty.serialize());
		currentPos += difficulty.size;
		buffer.setRange(currentPos, currentPos + _generationHashProof.size, _generationHashProof.serialize());
		currentPos += generationHashProof.size;
		buffer.setRange(currentPos, currentPos + _previousBlockHash.size, _previousBlockHash.serialize());
		currentPos += previousBlockHash.size;
		buffer.setRange(currentPos, currentPos + _transactionsHash.size, _transactionsHash.serialize());
		currentPos += transactionsHash.size;
		buffer.setRange(currentPos, currentPos + _receiptsHash.size, _receiptsHash.serialize());
		currentPos += receiptsHash.size;
		buffer.setRange(currentPos, currentPos + _stateHash.size, _stateHash.serialize());
		currentPos += stateHash.size;
		buffer.setRange(currentPos, currentPos + _beneficiaryAddress.size, _beneficiaryAddress.serialize());
		currentPos += beneficiaryAddress.size;
		buffer.setRange(currentPos, currentPos + _feeMultiplier.size, _feeMultiplier.serialize());
		currentPos += feeMultiplier.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_votingEligibleAccountsCount, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 8, intToBytes(_harvestingEligibleAccountsCount, 8));
		currentPos += 8;
		buffer.setRange(currentPos, currentPos + _totalVotingBalance.size, _totalVotingBalance.serialize());
		currentPos += totalVotingBalance.size;
		buffer.setRange(currentPos, currentPos + _previousImportanceBlockHash.size, _previousImportanceBlockHash.serialize());
		currentPos += previousImportanceBlockHash.size;
		sort();
		var res_transactions = ArrayHelpers.writeVariableSizeElements(buffer, _transactions, 8, currentPos, true);
		currentPos = res_transactions.item2;
		buffer = res_transactions.item1;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'ImportanceBlockV1(';
		result += 'signature: "${_signature.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'height: "${_height.toString()}", ';
		result += 'timestamp: "${_timestamp.toString()}", ';
		result += 'difficulty: "${_difficulty.toString()}", ';
		result += 'generationHashProof: "${_generationHashProof.toString()}", ';
		result += 'previousBlockHash: "${_previousBlockHash.toString()}", ';
		result += 'transactionsHash: "${_transactionsHash.toString()}", ';
		result += 'receiptsHash: "${_receiptsHash.toString()}", ';
		result += 'stateHash: "${_stateHash.toString()}", ';
		result += 'beneficiaryAddress: "${_beneficiaryAddress.toString()}", ';
		result += 'feeMultiplier: "${_feeMultiplier.toString()}", ';
		result += 'votingEligibleAccountsCount: "0x${_votingEligibleAccountsCount.toRadixString(16).padLeft(4 * 2, '0').toUpperCase()}", ';
		result += 'harvestingEligibleAccountsCount: "0x${_harvestingEligibleAccountsCount.toRadixString(16).padLeft(8 * 2, '0').toUpperCase()}", ';
		result += 'totalVotingBalance: "${_totalVotingBalance.toString()}", ';
		result += 'previousImportanceBlockHash: "${_previousImportanceBlockHash.toString()}", ';
		result += 'transactions: "${_transactions.map((e) => e.toString()).toList()}", ';
		result += ')';
		return result;
	}
}


class FinalizationRound extends StructBase implements IDeserializable {

	static const Map<String, String> TYPE_HINTS = {
		'epoch': 'pod:FinalizationEpoch',
		'point': 'pod:FinalizationPoint'
	};

	FinalizationEpoch _epoch = FinalizationEpoch();
	FinalizationPoint _point = FinalizationPoint();

	FinalizationRound({ FinalizationEpoch? epoch, FinalizationPoint? point}) 
		: super(epoch == null && point == null )
	{
		_epoch = epoch ?? FinalizationEpoch();
		_point = point ?? FinalizationPoint();
	}

	void sort() {
		// empty body
	}

	FinalizationEpoch get epoch {
		return _epoch;
	}

	FinalizationPoint get point {
		return _point;
	}

	set epoch(FinalizationEpoch value) {
		_epoch = value;
	}

	set point(FinalizationPoint value) {
		_point = value;
	}

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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + _epoch.size, _epoch.serialize());
		currentPos += epoch.size;
		buffer.setRange(currentPos, currentPos + _point.size, _point.serialize());
		currentPos += point.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'FinalizationRound(';
		result += 'epoch: "${_epoch.toString()}", ';
		result += 'point: "${_point.toString()}", ';
		result += ')';
		return result;
	}
}


class FinalizedBlockHeader extends StructBase implements IDeserializable {

	static const Map<String, String> TYPE_HINTS = {
		'round': 'struct:FinalizationRound',
		'height': 'pod:Height',
		'hash': 'pod:Hash256'
	};

	FinalizationRound _round = FinalizationRound();
	Height _height = Height();
	Hash256 _hash = Hash256();

	FinalizedBlockHeader({ FinalizationRound? round, Height? height, Hash256? hash}) 
		: super(round == null && height == null && hash == null )
	{
		_round = round ?? FinalizationRound();
		_height = height ?? Height();
		_hash = hash ?? Hash256();
	}

	void sort() {
		_round.sort();
	}

	FinalizationRound get round {
		return _round;
	}

	Height get height {
		return _height;
	}

	Hash256 get hash {
		return _hash;
	}

	set round(FinalizationRound value) {
		_round = value;
	}

	set height(Height value) {
		_height = value;
	}

	set hash(Hash256 value) {
		_hash = value;
	}

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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + _round.size, _round.serialize());
		currentPos += round.size;
		buffer.setRange(currentPos, currentPos + _height.size, _height.serialize());
		currentPos += height.size;
		buffer.setRange(currentPos, currentPos + _hash.size, _hash.serialize());
		currentPos += hash.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'FinalizedBlockHeader(';
		result += 'round: "${_round.toString()}", ';
		result += 'height: "${_height.toString()}", ';
		result += 'hash: "${_hash.toString()}", ';
		result += ')';
		return result;
	}
}


class ReceiptType implements IDeserializable {
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

	final int value;

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

	ReceiptType([int? _value]) : value = _value ?? 4685;

	int get size {
		return 2;
	}

	@override
	ReceiptType deserialize(Uint8List payload) {
		var byteData = ByteData.sublistView(payload);
		return ReceiptType(byteData.getUint16(0, Endian.little));
	}

	Uint8List serialize() {
		var byteData = ByteData(2)..setUint16(0, value, Endian.little);
		return byteData.buffer.asUint8List();
	}

	@override
	String toString() {
		return 'ReceiptType.${_flags[value]}';
	}
}


class Receipt extends StructBase implements IDeserializable {

	static const Map<String, String> TYPE_HINTS = {
		'type': 'enum:ReceiptType'
	};

	int _version = 0;
	ReceiptType _type = ReceiptType.MOSAIC_RENTAL_FEE;

	Receipt({ int? version, ReceiptType? type}) 
		: super(version == null && type == null )
	{
		_version = version ?? 0;
		_type = type ?? ReceiptType.MOSAIC_RENTAL_FEE;
	}

	void sort() {
		// empty body
	}

	int get version {
		return _version;
	}

	ReceiptType get type {
		return _type;
	}

	set version(int value) {
		_version = value;
	}

	set type(ReceiptType value) {
		_type = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_version, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'Receipt(';
		result += 'version: "0x${_version.toRadixString(16).padLeft(2 * 2, '0').toUpperCase()}", ';
		result += 'type: "${_type.toString()}", ';
		result += ')';
		return result;
	}
}


class HarvestFeeReceipt extends StructBase implements IDeserializable {
	static final ReceiptType RECEIPT_TYPE = ReceiptType(ReceiptType.HARVEST_FEE.value);

	static const Map<String, String> TYPE_HINTS = {
		'type': 'enum:ReceiptType',
		'mosaic': 'struct:Mosaic',
		'targetAddress': 'pod:Address'
	};

	int _version = 0;
	ReceiptType _type = ReceiptType.MOSAIC_RENTAL_FEE;
	Mosaic _mosaic = Mosaic();
	Address _targetAddress = Address();

	HarvestFeeReceipt({ int? version, ReceiptType? type, Mosaic? mosaic, Address? targetAddress}) 
		: super(version == null && type == null && mosaic == null && targetAddress == null )
	{
		_version = version ?? 0;
		_type = type ?? HarvestFeeReceipt.RECEIPT_TYPE;
		_mosaic = mosaic ?? Mosaic();
		_targetAddress = targetAddress ?? Address();
	}

	void sort() {
		_mosaic.sort();
	}

	int get version {
		return _version;
	}

	ReceiptType get type {
		return _type;
	}

	Mosaic get mosaic {
		return _mosaic;
	}

	Address get targetAddress {
		return _targetAddress;
	}

	set version(int value) {
		_version = value;
	}

	set type(ReceiptType value) {
		_type = value;
	}

	set mosaic(Mosaic value) {
		_mosaic = value;
	}

	set targetAddress(Address value) {
		_targetAddress = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_version, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _mosaic.size, _mosaic.serialize());
		currentPos += mosaic.size;
		buffer.setRange(currentPos, currentPos + _targetAddress.size, _targetAddress.serialize());
		currentPos += targetAddress.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'HarvestFeeReceipt(';
		result += 'version: "0x${_version.toRadixString(16).padLeft(2 * 2, '0').toUpperCase()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'mosaic: "${_mosaic.toString()}", ';
		result += 'targetAddress: "${_targetAddress.toString()}", ';
		result += ')';
		return result;
	}
}


class InflationReceipt extends StructBase implements IDeserializable {
	static final ReceiptType RECEIPT_TYPE = ReceiptType(ReceiptType.INFLATION.value);

	static const Map<String, String> TYPE_HINTS = {
		'type': 'enum:ReceiptType',
		'mosaic': 'struct:Mosaic'
	};

	int _version = 0;
	ReceiptType _type = ReceiptType.MOSAIC_RENTAL_FEE;
	Mosaic _mosaic = Mosaic();

	InflationReceipt({ int? version, ReceiptType? type, Mosaic? mosaic}) 
		: super(version == null && type == null && mosaic == null )
	{
		_version = version ?? 0;
		_type = type ?? InflationReceipt.RECEIPT_TYPE;
		_mosaic = mosaic ?? Mosaic();
	}

	void sort() {
		_mosaic.sort();
	}

	int get version {
		return _version;
	}

	ReceiptType get type {
		return _type;
	}

	Mosaic get mosaic {
		return _mosaic;
	}

	set version(int value) {
		_version = value;
	}

	set type(ReceiptType value) {
		_type = value;
	}

	set mosaic(Mosaic value) {
		_mosaic = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_version, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _mosaic.size, _mosaic.serialize());
		currentPos += mosaic.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'InflationReceipt(';
		result += 'version: "0x${_version.toRadixString(16).padLeft(2 * 2, '0').toUpperCase()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'mosaic: "${_mosaic.toString()}", ';
		result += ')';
		return result;
	}
}


class LockHashCreatedFeeReceipt extends StructBase implements IDeserializable {
	static final ReceiptType RECEIPT_TYPE = ReceiptType(ReceiptType.LOCK_HASH_CREATED.value);

	static const Map<String, String> TYPE_HINTS = {
		'type': 'enum:ReceiptType',
		'mosaic': 'struct:Mosaic',
		'targetAddress': 'pod:Address'
	};

	int _version = 0;
	ReceiptType _type = ReceiptType.MOSAIC_RENTAL_FEE;
	Mosaic _mosaic = Mosaic();
	Address _targetAddress = Address();

	LockHashCreatedFeeReceipt({ int? version, ReceiptType? type, Mosaic? mosaic, Address? targetAddress}) 
		: super(version == null && type == null && mosaic == null && targetAddress == null )
	{
		_version = version ?? 0;
		_type = type ?? LockHashCreatedFeeReceipt.RECEIPT_TYPE;
		_mosaic = mosaic ?? Mosaic();
		_targetAddress = targetAddress ?? Address();
	}

	void sort() {
		_mosaic.sort();
	}

	int get version {
		return _version;
	}

	ReceiptType get type {
		return _type;
	}

	Mosaic get mosaic {
		return _mosaic;
	}

	Address get targetAddress {
		return _targetAddress;
	}

	set version(int value) {
		_version = value;
	}

	set type(ReceiptType value) {
		_type = value;
	}

	set mosaic(Mosaic value) {
		_mosaic = value;
	}

	set targetAddress(Address value) {
		_targetAddress = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_version, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _mosaic.size, _mosaic.serialize());
		currentPos += mosaic.size;
		buffer.setRange(currentPos, currentPos + _targetAddress.size, _targetAddress.serialize());
		currentPos += targetAddress.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'LockHashCreatedFeeReceipt(';
		result += 'version: "0x${_version.toRadixString(16).padLeft(2 * 2, '0').toUpperCase()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'mosaic: "${_mosaic.toString()}", ';
		result += 'targetAddress: "${_targetAddress.toString()}", ';
		result += ')';
		return result;
	}
}


class LockHashCompletedFeeReceipt extends StructBase implements IDeserializable {
	static final ReceiptType RECEIPT_TYPE = ReceiptType(ReceiptType.LOCK_HASH_COMPLETED.value);

	static const Map<String, String> TYPE_HINTS = {
		'type': 'enum:ReceiptType',
		'mosaic': 'struct:Mosaic',
		'targetAddress': 'pod:Address'
	};

	int _version = 0;
	ReceiptType _type = ReceiptType.MOSAIC_RENTAL_FEE;
	Mosaic _mosaic = Mosaic();
	Address _targetAddress = Address();

	LockHashCompletedFeeReceipt({ int? version, ReceiptType? type, Mosaic? mosaic, Address? targetAddress}) 
		: super(version == null && type == null && mosaic == null && targetAddress == null )
	{
		_version = version ?? 0;
		_type = type ?? LockHashCompletedFeeReceipt.RECEIPT_TYPE;
		_mosaic = mosaic ?? Mosaic();
		_targetAddress = targetAddress ?? Address();
	}

	void sort() {
		_mosaic.sort();
	}

	int get version {
		return _version;
	}

	ReceiptType get type {
		return _type;
	}

	Mosaic get mosaic {
		return _mosaic;
	}

	Address get targetAddress {
		return _targetAddress;
	}

	set version(int value) {
		_version = value;
	}

	set type(ReceiptType value) {
		_type = value;
	}

	set mosaic(Mosaic value) {
		_mosaic = value;
	}

	set targetAddress(Address value) {
		_targetAddress = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_version, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _mosaic.size, _mosaic.serialize());
		currentPos += mosaic.size;
		buffer.setRange(currentPos, currentPos + _targetAddress.size, _targetAddress.serialize());
		currentPos += targetAddress.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'LockHashCompletedFeeReceipt(';
		result += 'version: "0x${_version.toRadixString(16).padLeft(2 * 2, '0').toUpperCase()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'mosaic: "${_mosaic.toString()}", ';
		result += 'targetAddress: "${_targetAddress.toString()}", ';
		result += ')';
		return result;
	}
}


class LockHashExpiredFeeReceipt extends StructBase implements IDeserializable {
	static final ReceiptType RECEIPT_TYPE = ReceiptType(ReceiptType.LOCK_HASH_EXPIRED.value);

	static const Map<String, String> TYPE_HINTS = {
		'type': 'enum:ReceiptType',
		'mosaic': 'struct:Mosaic',
		'targetAddress': 'pod:Address'
	};

	int _version = 0;
	ReceiptType _type = ReceiptType.MOSAIC_RENTAL_FEE;
	Mosaic _mosaic = Mosaic();
	Address _targetAddress = Address();

	LockHashExpiredFeeReceipt({ int? version, ReceiptType? type, Mosaic? mosaic, Address? targetAddress}) 
		: super(version == null && type == null && mosaic == null && targetAddress == null )
	{
		_version = version ?? 0;
		_type = type ?? LockHashExpiredFeeReceipt.RECEIPT_TYPE;
		_mosaic = mosaic ?? Mosaic();
		_targetAddress = targetAddress ?? Address();
	}

	void sort() {
		_mosaic.sort();
	}

	int get version {
		return _version;
	}

	ReceiptType get type {
		return _type;
	}

	Mosaic get mosaic {
		return _mosaic;
	}

	Address get targetAddress {
		return _targetAddress;
	}

	set version(int value) {
		_version = value;
	}

	set type(ReceiptType value) {
		_type = value;
	}

	set mosaic(Mosaic value) {
		_mosaic = value;
	}

	set targetAddress(Address value) {
		_targetAddress = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_version, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _mosaic.size, _mosaic.serialize());
		currentPos += mosaic.size;
		buffer.setRange(currentPos, currentPos + _targetAddress.size, _targetAddress.serialize());
		currentPos += targetAddress.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'LockHashExpiredFeeReceipt(';
		result += 'version: "0x${_version.toRadixString(16).padLeft(2 * 2, '0').toUpperCase()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'mosaic: "${_mosaic.toString()}", ';
		result += 'targetAddress: "${_targetAddress.toString()}", ';
		result += ')';
		return result;
	}
}


class LockSecretCreatedFeeReceipt extends StructBase implements IDeserializable {
	static final ReceiptType RECEIPT_TYPE = ReceiptType(ReceiptType.LOCK_SECRET_CREATED.value);

	static const Map<String, String> TYPE_HINTS = {
		'type': 'enum:ReceiptType',
		'mosaic': 'struct:Mosaic',
		'targetAddress': 'pod:Address'
	};

	int _version = 0;
	ReceiptType _type = ReceiptType.MOSAIC_RENTAL_FEE;
	Mosaic _mosaic = Mosaic();
	Address _targetAddress = Address();

	LockSecretCreatedFeeReceipt({ int? version, ReceiptType? type, Mosaic? mosaic, Address? targetAddress}) 
		: super(version == null && type == null && mosaic == null && targetAddress == null )
	{
		_version = version ?? 0;
		_type = type ?? LockSecretCreatedFeeReceipt.RECEIPT_TYPE;
		_mosaic = mosaic ?? Mosaic();
		_targetAddress = targetAddress ?? Address();
	}

	void sort() {
		_mosaic.sort();
	}

	int get version {
		return _version;
	}

	ReceiptType get type {
		return _type;
	}

	Mosaic get mosaic {
		return _mosaic;
	}

	Address get targetAddress {
		return _targetAddress;
	}

	set version(int value) {
		_version = value;
	}

	set type(ReceiptType value) {
		_type = value;
	}

	set mosaic(Mosaic value) {
		_mosaic = value;
	}

	set targetAddress(Address value) {
		_targetAddress = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_version, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _mosaic.size, _mosaic.serialize());
		currentPos += mosaic.size;
		buffer.setRange(currentPos, currentPos + _targetAddress.size, _targetAddress.serialize());
		currentPos += targetAddress.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'LockSecretCreatedFeeReceipt(';
		result += 'version: "0x${_version.toRadixString(16).padLeft(2 * 2, '0').toUpperCase()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'mosaic: "${_mosaic.toString()}", ';
		result += 'targetAddress: "${_targetAddress.toString()}", ';
		result += ')';
		return result;
	}
}


class LockSecretCompletedFeeReceipt extends StructBase implements IDeserializable {
	static final ReceiptType RECEIPT_TYPE = ReceiptType(ReceiptType.LOCK_SECRET_COMPLETED.value);

	static const Map<String, String> TYPE_HINTS = {
		'type': 'enum:ReceiptType',
		'mosaic': 'struct:Mosaic',
		'targetAddress': 'pod:Address'
	};

	int _version = 0;
	ReceiptType _type = ReceiptType.MOSAIC_RENTAL_FEE;
	Mosaic _mosaic = Mosaic();
	Address _targetAddress = Address();

	LockSecretCompletedFeeReceipt({ int? version, ReceiptType? type, Mosaic? mosaic, Address? targetAddress}) 
		: super(version == null && type == null && mosaic == null && targetAddress == null )
	{
		_version = version ?? 0;
		_type = type ?? LockSecretCompletedFeeReceipt.RECEIPT_TYPE;
		_mosaic = mosaic ?? Mosaic();
		_targetAddress = targetAddress ?? Address();
	}

	void sort() {
		_mosaic.sort();
	}

	int get version {
		return _version;
	}

	ReceiptType get type {
		return _type;
	}

	Mosaic get mosaic {
		return _mosaic;
	}

	Address get targetAddress {
		return _targetAddress;
	}

	set version(int value) {
		_version = value;
	}

	set type(ReceiptType value) {
		_type = value;
	}

	set mosaic(Mosaic value) {
		_mosaic = value;
	}

	set targetAddress(Address value) {
		_targetAddress = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_version, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _mosaic.size, _mosaic.serialize());
		currentPos += mosaic.size;
		buffer.setRange(currentPos, currentPos + _targetAddress.size, _targetAddress.serialize());
		currentPos += targetAddress.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'LockSecretCompletedFeeReceipt(';
		result += 'version: "0x${_version.toRadixString(16).padLeft(2 * 2, '0').toUpperCase()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'mosaic: "${_mosaic.toString()}", ';
		result += 'targetAddress: "${_targetAddress.toString()}", ';
		result += ')';
		return result;
	}
}


class LockSecretExpiredFeeReceipt extends StructBase implements IDeserializable {
	static final ReceiptType RECEIPT_TYPE = ReceiptType(ReceiptType.LOCK_SECRET_EXPIRED.value);

	static const Map<String, String> TYPE_HINTS = {
		'type': 'enum:ReceiptType',
		'mosaic': 'struct:Mosaic',
		'targetAddress': 'pod:Address'
	};

	int _version = 0;
	ReceiptType _type = ReceiptType.MOSAIC_RENTAL_FEE;
	Mosaic _mosaic = Mosaic();
	Address _targetAddress = Address();

	LockSecretExpiredFeeReceipt({ int? version, ReceiptType? type, Mosaic? mosaic, Address? targetAddress}) 
		: super(version == null && type == null && mosaic == null && targetAddress == null )
	{
		_version = version ?? 0;
		_type = type ?? LockSecretExpiredFeeReceipt.RECEIPT_TYPE;
		_mosaic = mosaic ?? Mosaic();
		_targetAddress = targetAddress ?? Address();
	}

	void sort() {
		_mosaic.sort();
	}

	int get version {
		return _version;
	}

	ReceiptType get type {
		return _type;
	}

	Mosaic get mosaic {
		return _mosaic;
	}

	Address get targetAddress {
		return _targetAddress;
	}

	set version(int value) {
		_version = value;
	}

	set type(ReceiptType value) {
		_type = value;
	}

	set mosaic(Mosaic value) {
		_mosaic = value;
	}

	set targetAddress(Address value) {
		_targetAddress = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_version, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _mosaic.size, _mosaic.serialize());
		currentPos += mosaic.size;
		buffer.setRange(currentPos, currentPos + _targetAddress.size, _targetAddress.serialize());
		currentPos += targetAddress.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'LockSecretExpiredFeeReceipt(';
		result += 'version: "0x${_version.toRadixString(16).padLeft(2 * 2, '0').toUpperCase()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'mosaic: "${_mosaic.toString()}", ';
		result += 'targetAddress: "${_targetAddress.toString()}", ';
		result += ')';
		return result;
	}
}


class MosaicExpiredReceipt extends StructBase implements IDeserializable {
	static final ReceiptType RECEIPT_TYPE = ReceiptType(ReceiptType.MOSAIC_EXPIRED.value);

	static const Map<String, String> TYPE_HINTS = {
		'type': 'enum:ReceiptType',
		'artifactId': 'pod:MosaicId'
	};

	int _version = 0;
	ReceiptType _type = ReceiptType.MOSAIC_RENTAL_FEE;
	MosaicId _artifactId = MosaicId();

	MosaicExpiredReceipt({ int? version, ReceiptType? type, MosaicId? artifactId}) 
		: super(version == null && type == null && artifactId == null )
	{
		_version = version ?? 0;
		_type = type ?? MosaicExpiredReceipt.RECEIPT_TYPE;
		_artifactId = artifactId ?? MosaicId();
	}

	void sort() {
		// empty body
	}

	int get version {
		return _version;
	}

	ReceiptType get type {
		return _type;
	}

	MosaicId get artifactId {
		return _artifactId;
	}

	set version(int value) {
		_version = value;
	}

	set type(ReceiptType value) {
		_type = value;
	}

	set artifactId(MosaicId value) {
		_artifactId = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_version, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _artifactId.size, _artifactId.serialize());
		currentPos += artifactId.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'MosaicExpiredReceipt(';
		result += 'version: "0x${_version.toRadixString(16).padLeft(2 * 2, '0').toUpperCase()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'artifactId: "${_artifactId.toString()}", ';
		result += ')';
		return result;
	}
}


class MosaicRentalFeeReceipt extends StructBase implements IDeserializable {
	static final ReceiptType RECEIPT_TYPE = ReceiptType(ReceiptType.MOSAIC_RENTAL_FEE.value);

	static const Map<String, String> TYPE_HINTS = {
		'type': 'enum:ReceiptType',
		'mosaic': 'struct:Mosaic',
		'senderAddress': 'pod:Address',
		'recipientAddress': 'pod:Address'
	};

	int _version = 0;
	ReceiptType _type = ReceiptType.MOSAIC_RENTAL_FEE;
	Mosaic _mosaic = Mosaic();
	Address _senderAddress = Address();
	Address _recipientAddress = Address();

	MosaicRentalFeeReceipt({ int? version, ReceiptType? type, Mosaic? mosaic, Address? senderAddress, Address? recipientAddress}) 
		: super(version == null && type == null && mosaic == null && senderAddress == null && recipientAddress == null )
	{
		_version = version ?? 0;
		_type = type ?? MosaicRentalFeeReceipt.RECEIPT_TYPE;
		_mosaic = mosaic ?? Mosaic();
		_senderAddress = senderAddress ?? Address();
		_recipientAddress = recipientAddress ?? Address();
	}

	void sort() {
		_mosaic.sort();
	}

	int get version {
		return _version;
	}

	ReceiptType get type {
		return _type;
	}

	Mosaic get mosaic {
		return _mosaic;
	}

	Address get senderAddress {
		return _senderAddress;
	}

	Address get recipientAddress {
		return _recipientAddress;
	}

	set version(int value) {
		_version = value;
	}

	set type(ReceiptType value) {
		_type = value;
	}

	set mosaic(Mosaic value) {
		_mosaic = value;
	}

	set senderAddress(Address value) {
		_senderAddress = value;
	}

	set recipientAddress(Address value) {
		_recipientAddress = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_version, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _mosaic.size, _mosaic.serialize());
		currentPos += mosaic.size;
		buffer.setRange(currentPos, currentPos + _senderAddress.size, _senderAddress.serialize());
		currentPos += senderAddress.size;
		buffer.setRange(currentPos, currentPos + _recipientAddress.size, _recipientAddress.serialize());
		currentPos += recipientAddress.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'MosaicRentalFeeReceipt(';
		result += 'version: "0x${_version.toRadixString(16).padLeft(2 * 2, '0').toUpperCase()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'mosaic: "${_mosaic.toString()}", ';
		result += 'senderAddress: "${_senderAddress.toString()}", ';
		result += 'recipientAddress: "${_recipientAddress.toString()}", ';
		result += ')';
		return result;
	}
}


class NamespaceId extends BaseValue implements IDeserializable {
	static const int SIZE = 8;

	NamespaceId([dynamic namespaceId]) : super(SIZE, namespaceId ?? 0);

	@override
	NamespaceId deserialize(Uint8List payload) {
		return NamespaceId(bytesToInt(payload.sublist(0, 8), 8));
	}

	Uint8List serialize() {
		var buffer = Uint8List(SIZE);
		buffer.setRange(0, 0 + 8, intToBytes(value, 8));
		return buffer;
	}
}


class NamespaceRegistrationType implements IDeserializable {
	static final ROOT = NamespaceRegistrationType(0);
	static final CHILD = NamespaceRegistrationType(1);

	final int value;

	static final _flags = {
		0: 'ROOT',
		1: 'CHILD',
	};

	NamespaceRegistrationType([int? _value]) : value = _value ?? 0;

	int get size {
		return 1;
	}

	@override
	NamespaceRegistrationType deserialize(Uint8List payload) {
		var byteData = ByteData.sublistView(payload);
		return NamespaceRegistrationType(byteData.getUint8(0));
	}

	Uint8List serialize() {
		var byteData = ByteData(1)..setUint8(0, value);
		return byteData.buffer.asUint8List();
	}

	@override
	String toString() {
		return 'NamespaceRegistrationType.${_flags[value]}';
	}
}


class AliasAction implements IDeserializable {
	static final UNLINK = AliasAction(0);
	static final LINK = AliasAction(1);

	final int value;

	static final _flags = {
		0: 'UNLINK',
		1: 'LINK',
	};

	AliasAction([int? _value]) : value = _value ?? 0;

	int get size {
		return 1;
	}

	@override
	AliasAction deserialize(Uint8List payload) {
		var byteData = ByteData.sublistView(payload);
		return AliasAction(byteData.getUint8(0));
	}

	Uint8List serialize() {
		var byteData = ByteData(1)..setUint8(0, value);
		return byteData.buffer.asUint8List();
	}

	@override
	String toString() {
		return 'AliasAction.${_flags[value]}';
	}
}


class NamespaceExpiredReceipt extends StructBase implements IDeserializable {
	static final ReceiptType RECEIPT_TYPE = ReceiptType(ReceiptType.NAMESPACE_EXPIRED.value);

	static const Map<String, String> TYPE_HINTS = {
		'type': 'enum:ReceiptType',
		'artifactId': 'pod:NamespaceId'
	};

	int _version = 0;
	ReceiptType _type = ReceiptType.MOSAIC_RENTAL_FEE;
	NamespaceId _artifactId = NamespaceId();

	NamespaceExpiredReceipt({ int? version, ReceiptType? type, NamespaceId? artifactId}) 
		: super(version == null && type == null && artifactId == null )
	{
		_version = version ?? 0;
		_type = type ?? NamespaceExpiredReceipt.RECEIPT_TYPE;
		_artifactId = artifactId ?? NamespaceId();
	}

	void sort() {
		// empty body
	}

	int get version {
		return _version;
	}

	ReceiptType get type {
		return _type;
	}

	NamespaceId get artifactId {
		return _artifactId;
	}

	set version(int value) {
		_version = value;
	}

	set type(ReceiptType value) {
		_type = value;
	}

	set artifactId(NamespaceId value) {
		_artifactId = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_version, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _artifactId.size, _artifactId.serialize());
		currentPos += artifactId.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'NamespaceExpiredReceipt(';
		result += 'version: "0x${_version.toRadixString(16).padLeft(2 * 2, '0').toUpperCase()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'artifactId: "${_artifactId.toString()}", ';
		result += ')';
		return result;
	}
}


class NamespaceDeletedReceipt extends StructBase implements IDeserializable {
	static final ReceiptType RECEIPT_TYPE = ReceiptType(ReceiptType.NAMESPACE_DELETED.value);

	static const Map<String, String> TYPE_HINTS = {
		'type': 'enum:ReceiptType',
		'artifactId': 'pod:NamespaceId'
	};

	int _version = 0;
	ReceiptType _type = ReceiptType.MOSAIC_RENTAL_FEE;
	NamespaceId _artifactId = NamespaceId();

	NamespaceDeletedReceipt({ int? version, ReceiptType? type, NamespaceId? artifactId}) 
		: super(version == null && type == null && artifactId == null )
	{
		_version = version ?? 0;
		_type = type ?? NamespaceDeletedReceipt.RECEIPT_TYPE;
		_artifactId = artifactId ?? NamespaceId();
	}

	void sort() {
		// empty body
	}

	int get version {
		return _version;
	}

	ReceiptType get type {
		return _type;
	}

	NamespaceId get artifactId {
		return _artifactId;
	}

	set version(int value) {
		_version = value;
	}

	set type(ReceiptType value) {
		_type = value;
	}

	set artifactId(NamespaceId value) {
		_artifactId = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_version, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _artifactId.size, _artifactId.serialize());
		currentPos += artifactId.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'NamespaceDeletedReceipt(';
		result += 'version: "0x${_version.toRadixString(16).padLeft(2 * 2, '0').toUpperCase()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'artifactId: "${_artifactId.toString()}", ';
		result += ')';
		return result;
	}
}


class NamespaceRentalFeeReceipt extends StructBase implements IDeserializable {
	static final ReceiptType RECEIPT_TYPE = ReceiptType(ReceiptType.NAMESPACE_RENTAL_FEE.value);

	static const Map<String, String> TYPE_HINTS = {
		'type': 'enum:ReceiptType',
		'mosaic': 'struct:Mosaic',
		'senderAddress': 'pod:Address',
		'recipientAddress': 'pod:Address'
	};

	int _version = 0;
	ReceiptType _type = ReceiptType.MOSAIC_RENTAL_FEE;
	Mosaic _mosaic = Mosaic();
	Address _senderAddress = Address();
	Address _recipientAddress = Address();

	NamespaceRentalFeeReceipt({ int? version, ReceiptType? type, Mosaic? mosaic, Address? senderAddress, Address? recipientAddress}) 
		: super(version == null && type == null && mosaic == null && senderAddress == null && recipientAddress == null )
	{
		_version = version ?? 0;
		_type = type ?? NamespaceRentalFeeReceipt.RECEIPT_TYPE;
		_mosaic = mosaic ?? Mosaic();
		_senderAddress = senderAddress ?? Address();
		_recipientAddress = recipientAddress ?? Address();
	}

	void sort() {
		_mosaic.sort();
	}

	int get version {
		return _version;
	}

	ReceiptType get type {
		return _type;
	}

	Mosaic get mosaic {
		return _mosaic;
	}

	Address get senderAddress {
		return _senderAddress;
	}

	Address get recipientAddress {
		return _recipientAddress;
	}

	set version(int value) {
		_version = value;
	}

	set type(ReceiptType value) {
		_type = value;
	}

	set mosaic(Mosaic value) {
		_mosaic = value;
	}

	set senderAddress(Address value) {
		_senderAddress = value;
	}

	set recipientAddress(Address value) {
		_recipientAddress = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_version, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _mosaic.size, _mosaic.serialize());
		currentPos += mosaic.size;
		buffer.setRange(currentPos, currentPos + _senderAddress.size, _senderAddress.serialize());
		currentPos += senderAddress.size;
		buffer.setRange(currentPos, currentPos + _recipientAddress.size, _recipientAddress.serialize());
		currentPos += recipientAddress.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'NamespaceRentalFeeReceipt(';
		result += 'version: "0x${_version.toRadixString(16).padLeft(2 * 2, '0').toUpperCase()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'mosaic: "${_mosaic.toString()}", ';
		result += 'senderAddress: "${_senderAddress.toString()}", ';
		result += 'recipientAddress: "${_recipientAddress.toString()}", ';
		result += ')';
		return result;
	}
}


class ReceiptSource extends StructBase implements IDeserializable {

	static const Map<String, String> TYPE_HINTS = {
	};

	int _primaryId = 0;
	int _secondaryId = 0;

	ReceiptSource({ int? primaryId, int? secondaryId}) 
		: super(primaryId == null && secondaryId == null )
	{
		_primaryId = primaryId ?? 0;
		_secondaryId = secondaryId ?? 0;
	}

	void sort() {
		// empty body
	}

	int get primaryId {
		return _primaryId;
	}

	int get secondaryId {
		return _secondaryId;
	}

	set primaryId(int value) {
		_primaryId = value;
	}

	set secondaryId(int value) {
		_secondaryId = value;
	}

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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_primaryId, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_secondaryId, 4));
		currentPos += 4;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'ReceiptSource(';
		result += 'primaryId: "0x${_primaryId.toRadixString(16).padLeft(4 * 2, '0').toUpperCase()}", ';
		result += 'secondaryId: "0x${_secondaryId.toRadixString(16).padLeft(4 * 2, '0').toUpperCase()}", ';
		result += ')';
		return result;
	}
}


class AddressResolutionEntry extends StructBase implements IDeserializable {

	static const Map<String, String> TYPE_HINTS = {
		'source': 'struct:ReceiptSource',
		'resolvedValue': 'pod:Address'
	};

	ReceiptSource _source = ReceiptSource();
	Address _resolvedValue = Address();

	AddressResolutionEntry({ ReceiptSource? source, Address? resolvedValue}) 
		: super(source == null && resolvedValue == null )
	{
		_source = source ?? ReceiptSource();
		_resolvedValue = resolvedValue ?? Address();
	}

	void sort() {
		_source.sort();
	}

	ReceiptSource get source {
		return _source;
	}

	Address get resolvedValue {
		return _resolvedValue;
	}

	set source(ReceiptSource value) {
		_source = value;
	}

	set resolvedValue(Address value) {
		_resolvedValue = value;
	}

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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + _source.size, _source.serialize());
		currentPos += source.size;
		buffer.setRange(currentPos, currentPos + _resolvedValue.size, _resolvedValue.serialize());
		currentPos += resolvedValue.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'AddressResolutionEntry(';
		result += 'source: "${_source.toString()}", ';
		result += 'resolvedValue: "${_resolvedValue.toString()}", ';
		result += ')';
		return result;
	}
}


class AddressResolutionStatement extends StructBase implements IDeserializable {

	static const Map<String, String> TYPE_HINTS = {
		'unresolved': 'pod:UnresolvedAddress',
		'resolutionEntries': 'array[AddressResolutionEntry]'
	};

	UnresolvedAddress _unresolved = UnresolvedAddress();
	List<AddressResolutionEntry> _resolutionEntries = [];

	AddressResolutionStatement({ UnresolvedAddress? unresolved, List<AddressResolutionEntry>? resolutionEntries}) 
		: super(unresolved == null && resolutionEntries == null )
	{
		_unresolved = unresolved ?? UnresolvedAddress();
		_resolutionEntries = resolutionEntries ?? [];
	}

	void sort() {
		// empty body
	}

	UnresolvedAddress get unresolved {
		return _unresolved;
	}

	List<AddressResolutionEntry> get resolutionEntries {
		return _resolutionEntries;
	}

	set unresolved(UnresolvedAddress value) {
		_unresolved = value;
	}

	set resolutionEntries(List<AddressResolutionEntry> value) {
		_resolutionEntries = value;
	}

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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + _unresolved.size, _unresolved.serialize());
		currentPos += unresolved.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_resolutionEntries.length, 4));
		currentPos += 4;
		sort();
		var res_resolutionEntries = ArrayHelpers.writeArray(buffer, _resolutionEntries, currentPos);
		currentPos = res_resolutionEntries.item2;
		buffer = res_resolutionEntries.item1;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'AddressResolutionStatement(';
		result += 'unresolved: "${_unresolved.toString()}", ';
		result += 'resolutionEntries: "${_resolutionEntries.map((e) => e.toString()).toList()}", ';
		result += ')';
		return result;
	}
}


class MosaicResolutionEntry extends StructBase implements IDeserializable {

	static const Map<String, String> TYPE_HINTS = {
		'source': 'struct:ReceiptSource',
		'resolvedValue': 'pod:MosaicId'
	};

	ReceiptSource _source = ReceiptSource();
	MosaicId _resolvedValue = MosaicId();

	MosaicResolutionEntry({ ReceiptSource? source, MosaicId? resolvedValue}) 
		: super(source == null && resolvedValue == null )
	{
		_source = source ?? ReceiptSource();
		_resolvedValue = resolvedValue ?? MosaicId();
	}

	void sort() {
		_source.sort();
	}

	ReceiptSource get source {
		return _source;
	}

	MosaicId get resolvedValue {
		return _resolvedValue;
	}

	set source(ReceiptSource value) {
		_source = value;
	}

	set resolvedValue(MosaicId value) {
		_resolvedValue = value;
	}

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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + _source.size, _source.serialize());
		currentPos += source.size;
		buffer.setRange(currentPos, currentPos + _resolvedValue.size, _resolvedValue.serialize());
		currentPos += resolvedValue.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'MosaicResolutionEntry(';
		result += 'source: "${_source.toString()}", ';
		result += 'resolvedValue: "${_resolvedValue.toString()}", ';
		result += ')';
		return result;
	}
}


class MosaicResolutionStatement extends StructBase implements IDeserializable {

	static const Map<String, String> TYPE_HINTS = {
		'unresolved': 'pod:UnresolvedMosaicId',
		'resolutionEntries': 'array[MosaicResolutionEntry]'
	};

	UnresolvedMosaicId _unresolved = UnresolvedMosaicId();
	List<MosaicResolutionEntry> _resolutionEntries = [];

	MosaicResolutionStatement({ UnresolvedMosaicId? unresolved, List<MosaicResolutionEntry>? resolutionEntries}) 
		: super(unresolved == null && resolutionEntries == null )
	{
		_unresolved = unresolved ?? UnresolvedMosaicId();
		_resolutionEntries = resolutionEntries ?? [];
	}

	void sort() {
		// empty body
	}

	UnresolvedMosaicId get unresolved {
		return _unresolved;
	}

	List<MosaicResolutionEntry> get resolutionEntries {
		return _resolutionEntries;
	}

	set unresolved(UnresolvedMosaicId value) {
		_unresolved = value;
	}

	set resolutionEntries(List<MosaicResolutionEntry> value) {
		_resolutionEntries = value;
	}

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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + _unresolved.size, _unresolved.serialize());
		currentPos += unresolved.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_resolutionEntries.length, 4));
		currentPos += 4;
		sort();
		var res_resolutionEntries = ArrayHelpers.writeArray(buffer, _resolutionEntries, currentPos);
		currentPos = res_resolutionEntries.item2;
		buffer = res_resolutionEntries.item1;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'MosaicResolutionStatement(';
		result += 'unresolved: "${_unresolved.toString()}", ';
		result += 'resolutionEntries: "${_resolutionEntries.map((e) => e.toString()).toList()}", ';
		result += ')';
		return result;
	}
}


class TransactionStatement extends StructBase implements IDeserializable {

	static const Map<String, String> TYPE_HINTS = {
		'receipts': 'array[Receipt]'
	};

	int _primaryId = 0;
	int _secondaryId = 0;
	List<Receipt> _receipts = [];

	TransactionStatement({ int? primaryId, int? secondaryId, List<Receipt>? receipts}) 
		: super(primaryId == null && secondaryId == null && receipts == null )
	{
		_primaryId = primaryId ?? 0;
		_secondaryId = secondaryId ?? 0;
		_receipts = receipts ?? [];
	}

	void sort() {
		// empty body
	}

	int get primaryId {
		return _primaryId;
	}

	int get secondaryId {
		return _secondaryId;
	}

	List<Receipt> get receipts {
		return _receipts;
	}

	set primaryId(int value) {
		_primaryId = value;
	}

	set secondaryId(int value) {
		_secondaryId = value;
	}

	set receipts(List<Receipt> value) {
		_receipts = value;
	}

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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_primaryId, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_secondaryId, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_receipts.length, 4));
		currentPos += 4;
		sort();
		var res_receipts = ArrayHelpers.writeArray(buffer, _receipts, currentPos);
		currentPos = res_receipts.item2;
		buffer = res_receipts.item1;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'TransactionStatement(';
		result += 'primaryId: "0x${_primaryId.toRadixString(16).padLeft(4 * 2, '0').toUpperCase()}", ';
		result += 'secondaryId: "0x${_secondaryId.toRadixString(16).padLeft(4 * 2, '0').toUpperCase()}", ';
		result += 'receipts: "${_receipts.map((e) => e.toString()).toList()}", ';
		result += ')';
		return result;
	}
}


class BlockStatement extends StructBase implements IDeserializable {

	static const Map<String, String> TYPE_HINTS = {
		'transactionStatements': 'array[TransactionStatement]',
		'addressResolutionStatements': 'array[AddressResolutionStatement]',
		'mosaicResolutionStatements': 'array[MosaicResolutionStatement]'
	};

	List<TransactionStatement> _transactionStatements = [];
	List<AddressResolutionStatement> _addressResolutionStatements = [];
	List<MosaicResolutionStatement> _mosaicResolutionStatements = [];

	BlockStatement({ 
	List<TransactionStatement>? transactionStatements,
	List<AddressResolutionStatement>? addressResolutionStatements,
	List<MosaicResolutionStatement>? mosaicResolutionStatements
	}) 
		: super(transactionStatements == null && addressResolutionStatements == null && mosaicResolutionStatements == null )
	{
		_transactionStatements = transactionStatements ?? [];
		_addressResolutionStatements = addressResolutionStatements ?? [];
		_mosaicResolutionStatements = mosaicResolutionStatements ?? [];
	}

	void sort() {
		// empty body
	}

	List<TransactionStatement> get transactionStatements {
		return _transactionStatements;
	}

	List<AddressResolutionStatement> get addressResolutionStatements {
		return _addressResolutionStatements;
	}

	List<MosaicResolutionStatement> get mosaicResolutionStatements {
		return _mosaicResolutionStatements;
	}

	set transactionStatements(List<TransactionStatement> value) {
		_transactionStatements = value;
	}

	set addressResolutionStatements(List<AddressResolutionStatement> value) {
		_addressResolutionStatements = value;
	}

	set mosaicResolutionStatements(List<MosaicResolutionStatement> value) {
		_mosaicResolutionStatements = value;
	}

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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_transactionStatements.length, 4));
		currentPos += 4;
		sort();
		var res_transactionStatements = ArrayHelpers.writeArray(buffer, _transactionStatements, currentPos);
		currentPos = res_transactionStatements.item2;
		buffer = res_transactionStatements.item1;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_addressResolutionStatements.length, 4));
		currentPos += 4;
		sort();
		var res_addressResolutionStatements = ArrayHelpers.writeArray(buffer, _addressResolutionStatements, currentPos);
		currentPos = res_addressResolutionStatements.item2;
		buffer = res_addressResolutionStatements.item1;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_mosaicResolutionStatements.length, 4));
		currentPos += 4;
		sort();
		var res_mosaicResolutionStatements = ArrayHelpers.writeArray(buffer, _mosaicResolutionStatements, currentPos);
		currentPos = res_mosaicResolutionStatements.item2;
		buffer = res_mosaicResolutionStatements.item1;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'BlockStatement(';
		result += 'transactionStatements: "${_transactionStatements.map((e) => e.toString()).toList()}", ';
		result += 'addressResolutionStatements: "${_addressResolutionStatements.map((e) => e.toString()).toList()}", ';
		result += 'mosaicResolutionStatements: "${_mosaicResolutionStatements.map((e) => e.toString()).toList()}", ';
		result += ')';
		return result;
	}
}


class AccountKeyLinkTransactionV1 extends StructBase implements IDeserializable {
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

	Signature _signature = Signature();
	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	TransactionType _type = TransactionType.ACCOUNT_KEY_LINK;
	Amount _fee = Amount();
	Timestamp _deadline = Timestamp();
	PublicKey _linkedPublicKey = PublicKey();
	LinkAction _linkAction = LinkAction.UNLINK;
	final int _verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field

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
	}) 
		: super(signature == null && signerPublicKey == null && version == null && network == null && type == null && fee == null && deadline == null && linkedPublicKey == null && linkAction == null )
	{
		_signature = signature ?? Signature();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? AccountKeyLinkTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? AccountKeyLinkTransactionV1.TRANSACTION_TYPE;
		_fee = fee ?? Amount();
		_deadline = deadline ?? Timestamp();
		_linkedPublicKey = linkedPublicKey ?? PublicKey();
		_linkAction = linkAction ?? LinkAction.UNLINK;
	}

	void sort() {
		// empty body
	}

	Signature get signature {
		return _signature;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	TransactionType get type {
		return _type;
	}

	Amount get fee {
		return _fee;
	}

	Timestamp get deadline {
		return _deadline;
	}

	PublicKey get linkedPublicKey {
		return _linkedPublicKey;
	}

	LinkAction get linkAction {
		return _linkAction;
	}

	set signature(Signature value) {
		_signature = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set fee(Amount value) {
		_fee = value;
	}

	set deadline(Timestamp value) {
		_deadline = value;
	}

	set linkedPublicKey(PublicKey value) {
		_linkedPublicKey = value;
	}

	set linkAction(LinkAction value) {
		_linkAction = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signature.size, _signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + _linkedPublicKey.size, _linkedPublicKey.serialize());
		currentPos += linkedPublicKey.size;
		buffer.setRange(currentPos, currentPos + _linkAction.size, _linkAction.serialize());
		currentPos += linkAction.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'AccountKeyLinkTransactionV1(';
		result += 'signature: "${_signature.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'fee: "${_fee.toString()}", ';
		result += 'deadline: "${_deadline.toString()}", ';
		result += 'linkedPublicKey: "${_linkedPublicKey.toString()}", ';
		result += 'linkAction: "${_linkAction.toString()}", ';
		result += ')';
		return result;
	}
}


class EmbeddedAccountKeyLinkTransactionV1 extends StructBase implements IDeserializable, IEmbeddedTransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.ACCOUNT_KEY_LINK.value);

	static const Map<String, String> TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'linkedPublicKey': 'pod:PublicKey',
		'linkAction': 'enum:LinkAction'
	};

	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	TransactionType _type = TransactionType.ACCOUNT_KEY_LINK;
	PublicKey _linkedPublicKey = PublicKey();
	LinkAction _linkAction = LinkAction.UNLINK;
	final int _embeddedTransactionHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field

	EmbeddedAccountKeyLinkTransactionV1({ 
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	PublicKey? linkedPublicKey,
	LinkAction? linkAction
	}) 
		: super(signerPublicKey == null && version == null && network == null && type == null && linkedPublicKey == null && linkAction == null )
	{
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? EmbeddedAccountKeyLinkTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? EmbeddedAccountKeyLinkTransactionV1.TRANSACTION_TYPE;
		_linkedPublicKey = linkedPublicKey ?? PublicKey();
		_linkAction = linkAction ?? LinkAction.UNLINK;
	}

	void sort() {
		// empty body
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	TransactionType get type {
		return _type;
	}

	PublicKey get linkedPublicKey {
		return _linkedPublicKey;
	}

	LinkAction get linkAction {
		return _linkAction;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set linkedPublicKey(PublicKey value) {
		_linkedPublicKey = value;
	}

	set linkAction(LinkAction value) {
		_linkAction = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_embeddedTransactionHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _linkedPublicKey.size, _linkedPublicKey.serialize());
		currentPos += linkedPublicKey.size;
		buffer.setRange(currentPos, currentPos + _linkAction.size, _linkAction.serialize());
		currentPos += linkAction.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'EmbeddedAccountKeyLinkTransactionV1(';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'linkedPublicKey: "${_linkedPublicKey.toString()}", ';
		result += 'linkAction: "${_linkAction.toString()}", ';
		result += ')';
		return result;
	}
}


class NodeKeyLinkTransactionV1 extends StructBase implements IDeserializable {
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

	Signature _signature = Signature();
	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	TransactionType _type = TransactionType.ACCOUNT_KEY_LINK;
	Amount _fee = Amount();
	Timestamp _deadline = Timestamp();
	PublicKey _linkedPublicKey = PublicKey();
	LinkAction _linkAction = LinkAction.UNLINK;
	final int _verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field

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
	}) 
		: super(signature == null && signerPublicKey == null && version == null && network == null && type == null && fee == null && deadline == null && linkedPublicKey == null && linkAction == null )
	{
		_signature = signature ?? Signature();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? NodeKeyLinkTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? NodeKeyLinkTransactionV1.TRANSACTION_TYPE;
		_fee = fee ?? Amount();
		_deadline = deadline ?? Timestamp();
		_linkedPublicKey = linkedPublicKey ?? PublicKey();
		_linkAction = linkAction ?? LinkAction.UNLINK;
	}

	void sort() {
		// empty body
	}

	Signature get signature {
		return _signature;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	TransactionType get type {
		return _type;
	}

	Amount get fee {
		return _fee;
	}

	Timestamp get deadline {
		return _deadline;
	}

	PublicKey get linkedPublicKey {
		return _linkedPublicKey;
	}

	LinkAction get linkAction {
		return _linkAction;
	}

	set signature(Signature value) {
		_signature = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set fee(Amount value) {
		_fee = value;
	}

	set deadline(Timestamp value) {
		_deadline = value;
	}

	set linkedPublicKey(PublicKey value) {
		_linkedPublicKey = value;
	}

	set linkAction(LinkAction value) {
		_linkAction = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signature.size, _signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + _linkedPublicKey.size, _linkedPublicKey.serialize());
		currentPos += linkedPublicKey.size;
		buffer.setRange(currentPos, currentPos + _linkAction.size, _linkAction.serialize());
		currentPos += linkAction.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'NodeKeyLinkTransactionV1(';
		result += 'signature: "${_signature.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'fee: "${_fee.toString()}", ';
		result += 'deadline: "${_deadline.toString()}", ';
		result += 'linkedPublicKey: "${_linkedPublicKey.toString()}", ';
		result += 'linkAction: "${_linkAction.toString()}", ';
		result += ')';
		return result;
	}
}


class EmbeddedNodeKeyLinkTransactionV1 extends StructBase implements IDeserializable, IEmbeddedTransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.NODE_KEY_LINK.value);

	static const Map<String, String> TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'linkedPublicKey': 'pod:PublicKey',
		'linkAction': 'enum:LinkAction'
	};

	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	TransactionType _type = TransactionType.ACCOUNT_KEY_LINK;
	PublicKey _linkedPublicKey = PublicKey();
	LinkAction _linkAction = LinkAction.UNLINK;
	final int _embeddedTransactionHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field

	EmbeddedNodeKeyLinkTransactionV1({ 
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	PublicKey? linkedPublicKey,
	LinkAction? linkAction
	}) 
		: super(signerPublicKey == null && version == null && network == null && type == null && linkedPublicKey == null && linkAction == null )
	{
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? EmbeddedNodeKeyLinkTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? EmbeddedNodeKeyLinkTransactionV1.TRANSACTION_TYPE;
		_linkedPublicKey = linkedPublicKey ?? PublicKey();
		_linkAction = linkAction ?? LinkAction.UNLINK;
	}

	void sort() {
		// empty body
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	TransactionType get type {
		return _type;
	}

	PublicKey get linkedPublicKey {
		return _linkedPublicKey;
	}

	LinkAction get linkAction {
		return _linkAction;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set linkedPublicKey(PublicKey value) {
		_linkedPublicKey = value;
	}

	set linkAction(LinkAction value) {
		_linkAction = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_embeddedTransactionHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _linkedPublicKey.size, _linkedPublicKey.serialize());
		currentPos += linkedPublicKey.size;
		buffer.setRange(currentPos, currentPos + _linkAction.size, _linkAction.serialize());
		currentPos += linkAction.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'EmbeddedNodeKeyLinkTransactionV1(';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'linkedPublicKey: "${_linkedPublicKey.toString()}", ';
		result += 'linkAction: "${_linkAction.toString()}", ';
		result += ')';
		return result;
	}
}


class Cosignature extends StructBase implements IDeserializable {

	static const Map<String, String> TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'signature': 'pod:Signature'
	};

	int _version = 0;
	PublicKey _signerPublicKey = PublicKey();
	Signature _signature = Signature();

	Cosignature({ int? version, PublicKey? signerPublicKey, Signature? signature}) 
		: super(version == null && signerPublicKey == null && signature == null )
	{
		_version = version ?? 0;
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_signature = signature ?? Signature();
	}

	void sort() {
		// empty body
	}

	int get version {
		return _version;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	Signature get signature {
		return _signature;
	}

	set version(int value) {
		_version = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set signature(Signature value) {
		_signature = value;
	}

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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 8, intToBytes(_version, 8));
		currentPos += 8;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + _signature.size, _signature.serialize());
		currentPos += signature.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'Cosignature(';
		result += 'version: "0x${_version.toRadixString(16).padLeft(8 * 2, '0').toUpperCase()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'signature: "${_signature.toString()}", ';
		result += ')';
		return result;
	}
}


class DetachedCosignature extends StructBase implements IDeserializable {

	static const Map<String, String> TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'signature': 'pod:Signature',
		'parentHash': 'pod:Hash256'
	};

	int _version = 0;
	PublicKey _signerPublicKey = PublicKey();
	Signature _signature = Signature();
	Hash256 _parentHash = Hash256();

	DetachedCosignature({ int? version, PublicKey? signerPublicKey, Signature? signature, Hash256? parentHash}) 
		: super(version == null && signerPublicKey == null && signature == null && parentHash == null )
	{
		_version = version ?? 0;
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_signature = signature ?? Signature();
		_parentHash = parentHash ?? Hash256();
	}

	void sort() {
		// empty body
	}

	int get version {
		return _version;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	Signature get signature {
		return _signature;
	}

	Hash256 get parentHash {
		return _parentHash;
	}

	set version(int value) {
		_version = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set signature(Signature value) {
		_signature = value;
	}

	set parentHash(Hash256 value) {
		_parentHash = value;
	}

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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 8, intToBytes(_version, 8));
		currentPos += 8;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + _signature.size, _signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + _parentHash.size, _parentHash.serialize());
		currentPos += parentHash.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'DetachedCosignature(';
		result += 'version: "0x${_version.toRadixString(16).padLeft(8 * 2, '0').toUpperCase()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'signature: "${_signature.toString()}", ';
		result += 'parentHash: "${_parentHash.toString()}", ';
		result += ')';
		return result;
	}
}


class AggregateCompleteTransactionV1 extends StructBase implements IDeserializable {
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

	Signature _signature = Signature();
	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	TransactionType _type = TransactionType.ACCOUNT_KEY_LINK;
	Amount _fee = Amount();
	Timestamp _deadline = Timestamp();
	Hash256 _transactionsHash = Hash256();
	List<IEmbeddedTransaction> _transactions = [];
	List<Cosignature> _cosignatures = [];
	final int _verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field
	final int _aggregateTransactionHeaderReserved_1 = 0; // reserved field

	AggregateCompleteTransactionV1({ 
	Signature? signature,
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	Amount? fee,
	Timestamp? deadline,
	Hash256? transactionsHash,
	List<IEmbeddedTransaction>? transactions,
	List<Cosignature>? cosignatures
	}) 
		: super(signature == null && signerPublicKey == null && version == null && network == null && type == null && fee == null && deadline == null && transactionsHash == null && transactions == null && cosignatures == null )
	{
		_signature = signature ?? Signature();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? AggregateCompleteTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? AggregateCompleteTransactionV1.TRANSACTION_TYPE;
		_fee = fee ?? Amount();
		_deadline = deadline ?? Timestamp();
		_transactionsHash = transactionsHash ?? Hash256();
		_transactions = transactions ?? [];
		_cosignatures = cosignatures ?? [];
	}

	void sort() {
		// empty body
	}

	Signature get signature {
		return _signature;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	TransactionType get type {
		return _type;
	}

	Amount get fee {
		return _fee;
	}

	Timestamp get deadline {
		return _deadline;
	}

	Hash256 get transactionsHash {
		return _transactionsHash;
	}

	List<IEmbeddedTransaction> get transactions {
		return _transactions;
	}

	List<Cosignature> get cosignatures {
		return _cosignatures;
	}

	set signature(Signature value) {
		_signature = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set fee(Amount value) {
		_fee = value;
	}

	set deadline(Timestamp value) {
		_deadline = value;
	}

	set transactionsHash(Hash256 value) {
		_transactionsHash = value;
	}

	set transactions(List<IEmbeddedTransaction> value) {
		_transactions = value;
	}

	set cosignatures(List<Cosignature> value) {
		_cosignatures = value;
	}

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
		// nothing to do for size
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
		var transactions = ArrayHelpers.readVariableSizeElements(buffer.sublist(0, payloadSize), EmbeddedTransactionFactory(), 8, false).map((item) => item as IEmbeddedTransaction).toList();
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signature.size, _signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + _transactionsHash.size, _transactionsHash.serialize());
		currentPos += transactionsHash.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(ArrayHelpers.size(transactions, 8, false), 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_aggregateTransactionHeaderReserved_1, 4));
		currentPos += 4;
		sort();
		var res_transactions = ArrayHelpers.writeVariableSizeElements(buffer, _transactions, 8, currentPos, false);
		currentPos = res_transactions.item2;
		buffer = res_transactions.item1;
		sort();
		var res_cosignatures = ArrayHelpers.writeArray(buffer, _cosignatures, currentPos);
		currentPos = res_cosignatures.item2;
		buffer = res_cosignatures.item1;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'AggregateCompleteTransactionV1(';
		result += 'signature: "${_signature.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'fee: "${_fee.toString()}", ';
		result += 'deadline: "${_deadline.toString()}", ';
		result += 'transactionsHash: "${_transactionsHash.toString()}", ';
		result += 'transactions: "${_transactions.map((e) => e.toString()).toList()}", ';
		result += 'cosignatures: "${_cosignatures.map((e) => e.toString()).toList()}", ';
		result += ')';
		return result;
	}
}


class AggregateCompleteTransactionV2 extends StructBase implements IDeserializable {
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

	Signature _signature = Signature();
	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	TransactionType _type = TransactionType.ACCOUNT_KEY_LINK;
	Amount _fee = Amount();
	Timestamp _deadline = Timestamp();
	Hash256 _transactionsHash = Hash256();
	List<IEmbeddedTransaction> _transactions = [];
	List<Cosignature> _cosignatures = [];
	final int _verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field
	final int _aggregateTransactionHeaderReserved_1 = 0; // reserved field

	AggregateCompleteTransactionV2({ 
	Signature? signature,
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	Amount? fee,
	Timestamp? deadline,
	Hash256? transactionsHash,
	List<IEmbeddedTransaction>? transactions,
	List<Cosignature>? cosignatures
	}) 
		: super(signature == null && signerPublicKey == null && version == null && network == null && type == null && fee == null && deadline == null && transactionsHash == null && transactions == null && cosignatures == null )
	{
		_signature = signature ?? Signature();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? AggregateCompleteTransactionV2.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? AggregateCompleteTransactionV2.TRANSACTION_TYPE;
		_fee = fee ?? Amount();
		_deadline = deadline ?? Timestamp();
		_transactionsHash = transactionsHash ?? Hash256();
		_transactions = transactions ?? [];
		_cosignatures = cosignatures ?? [];
	}

	void sort() {
		// empty body
	}

	Signature get signature {
		return _signature;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	TransactionType get type {
		return _type;
	}

	Amount get fee {
		return _fee;
	}

	Timestamp get deadline {
		return _deadline;
	}

	Hash256 get transactionsHash {
		return _transactionsHash;
	}

	List<IEmbeddedTransaction> get transactions {
		return _transactions;
	}

	List<Cosignature> get cosignatures {
		return _cosignatures;
	}

	set signature(Signature value) {
		_signature = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set fee(Amount value) {
		_fee = value;
	}

	set deadline(Timestamp value) {
		_deadline = value;
	}

	set transactionsHash(Hash256 value) {
		_transactionsHash = value;
	}

	set transactions(List<IEmbeddedTransaction> value) {
		_transactions = value;
	}

	set cosignatures(List<Cosignature> value) {
		_cosignatures = value;
	}

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
		// nothing to do for size
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
		var transactions = ArrayHelpers.readVariableSizeElements(buffer.sublist(0, payloadSize), EmbeddedTransactionFactory(), 8, false).map((item) => item as IEmbeddedTransaction).toList();
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signature.size, _signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + _transactionsHash.size, _transactionsHash.serialize());
		currentPos += transactionsHash.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(ArrayHelpers.size(transactions, 8, false), 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_aggregateTransactionHeaderReserved_1, 4));
		currentPos += 4;
		sort();
		var res_transactions = ArrayHelpers.writeVariableSizeElements(buffer, _transactions, 8, currentPos, false);
		currentPos = res_transactions.item2;
		buffer = res_transactions.item1;
		sort();
		var res_cosignatures = ArrayHelpers.writeArray(buffer, _cosignatures, currentPos);
		currentPos = res_cosignatures.item2;
		buffer = res_cosignatures.item1;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'AggregateCompleteTransactionV2(';
		result += 'signature: "${_signature.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'fee: "${_fee.toString()}", ';
		result += 'deadline: "${_deadline.toString()}", ';
		result += 'transactionsHash: "${_transactionsHash.toString()}", ';
		result += 'transactions: "${_transactions.map((e) => e.toString()).toList()}", ';
		result += 'cosignatures: "${_cosignatures.map((e) => e.toString()).toList()}", ';
		result += ')';
		return result;
	}
}


class AggregateBondedTransactionV1 extends StructBase implements IDeserializable {
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

	Signature _signature = Signature();
	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	TransactionType _type = TransactionType.ACCOUNT_KEY_LINK;
	Amount _fee = Amount();
	Timestamp _deadline = Timestamp();
	Hash256 _transactionsHash = Hash256();
	List<IEmbeddedTransaction> _transactions = [];
	List<Cosignature> _cosignatures = [];
	final int _verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field
	final int _aggregateTransactionHeaderReserved_1 = 0; // reserved field

	AggregateBondedTransactionV1({ 
	Signature? signature,
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	Amount? fee,
	Timestamp? deadline,
	Hash256? transactionsHash,
	List<IEmbeddedTransaction>? transactions,
	List<Cosignature>? cosignatures
	}) 
		: super(signature == null && signerPublicKey == null && version == null && network == null && type == null && fee == null && deadline == null && transactionsHash == null && transactions == null && cosignatures == null )
	{
		_signature = signature ?? Signature();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? AggregateBondedTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? AggregateBondedTransactionV1.TRANSACTION_TYPE;
		_fee = fee ?? Amount();
		_deadline = deadline ?? Timestamp();
		_transactionsHash = transactionsHash ?? Hash256();
		_transactions = transactions ?? [];
		_cosignatures = cosignatures ?? [];
	}

	void sort() {
		// empty body
	}

	Signature get signature {
		return _signature;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	TransactionType get type {
		return _type;
	}

	Amount get fee {
		return _fee;
	}

	Timestamp get deadline {
		return _deadline;
	}

	Hash256 get transactionsHash {
		return _transactionsHash;
	}

	List<IEmbeddedTransaction> get transactions {
		return _transactions;
	}

	List<Cosignature> get cosignatures {
		return _cosignatures;
	}

	set signature(Signature value) {
		_signature = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set fee(Amount value) {
		_fee = value;
	}

	set deadline(Timestamp value) {
		_deadline = value;
	}

	set transactionsHash(Hash256 value) {
		_transactionsHash = value;
	}

	set transactions(List<IEmbeddedTransaction> value) {
		_transactions = value;
	}

	set cosignatures(List<Cosignature> value) {
		_cosignatures = value;
	}

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
		// nothing to do for size
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
		var transactions = ArrayHelpers.readVariableSizeElements(buffer.sublist(0, payloadSize), EmbeddedTransactionFactory(), 8, false).map((item) => item as IEmbeddedTransaction).toList();
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signature.size, _signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + _transactionsHash.size, _transactionsHash.serialize());
		currentPos += transactionsHash.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(ArrayHelpers.size(transactions, 8, false), 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_aggregateTransactionHeaderReserved_1, 4));
		currentPos += 4;
		sort();
		var res_transactions = ArrayHelpers.writeVariableSizeElements(buffer, _transactions, 8, currentPos, false);
		currentPos = res_transactions.item2;
		buffer = res_transactions.item1;
		sort();
		var res_cosignatures = ArrayHelpers.writeArray(buffer, _cosignatures, currentPos);
		currentPos = res_cosignatures.item2;
		buffer = res_cosignatures.item1;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'AggregateBondedTransactionV1(';
		result += 'signature: "${_signature.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'fee: "${_fee.toString()}", ';
		result += 'deadline: "${_deadline.toString()}", ';
		result += 'transactionsHash: "${_transactionsHash.toString()}", ';
		result += 'transactions: "${_transactions.map((e) => e.toString()).toList()}", ';
		result += 'cosignatures: "${_cosignatures.map((e) => e.toString()).toList()}", ';
		result += ')';
		return result;
	}
}


class AggregateBondedTransactionV2 extends StructBase implements IDeserializable {
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

	Signature _signature = Signature();
	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	TransactionType _type = TransactionType.ACCOUNT_KEY_LINK;
	Amount _fee = Amount();
	Timestamp _deadline = Timestamp();
	Hash256 _transactionsHash = Hash256();
	List<IEmbeddedTransaction> _transactions = [];
	List<Cosignature> _cosignatures = [];
	final int _verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field
	final int _aggregateTransactionHeaderReserved_1 = 0; // reserved field

	AggregateBondedTransactionV2({ 
	Signature? signature,
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	Amount? fee,
	Timestamp? deadline,
	Hash256? transactionsHash,
	List<IEmbeddedTransaction>? transactions,
	List<Cosignature>? cosignatures
	}) 
		: super(signature == null && signerPublicKey == null && version == null && network == null && type == null && fee == null && deadline == null && transactionsHash == null && transactions == null && cosignatures == null )
	{
		_signature = signature ?? Signature();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? AggregateBondedTransactionV2.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? AggregateBondedTransactionV2.TRANSACTION_TYPE;
		_fee = fee ?? Amount();
		_deadline = deadline ?? Timestamp();
		_transactionsHash = transactionsHash ?? Hash256();
		_transactions = transactions ?? [];
		_cosignatures = cosignatures ?? [];
	}

	void sort() {
		// empty body
	}

	Signature get signature {
		return _signature;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	TransactionType get type {
		return _type;
	}

	Amount get fee {
		return _fee;
	}

	Timestamp get deadline {
		return _deadline;
	}

	Hash256 get transactionsHash {
		return _transactionsHash;
	}

	List<IEmbeddedTransaction> get transactions {
		return _transactions;
	}

	List<Cosignature> get cosignatures {
		return _cosignatures;
	}

	set signature(Signature value) {
		_signature = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set fee(Amount value) {
		_fee = value;
	}

	set deadline(Timestamp value) {
		_deadline = value;
	}

	set transactionsHash(Hash256 value) {
		_transactionsHash = value;
	}

	set transactions(List<IEmbeddedTransaction> value) {
		_transactions = value;
	}

	set cosignatures(List<Cosignature> value) {
		_cosignatures = value;
	}

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
		// nothing to do for size
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
		var transactions = ArrayHelpers.readVariableSizeElements(buffer.sublist(0, payloadSize), EmbeddedTransactionFactory(), 8, false).map((item) => item as IEmbeddedTransaction).toList();
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signature.size, _signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + _transactionsHash.size, _transactionsHash.serialize());
		currentPos += transactionsHash.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(ArrayHelpers.size(transactions, 8, false), 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_aggregateTransactionHeaderReserved_1, 4));
		currentPos += 4;
		sort();
		var res_transactions = ArrayHelpers.writeVariableSizeElements(buffer, _transactions, 8, currentPos, false);
		currentPos = res_transactions.item2;
		buffer = res_transactions.item1;
		sort();
		var res_cosignatures = ArrayHelpers.writeArray(buffer, _cosignatures, currentPos);
		currentPos = res_cosignatures.item2;
		buffer = res_cosignatures.item1;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'AggregateBondedTransactionV2(';
		result += 'signature: "${_signature.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'fee: "${_fee.toString()}", ';
		result += 'deadline: "${_deadline.toString()}", ';
		result += 'transactionsHash: "${_transactionsHash.toString()}", ';
		result += 'transactions: "${_transactions.map((e) => e.toString()).toList()}", ';
		result += 'cosignatures: "${_cosignatures.map((e) => e.toString()).toList()}", ';
		result += ')';
		return result;
	}
}


class VotingKeyLinkTransactionV1 extends StructBase implements IDeserializable {
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

	Signature _signature = Signature();
	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	TransactionType _type = TransactionType.ACCOUNT_KEY_LINK;
	Amount _fee = Amount();
	Timestamp _deadline = Timestamp();
	VotingPublicKey _linkedPublicKey = VotingPublicKey();
	FinalizationEpoch _startEpoch = FinalizationEpoch();
	FinalizationEpoch _endEpoch = FinalizationEpoch();
	LinkAction _linkAction = LinkAction.UNLINK;
	final int _verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field

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
	}) 
		: super(signature == null && signerPublicKey == null && version == null && network == null && type == null && fee == null && deadline == null && linkedPublicKey == null && startEpoch == null && endEpoch == null && linkAction == null )
	{
		_signature = signature ?? Signature();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? VotingKeyLinkTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? VotingKeyLinkTransactionV1.TRANSACTION_TYPE;
		_fee = fee ?? Amount();
		_deadline = deadline ?? Timestamp();
		_linkedPublicKey = linkedPublicKey ?? VotingPublicKey();
		_startEpoch = startEpoch ?? FinalizationEpoch();
		_endEpoch = endEpoch ?? FinalizationEpoch();
		_linkAction = linkAction ?? LinkAction.UNLINK;
	}

	void sort() {
		// empty body
	}

	Signature get signature {
		return _signature;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	TransactionType get type {
		return _type;
	}

	Amount get fee {
		return _fee;
	}

	Timestamp get deadline {
		return _deadline;
	}

	VotingPublicKey get linkedPublicKey {
		return _linkedPublicKey;
	}

	FinalizationEpoch get startEpoch {
		return _startEpoch;
	}

	FinalizationEpoch get endEpoch {
		return _endEpoch;
	}

	LinkAction get linkAction {
		return _linkAction;
	}

	set signature(Signature value) {
		_signature = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set fee(Amount value) {
		_fee = value;
	}

	set deadline(Timestamp value) {
		_deadline = value;
	}

	set linkedPublicKey(VotingPublicKey value) {
		_linkedPublicKey = value;
	}

	set startEpoch(FinalizationEpoch value) {
		_startEpoch = value;
	}

	set endEpoch(FinalizationEpoch value) {
		_endEpoch = value;
	}

	set linkAction(LinkAction value) {
		_linkAction = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signature.size, _signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + _linkedPublicKey.size, _linkedPublicKey.serialize());
		currentPos += linkedPublicKey.size;
		buffer.setRange(currentPos, currentPos + _startEpoch.size, _startEpoch.serialize());
		currentPos += startEpoch.size;
		buffer.setRange(currentPos, currentPos + _endEpoch.size, _endEpoch.serialize());
		currentPos += endEpoch.size;
		buffer.setRange(currentPos, currentPos + _linkAction.size, _linkAction.serialize());
		currentPos += linkAction.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'VotingKeyLinkTransactionV1(';
		result += 'signature: "${_signature.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'fee: "${_fee.toString()}", ';
		result += 'deadline: "${_deadline.toString()}", ';
		result += 'linkedPublicKey: "${_linkedPublicKey.toString()}", ';
		result += 'startEpoch: "${_startEpoch.toString()}", ';
		result += 'endEpoch: "${_endEpoch.toString()}", ';
		result += 'linkAction: "${_linkAction.toString()}", ';
		result += ')';
		return result;
	}
}


class EmbeddedVotingKeyLinkTransactionV1 extends StructBase implements IDeserializable, IEmbeddedTransaction {
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

	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	TransactionType _type = TransactionType.ACCOUNT_KEY_LINK;
	VotingPublicKey _linkedPublicKey = VotingPublicKey();
	FinalizationEpoch _startEpoch = FinalizationEpoch();
	FinalizationEpoch _endEpoch = FinalizationEpoch();
	LinkAction _linkAction = LinkAction.UNLINK;
	final int _embeddedTransactionHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field

	EmbeddedVotingKeyLinkTransactionV1({ 
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	VotingPublicKey? linkedPublicKey,
	FinalizationEpoch? startEpoch,
	FinalizationEpoch? endEpoch,
	LinkAction? linkAction
	}) 
		: super(signerPublicKey == null && version == null && network == null && type == null && linkedPublicKey == null && startEpoch == null && endEpoch == null && linkAction == null )
	{
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? EmbeddedVotingKeyLinkTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? EmbeddedVotingKeyLinkTransactionV1.TRANSACTION_TYPE;
		_linkedPublicKey = linkedPublicKey ?? VotingPublicKey();
		_startEpoch = startEpoch ?? FinalizationEpoch();
		_endEpoch = endEpoch ?? FinalizationEpoch();
		_linkAction = linkAction ?? LinkAction.UNLINK;
	}

	void sort() {
		// empty body
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	TransactionType get type {
		return _type;
	}

	VotingPublicKey get linkedPublicKey {
		return _linkedPublicKey;
	}

	FinalizationEpoch get startEpoch {
		return _startEpoch;
	}

	FinalizationEpoch get endEpoch {
		return _endEpoch;
	}

	LinkAction get linkAction {
		return _linkAction;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set linkedPublicKey(VotingPublicKey value) {
		_linkedPublicKey = value;
	}

	set startEpoch(FinalizationEpoch value) {
		_startEpoch = value;
	}

	set endEpoch(FinalizationEpoch value) {
		_endEpoch = value;
	}

	set linkAction(LinkAction value) {
		_linkAction = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_embeddedTransactionHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _linkedPublicKey.size, _linkedPublicKey.serialize());
		currentPos += linkedPublicKey.size;
		buffer.setRange(currentPos, currentPos + _startEpoch.size, _startEpoch.serialize());
		currentPos += startEpoch.size;
		buffer.setRange(currentPos, currentPos + _endEpoch.size, _endEpoch.serialize());
		currentPos += endEpoch.size;
		buffer.setRange(currentPos, currentPos + _linkAction.size, _linkAction.serialize());
		currentPos += linkAction.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'EmbeddedVotingKeyLinkTransactionV1(';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'linkedPublicKey: "${_linkedPublicKey.toString()}", ';
		result += 'startEpoch: "${_startEpoch.toString()}", ';
		result += 'endEpoch: "${_endEpoch.toString()}", ';
		result += 'linkAction: "${_linkAction.toString()}", ';
		result += ')';
		return result;
	}
}


class VrfKeyLinkTransactionV1 extends StructBase implements IDeserializable {
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

	Signature _signature = Signature();
	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	TransactionType _type = TransactionType.ACCOUNT_KEY_LINK;
	Amount _fee = Amount();
	Timestamp _deadline = Timestamp();
	PublicKey _linkedPublicKey = PublicKey();
	LinkAction _linkAction = LinkAction.UNLINK;
	final int _verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field

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
	}) 
		: super(signature == null && signerPublicKey == null && version == null && network == null && type == null && fee == null && deadline == null && linkedPublicKey == null && linkAction == null )
	{
		_signature = signature ?? Signature();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? VrfKeyLinkTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? VrfKeyLinkTransactionV1.TRANSACTION_TYPE;
		_fee = fee ?? Amount();
		_deadline = deadline ?? Timestamp();
		_linkedPublicKey = linkedPublicKey ?? PublicKey();
		_linkAction = linkAction ?? LinkAction.UNLINK;
	}

	void sort() {
		// empty body
	}

	Signature get signature {
		return _signature;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	TransactionType get type {
		return _type;
	}

	Amount get fee {
		return _fee;
	}

	Timestamp get deadline {
		return _deadline;
	}

	PublicKey get linkedPublicKey {
		return _linkedPublicKey;
	}

	LinkAction get linkAction {
		return _linkAction;
	}

	set signature(Signature value) {
		_signature = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set fee(Amount value) {
		_fee = value;
	}

	set deadline(Timestamp value) {
		_deadline = value;
	}

	set linkedPublicKey(PublicKey value) {
		_linkedPublicKey = value;
	}

	set linkAction(LinkAction value) {
		_linkAction = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signature.size, _signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + _linkedPublicKey.size, _linkedPublicKey.serialize());
		currentPos += linkedPublicKey.size;
		buffer.setRange(currentPos, currentPos + _linkAction.size, _linkAction.serialize());
		currentPos += linkAction.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'VrfKeyLinkTransactionV1(';
		result += 'signature: "${_signature.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'fee: "${_fee.toString()}", ';
		result += 'deadline: "${_deadline.toString()}", ';
		result += 'linkedPublicKey: "${_linkedPublicKey.toString()}", ';
		result += 'linkAction: "${_linkAction.toString()}", ';
		result += ')';
		return result;
	}
}


class EmbeddedVrfKeyLinkTransactionV1 extends StructBase implements IDeserializable, IEmbeddedTransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.VRF_KEY_LINK.value);

	static const Map<String, String> TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'linkedPublicKey': 'pod:PublicKey',
		'linkAction': 'enum:LinkAction'
	};

	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	TransactionType _type = TransactionType.ACCOUNT_KEY_LINK;
	PublicKey _linkedPublicKey = PublicKey();
	LinkAction _linkAction = LinkAction.UNLINK;
	final int _embeddedTransactionHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field

	EmbeddedVrfKeyLinkTransactionV1({ 
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	PublicKey? linkedPublicKey,
	LinkAction? linkAction
	}) 
		: super(signerPublicKey == null && version == null && network == null && type == null && linkedPublicKey == null && linkAction == null )
	{
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? EmbeddedVrfKeyLinkTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? EmbeddedVrfKeyLinkTransactionV1.TRANSACTION_TYPE;
		_linkedPublicKey = linkedPublicKey ?? PublicKey();
		_linkAction = linkAction ?? LinkAction.UNLINK;
	}

	void sort() {
		// empty body
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	TransactionType get type {
		return _type;
	}

	PublicKey get linkedPublicKey {
		return _linkedPublicKey;
	}

	LinkAction get linkAction {
		return _linkAction;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set linkedPublicKey(PublicKey value) {
		_linkedPublicKey = value;
	}

	set linkAction(LinkAction value) {
		_linkAction = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_embeddedTransactionHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _linkedPublicKey.size, _linkedPublicKey.serialize());
		currentPos += linkedPublicKey.size;
		buffer.setRange(currentPos, currentPos + _linkAction.size, _linkAction.serialize());
		currentPos += linkAction.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'EmbeddedVrfKeyLinkTransactionV1(';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'linkedPublicKey: "${_linkedPublicKey.toString()}", ';
		result += 'linkAction: "${_linkAction.toString()}", ';
		result += ')';
		return result;
	}
}


class HashLockTransactionV1 extends StructBase implements IDeserializable {
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

	Signature _signature = Signature();
	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	TransactionType _type = TransactionType.ACCOUNT_KEY_LINK;
	Amount _fee = Amount();
	Timestamp _deadline = Timestamp();
	UnresolvedMosaic _mosaic = UnresolvedMosaic();
	BlockDuration _duration = BlockDuration();
	Hash256 _hash = Hash256();
	final int _verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field

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
	}) 
		: super(signature == null && signerPublicKey == null && version == null && network == null && type == null && fee == null && deadline == null && mosaic == null && duration == null && hash == null )
	{
		_signature = signature ?? Signature();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? HashLockTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? HashLockTransactionV1.TRANSACTION_TYPE;
		_fee = fee ?? Amount();
		_deadline = deadline ?? Timestamp();
		_mosaic = mosaic ?? UnresolvedMosaic();
		_duration = duration ?? BlockDuration();
		_hash = hash ?? Hash256();
	}

	void sort() {
		_mosaic.sort();
	}

	Signature get signature {
		return _signature;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	TransactionType get type {
		return _type;
	}

	Amount get fee {
		return _fee;
	}

	Timestamp get deadline {
		return _deadline;
	}

	UnresolvedMosaic get mosaic {
		return _mosaic;
	}

	BlockDuration get duration {
		return _duration;
	}

	Hash256 get hash {
		return _hash;
	}

	set signature(Signature value) {
		_signature = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set fee(Amount value) {
		_fee = value;
	}

	set deadline(Timestamp value) {
		_deadline = value;
	}

	set mosaic(UnresolvedMosaic value) {
		_mosaic = value;
	}

	set duration(BlockDuration value) {
		_duration = value;
	}

	set hash(Hash256 value) {
		_hash = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signature.size, _signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + _mosaic.size, _mosaic.serialize());
		currentPos += mosaic.size;
		buffer.setRange(currentPos, currentPos + _duration.size, _duration.serialize());
		currentPos += duration.size;
		buffer.setRange(currentPos, currentPos + _hash.size, _hash.serialize());
		currentPos += hash.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'HashLockTransactionV1(';
		result += 'signature: "${_signature.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'fee: "${_fee.toString()}", ';
		result += 'deadline: "${_deadline.toString()}", ';
		result += 'mosaic: "${_mosaic.toString()}", ';
		result += 'duration: "${_duration.toString()}", ';
		result += 'hash: "${_hash.toString()}", ';
		result += ')';
		return result;
	}
}


class EmbeddedHashLockTransactionV1 extends StructBase implements IDeserializable, IEmbeddedTransaction {
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

	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	TransactionType _type = TransactionType.ACCOUNT_KEY_LINK;
	UnresolvedMosaic _mosaic = UnresolvedMosaic();
	BlockDuration _duration = BlockDuration();
	Hash256 _hash = Hash256();
	final int _embeddedTransactionHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field

	EmbeddedHashLockTransactionV1({ 
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	UnresolvedMosaic? mosaic,
	BlockDuration? duration,
	Hash256? hash
	}) 
		: super(signerPublicKey == null && version == null && network == null && type == null && mosaic == null && duration == null && hash == null )
	{
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? EmbeddedHashLockTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? EmbeddedHashLockTransactionV1.TRANSACTION_TYPE;
		_mosaic = mosaic ?? UnresolvedMosaic();
		_duration = duration ?? BlockDuration();
		_hash = hash ?? Hash256();
	}

	void sort() {
		_mosaic.sort();
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	TransactionType get type {
		return _type;
	}

	UnresolvedMosaic get mosaic {
		return _mosaic;
	}

	BlockDuration get duration {
		return _duration;
	}

	Hash256 get hash {
		return _hash;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set mosaic(UnresolvedMosaic value) {
		_mosaic = value;
	}

	set duration(BlockDuration value) {
		_duration = value;
	}

	set hash(Hash256 value) {
		_hash = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_embeddedTransactionHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _mosaic.size, _mosaic.serialize());
		currentPos += mosaic.size;
		buffer.setRange(currentPos, currentPos + _duration.size, _duration.serialize());
		currentPos += duration.size;
		buffer.setRange(currentPos, currentPos + _hash.size, _hash.serialize());
		currentPos += hash.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'EmbeddedHashLockTransactionV1(';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'mosaic: "${_mosaic.toString()}", ';
		result += 'duration: "${_duration.toString()}", ';
		result += 'hash: "${_hash.toString()}", ';
		result += ')';
		return result;
	}
}


class LockHashAlgorithm implements IDeserializable {
	static final SHA3_256 = LockHashAlgorithm(0);
	static final HASH_160 = LockHashAlgorithm(1);
	static final HASH_256 = LockHashAlgorithm(2);

	final int value;

	static final _flags = {
		0: 'SHA3_256',
		1: 'HASH_160',
		2: 'HASH_256',
	};

	LockHashAlgorithm([int? _value]) : value = _value ?? 0;

	int get size {
		return 1;
	}

	@override
	LockHashAlgorithm deserialize(Uint8List payload) {
		var byteData = ByteData.sublistView(payload);
		return LockHashAlgorithm(byteData.getUint8(0));
	}

	Uint8List serialize() {
		var byteData = ByteData(1)..setUint8(0, value);
		return byteData.buffer.asUint8List();
	}

	@override
	String toString() {
		return 'LockHashAlgorithm.${_flags[value]}';
	}
}


class SecretLockTransactionV1 extends StructBase implements IDeserializable {
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

	Signature _signature = Signature();
	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	TransactionType _type = TransactionType.ACCOUNT_KEY_LINK;
	Amount _fee = Amount();
	Timestamp _deadline = Timestamp();
	UnresolvedAddress _recipientAddress = UnresolvedAddress();
	Hash256 _secret = Hash256();
	UnresolvedMosaic _mosaic = UnresolvedMosaic();
	BlockDuration _duration = BlockDuration();
	LockHashAlgorithm _hashAlgorithm = LockHashAlgorithm.SHA3_256;
	final int _verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field

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
	}) 
		: super(signature == null && signerPublicKey == null && version == null && network == null && type == null && fee == null && deadline == null && recipientAddress == null && secret == null && mosaic == null && duration == null && hashAlgorithm == null )
	{
		_signature = signature ?? Signature();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? SecretLockTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? SecretLockTransactionV1.TRANSACTION_TYPE;
		_fee = fee ?? Amount();
		_deadline = deadline ?? Timestamp();
		_recipientAddress = recipientAddress ?? UnresolvedAddress();
		_secret = secret ?? Hash256();
		_mosaic = mosaic ?? UnresolvedMosaic();
		_duration = duration ?? BlockDuration();
		_hashAlgorithm = hashAlgorithm ?? LockHashAlgorithm.SHA3_256;
	}

	void sort() {
		_mosaic.sort();
	}

	Signature get signature {
		return _signature;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	TransactionType get type {
		return _type;
	}

	Amount get fee {
		return _fee;
	}

	Timestamp get deadline {
		return _deadline;
	}

	UnresolvedAddress get recipientAddress {
		return _recipientAddress;
	}

	Hash256 get secret {
		return _secret;
	}

	UnresolvedMosaic get mosaic {
		return _mosaic;
	}

	BlockDuration get duration {
		return _duration;
	}

	LockHashAlgorithm get hashAlgorithm {
		return _hashAlgorithm;
	}

	set signature(Signature value) {
		_signature = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set fee(Amount value) {
		_fee = value;
	}

	set deadline(Timestamp value) {
		_deadline = value;
	}

	set recipientAddress(UnresolvedAddress value) {
		_recipientAddress = value;
	}

	set secret(Hash256 value) {
		_secret = value;
	}

	set mosaic(UnresolvedMosaic value) {
		_mosaic = value;
	}

	set duration(BlockDuration value) {
		_duration = value;
	}

	set hashAlgorithm(LockHashAlgorithm value) {
		_hashAlgorithm = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signature.size, _signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + _recipientAddress.size, _recipientAddress.serialize());
		currentPos += recipientAddress.size;
		buffer.setRange(currentPos, currentPos + _secret.size, _secret.serialize());
		currentPos += secret.size;
		buffer.setRange(currentPos, currentPos + _mosaic.size, _mosaic.serialize());
		currentPos += mosaic.size;
		buffer.setRange(currentPos, currentPos + _duration.size, _duration.serialize());
		currentPos += duration.size;
		buffer.setRange(currentPos, currentPos + _hashAlgorithm.size, _hashAlgorithm.serialize());
		currentPos += hashAlgorithm.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'SecretLockTransactionV1(';
		result += 'signature: "${_signature.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'fee: "${_fee.toString()}", ';
		result += 'deadline: "${_deadline.toString()}", ';
		result += 'recipientAddress: "${_recipientAddress.toString()}", ';
		result += 'secret: "${_secret.toString()}", ';
		result += 'mosaic: "${_mosaic.toString()}", ';
		result += 'duration: "${_duration.toString()}", ';
		result += 'hashAlgorithm: "${_hashAlgorithm.toString()}", ';
		result += ')';
		return result;
	}
}


class EmbeddedSecretLockTransactionV1 extends StructBase implements IDeserializable, IEmbeddedTransaction {
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

	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	TransactionType _type = TransactionType.ACCOUNT_KEY_LINK;
	UnresolvedAddress _recipientAddress = UnresolvedAddress();
	Hash256 _secret = Hash256();
	UnresolvedMosaic _mosaic = UnresolvedMosaic();
	BlockDuration _duration = BlockDuration();
	LockHashAlgorithm _hashAlgorithm = LockHashAlgorithm.SHA3_256;
	final int _embeddedTransactionHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field

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
	}) 
		: super(signerPublicKey == null && version == null && network == null && type == null && recipientAddress == null && secret == null && mosaic == null && duration == null && hashAlgorithm == null )
	{
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? EmbeddedSecretLockTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? EmbeddedSecretLockTransactionV1.TRANSACTION_TYPE;
		_recipientAddress = recipientAddress ?? UnresolvedAddress();
		_secret = secret ?? Hash256();
		_mosaic = mosaic ?? UnresolvedMosaic();
		_duration = duration ?? BlockDuration();
		_hashAlgorithm = hashAlgorithm ?? LockHashAlgorithm.SHA3_256;
	}

	void sort() {
		_mosaic.sort();
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	TransactionType get type {
		return _type;
	}

	UnresolvedAddress get recipientAddress {
		return _recipientAddress;
	}

	Hash256 get secret {
		return _secret;
	}

	UnresolvedMosaic get mosaic {
		return _mosaic;
	}

	BlockDuration get duration {
		return _duration;
	}

	LockHashAlgorithm get hashAlgorithm {
		return _hashAlgorithm;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set recipientAddress(UnresolvedAddress value) {
		_recipientAddress = value;
	}

	set secret(Hash256 value) {
		_secret = value;
	}

	set mosaic(UnresolvedMosaic value) {
		_mosaic = value;
	}

	set duration(BlockDuration value) {
		_duration = value;
	}

	set hashAlgorithm(LockHashAlgorithm value) {
		_hashAlgorithm = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_embeddedTransactionHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _recipientAddress.size, _recipientAddress.serialize());
		currentPos += recipientAddress.size;
		buffer.setRange(currentPos, currentPos + _secret.size, _secret.serialize());
		currentPos += secret.size;
		buffer.setRange(currentPos, currentPos + _mosaic.size, _mosaic.serialize());
		currentPos += mosaic.size;
		buffer.setRange(currentPos, currentPos + _duration.size, _duration.serialize());
		currentPos += duration.size;
		buffer.setRange(currentPos, currentPos + _hashAlgorithm.size, _hashAlgorithm.serialize());
		currentPos += hashAlgorithm.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'EmbeddedSecretLockTransactionV1(';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'recipientAddress: "${_recipientAddress.toString()}", ';
		result += 'secret: "${_secret.toString()}", ';
		result += 'mosaic: "${_mosaic.toString()}", ';
		result += 'duration: "${_duration.toString()}", ';
		result += 'hashAlgorithm: "${_hashAlgorithm.toString()}", ';
		result += ')';
		return result;
	}
}


class SecretProofTransactionV1 extends StructBase implements IDeserializable {
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

	Signature _signature = Signature();
	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	TransactionType _type = TransactionType.ACCOUNT_KEY_LINK;
	Amount _fee = Amount();
	Timestamp _deadline = Timestamp();
	UnresolvedAddress _recipientAddress = UnresolvedAddress();
	Hash256 _secret = Hash256();
	LockHashAlgorithm _hashAlgorithm = LockHashAlgorithm.SHA3_256;
	Uint8List _proof = Uint8List(0);
	final int _verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field

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
	}) 
		: super(signature == null && signerPublicKey == null && version == null && network == null && type == null && fee == null && deadline == null && recipientAddress == null && secret == null && hashAlgorithm == null && proof == null )
	{
		_signature = signature ?? Signature();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? SecretProofTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? SecretProofTransactionV1.TRANSACTION_TYPE;
		_fee = fee ?? Amount();
		_deadline = deadline ?? Timestamp();
		_recipientAddress = recipientAddress ?? UnresolvedAddress();
		_secret = secret ?? Hash256();
		_hashAlgorithm = hashAlgorithm ?? LockHashAlgorithm.SHA3_256;
		_proof = proof ?? Uint8List(0);
	}

	void sort() {
		// empty body
	}

	Signature get signature {
		return _signature;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	TransactionType get type {
		return _type;
	}

	Amount get fee {
		return _fee;
	}

	Timestamp get deadline {
		return _deadline;
	}

	UnresolvedAddress get recipientAddress {
		return _recipientAddress;
	}

	Hash256 get secret {
		return _secret;
	}

	LockHashAlgorithm get hashAlgorithm {
		return _hashAlgorithm;
	}

	Uint8List get proof {
		return _proof;
	}

	set signature(Signature value) {
		_signature = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set fee(Amount value) {
		_fee = value;
	}

	set deadline(Timestamp value) {
		_deadline = value;
	}

	set recipientAddress(UnresolvedAddress value) {
		_recipientAddress = value;
	}

	set secret(Hash256 value) {
		_secret = value;
	}

	set hashAlgorithm(LockHashAlgorithm value) {
		_hashAlgorithm = value;
	}

	set proof(Uint8List value) {
		_proof = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signature.size, _signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + _recipientAddress.size, _recipientAddress.serialize());
		currentPos += recipientAddress.size;
		buffer.setRange(currentPos, currentPos + _secret.size, _secret.serialize());
		currentPos += secret.size;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_proof.length, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + _hashAlgorithm.size, _hashAlgorithm.serialize());
		currentPos += hashAlgorithm.size;
		buffer.setRange(currentPos, currentPos + _proof.lengthInBytes, _proof);
		currentPos += proof.lengthInBytes;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'SecretProofTransactionV1(';
		result += 'signature: "${_signature.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'fee: "${_fee.toString()}", ';
		result += 'deadline: "${_deadline.toString()}", ';
		result += 'recipientAddress: "${_recipientAddress.toString()}", ';
		result += 'secret: "${_secret.toString()}", ';
		result += 'hashAlgorithm: "${_hashAlgorithm.toString()}", ';
		result += 'proof: "${hex.encode(_proof.toList()).toUpperCase()}", ';
		result += ')';
		return result;
	}
}


class EmbeddedSecretProofTransactionV1 extends StructBase implements IDeserializable, IEmbeddedTransaction {
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

	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	TransactionType _type = TransactionType.ACCOUNT_KEY_LINK;
	UnresolvedAddress _recipientAddress = UnresolvedAddress();
	Hash256 _secret = Hash256();
	LockHashAlgorithm _hashAlgorithm = LockHashAlgorithm.SHA3_256;
	Uint8List _proof = Uint8List(0);
	final int _embeddedTransactionHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field

	EmbeddedSecretProofTransactionV1({ 
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	UnresolvedAddress? recipientAddress,
	Hash256? secret,
	LockHashAlgorithm? hashAlgorithm,
	Uint8List? proof
	}) 
		: super(signerPublicKey == null && version == null && network == null && type == null && recipientAddress == null && secret == null && hashAlgorithm == null && proof == null )
	{
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? EmbeddedSecretProofTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? EmbeddedSecretProofTransactionV1.TRANSACTION_TYPE;
		_recipientAddress = recipientAddress ?? UnresolvedAddress();
		_secret = secret ?? Hash256();
		_hashAlgorithm = hashAlgorithm ?? LockHashAlgorithm.SHA3_256;
		_proof = proof ?? Uint8List(0);
	}

	void sort() {
		// empty body
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	TransactionType get type {
		return _type;
	}

	UnresolvedAddress get recipientAddress {
		return _recipientAddress;
	}

	Hash256 get secret {
		return _secret;
	}

	LockHashAlgorithm get hashAlgorithm {
		return _hashAlgorithm;
	}

	Uint8List get proof {
		return _proof;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set recipientAddress(UnresolvedAddress value) {
		_recipientAddress = value;
	}

	set secret(Hash256 value) {
		_secret = value;
	}

	set hashAlgorithm(LockHashAlgorithm value) {
		_hashAlgorithm = value;
	}

	set proof(Uint8List value) {
		_proof = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_embeddedTransactionHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _recipientAddress.size, _recipientAddress.serialize());
		currentPos += recipientAddress.size;
		buffer.setRange(currentPos, currentPos + _secret.size, _secret.serialize());
		currentPos += secret.size;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_proof.length, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + _hashAlgorithm.size, _hashAlgorithm.serialize());
		currentPos += hashAlgorithm.size;
		buffer.setRange(currentPos, currentPos + _proof.lengthInBytes, _proof);
		currentPos += proof.lengthInBytes;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'EmbeddedSecretProofTransactionV1(';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'recipientAddress: "${_recipientAddress.toString()}", ';
		result += 'secret: "${_secret.toString()}", ';
		result += 'hashAlgorithm: "${_hashAlgorithm.toString()}", ';
		result += 'proof: "${hex.encode(_proof.toList()).toUpperCase()}", ';
		result += ')';
		return result;
	}
}


class AccountMetadataTransactionV1 extends StructBase implements IDeserializable {
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

	Signature _signature = Signature();
	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	TransactionType _type = TransactionType.ACCOUNT_KEY_LINK;
	Amount _fee = Amount();
	Timestamp _deadline = Timestamp();
	UnresolvedAddress _targetAddress = UnresolvedAddress();
	int _scopedMetadataKey = 0;
	int _valueSizeDelta = 0;
	Uint8List _value = Uint8List(0);
	final int _verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field

	AccountMetadataTransactionV1({ 
	Signature? signature,
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	Amount? fee,
	Timestamp? deadline,
	UnresolvedAddress? targetAddress,
	int? scopedMetadataKey,
	int? valueSizeDelta,
	Uint8List? value
	}) 
		: super(signature == null && signerPublicKey == null && version == null && network == null && type == null && fee == null && deadline == null && targetAddress == null && scopedMetadataKey == null && valueSizeDelta == null && value == null )
	{
		_signature = signature ?? Signature();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? AccountMetadataTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? AccountMetadataTransactionV1.TRANSACTION_TYPE;
		_fee = fee ?? Amount();
		_deadline = deadline ?? Timestamp();
		_targetAddress = targetAddress ?? UnresolvedAddress();
		_scopedMetadataKey = scopedMetadataKey ?? 0;
		_valueSizeDelta = valueSizeDelta ?? 0;
		_value = value ?? Uint8List(0);
	}

	void sort() {
		// empty body
	}

	Signature get signature {
		return _signature;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	TransactionType get type {
		return _type;
	}

	Amount get fee {
		return _fee;
	}

	Timestamp get deadline {
		return _deadline;
	}

	UnresolvedAddress get targetAddress {
		return _targetAddress;
	}

	int get scopedMetadataKey {
		return _scopedMetadataKey;
	}

	int get valueSizeDelta {
		return _valueSizeDelta;
	}

	Uint8List get value {
		return _value;
	}

	set signature(Signature value) {
		_signature = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set fee(Amount value) {
		_fee = value;
	}

	set deadline(Timestamp value) {
		_deadline = value;
	}

	set targetAddress(UnresolvedAddress value) {
		_targetAddress = value;
	}

	set scopedMetadataKey(int value) {
		_scopedMetadataKey = value;
	}

	set valueSizeDelta(int value) {
		_valueSizeDelta = value;
	}

	set value(Uint8List value) {
		_value = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signature.size, _signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + _targetAddress.size, _targetAddress.serialize());
		currentPos += targetAddress.size;
		buffer.setRange(currentPos, currentPos + 8, intToBytes(_scopedMetadataKey, 8));
		currentPos += 8;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_valueSizeDelta, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_value.length, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + _value.lengthInBytes, _value);
		currentPos += value.lengthInBytes;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'AccountMetadataTransactionV1(';
		result += 'signature: "${_signature.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'fee: "${_fee.toString()}", ';
		result += 'deadline: "${_deadline.toString()}", ';
		result += 'targetAddress: "${_targetAddress.toString()}", ';
		result += 'scopedMetadataKey: "0x${_scopedMetadataKey.toRadixString(16).padLeft(8 * 2, '0').toUpperCase()}", ';
		result += 'valueSizeDelta: "0x${_valueSizeDelta.toRadixString(16).padLeft(2 * 2, '0').toUpperCase()}", ';
		result += 'value: "${hex.encode(_value.toList()).toUpperCase()}", ';
		result += ')';
		return result;
	}
}


class EmbeddedAccountMetadataTransactionV1 extends StructBase implements IDeserializable, IEmbeddedTransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.ACCOUNT_METADATA.value);

	static const Map<String, String> TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'targetAddress': 'pod:UnresolvedAddress',
		'value': 'bytes_array'
	};

	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	TransactionType _type = TransactionType.ACCOUNT_KEY_LINK;
	UnresolvedAddress _targetAddress = UnresolvedAddress();
	int _scopedMetadataKey = 0;
	int _valueSizeDelta = 0;
	Uint8List _value = Uint8List(0);
	final int _embeddedTransactionHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field

	EmbeddedAccountMetadataTransactionV1({ 
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	UnresolvedAddress? targetAddress,
	int? scopedMetadataKey,
	int? valueSizeDelta,
	Uint8List? value
	}) 
		: super(signerPublicKey == null && version == null && network == null && type == null && targetAddress == null && scopedMetadataKey == null && valueSizeDelta == null && value == null )
	{
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? EmbeddedAccountMetadataTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? EmbeddedAccountMetadataTransactionV1.TRANSACTION_TYPE;
		_targetAddress = targetAddress ?? UnresolvedAddress();
		_scopedMetadataKey = scopedMetadataKey ?? 0;
		_valueSizeDelta = valueSizeDelta ?? 0;
		_value = value ?? Uint8List(0);
	}

	void sort() {
		// empty body
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	TransactionType get type {
		return _type;
	}

	UnresolvedAddress get targetAddress {
		return _targetAddress;
	}

	int get scopedMetadataKey {
		return _scopedMetadataKey;
	}

	int get valueSizeDelta {
		return _valueSizeDelta;
	}

	Uint8List get value {
		return _value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set targetAddress(UnresolvedAddress value) {
		_targetAddress = value;
	}

	set scopedMetadataKey(int value) {
		_scopedMetadataKey = value;
	}

	set valueSizeDelta(int value) {
		_valueSizeDelta = value;
	}

	set value(Uint8List value) {
		_value = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_embeddedTransactionHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _targetAddress.size, _targetAddress.serialize());
		currentPos += targetAddress.size;
		buffer.setRange(currentPos, currentPos + 8, intToBytes(_scopedMetadataKey, 8));
		currentPos += 8;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_valueSizeDelta, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_value.length, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + _value.lengthInBytes, _value);
		currentPos += value.lengthInBytes;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'EmbeddedAccountMetadataTransactionV1(';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'targetAddress: "${_targetAddress.toString()}", ';
		result += 'scopedMetadataKey: "0x${_scopedMetadataKey.toRadixString(16).padLeft(8 * 2, '0').toUpperCase()}", ';
		result += 'valueSizeDelta: "0x${_valueSizeDelta.toRadixString(16).padLeft(2 * 2, '0').toUpperCase()}", ';
		result += 'value: "${hex.encode(_value.toList()).toUpperCase()}", ';
		result += ')';
		return result;
	}
}


class MosaicMetadataTransactionV1 extends StructBase implements IDeserializable {
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

	Signature _signature = Signature();
	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	TransactionType _type = TransactionType.ACCOUNT_KEY_LINK;
	Amount _fee = Amount();
	Timestamp _deadline = Timestamp();
	UnresolvedAddress _targetAddress = UnresolvedAddress();
	int _scopedMetadataKey = 0;
	UnresolvedMosaicId _targetMosaicId = UnresolvedMosaicId();
	int _valueSizeDelta = 0;
	Uint8List _value = Uint8List(0);
	final int _verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field

	MosaicMetadataTransactionV1({ 
	Signature? signature,
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	Amount? fee,
	Timestamp? deadline,
	UnresolvedAddress? targetAddress,
	int? scopedMetadataKey,
	UnresolvedMosaicId? targetMosaicId,
	int? valueSizeDelta,
	Uint8List? value
	}) 
		: super(signature == null && signerPublicKey == null && version == null && network == null && type == null && fee == null && deadline == null && targetAddress == null && scopedMetadataKey == null && targetMosaicId == null && valueSizeDelta == null && value == null )
	{
		_signature = signature ?? Signature();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? MosaicMetadataTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? MosaicMetadataTransactionV1.TRANSACTION_TYPE;
		_fee = fee ?? Amount();
		_deadline = deadline ?? Timestamp();
		_targetAddress = targetAddress ?? UnresolvedAddress();
		_scopedMetadataKey = scopedMetadataKey ?? 0;
		_targetMosaicId = targetMosaicId ?? UnresolvedMosaicId();
		_valueSizeDelta = valueSizeDelta ?? 0;
		_value = value ?? Uint8List(0);
	}

	void sort() {
		// empty body
	}

	Signature get signature {
		return _signature;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	TransactionType get type {
		return _type;
	}

	Amount get fee {
		return _fee;
	}

	Timestamp get deadline {
		return _deadline;
	}

	UnresolvedAddress get targetAddress {
		return _targetAddress;
	}

	int get scopedMetadataKey {
		return _scopedMetadataKey;
	}

	UnresolvedMosaicId get targetMosaicId {
		return _targetMosaicId;
	}

	int get valueSizeDelta {
		return _valueSizeDelta;
	}

	Uint8List get value {
		return _value;
	}

	set signature(Signature value) {
		_signature = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set fee(Amount value) {
		_fee = value;
	}

	set deadline(Timestamp value) {
		_deadline = value;
	}

	set targetAddress(UnresolvedAddress value) {
		_targetAddress = value;
	}

	set scopedMetadataKey(int value) {
		_scopedMetadataKey = value;
	}

	set targetMosaicId(UnresolvedMosaicId value) {
		_targetMosaicId = value;
	}

	set valueSizeDelta(int value) {
		_valueSizeDelta = value;
	}

	set value(Uint8List value) {
		_value = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signature.size, _signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + _targetAddress.size, _targetAddress.serialize());
		currentPos += targetAddress.size;
		buffer.setRange(currentPos, currentPos + 8, intToBytes(_scopedMetadataKey, 8));
		currentPos += 8;
		buffer.setRange(currentPos, currentPos + _targetMosaicId.size, _targetMosaicId.serialize());
		currentPos += targetMosaicId.size;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_valueSizeDelta, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_value.length, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + _value.lengthInBytes, _value);
		currentPos += value.lengthInBytes;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'MosaicMetadataTransactionV1(';
		result += 'signature: "${_signature.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'fee: "${_fee.toString()}", ';
		result += 'deadline: "${_deadline.toString()}", ';
		result += 'targetAddress: "${_targetAddress.toString()}", ';
		result += 'scopedMetadataKey: "0x${_scopedMetadataKey.toRadixString(16).padLeft(8 * 2, '0').toUpperCase()}", ';
		result += 'targetMosaicId: "${_targetMosaicId.toString()}", ';
		result += 'valueSizeDelta: "0x${_valueSizeDelta.toRadixString(16).padLeft(2 * 2, '0').toUpperCase()}", ';
		result += 'value: "${hex.encode(_value.toList()).toUpperCase()}", ';
		result += ')';
		return result;
	}
}


class EmbeddedMosaicMetadataTransactionV1 extends StructBase implements IDeserializable, IEmbeddedTransaction {
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

	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	TransactionType _type = TransactionType.ACCOUNT_KEY_LINK;
	UnresolvedAddress _targetAddress = UnresolvedAddress();
	int _scopedMetadataKey = 0;
	UnresolvedMosaicId _targetMosaicId = UnresolvedMosaicId();
	int _valueSizeDelta = 0;
	Uint8List _value = Uint8List(0);
	final int _embeddedTransactionHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field

	EmbeddedMosaicMetadataTransactionV1({ 
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	UnresolvedAddress? targetAddress,
	int? scopedMetadataKey,
	UnresolvedMosaicId? targetMosaicId,
	int? valueSizeDelta,
	Uint8List? value
	}) 
		: super(signerPublicKey == null && version == null && network == null && type == null && targetAddress == null && scopedMetadataKey == null && targetMosaicId == null && valueSizeDelta == null && value == null )
	{
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? EmbeddedMosaicMetadataTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? EmbeddedMosaicMetadataTransactionV1.TRANSACTION_TYPE;
		_targetAddress = targetAddress ?? UnresolvedAddress();
		_scopedMetadataKey = scopedMetadataKey ?? 0;
		_targetMosaicId = targetMosaicId ?? UnresolvedMosaicId();
		_valueSizeDelta = valueSizeDelta ?? 0;
		_value = value ?? Uint8List(0);
	}

	void sort() {
		// empty body
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	TransactionType get type {
		return _type;
	}

	UnresolvedAddress get targetAddress {
		return _targetAddress;
	}

	int get scopedMetadataKey {
		return _scopedMetadataKey;
	}

	UnresolvedMosaicId get targetMosaicId {
		return _targetMosaicId;
	}

	int get valueSizeDelta {
		return _valueSizeDelta;
	}

	Uint8List get value {
		return _value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set targetAddress(UnresolvedAddress value) {
		_targetAddress = value;
	}

	set scopedMetadataKey(int value) {
		_scopedMetadataKey = value;
	}

	set targetMosaicId(UnresolvedMosaicId value) {
		_targetMosaicId = value;
	}

	set valueSizeDelta(int value) {
		_valueSizeDelta = value;
	}

	set value(Uint8List value) {
		_value = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_embeddedTransactionHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _targetAddress.size, _targetAddress.serialize());
		currentPos += targetAddress.size;
		buffer.setRange(currentPos, currentPos + 8, intToBytes(_scopedMetadataKey, 8));
		currentPos += 8;
		buffer.setRange(currentPos, currentPos + _targetMosaicId.size, _targetMosaicId.serialize());
		currentPos += targetMosaicId.size;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_valueSizeDelta, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_value.length, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + _value.lengthInBytes, _value);
		currentPos += value.lengthInBytes;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'EmbeddedMosaicMetadataTransactionV1(';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'targetAddress: "${_targetAddress.toString()}", ';
		result += 'scopedMetadataKey: "0x${_scopedMetadataKey.toRadixString(16).padLeft(8 * 2, '0').toUpperCase()}", ';
		result += 'targetMosaicId: "${_targetMosaicId.toString()}", ';
		result += 'valueSizeDelta: "0x${_valueSizeDelta.toRadixString(16).padLeft(2 * 2, '0').toUpperCase()}", ';
		result += 'value: "${hex.encode(_value.toList()).toUpperCase()}", ';
		result += ')';
		return result;
	}
}


class NamespaceMetadataTransactionV1 extends StructBase implements IDeserializable {
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

	Signature _signature = Signature();
	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	TransactionType _type = TransactionType.ACCOUNT_KEY_LINK;
	Amount _fee = Amount();
	Timestamp _deadline = Timestamp();
	UnresolvedAddress _targetAddress = UnresolvedAddress();
	int _scopedMetadataKey = 0;
	NamespaceId _targetNamespaceId = NamespaceId();
	int _valueSizeDelta = 0;
	Uint8List _value = Uint8List(0);
	final int _verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field

	NamespaceMetadataTransactionV1({ 
	Signature? signature,
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	Amount? fee,
	Timestamp? deadline,
	UnresolvedAddress? targetAddress,
	int? scopedMetadataKey,
	NamespaceId? targetNamespaceId,
	int? valueSizeDelta,
	Uint8List? value
	}) 
		: super(signature == null && signerPublicKey == null && version == null && network == null && type == null && fee == null && deadline == null && targetAddress == null && scopedMetadataKey == null && targetNamespaceId == null && valueSizeDelta == null && value == null )
	{
		_signature = signature ?? Signature();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? NamespaceMetadataTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? NamespaceMetadataTransactionV1.TRANSACTION_TYPE;
		_fee = fee ?? Amount();
		_deadline = deadline ?? Timestamp();
		_targetAddress = targetAddress ?? UnresolvedAddress();
		_scopedMetadataKey = scopedMetadataKey ?? 0;
		_targetNamespaceId = targetNamespaceId ?? NamespaceId();
		_valueSizeDelta = valueSizeDelta ?? 0;
		_value = value ?? Uint8List(0);
	}

	void sort() {
		// empty body
	}

	Signature get signature {
		return _signature;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	TransactionType get type {
		return _type;
	}

	Amount get fee {
		return _fee;
	}

	Timestamp get deadline {
		return _deadline;
	}

	UnresolvedAddress get targetAddress {
		return _targetAddress;
	}

	int get scopedMetadataKey {
		return _scopedMetadataKey;
	}

	NamespaceId get targetNamespaceId {
		return _targetNamespaceId;
	}

	int get valueSizeDelta {
		return _valueSizeDelta;
	}

	Uint8List get value {
		return _value;
	}

	set signature(Signature value) {
		_signature = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set fee(Amount value) {
		_fee = value;
	}

	set deadline(Timestamp value) {
		_deadline = value;
	}

	set targetAddress(UnresolvedAddress value) {
		_targetAddress = value;
	}

	set scopedMetadataKey(int value) {
		_scopedMetadataKey = value;
	}

	set targetNamespaceId(NamespaceId value) {
		_targetNamespaceId = value;
	}

	set valueSizeDelta(int value) {
		_valueSizeDelta = value;
	}

	set value(Uint8List value) {
		_value = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signature.size, _signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + _targetAddress.size, _targetAddress.serialize());
		currentPos += targetAddress.size;
		buffer.setRange(currentPos, currentPos + 8, intToBytes(_scopedMetadataKey, 8));
		currentPos += 8;
		buffer.setRange(currentPos, currentPos + _targetNamespaceId.size, _targetNamespaceId.serialize());
		currentPos += targetNamespaceId.size;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_valueSizeDelta, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_value.length, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + _value.lengthInBytes, _value);
		currentPos += value.lengthInBytes;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'NamespaceMetadataTransactionV1(';
		result += 'signature: "${_signature.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'fee: "${_fee.toString()}", ';
		result += 'deadline: "${_deadline.toString()}", ';
		result += 'targetAddress: "${_targetAddress.toString()}", ';
		result += 'scopedMetadataKey: "0x${_scopedMetadataKey.toRadixString(16).padLeft(8 * 2, '0').toUpperCase()}", ';
		result += 'targetNamespaceId: "${_targetNamespaceId.toString()}", ';
		result += 'valueSizeDelta: "0x${_valueSizeDelta.toRadixString(16).padLeft(2 * 2, '0').toUpperCase()}", ';
		result += 'value: "${hex.encode(_value.toList()).toUpperCase()}", ';
		result += ')';
		return result;
	}
}


class EmbeddedNamespaceMetadataTransactionV1 extends StructBase implements IDeserializable, IEmbeddedTransaction {
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

	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	TransactionType _type = TransactionType.ACCOUNT_KEY_LINK;
	UnresolvedAddress _targetAddress = UnresolvedAddress();
	int _scopedMetadataKey = 0;
	NamespaceId _targetNamespaceId = NamespaceId();
	int _valueSizeDelta = 0;
	Uint8List _value = Uint8List(0);
	final int _embeddedTransactionHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field

	EmbeddedNamespaceMetadataTransactionV1({ 
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	UnresolvedAddress? targetAddress,
	int? scopedMetadataKey,
	NamespaceId? targetNamespaceId,
	int? valueSizeDelta,
	Uint8List? value
	}) 
		: super(signerPublicKey == null && version == null && network == null && type == null && targetAddress == null && scopedMetadataKey == null && targetNamespaceId == null && valueSizeDelta == null && value == null )
	{
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? EmbeddedNamespaceMetadataTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? EmbeddedNamespaceMetadataTransactionV1.TRANSACTION_TYPE;
		_targetAddress = targetAddress ?? UnresolvedAddress();
		_scopedMetadataKey = scopedMetadataKey ?? 0;
		_targetNamespaceId = targetNamespaceId ?? NamespaceId();
		_valueSizeDelta = valueSizeDelta ?? 0;
		_value = value ?? Uint8List(0);
	}

	void sort() {
		// empty body
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	TransactionType get type {
		return _type;
	}

	UnresolvedAddress get targetAddress {
		return _targetAddress;
	}

	int get scopedMetadataKey {
		return _scopedMetadataKey;
	}

	NamespaceId get targetNamespaceId {
		return _targetNamespaceId;
	}

	int get valueSizeDelta {
		return _valueSizeDelta;
	}

	Uint8List get value {
		return _value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set targetAddress(UnresolvedAddress value) {
		_targetAddress = value;
	}

	set scopedMetadataKey(int value) {
		_scopedMetadataKey = value;
	}

	set targetNamespaceId(NamespaceId value) {
		_targetNamespaceId = value;
	}

	set valueSizeDelta(int value) {
		_valueSizeDelta = value;
	}

	set value(Uint8List value) {
		_value = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_embeddedTransactionHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _targetAddress.size, _targetAddress.serialize());
		currentPos += targetAddress.size;
		buffer.setRange(currentPos, currentPos + 8, intToBytes(_scopedMetadataKey, 8));
		currentPos += 8;
		buffer.setRange(currentPos, currentPos + _targetNamespaceId.size, _targetNamespaceId.serialize());
		currentPos += targetNamespaceId.size;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_valueSizeDelta, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_value.length, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + _value.lengthInBytes, _value);
		currentPos += value.lengthInBytes;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'EmbeddedNamespaceMetadataTransactionV1(';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'targetAddress: "${_targetAddress.toString()}", ';
		result += 'scopedMetadataKey: "0x${_scopedMetadataKey.toRadixString(16).padLeft(8 * 2, '0').toUpperCase()}", ';
		result += 'targetNamespaceId: "${_targetNamespaceId.toString()}", ';
		result += 'valueSizeDelta: "0x${_valueSizeDelta.toRadixString(16).padLeft(2 * 2, '0').toUpperCase()}", ';
		result += 'value: "${hex.encode(_value.toList()).toUpperCase()}", ';
		result += ')';
		return result;
	}
}


class MosaicNonce extends BaseValue implements IDeserializable {
	static const int SIZE = 4;

	MosaicNonce([dynamic mosaicNonce]) : super(SIZE, mosaicNonce ?? 0);

	@override
	MosaicNonce deserialize(Uint8List payload) {
		return MosaicNonce(bytesToInt(payload.sublist(0, 4), 4));
	}

	Uint8List serialize() {
		var buffer = Uint8List(SIZE);
		buffer.setRange(0, 0 + 4, intToBytes(value, 4));
		return buffer;
	}
}


class MosaicFlags implements IDeserializable {
	static final NONE = MosaicFlags(0);
	static final SUPPLY_MUTABLE = MosaicFlags(1);
	static final TRANSFERABLE = MosaicFlags(2);
	static final RESTRICTABLE = MosaicFlags(4);
	static final REVOKABLE = MosaicFlags(8);

	final int value;

	static final _flags = {
		0: 'NONE',
		1: 'SUPPLY_MUTABLE',
		2: 'TRANSFERABLE',
		4: 'RESTRICTABLE',
		8: 'REVOKABLE',
	};

	MosaicFlags([int? _value]) : value = _value ?? 0;

	int get size {
		return 1;
	}

	@override
	MosaicFlags deserialize(Uint8List payload) {
		var byteData = ByteData.sublistView(payload);
		return MosaicFlags(byteData.getUint8(0));
	}

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


class MosaicSupplyChangeAction implements IDeserializable {
	static final DECREASE = MosaicSupplyChangeAction(0);
	static final INCREASE = MosaicSupplyChangeAction(1);

	final int value;

	static final _flags = {
		0: 'DECREASE',
		1: 'INCREASE',
	};

	MosaicSupplyChangeAction([int? _value]) : value = _value ?? 0;

	int get size {
		return 1;
	}

	@override
	MosaicSupplyChangeAction deserialize(Uint8List payload) {
		var byteData = ByteData.sublistView(payload);
		return MosaicSupplyChangeAction(byteData.getUint8(0));
	}

	Uint8List serialize() {
		var byteData = ByteData(1)..setUint8(0, value);
		return byteData.buffer.asUint8List();
	}

	@override
	String toString() {
		return 'MosaicSupplyChangeAction.${_flags[value]}';
	}
}


class MosaicDefinitionTransactionV1 extends StructBase implements IDeserializable {
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

	Signature _signature = Signature();
	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	TransactionType _type = TransactionType.ACCOUNT_KEY_LINK;
	Amount _fee = Amount();
	Timestamp _deadline = Timestamp();
	MosaicId _id = MosaicId();
	BlockDuration _duration = BlockDuration();
	MosaicNonce _nonce = MosaicNonce();
	MosaicFlags _flags = MosaicFlags.NONE;
	int _divisibility = 0;
	final int _verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field

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
	}) 
		: super(signature == null && signerPublicKey == null && version == null && network == null && type == null && fee == null && deadline == null && id == null && duration == null && nonce == null && flags == null && divisibility == null )
	{
		_signature = signature ?? Signature();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? MosaicDefinitionTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? MosaicDefinitionTransactionV1.TRANSACTION_TYPE;
		_fee = fee ?? Amount();
		_deadline = deadline ?? Timestamp();
		_id = id ?? MosaicId();
		_duration = duration ?? BlockDuration();
		_nonce = nonce ?? MosaicNonce();
		_flags = flags ?? MosaicFlags.NONE;
		_divisibility = divisibility ?? 0;
	}

	void sort() {
		// empty body
	}

	Signature get signature {
		return _signature;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	TransactionType get type {
		return _type;
	}

	Amount get fee {
		return _fee;
	}

	Timestamp get deadline {
		return _deadline;
	}

	MosaicId get id {
		return _id;
	}

	BlockDuration get duration {
		return _duration;
	}

	MosaicNonce get nonce {
		return _nonce;
	}

	MosaicFlags get flags {
		return _flags;
	}

	int get divisibility {
		return _divisibility;
	}

	set signature(Signature value) {
		_signature = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set fee(Amount value) {
		_fee = value;
	}

	set deadline(Timestamp value) {
		_deadline = value;
	}

	set id(MosaicId value) {
		_id = value;
	}

	set duration(BlockDuration value) {
		_duration = value;
	}

	set nonce(MosaicNonce value) {
		_nonce = value;
	}

	set flags(MosaicFlags value) {
		_flags = value;
	}

	set divisibility(int value) {
		_divisibility = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signature.size, _signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + _id.size, _id.serialize());
		currentPos += id.size;
		buffer.setRange(currentPos, currentPos + _duration.size, _duration.serialize());
		currentPos += duration.size;
		buffer.setRange(currentPos, currentPos + _nonce.size, _nonce.serialize());
		currentPos += nonce.size;
		buffer.setRange(currentPos, currentPos + _flags.size, _flags.serialize());
		currentPos += flags.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_divisibility, 1));
		currentPos += 1;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'MosaicDefinitionTransactionV1(';
		result += 'signature: "${_signature.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'fee: "${_fee.toString()}", ';
		result += 'deadline: "${_deadline.toString()}", ';
		result += 'id: "${_id.toString()}", ';
		result += 'duration: "${_duration.toString()}", ';
		result += 'nonce: "${_nonce.toString()}", ';
		result += 'flags: "${_flags.toString()}", ';
		result += 'divisibility: "0x${_divisibility.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += ')';
		return result;
	}
}


class EmbeddedMosaicDefinitionTransactionV1 extends StructBase implements IDeserializable, IEmbeddedTransaction {
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

	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	TransactionType _type = TransactionType.ACCOUNT_KEY_LINK;
	MosaicId _id = MosaicId();
	BlockDuration _duration = BlockDuration();
	MosaicNonce _nonce = MosaicNonce();
	MosaicFlags _flags = MosaicFlags.NONE;
	int _divisibility = 0;
	final int _embeddedTransactionHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field

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
	}) 
		: super(signerPublicKey == null && version == null && network == null && type == null && id == null && duration == null && nonce == null && flags == null && divisibility == null )
	{
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? EmbeddedMosaicDefinitionTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? EmbeddedMosaicDefinitionTransactionV1.TRANSACTION_TYPE;
		_id = id ?? MosaicId();
		_duration = duration ?? BlockDuration();
		_nonce = nonce ?? MosaicNonce();
		_flags = flags ?? MosaicFlags.NONE;
		_divisibility = divisibility ?? 0;
	}

	void sort() {
		// empty body
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	TransactionType get type {
		return _type;
	}

	MosaicId get id {
		return _id;
	}

	BlockDuration get duration {
		return _duration;
	}

	MosaicNonce get nonce {
		return _nonce;
	}

	MosaicFlags get flags {
		return _flags;
	}

	int get divisibility {
		return _divisibility;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set id(MosaicId value) {
		_id = value;
	}

	set duration(BlockDuration value) {
		_duration = value;
	}

	set nonce(MosaicNonce value) {
		_nonce = value;
	}

	set flags(MosaicFlags value) {
		_flags = value;
	}

	set divisibility(int value) {
		_divisibility = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_embeddedTransactionHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _id.size, _id.serialize());
		currentPos += id.size;
		buffer.setRange(currentPos, currentPos + _duration.size, _duration.serialize());
		currentPos += duration.size;
		buffer.setRange(currentPos, currentPos + _nonce.size, _nonce.serialize());
		currentPos += nonce.size;
		buffer.setRange(currentPos, currentPos + _flags.size, _flags.serialize());
		currentPos += flags.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_divisibility, 1));
		currentPos += 1;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'EmbeddedMosaicDefinitionTransactionV1(';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'id: "${_id.toString()}", ';
		result += 'duration: "${_duration.toString()}", ';
		result += 'nonce: "${_nonce.toString()}", ';
		result += 'flags: "${_flags.toString()}", ';
		result += 'divisibility: "0x${_divisibility.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += ')';
		return result;
	}
}


class MosaicSupplyChangeTransactionV1 extends StructBase implements IDeserializable {
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

	Signature _signature = Signature();
	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	TransactionType _type = TransactionType.ACCOUNT_KEY_LINK;
	Amount _fee = Amount();
	Timestamp _deadline = Timestamp();
	UnresolvedMosaicId _mosaicId = UnresolvedMosaicId();
	Amount _delta = Amount();
	MosaicSupplyChangeAction _action = MosaicSupplyChangeAction.DECREASE;
	final int _verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field

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
	}) 
		: super(signature == null && signerPublicKey == null && version == null && network == null && type == null && fee == null && deadline == null && mosaicId == null && delta == null && action == null )
	{
		_signature = signature ?? Signature();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? MosaicSupplyChangeTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? MosaicSupplyChangeTransactionV1.TRANSACTION_TYPE;
		_fee = fee ?? Amount();
		_deadline = deadline ?? Timestamp();
		_mosaicId = mosaicId ?? UnresolvedMosaicId();
		_delta = delta ?? Amount();
		_action = action ?? MosaicSupplyChangeAction.DECREASE;
	}

	void sort() {
		// empty body
	}

	Signature get signature {
		return _signature;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	TransactionType get type {
		return _type;
	}

	Amount get fee {
		return _fee;
	}

	Timestamp get deadline {
		return _deadline;
	}

	UnresolvedMosaicId get mosaicId {
		return _mosaicId;
	}

	Amount get delta {
		return _delta;
	}

	MosaicSupplyChangeAction get action {
		return _action;
	}

	set signature(Signature value) {
		_signature = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set fee(Amount value) {
		_fee = value;
	}

	set deadline(Timestamp value) {
		_deadline = value;
	}

	set mosaicId(UnresolvedMosaicId value) {
		_mosaicId = value;
	}

	set delta(Amount value) {
		_delta = value;
	}

	set action(MosaicSupplyChangeAction value) {
		_action = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signature.size, _signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + _mosaicId.size, _mosaicId.serialize());
		currentPos += mosaicId.size;
		buffer.setRange(currentPos, currentPos + _delta.size, _delta.serialize());
		currentPos += delta.size;
		buffer.setRange(currentPos, currentPos + _action.size, _action.serialize());
		currentPos += action.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'MosaicSupplyChangeTransactionV1(';
		result += 'signature: "${_signature.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'fee: "${_fee.toString()}", ';
		result += 'deadline: "${_deadline.toString()}", ';
		result += 'mosaicId: "${_mosaicId.toString()}", ';
		result += 'delta: "${_delta.toString()}", ';
		result += 'action: "${_action.toString()}", ';
		result += ')';
		return result;
	}
}


class EmbeddedMosaicSupplyChangeTransactionV1 extends StructBase implements IDeserializable, IEmbeddedTransaction {
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

	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	TransactionType _type = TransactionType.ACCOUNT_KEY_LINK;
	UnresolvedMosaicId _mosaicId = UnresolvedMosaicId();
	Amount _delta = Amount();
	MosaicSupplyChangeAction _action = MosaicSupplyChangeAction.DECREASE;
	final int _embeddedTransactionHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field

	EmbeddedMosaicSupplyChangeTransactionV1({ 
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	UnresolvedMosaicId? mosaicId,
	Amount? delta,
	MosaicSupplyChangeAction? action
	}) 
		: super(signerPublicKey == null && version == null && network == null && type == null && mosaicId == null && delta == null && action == null )
	{
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? EmbeddedMosaicSupplyChangeTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? EmbeddedMosaicSupplyChangeTransactionV1.TRANSACTION_TYPE;
		_mosaicId = mosaicId ?? UnresolvedMosaicId();
		_delta = delta ?? Amount();
		_action = action ?? MosaicSupplyChangeAction.DECREASE;
	}

	void sort() {
		// empty body
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	TransactionType get type {
		return _type;
	}

	UnresolvedMosaicId get mosaicId {
		return _mosaicId;
	}

	Amount get delta {
		return _delta;
	}

	MosaicSupplyChangeAction get action {
		return _action;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set mosaicId(UnresolvedMosaicId value) {
		_mosaicId = value;
	}

	set delta(Amount value) {
		_delta = value;
	}

	set action(MosaicSupplyChangeAction value) {
		_action = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_embeddedTransactionHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _mosaicId.size, _mosaicId.serialize());
		currentPos += mosaicId.size;
		buffer.setRange(currentPos, currentPos + _delta.size, _delta.serialize());
		currentPos += delta.size;
		buffer.setRange(currentPos, currentPos + _action.size, _action.serialize());
		currentPos += action.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'EmbeddedMosaicSupplyChangeTransactionV1(';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'mosaicId: "${_mosaicId.toString()}", ';
		result += 'delta: "${_delta.toString()}", ';
		result += 'action: "${_action.toString()}", ';
		result += ')';
		return result;
	}
}


class MosaicSupplyRevocationTransactionV1 extends StructBase implements IDeserializable {
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

	Signature _signature = Signature();
	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	TransactionType _type = TransactionType.ACCOUNT_KEY_LINK;
	Amount _fee = Amount();
	Timestamp _deadline = Timestamp();
	UnresolvedAddress _sourceAddress = UnresolvedAddress();
	UnresolvedMosaic _mosaic = UnresolvedMosaic();
	final int _verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field

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
	}) 
		: super(signature == null && signerPublicKey == null && version == null && network == null && type == null && fee == null && deadline == null && sourceAddress == null && mosaic == null )
	{
		_signature = signature ?? Signature();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? MosaicSupplyRevocationTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? MosaicSupplyRevocationTransactionV1.TRANSACTION_TYPE;
		_fee = fee ?? Amount();
		_deadline = deadline ?? Timestamp();
		_sourceAddress = sourceAddress ?? UnresolvedAddress();
		_mosaic = mosaic ?? UnresolvedMosaic();
	}

	void sort() {
		_mosaic.sort();
	}

	Signature get signature {
		return _signature;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	TransactionType get type {
		return _type;
	}

	Amount get fee {
		return _fee;
	}

	Timestamp get deadline {
		return _deadline;
	}

	UnresolvedAddress get sourceAddress {
		return _sourceAddress;
	}

	UnresolvedMosaic get mosaic {
		return _mosaic;
	}

	set signature(Signature value) {
		_signature = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set fee(Amount value) {
		_fee = value;
	}

	set deadline(Timestamp value) {
		_deadline = value;
	}

	set sourceAddress(UnresolvedAddress value) {
		_sourceAddress = value;
	}

	set mosaic(UnresolvedMosaic value) {
		_mosaic = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signature.size, _signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + _sourceAddress.size, _sourceAddress.serialize());
		currentPos += sourceAddress.size;
		buffer.setRange(currentPos, currentPos + _mosaic.size, _mosaic.serialize());
		currentPos += mosaic.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'MosaicSupplyRevocationTransactionV1(';
		result += 'signature: "${_signature.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'fee: "${_fee.toString()}", ';
		result += 'deadline: "${_deadline.toString()}", ';
		result += 'sourceAddress: "${_sourceAddress.toString()}", ';
		result += 'mosaic: "${_mosaic.toString()}", ';
		result += ')';
		return result;
	}
}


class EmbeddedMosaicSupplyRevocationTransactionV1 extends StructBase implements IDeserializable, IEmbeddedTransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.MOSAIC_SUPPLY_REVOCATION.value);

	static const Map<String, String> TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'sourceAddress': 'pod:UnresolvedAddress',
		'mosaic': 'struct:UnresolvedMosaic'
	};

	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	TransactionType _type = TransactionType.ACCOUNT_KEY_LINK;
	UnresolvedAddress _sourceAddress = UnresolvedAddress();
	UnresolvedMosaic _mosaic = UnresolvedMosaic();
	final int _embeddedTransactionHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field

	EmbeddedMosaicSupplyRevocationTransactionV1({ 
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	UnresolvedAddress? sourceAddress,
	UnresolvedMosaic? mosaic
	}) 
		: super(signerPublicKey == null && version == null && network == null && type == null && sourceAddress == null && mosaic == null )
	{
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? EmbeddedMosaicSupplyRevocationTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? EmbeddedMosaicSupplyRevocationTransactionV1.TRANSACTION_TYPE;
		_sourceAddress = sourceAddress ?? UnresolvedAddress();
		_mosaic = mosaic ?? UnresolvedMosaic();
	}

	void sort() {
		_mosaic.sort();
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	TransactionType get type {
		return _type;
	}

	UnresolvedAddress get sourceAddress {
		return _sourceAddress;
	}

	UnresolvedMosaic get mosaic {
		return _mosaic;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set sourceAddress(UnresolvedAddress value) {
		_sourceAddress = value;
	}

	set mosaic(UnresolvedMosaic value) {
		_mosaic = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_embeddedTransactionHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _sourceAddress.size, _sourceAddress.serialize());
		currentPos += sourceAddress.size;
		buffer.setRange(currentPos, currentPos + _mosaic.size, _mosaic.serialize());
		currentPos += mosaic.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'EmbeddedMosaicSupplyRevocationTransactionV1(';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'sourceAddress: "${_sourceAddress.toString()}", ';
		result += 'mosaic: "${_mosaic.toString()}", ';
		result += ')';
		return result;
	}
}


class MultisigAccountModificationTransactionV1 extends StructBase implements IDeserializable {
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

	Signature _signature = Signature();
	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	TransactionType _type = TransactionType.ACCOUNT_KEY_LINK;
	Amount _fee = Amount();
	Timestamp _deadline = Timestamp();
	int _minRemovalDelta = 0;
	int _minApprovalDelta = 0;
	List<UnresolvedAddress> _addressAdditions = [];
	List<UnresolvedAddress> _addressDeletions = [];
	final int _verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field
	final int _multisigAccountModificationTransactionBodyReserved_1 = 0; // reserved field

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
	}) 
		: super(signature == null && signerPublicKey == null && version == null && network == null && type == null && fee == null && deadline == null && minRemovalDelta == null && minApprovalDelta == null && addressAdditions == null && addressDeletions == null )
	{
		_signature = signature ?? Signature();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? MultisigAccountModificationTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? MultisigAccountModificationTransactionV1.TRANSACTION_TYPE;
		_fee = fee ?? Amount();
		_deadline = deadline ?? Timestamp();
		_minRemovalDelta = minRemovalDelta ?? 0;
		_minApprovalDelta = minApprovalDelta ?? 0;
		_addressAdditions = addressAdditions ?? [];
		_addressDeletions = addressDeletions ?? [];
	}

	void sort() {
		// empty body
	}

	Signature get signature {
		return _signature;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	TransactionType get type {
		return _type;
	}

	Amount get fee {
		return _fee;
	}

	Timestamp get deadline {
		return _deadline;
	}

	int get minRemovalDelta {
		return _minRemovalDelta;
	}

	int get minApprovalDelta {
		return _minApprovalDelta;
	}

	List<UnresolvedAddress> get addressAdditions {
		return _addressAdditions;
	}

	List<UnresolvedAddress> get addressDeletions {
		return _addressDeletions;
	}

	set signature(Signature value) {
		_signature = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set fee(Amount value) {
		_fee = value;
	}

	set deadline(Timestamp value) {
		_deadline = value;
	}

	set minRemovalDelta(int value) {
		_minRemovalDelta = value;
	}

	set minApprovalDelta(int value) {
		_minApprovalDelta = value;
	}

	set addressAdditions(List<UnresolvedAddress> value) {
		_addressAdditions = value;
	}

	set addressDeletions(List<UnresolvedAddress> value) {
		_addressDeletions = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signature.size, _signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_minRemovalDelta, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_minApprovalDelta, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_addressAdditions.length, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_addressDeletions.length, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_multisigAccountModificationTransactionBodyReserved_1, 4));
		currentPos += 4;
		sort();
		var res_addressAdditions = ArrayHelpers.writeArray(buffer, _addressAdditions, currentPos);
		currentPos = res_addressAdditions.item2;
		buffer = res_addressAdditions.item1;
		sort();
		var res_addressDeletions = ArrayHelpers.writeArray(buffer, _addressDeletions, currentPos);
		currentPos = res_addressDeletions.item2;
		buffer = res_addressDeletions.item1;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'MultisigAccountModificationTransactionV1(';
		result += 'signature: "${_signature.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'fee: "${_fee.toString()}", ';
		result += 'deadline: "${_deadline.toString()}", ';
		result += 'minRemovalDelta: "0x${_minRemovalDelta.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'minApprovalDelta: "0x${_minApprovalDelta.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'addressAdditions: "${_addressAdditions.map((e) => e.toString()).toList()}", ';
		result += 'addressDeletions: "${_addressDeletions.map((e) => e.toString()).toList()}", ';
		result += ')';
		return result;
	}
}


class EmbeddedMultisigAccountModificationTransactionV1 extends StructBase implements IDeserializable, IEmbeddedTransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.MULTISIG_ACCOUNT_MODIFICATION.value);

	static const Map<String, String> TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'addressAdditions': 'array[UnresolvedAddress]',
		'addressDeletions': 'array[UnresolvedAddress]'
	};

	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	TransactionType _type = TransactionType.ACCOUNT_KEY_LINK;
	int _minRemovalDelta = 0;
	int _minApprovalDelta = 0;
	List<UnresolvedAddress> _addressAdditions = [];
	List<UnresolvedAddress> _addressDeletions = [];
	final int _embeddedTransactionHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field
	final int _multisigAccountModificationTransactionBodyReserved_1 = 0; // reserved field

	EmbeddedMultisigAccountModificationTransactionV1({ 
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	int? minRemovalDelta,
	int? minApprovalDelta,
	List<UnresolvedAddress>? addressAdditions,
	List<UnresolvedAddress>? addressDeletions
	}) 
		: super(signerPublicKey == null && version == null && network == null && type == null && minRemovalDelta == null && minApprovalDelta == null && addressAdditions == null && addressDeletions == null )
	{
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? EmbeddedMultisigAccountModificationTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? EmbeddedMultisigAccountModificationTransactionV1.TRANSACTION_TYPE;
		_minRemovalDelta = minRemovalDelta ?? 0;
		_minApprovalDelta = minApprovalDelta ?? 0;
		_addressAdditions = addressAdditions ?? [];
		_addressDeletions = addressDeletions ?? [];
	}

	void sort() {
		// empty body
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	TransactionType get type {
		return _type;
	}

	int get minRemovalDelta {
		return _minRemovalDelta;
	}

	int get minApprovalDelta {
		return _minApprovalDelta;
	}

	List<UnresolvedAddress> get addressAdditions {
		return _addressAdditions;
	}

	List<UnresolvedAddress> get addressDeletions {
		return _addressDeletions;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set minRemovalDelta(int value) {
		_minRemovalDelta = value;
	}

	set minApprovalDelta(int value) {
		_minApprovalDelta = value;
	}

	set addressAdditions(List<UnresolvedAddress> value) {
		_addressAdditions = value;
	}

	set addressDeletions(List<UnresolvedAddress> value) {
		_addressDeletions = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_embeddedTransactionHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_minRemovalDelta, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_minApprovalDelta, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_addressAdditions.length, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_addressDeletions.length, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_multisigAccountModificationTransactionBodyReserved_1, 4));
		currentPos += 4;
		sort();
		var res_addressAdditions = ArrayHelpers.writeArray(buffer, _addressAdditions, currentPos);
		currentPos = res_addressAdditions.item2;
		buffer = res_addressAdditions.item1;
		sort();
		var res_addressDeletions = ArrayHelpers.writeArray(buffer, _addressDeletions, currentPos);
		currentPos = res_addressDeletions.item2;
		buffer = res_addressDeletions.item1;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'EmbeddedMultisigAccountModificationTransactionV1(';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'minRemovalDelta: "0x${_minRemovalDelta.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'minApprovalDelta: "0x${_minApprovalDelta.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'addressAdditions: "${_addressAdditions.map((e) => e.toString()).toList()}", ';
		result += 'addressDeletions: "${_addressDeletions.map((e) => e.toString()).toList()}", ';
		result += ')';
		return result;
	}
}


class AddressAliasTransactionV1 extends StructBase implements IDeserializable {
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

	Signature _signature = Signature();
	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	TransactionType _type = TransactionType.ACCOUNT_KEY_LINK;
	Amount _fee = Amount();
	Timestamp _deadline = Timestamp();
	NamespaceId _namespaceId = NamespaceId();
	Address _address = Address();
	AliasAction _aliasAction = AliasAction.UNLINK;
	final int _verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field

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
	}) 
		: super(signature == null && signerPublicKey == null && version == null && network == null && type == null && fee == null && deadline == null && namespaceId == null && address == null && aliasAction == null )
	{
		_signature = signature ?? Signature();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? AddressAliasTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? AddressAliasTransactionV1.TRANSACTION_TYPE;
		_fee = fee ?? Amount();
		_deadline = deadline ?? Timestamp();
		_namespaceId = namespaceId ?? NamespaceId();
		_address = address ?? Address();
		_aliasAction = aliasAction ?? AliasAction.UNLINK;
	}

	void sort() {
		// empty body
	}

	Signature get signature {
		return _signature;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	TransactionType get type {
		return _type;
	}

	Amount get fee {
		return _fee;
	}

	Timestamp get deadline {
		return _deadline;
	}

	NamespaceId get namespaceId {
		return _namespaceId;
	}

	Address get address {
		return _address;
	}

	AliasAction get aliasAction {
		return _aliasAction;
	}

	set signature(Signature value) {
		_signature = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set fee(Amount value) {
		_fee = value;
	}

	set deadline(Timestamp value) {
		_deadline = value;
	}

	set namespaceId(NamespaceId value) {
		_namespaceId = value;
	}

	set address(Address value) {
		_address = value;
	}

	set aliasAction(AliasAction value) {
		_aliasAction = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signature.size, _signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + _namespaceId.size, _namespaceId.serialize());
		currentPos += namespaceId.size;
		buffer.setRange(currentPos, currentPos + _address.size, _address.serialize());
		currentPos += address.size;
		buffer.setRange(currentPos, currentPos + _aliasAction.size, _aliasAction.serialize());
		currentPos += aliasAction.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'AddressAliasTransactionV1(';
		result += 'signature: "${_signature.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'fee: "${_fee.toString()}", ';
		result += 'deadline: "${_deadline.toString()}", ';
		result += 'namespaceId: "${_namespaceId.toString()}", ';
		result += 'address: "${_address.toString()}", ';
		result += 'aliasAction: "${_aliasAction.toString()}", ';
		result += ')';
		return result;
	}
}


class EmbeddedAddressAliasTransactionV1 extends StructBase implements IDeserializable, IEmbeddedTransaction {
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

	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	TransactionType _type = TransactionType.ACCOUNT_KEY_LINK;
	NamespaceId _namespaceId = NamespaceId();
	Address _address = Address();
	AliasAction _aliasAction = AliasAction.UNLINK;
	final int _embeddedTransactionHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field

	EmbeddedAddressAliasTransactionV1({ 
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	NamespaceId? namespaceId,
	Address? address,
	AliasAction? aliasAction
	}) 
		: super(signerPublicKey == null && version == null && network == null && type == null && namespaceId == null && address == null && aliasAction == null )
	{
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? EmbeddedAddressAliasTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? EmbeddedAddressAliasTransactionV1.TRANSACTION_TYPE;
		_namespaceId = namespaceId ?? NamespaceId();
		_address = address ?? Address();
		_aliasAction = aliasAction ?? AliasAction.UNLINK;
	}

	void sort() {
		// empty body
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	TransactionType get type {
		return _type;
	}

	NamespaceId get namespaceId {
		return _namespaceId;
	}

	Address get address {
		return _address;
	}

	AliasAction get aliasAction {
		return _aliasAction;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set namespaceId(NamespaceId value) {
		_namespaceId = value;
	}

	set address(Address value) {
		_address = value;
	}

	set aliasAction(AliasAction value) {
		_aliasAction = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_embeddedTransactionHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _namespaceId.size, _namespaceId.serialize());
		currentPos += namespaceId.size;
		buffer.setRange(currentPos, currentPos + _address.size, _address.serialize());
		currentPos += address.size;
		buffer.setRange(currentPos, currentPos + _aliasAction.size, _aliasAction.serialize());
		currentPos += aliasAction.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'EmbeddedAddressAliasTransactionV1(';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'namespaceId: "${_namespaceId.toString()}", ';
		result += 'address: "${_address.toString()}", ';
		result += 'aliasAction: "${_aliasAction.toString()}", ';
		result += ')';
		return result;
	}
}


class MosaicAliasTransactionV1 extends StructBase implements IDeserializable {
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

	Signature _signature = Signature();
	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	TransactionType _type = TransactionType.ACCOUNT_KEY_LINK;
	Amount _fee = Amount();
	Timestamp _deadline = Timestamp();
	NamespaceId _namespaceId = NamespaceId();
	MosaicId _mosaicId = MosaicId();
	AliasAction _aliasAction = AliasAction.UNLINK;
	final int _verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field

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
	}) 
		: super(signature == null && signerPublicKey == null && version == null && network == null && type == null && fee == null && deadline == null && namespaceId == null && mosaicId == null && aliasAction == null )
	{
		_signature = signature ?? Signature();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? MosaicAliasTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? MosaicAliasTransactionV1.TRANSACTION_TYPE;
		_fee = fee ?? Amount();
		_deadline = deadline ?? Timestamp();
		_namespaceId = namespaceId ?? NamespaceId();
		_mosaicId = mosaicId ?? MosaicId();
		_aliasAction = aliasAction ?? AliasAction.UNLINK;
	}

	void sort() {
		// empty body
	}

	Signature get signature {
		return _signature;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	TransactionType get type {
		return _type;
	}

	Amount get fee {
		return _fee;
	}

	Timestamp get deadline {
		return _deadline;
	}

	NamespaceId get namespaceId {
		return _namespaceId;
	}

	MosaicId get mosaicId {
		return _mosaicId;
	}

	AliasAction get aliasAction {
		return _aliasAction;
	}

	set signature(Signature value) {
		_signature = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set fee(Amount value) {
		_fee = value;
	}

	set deadline(Timestamp value) {
		_deadline = value;
	}

	set namespaceId(NamespaceId value) {
		_namespaceId = value;
	}

	set mosaicId(MosaicId value) {
		_mosaicId = value;
	}

	set aliasAction(AliasAction value) {
		_aliasAction = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signature.size, _signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + _namespaceId.size, _namespaceId.serialize());
		currentPos += namespaceId.size;
		buffer.setRange(currentPos, currentPos + _mosaicId.size, _mosaicId.serialize());
		currentPos += mosaicId.size;
		buffer.setRange(currentPos, currentPos + _aliasAction.size, _aliasAction.serialize());
		currentPos += aliasAction.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'MosaicAliasTransactionV1(';
		result += 'signature: "${_signature.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'fee: "${_fee.toString()}", ';
		result += 'deadline: "${_deadline.toString()}", ';
		result += 'namespaceId: "${_namespaceId.toString()}", ';
		result += 'mosaicId: "${_mosaicId.toString()}", ';
		result += 'aliasAction: "${_aliasAction.toString()}", ';
		result += ')';
		return result;
	}
}


class EmbeddedMosaicAliasTransactionV1 extends StructBase implements IDeserializable, IEmbeddedTransaction {
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

	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	TransactionType _type = TransactionType.ACCOUNT_KEY_LINK;
	NamespaceId _namespaceId = NamespaceId();
	MosaicId _mosaicId = MosaicId();
	AliasAction _aliasAction = AliasAction.UNLINK;
	final int _embeddedTransactionHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field

	EmbeddedMosaicAliasTransactionV1({ 
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	NamespaceId? namespaceId,
	MosaicId? mosaicId,
	AliasAction? aliasAction
	}) 
		: super(signerPublicKey == null && version == null && network == null && type == null && namespaceId == null && mosaicId == null && aliasAction == null )
	{
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? EmbeddedMosaicAliasTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? EmbeddedMosaicAliasTransactionV1.TRANSACTION_TYPE;
		_namespaceId = namespaceId ?? NamespaceId();
		_mosaicId = mosaicId ?? MosaicId();
		_aliasAction = aliasAction ?? AliasAction.UNLINK;
	}

	void sort() {
		// empty body
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	TransactionType get type {
		return _type;
	}

	NamespaceId get namespaceId {
		return _namespaceId;
	}

	MosaicId get mosaicId {
		return _mosaicId;
	}

	AliasAction get aliasAction {
		return _aliasAction;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set namespaceId(NamespaceId value) {
		_namespaceId = value;
	}

	set mosaicId(MosaicId value) {
		_mosaicId = value;
	}

	set aliasAction(AliasAction value) {
		_aliasAction = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_embeddedTransactionHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _namespaceId.size, _namespaceId.serialize());
		currentPos += namespaceId.size;
		buffer.setRange(currentPos, currentPos + _mosaicId.size, _mosaicId.serialize());
		currentPos += mosaicId.size;
		buffer.setRange(currentPos, currentPos + _aliasAction.size, _aliasAction.serialize());
		currentPos += aliasAction.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'EmbeddedMosaicAliasTransactionV1(';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'namespaceId: "${_namespaceId.toString()}", ';
		result += 'mosaicId: "${_mosaicId.toString()}", ';
		result += 'aliasAction: "${_aliasAction.toString()}", ';
		result += ')';
		return result;
	}
}


class NamespaceRegistrationTransactionV1 extends StructBase implements IDeserializable {
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

	Signature _signature = Signature();
	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	TransactionType _type = TransactionType.ACCOUNT_KEY_LINK;
	Amount _fee = Amount();
	Timestamp _deadline = Timestamp();
	BlockDuration _duration = BlockDuration();
	NamespaceId _parentId = NamespaceId();
	NamespaceId _id = NamespaceId();
	NamespaceRegistrationType _registrationType = NamespaceRegistrationType.ROOT;
	Uint8List _name = Uint8List(0);
	final int _verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field

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
	}) 
		: super(signature == null && signerPublicKey == null && version == null && network == null && type == null && fee == null && deadline == null && duration == null && parentId == null && id == null && registrationType == null && name == null )
	{
		_signature = signature ?? Signature();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? NamespaceRegistrationTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? NamespaceRegistrationTransactionV1.TRANSACTION_TYPE;
		_fee = fee ?? Amount();
		_deadline = deadline ?? Timestamp();
		_duration = duration ?? BlockDuration();
		_parentId = parentId ?? NamespaceId();
		_id = id ?? NamespaceId();
		_registrationType = registrationType ?? NamespaceRegistrationType.ROOT;
		_name = name ?? Uint8List(0);
	}

	void sort() {
		// empty body
	}

	Signature get signature {
		return _signature;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	TransactionType get type {
		return _type;
	}

	Amount get fee {
		return _fee;
	}

	Timestamp get deadline {
		return _deadline;
	}

	BlockDuration get duration {
		return _duration;
	}

	NamespaceId get parentId {
		return _parentId;
	}

	NamespaceId get id {
		return _id;
	}

	NamespaceRegistrationType get registrationType {
		return _registrationType;
	}

	Uint8List get name {
		return _name;
	}

	set signature(Signature value) {
		_signature = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set fee(Amount value) {
		_fee = value;
	}

	set deadline(Timestamp value) {
		_deadline = value;
	}

	set duration(BlockDuration value) {
		_duration = value;
	}

	set parentId(NamespaceId value) {
		_parentId = value;
	}

	set id(NamespaceId value) {
		_id = value;
	}

	set registrationType(NamespaceRegistrationType value) {
		_registrationType = value;
	}

	set name(Uint8List value) {
		_name = value;
	}

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
		if (NamespaceRegistrationType.ROOT.value == _registrationType.value)
		{
			size += duration.size;
		}
		if (NamespaceRegistrationType.CHILD.value == _registrationType.value)
		{
			size += parentId.size;
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
		// nothing to do for size
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
		var duration = BlockDuration();
		if (NamespaceRegistrationType.ROOT.value == registrationType.value)
		{
			duration = BlockDuration().deserialize(registrationTypeCondition);
			registrationTypeCondition = registrationTypeCondition.sublist(duration.size);
		}
		var parentId = NamespaceId();
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signature.size, _signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());
		currentPos += deadline.size;
		if (NamespaceRegistrationType.ROOT.value == _registrationType.value)
		{
			buffer.setRange(currentPos, currentPos + _duration.size, _duration.serialize());
			currentPos += duration.size;
		}
		if (NamespaceRegistrationType.CHILD.value == _registrationType.value)
		{
			buffer.setRange(currentPos, currentPos + _parentId.size, _parentId.serialize());
			currentPos += parentId.size;
		}
		buffer.setRange(currentPos, currentPos + _id.size, _id.serialize());
		currentPos += id.size;
		buffer.setRange(currentPos, currentPos + _registrationType.size, _registrationType.serialize());
		currentPos += registrationType.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_name.length, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _name.lengthInBytes, _name);
		currentPos += name.lengthInBytes;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'NamespaceRegistrationTransactionV1(';
		result += 'signature: "${_signature.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'fee: "${_fee.toString()}", ';
		result += 'deadline: "${_deadline.toString()}", ';
		if (NamespaceRegistrationType.ROOT.value == _registrationType.value)
		{
			result += 'duration: "${_duration.toString()}", ';
		}
		if (NamespaceRegistrationType.CHILD.value == _registrationType.value)
		{
			result += 'parentId: "${_parentId.toString()}", ';
		}
		result += 'id: "${_id.toString()}", ';
		result += 'registrationType: "${_registrationType.toString()}", ';
		result += 'name: "${hex.encode(_name.toList()).toUpperCase()}", ';
		result += ')';
		return result;
	}
}


class EmbeddedNamespaceRegistrationTransactionV1 extends StructBase implements IDeserializable, IEmbeddedTransaction {
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

	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	TransactionType _type = TransactionType.ACCOUNT_KEY_LINK;
	BlockDuration _duration = BlockDuration();
	NamespaceId _parentId = NamespaceId();
	NamespaceId _id = NamespaceId();
	NamespaceRegistrationType _registrationType = NamespaceRegistrationType.ROOT;
	Uint8List _name = Uint8List(0);
	final int _embeddedTransactionHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field

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
	}) 
		: super(signerPublicKey == null && version == null && network == null && type == null && duration == null && parentId == null && id == null && registrationType == null && name == null )
	{
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? EmbeddedNamespaceRegistrationTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? EmbeddedNamespaceRegistrationTransactionV1.TRANSACTION_TYPE;
		_duration = duration ?? BlockDuration();
		_parentId = parentId ?? NamespaceId();
		_id = id ?? NamespaceId();
		_registrationType = registrationType ?? NamespaceRegistrationType.ROOT;
		_name = name ?? Uint8List(0);
	}

	void sort() {
		// empty body
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	TransactionType get type {
		return _type;
	}

	BlockDuration get duration {
		return _duration;
	}

	NamespaceId get parentId {
		return _parentId;
	}

	NamespaceId get id {
		return _id;
	}

	NamespaceRegistrationType get registrationType {
		return _registrationType;
	}

	Uint8List get name {
		return _name;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set duration(BlockDuration value) {
		_duration = value;
	}

	set parentId(NamespaceId value) {
		_parentId = value;
	}

	set id(NamespaceId value) {
		_id = value;
	}

	set registrationType(NamespaceRegistrationType value) {
		_registrationType = value;
	}

	set name(Uint8List value) {
		_name = value;
	}

	int get size {
		var size = 0;
		size += 4;
		size += 4;
		size += signerPublicKey.size;
		size += 4;
		size += 1;
		size += network.size;
		size += type.size;
		if (NamespaceRegistrationType.ROOT.value == _registrationType.value)
		{
			size += duration.size;
		}
		if (NamespaceRegistrationType.CHILD.value == _registrationType.value)
		{
			size += parentId.size;
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
		// nothing to do for size
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
		var duration = BlockDuration();
		if (NamespaceRegistrationType.ROOT.value == registrationType.value)
		{
			duration = BlockDuration().deserialize(registrationTypeCondition);
			registrationTypeCondition = registrationTypeCondition.sublist(duration.size);
		}
		var parentId = NamespaceId();
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_embeddedTransactionHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		if (NamespaceRegistrationType.ROOT.value == _registrationType.value)
		{
			buffer.setRange(currentPos, currentPos + _duration.size, _duration.serialize());
			currentPos += duration.size;
		}
		if (NamespaceRegistrationType.CHILD.value == _registrationType.value)
		{
			buffer.setRange(currentPos, currentPos + _parentId.size, _parentId.serialize());
			currentPos += parentId.size;
		}
		buffer.setRange(currentPos, currentPos + _id.size, _id.serialize());
		currentPos += id.size;
		buffer.setRange(currentPos, currentPos + _registrationType.size, _registrationType.serialize());
		currentPos += registrationType.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_name.length, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _name.lengthInBytes, _name);
		currentPos += name.lengthInBytes;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'EmbeddedNamespaceRegistrationTransactionV1(';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		if (NamespaceRegistrationType.ROOT.value == _registrationType.value)
		{
			result += 'duration: "${_duration.toString()}", ';
		}
		if (NamespaceRegistrationType.CHILD.value == _registrationType.value)
		{
			result += 'parentId: "${_parentId.toString()}", ';
		}
		result += 'id: "${_id.toString()}", ';
		result += 'registrationType: "${_registrationType.toString()}", ';
		result += 'name: "${hex.encode(_name.toList()).toUpperCase()}", ';
		result += ')';
		return result;
	}
}


class AccountRestrictionFlags implements IDeserializable {
	static final ADDRESS = AccountRestrictionFlags(1);
	static final MOSAIC_ID = AccountRestrictionFlags(2);
	static final TRANSACTION_TYPE = AccountRestrictionFlags(4);
	static final OUTGOING = AccountRestrictionFlags(16384);
	static final BLOCK = AccountRestrictionFlags(32768);

	final int value;

	static final _flags = {
		1: 'ADDRESS',
		2: 'MOSAIC_ID',
		4: 'TRANSACTION_TYPE',
		16384: 'OUTGOING',
		32768: 'BLOCK',
	};

	AccountRestrictionFlags([int? _value]) : value = _value ?? 1;

	int get size {
		return 2;
	}

	@override
	AccountRestrictionFlags deserialize(Uint8List payload) {
		var byteData = ByteData.sublistView(payload);
		return AccountRestrictionFlags(byteData.getUint16(0, Endian.little));
	}

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


class AccountAddressRestrictionTransactionV1 extends StructBase implements IDeserializable {
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

	Signature _signature = Signature();
	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	TransactionType _type = TransactionType.ACCOUNT_KEY_LINK;
	Amount _fee = Amount();
	Timestamp _deadline = Timestamp();
	AccountRestrictionFlags _restrictionFlags = AccountRestrictionFlags.ADDRESS;
	List<UnresolvedAddress> _restrictionAdditions = [];
	List<UnresolvedAddress> _restrictionDeletions = [];
	final int _verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field
	final int _accountRestrictionTransactionBodyReserved_1 = 0; // reserved field

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
	}) 
		: super(signature == null && signerPublicKey == null && version == null && network == null && type == null && fee == null && deadline == null && restrictionFlags == null && restrictionAdditions == null && restrictionDeletions == null )
	{
		_signature = signature ?? Signature();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? AccountAddressRestrictionTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? AccountAddressRestrictionTransactionV1.TRANSACTION_TYPE;
		_fee = fee ?? Amount();
		_deadline = deadline ?? Timestamp();
		_restrictionFlags = restrictionFlags ?? AccountRestrictionFlags.ADDRESS;
		_restrictionAdditions = restrictionAdditions ?? [];
		_restrictionDeletions = restrictionDeletions ?? [];
	}

	void sort() {
		// empty body
	}

	Signature get signature {
		return _signature;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	TransactionType get type {
		return _type;
	}

	Amount get fee {
		return _fee;
	}

	Timestamp get deadline {
		return _deadline;
	}

	AccountRestrictionFlags get restrictionFlags {
		return _restrictionFlags;
	}

	List<UnresolvedAddress> get restrictionAdditions {
		return _restrictionAdditions;
	}

	List<UnresolvedAddress> get restrictionDeletions {
		return _restrictionDeletions;
	}

	set signature(Signature value) {
		_signature = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set fee(Amount value) {
		_fee = value;
	}

	set deadline(Timestamp value) {
		_deadline = value;
	}

	set restrictionFlags(AccountRestrictionFlags value) {
		_restrictionFlags = value;
	}

	set restrictionAdditions(List<UnresolvedAddress> value) {
		_restrictionAdditions = value;
	}

	set restrictionDeletions(List<UnresolvedAddress> value) {
		_restrictionDeletions = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signature.size, _signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + _restrictionFlags.size, _restrictionFlags.serialize());
		currentPos += restrictionFlags.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_restrictionAdditions.length, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_restrictionDeletions.length, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_accountRestrictionTransactionBodyReserved_1, 4));
		currentPos += 4;
		sort();
		var res_restrictionAdditions = ArrayHelpers.writeArray(buffer, _restrictionAdditions, currentPos);
		currentPos = res_restrictionAdditions.item2;
		buffer = res_restrictionAdditions.item1;
		sort();
		var res_restrictionDeletions = ArrayHelpers.writeArray(buffer, _restrictionDeletions, currentPos);
		currentPos = res_restrictionDeletions.item2;
		buffer = res_restrictionDeletions.item1;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'AccountAddressRestrictionTransactionV1(';
		result += 'signature: "${_signature.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'fee: "${_fee.toString()}", ';
		result += 'deadline: "${_deadline.toString()}", ';
		result += 'restrictionFlags: "${_restrictionFlags.toString()}", ';
		result += 'restrictionAdditions: "${_restrictionAdditions.map((e) => e.toString()).toList()}", ';
		result += 'restrictionDeletions: "${_restrictionDeletions.map((e) => e.toString()).toList()}", ';
		result += ')';
		return result;
	}
}


class EmbeddedAccountAddressRestrictionTransactionV1 extends StructBase implements IDeserializable, IEmbeddedTransaction {
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

	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	TransactionType _type = TransactionType.ACCOUNT_KEY_LINK;
	AccountRestrictionFlags _restrictionFlags = AccountRestrictionFlags.ADDRESS;
	List<UnresolvedAddress> _restrictionAdditions = [];
	List<UnresolvedAddress> _restrictionDeletions = [];
	final int _embeddedTransactionHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field
	final int _accountRestrictionTransactionBodyReserved_1 = 0; // reserved field

	EmbeddedAccountAddressRestrictionTransactionV1({ 
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	AccountRestrictionFlags? restrictionFlags,
	List<UnresolvedAddress>? restrictionAdditions,
	List<UnresolvedAddress>? restrictionDeletions
	}) 
		: super(signerPublicKey == null && version == null && network == null && type == null && restrictionFlags == null && restrictionAdditions == null && restrictionDeletions == null )
	{
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? EmbeddedAccountAddressRestrictionTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? EmbeddedAccountAddressRestrictionTransactionV1.TRANSACTION_TYPE;
		_restrictionFlags = restrictionFlags ?? AccountRestrictionFlags.ADDRESS;
		_restrictionAdditions = restrictionAdditions ?? [];
		_restrictionDeletions = restrictionDeletions ?? [];
	}

	void sort() {
		// empty body
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	TransactionType get type {
		return _type;
	}

	AccountRestrictionFlags get restrictionFlags {
		return _restrictionFlags;
	}

	List<UnresolvedAddress> get restrictionAdditions {
		return _restrictionAdditions;
	}

	List<UnresolvedAddress> get restrictionDeletions {
		return _restrictionDeletions;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set restrictionFlags(AccountRestrictionFlags value) {
		_restrictionFlags = value;
	}

	set restrictionAdditions(List<UnresolvedAddress> value) {
		_restrictionAdditions = value;
	}

	set restrictionDeletions(List<UnresolvedAddress> value) {
		_restrictionDeletions = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_embeddedTransactionHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _restrictionFlags.size, _restrictionFlags.serialize());
		currentPos += restrictionFlags.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_restrictionAdditions.length, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_restrictionDeletions.length, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_accountRestrictionTransactionBodyReserved_1, 4));
		currentPos += 4;
		sort();
		var res_restrictionAdditions = ArrayHelpers.writeArray(buffer, _restrictionAdditions, currentPos);
		currentPos = res_restrictionAdditions.item2;
		buffer = res_restrictionAdditions.item1;
		sort();
		var res_restrictionDeletions = ArrayHelpers.writeArray(buffer, _restrictionDeletions, currentPos);
		currentPos = res_restrictionDeletions.item2;
		buffer = res_restrictionDeletions.item1;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'EmbeddedAccountAddressRestrictionTransactionV1(';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'restrictionFlags: "${_restrictionFlags.toString()}", ';
		result += 'restrictionAdditions: "${_restrictionAdditions.map((e) => e.toString()).toList()}", ';
		result += 'restrictionDeletions: "${_restrictionDeletions.map((e) => e.toString()).toList()}", ';
		result += ')';
		return result;
	}
}


class AccountMosaicRestrictionTransactionV1 extends StructBase implements IDeserializable {
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

	Signature _signature = Signature();
	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	TransactionType _type = TransactionType.ACCOUNT_KEY_LINK;
	Amount _fee = Amount();
	Timestamp _deadline = Timestamp();
	AccountRestrictionFlags _restrictionFlags = AccountRestrictionFlags.ADDRESS;
	List<UnresolvedMosaicId> _restrictionAdditions = [];
	List<UnresolvedMosaicId> _restrictionDeletions = [];
	final int _verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field
	final int _accountRestrictionTransactionBodyReserved_1 = 0; // reserved field

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
	}) 
		: super(signature == null && signerPublicKey == null && version == null && network == null && type == null && fee == null && deadline == null && restrictionFlags == null && restrictionAdditions == null && restrictionDeletions == null )
	{
		_signature = signature ?? Signature();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? AccountMosaicRestrictionTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? AccountMosaicRestrictionTransactionV1.TRANSACTION_TYPE;
		_fee = fee ?? Amount();
		_deadline = deadline ?? Timestamp();
		_restrictionFlags = restrictionFlags ?? AccountRestrictionFlags.ADDRESS;
		_restrictionAdditions = restrictionAdditions ?? [];
		_restrictionDeletions = restrictionDeletions ?? [];
	}

	void sort() {
		// empty body
	}

	Signature get signature {
		return _signature;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	TransactionType get type {
		return _type;
	}

	Amount get fee {
		return _fee;
	}

	Timestamp get deadline {
		return _deadline;
	}

	AccountRestrictionFlags get restrictionFlags {
		return _restrictionFlags;
	}

	List<UnresolvedMosaicId> get restrictionAdditions {
		return _restrictionAdditions;
	}

	List<UnresolvedMosaicId> get restrictionDeletions {
		return _restrictionDeletions;
	}

	set signature(Signature value) {
		_signature = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set fee(Amount value) {
		_fee = value;
	}

	set deadline(Timestamp value) {
		_deadline = value;
	}

	set restrictionFlags(AccountRestrictionFlags value) {
		_restrictionFlags = value;
	}

	set restrictionAdditions(List<UnresolvedMosaicId> value) {
		_restrictionAdditions = value;
	}

	set restrictionDeletions(List<UnresolvedMosaicId> value) {
		_restrictionDeletions = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signature.size, _signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + _restrictionFlags.size, _restrictionFlags.serialize());
		currentPos += restrictionFlags.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_restrictionAdditions.length, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_restrictionDeletions.length, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_accountRestrictionTransactionBodyReserved_1, 4));
		currentPos += 4;
		sort();
		var res_restrictionAdditions = ArrayHelpers.writeArray(buffer, _restrictionAdditions, currentPos);
		currentPos = res_restrictionAdditions.item2;
		buffer = res_restrictionAdditions.item1;
		sort();
		var res_restrictionDeletions = ArrayHelpers.writeArray(buffer, _restrictionDeletions, currentPos);
		currentPos = res_restrictionDeletions.item2;
		buffer = res_restrictionDeletions.item1;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'AccountMosaicRestrictionTransactionV1(';
		result += 'signature: "${_signature.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'fee: "${_fee.toString()}", ';
		result += 'deadline: "${_deadline.toString()}", ';
		result += 'restrictionFlags: "${_restrictionFlags.toString()}", ';
		result += 'restrictionAdditions: "${_restrictionAdditions.map((e) => e.toString()).toList()}", ';
		result += 'restrictionDeletions: "${_restrictionDeletions.map((e) => e.toString()).toList()}", ';
		result += ')';
		return result;
	}
}


class EmbeddedAccountMosaicRestrictionTransactionV1 extends StructBase implements IDeserializable, IEmbeddedTransaction {
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

	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	TransactionType _type = TransactionType.ACCOUNT_KEY_LINK;
	AccountRestrictionFlags _restrictionFlags = AccountRestrictionFlags.ADDRESS;
	List<UnresolvedMosaicId> _restrictionAdditions = [];
	List<UnresolvedMosaicId> _restrictionDeletions = [];
	final int _embeddedTransactionHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field
	final int _accountRestrictionTransactionBodyReserved_1 = 0; // reserved field

	EmbeddedAccountMosaicRestrictionTransactionV1({ 
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	AccountRestrictionFlags? restrictionFlags,
	List<UnresolvedMosaicId>? restrictionAdditions,
	List<UnresolvedMosaicId>? restrictionDeletions
	}) 
		: super(signerPublicKey == null && version == null && network == null && type == null && restrictionFlags == null && restrictionAdditions == null && restrictionDeletions == null )
	{
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? EmbeddedAccountMosaicRestrictionTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? EmbeddedAccountMosaicRestrictionTransactionV1.TRANSACTION_TYPE;
		_restrictionFlags = restrictionFlags ?? AccountRestrictionFlags.ADDRESS;
		_restrictionAdditions = restrictionAdditions ?? [];
		_restrictionDeletions = restrictionDeletions ?? [];
	}

	void sort() {
		// empty body
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	TransactionType get type {
		return _type;
	}

	AccountRestrictionFlags get restrictionFlags {
		return _restrictionFlags;
	}

	List<UnresolvedMosaicId> get restrictionAdditions {
		return _restrictionAdditions;
	}

	List<UnresolvedMosaicId> get restrictionDeletions {
		return _restrictionDeletions;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set restrictionFlags(AccountRestrictionFlags value) {
		_restrictionFlags = value;
	}

	set restrictionAdditions(List<UnresolvedMosaicId> value) {
		_restrictionAdditions = value;
	}

	set restrictionDeletions(List<UnresolvedMosaicId> value) {
		_restrictionDeletions = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_embeddedTransactionHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _restrictionFlags.size, _restrictionFlags.serialize());
		currentPos += restrictionFlags.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_restrictionAdditions.length, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_restrictionDeletions.length, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_accountRestrictionTransactionBodyReserved_1, 4));
		currentPos += 4;
		sort();
		var res_restrictionAdditions = ArrayHelpers.writeArray(buffer, _restrictionAdditions, currentPos);
		currentPos = res_restrictionAdditions.item2;
		buffer = res_restrictionAdditions.item1;
		sort();
		var res_restrictionDeletions = ArrayHelpers.writeArray(buffer, _restrictionDeletions, currentPos);
		currentPos = res_restrictionDeletions.item2;
		buffer = res_restrictionDeletions.item1;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'EmbeddedAccountMosaicRestrictionTransactionV1(';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'restrictionFlags: "${_restrictionFlags.toString()}", ';
		result += 'restrictionAdditions: "${_restrictionAdditions.map((e) => e.toString()).toList()}", ';
		result += 'restrictionDeletions: "${_restrictionDeletions.map((e) => e.toString()).toList()}", ';
		result += ')';
		return result;
	}
}


class AccountOperationRestrictionTransactionV1 extends StructBase implements IDeserializable {
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

	Signature _signature = Signature();
	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	TransactionType _type = TransactionType.ACCOUNT_KEY_LINK;
	Amount _fee = Amount();
	Timestamp _deadline = Timestamp();
	AccountRestrictionFlags _restrictionFlags = AccountRestrictionFlags.ADDRESS;
	List<TransactionType> _restrictionAdditions = [];
	List<TransactionType> _restrictionDeletions = [];
	final int _verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field
	final int _accountRestrictionTransactionBodyReserved_1 = 0; // reserved field

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
	}) 
		: super(signature == null && signerPublicKey == null && version == null && network == null && type == null && fee == null && deadline == null && restrictionFlags == null && restrictionAdditions == null && restrictionDeletions == null )
	{
		_signature = signature ?? Signature();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? AccountOperationRestrictionTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? AccountOperationRestrictionTransactionV1.TRANSACTION_TYPE;
		_fee = fee ?? Amount();
		_deadline = deadline ?? Timestamp();
		_restrictionFlags = restrictionFlags ?? AccountRestrictionFlags.ADDRESS;
		_restrictionAdditions = restrictionAdditions ?? [];
		_restrictionDeletions = restrictionDeletions ?? [];
	}

	void sort() {
		// empty body
	}

	Signature get signature {
		return _signature;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	TransactionType get type {
		return _type;
	}

	Amount get fee {
		return _fee;
	}

	Timestamp get deadline {
		return _deadline;
	}

	AccountRestrictionFlags get restrictionFlags {
		return _restrictionFlags;
	}

	List<TransactionType> get restrictionAdditions {
		return _restrictionAdditions;
	}

	List<TransactionType> get restrictionDeletions {
		return _restrictionDeletions;
	}

	set signature(Signature value) {
		_signature = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set fee(Amount value) {
		_fee = value;
	}

	set deadline(Timestamp value) {
		_deadline = value;
	}

	set restrictionFlags(AccountRestrictionFlags value) {
		_restrictionFlags = value;
	}

	set restrictionAdditions(List<TransactionType> value) {
		_restrictionAdditions = value;
	}

	set restrictionDeletions(List<TransactionType> value) {
		_restrictionDeletions = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signature.size, _signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + _restrictionFlags.size, _restrictionFlags.serialize());
		currentPos += restrictionFlags.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_restrictionAdditions.length, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_restrictionDeletions.length, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_accountRestrictionTransactionBodyReserved_1, 4));
		currentPos += 4;
		sort();
		var res_restrictionAdditions = ArrayHelpers.writeArray(buffer, _restrictionAdditions, currentPos);
		currentPos = res_restrictionAdditions.item2;
		buffer = res_restrictionAdditions.item1;
		sort();
		var res_restrictionDeletions = ArrayHelpers.writeArray(buffer, _restrictionDeletions, currentPos);
		currentPos = res_restrictionDeletions.item2;
		buffer = res_restrictionDeletions.item1;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'AccountOperationRestrictionTransactionV1(';
		result += 'signature: "${_signature.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'fee: "${_fee.toString()}", ';
		result += 'deadline: "${_deadline.toString()}", ';
		result += 'restrictionFlags: "${_restrictionFlags.toString()}", ';
		result += 'restrictionAdditions: "${_restrictionAdditions.map((e) => e.toString()).toList()}", ';
		result += 'restrictionDeletions: "${_restrictionDeletions.map((e) => e.toString()).toList()}", ';
		result += ')';
		return result;
	}
}


class EmbeddedAccountOperationRestrictionTransactionV1 extends StructBase implements IDeserializable, IEmbeddedTransaction {
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

	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	TransactionType _type = TransactionType.ACCOUNT_KEY_LINK;
	AccountRestrictionFlags _restrictionFlags = AccountRestrictionFlags.ADDRESS;
	List<TransactionType> _restrictionAdditions = [];
	List<TransactionType> _restrictionDeletions = [];
	final int _embeddedTransactionHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field
	final int _accountRestrictionTransactionBodyReserved_1 = 0; // reserved field

	EmbeddedAccountOperationRestrictionTransactionV1({ 
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	AccountRestrictionFlags? restrictionFlags,
	List<TransactionType>? restrictionAdditions,
	List<TransactionType>? restrictionDeletions
	}) 
		: super(signerPublicKey == null && version == null && network == null && type == null && restrictionFlags == null && restrictionAdditions == null && restrictionDeletions == null )
	{
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? EmbeddedAccountOperationRestrictionTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? EmbeddedAccountOperationRestrictionTransactionV1.TRANSACTION_TYPE;
		_restrictionFlags = restrictionFlags ?? AccountRestrictionFlags.ADDRESS;
		_restrictionAdditions = restrictionAdditions ?? [];
		_restrictionDeletions = restrictionDeletions ?? [];
	}

	void sort() {
		// empty body
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	TransactionType get type {
		return _type;
	}

	AccountRestrictionFlags get restrictionFlags {
		return _restrictionFlags;
	}

	List<TransactionType> get restrictionAdditions {
		return _restrictionAdditions;
	}

	List<TransactionType> get restrictionDeletions {
		return _restrictionDeletions;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set restrictionFlags(AccountRestrictionFlags value) {
		_restrictionFlags = value;
	}

	set restrictionAdditions(List<TransactionType> value) {
		_restrictionAdditions = value;
	}

	set restrictionDeletions(List<TransactionType> value) {
		_restrictionDeletions = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_embeddedTransactionHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _restrictionFlags.size, _restrictionFlags.serialize());
		currentPos += restrictionFlags.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_restrictionAdditions.length, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_restrictionDeletions.length, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_accountRestrictionTransactionBodyReserved_1, 4));
		currentPos += 4;
		sort();
		var res_restrictionAdditions = ArrayHelpers.writeArray(buffer, _restrictionAdditions, currentPos);
		currentPos = res_restrictionAdditions.item2;
		buffer = res_restrictionAdditions.item1;
		sort();
		var res_restrictionDeletions = ArrayHelpers.writeArray(buffer, _restrictionDeletions, currentPos);
		currentPos = res_restrictionDeletions.item2;
		buffer = res_restrictionDeletions.item1;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'EmbeddedAccountOperationRestrictionTransactionV1(';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'restrictionFlags: "${_restrictionFlags.toString()}", ';
		result += 'restrictionAdditions: "${_restrictionAdditions.map((e) => e.toString()).toList()}", ';
		result += 'restrictionDeletions: "${_restrictionDeletions.map((e) => e.toString()).toList()}", ';
		result += ')';
		return result;
	}
}


class MosaicAddressRestrictionTransactionV1 extends StructBase implements IDeserializable {
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

	Signature _signature = Signature();
	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	TransactionType _type = TransactionType.ACCOUNT_KEY_LINK;
	Amount _fee = Amount();
	Timestamp _deadline = Timestamp();
	UnresolvedMosaicId _mosaicId = UnresolvedMosaicId();
	int _restrictionKey = 0;
	int _previousRestrictionValue = 0;
	int _newRestrictionValue = 0;
	UnresolvedAddress _targetAddress = UnresolvedAddress();
	final int _verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field

	MosaicAddressRestrictionTransactionV1({ 
	Signature? signature,
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	Amount? fee,
	Timestamp? deadline,
	UnresolvedMosaicId? mosaicId,
	int? restrictionKey,
	int? previousRestrictionValue,
	int? newRestrictionValue,
	UnresolvedAddress? targetAddress
	}) 
		: super(signature == null && signerPublicKey == null && version == null && network == null && type == null && fee == null && deadline == null && mosaicId == null && restrictionKey == null && previousRestrictionValue == null && newRestrictionValue == null && targetAddress == null )
	{
		_signature = signature ?? Signature();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? MosaicAddressRestrictionTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? MosaicAddressRestrictionTransactionV1.TRANSACTION_TYPE;
		_fee = fee ?? Amount();
		_deadline = deadline ?? Timestamp();
		_mosaicId = mosaicId ?? UnresolvedMosaicId();
		_restrictionKey = restrictionKey ?? 0;
		_previousRestrictionValue = previousRestrictionValue ?? 0;
		_newRestrictionValue = newRestrictionValue ?? 0;
		_targetAddress = targetAddress ?? UnresolvedAddress();
	}

	void sort() {
		// empty body
	}

	Signature get signature {
		return _signature;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	TransactionType get type {
		return _type;
	}

	Amount get fee {
		return _fee;
	}

	Timestamp get deadline {
		return _deadline;
	}

	UnresolvedMosaicId get mosaicId {
		return _mosaicId;
	}

	int get restrictionKey {
		return _restrictionKey;
	}

	int get previousRestrictionValue {
		return _previousRestrictionValue;
	}

	int get newRestrictionValue {
		return _newRestrictionValue;
	}

	UnresolvedAddress get targetAddress {
		return _targetAddress;
	}

	set signature(Signature value) {
		_signature = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set fee(Amount value) {
		_fee = value;
	}

	set deadline(Timestamp value) {
		_deadline = value;
	}

	set mosaicId(UnresolvedMosaicId value) {
		_mosaicId = value;
	}

	set restrictionKey(int value) {
		_restrictionKey = value;
	}

	set previousRestrictionValue(int value) {
		_previousRestrictionValue = value;
	}

	set newRestrictionValue(int value) {
		_newRestrictionValue = value;
	}

	set targetAddress(UnresolvedAddress value) {
		_targetAddress = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signature.size, _signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + _mosaicId.size, _mosaicId.serialize());
		currentPos += mosaicId.size;
		buffer.setRange(currentPos, currentPos + 8, intToBytes(_restrictionKey, 8));
		currentPos += 8;
		buffer.setRange(currentPos, currentPos + 8, intToBytes(_previousRestrictionValue, 8));
		currentPos += 8;
		buffer.setRange(currentPos, currentPos + 8, intToBytes(_newRestrictionValue, 8));
		currentPos += 8;
		buffer.setRange(currentPos, currentPos + _targetAddress.size, _targetAddress.serialize());
		currentPos += targetAddress.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'MosaicAddressRestrictionTransactionV1(';
		result += 'signature: "${_signature.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'fee: "${_fee.toString()}", ';
		result += 'deadline: "${_deadline.toString()}", ';
		result += 'mosaicId: "${_mosaicId.toString()}", ';
		result += 'restrictionKey: "0x${_restrictionKey.toRadixString(16).padLeft(8 * 2, '0').toUpperCase()}", ';
		result += 'previousRestrictionValue: "0x${_previousRestrictionValue.toRadixString(16).padLeft(8 * 2, '0').toUpperCase()}", ';
		result += 'newRestrictionValue: "0x${_newRestrictionValue.toRadixString(16).padLeft(8 * 2, '0').toUpperCase()}", ';
		result += 'targetAddress: "${_targetAddress.toString()}", ';
		result += ')';
		return result;
	}
}


class EmbeddedMosaicAddressRestrictionTransactionV1 extends StructBase implements IDeserializable, IEmbeddedTransaction {
	static const int TRANSACTION_VERSION = 1;
	static final TransactionType TRANSACTION_TYPE = TransactionType(TransactionType.MOSAIC_ADDRESS_RESTRICTION.value);

	static const Map<String, String> TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type': 'enum:TransactionType',
		'mosaicId': 'pod:UnresolvedMosaicId',
		'targetAddress': 'pod:UnresolvedAddress'
	};

	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	TransactionType _type = TransactionType.ACCOUNT_KEY_LINK;
	UnresolvedMosaicId _mosaicId = UnresolvedMosaicId();
	int _restrictionKey = 0;
	int _previousRestrictionValue = 0;
	int _newRestrictionValue = 0;
	UnresolvedAddress _targetAddress = UnresolvedAddress();
	final int _embeddedTransactionHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field

	EmbeddedMosaicAddressRestrictionTransactionV1({ 
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	UnresolvedMosaicId? mosaicId,
	int? restrictionKey,
	int? previousRestrictionValue,
	int? newRestrictionValue,
	UnresolvedAddress? targetAddress
	}) 
		: super(signerPublicKey == null && version == null && network == null && type == null && mosaicId == null && restrictionKey == null && previousRestrictionValue == null && newRestrictionValue == null && targetAddress == null )
	{
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? EmbeddedMosaicAddressRestrictionTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? EmbeddedMosaicAddressRestrictionTransactionV1.TRANSACTION_TYPE;
		_mosaicId = mosaicId ?? UnresolvedMosaicId();
		_restrictionKey = restrictionKey ?? 0;
		_previousRestrictionValue = previousRestrictionValue ?? 0;
		_newRestrictionValue = newRestrictionValue ?? 0;
		_targetAddress = targetAddress ?? UnresolvedAddress();
	}

	void sort() {
		// empty body
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	TransactionType get type {
		return _type;
	}

	UnresolvedMosaicId get mosaicId {
		return _mosaicId;
	}

	int get restrictionKey {
		return _restrictionKey;
	}

	int get previousRestrictionValue {
		return _previousRestrictionValue;
	}

	int get newRestrictionValue {
		return _newRestrictionValue;
	}

	UnresolvedAddress get targetAddress {
		return _targetAddress;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set mosaicId(UnresolvedMosaicId value) {
		_mosaicId = value;
	}

	set restrictionKey(int value) {
		_restrictionKey = value;
	}

	set previousRestrictionValue(int value) {
		_previousRestrictionValue = value;
	}

	set newRestrictionValue(int value) {
		_newRestrictionValue = value;
	}

	set targetAddress(UnresolvedAddress value) {
		_targetAddress = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_embeddedTransactionHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _mosaicId.size, _mosaicId.serialize());
		currentPos += mosaicId.size;
		buffer.setRange(currentPos, currentPos + 8, intToBytes(_restrictionKey, 8));
		currentPos += 8;
		buffer.setRange(currentPos, currentPos + 8, intToBytes(_previousRestrictionValue, 8));
		currentPos += 8;
		buffer.setRange(currentPos, currentPos + 8, intToBytes(_newRestrictionValue, 8));
		currentPos += 8;
		buffer.setRange(currentPos, currentPos + _targetAddress.size, _targetAddress.serialize());
		currentPos += targetAddress.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'EmbeddedMosaicAddressRestrictionTransactionV1(';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'mosaicId: "${_mosaicId.toString()}", ';
		result += 'restrictionKey: "0x${_restrictionKey.toRadixString(16).padLeft(8 * 2, '0').toUpperCase()}", ';
		result += 'previousRestrictionValue: "0x${_previousRestrictionValue.toRadixString(16).padLeft(8 * 2, '0').toUpperCase()}", ';
		result += 'newRestrictionValue: "0x${_newRestrictionValue.toRadixString(16).padLeft(8 * 2, '0').toUpperCase()}", ';
		result += 'targetAddress: "${_targetAddress.toString()}", ';
		result += ')';
		return result;
	}
}


class MosaicRestrictionKey extends BaseValue implements IDeserializable {
	static const int SIZE = 8;

	MosaicRestrictionKey([dynamic mosaicRestrictionKey]) : super(SIZE, mosaicRestrictionKey ?? 0);

	@override
	MosaicRestrictionKey deserialize(Uint8List payload) {
		return MosaicRestrictionKey(bytesToInt(payload.sublist(0, 8), 8));
	}

	Uint8List serialize() {
		var buffer = Uint8List(SIZE);
		buffer.setRange(0, 0 + 8, intToBytes(value, 8));
		return buffer;
	}
}


class MosaicRestrictionType implements IDeserializable {
	static final NONE = MosaicRestrictionType(0);
	static final EQ = MosaicRestrictionType(1);
	static final NE = MosaicRestrictionType(2);
	static final LT = MosaicRestrictionType(3);
	static final LE = MosaicRestrictionType(4);
	static final GT = MosaicRestrictionType(5);
	static final GE = MosaicRestrictionType(6);

	final int value;

	static final _flags = {
		0: 'NONE',
		1: 'EQ',
		2: 'NE',
		3: 'LT',
		4: 'LE',
		5: 'GT',
		6: 'GE',
	};

	MosaicRestrictionType([int? _value]) : value = _value ?? 0;

	int get size {
		return 1;
	}

	@override
	MosaicRestrictionType deserialize(Uint8List payload) {
		var byteData = ByteData.sublistView(payload);
		return MosaicRestrictionType(byteData.getUint8(0));
	}

	Uint8List serialize() {
		var byteData = ByteData(1)..setUint8(0, value);
		return byteData.buffer.asUint8List();
	}

	@override
	String toString() {
		return 'MosaicRestrictionType.${_flags[value]}';
	}
}


class MosaicGlobalRestrictionTransactionV1 extends StructBase implements IDeserializable {
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

	Signature _signature = Signature();
	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	TransactionType _type = TransactionType.ACCOUNT_KEY_LINK;
	Amount _fee = Amount();
	Timestamp _deadline = Timestamp();
	UnresolvedMosaicId _mosaicId = UnresolvedMosaicId();
	UnresolvedMosaicId _referenceMosaicId = UnresolvedMosaicId();
	int _restrictionKey = 0;
	int _previousRestrictionValue = 0;
	int _newRestrictionValue = 0;
	MosaicRestrictionType _previousRestrictionType = MosaicRestrictionType.NONE;
	MosaicRestrictionType _newRestrictionType = MosaicRestrictionType.NONE;
	final int _verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field

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
	int? restrictionKey,
	int? previousRestrictionValue,
	int? newRestrictionValue,
	MosaicRestrictionType? previousRestrictionType,
	MosaicRestrictionType? newRestrictionType
	}) 
		: super(signature == null && signerPublicKey == null && version == null && network == null && type == null && fee == null && deadline == null && mosaicId == null && referenceMosaicId == null && restrictionKey == null && previousRestrictionValue == null && newRestrictionValue == null && previousRestrictionType == null && newRestrictionType == null )
	{
		_signature = signature ?? Signature();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? MosaicGlobalRestrictionTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? MosaicGlobalRestrictionTransactionV1.TRANSACTION_TYPE;
		_fee = fee ?? Amount();
		_deadline = deadline ?? Timestamp();
		_mosaicId = mosaicId ?? UnresolvedMosaicId();
		_referenceMosaicId = referenceMosaicId ?? UnresolvedMosaicId();
		_restrictionKey = restrictionKey ?? 0;
		_previousRestrictionValue = previousRestrictionValue ?? 0;
		_newRestrictionValue = newRestrictionValue ?? 0;
		_previousRestrictionType = previousRestrictionType ?? MosaicRestrictionType.NONE;
		_newRestrictionType = newRestrictionType ?? MosaicRestrictionType.NONE;
	}

	void sort() {
		// empty body
	}

	Signature get signature {
		return _signature;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	TransactionType get type {
		return _type;
	}

	Amount get fee {
		return _fee;
	}

	Timestamp get deadline {
		return _deadline;
	}

	UnresolvedMosaicId get mosaicId {
		return _mosaicId;
	}

	UnresolvedMosaicId get referenceMosaicId {
		return _referenceMosaicId;
	}

	int get restrictionKey {
		return _restrictionKey;
	}

	int get previousRestrictionValue {
		return _previousRestrictionValue;
	}

	int get newRestrictionValue {
		return _newRestrictionValue;
	}

	MosaicRestrictionType get previousRestrictionType {
		return _previousRestrictionType;
	}

	MosaicRestrictionType get newRestrictionType {
		return _newRestrictionType;
	}

	set signature(Signature value) {
		_signature = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set fee(Amount value) {
		_fee = value;
	}

	set deadline(Timestamp value) {
		_deadline = value;
	}

	set mosaicId(UnresolvedMosaicId value) {
		_mosaicId = value;
	}

	set referenceMosaicId(UnresolvedMosaicId value) {
		_referenceMosaicId = value;
	}

	set restrictionKey(int value) {
		_restrictionKey = value;
	}

	set previousRestrictionValue(int value) {
		_previousRestrictionValue = value;
	}

	set newRestrictionValue(int value) {
		_newRestrictionValue = value;
	}

	set previousRestrictionType(MosaicRestrictionType value) {
		_previousRestrictionType = value;
	}

	set newRestrictionType(MosaicRestrictionType value) {
		_newRestrictionType = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signature.size, _signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + _mosaicId.size, _mosaicId.serialize());
		currentPos += mosaicId.size;
		buffer.setRange(currentPos, currentPos + _referenceMosaicId.size, _referenceMosaicId.serialize());
		currentPos += referenceMosaicId.size;
		buffer.setRange(currentPos, currentPos + 8, intToBytes(_restrictionKey, 8));
		currentPos += 8;
		buffer.setRange(currentPos, currentPos + 8, intToBytes(_previousRestrictionValue, 8));
		currentPos += 8;
		buffer.setRange(currentPos, currentPos + 8, intToBytes(_newRestrictionValue, 8));
		currentPos += 8;
		buffer.setRange(currentPos, currentPos + _previousRestrictionType.size, _previousRestrictionType.serialize());
		currentPos += previousRestrictionType.size;
		buffer.setRange(currentPos, currentPos + _newRestrictionType.size, _newRestrictionType.serialize());
		currentPos += newRestrictionType.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'MosaicGlobalRestrictionTransactionV1(';
		result += 'signature: "${_signature.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'fee: "${_fee.toString()}", ';
		result += 'deadline: "${_deadline.toString()}", ';
		result += 'mosaicId: "${_mosaicId.toString()}", ';
		result += 'referenceMosaicId: "${_referenceMosaicId.toString()}", ';
		result += 'restrictionKey: "0x${_restrictionKey.toRadixString(16).padLeft(8 * 2, '0').toUpperCase()}", ';
		result += 'previousRestrictionValue: "0x${_previousRestrictionValue.toRadixString(16).padLeft(8 * 2, '0').toUpperCase()}", ';
		result += 'newRestrictionValue: "0x${_newRestrictionValue.toRadixString(16).padLeft(8 * 2, '0').toUpperCase()}", ';
		result += 'previousRestrictionType: "${_previousRestrictionType.toString()}", ';
		result += 'newRestrictionType: "${_newRestrictionType.toString()}", ';
		result += ')';
		return result;
	}
}


class EmbeddedMosaicGlobalRestrictionTransactionV1 extends StructBase implements IDeserializable, IEmbeddedTransaction {
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

	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	TransactionType _type = TransactionType.ACCOUNT_KEY_LINK;
	UnresolvedMosaicId _mosaicId = UnresolvedMosaicId();
	UnresolvedMosaicId _referenceMosaicId = UnresolvedMosaicId();
	int _restrictionKey = 0;
	int _previousRestrictionValue = 0;
	int _newRestrictionValue = 0;
	MosaicRestrictionType _previousRestrictionType = MosaicRestrictionType.NONE;
	MosaicRestrictionType _newRestrictionType = MosaicRestrictionType.NONE;
	final int _embeddedTransactionHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field

	EmbeddedMosaicGlobalRestrictionTransactionV1({ 
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	UnresolvedMosaicId? mosaicId,
	UnresolvedMosaicId? referenceMosaicId,
	int? restrictionKey,
	int? previousRestrictionValue,
	int? newRestrictionValue,
	MosaicRestrictionType? previousRestrictionType,
	MosaicRestrictionType? newRestrictionType
	}) 
		: super(signerPublicKey == null && version == null && network == null && type == null && mosaicId == null && referenceMosaicId == null && restrictionKey == null && previousRestrictionValue == null && newRestrictionValue == null && previousRestrictionType == null && newRestrictionType == null )
	{
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? EmbeddedMosaicGlobalRestrictionTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? EmbeddedMosaicGlobalRestrictionTransactionV1.TRANSACTION_TYPE;
		_mosaicId = mosaicId ?? UnresolvedMosaicId();
		_referenceMosaicId = referenceMosaicId ?? UnresolvedMosaicId();
		_restrictionKey = restrictionKey ?? 0;
		_previousRestrictionValue = previousRestrictionValue ?? 0;
		_newRestrictionValue = newRestrictionValue ?? 0;
		_previousRestrictionType = previousRestrictionType ?? MosaicRestrictionType.NONE;
		_newRestrictionType = newRestrictionType ?? MosaicRestrictionType.NONE;
	}

	void sort() {
		// empty body
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	TransactionType get type {
		return _type;
	}

	UnresolvedMosaicId get mosaicId {
		return _mosaicId;
	}

	UnresolvedMosaicId get referenceMosaicId {
		return _referenceMosaicId;
	}

	int get restrictionKey {
		return _restrictionKey;
	}

	int get previousRestrictionValue {
		return _previousRestrictionValue;
	}

	int get newRestrictionValue {
		return _newRestrictionValue;
	}

	MosaicRestrictionType get previousRestrictionType {
		return _previousRestrictionType;
	}

	MosaicRestrictionType get newRestrictionType {
		return _newRestrictionType;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set mosaicId(UnresolvedMosaicId value) {
		_mosaicId = value;
	}

	set referenceMosaicId(UnresolvedMosaicId value) {
		_referenceMosaicId = value;
	}

	set restrictionKey(int value) {
		_restrictionKey = value;
	}

	set previousRestrictionValue(int value) {
		_previousRestrictionValue = value;
	}

	set newRestrictionValue(int value) {
		_newRestrictionValue = value;
	}

	set previousRestrictionType(MosaicRestrictionType value) {
		_previousRestrictionType = value;
	}

	set newRestrictionType(MosaicRestrictionType value) {
		_newRestrictionType = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_embeddedTransactionHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _mosaicId.size, _mosaicId.serialize());
		currentPos += mosaicId.size;
		buffer.setRange(currentPos, currentPos + _referenceMosaicId.size, _referenceMosaicId.serialize());
		currentPos += referenceMosaicId.size;
		buffer.setRange(currentPos, currentPos + 8, intToBytes(_restrictionKey, 8));
		currentPos += 8;
		buffer.setRange(currentPos, currentPos + 8, intToBytes(_previousRestrictionValue, 8));
		currentPos += 8;
		buffer.setRange(currentPos, currentPos + 8, intToBytes(_newRestrictionValue, 8));
		currentPos += 8;
		buffer.setRange(currentPos, currentPos + _previousRestrictionType.size, _previousRestrictionType.serialize());
		currentPos += previousRestrictionType.size;
		buffer.setRange(currentPos, currentPos + _newRestrictionType.size, _newRestrictionType.serialize());
		currentPos += newRestrictionType.size;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'EmbeddedMosaicGlobalRestrictionTransactionV1(';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'mosaicId: "${_mosaicId.toString()}", ';
		result += 'referenceMosaicId: "${_referenceMosaicId.toString()}", ';
		result += 'restrictionKey: "0x${_restrictionKey.toRadixString(16).padLeft(8 * 2, '0').toUpperCase()}", ';
		result += 'previousRestrictionValue: "0x${_previousRestrictionValue.toRadixString(16).padLeft(8 * 2, '0').toUpperCase()}", ';
		result += 'newRestrictionValue: "0x${_newRestrictionValue.toRadixString(16).padLeft(8 * 2, '0').toUpperCase()}", ';
		result += 'previousRestrictionType: "${_previousRestrictionType.toString()}", ';
		result += 'newRestrictionType: "${_newRestrictionType.toString()}", ';
		result += ')';
		return result;
	}
}


class TransferTransactionV1 extends StructBase implements IDeserializable {
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

	Signature _signature = Signature();
	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	TransactionType _type = TransactionType.ACCOUNT_KEY_LINK;
	Amount _fee = Amount();
	Timestamp _deadline = Timestamp();
	UnresolvedAddress _recipientAddress = UnresolvedAddress();
	List<UnresolvedMosaic> _mosaics = [];
	Uint8List _message = Uint8List(0);
	final int _verifiableEntityHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field
	final int _transferTransactionBodyReserved_1 = 0; // reserved field
	final int _transferTransactionBodyReserved_2 = 0; // reserved field

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
	}) 
		: super(signature == null && signerPublicKey == null && version == null && network == null && type == null && fee == null && deadline == null && recipientAddress == null && mosaics == null && message == null )
	{
		_signature = signature ?? Signature();
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? TransferTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? TransferTransactionV1.TRANSACTION_TYPE;
		_fee = fee ?? Amount();
		_deadline = deadline ?? Timestamp();
		_recipientAddress = recipientAddress ?? UnresolvedAddress();
		_mosaics = mosaics ?? [];
		_message = message ?? Uint8List(0);
	}

	void sort() {
		_mosaics.sort((lhs, rhs) {
			return ArrayHelpers.deepCompare(ArrayHelpers.getValue(lhs.mosaicId), ArrayHelpers.getValue(rhs.mosaicId));
		});
	}

	Signature get signature {
		return _signature;
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	TransactionType get type {
		return _type;
	}

	Amount get fee {
		return _fee;
	}

	Timestamp get deadline {
		return _deadline;
	}

	UnresolvedAddress get recipientAddress {
		return _recipientAddress;
	}

	List<UnresolvedMosaic> get mosaics {
		return _mosaics;
	}

	Uint8List get message {
		return _message;
	}

	set signature(Signature value) {
		_signature = value;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set fee(Amount value) {
		_fee = value;
	}

	set deadline(Timestamp value) {
		_deadline = value;
	}

	set recipientAddress(UnresolvedAddress value) {
		_recipientAddress = value;
	}

	set mosaics(List<UnresolvedMosaic> value) {
		_mosaics = value;
	}

	set message(Uint8List value) {
		_message = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_verifiableEntityHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signature.size, _signature.serialize());
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + _recipientAddress.size, _recipientAddress.serialize());
		currentPos += recipientAddress.size;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_message.length, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_mosaics.length, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_transferTransactionBodyReserved_1, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_transferTransactionBodyReserved_2, 4));
		currentPos += 4;
		sort();
		var res_mosaics = ArrayHelpers.writeArray(buffer, _mosaics, currentPos, (e) { return ArrayHelpers.getValue(e.mosaicId);});
		currentPos = res_mosaics.item2;
		buffer = res_mosaics.item1;
		buffer.setRange(currentPos, currentPos + _message.lengthInBytes, _message);
		currentPos += message.lengthInBytes;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'TransferTransactionV1(';
		result += 'signature: "${_signature.toString()}", ';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'fee: "${_fee.toString()}", ';
		result += 'deadline: "${_deadline.toString()}", ';
		result += 'recipientAddress: "${_recipientAddress.toString()}", ';
		result += 'mosaics: "${_mosaics.map((e) => e.toString()).toList()}", ';
		result += 'message: "${hex.encode(_message.toList()).toUpperCase()}", ';
		result += ')';
		return result;
	}
}


class EmbeddedTransferTransactionV1 extends StructBase implements IDeserializable, IEmbeddedTransaction {
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

	PublicKey _signerPublicKey = PublicKey();
	int _version = 0;
	NetworkType _network = NetworkType.MAINNET;
	TransactionType _type = TransactionType.ACCOUNT_KEY_LINK;
	UnresolvedAddress _recipientAddress = UnresolvedAddress();
	List<UnresolvedMosaic> _mosaics = [];
	Uint8List _message = Uint8List(0);
	final int _embeddedTransactionHeaderReserved_1 = 0; // reserved field
	final int _entityBodyReserved_1 = 0; // reserved field
	final int _transferTransactionBodyReserved_1 = 0; // reserved field
	final int _transferTransactionBodyReserved_2 = 0; // reserved field

	EmbeddedTransferTransactionV1({ 
	PublicKey? signerPublicKey,
	int? version,
	NetworkType? network,
	TransactionType? type,
	UnresolvedAddress? recipientAddress,
	List<UnresolvedMosaic>? mosaics,
	Uint8List? message
	}) 
		: super(signerPublicKey == null && version == null && network == null && type == null && recipientAddress == null && mosaics == null && message == null )
	{
		_signerPublicKey = signerPublicKey ?? PublicKey();
		_version = version ?? EmbeddedTransferTransactionV1.TRANSACTION_VERSION;
		_network = network ?? NetworkType.MAINNET;
		_type = type ?? EmbeddedTransferTransactionV1.TRANSACTION_TYPE;
		_recipientAddress = recipientAddress ?? UnresolvedAddress();
		_mosaics = mosaics ?? [];
		_message = message ?? Uint8List(0);
	}

	void sort() {
		_mosaics.sort((lhs, rhs) {
			return ArrayHelpers.deepCompare(ArrayHelpers.getValue(lhs.mosaicId), ArrayHelpers.getValue(rhs.mosaicId));
		});
	}

	PublicKey get signerPublicKey {
		return _signerPublicKey;
	}

	int get version {
		return _version;
	}

	NetworkType get network {
		return _network;
	}

	TransactionType get type {
		return _type;
	}

	UnresolvedAddress get recipientAddress {
		return _recipientAddress;
	}

	List<UnresolvedMosaic> get mosaics {
		return _mosaics;
	}

	Uint8List get message {
		return _message;
	}

	set signerPublicKey(PublicKey value) {
		_signerPublicKey = value;
	}

	set version(int value) {
		_version = value;
	}

	set network(NetworkType value) {
		_network = value;
	}

	set type(TransactionType value) {
		_type = value;
	}

	set recipientAddress(UnresolvedAddress value) {
		_recipientAddress = value;
	}

	set mosaics(List<UnresolvedMosaic> value) {
		_mosaics = value;
	}

	set message(Uint8List value) {
		_message = value;
	}

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
		// nothing to do for size
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

	Uint8List serialize() {
		var buffer = Uint8List(size);
		var currentPos = 0;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_embeddedTransactionHeaderReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _recipientAddress.size, _recipientAddress.serialize());
		currentPos += recipientAddress.size;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_message.length, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_mosaics.length, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_transferTransactionBodyReserved_1, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_transferTransactionBodyReserved_2, 4));
		currentPos += 4;
		sort();
		var res_mosaics = ArrayHelpers.writeArray(buffer, _mosaics, currentPos, (e) { return ArrayHelpers.getValue(e.mosaicId);});
		currentPos = res_mosaics.item2;
		buffer = res_mosaics.item1;
		buffer.setRange(currentPos, currentPos + _message.lengthInBytes, _message);
		currentPos += message.lengthInBytes;
		return buffer.buffer.asUint8List();
	}

	@override
	String toString() {
		var result = 'EmbeddedTransferTransactionV1(';
		result += 'signerPublicKey: "${_signerPublicKey.toString()}", ';
		result += 'version: "0x${_version.toRadixString(16).padLeft(1 * 2, '0').toUpperCase()}", ';
		result += 'network: "${_network.toString()}", ';
		result += 'type: "${_type.toString()}", ';
		result += 'recipientAddress: "${_recipientAddress.toString()}", ';
		result += 'mosaics: "${_mosaics.map((e) => e.toString()).toList()}", ';
		result += 'message: "${hex.encode(_message.toList()).toUpperCase()}", ';
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

	IDeserializable createByName(String entityName) {
		var mapping = {
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
}


class EmbeddedTransactionFactory implements IDeserializable {
	@override
	dynamic deserialize(dynamic payload) {
		if(payload is String){
			tryHexString(payload);
			payload = hex.decode(payload);
		}
		Uint8List buffer = payload.buffer.asUint8List();
		var parent = EmbeddedTransaction().deserialize(buffer);
		var mapping = {
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

	IDeserializable createByName(String entityName) {
		var mapping = {
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
}


class BlockFactory implements IDeserializable {
	@override
	dynamic deserialize(dynamic payload) {
		if(payload is String){
			tryHexString(payload);
			payload = hex.decode(payload);
		}
		Uint8List buffer = payload.buffer.asUint8List();
		var parent = Block().deserialize(buffer);
		var mapping = {
			(NemesisBlockV1.BLOCK_TYPE.value, ): NemesisBlockV1(),
			(NormalBlockV1.BLOCK_TYPE.value, ): NormalBlockV1(),
			(ImportanceBlockV1.BLOCK_TYPE.value, ): ImportanceBlockV1()
		};
		var discriminator = (parent.type.value);
		if (mapping[discriminator] != null) {
			var factory_class = mapping[discriminator]!;
			return factory_class.deserialize(buffer);
		} else {
			throw Exception('Null value found for mapping[discriminator]');
		}
	}

	IDeserializable createByName(String entityName) {
		var mapping = {
			'nemesis_block_v1': () => NemesisBlockV1(),
			'normal_block_v1': () => NormalBlockV1(),
			'importance_block_v1': () => ImportanceBlockV1()
		};

		if (!mapping.containsKey(entityName)) {
			throw Exception('Unknown Transaction type $entityName');
		}

		return mapping[entityName]!();
	}
}


class ReceiptFactory implements IDeserializable {
	@override
	dynamic deserialize(dynamic payload) {
		if(payload is String){
			tryHexString(payload);
			payload = hex.decode(payload);
		}
		Uint8List buffer = payload.buffer.asUint8List();
		var parent = Receipt().deserialize(buffer);
		var mapping = {
			(HarvestFeeReceipt.RECEIPT_TYPE.value, ): HarvestFeeReceipt(),
			(InflationReceipt.RECEIPT_TYPE.value, ): InflationReceipt(),
			(LockHashCreatedFeeReceipt.RECEIPT_TYPE.value, ): LockHashCreatedFeeReceipt(),
			(LockHashCompletedFeeReceipt.RECEIPT_TYPE.value, ): LockHashCompletedFeeReceipt(),
			(LockHashExpiredFeeReceipt.RECEIPT_TYPE.value, ): LockHashExpiredFeeReceipt(),
			(LockSecretCreatedFeeReceipt.RECEIPT_TYPE.value, ): LockSecretCreatedFeeReceipt(),
			(LockSecretCompletedFeeReceipt.RECEIPT_TYPE.value, ): LockSecretCompletedFeeReceipt(),
			(LockSecretExpiredFeeReceipt.RECEIPT_TYPE.value, ): LockSecretExpiredFeeReceipt(),
			(MosaicExpiredReceipt.RECEIPT_TYPE.value, ): MosaicExpiredReceipt(),
			(MosaicRentalFeeReceipt.RECEIPT_TYPE.value, ): MosaicRentalFeeReceipt(),
			(NamespaceExpiredReceipt.RECEIPT_TYPE.value, ): NamespaceExpiredReceipt(),
			(NamespaceDeletedReceipt.RECEIPT_TYPE.value, ): NamespaceDeletedReceipt(),
			(NamespaceRentalFeeReceipt.RECEIPT_TYPE.value, ): NamespaceRentalFeeReceipt()
		};
		var discriminator = (parent.type.value);
		if (mapping[discriminator] != null) {
			var factory_class = mapping[discriminator]!;
			return factory_class.deserialize(buffer);
		} else {
			throw Exception('Null value found for mapping[discriminator]');
		}
	}

	IDeserializable createByName(String entityName) {
		var mapping = {
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
}
