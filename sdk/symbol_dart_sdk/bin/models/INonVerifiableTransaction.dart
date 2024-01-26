import 'dart:typed_data';

interface class INonVerifiableTransaction {
  dynamic serialize(){
    throw UnimplementedError('unimplement serialize');
  }
  dynamic deserialize(Uint8List payload){
    throw UnimplementedError('unimplement deserialize');
  }
  int get size{
    throw UnimplementedError('unimplement size');
  }
  void sort(){
    throw UnimplementedError('unimplement sort');
  }
}