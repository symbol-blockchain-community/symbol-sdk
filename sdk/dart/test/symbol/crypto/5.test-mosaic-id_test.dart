import 'dart:io';
import 'dart:convert';
import 'package:test/test.dart';
import 'package:symbol_sdk/utils/converter.dart';
import 'package:symbol_sdk/symbol/Network.dart';
import 'package:symbol_sdk/symbol/idGenerator.dart';

void main() async {
  var file = File('../../../../../symbol/tests/vectors/symbol/crypto/5.test-mosaic-id.json');
  var contents = await file.readAsString();
  var jsonMap = jsonDecode(contents);
  (jsonMap as List).forEach((element) {
    test(element['publicKey'], () {
      expect(intToHex(generateMosaicId(SymbolAddress(element['address_Public']), element['mosaicNonce'])), element['mosaicId_Public']);
      expect(intToHex(generateMosaicId(SymbolAddress(element['address_PublicTest']), element['mosaicNonce'])), element['mosaicId_PublicTest']);
      expect(intToHex(generateMosaicId(SymbolAddress(element['address_Private']), element['mosaicNonce'])), element['mosaicId_Private']);
      expect(intToHex(generateMosaicId(SymbolAddress(element['address_PrivateTest']), element['mosaicNonce'])), element['mosaicId_PrivateTest']);
    });
  });
}
