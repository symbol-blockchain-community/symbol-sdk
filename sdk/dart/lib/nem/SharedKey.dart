import 'dart:typed_data';
import 'package:symbol_sdk/index.dart';

import '../CryptoTypes.dart';
import 'package:pointycastle/export.dart' as pointy_castle;

void cryptoHash(Uint8List out, Uint8List m) {
  var digest = pointy_castle.KeccakDigest(512);
  var r = digest.process(m);

  for (var i = 0; i < out.length; ++i) {
    out[i] = r[i];
  }
}

final deriveSharedKeyImpl = deriveSharedKeyFactory('nem-nis1', cryptoHash);

SharedKey256 deriveSharedKey(dynamic keyPair, PublicKey otherPublicKey) {
  return deriveSharedKeyImpl(Uint8List.fromList(keyPair.privateKey.bytes.reversed.toList()), otherPublicKey);
}
