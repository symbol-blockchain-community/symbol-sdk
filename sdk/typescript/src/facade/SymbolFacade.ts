/* eslint-disable no-unused-vars */
//import { Bip32Node } from '../Bip32.js';
/* eslint-enable no-unused-vars */
import {
	Hash256,
	PrivateKey,
	PublicKey,
	/* eslint-disable no-unused-vars */
	SharedKey256,
	/* eslint-enable no-unused-vars */
	Signature
} from '../CryptoTypes';
import { NetworkLocator } from '../Network';
import { KeyPair, Verifier } from '../symbol/KeyPair';
import { SymbolAddress, Network as SymbolNetwork } from '../symbol/Network';
//import { deriveSharedKey } from '../symbol/SharedKey.js';
//import TransactionFactory from '../symbol/TransactionFactory.js';
//import { MerkleHashBuilder } from '../symbol/merkle.js';
import * as sc from '../symbol/models';
import { sha3_256 } from '@noble/hashes/sha3';
import ITransaction from '../symbol/ITransaction';

const TRANSACTION_HEADER_SIZE = [
	4, // size
	4, // reserved1
	Signature.SIZE, // signature
	PublicKey.SIZE, // signer
	4 // reserved2
].reduce((x, y) => x + y);

const AGGREGATE_HASHED_SIZE = [
	4, // version, network, type
	8, // maxFee
	8, // deadline
	Hash256.SIZE // transactionsHash
].reduce((x, y) => x + y);

const isAggregateTransaction = (transactionBuffer: any) => {
	const transactionTypeOffset = TRANSACTION_HEADER_SIZE + 2; // skip version and network byte
	const transactionType = (transactionBuffer[transactionTypeOffset + 1] << 8) + transactionBuffer[transactionTypeOffset];
	const aggregateTypes = [sc.TransactionType.AGGREGATE_BONDED.value, sc.TransactionType.AGGREGATE_COMPLETE.value];
	return aggregateTypes.some(aggregateType => aggregateType === transactionType);
};

const transactionDataBuffer = (transactionBuffer: any) => {
	const dataBufferStart = TRANSACTION_HEADER_SIZE;
	const dataBufferEnd = isAggregateTransaction(transactionBuffer)
		? TRANSACTION_HEADER_SIZE + AGGREGATE_HASHED_SIZE
		: transactionBuffer.length;

	return transactionBuffer.subarray(dataBufferStart, dataBufferEnd);
};

/**
 * Facade used to interact with Symbol blockchain.
 */
export default class SymbolFacade {
	/**
	 * BIP32 curve name.
	 * @type {string}
	 */
	static BIP32_CURVE_NAME: string = 'ed25519';

	/**
	 * Network address class type.
	 * @type {typeof Address}
	 */
	static Address: typeof SymbolAddress = SymbolAddress;

	/**
	 * Network key pair class type.
	 * @type {typeof KeyPair}
	 */
	static KeyPair: typeof KeyPair = KeyPair;

	/**
	 * Network verifier class type.
	 * @type {typeof Verifier}
	 */
	static Verifier: typeof Verifier = Verifier;
	network: SymbolNetwork;
	transactionFactory: any;

	/**
	 * Derives shared key from key pair and other party's public key.
	 * @param {KeyPair} keyPair Key pair.
	 * @param {PublicKey} otherPublicKey Other party's public key.
	 * @returns {SharedKey256} Shared encryption key.
	 */
	//static deriveSharedKey = deriveSharedKey;

	/**
	 * Creates a Symbol facade.
	 * @param {string|SymbolNetwork} network Symbol network or network name.
	 */
	constructor(network: string | SymbolNetwork) {
		/**
		 * Underlying network.
		 * @type SymbolNetwork
		 */
		this.network = 'string' === typeof network ? NetworkLocator.findByName(SymbolNetwork.NETWORKS, network) : network;

		/**
		 * Underlying transaction factory.
		 * @type TransactionFactory
		 */
		//this.transactionFactory = new TransactionFactory(this.network);
	}

