import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'package:test/test.dart';
import 'package:convert/convert.dart';
import 'package:symbol_sdk/nem/KeyPair.dart';
import 'package:symbol_sdk/CryptoTypes.dart';

void main() async {
  var currentPath = Directory.current.path;
  var file =
      File(currentPath + '/../../tests/vectors/nem/crypto/2.test-sign.json');
  var contents = await file.readAsString();
  var jsonMap = jsonDecode(contents);
  (jsonMap as List).forEach((element) {
    test(element['privateKey'], () {
      var privateKey = PrivateKey(element['privateKey']);
      var publicKey = element['publicKey'];
      var keyPair = KeyPair(privateKey);
      var data = Uint8List.fromList(hex.decode(element['data']));
      var signed = keyPair.sign(data);
      var signature = element['signature'];
      expect(hex.encode(keyPair.publicKey.bytes).toUpperCase(), publicKey);
      expect(hex.encode(signed.bytes).toUpperCase(), signature);
    });
  });
}
