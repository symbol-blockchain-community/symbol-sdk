import 'dart:typed_data';
import '../CryptoTypes.dart';
import 'package:pointycastle/export.dart' as pc;

class MerkleHashBuilder {
  List<Uint8List> hashes = [];

  void update(Hash256 componentHash) {
    hashes.add(componentHash.bytes);
  }

  Hash256 final_() {
    if (hashes.isEmpty) {
      return Hash256.zero();
    }

    var numRemainingHashes = hashes.length;
    while (1 < numRemainingHashes) {
      var i = 0;
      while (i < numRemainingHashes) {
        var hasher = pc.SHA3Digest(256);
        hasher.update(hashes[i], 0, hashes[i].length);

        if (i + 1 < numRemainingHashes) {
          hasher.update(hashes[i + 1], 0, hashes[i + 1].length);
        } else {
          // if there is an odd number of hashes, duplicate the last one
          hasher.update(hashes[i], 0, hashes[i].length);
          numRemainingHashes += 1;
        }

        hasher.doFinal(hashes[(i / 2).floor()], 0);
        i += 2;
      }

      numRemainingHashes = (numRemainingHashes / 2).floor();
    }

    return Hash256(hashes[0]);
  }
}