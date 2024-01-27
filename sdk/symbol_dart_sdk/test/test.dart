
import 'package:test/test.dart';
import 'dart:typed_data';
import 'package:convert/convert.dart';
import '../bin/symbol/models.dart';
//import '../bin/nem/models.dart';
import '../bin/utils/converter.dart';
//import '../models_c.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:hash/hash.dart';
import 'package:pointycastle/export.dart';

void main() {
  var binary = Uint8List.fromList(hex.decode('90A9B7F328256C77D8A980E9E29CC655FD00809A31A98C8A8871E5DCF0E99EC3'));
  final digest = KeccakDigest(256);
  var out2 = digest.process(binary).sublist(0);
  digest.update(binary, 0, 32);
  var out = Uint8List(32);
  digest.doFinal(out, 0);

  print(hex.encode(out).toUpperCase());
  print(hex.encode(out2).toUpperCase());

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
