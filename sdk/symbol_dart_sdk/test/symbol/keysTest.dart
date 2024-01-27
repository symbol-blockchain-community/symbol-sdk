import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'package:test/test.dart';
import 'package:convert/convert.dart';
import '../../bin/CryptoTypes.dart';
import '../../bin/symbol/KeyPair.dart';

void signTest(String path) async {
  var file = File(path);
  var contents = await file.readAsString();
  var jsonMap = jsonDecode(contents);
  (jsonMap as List).forEach((element) {
    test(element['publicKey'], () {
      var privateKey = PrivateKey(element['privateKey']);
      var publicKey = element['publicKey'];
      var keyPair = KeyPair(privateKey);
      expect(hex.encode(keyPair.publicKey.bytes).toUpperCase(), publicKey);
    });
  });
}
void main() async {
  signTest('../../../../../symbol/tests/vectors/symbol/crypto/1.test-keys.json');
}
