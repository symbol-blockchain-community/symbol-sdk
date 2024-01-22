import 'package:convert/convert.dart';
import 'dart:typed_data';

abstract class Ordered {}

class BaseValue extends Ordered {
  final int size;
  dynamic value;
  final List<dynamic> _tag;
  final bool signed;

  BaseValue(this.size, this.value, {dynamic tag, this.signed = false})
      : _tag = [tag, signed] {

    if (value is String) {
      if(value.length == 16){
        value = BigInt.parse(value, radix: 16);
      } else {
        var decoded = hex.decode(value);
        var byteData = ByteData.view(Uint8List.fromList(decoded).buffer);
        switch(decoded.length){
          case 1:
            value = byteData.getUint8(0);
            break;
          case 2:
            value = byteData.getUint16(0, Endian.little);
            break;
          case 4:
            value = byteData.getUint32(0, Endian.little);
            break;
        }
      }
    }

    // check bounds
    var bitSize = size * 8;

    BigInt upperBound;
    BigInt lowerBound;

    if (signed) {
      upperBound = (BigInt.one << (bitSize - 1)) - BigInt.one;
      lowerBound = -upperBound - BigInt.one;
    } else {
      upperBound = (BigInt.one << bitSize) - BigInt.one;
      lowerBound = BigInt.zero;
    }

    if ((value is int ? BigInt.from(value) : value) < lowerBound || (value is int ? BigInt.from(value) : value) > upperBound) {
      var signedDescription = signed ? 'signed' : 'unsigned';
      var valueRangeMessage = '$value must be in range [$lowerBound, $upperBound]';
      throw ArgumentError('$valueRangeMessage for $size bytes ($signedDescription)');
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
    BigInt unsignedValue;

    if (!_tag[1] || value >= BigInt.zero) {
      unsignedValue = value is int ? BigInt.from(value) : value;
    } else {
      var upperBoundPlusOne = BigInt.from(1 << (size * 8));
      unsignedValue = value + upperBoundPlusOne;
    }

    return '0x' + unsignedValue.toRadixString(16).padLeft(size * 2, '0').toUpperCase();
  }
}