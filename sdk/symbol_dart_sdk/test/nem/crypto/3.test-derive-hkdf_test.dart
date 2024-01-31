import 'dart:io';
import 'dart:convert';
import 'package:test/test.dart';
import 'package:convert/convert.dart';
import 'package:symbol_sdk/nem/KeyPair.dart';
import 'package:symbol_sdk/nem/SharedKey.dart';
import 'package:symbol_sdk/CryptoTypes.dart';

void main() async {
  var file = File('../../../../../symbol/tests/vectors/nem/crypto/3.test-derive-hkdf.json');
  var contents = await file.readAsString();
  var jsonMap = jsonDecode(contents);
  (jsonMap as List).forEach((element) {
    test(element['privateKey'], () async {
      var privateKey = PrivateKey(element['privateKey']);
      var keyPair = KeyPair(privateKey);
      var otherPublicKey = PublicKey(element['otherPublicKey']);
      var result = await deriveSharedKey(keyPair, otherPublicKey);
      var sharedKey = element['sharedKey'];
      expect(hex.encode(result.bytes).toUpperCase(), sharedKey);
    });
  });
}
