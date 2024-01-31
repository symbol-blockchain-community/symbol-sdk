import 'dart:io';
import 'dart:convert';
import 'package:test/test.dart';
import '../../../bin/utils/converter.dart';
import '../../../bin/CryptoTypes.dart';
import '../../../bin/nem/Network.dart';

void main() async {
  var file = File('../../../../../symbol/tests/vectors/nem/crypto/1.test-address.json');
  var contents = await file.readAsString();
  var jsonMap = jsonDecode(contents);
  (jsonMap as List).forEach((element) {
    test(element['publicKey'], () {
      var publicKey = PublicKey(element['publicKey']);
      var mainNetwork = Network.MAINNET;
      var testNetwork = Network.TESTNET;
      var testAddress = addressToString(testNetwork.publicKeyToAddress(publicKey));
      var mainAddress = addressToString(mainNetwork.publicKeyToAddress(publicKey));
      expect(mainAddress, element['address_Public']);
      expect(testAddress, element['address_PublicTest']);
    });
  });
}