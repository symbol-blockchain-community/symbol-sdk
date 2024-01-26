import 'package:convert/convert.dart';
import './utils/converter.dart';
import 'dart:typed_data';

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

    if (size == 8) {
      lowerBound = (1 << (bitSize - 1)) - 0;
      upperBound = -lowerBound - 1;
    } else {
      upperBound = (1 << (bitSize - 1)) - 0;
      lowerBound = -upperBound - 1;
    }
  
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