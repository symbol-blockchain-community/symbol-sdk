import 'dart:typed_data';
import 'package:hash/hash.dart';
import 'package:pointycastle/export.dart';

Uint8List ripemdKeccak256(Uint8List payload){
  final digest = KeccakDigest(256);
  var partOneHash = digest.process(payload).sublist(0);
  var ripemd = RIPEMD160();
  return Uint8List.fromList(ripemd.update(partOneHash).digest());
}