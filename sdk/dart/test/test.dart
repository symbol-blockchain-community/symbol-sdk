import 'package:symbol_sdk/CryptoTypes.dart';
import 'package:symbol_sdk/index.dart';
import 'package:symbol_sdk/symbol/KeyPair.dart';
import 'package:symbol_sdk/symbol/SharedKey.dart';
import 'package:symbol_sdk/symbol/index.dart' as symbol;

void main() {
  print(bytesToHex(utf8ToBytes('Hello \ud83d\udc4b')));
  var sharedKey = deriveSharedKey(KeyPair(PrivateKey('00137C7C32881D1FFF2E905F5B7034BCBCDB806D232F351DB48A7816285C548F')), PublicKey('FDEE3C7A41F4717D18B5BFFD685C3C43DFFDC3F8E168AA1B237E1EBF8E9BC869'));
  print(bytesToHex(sharedKey.bytes));
}