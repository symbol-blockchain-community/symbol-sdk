import './IDeserializable.dart';
import './ISerializable.dart';
import 'dart:typed_data';

class StructBase implements IDeserializable, ISerializable {
  bool isDefault = false;
  StructBase(bool _isDefault){
    isDefault = _isDefault;
  }
  @override
  dynamic deserialize(Uint8List payload){
    throw UnimplementedError();
  }
  @override
  Uint8List serialize(){
    throw UnimplementedError();
  }
}