	/**
	 * Hashes a Symbol transaction.
	 * @param {sc.Transaction} transaction Transaction object.
	 * @returns {Hash256} Transaction hash.
	 */
	hashTransaction(transaction: any): Hash256 {
		const hasher = sha3_256.create();
		hasher.update(transaction.signature.bytes);
		hasher.update(transaction.signerPublicKey.bytes);
		hasher.update(this.network.generationHashSeed.bytes);
		hasher.update(transactionDataBuffer(transaction.serialize()));
		return new Hash256(hasher.digest());
	}

	/**
	 * Signs a Symbol transaction.
	 * @param {KeyPair} keyPair Key pair.
	 * @param {sc.Transaction} transaction Transaction object.
	 * @returns {Signature} Transaction signature.
	 */
	signTransaction(keyPair: KeyPair, transaction: ITransaction): Signature {
		return keyPair.sign(new Uint8Array([
			...this.network.generationHashSeed.bytes,
			...transactionDataBuffer(transaction.serialize())
		]));
	}

	/**
	 * Verifies a Symbol transaction.
	 * @param {sc.Transaction} transaction Transaction object.
	 * @param {Signature} signature Signature to verify.
	 * @returns {boolean} \c true if transaction signature is verified.
	 */
	verifyTransaction(transaction: sc.Transaction, signature: Signature): boolean {
		const verifyBuffer = new Uint8Array([
			...this.network.generationHashSeed.bytes,
			...transactionDataBuffer(transaction.serialize())
		]);
		return new Verifier(transaction.signerPublicKey).verify(verifyBuffer, signature);
	}

	/**
	 * Cosigns a Symbol transaction.
	 * @param {KeyPair} keyPair Key pair of the cosignatory.
	 * @param {sc.Transaction} transaction Transaction object.
	 * @param {boolean} detached \c true if resulting cosignature is appropriate for network propagation.
	 *                           \c false if resulting cosignature is appropriate for attaching to an aggregate.
	 * @returns {sc.Cosignature|sc.DetachedCosignature} Signed cosignature.
	 */
	cosignTransaction(keyPair: KeyPair, transaction: sc.Transaction, detached: boolean = false): sc.Cosignature | sc.DetachedCosignature {
		const transactionHash = this.hashTransaction(transaction);

		const initializeCosignature = (cosignature: sc.DetachedCosignature | sc.Cosignature) => {
			cosignature.version = 0n;
			cosignature.signerPublicKey = new sc.PublicKey(keyPair.publicKey.bytes);
			cosignature.signature = new sc.Signature(keyPair.sign(transactionHash.bytes).bytes);
		};

		if (detached) {
			const cosignature = new sc.DetachedCosignature();
			cosignature.parentHash = new sc.Hash256(transactionHash.bytes);
			initializeCosignature(cosignature);
			return cosignature;
		}

		const cosignature = new sc.Cosignature();
		initializeCosignature(cosignature);
		return cosignature;
	}

	/**
	 * Hashes embedded transactions of an aggregate transaction.
	 * @param {Array<sc.EmbeddedTransaction>} embeddedTransactions Embedded transactions to hash.
	 * @returns {Hash256} Aggregate transactions hash.
	 */
/* 	static hashEmbeddedTransactions(embeddedTransactions: Array<sc.EmbeddedTransaction>): Hash256 {
		const hashBuilder = new MerkleHashBuilder();
		embeddedTransactions.forEach(embeddedTransaction => {
			hashBuilder.update(new Hash256(sha3_256(embeddedTransaction.serialize())));
		});

		return hashBuilder.final();
	} */

	/**
	 * Creates a network compatible BIP32 path for the specified account.
	 *
	 * @param {number} accountId Id of the account for which to generate a BIP32 path.
	 * @returns {Array<number>} BIP32 path for the specified account.
	 */
	bip32Path(accountId: number): Array<number> {
		return [44, 'mainnet' === this.network.name ? 4343 : 1, accountId, 0, 0];
	}

	/**
	 * Derives a Symbol KeyPair from a BIP32 node.
	 * @param {Bip32Node} bip32Node BIP32 node.
	 * @returns {KeyPair} Derived key pair.
	 */
/* 	static bip32NodeToKeyPair(bip32Node: Bip32Node): KeyPair {
		return new KeyPair(new PrivateKey(bip32Node.privateKey.bytes));
	} */
}
