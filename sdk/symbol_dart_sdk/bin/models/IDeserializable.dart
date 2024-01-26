import 'dart:typed_data';

interface class IDeserializable {
  dynamic deserialize(Uint8List payload){
    throw UnimplementedError('unimplement deserialize');
  }
}
