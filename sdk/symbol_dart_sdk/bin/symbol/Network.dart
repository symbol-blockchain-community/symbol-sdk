import '../Network.dart' as basic_network;
import '../NetworkTimestamp.dart' as basic_timestamp;
import '../ByteArray.dart';
import '../CryptoTypes.dart';
import 'package:base32/base32.dart';
import 'dart:typed_data';
import 'package:pointycastle/export.dart';

class NetworkTimestamp extends basic_timestamp.NetworkTimestamp {
  NetworkTimestamp(int timestamp) : super(timestamp);

  NetworkTimestamp addMilliseconds(int count) {
    return NetworkTimestamp(timestamp + count);
  }

  @override
  NetworkTimestamp addSeconds(int count) {
    return addMilliseconds(1000 * count);
  }
}

class Address extends ByteArray {
  // Byte size of raw address.
  static const int SIZE = 24;

  // Length of encoded address string.
  static const int ENCODED_SIZE = 39;

  // Creates a Symbol address.
  Address(dynamic addressInput) : super(SIZE, _extractAddressBytes(addressInput));

  static Uint8List _extractAddressBytes(dynamic addressInput) {
    if (addressInput is String){
      return base32.decode('${addressInput}A').sublist(0, -1);
    }

    if (addressInput is Address){
      return addressInput.bytes;
    }

    return addressInput;
  }

  // Returns string representation of this object.
  @override
  String toString() {
    return base32.encode(Uint8List.fromList([...bytes, 0])).substring(0, -1);
  }
}

class Network extends basic_network.Network {
  // Symbol main network.
  static Network MAINNET = Network(
    'mainnet',
    0x68,
    DateTime.utc(2021, 2, 16, 0, 6, 25),
    Hash256('57F7DA205008026C776CB6AED843393F04CD458E0AA2D9F1D5F31A402072B2D6'),
  );

  // Symbol test network.
  static Network TESTNET = Network(
    'testnet',
    0x98,
    DateTime.utc(2022, 9, 31, 21, 7, 47),
    Hash256('49D6E1CE276A85B70EAFE52349AACCA389302E7A9754BCF1221E79494FC665A4'),
  );

  // Symbol well known networks.
  static List<Network> NETWORKS = [MAINNET, TESTNET];

  // Network generation hash seed.
  Hash256 generationHashSeed;

  // Creates a new network with the specified name, identifier byte and generation hash seed.
  Network(String name, int identifier, DateTime epochTime, Hash256 generationHashSeed)
    : generationHashSeed = generationHashSeed,
    super(
      name,
      identifier,
      basic_timestamp.NetworkTimestampDatetimeConverter(epochTime, 'milliseconds'),
      () => SHA3Digest(256),
      (Uint8List addressWithoutChecksum, Uint8List checksum) =>
          Uint8List.fromList([...addressWithoutChecksum, ...checksum.sublist(0, 3)]),
      Address,
      NetworkTimestamp,
    );
}
