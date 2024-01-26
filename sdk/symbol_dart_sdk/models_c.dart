// ignore_for_file: prefer_final_fields, unnecessary_getters_setters, unused_local_variable

// import './bin/BaseValue.dart';
// import './bin/ByteArray.dart';
// import './bin/utils/arrayHelpers.dart';
import './bin/utils/transform.dart';
// import 'bin/models/IDeserializable.dart';
// import 'bin/models/StructBase.dart';

import 'dart:typed_data';
import 'package:convert/convert.dart';
import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';
import 'package:hash/hash.dart';
import 'package:sha3/sha3.dart';
import 'package:base32/base32.dart';
import 'package:ed25519_edwards/ed25519_edwards.dart' as ed;
import 'package:tuple/tuple.dart';

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
	TransferTransactionV1 deserialize(dynamic payload) {
		if(payload is String) {
			payload = hex.decode(payload);
		}
		Uint8List buffer = payload.buffer.asUint8List();
		// nothing to do for size
		buffer = buffer.sublist(4);
		var verifiableEntityHeaderReserved_1 = bytesToInt((buffer.sublist(0, 4) as Uint8List).sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != verifiableEntityHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($verifiableEntityHeaderReserved_1)');
		}
		var signature = Signature().deserialize(buffer);
		buffer = buffer.sublist(signature.size);
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt((buffer.sublist(0, 4) as Uint8List).sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt((buffer.sublist(0, 1) as Uint8List).sublist(0, 1), 1);
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
		var messageSize = bytesToInt((buffer.sublist(0, 2) as Uint8List).sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		var mosaicsCount = bytesToInt((buffer.sublist(0, 1) as Uint8List).sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		var transferTransactionBodyReserved_1 = bytesToInt((buffer.sublist(0, 1) as Uint8List).sublist(0, 1), 1);
		buffer = buffer.sublist(1);
		if (0 != transferTransactionBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($transferTransactionBodyReserved_1)');
		}
		var transferTransactionBodyReserved_2 = bytesToInt((buffer.sublist(0, 4) as Uint8List).sublist(0, 4), 4);
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
		buffer.setRange(currentPos, currentPos + _signature.size, _signature.serialize());;
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());;
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());;
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());;
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());;
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());;
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + _recipientAddress.size, _recipientAddress.serialize());;
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
	TransactionType deserialize(dynamic payload) {
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


class Signature extends ByteArray implements IDeserializable {
	static const int SIZE = 64;

	Signature([dynamic signature]) : super(SIZE, signature ?? Uint8List(64));

	int get size {
		return 64;
	}

	@override
	Signature deserialize(dynamic payload) {
		payload = payload.sublist(0, SIZE);
		return Signature(Uint8List.fromList(payload));
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
	PublicKey deserialize(dynamic payload) {
		payload = payload.sublist(0, SIZE);
		return PublicKey(Uint8List.fromList(payload));
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
	NetworkType deserialize(dynamic payload) {
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

class Amount extends BaseValue implements IDeserializable {
	static const int SIZE = 8;

	Amount([dynamic amount]) : super(SIZE, amount ?? 0);

	@override
	Amount deserialize(dynamic payload) {
		return Amount(bytesToInt((payload as Uint8List).sublist(0, 8), 8));
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
	Timestamp deserialize(dynamic payload) {
		return Timestamp(bytesToInt((payload as Uint8List).sublist(0, 8), 8));
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
	UnresolvedAddress deserialize(dynamic payload) {
		payload = payload.sublist(0, SIZE);
		return UnresolvedAddress(Uint8List.fromList(payload));
	}

	Uint8List serialize() {
		return bytes;
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
	UnresolvedMosaic deserialize(dynamic payload) {
		if(payload is String) {
			payload = hex.decode(payload);
		}
		Uint8List buffer = payload.buffer.asUint8List();
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
		buffer.setRange(currentPos, currentPos + _mosaicId.size, _mosaicId.serialize());;
		currentPos += mosaicId.size;
		buffer.setRange(currentPos, currentPos + _amount.size, _amount.serialize());;
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

class UnresolvedMosaicId extends BaseValue implements IDeserializable {
	static const int SIZE = 8;

	UnresolvedMosaicId([dynamic unresolvedMosaicId]) : super(SIZE, unresolvedMosaicId ?? 0);

	@override
	UnresolvedMosaicId deserialize(dynamic payload) {
		return UnresolvedMosaicId(bytesToInt((payload as Uint8List).sublist(0, 8), 8));
	}

	Uint8List serialize() {
		var buffer = Uint8List(SIZE);
		buffer.setRange(0, 0 + 8, intToBytes(value, 8));
		return buffer;
	}
}


class ArrayHelpers {
  static dynamic getValue(dynamic e) {
    try {
      return e.comparer();
    } catch (_) {
      return e.value;
    }
  }

  static int deepCompare(dynamic lhs, dynamic rhs) {
    if (!(lhs is List) && !(lhs is Uint8List)) {
      if (lhs == rhs) return 0;
      return lhs > rhs ? 1 : -1;
    }

    if (lhs.length != rhs.length) return lhs.length > rhs.length ? 1 : -1;

    for (var i = 0; i < lhs.length; ++i) {
      final compareResult = deepCompare(lhs[i], rhs[i]);
      if (0 != compareResult) return compareResult;
    }

    return 0;
  }

  static List readArrayImpl(Uint8List buffer, IDeserializable FactoryClass, dynamic accessor, bool Function(int, Uint8List) shouldContinue) {
    final elements = <IDeserializable>[];
    var previousElement;
    var i = 0;

    while (shouldContinue(i, buffer)) {
      final element = FactoryClass.deserialize(buffer);
      if (0 >= element.size) throw RangeError('element size has invalid size');
      if (accessor != null && previousElement != null && 0 <= deepCompare(accessor(previousElement), accessor(element))) {
        throw RangeError('elements in array are not sorted');
      }
      buffer = buffer.sublist(element.size);
      elements.add(element);
      previousElement = element;
      ++i;
    }

    return elements;
  }

  static Tuple2<Uint8List, int> writeArrayImpl(Uint8List output, List elements, int count, int currentPos, dynamic accessor) {
    for (var i = 0; i < count; ++i) {
      final element = elements[i];
      if (accessor != null && 0 < i && 0 <= deepCompare(accessor(elements[i - 1]), accessor(element))) {
        throw RangeError('array passed to write array is not sorted');
      }
      var serializedElement = element.serialize();
      var elementSize = serializedElement.length as int;
      output.setRange(currentPos, currentPos + elementSize, serializedElement);
      currentPos += elementSize;
    }
    return Tuple2(output, currentPos);
  }

  static int sum(List<int> numbers) => numbers.reduce((a, b) => a + b);

  static int alignUp(int size, int alignment) => ((size + alignment - 1) / alignment).floor() * alignment;

  static int size(List elements, [int alignment = 0, bool skipLastElementPadding = false]) {
    if (elements.isEmpty) return 0;
    if (alignment == 0) return sum(elements.map<int>((e) => e.size).toList());

    if (!skipLastElementPadding) return sum(elements.map((e) => alignUp(e.size, alignment)).toList());

    return sum(elements.sublist(0, elements.length - 1).map((e) => alignUp(e.size, alignment)).toList()) +
        sum(elements.sublist(elements.length - 1).map<int>((e) => e.size()).toList());
  }

  static List readArray(Uint8List buffer, IDeserializable FactoryClass, [dynamic accessor]) =>
      readArrayImpl(buffer, FactoryClass, accessor, (_, view) => 0 < buffer.lengthInBytes);

  static List readArrayCount(Uint8List buffer, IDeserializable FactoryClass, int count, [dynamic accessor]) =>
      readArrayImpl(buffer, FactoryClass, accessor, (index, _) => count > index);

  static List readVariableSizeElements(Uint8List bufferInput, dynamic FactoryClass, int alignment, [bool skipLastElementPadding = false]) {
    var buffer = ByteData.view(bufferInput.buffer);
    final elements = <dynamic>[];
    while (0 < buffer.lengthInBytes) {
      final element = FactoryClass.deserialize(buffer);

      if (0 >= element.size) throw RangeError('element size has invalid size');

      elements.add(element);

      final alignedSize = (skipLastElementPadding && element.size >= buffer.lengthInBytes)
          ? element.size
          : alignUp(element.size, alignment);
      if (alignedSize > buffer.lengthInBytes) throw RangeError('unexpected buffer length');
      buffer = ByteData.view(buffer.buffer, buffer.offsetInBytes + alignedSize as int);
    }
    return elements;
  }

  static Tuple2<Uint8List, int> writeArray(Uint8List output, List elements, int currentPos, [dynamic accessor]) {
    return writeArrayImpl(output, elements, elements.length, currentPos, accessor);
  }

  static Tuple2<Uint8List, int> writeArrayCount(Uint8List output, List elements, int count, int currentPos, [dynamic accessor]) {
    return writeArrayImpl(output, elements, count, currentPos, accessor);
  }

  static Tuple2<Uint8List, int> writeVariableSizeElements(dynamic output, List elements, int alignment, int currentPos, [bool skipLastElementPadding = false]) {
    for (var i = 0; i < elements.length; i++) {
      var serializedElement = elements[i].serialize();
      var elementSize = elements[i].size as int;
      output.setRange(currentPos, currentPos + elementSize, serializedElement);
      currentPos = currentPos + elementSize;
      if (!skipLastElementPadding || elements.length - 1 != i) {
        final alignedSize = alignUp(elementSize, alignment);
        if (alignedSize - elements[i].size > 0) {
          output.setRange(currentPos, currentPos + 1, List<int>.filled(alignedSize - elementSize, 0));
          currentPos = currentPos + 1;
        }
      }
    }
    return Tuple2(output, currentPos);
  }
}


class StructBase implements IDeserializable {
  bool isDefault = false;
  StructBase(bool _isDefault){
    isDefault = _isDefault;
  }
  @override
  dynamic deserialize(Uint8List payload){
    throw UnimplementedError();
  }
}

interface class IDeserializable {
  dynamic deserialize(Uint8List payload){
    throw UnimplementedError('unimplement deserialize');
  }
}

class BaseValue {
  final int size;
  dynamic value;
  final List<dynamic> _tag;

  BaseValue(this.size, this.value, {dynamic tag})
      : _tag = [tag] {

    if (value is String) {
      if(!isHexString(value)){
        value = int.parse(value);
      } else {
        var decoded = hex.decode(value.substring(2)); // Remove '0x' prefix
        var byteData = ByteData.view(Uint8List.fromList(decoded.reversed.toList()).buffer);
        switch(decoded.length){
          case 1:
            value = byteData.getInt8(0);
            break;
          case 2:
            value = byteData.getInt16(0, Endian.little);
            break;
          case 4:
            value = byteData.getInt32(0, Endian.little);
            break;
          default:
            value = byteData.getInt64(0, Endian.little);
            break;
        }
      }
    }
    
    // check bounds
    var bitSize = size * 8;

    int upperBound;
    int lowerBound;

    lowerBound = (1 << (bitSize - 1)) - 0;
    upperBound = -lowerBound - 1;
  
    if (value < lowerBound || value > upperBound) {
      var valueRangeMessage = '$value must be in range [$lowerBound, $upperBound]';
      throw ArgumentError('$valueRangeMessage for $size bytes');
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is BaseValue) {
      return value == other.value && _tag == other._tag;
    }
    return false;
  }

  @override
  int get hashCode => value.hashCode ^ _tag.hashCode;

  @override
  String toString() {
    int unsignedValue;

    var upperBoundPlusOne = 1 << (size * 8);
    unsignedValue = value + upperBoundPlusOne;

    return '0x' + unsignedValue.toRadixString(16).padLeft(size * 2, '0').toUpperCase();
  }
}

class ByteArray {
  Uint8List bytes;

  ByteArray(int fixedSize, dynamic arrayInput)
      : bytes = Uint8List(fixedSize) {
    var rawBytes = arrayInput;
    if (rawBytes is String) {
      try {
        if (isHexString(rawBytes)) {
          rawBytes = hex.decode(rawBytes.substring(2)); // Remove '0x' prefix
        } else {
          rawBytes = stringToAddress(arrayInput);
        }
      } catch (e) {
        throw ArgumentError('bytes was not a valid hex or address string');
      }
    }

    if (fixedSize != rawBytes.length) {
      throw RangeError('bytes was size ${rawBytes.length} but must be $fixedSize');
    }

    bytes = Uint8List.fromList(rawBytes);
  }

  @override
  String toString() {
    try {
      return addressToString(bytes);
    } catch(_) {
      return hex.encode(bytes.toList()).toUpperCase();
    }
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
	NamespaceMetadataTransactionV1 deserialize(dynamic payload) {
		if(payload is String) {
			payload = hex.decode(payload);
		}
		Uint8List buffer = payload.buffer.asUint8List();
		// nothing to do for size
		buffer = buffer.sublist(4);
		var verifiableEntityHeaderReserved_1 = bytesToInt((buffer.sublist(0, 4) as Uint8List).sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != verifiableEntityHeaderReserved_1) {
			throw RangeError('Invalid value of reserved field ($verifiableEntityHeaderReserved_1)');
		}
		var signature = Signature().deserialize(buffer);
		buffer = buffer.sublist(signature.size);
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var entityBodyReserved_1 = bytesToInt((buffer.sublist(0, 4) as Uint8List).sublist(0, 4), 4);
		buffer = buffer.sublist(4);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var version = bytesToInt((buffer.sublist(0, 1) as Uint8List).sublist(0, 1), 1);
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
		var scopedMetadataKey = bytesToInt((buffer.sublist(0, 8) as Uint8List).sublist(0, 8), 8);
		buffer = buffer.sublist(8);
		var targetNamespaceId = NamespaceId().deserialize(buffer);
		buffer = buffer.sublist(targetNamespaceId.size);
		var valueSizeDelta = bytesToInt((buffer.sublist(0, 2) as Uint8List).sublist(0, 2), 2);
		buffer = buffer.sublist(2);
		var valueSize = bytesToInt((buffer.sublist(0, 2) as Uint8List).sublist(0, 2), 2);
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
		buffer.setRange(currentPos, currentPos + _signature.size, _signature.serialize());;
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());;
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_entityBodyReserved_1, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());;
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());;
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());;
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());;
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + _targetAddress.size, _targetAddress.serialize());;
		currentPos += targetAddress.size;
		buffer.setRange(currentPos, currentPos + 8, intToBytes(_scopedMetadataKey, 8));
		currentPos += 8;
		buffer.setRange(currentPos, currentPos + _targetNamespaceId.size, _targetNamespaceId.serialize());;
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

class NamespaceId extends BaseValue implements IDeserializable {
	static const int SIZE = 8;

	NamespaceId([dynamic namespaceId]) : super(SIZE, namespaceId ?? 0);

	@override
	NamespaceId deserialize(dynamic payload) {
		return NamespaceId(bytesToInt((payload as Uint8List).sublist(0, 8), 8));
	}

	Uint8List serialize() {
		var buffer = Uint8List(SIZE);
		buffer.setRange(0, 0 + 8, intToBytes(value, 8));
		return buffer;
	}
}

Uint8List intToBytes(int value, int byteSize) {
  var byteData = ByteData(byteSize);

  switch (byteSize) {
    case 1:
      byteData.setInt8(0, value);
      break;
    case 2:
      byteData.setInt16(0, value, Endian.little);
      break;
    case 4:
      byteData.setInt32(0, value, Endian.little);
      break;
    case 8:
      byteData.setInt64(0, value, Endian.little);
      break;
    default:
      throw Exception('byteSize not supported');
  }

  return byteData.buffer.asUint8List();
}

dynamic bytesToInt(Uint8List input, int size) {
  var byteData = ByteData.view(input.buffer, input.offsetInBytes, size);

  switch (size) {
    case 1:
      return byteData.getInt8(0);
    case 2:
      return byteData.getInt16(0, Endian.little);
    case 4:
      return byteData.getInt32(0, Endian.little);
    case 8:
      return byteData.getInt64(0, Endian.little);
    default:
      throw Exception('byteSize not supported');
  }
}

Uint8List stringToAddress(String encoded) {
  if (_constants['sizes']!['symbolAddressEncoded'] == encoded.length) {
    var bytes = base32.decode(encoded + 'A');
    return Uint8List.fromList(bytes.sublist(0, _constants['sizes']!['symbolAddressDecoded']));
  }
  if (_constants['sizes']!['nemAddressEncoded'] == encoded.length) {
    return base32.decode(encoded);
  }
  throw Exception('$encoded does not represent a valid encoded address');
}

String addressToString(Uint8List decoded) {
  if (_constants['sizes']!['symbolAddressDecoded'] == decoded.length) {
    var padded = Uint8List(_constants['sizes']!['symbolAddressDecoded']! + 1);
    padded.setRange(0, decoded.length, decoded);
    return base32.encode(padded).substring(0, _constants['sizes']!['symbolAddressEncoded']);
  }
  if (_constants['sizes']!['nemAddressDecoded'] == decoded.length) {
    return base32.encode(decoded);
  }
  throw Exception('Bytes to Hex function is not implemented yet. It does not represent a valid decoded address');
}

bool isHexString(String value) {
  final hexPattern = RegExp(r'^0x[0-9a-fA-F]+$', caseSensitive: false);
  return hexPattern.hasMatch(value);
}

final Map<String, Map<String, int>> _constants = {
  'sizes': {
    'ripemd160': 20,
    'symbolAddressDecoded': 24,
    'nemAddressDecoded': 40,
    'symbolAddressEncoded': 39,
    'nemAddressEncoded': 40,
    'key': 32,
    'checksum': 3,
  }
};