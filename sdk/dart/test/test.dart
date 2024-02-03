import 'package:pointycastle/export.dart';
import 'package:symbol_sdk/symbol/models.dart';
import 'package:symbol_sdk/symbol/ITransaction.dart';
import 'package:symbol_sdk/utils/converter.dart';

void main() {
  var keccak = KeccakDigest(512);
  var h = keccak.process(utf8ToBytes('hello, symbol!'));
  print(bytesToHex(h));
  /* 
  var payload = 'F8000000000000004C08B813E15C24982EE1D908942CBC07F7EE373EB78F99935D657CAB1CE6397156FF07C97D334F8E2E71B57E293E98B0523633FF36C052E3AB0B5E3FF4924310C3327284E6AC67B1A558F95797CF2EFC994BCECA4EBBCCB4592CB6B8F645DC2D0000000002984142E0FEEEEFFEEEEFFEE0711EE7711EE77164148373332A1284E316AC070194019D786C29F3B879A0AAFACEC2E393D0FCB550000000000000004E0000000000000000000000000000000000000000000000000000000000000000000000000000000000000001984E4110270000000000007EE9B3B8AFDF53C0000C6E65776E616D6573706163650000';
      var tx = AggregateBondedTransactionV2(
        network: NetworkType.TESTNET,
        transactions: [
          EmbeddedNamespaceRegistrationTransactionV1(
            network: NetworkType.TESTNET,
            duration: BlockDuration(10000),
            id: NamespaceId('13858666424160217470'),
            registrationType: NamespaceRegistrationType.ROOT,
            name: utf8ToBytes('newnamespace'),
          )
        ],
        signerPublicKey: PublicKey('C3327284E6AC67B1A558F95797CF2EFC994BCECA4EBBCCB4592CB6B8F645DC2D'),
        signature: Signature('4C08B813E15C24982EE1D908942CBC07F7EE373EB78F99935D657CAB1CE6397156FF07C97D334F8E2E71B57E293E98B0523633FF36C052E3AB0B5E3FF4924310'),
        fee: Amount('18370164183782063840'),
        deadline: Timestamp(8207562320463688160),
        cosignatures: [],
        transactionsHash: Hash256('64148373332A1284E316AC070194019D786C29F3B879A0AAFACEC2E393D0FCB5')
      );

  print(bytesToHex((TransactionFactory().deserialize(payload) as ITransaction).serialize()));
  print(bytesToHex(tx.serialize()).toUpperCase()); */
}