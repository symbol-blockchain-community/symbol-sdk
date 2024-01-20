abstract class Ordered {}

class BaseValue extends Ordered {
  final int size;
  BigInt value;
  final List<dynamic> _tag;
  final bool signed;

  BaseValue(this.size, this.value, {dynamic tag, this.signed = false})
      : _tag = [tag, signed] {
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

    if (value < lowerBound || value > upperBound) {
      var signedDescription = signed ? 'signed' : 'unsigned';
      var valueRangeMessage = '$value must be in range [$lowerBound, $upperBound]';
      throw ArgumentError('$valueRangeMessage for ${size} bytes ($signedDescription)');
    }
  }

  bool _cmp(BaseValue other, bool Function(BigInt, BigInt) operation) {
    if (other.runtimeType != BaseValue) {
      return false;
    }

    return operation(value, other.value) && _tag == other._tag;
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
      unsignedValue = value;
    } else {
      var upperBoundPlusOne = BigInt.from(1 << (size * 8));
      unsignedValue = value + upperBoundPlusOne;
    }

    return '0x' + unsignedValue.toRadixString(16).padLeft(size * 2, '0');
  }
}