import 'dart:typed_data';
import 'package:base32/base32.dart';

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

const SIGNEDNESS_AND_SIZE_TO_ARRAY_TYPE_MAPPING = {
  false: {
    1: Uint8List,
    2: Uint16List,
    4: Uint32List,
    8: Uint64List
  },
  true: {
    1: Int8List,
    2: Int16List,
    4: Int32List,
    8: Int64List
  }
};

Uint8List bigIntToBytes(BigInt bigInt) {
  var hexString = bigInt.toRadixString(16).padLeft(16, '0').toUpperCase();
  if (hexString.length % 2 != 0) {
    hexString = '0' + hexString;
  }
  var byteData = Uint8List((hexString.length / 2).floor());
  for (var i = 0; i < byteData.length; i++) {
    var offset = i * 2;
    byteData[i] = int.parse(hexString.substring(offset, offset + 2), radix: 16);
  }
  return Uint8List.fromList(byteData.reversed.toList());
}

BigInt bytesToBigInt(Uint8List bytes, bool isSigned) {
  var byteData = ByteData.view(bytes.buffer, 0, 8);
  BigInt bigInt;
  if(isSigned) {
    bigInt = BigInt.from(byteData.getInt64(0, Endian.little));
  } else {
    var value = byteData.getUint64(0, Endian.little);
    bigInt = BigInt.from(value);
    if (bigInt < BigInt.zero) {
      bigInt = bigInt + BigInt.two.pow(64);
    }
  }
  return bigInt;
}

Uint8List intToBytes(dynamic value, int byteSize, {bool isSigned = false}) {
  var DataType = SIGNEDNESS_AND_SIZE_TO_ARRAY_TYPE_MAPPING[isSigned]?[byteSize];
  var byteData = ByteData(byteSize);
  
  if(value is BigInt) {
    return bigIntToBytes(value);
  }

  if (DataType == Int8List) {
    byteData.setInt8(0, value);
  } else if (DataType == Int16List) {
    byteData.setInt16(0, value, Endian.little);
  } else if (DataType == Int32List) {
    byteData.setInt32(0, value, Endian.little);
  } else if (DataType == Int64List) {
    byteData.setInt64(0, value, Endian.little);
  } else if (DataType == Uint8List) {
    byteData.setUint8(0, value);
  } else if (DataType == Uint16List) {
    byteData.setUint16(0, value, Endian.little);
  } else if (DataType == Uint32List) {
    byteData.setUint32(0, value, Endian.little);
  } else if (DataType == Uint64List) {
    byteData.setUint64(0, value, Endian.little);
  }

  return byteData.buffer.asUint8List();
}

dynamic bytesToInt(Uint8List input, int size, {bool isSigned = false}) {
  var DataType = SIGNEDNESS_AND_SIZE_TO_ARRAY_TYPE_MAPPING[isSigned]?[size];
  if (DataType == null) {
    throw Exception('data type not found');
  }
  var byteData = ByteData.view(input.buffer, input.offsetInBytes, size);

  if (DataType == Int8List) {
    return byteData.getInt8(0);
  } else if (DataType == Int16List) {
    return byteData.getInt16(0, Endian.little);
  } else if (DataType == Int32List) {
    return byteData.getInt32(0, Endian.little);
  } else if (DataType == Int64List) {
    return byteData.getInt64(0, Endian.little);
  } else if (DataType == Uint8List) {
    return byteData.getUint8(0);
  } else if (DataType == Uint16List) {
    return byteData.getUint16(0, Endian.little);
  } else if (DataType == Uint32List) {
    return byteData.getUint32(0, Endian.little);
  } else if (DataType == Uint64List) {
    var value = byteData.getUint64(0, Endian.little);
    var bigInt = BigInt.from(value);
    if (bigInt < BigInt.zero) {
      return bigInt + BigInt.two.pow(64);
    }
    return bigInt;
  }

  return null;
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