import 'dart:io';
import 'dart:convert';
import 'package:test/test.dart';
import 'package:symbol_sdk/utils/converter.dart';
import 'package:symbol_sdk/CryptoTypes.dart';
import 'package:symbol_sdk/nem/Network.dart';

void main() async {
  var currentPath = Directory.current.path;
  var file =
      File(currentPath + '/../../tests/vectors/nem/crypto/1.test-address.json');
  var contents = await file.readAsString();
  var jsonMap = jsonDecode(contents);
  (jsonMap as List).forEach((element) {
    test(element['publicKey'], () {
      var publicKey = PublicKey(element['publicKey']);
      var mainNetwork = Network.MAINNET;
      var testNetwork = Network.TESTNET;
      var testAddress =
          addressToString(testNetwork.publicKeyToAddress(publicKey));
      var mainAddress =
          addressToString(mainNetwork.publicKeyToAddress(publicKey));
      expect(mainAddress, element['address_Public']);
      expect(testAddress, element['address_PublicTest']);
    });
  });
}
