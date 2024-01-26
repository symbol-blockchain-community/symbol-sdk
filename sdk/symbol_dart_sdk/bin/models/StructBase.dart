import './IDeserializable.dart';
import 'dart:typed_data';

class StructBase implements IDeserializable {
  bool isDefault = false;
  StructBase(bool _isDefault){
    isDefault = _isDefault;
  }
  @override
  dynamic deserialize(Uint8List payload){
    throw UnimplementedError();
  }
}