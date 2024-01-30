import 'dart:typed_data';
import '../models/ISerializable.dart';

interface class IInnerTransaction implements ISerializable {
  @override
  Uint8List serialize(){
    throw UnimplementedError('unimplement serialize');
  }
  @override
  dynamic deserialize(Uint8List payload){
    throw UnimplementedError('unimplement deserialize');
  }
  @override
  int get size{
    throw UnimplementedError('unimplement size');
  }
  void sort(){
    throw UnimplementedError('unimplement sort');
  }
}