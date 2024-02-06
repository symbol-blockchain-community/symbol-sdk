import 'dart:io';
import 'dart:convert';
import 'package:test/test.dart';
import 'package:symbol_sdk/symbol/KeyPair.dart';
import 'package:symbol_sdk/CryptoTypes.dart';
import 'package:symbol_sdk/symbol/VotingKeysGenerator.dart';
import 'package:symbol_sdk/utils/converter.dart';

void main() async {
  var file = File('../../../../../tests/vectors/symbol/crypto/7.test-voting-keys-generation.json');
  var contents = await file.readAsString();
  var jsonMap = jsonDecode(contents);
  (jsonMap as List).forEach((element) {
    test(element['name'], () {
      var rootPrivateKey = element['rootPrivateKey'];
      var startEpoch = element['startEpoch'];
      var endEpoch = element['endEpoch'];
      var expectedFileHex = element['expectedFileHex'];
      var votingKeysGenerator = VotingKeysGenerator(KeyPair(PrivateKey(rootPrivateKey)));
      var key = votingKeysGenerator.generate(startEpoch, endEpoch);
      expect(bytesToHex(key.sublist(0, 80)), (expectedFileHex as String).substring(0, 160));
    });
  });
}
