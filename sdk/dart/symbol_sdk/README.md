SymbolとNEMで両方使えるSDKです。
TransferTransactionのサンプルです。
基本的にはjavascriptやpythonと同じ使い方ができます。

```dart
import 'package:symbol_sdk/index.dart';
import 'package:symbol_sdk/CryptoTypes.dart' as ct;
import 'package:symbol_sdk/symbol/index.dart';
import 'package:http/http.dart' as http;

void main(){
  var facade = SymbolFacade(Network.TESTNET);
  var keyPair = KeyPair(ct.PrivateKey('PRIVATE_KEY'));
  var tx = TransferTransactionV1(
    network: NetworkType.TESTNET,
    deadline: Timestamp(facade.network.fromDatetime(DateTime.now().toUtc()).addHours(2).timestamp),
    signerPublicKey: PublicKey(keyPair.publicKey.bytes),
    recipientAddress: UnresolvedAddress('TA5LGYEWS6L2WYBQ75J2DGK7IOZHYVWFWRLOFWI'),
    message: utf8ToBytes('Hello, Symbol!!')
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
  });
}
```