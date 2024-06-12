import 'dart:convert';
import 'dart:typed_data';

import 'package:symbol_sdk/index.dart';
import 'package:symbol_sdk/CryptoTypes.dart' as ct;
import 'package:symbol_sdk/symbol/index.dart';
//import 'package:http/http.dart' as http;
//import 'dart:convert';

void main() {
  var facade = SymbolFacade(Network.TESTNET);
  var address =
      Address(hexToBytes('99D63C374D96D7ACAE000000000000000000000000000000'));
  print(address.toString());
  /* 
  var bip32 = Bip32();
  var mnemonic = Bip32().random();
  var bip32Node = bip32.fromMnemonic(mnemonic, 'password');
  var childNode = bip32Node.derivePath([44, 4343, 0, 0, 0]);
  print(bip32Node.privateKey);
  var keyPair = KeyPair(childNode.privateKey);
  var publicKey = keyPair.publicKey;
  var address = Address(facade.network.publicKeyToAddress(publicKey));
  print(keyPair.privateKey);
  print(publicKey);
  print(address);

  var aliceKeyPair = KeyPair(ct.PrivateKey(
      '5DB8324E7EB83E7665D500B014283260EF312139034E86DFB7EE736503EAEC02'));
  var bobKeyPair = KeyPair(ct.PrivateKey(
      'E3839324F3CD2FC194F6E1C501D4D2CFD0DC8CCAC4307AC328E3154FF00951B9'));
  var recipientAddress = '686637E0AC4EE1AF1FBE00643738E1BAEDC6F3318214702D';
  print(addressToString(hexToBytes(recipientAddress))); */
/* 
    var transferTx = tx as EmbeddedTransferTransactionV1;
    transferTx.mosaics.map((mosaic) {
      print(mosaic.amount.value);
    });
    print(transferTx.recipientAddress.pretty());
    print(transferTx.mosaics[0].amount.value);
  
  }
});
var deserializedTransferTransaction =
    deserializedTx.transactions[1] as EmbeddedTransferTransactionV1;
print(deserializedTransferTransaction.mosaics[0].amount.value);
 */
  /* var address = addressToString(facade.network
      .publicKeyToAddress(ct.PublicKey(tx.signerPublicKey.bytes)));
  var body = {
    'addresses': [address]
  };
  http
      .post(
          Uri.parse(
              'http://sym-test-01.opening-line.jp:3000/namespaces/account/names'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(body))
      .then((response) {
    var result = jsonDecode(response.body);
    print("${result['accountNames'][0]['names'][0]}からの署名です");
  }); */

  /* var hash = facade.hashTransaction(tx);
  print(hash); */

  /* http
      .put(Uri.parse('http://sym-test-01.opening-line.jp:3000/transactions'),
          headers: {'Content-Type': 'application/json'}, body: payload)
      .then((response) {
    print(response.body);
  }); */
}
