import 'package:symbol_sdk/index.dart';
import 'package:symbol_sdk/CryptoTypes.dart' as ct;
import 'package:symbol_sdk/symbol/index.dart';
import 'package:http/http.dart' as http;
import 'package:collection/collection.dart';

void main(){
/*   var facade = SymbolFacade(Network.TESTNET);
  var aliceKeyPair = KeyPair(ct.PrivateKey('PRIVATE_KEY'));
  var bobKeyPair = KeyPair(ct.PrivateKey('PRIVATE_KEY')); */
  var facade = SymbolFacade(Network.TESTNET);
  var alicePublicKey1 = PublicKey('13B00FBB13C7644E13BD786F0EA4F97820022A2606759793A5D3525A03F92A2F');
  var alicePublicKey2 = PublicKey('13B00FBB13C7644E13BD786F0EA4F97820022A2606759793A5D3525A03F92A2F');
  var aliceAddress1 = facade.network.publicKeyToAddress(ct.PublicKey(alicePublicKey1.bytes));
  var aliceAddress2 = facade.network.publicKeyToAddress(ct.PublicKey(alicePublicKey2.bytes));
  print(addressToString(aliceAddress1)); // これはaliceのアドレス
  print(alicePublicKey1 == alicePublicKey2); // これはfalseになります
  print(ListEquality().equals(alicePublicKey1.bytes, alicePublicKey2.bytes)); // これはtrueになります
  print(addressToString(aliceAddress1) == addressToString(aliceAddress2)); // これはtrueになります


  /* var innerTx = [
    EmbeddedTransferTransactionV1(
      network: NetworkType.TESTNET,
      signerPublicKey: PublicKey(aliceKeyPair.publicKey.bytes),
      recipientAddress: UnresolvedAddress(facade.network.publicKeyToAddress(bobKeyPair.publicKey)),
    ),
    EmbeddedTransferTransactionV1(
      network: NetworkType.TESTNET,
      signerPublicKey: PublicKey(bobKeyPair.publicKey.bytes),
      recipientAddress: UnresolvedAddress(facade.network.publicKeyToAddress(aliceKeyPair.publicKey)),
    )
  ];
  var markleHash = SymbolFacade.hashEmbeddedTransactions(innerTx);
  var aggTx = AggregateCompleteTransactionV2(
    network: NetworkType.TESTNET,
    deadline: Timestamp(facade.network.fromDatetime(DateTime.now().toUtc()).addHours(2).timestamp),
    transactions: innerTx,
    transactionsHash: Hash256(markleHash.bytes),
  );
  aggTx.fee = Amount((aggTx.size + 1 * 104) * 100); // cosignatureが必要な場合は必要な人数×104
  var signature = facade.signTransaction(aliceKeyPair, aggTx);
  facade.attachSignature(aggTx, signature); // 署名をトランザクションにセット
  print(bytesToHex(aggTx.serialize())); // payloadを出力する

  // ここから連署
  // payloadからトランザクションを復元
  var tx = TransactionFactory().deserialize('4801000000000000E06DED76F5ABECDA7C8EEF2C0C7821A39B90D0E1DAB7DFBDF83F5CBAFECCB14845DF1AF42C068AAD4669773B8BD87BC3A3036ABD57EFB27B6756893CD2C2D50B13B00FBB13C7644E13BD786F0EA4F97820022A2606759793A5D3525A03F92A2F0000000002984141C0A800000000000031E95DAC090000001C8A83A94BCCCBC9B20F6FF38221E75532655C1F407FCB0BB6B2D6751DEC6FDDA000000000000000500000000000000013B00FBB13C7644E13BD786F0EA4F97820022A2606759793A5D3525A03F92A2F0000000001985441983AB360969797AB6030FF53A1995F43B27C56C5B456E2D9000000000000000050000000000000004C4BD7F8E1E1AC61DB817089F9416A7EDC18339F06CDC851495B271533FAD13B0000000001985441982982FFFC666CB09288FCB4B8F820E8B0B5F77093075AEF0000000000000000');
  // 念の為aliceが署名しているか確認
  var isAliceSigned = facade.verifyTransaction(tx, ct.Signature((tx as AggregateCompleteTransactionV2).signature.bytes));
  print(isAliceSigned); // trueならaliceが署名していることが確認できる
  var hash = facade.hashTransaction(tx);
  // Cosignatureの作成
  var cosignature = Cosignature(
    signerPublicKey: PublicKey(bobKeyPair.publicKey.bytes),
    // 連署する txのhashに対しての署名
    signature: Signature(bobKeyPair.sign(hash.bytes).bytes),
  );
  // cosignatureのセット
  tx.cosignatures = [cosignature];

  var transactionBuffer = tx.serialize();
  var hexPayload = bytesToHex(transactionBuffer);
  // putするためのjsonを作成
  var payload = '{"payload": "$hexPayload"}';

  http.put(
    Uri.parse('http://sym-test-01.opening-line.jp:3000/transactions'),
    headers: {'Content-Type': 'application/json'},
    body: payload)
    .then((response) {
      print(response.body);
  }); */
}