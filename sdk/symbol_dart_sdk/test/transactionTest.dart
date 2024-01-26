import 'dart:io';
import 'dart:convert';
import 'package:test/test.dart';
import 'package:convert/convert.dart';
import '../bin/symbol/models.dart';

void main() async {
  var file = File('/Users/matsukawatoshiya/Desktop/symbol-dart/symbol/tests/vectors/symbol/models/transactions.json');
  var contents = await file.readAsString();
  var jsonMap = jsonDecode(contents);
    (jsonMap as List).forEach((element) {
      test(element['test_name'], () {
      var payload = element['payload'];
      var tx = TransactionFactory().deserialize(payload);
      expect(hex.encode(tx.serialize()).toUpperCase(), payload);
    });
  });
}
