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

int bytesToInt(Uint8List input, int size) {
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