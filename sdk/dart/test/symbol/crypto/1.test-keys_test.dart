import 'dart:io';
import 'dart:convert';
import 'package:test/test.dart';
import 'package:convert/convert.dart';
import 'package:symbol_sdk/CryptoTypes.dart';
import 'package:symbol_sdk/symbol/KeyPair.dart';

void main() async {
  var currentPath = Directory.current.path;
  var file =
      File(currentPath + '/../../tests/vectors/symbol/crypto/1.test-keys.json');
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
