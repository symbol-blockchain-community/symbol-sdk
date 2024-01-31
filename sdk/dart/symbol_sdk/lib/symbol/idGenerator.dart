import 'dart:typed_data';
import './Network.dart';
import '../utils/converter.dart';
import 'package:pointycastle/export.dart';

final NAMESPACE_FLAG = 1 << 63;

int generateMosaicId(SymbolAddress ownerAddress, int nonce) {
  final hasher = SHA3Digest(256);
  hasher.update(intToBytes(nonce, 4), 0, 4);
  hasher.update(ownerAddress.bytes, 0, ownerAddress.bytes.length);
  var digest = Uint8List(32);
  hasher.doFinal(digest, 0);

  var result = bytesToInt(digest, 8);
  if (result & NAMESPACE_FLAG != 0){
    result -= NAMESPACE_FLAG;
  }
  return result;
}

int generateNamespaceId(dynamic name, [int parentNamespaceId = 0]) {
  if (name is String) {
    name = Uint8List.fromList(name.codeUnits);
  }
  final hasher = SHA3Digest(256);
  hasher.update(intToBytes((parentNamespaceId & 0xFFFFFFFF).toInt(), 4), 0, 4);
  hasher.update(intToBytes(((parentNamespaceId >> 32) & 0xFFFFFFFF).toInt(), 4), 0, 4);
  hasher.update(name, 0, name.length);
  var digest = Uint8List(32);
  hasher.doFinal(digest, 0);
  print(bytesToHex(digest));
  
  final result = bytesToInt(digest, 8);
  return result | NAMESPACE_FLAG;
}

bool isValidNamespaceName(String name) {
  bool isAlphanum(String character) => 
    ('a'.codeUnitAt(0) <= character.codeUnitAt(0) && character.codeUnitAt(0) <= 'z'.codeUnitAt(0)) || 
    ('0'.codeUnitAt(0) <= character.codeUnitAt(0) && character.codeUnitAt(0) <= '9'.codeUnitAt(0));
  
  if (name.isEmpty || !isAlphanum(name[0])){
    return false;
  }

  for (var i = 0; i < name.length; i++) {
    final ch = name[i];
    if (!isAlphanum(ch) && '_' != ch && '-' != ch){
      return false;
    }
  }

  return true;
}

List<int> generateNamespacePath(String fullyQualifiedName) {
  final path = <int>[];
  var parentNamespaceId = 0;
  for (var name in fullyQualifiedName.split('.')) {
    if (!isValidNamespaceName(name)){
      throw ArgumentError('fully qualified name is invalid due to invalid part name ($fullyQualifiedName)');
    }

    path.add(generateNamespaceId(name, parentNamespaceId));
    parentNamespaceId = path.last;
  }

  return path;
}