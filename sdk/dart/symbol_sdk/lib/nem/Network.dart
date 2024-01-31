import '../Network.dart' as basic_network;
import '../NetworkTimestamp.dart' as basic_timestamp;
import '../ByteArray.dart';
import 'package:base32/base32.dart';
import 'dart:typed_data';
import 'package:pointycastle/export.dart';

class NetworkTimestamp extends basic_timestamp.NetworkTimestamp {
  NetworkTimestamp(int timestamp) : super(timestamp);

  @override
  NetworkTimestamp addSeconds(int count) {
    return NetworkTimestamp(timestamp + count);
  }
}

class NemAddress extends ByteArray {
  // Byte size of raw address.
  static const int SIZE = 25;

  // Length of encoded address string.
  static const int ENCODED_SIZE = 40;

  // Creates a Symbol address.
  NemAddress(dynamic addressInput) : super(SIZE, _extractAddressBytes(addressInput));

  static Uint8List _extractAddressBytes(dynamic addressInput) {
    if (addressInput is String){
      return base32.decode('$addressInput');
    }

    if (addressInput is NemAddress){
      return addressInput.bytes;
    }

    return addressInput;
  }

  // Returns string representation of this object.
  @override
  String toString() {
    return base32.encode(bytes);
  }
}

class Network extends basic_network.Network {
  // Symbol main network.
  static Network MAINNET = Network(
    'mainnet',
    0x68,
    DateTime.utc(2015, 3, 29, 0, 6, 25),
  );

  // Symbol test network.
  static Network TESTNET = Network(
    'testnet',
    0x98,
    DateTime.utc(2015, 3, 29, 0, 6, 25),
  );

  // Symbol well known networks.
  static List<Network> NETWORKS = [MAINNET, TESTNET];

  // Creates a new network with the specified name, identifier byte and generation hash seed.
  Network(String name, int identifier, DateTime epochTime) : 
    super (
      name,
      identifier,
      basic_timestamp.NetworkTimestampDatetimeConverter(epochTime, 'seconds'),
      () => KeccakDigest(256),
      (Uint8List addressWithoutChecksum, Uint8List checksum) =>
          Uint8List.fromList([...addressWithoutChecksum, ...checksum]),
      NemAddress,
      (int timestamp) => NetworkTimestamp(timestamp),
    );
}
