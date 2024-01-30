import 'dart:typed_data';

interface class ISerializable {
  Uint8List serialize(){
    throw UnimplementedError('unimplement deserialize');
  }
  dynamic deserialize(Uint8List payload){
    throw UnimplementedError('unimplement deserialize');
  }
}
