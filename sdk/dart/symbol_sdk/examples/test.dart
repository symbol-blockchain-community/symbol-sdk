import 'dart:convert';
import 'dart:typed_data';

import 'package:symbol_sdk/symbol/index.dart';
import 'package:symbol_sdk/index.dart';
import 'package:symbol_sdk/CryptoTypes.dart' as ct;
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart' as crypto;

void main() async {
  var alicePrivateKey = ct.PrivateKey('5DB8324E7EB83E7665D500B014283260EF312139034E86DFB7EE736503EAEC02');
  var bobPrivateKey = ct.PrivateKey('E3839324F3CD2FC194F6E1C501D4D2CFD0DC8CCAC4307AC328E3154FF00951B9');
  var aliceKeyPair = KeyPair(alicePrivateKey);
  var bobKeyPair = KeyPair(bobPrivateKey);
  var messageEncorder = MessageEncorder(aliceKeyPair);
  var clearText = hexToBytes('86DDB9E713A8EBF67A51830EFF03B837E147C20D75E67B2A54AA29E98C');
  var encoded = messageEncorder.encode(bobKeyPair.publicKey, clearText);
  print(encoded);

  var bobEncorder = MessageEncorder(bobKeyPair);
  var decoded = bobEncorder.tryDecode(aliceKeyPair.publicKey, encoded);
  print(bytesToHex(decoded['message']));

  /* 
  var tx = TransferTransactionV1(
    network: NetworkType.TESTNET,
    deadline: Timestamp(facade.network.fromDatetime(DateTime.now().toUtc()).addHours(2).timestamp),
    signerPublicKey: PublicKey(keyPair.publicKey.bytes),
    recipientAddress: UnresolvedAddress('TA5LGYEWS6L2WYBQ75J2DGK7IOZHYVWFWRLOFWI'),
    message: utf8ToBytes('Hello, Symbol!!'),
    mosaics: [UnresolvedMosaic(mosaicId: UnresolvedMosaicId('56148181AF8A6CFC'), amount: Amount(1))],
  );
  tx.fee = Amount(tx.size * 100);
  var signature = facade.signTransaction(keyPair, tx);
  var payload = facade.attachSignature(tx, signature);
  var hash = facade.hashTransaction(tx);
  print(hash);

  http.put(
    Uri.parse('http://sym-test-01.opening-line.jp:3000/transactions'),
    headers: {'Content-Type': 'application/json'},
    body: payload)
    .then((response) {
      print(response.body);
  }); */
}