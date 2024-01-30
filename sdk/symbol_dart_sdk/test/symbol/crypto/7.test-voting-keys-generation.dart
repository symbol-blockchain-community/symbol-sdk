import 'dart:io';
import 'dart:convert';
import 'package:test/test.dart';
import '../../../bin/symbol/KeyPair.dart';
import '../../../bin/CryptoTypes.dart';
import '../../../bin/symbol/VotingKeysGenerator.dart';
import '../../../bin/utils/converter.dart';

void votingKeyGeneratorTest(String path) async {
  var file = File(path);
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
void main() async {
  votingKeyGeneratorTest('../../../../../symbol/tests/vectors/symbol/crypto/7.test-voting-keys-generation.json');
}
