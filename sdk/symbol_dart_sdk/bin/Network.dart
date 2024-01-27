import './NetworkTimestamp.dart';
import './CryptoTypes.dart';
import 'package:hash/hash.dart';

import 'dart:typed_data';

class Network {
  String name;
  int identifier;
  NetworkTimestampDatetimeConverter datetimeConverter;
  Function addressHasher;
  Function createAddress;
  Type addressType;
  Type networkTimestampClass;

  Network(
    this.name, 
    this.identifier, 
    this.datetimeConverter,
    this.addressHasher,
    this.createAddress,
    this.addressType,
    this.networkTimestampClass
  );
  
  Uint8List publicKeyToAddress(PublicKey publicKey) {
    var partOneHashBuilder = addressHasher();
    var partOneHash = partOneHashBuilder.process(publicKey.bytes);
    var partTwoHash = RIPEMD160().update(Uint8List.fromList(partOneHash)).digest();
    var version = Uint8List.fromList([identifier, ...partTwoHash]);
    var partThreeHashBuilder = addressHasher();
    var checksum = Uint8List.fromList(partThreeHashBuilder.process(version).sublist(0, 4));
    return createAddress(version, checksum);
  }
}

abstract class AddressConstructable {
  AddressConstructable();
  static const int ENCODED_SIZE = 0;
}

abstract class Constructable {
  Constructable();
}