import 'dart:typed_data';
import './KeyPair.dart';
import '../CryptoTypes.dart';

void setBuffer(ByteData destination, int offset, List<int> source) {
  for (var i = 0; i < source.length; i++) {
    destination.setUint8(offset + i, source[i]);
  }
}

class VotingKeysGenerator {
  KeyPair rootKeyPair;
  Function privateKeyGenerator;

  VotingKeysGenerator(KeyPair rootKeyPair, [Function privateKeyGenerator = PrivateKey.random]): 
    privateKeyGenerator = privateKeyGenerator,
    rootKeyPair = rootKeyPair;

  Uint8List generate(int startEpoch, int endEpoch) {
    const HEADER_SIZE = 80;
    const EPOCH_ENTRY_SIZE = 96;

    var numEpochs = endEpoch - startEpoch + 1;
    var buffer = ByteData(HEADER_SIZE + (EPOCH_ENTRY_SIZE * numEpochs));

    buffer.setUint64(0, startEpoch, Endian.little); // start key identifier
    buffer.setUint64(8, endEpoch, Endian.little); // end key identifier
    buffer.setUint64(16, 0xFFFFFFFFFFFFFFFF, Endian.little); // reserved - last (used) key identifier
    buffer.setUint64(24, 0xFFFFFFFFFFFFFFFF, Endian.little); // reserved - last wiped key identifier

    setBuffer(buffer, 32, rootKeyPair.publicKey.bytes); // root voting public key
    buffer.setUint64(64, startEpoch, Endian.little); // level 1/1 start key identifier
    buffer.setUint64(72, endEpoch, Endian.little); // level 1/1 end key identifier

    for (var i = 0; i < numEpochs; i++) {
      var identifier = endEpoch - i;
      var childPrivateKey = privateKeyGenerator();
      var childKeyPair = KeyPair(childPrivateKey);

      var parentSignedPayloadBuffer = ByteData(40);
      setBuffer(parentSignedPayloadBuffer, 0, childKeyPair.publicKey.bytes);
      parentSignedPayloadBuffer.setUint64(32, identifier, Endian.little);
      var signature = rootKeyPair.sign(parentSignedPayloadBuffer.buffer.asUint8List());

      var startOffset = HEADER_SIZE + (EPOCH_ENTRY_SIZE * i);
      setBuffer(buffer, startOffset, childKeyPair.privateKey.bytes); // child voting private key used to sign votes for an epoch
      setBuffer(buffer, startOffset + PrivateKey.SIZE, signature.bytes); // signature proving derivation of child key pair from root
    }

    return buffer.buffer.asUint8List();
  }
}