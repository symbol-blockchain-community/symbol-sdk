import './IDeserializable.dart';
import './ISerializable.dart';
import 'dart:typed_data';

class StructBase implements IDeserializable, ISerializable {
  @override
  dynamic deserialize(Uint8List payload){
    throw UnimplementedError();
  }
  @override
  Uint8List serialize(){
    throw UnimplementedError();
  }
}