import 'dart:io';
import 'dart:convert';
import 'package:test/test.dart';
import 'package:convert/convert.dart';
import '../../../bin/symbol/KeyPair.dart';
import '../../../bin/symbol/SharedKey.dart';
import '../../../bin/CryptoTypes.dart';
import '../../../bin/impl/CiperHelper.dart';
import '../../../bin/utils/converter.dart';

void main() async {
  var file = File('../../../../../symbol/tests/vectors/symbol/crypto/4.test-cipher.json');
  var contents = await file.readAsString();
  var jsonMap = jsonDecode(contents);
  (jsonMap as List).forEach((element) {
    test(element['privateKey'], () async {
      var privateKey = PrivateKey(element['privateKey']);
      var keyPair = KeyPair(privateKey);
      var recipientPublicKey = PublicKey(element['otherPublicKey']);
      var clearText = hexToBytes(element['clearText']);
      var iv = element['iv'];
      final result = await encodeAesGcm(deriveSharedKey, keyPair, recipientPublicKey, clearText, hexToBytes(iv));
      var tag = element['tag'];
      var cipherText = element['cipherText'];
      expect(hex.encode(result['tag']).toUpperCase(), tag);
      expect(hex.encode(result['cipherText']).toUpperCase(), cipherText);
    });
  });
}
