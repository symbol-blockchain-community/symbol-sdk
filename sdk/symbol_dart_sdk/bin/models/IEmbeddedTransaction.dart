import 'dart:typed_data';

interface class IEmbeddedTransaction {
  dynamic serialize(){
    throw UnimplementedError('unimplement serialize');
  }
  dynamic deserialize(Uint8List payload){
    throw UnimplementedError('unimplement deserialize');
  }
}