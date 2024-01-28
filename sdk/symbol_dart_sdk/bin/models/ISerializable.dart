import 'dart:typed_data';

interface class ISerializable {
  Uint8List serialize(){
    throw UnimplementedError('unimplement deserialize');
  }
}
