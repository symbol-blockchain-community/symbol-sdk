import 'dart:typed_data';

interface class IEmbeddedTransaction {
  dynamic deserialize(Uint8List payload){
    throw UnimplementedError('unimplement deserialize');
  }
}