import 'dart:typed_data';

import 'package:tuple/tuple.dart';
import './converter.dart';
import '../models/IDeserializable.dart';

class ArrayHelpers {
  static dynamic getValue(dynamic e) {
    try {
      return e.comparer();
    } catch (_) {
      return e.value;
    }
  }

  static int deepCompare(dynamic lhs, dynamic rhs) {
    if(lhs is int) lhs = intToUnsignedInt(lhs);
    if(rhs is int) rhs = intToUnsignedInt(rhs);

    if(lhs is Tuple2) lhs = [lhs.item1, lhs.item2];
    if(rhs is Tuple2) rhs = [rhs.item1, rhs.item2];

    if (!(lhs is List) && !(lhs is Uint8List) && !(lhs is Tuple2)) {
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
      readArrayImpl(buffer, FactoryClass, accessor, (_, view) => 0 < view.lengthInBytes);

  static List readArrayCount(Uint8List buffer, IDeserializable FactoryClass, int count, [dynamic accessor]) =>
      readArrayImpl(buffer, FactoryClass, accessor, (index, _) => count > index);

  static List readVariableSizeElements(Uint8List buffer, dynamic FactoryClass, int alignment, [bool skipLastElementPadding = false]) {
    final elements = <dynamic>[];
    while (0 < buffer.lengthInBytes) {
      final element = FactoryClass.deserialize(buffer);

      if (0 >= element.size) throw RangeError('element size has invalid size');

      elements.add(element);

      final alignedSize = (skipLastElementPadding && element.size >= buffer.lengthInBytes)
          ? element.size
          : alignUp(element.size, alignment);
      if (alignedSize > buffer.lengthInBytes) throw RangeError('unexpected buffer length');
      buffer = buffer.sublist(alignedSize);
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
          currentPos = currentPos + alignedSize - elementSize;
        }
      }
    }
    return Tuple2(output, currentPos);
  }

  static bool isDefaultUint8Array(Uint8List array) {
    return array.lengthInBytes == 0 && array[0] == 0;
  }
}
