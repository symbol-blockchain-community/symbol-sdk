import 'package:symbol_sdk/CryptoTypes.dart';
import 'package:symbol_sdk/index.dart';
import 'package:symbol_sdk/symbol/index.dart' as symbol;

void main() {
  var a = Bip32().random();
  print(a);
}