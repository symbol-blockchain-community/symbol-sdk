
import 'package:test/test.dart';
import 'dart:typed_data';
import 'package:convert/convert.dart';
//import '../bin/symbol/models.dart';
//import '../bin/nem/models.dart';
import '../bin/facade/SymbolFacade.dart';
import '../bin/NetworkTimestamp.dart';
import '../bin/symbol/Network.dart';
import '../bin/symbol/models.dart';
import '../bin/utils/converter.dart';
//import '../models_c.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:hash/hash.dart';
import '../bin/symbol/KeyPair.dart';
import '../bin/CryptoTypes.dart' as crypto;
import '../bin/symbol/idGenerator.dart';
import 'package:ed25519_edwards/ed25519_edwards.dart' as ed;
import 'package:pointycastle/export.dart' as pc;
import 'package:http/http.dart' as http;

void main() async {
  var alice = KeyPair(crypto.PrivateKey('5DB8324E7EB83E7665D500B014283260EF312139034E86DFB7EE736503EAEC02'));
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
  print(response.body);
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
