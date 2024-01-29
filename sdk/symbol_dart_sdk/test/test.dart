
import 'package:pinenacl/api.dart';
import 'package:test/test.dart';
import 'dart:typed_data';
import 'package:convert/convert.dart';
//import '../bin/symbol/models.dart';
//import '../bin/nem/models.dart';
import '../bin/facade/SymbolFacade.dart';
import '../bin/NetworkTimestamp.dart';
import '../bin/symbol/MessageEncorder.dart';
import '../bin/symbol/Network.dart';
import '../bin/symbol/models.dart';
import '../bin/utils/converter.dart';
//import '../models_c.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:hash/hash.dart';
import '../bin/nem/KeyPair.dart';
import '../bin/CryptoTypes.dart' as ct;
import '../bin/symbol/idGenerator.dart';
import 'package:ed25519_edwards/ed25519_edwards.dart' as ed;
import 'package:pointycastle/export.dart' as pc;
import 'package:http/http.dart' as http;
import '../bin/symbol/SharedKey.dart';

/* Future<Uint8List> encode() async {
  var alice = KeyPair(ct.PrivateKey('5DB8324E7EB83E7665D500B014283260EF312139034E86DFB7EE736503EAEC02'));
  var bob = KeyPair(ct.PrivateKey('E3839324F3CD2FC194F6E1C501D4D2CFD0DC8CCAC4307AC328E3154FF00951B9'));
  var message = Uint8List.fromList('hello symbol!!'.codeUnits);
  var encorder = MessageEncorder(alice);
  var c = await encorder.encode(bob.publicKey, message);
  return c;
} */

void decode(Uint8List m) async {
  var alice = KeyPair(ct.PrivateKey('ABF4CF55A2B3F742D7543D9CC17F50447B969E6E06F5EA9195D428AB12B7318D'));
  print(alice.privateKey);
  print(alice.publicKey);
  var signature = alice.sign(hexToBytes('8CE03CD60514233B86789729102EA09E867FC6D964DEA8C2018EF7D0A2E0E24BF7E348E917116690B9'));
  print(signature);
  var bob = KeyPair(ct.PrivateKey('E3839324F3CD2FC194F6E1C501D4D2CFD0DC8CCAC4307AC328E3154FF00951B9'));
}
void main() async {
  //01FC3E37C915217EA87AA65C41937838310C6E76855D966CE710AEB8B0EFBFD509FBDF0A768989EF530F45
  //var c = await encode();
  //print(bytesToHex(c));
  decode(hexToBytes('0126B07BBAC881B85F6D51B817C67FFA6E8BB00E0923DBC14908DCFA9232F492D02C7972AF7A43C1618C1D'));
  /* var alice = KeyPair(crypto.PrivateKey('5DB8324E7EB83E7665D500B014283260EF312139034E86DFB7EE736503EAEC02'));
  var facade = SymbolFacade(Network.TESTNET);
  var tx = TransferTransactionV1(
    network: NetworkType.TESTNET,
    recipientAddress: UnresolvedAddress('TA5LGYEWS6L2WYBQ75J2DGK7IOZHYVWFWRLOFWI'),
    message: Uint8List.fromList('hello symbol!!'.codeUnits),
    mosaics: [
      UnresolvedMosaic(
        mosaicId: UnresolvedMosaicId('72C0212E67A08BCE'),
        amount: Amount(1000000),
      )
    ],
    signerPublicKey: PublicKey('13B00FBB13C7644E13BD786F0EA4F97820022A2606759793A5D3525A03F92A2F'),
    deadline: Timestamp(facade.network.fromDatetime(DateTime.now().toUtc()).addHours(2).timestamp),
  );
  //tx.fee = Amount(tx.size * 100);
  tx.fee = Amount(1000000);
  var signature = facade.signTransaction(alice, tx);
  var payload = facade.attachSignature(tx, signature);
  print(tx);
  var hash = facade.hashTransaction(tx);
  print(hash);

  var url = Uri.parse('https://sym-test-01.opening-line.jp:3001/transactions');
  var headers = {'Content-Type': 'application/json'};
  var response = await http.put(url, headers: headers, body: payload);
  print(response.body); */
  /* 
  test('AccountAddressRestrictionTransactionV1_account_address_restriction_single_1', () {
    var payload = 'D0000000000000007695D855CBB6CB83D5BD08E9D76145674F805D741301883387B7101FD8CA84329BB14DBF2F0B4CD58AA84CF31AC6899D134FC38FAB0E7A76F6216ACD60914ACBD294E5E650ACC2A911B548BE2A1806FF4717621BCE3EC1007295219AFFC17B820000000001985041E0FEEEEFFEEEEFFEE0711EE7711EE77101000201000000009841E5B8E40781CF74DABF592817DE48711D778648DEAFB298F409274B52FABBFBCF7E7DF7E20DE1D0C3F657FB8595C1989059321905F681BCF47EA33BBF5E6F8298B5440854FDED';
    var tx = AccountAddressRestrictionTransactionV1(
      network: NetworkType.TESTNET, 
      type: TransactionType.ACCOUNT_ADDRESS_RESTRICTION,
      restrictionFlags: AccountRestrictionFlags.ADDRESS,
      restrictionAdditions: [
        UnresolvedAddress('TBA6LOHEA6A465G2X5MSQF66JBYR254GJDPK7MQ'), UnresolvedAddress('TD2ASJ2LKL5LX66PPZ67PYQN4HIMH5SX7OCZLQI'),
      ],
      restrictionDeletions: [
        UnresolvedAddress('TCIFSMQZAX3IDPHUP2RTXP26N6BJRNKEBBKP33I'),
      ], 
      signerPublicKey: PublicKey('0xD294E5E650ACC2A911B548BE2A1806FF4717621BCE3EC1007295219AFFC17B82'),
      signature: Signature('0x7695D855CBB6CB83D5BD08E9D76145674F805D741301883387B7101FD8CA84329BB14DBF2F0B4CD58AA84CF31AC6899D134FC38FAB0E7A76F6216ACD60914ACB'),
      fee: Amount('18370164183782063840'),
      deadline: Timestamp(8207562320463688160));
    expect(hex.encode(tx.serialize()).toUpperCase(), payload);
  }); */
}
