import { AggregateBondedTransactionV2, NamespaceId, utf8ToUint8, NamespaceRegistrationType, EmbeddedNamespaceRegistrationTransactionV1, BlockDuration, Amount, EmbeddedTransferTransactionV1, Hash256, NetworkType, PublicKey, Signature, Timestamp, TransactionFactory, UnresolvedAddress, UnresolvedMosaic, UnresolvedMosaicId, uint8ToHex } from "../../../src";
console.log(uint8ToHex(utf8ToUint8('newnamespace')));
var payload = 'F8000000000000004C08B813E15C24982EE1D908942CBC07F7EE373EB78F99935D657CAB1CE6397156FF07C97D334F8E2E71B57E293E98B0523633FF36C052E3AB0B5E3FF4924310C3327284E6AC67B1A558F95797CF2EFC994BCECA4EBBCCB4592CB6B8F645DC2D0000000002984142E0FEEEEFFEEEEFFEE0711EE7711EE77164148373332A1284E316AC070194019D786C29F3B879A0AAFACEC2E393D0FCB550000000000000004E0000000000000000000000000000000000000000000000000000000000000000000000000000000000000001984E4110270000000000007EE9B3B8AFDF53C0000C6E65776E616D6573706163650000';
    var tx = new AggregateBondedTransactionV2({
      network: NetworkType.TESTNET,
      transactions: [
        new EmbeddedNamespaceRegistrationTransactionV1({
          network: NetworkType.TESTNET,
          duration: new BlockDuration(10000n),
          id: new NamespaceId(13858666424160217470n),
          registrationType: NamespaceRegistrationType.ROOT,
          name: utf8ToUint8('newnamespace'),
        })
      ],
      signerPublicKey: new PublicKey('C3327284E6AC67B1A558F95797CF2EFC994BCECA4EBBCCB4592CB6B8F645DC2D'),
      signature: new Signature('4C08B813E15C24982EE1D908942CBC07F7EE373EB78F99935D657CAB1CE6397156FF07C97D334F8E2E71B57E293E98B0523633FF36C052E3AB0B5E3FF4924310'),
      fee: new Amount(18370164183782063840n),
      deadline: new Timestamp(8207562320463688160n),
      cosignatures: [],
      transactionsHash: new Hash256('64148373332A1284E316AC070194019D786C29F3B879A0AAFACEC2E393D0FCB5')
    });
    console.log(uint8ToHex(tx.serialize()));
    TransactionFactory.deserialize(payload)
//console.log(uint8ToHex((TransactionFactory.deserialize(payload)).serialize()));
//console.log(uint8ToHex(tx.serialize()).toUpperCase());
