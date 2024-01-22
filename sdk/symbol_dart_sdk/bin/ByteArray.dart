import 'dart:typed_data';
import 'package:convert/convert.dart';

class ByteArray {
  Uint8List bytes;

  ByteArray(int fixedSize, dynamic arrayInput)
      : bytes = Uint8List(fixedSize) {
    var rawBytes = arrayInput;
    if (rawBytes is String) {
      rawBytes = hex.decode(rawBytes);
    }

    if (fixedSize != rawBytes.length) {
      throw RangeError('bytes was size ${rawBytes.length} but must be $fixedSize');
    }

    bytes = Uint8List.fromList(rawBytes);
  }

  @override
  String toString() {
    return hex.encode(bytes.toList()).toUpperCase();
  }
}