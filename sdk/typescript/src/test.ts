import { PrivateKey, uint8ToHex, utf8ToUint8, intToBytes, bytesToInt, hexToUint8, bytesToBigInt } from "../src";
import { MessageEncoder, AggregateBondedTransactionV2, EmbeddedTransferTransactionV1, Hash256, KeyPair, Amount, deriveSharedKey, TransferTransactionV1, UnresolvedAddress, UnresolvedMosaic, UnresolvedMosaicId, PublicKey, NetworkType, Timestamp, Signature, TransactionFactory } from "./symbol";
import SymbolFacade from "./facade/SymbolFacade";
import crypto from 'crypto';
var alice = new KeyPair(new PrivateKey("5DB8324E7EB83E7665D500B014283260EF312139034E86DFB7EE736503EAEC02"));
var bob = new KeyPair(new PrivateKey("E3839324F3CD2FC194F6E1C501D4D2CFD0DC8CCAC4307AC328E3154FF00951B9"));
var encoder = new MessageEncoder(alice);
var encoded = encoder.encode(bob.publicKey, utf8ToUint8("Hello"), crypto.randomBytes(12));
var decoder = new MessageEncoder(bob);
var decoded = decoder.tryDecode(alice.publicKey, encoded);

console.log(uint8ToHex(decoded.message));

