import 'dart:io';
import 'dart:convert';
import 'package:test/test.dart';
import '../bin/utils//converter.dart';
import '../bin/CryptoTypes.dart';
import '../bin/symbol/Network.dart';
import '../bin/Bip32.dart';
import 'package:bip39_mnemonic/bip39_mnemonic.dart' as bip39;

final DETERIMINISTIC_SEED = hexToBytes('000102030405060708090A0B0C0D0E0F');
const DETERIMINISTIC_MNEMONIC = 'cat swing flag economy stadium alone churn speed unique patch report train';

void main() async {
  test('test', () {
    var node = Bip32().fromMnemonic(DETERIMINISTIC_MNEMONIC, 'TREZOR');
    var childNode0 = node.derivePath([44, 4343, 0, 0, 0]);
    expect(childNode0.privateKey.bytes, PrivateKey('1455FB18AB105444763EED593B7CA1C53EF6DDF8BDA1AB7004276FEAB1FCF222').bytes);
  });
}
