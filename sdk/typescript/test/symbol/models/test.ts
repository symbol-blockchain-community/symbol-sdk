import { PrivateKey, uint8ToHex, utf8ToUint8, intToBytes, bytesToInt, hexToUint8, bytesToBigInt } from "../../../src";
import { KeyPair, AccountAddressRestrictionTransactionV1, AccountRestrictionFlags, TransferTransactionV1, UnresolvedAddress, UnresolvedMosaic, UnresolvedMosaicId, PublicKey, NetworkType, Timestamp, Signature } from "../../../src/symbol";
import SymbolFacade from "../../../src/facade/SymbolFacade";
import { Amount, TransactionFactory } from "../../../src/symbol/models";
var facade = new SymbolFacade('testnet');
var privateKey = new PrivateKey('5DB8324E7EB83E7665D500B014283260EF312139034E86DFB7EE736503EAEC02');
var keyPair = new KeyPair(privateKey);
var tx = new TransferTransactionV1({
    recipientAddress: new UnresolvedAddress("TA5LGYEWS6L2WYBQ75J2DGK7IOZHYVWFWRLOFWI"),
    message: utf8ToUint8("hello, symbol!"),
    mosaics: [
      new UnresolvedMosaic({
        mosaicId: new UnresolvedMosaicId('72C0212E67A08BCE'),
        amount: new Amount(1000000n)
      })
    ],
    signerPublicKey: new PublicKey('13B00FBB13C7644E13BD786F0EA4F97820022A2606759793A5D3525A03F92A2F'),
    network: NetworkType.TESTNET,
    deadline: new Timestamp(facade.network.fromDatetime(new Date(Date.now())).addHours(2).timestamp)
});
tx.fee = new Amount(BigInt(tx.size * 100));
var signature = facade.signTransaction(keyPair, tx);
tx.signature = new Signature(signature.bytes);

var hash = facade.hashTransaction(tx);
console.log(uint8ToHex(hash.bytes));
const hexPayload = uint8ToHex(tx.serialize());
const jsonPayload = `{"payload": "${hexPayload}"}`;

fetch('http://sym-test-01.opening-line.jp:3000/transactions', {
  body: jsonPayload,
  headers: {
    'Content-Type': 'application/json'
  },
  method: 'PUT'
}).then(response => {
  response.json().then((r) => console.log(r));
});
