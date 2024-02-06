import 'dart:io';
import 'dart:convert';
import 'package:test/test.dart';
import 'package:symbol_sdk/symbol/KeyPair.dart';
import 'package:symbol_sdk/utils/converter.dart';
import 'package:symbol_sdk/Bip32.dart';

void nodeTest(Bip32Node node, List<dynamic> children, String rootPublicKey, List<List<int>> childrenPath, List<String> childrenPublicKey) async {
  var rootKeyPair = KeyPair(node.privateKey);
  expect(rootKeyPair.publicKey.toString(), rootPublicKey);
  for(var i = 0; i < children.length; i++){
    var childNode = node.derivePath(childrenPath[i]);
    var childKeyPair = KeyPair(childNode.privateKey);
    expect(childKeyPair.publicKey.toString(), childrenPublicKey[i]);
  }
}

void main() async {
  var file = File('../../../../../tests/vectors/symbol/crypto/6.test-hd-derivation.json');
  var contents = await file.readAsString();
  var jsonMap = jsonDecode(contents);
  var counter = 0;
  var publicNet = jsonMap['public_net'];
  var testVectors = jsonMap['test_vectors'];
  
  publicNet.forEach((element) {
    test(counter, () async {
      var mnemonic = element['mnemonic'];
      var seed = element['seed'];
      var passphrase = element['passphrase'];
      var rootPublicKey = element['rootPublicKey'];
      var children = element['childAccounts'] as List<dynamic>;
      var childrenPath = <List<int>>[];
      var childrenPublicKey = <String>[];
      children.forEach((child) {
        childrenPath.add((child['path'] as List<dynamic>).map((item) => item as int).toList());
        childrenPublicKey.add(child['publicKey']);
      });
      if(mnemonic != null) {  
        var node = Bip32().fromMnemonic(mnemonic, passphrase);
        nodeTest(node, children, rootPublicKey, childrenPath, childrenPublicKey);
      }
      if(seed != null){
        var node = Bip32().fromSeed(hexToBytes(seed));
        nodeTest(node, children, rootPublicKey, childrenPath, childrenPublicKey);
      }
    });
    counter++;
  });

  testVectors.forEach((element) {
    test(counter, () async {
      var mnemonic = element['mnemonic'];
      var seed = element['seed'];
      var passphrase = element['passphrase'];
      var rootPublicKey = element['rootPublicKey'];
      var children = element['childAccounts'] as List<dynamic>;
      var childrenPath = <List<int>>[];
      var childrenPublicKey = <String>[];
      children.forEach((child) {
        childrenPath.add((child['path'] as List<dynamic>).map((item) => item as int).toList());
        childrenPublicKey.add(child['publicKey']);
      });
      if(mnemonic != null) {  
        var node = Bip32().fromMnemonic(mnemonic, passphrase);
        nodeTest(node, children, rootPublicKey, childrenPath, childrenPublicKey);
      }
      if(seed != null){
        var node = Bip32().fromSeed(hexToBytes(seed));
        nodeTest(node, children, rootPublicKey, childrenPath, childrenPublicKey);
      }
    });
    counter++;
  });
}
