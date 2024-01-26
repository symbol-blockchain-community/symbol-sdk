// ignore_for_file: prefer_final_fields, unnecessary_getters_setters, unused_local_variable

import './bin/BaseValue.dart';
import './bin/ByteArray.dart';
import './bin/utils/arrayHelpers.dart';
import './bin/utils/transform.dart';
import './bin/utils/converter.dart';
import 'bin/models/IDeserializable.dart';
import 'bin/models/StructBase.dart';
import 'bin/models/INonVerifiableTransaction.dart';

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

class Mosaic extends StructBase implements IDeserializable {

	static const Map<String, String> TYPE_HINTS = {
		'mosaicId': 'pod:MosaicId',
		'amount': 'pod:Amount'
	};

	MosaicId mosaicId = MosaicId();
	Amount amount = Amount();

	Mosaic({ MosaicId? mosaicId, Amount? amount}) 
		: super(mosaicId == null && amount == null )
	{
		mosaicId = mosaicId ?? MosaicId();
		amount = amount ?? Amount();
	}

	void sort() {
		// empty body
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