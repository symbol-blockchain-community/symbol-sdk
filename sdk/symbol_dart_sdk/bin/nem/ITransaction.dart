import '../models/IInnerTransaction.dart';
import './models.dart';
import 'dart:typed_data';

interface class ITransaction implements IInnerTransaction {
  Signature signature = Signature();
  PublicKey signerPublicKey = PublicKey();
  @override
  int get size{
    throw UnimplementedError('unimplement size');
  }
  @override
  dynamic deserialize(Uint8List payload){
    throw UnimplementedError('unimplement deserialize');
  }
  @override
  Uint8List serialize(){
    throw UnimplementedError('unimplement serialize');
  }
  void sort(){
    throw UnimplementedError('unimplement sort');
  }
}