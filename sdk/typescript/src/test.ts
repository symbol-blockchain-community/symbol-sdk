import { PrivateKey, uint8ToHex, utf8ToUint8, intToBytes, bytesToInt, hexToUint8, bytesToBigInt } from "../src";
import { AggregateBondedTransactionV2, EmbeddedTransferTransactionV1, Hash256, KeyPair, Amount, deriveSharedKey, TransferTransactionV1, UnresolvedAddress, UnresolvedMosaic, UnresolvedMosaicId, PublicKey, NetworkType, Timestamp, Signature, TransactionFactory } from "./symbol";
import SymbolFacade from "./facade/SymbolFacade";

console.log(uint8ToHex(utf8ToUint8('Hello \ud83d\udc4b')))

