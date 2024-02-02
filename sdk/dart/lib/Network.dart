import './NetworkTimestamp.dart';
import './CryptoTypes.dart';
import 'package:pointycastle/digests/ripemd160.dart';
import 'dart:typed_data';

class Network {
  String name;
  int identifier;
  NetworkTimestampDatetimeConverter datetimeConverter;
  Function addressHasher;
  Function createAddress;
  Type addressClass;
  NetworkTimestamp Function(int) networkTimestampFactory;

  Network(
    this.name, 
    this.identifier, 
    this.datetimeConverter,
    this.addressHasher,
    this.createAddress,
    this.addressClass,
    this.networkTimestampFactory,
  );
  
  Uint8List publicKeyToAddress(PublicKey publicKey) {
    var partOneHashBuilder = addressHasher();
    var partOneHash = partOneHashBuilder.process(publicKey.bytes);
    var partTwoHash = RIPEMD160Digest().process(partOneHash);
    var version = Uint8List.fromList([identifier, ...partTwoHash]);
    var partThreeHashBuilder = addressHasher();
    var checksum = partThreeHashBuilder.process(version).sublist(0, 4);
    return createAddress(version, checksum);
  }

  DateTime toDatetime(NetworkTimestamp referenceNetworkTimestamp) {
    return datetimeConverter.toDatetime(referenceNetworkTimestamp.timestamp);
  }

  NetworkTimestamp fromDatetime(DateTime referenceDatetime) {
    return networkTimestampFactory(datetimeConverter.toDifference(referenceDatetime));
  }
}

class NetworkLocator {
  static Network findByName(List<Network> networks, dynamic singleOrMultipleNames) {
    var names = singleOrMultipleNames is List<String> ? singleOrMultipleNames : [singleOrMultipleNames];
    try {
      return networks.firstWhere((network) => names.any((name) => name == network.name));
    } catch (e) {
      throw RangeError('no network found with name ${names.join(', ')}');
    }
  }

  static Network findByIdentifier(List<Network> networks, dynamic singleOrMultipleIdentifiers) {
    var identifiers = singleOrMultipleIdentifiers is List<int> ? singleOrMultipleIdentifiers : [singleOrMultipleIdentifiers];
    try {
      return networks.firstWhere((network) => identifiers.any((identifier) => identifier == network.identifier));
    } catch (e) {
      throw RangeError('no network found with identifier ${identifiers.join(', ')}');
    }
  }
}