import './utils/converter.dart';
import 'dart:typed_data';

class BaseValue {
  final int size;
  dynamic value;
  final List<dynamic> _tag;

  BaseValue(this.size, this.value, {dynamic tag})
      : _tag = [tag] {
    if (value is String) {
      try {
        if(size == 8) {
          value = BigInt.parse(value);
        } else {
          value = int.parse(value);
        }
      } catch (_) {
        tryHexString(value);
        if(size == 8) {
          value = BigInt.parse(value, radix: 16);
        } else {
          value = int.parse(value, radix: 16);
        }
      }
    } else if (value is int && size == 8) {
      value = BigInt.from(value).toUnsigned(64);
    }
    
    // check bounds
    var bitSize = size * 8;

    var upperBound = size == 8 ? BigInt.parse('18446744073709551615').toUnsigned(64) : bitmask(bitSize);
    var lowerBound = size == 8 ? BigInt.from(0).toUnsigned(64) : 0;
  
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
    return '0x' + value.toRadixString(16).padLeft(size * 2, '0').toUpperCase();
  }

  bool get isDefault{
    return value == 0;
  }
}

int bitmask(int bitsNumber) {
  return (1 << bitsNumber) - 1;
}

int unsignedToSigned(int value, int byteSize) {
  var bitSize = byteSize * 8;
  var mask = (1 << bitSize) - 1;
  var signBit = 1 << (bitSize - 1);
  if ((value & signBit) != 0) {
    return value | ~mask;
  } else {
    return value & mask;
  }
}