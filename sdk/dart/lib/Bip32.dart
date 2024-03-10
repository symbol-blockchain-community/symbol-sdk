import 'dart:typed_data';
import 'package:bip39_mnemonic/bip39_mnemonic.dart' as bip39;
import 'package:pointycastle/export.dart' as pointy;

import 'CryptoTypes.dart';

class Bip32Node {
  late PrivateKey privateKey;
  late Uint8List chainCode;

  Bip32Node(Uint8List hmacKey, Uint8List data) {
    var hmac = pointy.HMac(pointy.SHA512Digest(), 128)
      ..init(pointy.KeyParameter(hmacKey));
    var hmacResult = hmac.process(data);
    privateKey = PrivateKey(hmacResult.sublist(0, 32));
    chainCode = Uint8List.fromList(hmacResult.sublist(32));
  }

  Bip32Node deriveOne(int identifier) {
    var childData = Uint8List(1 + 32 + 4);
    childData[0] = 0;
    childData[childData.length - 4] = 0x80;

    for (var i = 0; 4 > i; ++i) {
      childData[childData.length - 1 - i] |= (identifier >> (8 * i)) & 0xFF;
    }

    for (var i = 0; i < 32; ++i) {
      childData[1 + i] = privateKey.bytes[i];
    }

    return Bip32Node(chainCode, childData);
  }

  Bip32Node derivePath(List<int> path) {
    var nextNode = this;
    path.forEach((identifier) {
      nextNode = nextNode.deriveOne(identifier);
    });

    return nextNode;
  }
}

class Bip32 {
  late Uint8List rootHmacKey;
  late bip39.Language mnemonicLanguage;

  Bip32(
      [String curveName = 'ed25519',
      bip39.Language mnemonicLanguage = bip39.Language.english]) {
    rootHmacKey = Uint8List.fromList('$curveName seed'.codeUnits);
    this.mnemonicLanguage = mnemonicLanguage;
  }

  Bip32Node fromSeed(Uint8List seed) {
    return Bip32Node(rootHmacKey, seed);
  }

  Bip32Node fromMnemonic(String mnemonic, String password) {
    return fromSeed(Uint8List.fromList(bip39.Mnemonic.fromSentence(
            mnemonic, mnemonicLanguage,
            passphrase: password)
        .seed));
  }

  String random([int seedLength = 32]) {
    var wordList = bip39.Mnemonic.generate(mnemonicLanguage,
        passphrase: '', entropyLength: seedLength * 8);
    return bip39.Mnemonic(wordList.entropy, mnemonicLanguage).sentence;
  }
}
