// ignore_for_file: prefer_final_fields, unnecessary_getters_setters, unused_local_variable

import './bin/BaseValue.dart';
import './bin/ByteArray.dart';
import './bin/utils/arrayHelpers.dart';
import './bin/utils/converter.dart';
import './bin/utils/transform.dart';
import 'bin/models/IDeserializable.dart';
import 'bin/models/StructBase.dart';

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
	final int _ownerPublicKeySize = 0; // reserved field

	MosaicDefinition({ ownerPublicKey, id, description, properties, levy}) 
  : super(ownerPublicKey == null && id == null && description == null && properties == null && levy == null) {
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
    return levy.isDefault ? 0 : levy.size;
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
	MosaicDefinition deserialize(dynamic payload) {
		if(payload is String) {
			payload = hex.decode(payload);
		}
		Uint8List buffer = payload.buffer.asUint8List();
		var ownerPublicKeySize = ByteData.view(buffer.sublist(0, 4).buffer).getUint32(0, Endian.little);
		buffer = buffer.sublist(4);
		if (32 != ownerPublicKeySize) {
			throw RangeError('Invalid value of reserved field ($ownerPublicKeySize)');
		}
		var ownerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(ownerPublicKey.size);
		var idSize = ByteData.view(buffer.sublist(0, 4).buffer).getUint32(0, Endian.little);
		buffer = buffer.sublist(4);
		//marking sizeof field
		var id = MosaicId().deserialize(buffer);
		buffer = buffer.sublist(id.size);
		var descriptionSize = ByteData.view(buffer.sublist(0, 4).buffer).getUint32(0, Endian.little);
		buffer = buffer.sublist(4);
		var description = Uint8List.fromList(buffer.sublist(0, descriptionSize));
		buffer = buffer.sublist(descriptionSize);
		var propertiesCount = ByteData.view(buffer.sublist(0, 4).buffer).getUint32(0, Endian.little);
		buffer = buffer.sublist(4);
		var properties = ArrayHelpers.readArrayCount(buffer, SizePrefixedMosaicProperty(), propertiesCount)
			.cast<SizePrefixedMosaicProperty>();
		var levySize = ByteData.view(buffer.sublist(0, 4).buffer).getUint32(0, Endian.little);
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
		buffer.setRange(currentPos, currentPos + _ownerPublicKey.size, _ownerPublicKey.serialize());;
		currentPos += ownerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(id.size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _id.size, _id.serialize());;
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
			buffer.setRange(currentPos, currentPos + _levy.size, _levy.serialize());;
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


class MosaicId implements IDeserializable {

	static const Map<String, String> TYPE_HINTS = {
		'namespaceId': 'struct:NamespaceId',
		'name': 'bytes_array'
	};

	NamespaceId _namespaceId = NamespaceId();
	Uint8List _name = Uint8List(0);

	MosaicId({ namespaceId, name}) {
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
	MosaicId deserialize(dynamic payload) {
		if(payload is String) {
			payload = hex.decode(payload);
		}
		Uint8List buffer = payload.buffer.asUint8List();
		var namespaceId = NamespaceId().deserialize(buffer);
		buffer = buffer.sublist(namespaceId.size);
		var nameSize = ByteData.view(buffer.sublist(0, 4).buffer).getUint32(0, Endian.little);
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
		buffer.setRange(currentPos, currentPos + _namespaceId.size, _namespaceId.serialize());;
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


class NamespaceId implements IDeserializable {

	static const Map<String, String> TYPE_HINTS = {
		'name': 'bytes_array'
	};

	Uint8List _name = Uint8List(0);

	NamespaceId([name]) {
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
	NamespaceId deserialize(dynamic payload) {
		if(payload is String) {
			payload = hex.decode(payload);
		}
		Uint8List buffer = payload.buffer.asUint8List();
		var nameSize = ByteData.view(buffer.sublist(0, 4).buffer).getUint32(0, Endian.little);
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

class SizePrefixedMosaicProperty implements IDeserializable {

	static const Map<String, String> TYPE_HINTS = {
		'property': 'struct:MosaicProperty'
	};

	MosaicProperty _property = MosaicProperty();

	SizePrefixedMosaicProperty([property]) {
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
	SizePrefixedMosaicProperty deserialize(dynamic payload) {
		if(payload is String) {
			payload = hex.decode(payload);
		}
		Uint8List buffer = payload.buffer.asUint8List();
		var propertySize = ByteData.view(buffer.sublist(0, 4).buffer).getUint32(0, Endian.little);
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
		buffer.setRange(currentPos, currentPos + _property.size, _property.serialize());;
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
	final int _recipientAddressSize = 0; // reserved field

	MosaicLevy({ transferFeeType, recipientAddress, mosaicId, fee})
  : super(transferFeeType == null && recipientAddress == null && mosaicId == null && fee == null) {
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
	MosaicLevy deserialize(dynamic payload) {
		if(payload is String) {
			payload = hex.decode(payload);
		}
		Uint8List buffer = payload.buffer.asUint8List();
		var transferFeeType = MosaicTransferFeeType().deserialize(buffer);
		buffer = buffer.sublist(transferFeeType.size);
		var recipientAddressSize = ByteData.view(buffer.sublist(0, 4).buffer).getUint32(0, Endian.little);
		buffer = buffer.sublist(4);
		if (40 != recipientAddressSize) {
			throw RangeError('Invalid value of reserved field ($recipientAddressSize)');
		}
		var recipientAddress = Address().deserialize(buffer);
		buffer = buffer.sublist(recipientAddress.size);
		var mosaicIdSize = ByteData.view(buffer.sublist(0, 4).buffer).getUint32(0, Endian.little);
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
		buffer.setRange(currentPos, currentPos + _transferFeeType.size, _transferFeeType.serialize());;
		currentPos += transferFeeType.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_recipientAddressSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _recipientAddress.size, _recipientAddress.serialize());;
		currentPos += recipientAddress.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(mosaicId.size, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _mosaicId.size, _mosaicId.serialize());;
		currentPos += mosaicId.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());;
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
	MosaicTransferFeeType deserialize(dynamic payload) {
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

class MosaicProperty implements IDeserializable {

	static const Map<String, String> TYPE_HINTS = {
		'name': 'bytes_array',
		'value': 'bytes_array'
	};

	Uint8List _name = Uint8List(0);
	Uint8List _value = Uint8List(0);

	MosaicProperty({ name, value}) {
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
	MosaicProperty deserialize(dynamic payload) {
		if(payload is String) {
			payload = hex.decode(payload);
		}
		Uint8List buffer = payload.buffer.asUint8List();
		var nameSize = ByteData.view(buffer.sublist(0, 4).buffer).getUint32(0, Endian.little);
		buffer = buffer.sublist(4);
		var name = Uint8List.fromList(buffer.sublist(0, nameSize));
		buffer = buffer.sublist(nameSize);
		var valueSize = ByteData.view(buffer.sublist(0, 4).buffer).getUint32(0, Endian.little);
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

class Address extends ByteArray implements IDeserializable {
	static const int SIZE = 40;

	Address([dynamic address]) : super(SIZE, address ?? Uint8List(40));

	int get size {
		return 40;
	}

	@override
	Address deserialize(dynamic payload) {
		payload = payload.sublist(0, SIZE);
		return Address(Uint8List.fromList(payload));
	}

	Uint8List serialize() {
		return bytes;
	}
}

class Amount extends BaseValue implements IDeserializable {
	static const int SIZE = 8;

	Amount([dynamic amount]) : super(SIZE, amount ?? BigInt.zero);

	@override
	Amount deserialize(dynamic payload) {
		var buffer = ByteData.view(payload.buffer);
		return Amount(BigInt.from(buffer.getUint64(0, Endian.little)));
	}

	Uint8List serialize() {
		var buffer = Uint8List(SIZE);
		buffer.setRange(0, 0 + 8, intToBytes(value, 8));
		return buffer;
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
	final int _signerPublicKeySize = 0; // reserved field
	final int _signatureSize = 0; // reserved field
	final int _rentalFeeSinkSize = 0; // reserved field

	NamespaceRegistrationTransactionV1({ 
	type,
	version,
	network,
	timestamp,
	signerPublicKey,
	signature,
	fee,
	deadline,
	rentalFeeSink,
	rentalFee,
	name,
	parentName
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
		if (parentName == Uint8List(0))
		{
			size += parentName.lengthInBytes;
		}
		return size;
	}

	@override
	NamespaceRegistrationTransactionV1 deserialize(dynamic payload) {
		if(payload is String) {
			payload = hex.decode(payload);
		}
		Uint8List buffer = payload.buffer.asUint8List();
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var version = ByteData.view(buffer.sublist(0, 1).buffer).getUint8(0);
		buffer = buffer.sublist(1);
		var entityBodyReserved_1 = ByteData.view(buffer.sublist(0, 2).buffer).getUint16(0, Endian.little);
		buffer = buffer.sublist(2);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var timestamp = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(timestamp.size);
		var signerPublicKeySize = ByteData.view(buffer.sublist(0, 4).buffer).getUint32(0, Endian.little);
		buffer = buffer.sublist(4);
		if (32 != signerPublicKeySize) {
			throw RangeError('Invalid value of reserved field ($signerPublicKeySize)');
		}
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var signatureSize = ByteData.view(buffer.sublist(0, 4).buffer).getUint32(0, Endian.little);
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
		var rentalFeeSinkSize = ByteData.view(buffer.sublist(0, 4).buffer).getUint32(0, Endian.little);
		buffer = buffer.sublist(4);
		if (40 != rentalFeeSinkSize) {
			throw RangeError('Invalid value of reserved field ($rentalFeeSinkSize)');
		}
		var rentalFeeSink = Address().deserialize(buffer);
		buffer = buffer.sublist(rentalFeeSink.size);
		var rentalFee = Amount().deserialize(buffer);
		buffer = buffer.sublist(rentalFee.size);
		var nameSize = ByteData.view(buffer.sublist(0, 4).buffer).getUint32(0, Endian.little);
		buffer = buffer.sublist(4);
		var name = Uint8List.fromList(buffer.sublist(0, nameSize));
		buffer = buffer.sublist(nameSize);
		var parentNameSize = ByteData.view(buffer.sublist(0, 4).buffer).getUint32(0, Endian.little);
		buffer = buffer.sublist(4);
		var parentName = Uint8List(0);
		if (4294967295 != parentNameSize)
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
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());;
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_entityBodyReserved_1, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());;
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _timestamp.size, _timestamp.serialize());;
		currentPos += timestamp.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_signerPublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());;
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_signatureSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signature.size, _signature.serialize());;
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());;
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());;
		currentPos += deadline.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_rentalFeeSinkSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _rentalFeeSink.size, _rentalFeeSink.serialize());;
		currentPos += rentalFeeSink.size;
		buffer.setRange(currentPos, currentPos + _rentalFee.size, _rentalFee.serialize());;
		currentPos += rentalFee.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_name.length, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _name.lengthInBytes, _name);
		currentPos += name.lengthInBytes;
		buffer.setRange(currentPos, currentPos + 4, intToBytes((parentName != Uint8List(0) ? parentName.length : 4294967295), 4));
		currentPos += 4;
		if (parentName == Uint8List(0))
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
		if (parentName == Uint8List(0))
		{
			result += 'parentName: "${hex.encode(_parentName.toList()).toUpperCase()}", ';
		}
		result += ')';
		return result;
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
	TransactionType deserialize(dynamic payload) {
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
	final int _signerPublicKeySize = 0; // reserved field
	final int _signatureSize = 0; // reserved field

	Transaction({ type, version, network, timestamp, signerPublicKey, signature, fee, deadline}) 
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
	Transaction deserialize(dynamic payload) {
		if(payload is String) {
			payload = hex.decode(payload);
		}
		Uint8List buffer = payload.buffer.asUint8List();
		var type = TransactionType().deserialize(buffer);
		buffer = buffer.sublist(type.size);
		var version = ByteData.view(buffer.sublist(0, 1).buffer).getUint8(0);
		buffer = buffer.sublist(1);
		var entityBodyReserved_1 = ByteData.view(buffer.sublist(0, 2).buffer).getUint16(0, Endian.little);
		buffer = buffer.sublist(2);
		if (0 != entityBodyReserved_1) {
			throw RangeError('Invalid value of reserved field ($entityBodyReserved_1)');
		}
		var network = NetworkType().deserialize(buffer);
		buffer = buffer.sublist(network.size);
		var timestamp = Timestamp().deserialize(buffer);
		buffer = buffer.sublist(timestamp.size);
		var signerPublicKeySize = ByteData.view(buffer.sublist(0, 4).buffer).getUint32(0, Endian.little);
		buffer = buffer.sublist(4);
		if (32 != signerPublicKeySize) {
			throw RangeError('Invalid value of reserved field ($signerPublicKeySize)');
		}
		var signerPublicKey = PublicKey().deserialize(buffer);
		buffer = buffer.sublist(signerPublicKey.size);
		var signatureSize = ByteData.view(buffer.sublist(0, 4).buffer).getUint32(0, Endian.little);
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
		buffer.setRange(currentPos, currentPos + _type.size, _type.serialize());;
		currentPos += type.size;
		buffer.setRange(currentPos, currentPos + 1, intToBytes(_version, 1));
		currentPos += 1;
		buffer.setRange(currentPos, currentPos + 2, intToBytes(_entityBodyReserved_1, 2));
		currentPos += 2;
		buffer.setRange(currentPos, currentPos + _network.size, _network.serialize());;
		currentPos += network.size;
		buffer.setRange(currentPos, currentPos + _timestamp.size, _timestamp.serialize());;
		currentPos += timestamp.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_signerPublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signerPublicKey.size, _signerPublicKey.serialize());;
		currentPos += signerPublicKey.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_signatureSize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _signature.size, _signature.serialize());;
		currentPos += signature.size;
		buffer.setRange(currentPos, currentPos + _fee.size, _fee.serialize());;
		currentPos += fee.size;
		buffer.setRange(currentPos, currentPos + _deadline.size, _deadline.serialize());;
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

class Timestamp extends BaseValue implements IDeserializable {
	static const int SIZE = 4;

	Timestamp([dynamic timestamp]) : super(SIZE, timestamp ?? 0);

	@override
	Timestamp deserialize(dynamic payload) {
		var buffer = ByteData.view(payload.buffer);
		return Timestamp(buffer.getUint32(0, Endian.little));
	}

	Uint8List serialize() {
		var buffer = Uint8List(SIZE);
		buffer.setRange(0, 0 + 4, intToBytes(value, 4));
		return buffer;
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
	MultisigAccountModificationType deserialize(dynamic payload) {
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
	final int _cosignatoryPublicKeySize = 0; // reserved field

	MultisigAccountModification({ modificationType, cosignatoryPublicKey}) 
		: super(modificationType == null && cosignatoryPublicKey == null )
	{
		_modificationType = modificationType ?? MultisigAccountModificationType.ADD_COSIGNATORY;
		_cosignatoryPublicKey = cosignatoryPublicKey ?? PublicKey();
	}

	Tuple2 comparer() {
    return Tuple2(
      modificationType is Enum ? modificationType.value : modificationType,
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
	MultisigAccountModification deserialize(dynamic payload) {
		if(payload is String) {
			payload = hex.decode(payload);
		}
		Uint8List buffer = payload.buffer.asUint8List();
		var modificationType = MultisigAccountModificationType().deserialize(buffer);
		buffer = buffer.sublist(modificationType.size);
		var cosignatoryPublicKeySize = ByteData.view(buffer.sublist(0, 4).buffer).getUint32(0, Endian.little);
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
		buffer.setRange(currentPos, currentPos + _modificationType.size, _modificationType.serialize());;
		currentPos += modificationType.size;
		buffer.setRange(currentPos, currentPos + 4, intToBytes(_cosignatoryPublicKeySize, 4));
		currentPos += 4;
		buffer.setRange(currentPos, currentPos + _cosignatoryPublicKey.size, _cosignatoryPublicKey.serialize());;
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