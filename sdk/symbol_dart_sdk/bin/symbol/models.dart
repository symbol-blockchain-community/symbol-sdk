import '../BaseValue.dart';
import 'dart:typed_data';

class Amount extends BaseValue {
	static const int SIZE = 8;

	Amount(BigInt amount): super(SIZE, amount ?? BigInt.zero);

	static Amount deserialize(Uint8List payload){
		var buffer = ByteData.view(payload.buffer);
		return Amount(BigInt.from(buffer.getInt64(0, Endian.little)));
	}

	Uint8List serialize(){
		var buffer = ByteData(SIZE);
		return (buffer..setInt64(0, value.toInt(), Endian.little)).buffer.asUint8List();;
	}
}


class BlockDuration extends BaseValue {
	static const int SIZE = 8;

	BlockDuration(BigInt blockDuration): super(SIZE, blockDuration ?? BigInt.zero);

	static BlockDuration deserialize(Uint8List payload){
		var buffer = ByteData.view(payload.buffer);
		return BlockDuration(BigInt.from(buffer.getInt64(0, Endian.little)));
	}

	Uint8List serialize(){
		var buffer = ByteData(SIZE);
		return (buffer..setInt64(0, value.toInt(), Endian.little)).buffer.asUint8List();;
	}
}


class BlockFeeMultiplier extends BaseValue {
	static const int SIZE = 4;

	BlockFeeMultiplier(int blockFeeMultiplier): super(SIZE, blockFeeMultiplier ?? 0);

	static BlockFeeMultiplier deserialize(Uint8List payload){
		var buffer = ByteData.view(payload.buffer);
		return BlockFeeMultiplier(BigInt.from(buffer.getInt32(0, Endian.little)));
	}

	Uint8List serialize(){
		var buffer = ByteData(SIZE);
		return (buffer..setInt32(0, value.toInt(), Endian.little)).buffer.asUint8List();;
	}
}


class Difficulty extends BaseValue {
	static const int SIZE = 8;

	Difficulty(BigInt difficulty): super(SIZE, difficulty ?? BigInt.zero);

	static Difficulty deserialize(Uint8List payload){
		var buffer = ByteData.view(payload.buffer);
		return Difficulty(BigInt.from(buffer.getInt64(0, Endian.little)));
	}

	Uint8List serialize(){
		var buffer = ByteData(SIZE);
		return (buffer..setInt64(0, value.toInt(), Endian.little)).buffer.asUint8List();;
	}
}


class FinalizationEpoch extends BaseValue {
	static const int SIZE = 4;

	FinalizationEpoch(int finalizationEpoch): super(SIZE, finalizationEpoch ?? 0);

	static FinalizationEpoch deserialize(Uint8List payload){
		var buffer = ByteData.view(payload.buffer);
		return FinalizationEpoch(BigInt.from(buffer.getInt32(0, Endian.little)));
	}

	Uint8List serialize(){
		var buffer = ByteData(SIZE);
		return (buffer..setInt32(0, value.toInt(), Endian.little)).buffer.asUint8List();;
	}
}


class FinalizationPoint extends BaseValue {
	static const int SIZE = 4;

	FinalizationPoint(int finalizationPoint): super(SIZE, finalizationPoint ?? 0);

	static FinalizationPoint deserialize(Uint8List payload){
		var buffer = ByteData.view(payload.buffer);
		return FinalizationPoint(BigInt.from(buffer.getInt32(0, Endian.little)));
	}

	Uint8List serialize(){
		var buffer = ByteData(SIZE);
		return (buffer..setInt32(0, value.toInt(), Endian.little)).buffer.asUint8List();;
	}
}


class Height extends BaseValue {
	static const int SIZE = 8;

	Height(BigInt height): super(SIZE, height ?? BigInt.zero);

	static Height deserialize(Uint8List payload){
		var buffer = ByteData.view(payload.buffer);
		return Height(BigInt.from(buffer.getInt64(0, Endian.little)));
	}

	Uint8List serialize(){
		var buffer = ByteData(SIZE);
		return (buffer..setInt64(0, value.toInt(), Endian.little)).buffer.asUint8List();;
	}
}


class Importance extends BaseValue {
	static const int SIZE = 8;

	Importance(BigInt importance): super(SIZE, importance ?? BigInt.zero);

	static Importance deserialize(Uint8List payload){
		var buffer = ByteData.view(payload.buffer);
		return Importance(BigInt.from(buffer.getInt64(0, Endian.little)));
	}

	Uint8List serialize(){
		var buffer = ByteData(SIZE);
		return (buffer..setInt64(0, value.toInt(), Endian.little)).buffer.asUint8List();;
	}
}


class ImportanceHeight extends BaseValue {
	static const int SIZE = 8;

	ImportanceHeight(BigInt importanceHeight): super(SIZE, importanceHeight ?? BigInt.zero);

	static ImportanceHeight deserialize(Uint8List payload){
		var buffer = ByteData.view(payload.buffer);
		return ImportanceHeight(BigInt.from(buffer.getInt64(0, Endian.little)));
	}

	Uint8List serialize(){
		var buffer = ByteData(SIZE);
		return (buffer..setInt64(0, value.toInt(), Endian.little)).buffer.asUint8List();;
	}
}


class UnresolvedMosaicId extends BaseValue {
	static const int SIZE = 8;

	UnresolvedMosaicId(BigInt unresolvedMosaicId): super(SIZE, unresolvedMosaicId ?? BigInt.zero);

	static UnresolvedMosaicId deserialize(Uint8List payload){
		var buffer = ByteData.view(payload.buffer);
		return UnresolvedMosaicId(BigInt.from(buffer.getInt64(0, Endian.little)));
	}

	Uint8List serialize(){
		var buffer = ByteData(SIZE);
		return (buffer..setInt64(0, value.toInt(), Endian.little)).buffer.asUint8List();;
	}
}


class MosaicId extends BaseValue {
	static const int SIZE = 8;

	MosaicId(BigInt mosaicId): super(SIZE, mosaicId ?? BigInt.zero);

	static MosaicId deserialize(Uint8List payload){
		var buffer = ByteData.view(payload.buffer);
		return MosaicId(BigInt.from(buffer.getInt64(0, Endian.little)));
	}

	Uint8List serialize(){
		var buffer = ByteData(SIZE);
		return (buffer..setInt64(0, value.toInt(), Endian.little)).buffer.asUint8List();;
	}
}


class Timestamp extends BaseValue {
	static const int SIZE = 8;

	Timestamp(BigInt timestamp): super(SIZE, timestamp ?? BigInt.zero);

	static Timestamp deserialize(Uint8List payload){
		var buffer = ByteData.view(payload.buffer);
		return Timestamp(BigInt.from(buffer.getInt64(0, Endian.little)));
	}

	Uint8List serialize(){
		var buffer = ByteData(SIZE);
		return (buffer..setInt64(0, value.toInt(), Endian.little)).buffer.asUint8List();;
	}
}


class UnresolvedAddress extends ByteArray {
	static const int SIZE = 24;

	UnresolvedAddress(Uint8List unresolvedAddress): super(SIZE, unresolvedAddress ?? Uint8List(24));

	int get size(){
		return 24
	}

	static UnresolvedAddress deserialize(Uint8List payload){
		return UnresolvedAddress(Uint8List.fromList(payload));
	}

	Uint8List serialize(){
		return bytes
	}
}


class Address extends ByteArray {
	static const int SIZE = 24;

	Address(Uint8List address): super(SIZE, address ?? Uint8List(24));

	int get size(){
		return 24
	}

	static Address deserialize(Uint8List payload){
		return Address(Uint8List.fromList(payload));
	}

	Uint8List serialize(){
		return bytes
	}
}


class Hash256 extends ByteArray {
	static const int SIZE = 32;

	Hash256(Uint8List hash256): super(SIZE, hash256 ?? Uint8List(32));

	int get size(){
		return 32
	}

	static Hash256 deserialize(Uint8List payload){
		return Hash256(Uint8List.fromList(payload));
	}

	Uint8List serialize(){
		return bytes
	}
}


class Hash512 extends ByteArray {
	static const int SIZE = 64;

	Hash512(Uint8List hash512): super(SIZE, hash512 ?? Uint8List(64));

	int get size(){
		return 64
	}

	static Hash512 deserialize(Uint8List payload){
		return Hash512(Uint8List.fromList(payload));
	}

	Uint8List serialize(){
		return bytes
	}
}


class PublicKey extends ByteArray {
	static const int SIZE = 32;

	PublicKey(Uint8List publicKey): super(SIZE, publicKey ?? Uint8List(32));

	int get size(){
		return 32
	}

	static PublicKey deserialize(Uint8List payload){
		return PublicKey(Uint8List.fromList(payload));
	}

	Uint8List serialize(){
		return bytes
	}
}


class VotingPublicKey extends ByteArray {
	static const int SIZE = 32;

	VotingPublicKey(Uint8List votingPublicKey): super(SIZE, votingPublicKey ?? Uint8List(32));

	int get size(){
		return 32
	}

	static VotingPublicKey deserialize(Uint8List payload){
		return VotingPublicKey(Uint8List.fromList(payload));
	}

	Uint8List serialize(){
		return bytes
	}
}


class Signature extends ByteArray {
	static const int SIZE = 64;

	Signature(Uint8List signature): super(SIZE, signature ?? Uint8List(64));

	int get size(){
		return 64
	}

	static Signature deserialize(Uint8List payload){
		return Signature(Uint8List.fromList(payload));
	}

	Uint8List serialize(){
		return bytes
	}
}


class Mosaic {
	TYPE_HINTS = {
		'mosaicId': 'pod:MosaicId',
		'amount': 'pod:Amount'
	}

	Mosaic(){
		self._mosaicId = MosaicId()
		self._amount = Amount()
	}

	None sort(){
		pass
	}

	@property
	MosaicId mosaicId(){
		return self._mosaicId
	}

	@property
	Amount amount(){
		return self._amount
	}

	@mosaicId.setter
	mosaicId(value: MosaicId){
		self._mosaicId = value
	}

	@amount.setter
	amount(value: Amount){
		self._amount = value
	}

	int get size(){
		size = 0
		size += self.mosaicId.size
		size += self.amount.size
		return size
	}

	static Mosaic deserialize(Uint8List payload){
		buffer = memoryview(payload)
		mosaicId = MosaicId.deserialize(buffer)
		buffer = buffer[mosaicId.size:]
		amount = Amount.deserialize(buffer)
		buffer = buffer[amount.size:]

		instance = Mosaic()
		instance._mosaicId = mosaicId
		instance._amount = amount
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self._mosaicId.serialize()
		buffer += self._amount.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'mosaicId: {self._mosaicId.__str__()}, '
		result += f'amount: {self._amount.__str__()}, '
		result += ')'
		return result
	}
}


class UnresolvedMosaic {
	TYPE_HINTS = {
		'mosaicId': 'pod:UnresolvedMosaicId',
		'amount': 'pod:Amount'
	}

	UnresolvedMosaic(){
		self._mosaicId = UnresolvedMosaicId()
		self._amount = Amount()
	}

	None sort(){
		pass
	}

	@property
	UnresolvedMosaicId mosaicId(){
		return self._mosaicId
	}

	@property
	Amount amount(){
		return self._amount
	}

	@mosaicId.setter
	mosaicId(value: UnresolvedMosaicId){
		self._mosaicId = value
	}

	@amount.setter
	amount(value: Amount){
		self._amount = value
	}

	int get size(){
		size = 0
		size += self.mosaicId.size
		size += self.amount.size
		return size
	}

	static UnresolvedMosaic deserialize(Uint8List payload){
		buffer = memoryview(payload)
		mosaicId = UnresolvedMosaicId.deserialize(buffer)
		buffer = buffer[mosaicId.size:]
		amount = Amount.deserialize(buffer)
		buffer = buffer[amount.size:]

		instance = UnresolvedMosaic()
		instance._mosaicId = mosaicId
		instance._amount = amount
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self._mosaicId.serialize()
		buffer += self._amount.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'mosaicId: {self._mosaicId.__str__()}, '
		result += f'amount: {self._amount.__str__()}, '
		result += ')'
		return result
	}
}


class LinkAction extends (Enum) {
	UNLINK = 0
	LINK = 1

	int get size(){
		return 1
	}

	static LinkAction deserialize(Uint8List payload){
		buffer = memoryview(payload)
		return LinkAction(BigInt.from(buffer.getInt8(0, Endian.little)))
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += (buffer..setInt8(0, self.value.toInt(), Endian.little)).buffer.asUint8List();
		return buffer
	}
}


class NetworkType extends (Enum) {
	MAINNET = 104
	TESTNET = 152

	int get size(){
		return 1
	}

	static NetworkType deserialize(Uint8List payload){
		buffer = memoryview(payload)
		return NetworkType(BigInt.from(buffer.getInt8(0, Endian.little)))
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += (buffer..setInt8(0, self.value.toInt(), Endian.little)).buffer.asUint8List();
		return buffer
	}
}


class TransactionType extends (Enum) {
	ACCOUNT_KEY_LINK = 16716
	NODE_KEY_LINK = 16972
	AGGREGATE_COMPLETE = 16705
	AGGREGATE_BONDED = 16961
	VOTING_KEY_LINK = 16707
	VRF_KEY_LINK = 16963
	HASH_LOCK = 16712
	SECRET_LOCK = 16722
	SECRET_PROOF = 16978
	ACCOUNT_METADATA = 16708
	MOSAIC_METADATA = 16964
	NAMESPACE_METADATA = 17220
	MOSAIC_DEFINITION = 16717
	MOSAIC_SUPPLY_CHANGE = 16973
	MOSAIC_SUPPLY_REVOCATION = 17229
	MULTISIG_ACCOUNT_MODIFICATION = 16725
	ADDRESS_ALIAS = 16974
	MOSAIC_ALIAS = 17230
	NAMESPACE_REGISTRATION = 16718
	ACCOUNT_ADDRESS_RESTRICTION = 16720
	ACCOUNT_MOSAIC_RESTRICTION = 16976
	ACCOUNT_OPERATION_RESTRICTION = 17232
	MOSAIC_ADDRESS_RESTRICTION = 16977
	MOSAIC_GLOBAL_RESTRICTION = 16721
	TRANSFER = 16724

	int get size(){
		return 2
	}

	static TransactionType deserialize(Uint8List payload){
		buffer = memoryview(payload)
		return TransactionType(BigInt.from(buffer.getInt16(0, Endian.little)))
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += (buffer..setInt16(0, self.value.toInt(), Endian.little)).buffer.asUint8List();
		return buffer
	}
}


class Transaction {
	TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp'
	}

	Transaction(){
		self._signature = Signature()
		self._signerPublicKey = PublicKey()
		self._version = 0
		self._network = NetworkType.MAINNET
		self._type_ = TransactionType.ACCOUNT_KEY_LINK
		self._fee = Amount()
		self._deadline = Timestamp()
		self._verifiableEntityHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
	}

	None sort(){
		pass
	}

	@property
	Signature signature(){
		return self._signature
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	TransactionType type_(){
		return self._type_
	}

	@property
	Amount fee(){
		return self._fee
	}

	@property
	Timestamp deadline(){
		return self._deadline
	}

	@signature.setter
	signature(value: Signature){
		self._signature = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@fee.setter
	fee(value: Amount){
		self._fee = value
	}

	@deadline.setter
	deadline(value: Timestamp){
		self._deadline = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		return size
	}

	static Transaction deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiableEntityHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert verifiableEntityHeaderReserved_1 == 0, f'Invalid value of reserved field ({verifiableEntityHeaderReserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]

		instance = Transaction()
		instance._signature = signature
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._verifiableEntityHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signature.serialize()
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += ')'
		return result
	}
}


class EmbeddedTransaction {
	TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType'
	}

	EmbeddedTransaction(){
		self._signerPublicKey = PublicKey()
		self._version = 0
		self._network = NetworkType.MAINNET
		self._type_ = TransactionType.ACCOUNT_KEY_LINK
		self._embeddedTransactionHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
	}

	None sort(){
		pass
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	TransactionType type_(){
		return self._type_
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		return size
	}

	static EmbeddedTransaction deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		embeddedTransactionHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert embeddedTransactionHeaderReserved_1 == 0, f'Invalid value of reserved field ({embeddedTransactionHeaderReserved_1})'
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]

		instance = EmbeddedTransaction()
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._embeddedTransactionHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += ')'
		return result
	}
}


class ProofGamma extends ByteArray {
	static const int SIZE = 32;

	ProofGamma(Uint8List proofGamma): super(SIZE, proofGamma ?? Uint8List(32));

	int get size(){
		return 32
	}

	static ProofGamma deserialize(Uint8List payload){
		return ProofGamma(Uint8List.fromList(payload));
	}

	Uint8List serialize(){
		return bytes
	}
}


class ProofVerificationHash extends ByteArray {
	static const int SIZE = 16;

	ProofVerificationHash(Uint8List proofVerificationHash): super(SIZE, proofVerificationHash ?? Uint8List(16));

	int get size(){
		return 16
	}

	static ProofVerificationHash deserialize(Uint8List payload){
		return ProofVerificationHash(Uint8List.fromList(payload));
	}

	Uint8List serialize(){
		return bytes
	}
}


class ProofScalar extends ByteArray {
	static const int SIZE = 32;

	ProofScalar(Uint8List proofScalar): super(SIZE, proofScalar ?? Uint8List(32));

	int get size(){
		return 32
	}

	static ProofScalar deserialize(Uint8List payload){
		return ProofScalar(Uint8List.fromList(payload));
	}

	Uint8List serialize(){
		return bytes
	}
}


class BlockType extends (Enum) {
	NEMESIS = 32835
	NORMAL = 33091
	IMPORTANCE = 33347

	int get size(){
		return 2
	}

	static BlockType deserialize(Uint8List payload){
		buffer = memoryview(payload)
		return BlockType(BigInt.from(buffer.getInt16(0, Endian.little)))
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += (buffer..setInt16(0, self.value.toInt(), Endian.little)).buffer.asUint8List();
		return buffer
	}
}


class VrfProof {
	TYPE_HINTS = {
		'gamma': 'pod:ProofGamma',
		'verificationHash': 'pod:ProofVerificationHash',
		'scalar': 'pod:ProofScalar'
	}

	VrfProof(){
		self._gamma = ProofGamma()
		self._verificationHash = ProofVerificationHash()
		self._scalar = ProofScalar()
	}

	None sort(){
		pass
	}

	@property
	ProofGamma gamma(){
		return self._gamma
	}

	@property
	ProofVerificationHash verificationHash(){
		return self._verificationHash
	}

	@property
	ProofScalar scalar(){
		return self._scalar
	}

	@gamma.setter
	gamma(value: ProofGamma){
		self._gamma = value
	}

	@verificationHash.setter
	verificationHash(value: ProofVerificationHash){
		self._verificationHash = value
	}

	@scalar.setter
	scalar(value: ProofScalar){
		self._scalar = value
	}

	int get size(){
		size = 0
		size += self.gamma.size
		size += self.verificationHash.size
		size += self.scalar.size
		return size
	}

	static VrfProof deserialize(Uint8List payload){
		buffer = memoryview(payload)
		gamma = ProofGamma.deserialize(buffer)
		buffer = buffer[gamma.size:]
		verificationHash = ProofVerificationHash.deserialize(buffer)
		buffer = buffer[verificationHash.size:]
		scalar = ProofScalar.deserialize(buffer)
		buffer = buffer[scalar.size:]

		instance = VrfProof()
		instance._gamma = gamma
		instance._verificationHash = verificationHash
		instance._scalar = scalar
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self._gamma.serialize()
		buffer += self._verificationHash.serialize()
		buffer += self._scalar.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'gamma: {self._gamma.__str__()}, '
		result += f'verificationHash: {self._verificationHash.__str__()}, '
		result += f'scalar: {self._scalar.__str__()}, '
		result += ')'
		return result
	}
}


class Block {
	TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:BlockType',
		'height': 'pod:Height',
		'timestamp': 'pod:Timestamp',
		'difficulty': 'pod:Difficulty',
		'generationHashProof': 'struct:VrfProof',
		'previousBlockHash': 'pod:Hash256',
		'transactionsHash': 'pod:Hash256',
		'receiptsHash': 'pod:Hash256',
		'stateHash': 'pod:Hash256',
		'beneficiaryAddress': 'pod:Address',
		'feeMultiplier': 'pod:BlockFeeMultiplier'
	}

	Block(){
		self._signature = Signature()
		self._signerPublicKey = PublicKey()
		self._version = 0
		self._network = NetworkType.MAINNET
		self._type_ = BlockType.NEMESIS
		self._height = Height()
		self._timestamp = Timestamp()
		self._difficulty = Difficulty()
		self._generationHashProof = VrfProof()
		self._previousBlockHash = Hash256()
		self._transactionsHash = Hash256()
		self._receiptsHash = Hash256()
		self._stateHash = Hash256()
		self._beneficiaryAddress = Address()
		self._feeMultiplier = BlockFeeMultiplier()
		self._verifiableEntityHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
	}

	None sort(){
		self._generationHashProof.sort()
	}

	@property
	Signature signature(){
		return self._signature
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	BlockType type_(){
		return self._type_
	}

	@property
	Height height(){
		return self._height
	}

	@property
	Timestamp timestamp(){
		return self._timestamp
	}

	@property
	Difficulty difficulty(){
		return self._difficulty
	}

	@property
	VrfProof generationHashProof(){
		return self._generationHashProof
	}

	@property
	Hash256 previousBlockHash(){
		return self._previousBlockHash
	}

	@property
	Hash256 transactionsHash(){
		return self._transactionsHash
	}

	@property
	Hash256 receiptsHash(){
		return self._receiptsHash
	}

	@property
	Hash256 stateHash(){
		return self._stateHash
	}

	@property
	Address beneficiaryAddress(){
		return self._beneficiaryAddress
	}

	@property
	BlockFeeMultiplier feeMultiplier(){
		return self._feeMultiplier
	}

	@signature.setter
	signature(value: Signature){
		self._signature = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: BlockType){
		self._type_ = value
	}

	@height.setter
	height(value: Height){
		self._height = value
	}

	@timestamp.setter
	timestamp(value: Timestamp){
		self._timestamp = value
	}

	@difficulty.setter
	difficulty(value: Difficulty){
		self._difficulty = value
	}

	@generationHashProof.setter
	generationHashProof(value: VrfProof){
		self._generationHashProof = value
	}

	@previousBlockHash.setter
	previousBlockHash(value: Hash256){
		self._previousBlockHash = value
	}

	@transactionsHash.setter
	transactionsHash(value: Hash256){
		self._transactionsHash = value
	}

	@receiptsHash.setter
	receiptsHash(value: Hash256){
		self._receiptsHash = value
	}

	@stateHash.setter
	stateHash(value: Hash256){
		self._stateHash = value
	}

	@beneficiaryAddress.setter
	beneficiaryAddress(value: Address){
		self._beneficiaryAddress = value
	}

	@feeMultiplier.setter
	feeMultiplier(value: BlockFeeMultiplier){
		self._feeMultiplier = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.height.size
		size += self.timestamp.size
		size += self.difficulty.size
		size += self.generationHashProof.size
		size += self.previousBlockHash.size
		size += self.transactionsHash.size
		size += self.receiptsHash.size
		size += self.stateHash.size
		size += self.beneficiaryAddress.size
		size += self.feeMultiplier.size
		return size
	}

	static Block deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiableEntityHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert verifiableEntityHeaderReserved_1 == 0, f'Invalid value of reserved field ({verifiableEntityHeaderReserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = BlockType.deserialize(buffer)
		buffer = buffer[type_.size:]
		height = Height.deserialize(buffer)
		buffer = buffer[height.size:]
		timestamp = Timestamp.deserialize(buffer)
		buffer = buffer[timestamp.size:]
		difficulty = Difficulty.deserialize(buffer)
		buffer = buffer[difficulty.size:]
		generationHashProof = VrfProof.deserialize(buffer)
		buffer = buffer[generationHashProof.size:]
		previousBlockHash = Hash256.deserialize(buffer)
		buffer = buffer[previousBlockHash.size:]
		transactionsHash = Hash256.deserialize(buffer)
		buffer = buffer[transactionsHash.size:]
		receiptsHash = Hash256.deserialize(buffer)
		buffer = buffer[receiptsHash.size:]
		stateHash = Hash256.deserialize(buffer)
		buffer = buffer[stateHash.size:]
		beneficiaryAddress = Address.deserialize(buffer)
		buffer = buffer[beneficiaryAddress.size:]
		feeMultiplier = BlockFeeMultiplier.deserialize(buffer)
		buffer = buffer[feeMultiplier.size:]

		instance = Block()
		instance._signature = signature
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._height = height
		instance._timestamp = timestamp
		instance._difficulty = difficulty
		instance._generationHashProof = generationHashProof
		instance._previousBlockHash = previousBlockHash
		instance._transactionsHash = transactionsHash
		instance._receiptsHash = receiptsHash
		instance._stateHash = stateHash
		instance._beneficiaryAddress = beneficiaryAddress
		instance._feeMultiplier = feeMultiplier
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._verifiableEntityHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signature.serialize()
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._height.serialize()
		buffer += self._timestamp.serialize()
		buffer += self._difficulty.serialize()
		buffer += self._generationHashProof.serialize()
		buffer += self._previousBlockHash.serialize()
		buffer += self._transactionsHash.serialize()
		buffer += self._receiptsHash.serialize()
		buffer += self._stateHash.serialize()
		buffer += self._beneficiaryAddress.serialize()
		buffer += self._feeMultiplier.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'height: {self._height.__str__()}, '
		result += f'timestamp: {self._timestamp.__str__()}, '
		result += f'difficulty: {self._difficulty.__str__()}, '
		result += f'generationHashProof: {self._generationHashProof.__str__()}, '
		result += f'previousBlockHash: {self._previousBlockHash.__str__()}, '
		result += f'transactionsHash: {self._transactionsHash.__str__()}, '
		result += f'receiptsHash: {self._receiptsHash.__str__()}, '
		result += f'stateHash: {self._stateHash.__str__()}, '
		result += f'beneficiaryAddress: {self._beneficiaryAddress.__str__()}, '
		result += f'feeMultiplier: {self._feeMultiplier.__str__()}, '
		result += ')'
		return result
	}
}


class NemesisBlockV1 {
	BLOCK_VERSION: int = 1
	BLOCK_TYPE: BlockType = BlockType.NEMESIS
	TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:BlockType',
		'height': 'pod:Height',
		'timestamp': 'pod:Timestamp',
		'difficulty': 'pod:Difficulty',
		'generationHashProof': 'struct:VrfProof',
		'previousBlockHash': 'pod:Hash256',
		'transactionsHash': 'pod:Hash256',
		'receiptsHash': 'pod:Hash256',
		'stateHash': 'pod:Hash256',
		'beneficiaryAddress': 'pod:Address',
		'feeMultiplier': 'pod:BlockFeeMultiplier',
		'totalVotingBalance': 'pod:Amount',
		'previousImportanceBlockHash': 'pod:Hash256',
		'transactions': 'array[Transaction]'
	}

	NemesisBlockV1(){
		self._signature = Signature()
		self._signerPublicKey = PublicKey()
		self._version = NemesisBlockV1.BLOCK_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = NemesisBlockV1.BLOCK_TYPE
		self._height = Height()
		self._timestamp = Timestamp()
		self._difficulty = Difficulty()
		self._generationHashProof = VrfProof()
		self._previousBlockHash = Hash256()
		self._transactionsHash = Hash256()
		self._receiptsHash = Hash256()
		self._stateHash = Hash256()
		self._beneficiaryAddress = Address()
		self._feeMultiplier = BlockFeeMultiplier()
		self._votingEligibleAccountsCount = 0
		self._harvestingEligibleAccountsCount = BigInt.zero
		self._totalVotingBalance = Amount()
		self._previousImportanceBlockHash = Hash256()
		self._transactions = []
		self._verifiableEntityHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
	}

	None sort(){
		self._generationHashProof.sort()
	}

	@property
	Signature signature(){
		return self._signature
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	BlockType type_(){
		return self._type_
	}

	@property
	Height height(){
		return self._height
	}

	@property
	Timestamp timestamp(){
		return self._timestamp
	}

	@property
	Difficulty difficulty(){
		return self._difficulty
	}

	@property
	VrfProof generationHashProof(){
		return self._generationHashProof
	}

	@property
	Hash256 previousBlockHash(){
		return self._previousBlockHash
	}

	@property
	Hash256 transactionsHash(){
		return self._transactionsHash
	}

	@property
	Hash256 receiptsHash(){
		return self._receiptsHash
	}

	@property
	Hash256 stateHash(){
		return self._stateHash
	}

	@property
	Address beneficiaryAddress(){
		return self._beneficiaryAddress
	}

	@property
	BlockFeeMultiplier feeMultiplier(){
		return self._feeMultiplier
	}

	@property
	int votingEligibleAccountsCount(){
		return self._votingEligibleAccountsCount
	}

	@property
	BigInt harvestingEligibleAccountsCount(){
		return self._harvestingEligibleAccountsCount
	}

	@property
	Amount totalVotingBalance(){
		return self._totalVotingBalance
	}

	@property
	Hash256 previousImportanceBlockHash(){
		return self._previousImportanceBlockHash
	}

	@property
	List[Transaction] transactions(){
		return self._transactions
	}

	@signature.setter
	signature(value: Signature){
		self._signature = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: BlockType){
		self._type_ = value
	}

	@height.setter
	height(value: Height){
		self._height = value
	}

	@timestamp.setter
	timestamp(value: Timestamp){
		self._timestamp = value
	}

	@difficulty.setter
	difficulty(value: Difficulty){
		self._difficulty = value
	}

	@generationHashProof.setter
	generationHashProof(value: VrfProof){
		self._generationHashProof = value
	}

	@previousBlockHash.setter
	previousBlockHash(value: Hash256){
		self._previousBlockHash = value
	}

	@transactionsHash.setter
	transactionsHash(value: Hash256){
		self._transactionsHash = value
	}

	@receiptsHash.setter
	receiptsHash(value: Hash256){
		self._receiptsHash = value
	}

	@stateHash.setter
	stateHash(value: Hash256){
		self._stateHash = value
	}

	@beneficiaryAddress.setter
	beneficiaryAddress(value: Address){
		self._beneficiaryAddress = value
	}

	@feeMultiplier.setter
	feeMultiplier(value: BlockFeeMultiplier){
		self._feeMultiplier = value
	}

	@votingEligibleAccountsCount.setter
	votingEligibleAccountsCount(value: int){
		self._votingEligibleAccountsCount = value
	}

	@harvestingEligibleAccountsCount.setter
	harvestingEligibleAccountsCount(value: BigInt){
		self._harvestingEligibleAccountsCount = value
	}

	@totalVotingBalance.setter
	totalVotingBalance(value: Amount){
		self._totalVotingBalance = value
	}

	@previousImportanceBlockHash.setter
	previousImportanceBlockHash(value: Hash256){
		self._previousImportanceBlockHash = value
	}

	@transactions.setter
	transactions(value: List[Transaction]){
		self._transactions = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.height.size
		size += self.timestamp.size
		size += self.difficulty.size
		size += self.generationHashProof.size
		size += self.previousBlockHash.size
		size += self.transactionsHash.size
		size += self.receiptsHash.size
		size += self.stateHash.size
		size += self.beneficiaryAddress.size
		size += self.feeMultiplier.size
		size += 4
		size += 8
		size += self.totalVotingBalance.size
		size += self.previousImportanceBlockHash.size
		size += ArrayHelpers.size(self.transactions, 8, skip_last_element_padding=True)
		return size
	}

	static NemesisBlockV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiableEntityHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert verifiableEntityHeaderReserved_1 == 0, f'Invalid value of reserved field ({verifiableEntityHeaderReserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = BlockType.deserialize(buffer)
		buffer = buffer[type_.size:]
		height = Height.deserialize(buffer)
		buffer = buffer[height.size:]
		timestamp = Timestamp.deserialize(buffer)
		buffer = buffer[timestamp.size:]
		difficulty = Difficulty.deserialize(buffer)
		buffer = buffer[difficulty.size:]
		generationHashProof = VrfProof.deserialize(buffer)
		buffer = buffer[generationHashProof.size:]
		previousBlockHash = Hash256.deserialize(buffer)
		buffer = buffer[previousBlockHash.size:]
		transactionsHash = Hash256.deserialize(buffer)
		buffer = buffer[transactionsHash.size:]
		receiptsHash = Hash256.deserialize(buffer)
		buffer = buffer[receiptsHash.size:]
		stateHash = Hash256.deserialize(buffer)
		buffer = buffer[stateHash.size:]
		beneficiaryAddress = Address.deserialize(buffer)
		buffer = buffer[beneficiaryAddress.size:]
		feeMultiplier = BlockFeeMultiplier.deserialize(buffer)
		buffer = buffer[feeMultiplier.size:]
		votingEligibleAccountsCount = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		harvestingEligibleAccountsCount = BigInt.from(buffer.getInt64(0, Endian.little))
		buffer = buffer[8:]
		totalVotingBalance = Amount.deserialize(buffer)
		buffer = buffer[totalVotingBalance.size:]
		previousImportanceBlockHash = Hash256.deserialize(buffer)
		buffer = buffer[previousImportanceBlockHash.size:]
		transactions = ArrayHelpers.read_variable_size_elements(buffer, TransactionFactory, 8, skip_last_element_padding=True)
		buffer = buffer[ArrayHelpers.size(transactions, 8, skip_last_element_padding=True):]

		instance = NemesisBlockV1()
		instance._signature = signature
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._height = height
		instance._timestamp = timestamp
		instance._difficulty = difficulty
		instance._generationHashProof = generationHashProof
		instance._previousBlockHash = previousBlockHash
		instance._transactionsHash = transactionsHash
		instance._receiptsHash = receiptsHash
		instance._stateHash = stateHash
		instance._beneficiaryAddress = beneficiaryAddress
		instance._feeMultiplier = feeMultiplier
		instance._votingEligibleAccountsCount = votingEligibleAccountsCount
		instance._harvestingEligibleAccountsCount = harvestingEligibleAccountsCount
		instance._totalVotingBalance = totalVotingBalance
		instance._previousImportanceBlockHash = previousImportanceBlockHash
		instance._transactions = transactions
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._verifiableEntityHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signature.serialize()
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._height.serialize()
		buffer += self._timestamp.serialize()
		buffer += self._difficulty.serialize()
		buffer += self._generationHashProof.serialize()
		buffer += self._previousBlockHash.serialize()
		buffer += self._transactionsHash.serialize()
		buffer += self._receiptsHash.serialize()
		buffer += self._stateHash.serialize()
		buffer += self._beneficiaryAddress.serialize()
		buffer += self._feeMultiplier.serialize()
		buffer += (buffer..setInt32(0, self._votingEligibleAccountsCount.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt64(0, self._harvestingEligibleAccountsCount.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._totalVotingBalance.serialize()
		buffer += self._previousImportanceBlockHash.serialize()
		buffer += ArrayHelpers.write_variable_size_elements(self._transactions, 8, skip_last_element_padding=True)
		return buffer
	}

	str toString(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'height: {self._height.__str__()}, '
		result += f'timestamp: {self._timestamp.__str__()}, '
		result += f'difficulty: {self._difficulty.__str__()}, '
		result += f'generationHashProof: {self._generationHashProof.__str__()}, '
		result += f'previousBlockHash: {self._previousBlockHash.__str__()}, '
		result += f'transactionsHash: {self._transactionsHash.__str__()}, '
		result += f'receiptsHash: {self._receiptsHash.__str__()}, '
		result += f'stateHash: {self._stateHash.__str__()}, '
		result += f'beneficiaryAddress: {self._beneficiaryAddress.__str__()}, '
		result += f'feeMultiplier: {self._feeMultiplier.__str__()}, '
		result += f'votingEligibleAccountsCount: 0x{self._votingEligibleAccountsCount:X}, '
		result += f'harvestingEligibleAccountsCount: 0x{self._harvestingEligibleAccountsCount:X}, '
		result += f'totalVotingBalance: {self._totalVotingBalance.__str__()}, '
		result += f'previousImportanceBlockHash: {self._previousImportanceBlockHash.__str__()}, '
		result += f'transactions: {list(map(str, self._transactions))}, '
		result += ')'
		return result
	}
}


class NormalBlockV1 {
	BLOCK_VERSION: int = 1
	BLOCK_TYPE: BlockType = BlockType.NORMAL
	TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:BlockType',
		'height': 'pod:Height',
		'timestamp': 'pod:Timestamp',
		'difficulty': 'pod:Difficulty',
		'generationHashProof': 'struct:VrfProof',
		'previousBlockHash': 'pod:Hash256',
		'transactionsHash': 'pod:Hash256',
		'receiptsHash': 'pod:Hash256',
		'stateHash': 'pod:Hash256',
		'beneficiaryAddress': 'pod:Address',
		'feeMultiplier': 'pod:BlockFeeMultiplier',
		'transactions': 'array[Transaction]'
	}

	NormalBlockV1(){
		self._signature = Signature()
		self._signerPublicKey = PublicKey()
		self._version = NormalBlockV1.BLOCK_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = NormalBlockV1.BLOCK_TYPE
		self._height = Height()
		self._timestamp = Timestamp()
		self._difficulty = Difficulty()
		self._generationHashProof = VrfProof()
		self._previousBlockHash = Hash256()
		self._transactionsHash = Hash256()
		self._receiptsHash = Hash256()
		self._stateHash = Hash256()
		self._beneficiaryAddress = Address()
		self._feeMultiplier = BlockFeeMultiplier()
		self._transactions = []
		self._verifiableEntityHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
		self._blockHeaderReserved_1 = 0  # reserved field
	}

	None sort(){
		self._generationHashProof.sort()
	}

	@property
	Signature signature(){
		return self._signature
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	BlockType type_(){
		return self._type_
	}

	@property
	Height height(){
		return self._height
	}

	@property
	Timestamp timestamp(){
		return self._timestamp
	}

	@property
	Difficulty difficulty(){
		return self._difficulty
	}

	@property
	VrfProof generationHashProof(){
		return self._generationHashProof
	}

	@property
	Hash256 previousBlockHash(){
		return self._previousBlockHash
	}

	@property
	Hash256 transactionsHash(){
		return self._transactionsHash
	}

	@property
	Hash256 receiptsHash(){
		return self._receiptsHash
	}

	@property
	Hash256 stateHash(){
		return self._stateHash
	}

	@property
	Address beneficiaryAddress(){
		return self._beneficiaryAddress
	}

	@property
	BlockFeeMultiplier feeMultiplier(){
		return self._feeMultiplier
	}

	@property
	List[Transaction] transactions(){
		return self._transactions
	}

	@signature.setter
	signature(value: Signature){
		self._signature = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: BlockType){
		self._type_ = value
	}

	@height.setter
	height(value: Height){
		self._height = value
	}

	@timestamp.setter
	timestamp(value: Timestamp){
		self._timestamp = value
	}

	@difficulty.setter
	difficulty(value: Difficulty){
		self._difficulty = value
	}

	@generationHashProof.setter
	generationHashProof(value: VrfProof){
		self._generationHashProof = value
	}

	@previousBlockHash.setter
	previousBlockHash(value: Hash256){
		self._previousBlockHash = value
	}

	@transactionsHash.setter
	transactionsHash(value: Hash256){
		self._transactionsHash = value
	}

	@receiptsHash.setter
	receiptsHash(value: Hash256){
		self._receiptsHash = value
	}

	@stateHash.setter
	stateHash(value: Hash256){
		self._stateHash = value
	}

	@beneficiaryAddress.setter
	beneficiaryAddress(value: Address){
		self._beneficiaryAddress = value
	}

	@feeMultiplier.setter
	feeMultiplier(value: BlockFeeMultiplier){
		self._feeMultiplier = value
	}

	@transactions.setter
	transactions(value: List[Transaction]){
		self._transactions = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.height.size
		size += self.timestamp.size
		size += self.difficulty.size
		size += self.generationHashProof.size
		size += self.previousBlockHash.size
		size += self.transactionsHash.size
		size += self.receiptsHash.size
		size += self.stateHash.size
		size += self.beneficiaryAddress.size
		size += self.feeMultiplier.size
		size += 4
		size += ArrayHelpers.size(self.transactions, 8, skip_last_element_padding=True)
		return size
	}

	static NormalBlockV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiableEntityHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert verifiableEntityHeaderReserved_1 == 0, f'Invalid value of reserved field ({verifiableEntityHeaderReserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = BlockType.deserialize(buffer)
		buffer = buffer[type_.size:]
		height = Height.deserialize(buffer)
		buffer = buffer[height.size:]
		timestamp = Timestamp.deserialize(buffer)
		buffer = buffer[timestamp.size:]
		difficulty = Difficulty.deserialize(buffer)
		buffer = buffer[difficulty.size:]
		generationHashProof = VrfProof.deserialize(buffer)
		buffer = buffer[generationHashProof.size:]
		previousBlockHash = Hash256.deserialize(buffer)
		buffer = buffer[previousBlockHash.size:]
		transactionsHash = Hash256.deserialize(buffer)
		buffer = buffer[transactionsHash.size:]
		receiptsHash = Hash256.deserialize(buffer)
		buffer = buffer[receiptsHash.size:]
		stateHash = Hash256.deserialize(buffer)
		buffer = buffer[stateHash.size:]
		beneficiaryAddress = Address.deserialize(buffer)
		buffer = buffer[beneficiaryAddress.size:]
		feeMultiplier = BlockFeeMultiplier.deserialize(buffer)
		buffer = buffer[feeMultiplier.size:]
		blockHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert blockHeaderReserved_1 == 0, f'Invalid value of reserved field ({blockHeaderReserved_1})'
		transactions = ArrayHelpers.read_variable_size_elements(buffer, TransactionFactory, 8, skip_last_element_padding=True)
		buffer = buffer[ArrayHelpers.size(transactions, 8, skip_last_element_padding=True):]

		instance = NormalBlockV1()
		instance._signature = signature
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._height = height
		instance._timestamp = timestamp
		instance._difficulty = difficulty
		instance._generationHashProof = generationHashProof
		instance._previousBlockHash = previousBlockHash
		instance._transactionsHash = transactionsHash
		instance._receiptsHash = receiptsHash
		instance._stateHash = stateHash
		instance._beneficiaryAddress = beneficiaryAddress
		instance._feeMultiplier = feeMultiplier
		instance._transactions = transactions
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._verifiableEntityHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signature.serialize()
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._height.serialize()
		buffer += self._timestamp.serialize()
		buffer += self._difficulty.serialize()
		buffer += self._generationHashProof.serialize()
		buffer += self._previousBlockHash.serialize()
		buffer += self._transactionsHash.serialize()
		buffer += self._receiptsHash.serialize()
		buffer += self._stateHash.serialize()
		buffer += self._beneficiaryAddress.serialize()
		buffer += self._feeMultiplier.serialize()
		buffer += (buffer..setInt32(0, self._blockHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += ArrayHelpers.write_variable_size_elements(self._transactions, 8, skip_last_element_padding=True)
		return buffer
	}

	str toString(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'height: {self._height.__str__()}, '
		result += f'timestamp: {self._timestamp.__str__()}, '
		result += f'difficulty: {self._difficulty.__str__()}, '
		result += f'generationHashProof: {self._generationHashProof.__str__()}, '
		result += f'previousBlockHash: {self._previousBlockHash.__str__()}, '
		result += f'transactionsHash: {self._transactionsHash.__str__()}, '
		result += f'receiptsHash: {self._receiptsHash.__str__()}, '
		result += f'stateHash: {self._stateHash.__str__()}, '
		result += f'beneficiaryAddress: {self._beneficiaryAddress.__str__()}, '
		result += f'feeMultiplier: {self._feeMultiplier.__str__()}, '
		result += f'transactions: {list(map(str, self._transactions))}, '
		result += ')'
		return result
	}
}


class ImportanceBlockV1 {
	BLOCK_VERSION: int = 1
	BLOCK_TYPE: BlockType = BlockType.IMPORTANCE
	TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:BlockType',
		'height': 'pod:Height',
		'timestamp': 'pod:Timestamp',
		'difficulty': 'pod:Difficulty',
		'generationHashProof': 'struct:VrfProof',
		'previousBlockHash': 'pod:Hash256',
		'transactionsHash': 'pod:Hash256',
		'receiptsHash': 'pod:Hash256',
		'stateHash': 'pod:Hash256',
		'beneficiaryAddress': 'pod:Address',
		'feeMultiplier': 'pod:BlockFeeMultiplier',
		'totalVotingBalance': 'pod:Amount',
		'previousImportanceBlockHash': 'pod:Hash256',
		'transactions': 'array[Transaction]'
	}

	ImportanceBlockV1(){
		self._signature = Signature()
		self._signerPublicKey = PublicKey()
		self._version = ImportanceBlockV1.BLOCK_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = ImportanceBlockV1.BLOCK_TYPE
		self._height = Height()
		self._timestamp = Timestamp()
		self._difficulty = Difficulty()
		self._generationHashProof = VrfProof()
		self._previousBlockHash = Hash256()
		self._transactionsHash = Hash256()
		self._receiptsHash = Hash256()
		self._stateHash = Hash256()
		self._beneficiaryAddress = Address()
		self._feeMultiplier = BlockFeeMultiplier()
		self._votingEligibleAccountsCount = 0
		self._harvestingEligibleAccountsCount = BigInt.zero
		self._totalVotingBalance = Amount()
		self._previousImportanceBlockHash = Hash256()
		self._transactions = []
		self._verifiableEntityHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
	}

	None sort(){
		self._generationHashProof.sort()
	}

	@property
	Signature signature(){
		return self._signature
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	BlockType type_(){
		return self._type_
	}

	@property
	Height height(){
		return self._height
	}

	@property
	Timestamp timestamp(){
		return self._timestamp
	}

	@property
	Difficulty difficulty(){
		return self._difficulty
	}

	@property
	VrfProof generationHashProof(){
		return self._generationHashProof
	}

	@property
	Hash256 previousBlockHash(){
		return self._previousBlockHash
	}

	@property
	Hash256 transactionsHash(){
		return self._transactionsHash
	}

	@property
	Hash256 receiptsHash(){
		return self._receiptsHash
	}

	@property
	Hash256 stateHash(){
		return self._stateHash
	}

	@property
	Address beneficiaryAddress(){
		return self._beneficiaryAddress
	}

	@property
	BlockFeeMultiplier feeMultiplier(){
		return self._feeMultiplier
	}

	@property
	int votingEligibleAccountsCount(){
		return self._votingEligibleAccountsCount
	}

	@property
	BigInt harvestingEligibleAccountsCount(){
		return self._harvestingEligibleAccountsCount
	}

	@property
	Amount totalVotingBalance(){
		return self._totalVotingBalance
	}

	@property
	Hash256 previousImportanceBlockHash(){
		return self._previousImportanceBlockHash
	}

	@property
	List[Transaction] transactions(){
		return self._transactions
	}

	@signature.setter
	signature(value: Signature){
		self._signature = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: BlockType){
		self._type_ = value
	}

	@height.setter
	height(value: Height){
		self._height = value
	}

	@timestamp.setter
	timestamp(value: Timestamp){
		self._timestamp = value
	}

	@difficulty.setter
	difficulty(value: Difficulty){
		self._difficulty = value
	}

	@generationHashProof.setter
	generationHashProof(value: VrfProof){
		self._generationHashProof = value
	}

	@previousBlockHash.setter
	previousBlockHash(value: Hash256){
		self._previousBlockHash = value
	}

	@transactionsHash.setter
	transactionsHash(value: Hash256){
		self._transactionsHash = value
	}

	@receiptsHash.setter
	receiptsHash(value: Hash256){
		self._receiptsHash = value
	}

	@stateHash.setter
	stateHash(value: Hash256){
		self._stateHash = value
	}

	@beneficiaryAddress.setter
	beneficiaryAddress(value: Address){
		self._beneficiaryAddress = value
	}

	@feeMultiplier.setter
	feeMultiplier(value: BlockFeeMultiplier){
		self._feeMultiplier = value
	}

	@votingEligibleAccountsCount.setter
	votingEligibleAccountsCount(value: int){
		self._votingEligibleAccountsCount = value
	}

	@harvestingEligibleAccountsCount.setter
	harvestingEligibleAccountsCount(value: BigInt){
		self._harvestingEligibleAccountsCount = value
	}

	@totalVotingBalance.setter
	totalVotingBalance(value: Amount){
		self._totalVotingBalance = value
	}

	@previousImportanceBlockHash.setter
	previousImportanceBlockHash(value: Hash256){
		self._previousImportanceBlockHash = value
	}

	@transactions.setter
	transactions(value: List[Transaction]){
		self._transactions = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.height.size
		size += self.timestamp.size
		size += self.difficulty.size
		size += self.generationHashProof.size
		size += self.previousBlockHash.size
		size += self.transactionsHash.size
		size += self.receiptsHash.size
		size += self.stateHash.size
		size += self.beneficiaryAddress.size
		size += self.feeMultiplier.size
		size += 4
		size += 8
		size += self.totalVotingBalance.size
		size += self.previousImportanceBlockHash.size
		size += ArrayHelpers.size(self.transactions, 8, skip_last_element_padding=True)
		return size
	}

	static ImportanceBlockV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiableEntityHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert verifiableEntityHeaderReserved_1 == 0, f'Invalid value of reserved field ({verifiableEntityHeaderReserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = BlockType.deserialize(buffer)
		buffer = buffer[type_.size:]
		height = Height.deserialize(buffer)
		buffer = buffer[height.size:]
		timestamp = Timestamp.deserialize(buffer)
		buffer = buffer[timestamp.size:]
		difficulty = Difficulty.deserialize(buffer)
		buffer = buffer[difficulty.size:]
		generationHashProof = VrfProof.deserialize(buffer)
		buffer = buffer[generationHashProof.size:]
		previousBlockHash = Hash256.deserialize(buffer)
		buffer = buffer[previousBlockHash.size:]
		transactionsHash = Hash256.deserialize(buffer)
		buffer = buffer[transactionsHash.size:]
		receiptsHash = Hash256.deserialize(buffer)
		buffer = buffer[receiptsHash.size:]
		stateHash = Hash256.deserialize(buffer)
		buffer = buffer[stateHash.size:]
		beneficiaryAddress = Address.deserialize(buffer)
		buffer = buffer[beneficiaryAddress.size:]
		feeMultiplier = BlockFeeMultiplier.deserialize(buffer)
		buffer = buffer[feeMultiplier.size:]
		votingEligibleAccountsCount = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		harvestingEligibleAccountsCount = BigInt.from(buffer.getInt64(0, Endian.little))
		buffer = buffer[8:]
		totalVotingBalance = Amount.deserialize(buffer)
		buffer = buffer[totalVotingBalance.size:]
		previousImportanceBlockHash = Hash256.deserialize(buffer)
		buffer = buffer[previousImportanceBlockHash.size:]
		transactions = ArrayHelpers.read_variable_size_elements(buffer, TransactionFactory, 8, skip_last_element_padding=True)
		buffer = buffer[ArrayHelpers.size(transactions, 8, skip_last_element_padding=True):]

		instance = ImportanceBlockV1()
		instance._signature = signature
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._height = height
		instance._timestamp = timestamp
		instance._difficulty = difficulty
		instance._generationHashProof = generationHashProof
		instance._previousBlockHash = previousBlockHash
		instance._transactionsHash = transactionsHash
		instance._receiptsHash = receiptsHash
		instance._stateHash = stateHash
		instance._beneficiaryAddress = beneficiaryAddress
		instance._feeMultiplier = feeMultiplier
		instance._votingEligibleAccountsCount = votingEligibleAccountsCount
		instance._harvestingEligibleAccountsCount = harvestingEligibleAccountsCount
		instance._totalVotingBalance = totalVotingBalance
		instance._previousImportanceBlockHash = previousImportanceBlockHash
		instance._transactions = transactions
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._verifiableEntityHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signature.serialize()
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._height.serialize()
		buffer += self._timestamp.serialize()
		buffer += self._difficulty.serialize()
		buffer += self._generationHashProof.serialize()
		buffer += self._previousBlockHash.serialize()
		buffer += self._transactionsHash.serialize()
		buffer += self._receiptsHash.serialize()
		buffer += self._stateHash.serialize()
		buffer += self._beneficiaryAddress.serialize()
		buffer += self._feeMultiplier.serialize()
		buffer += (buffer..setInt32(0, self._votingEligibleAccountsCount.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt64(0, self._harvestingEligibleAccountsCount.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._totalVotingBalance.serialize()
		buffer += self._previousImportanceBlockHash.serialize()
		buffer += ArrayHelpers.write_variable_size_elements(self._transactions, 8, skip_last_element_padding=True)
		return buffer
	}

	str toString(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'height: {self._height.__str__()}, '
		result += f'timestamp: {self._timestamp.__str__()}, '
		result += f'difficulty: {self._difficulty.__str__()}, '
		result += f'generationHashProof: {self._generationHashProof.__str__()}, '
		result += f'previousBlockHash: {self._previousBlockHash.__str__()}, '
		result += f'transactionsHash: {self._transactionsHash.__str__()}, '
		result += f'receiptsHash: {self._receiptsHash.__str__()}, '
		result += f'stateHash: {self._stateHash.__str__()}, '
		result += f'beneficiaryAddress: {self._beneficiaryAddress.__str__()}, '
		result += f'feeMultiplier: {self._feeMultiplier.__str__()}, '
		result += f'votingEligibleAccountsCount: 0x{self._votingEligibleAccountsCount:X}, '
		result += f'harvestingEligibleAccountsCount: 0x{self._harvestingEligibleAccountsCount:X}, '
		result += f'totalVotingBalance: {self._totalVotingBalance.__str__()}, '
		result += f'previousImportanceBlockHash: {self._previousImportanceBlockHash.__str__()}, '
		result += f'transactions: {list(map(str, self._transactions))}, '
		result += ')'
		return result
	}
}


class FinalizationRound {
	TYPE_HINTS = {
		'epoch': 'pod:FinalizationEpoch',
		'point': 'pod:FinalizationPoint'
	}

	FinalizationRound(){
		self._epoch = FinalizationEpoch()
		self._point = FinalizationPoint()
	}

	None sort(){
		pass
	}

	@property
	FinalizationEpoch epoch(){
		return self._epoch
	}

	@property
	FinalizationPoint point(){
		return self._point
	}

	@epoch.setter
	epoch(value: FinalizationEpoch){
		self._epoch = value
	}

	@point.setter
	point(value: FinalizationPoint){
		self._point = value
	}

	int get size(){
		size = 0
		size += self.epoch.size
		size += self.point.size
		return size
	}

	static FinalizationRound deserialize(Uint8List payload){
		buffer = memoryview(payload)
		epoch = FinalizationEpoch.deserialize(buffer)
		buffer = buffer[epoch.size:]
		point = FinalizationPoint.deserialize(buffer)
		buffer = buffer[point.size:]

		instance = FinalizationRound()
		instance._epoch = epoch
		instance._point = point
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self._epoch.serialize()
		buffer += self._point.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'epoch: {self._epoch.__str__()}, '
		result += f'point: {self._point.__str__()}, '
		result += ')'
		return result
	}
}


class FinalizedBlockHeader {
	TYPE_HINTS = {
		'round': 'struct:FinalizationRound',
		'height': 'pod:Height',
		'hash': 'pod:Hash256'
	}

	FinalizedBlockHeader(){
		self._round = FinalizationRound()
		self._height = Height()
		self._hash = Hash256()
	}

	None sort(){
		self._round.sort()
	}

	@property
	FinalizationRound round(){
		return self._round
	}

	@property
	Height height(){
		return self._height
	}

	@property
	Hash256 hash(){
		return self._hash
	}

	@round.setter
	round(value: FinalizationRound){
		self._round = value
	}

	@height.setter
	height(value: Height){
		self._height = value
	}

	@hash.setter
	hash(value: Hash256){
		self._hash = value
	}

	int get size(){
		size = 0
		size += self.round.size
		size += self.height.size
		size += self.hash.size
		return size
	}

	static FinalizedBlockHeader deserialize(Uint8List payload){
		buffer = memoryview(payload)
		round = FinalizationRound.deserialize(buffer)
		buffer = buffer[round.size:]
		height = Height.deserialize(buffer)
		buffer = buffer[height.size:]
		hash = Hash256.deserialize(buffer)
		buffer = buffer[hash.size:]

		instance = FinalizedBlockHeader()
		instance._round = round
		instance._height = height
		instance._hash = hash
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self._round.serialize()
		buffer += self._height.serialize()
		buffer += self._hash.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'round: {self._round.__str__()}, '
		result += f'height: {self._height.__str__()}, '
		result += f'hash: {self._hash.__str__()}, '
		result += ')'
		return result
	}
}


class ReceiptType extends (Enum) {
	MOSAIC_RENTAL_FEE = 4685
	NAMESPACE_RENTAL_FEE = 4942
	HARVEST_FEE = 8515
	LOCK_HASH_COMPLETED = 8776
	LOCK_HASH_EXPIRED = 9032
	LOCK_SECRET_COMPLETED = 8786
	LOCK_SECRET_EXPIRED = 9042
	LOCK_HASH_CREATED = 12616
	LOCK_SECRET_CREATED = 12626
	MOSAIC_EXPIRED = 16717
	NAMESPACE_EXPIRED = 16718
	NAMESPACE_DELETED = 16974
	INFLATION = 20803
	TRANSACTION_GROUP = 57667
	ADDRESS_ALIAS_RESOLUTION = 61763
	MOSAIC_ALIAS_RESOLUTION = 62019

	int get size(){
		return 2
	}

	static ReceiptType deserialize(Uint8List payload){
		buffer = memoryview(payload)
		return ReceiptType(BigInt.from(buffer.getInt16(0, Endian.little)))
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += (buffer..setInt16(0, self.value.toInt(), Endian.little)).buffer.asUint8List();
		return buffer
	}
}


class Receipt {
	TYPE_HINTS = {
		'type_': 'enum:ReceiptType'
	}

	Receipt(){
		self._version = 0
		self._type_ = ReceiptType.MOSAIC_RENTAL_FEE
	}

	None sort(){
		pass
	}

	@property
	int version(){
		return self._version
	}

	@property
	ReceiptType type_(){
		return self._type_
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@type_.setter
	type_(value: ReceiptType){
		self._type_ = value
	}

	int get size(){
		size = 0
		size += 4
		size += 2
		size += self.type_.size
		return size
	}

	static Receipt deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		version = BigInt.from(buffer.getInt16(0, Endian.little))
		buffer = buffer[2:]
		type_ = ReceiptType.deserialize(buffer)
		buffer = buffer[type_.size:]

		instance = Receipt()
		instance._version = version
		instance._type_ = type_
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt16(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._type_.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'version: 0x{self._version:X}, '
		result += f'type_: {self._type_.__str__()}, '
		result += ')'
		return result
	}
}


class HarvestFeeReceipt {
	RECEIPT_TYPE: ReceiptType = ReceiptType.HARVEST_FEE
	TYPE_HINTS = {
		'type_': 'enum:ReceiptType',
		'mosaic': 'struct:Mosaic',
		'targetAddress': 'pod:Address'
	}

	HarvestFeeReceipt(){
		self._version = 0
		self._type_ = HarvestFeeReceipt.RECEIPT_TYPE
		self._mosaic = Mosaic()
		self._targetAddress = Address()
	}

	None sort(){
		self._mosaic.sort()
	}

	@property
	int version(){
		return self._version
	}

	@property
	ReceiptType type_(){
		return self._type_
	}

	@property
	Mosaic mosaic(){
		return self._mosaic
	}

	@property
	Address targetAddress(){
		return self._targetAddress
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@type_.setter
	type_(value: ReceiptType){
		self._type_ = value
	}

	@mosaic.setter
	mosaic(value: Mosaic){
		self._mosaic = value
	}

	@targetAddress.setter
	targetAddress(value: Address){
		self._targetAddress = value
	}

	int get size(){
		size = 0
		size += 4
		size += 2
		size += self.type_.size
		size += self.mosaic.size
		size += self.targetAddress.size
		return size
	}

	static HarvestFeeReceipt deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		version = BigInt.from(buffer.getInt16(0, Endian.little))
		buffer = buffer[2:]
		type_ = ReceiptType.deserialize(buffer)
		buffer = buffer[type_.size:]
		mosaic = Mosaic.deserialize(buffer)
		buffer = buffer[mosaic.size:]
		targetAddress = Address.deserialize(buffer)
		buffer = buffer[targetAddress.size:]

		instance = HarvestFeeReceipt()
		instance._version = version
		instance._type_ = type_
		instance._mosaic = mosaic
		instance._targetAddress = targetAddress
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt16(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._type_.serialize()
		buffer += self._mosaic.serialize()
		buffer += self._targetAddress.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'version: 0x{self._version:X}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'mosaic: {self._mosaic.__str__()}, '
		result += f'targetAddress: {self._targetAddress.__str__()}, '
		result += ')'
		return result
	}
}


class InflationReceipt {
	RECEIPT_TYPE: ReceiptType = ReceiptType.INFLATION
	TYPE_HINTS = {
		'type_': 'enum:ReceiptType',
		'mosaic': 'struct:Mosaic'
	}

	InflationReceipt(){
		self._version = 0
		self._type_ = InflationReceipt.RECEIPT_TYPE
		self._mosaic = Mosaic()
	}

	None sort(){
		self._mosaic.sort()
	}

	@property
	int version(){
		return self._version
	}

	@property
	ReceiptType type_(){
		return self._type_
	}

	@property
	Mosaic mosaic(){
		return self._mosaic
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@type_.setter
	type_(value: ReceiptType){
		self._type_ = value
	}

	@mosaic.setter
	mosaic(value: Mosaic){
		self._mosaic = value
	}

	int get size(){
		size = 0
		size += 4
		size += 2
		size += self.type_.size
		size += self.mosaic.size
		return size
	}

	static InflationReceipt deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		version = BigInt.from(buffer.getInt16(0, Endian.little))
		buffer = buffer[2:]
		type_ = ReceiptType.deserialize(buffer)
		buffer = buffer[type_.size:]
		mosaic = Mosaic.deserialize(buffer)
		buffer = buffer[mosaic.size:]

		instance = InflationReceipt()
		instance._version = version
		instance._type_ = type_
		instance._mosaic = mosaic
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt16(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._type_.serialize()
		buffer += self._mosaic.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'version: 0x{self._version:X}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'mosaic: {self._mosaic.__str__()}, '
		result += ')'
		return result
	}
}


class LockHashCreatedFeeReceipt {
	RECEIPT_TYPE: ReceiptType = ReceiptType.LOCK_HASH_CREATED
	TYPE_HINTS = {
		'type_': 'enum:ReceiptType',
		'mosaic': 'struct:Mosaic',
		'targetAddress': 'pod:Address'
	}

	LockHashCreatedFeeReceipt(){
		self._version = 0
		self._type_ = LockHashCreatedFeeReceipt.RECEIPT_TYPE
		self._mosaic = Mosaic()
		self._targetAddress = Address()
	}

	None sort(){
		self._mosaic.sort()
	}

	@property
	int version(){
		return self._version
	}

	@property
	ReceiptType type_(){
		return self._type_
	}

	@property
	Mosaic mosaic(){
		return self._mosaic
	}

	@property
	Address targetAddress(){
		return self._targetAddress
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@type_.setter
	type_(value: ReceiptType){
		self._type_ = value
	}

	@mosaic.setter
	mosaic(value: Mosaic){
		self._mosaic = value
	}

	@targetAddress.setter
	targetAddress(value: Address){
		self._targetAddress = value
	}

	int get size(){
		size = 0
		size += 4
		size += 2
		size += self.type_.size
		size += self.mosaic.size
		size += self.targetAddress.size
		return size
	}

	static LockHashCreatedFeeReceipt deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		version = BigInt.from(buffer.getInt16(0, Endian.little))
		buffer = buffer[2:]
		type_ = ReceiptType.deserialize(buffer)
		buffer = buffer[type_.size:]
		mosaic = Mosaic.deserialize(buffer)
		buffer = buffer[mosaic.size:]
		targetAddress = Address.deserialize(buffer)
		buffer = buffer[targetAddress.size:]

		instance = LockHashCreatedFeeReceipt()
		instance._version = version
		instance._type_ = type_
		instance._mosaic = mosaic
		instance._targetAddress = targetAddress
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt16(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._type_.serialize()
		buffer += self._mosaic.serialize()
		buffer += self._targetAddress.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'version: 0x{self._version:X}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'mosaic: {self._mosaic.__str__()}, '
		result += f'targetAddress: {self._targetAddress.__str__()}, '
		result += ')'
		return result
	}
}


class LockHashCompletedFeeReceipt {
	RECEIPT_TYPE: ReceiptType = ReceiptType.LOCK_HASH_COMPLETED
	TYPE_HINTS = {
		'type_': 'enum:ReceiptType',
		'mosaic': 'struct:Mosaic',
		'targetAddress': 'pod:Address'
	}

	LockHashCompletedFeeReceipt(){
		self._version = 0
		self._type_ = LockHashCompletedFeeReceipt.RECEIPT_TYPE
		self._mosaic = Mosaic()
		self._targetAddress = Address()
	}

	None sort(){
		self._mosaic.sort()
	}

	@property
	int version(){
		return self._version
	}

	@property
	ReceiptType type_(){
		return self._type_
	}

	@property
	Mosaic mosaic(){
		return self._mosaic
	}

	@property
	Address targetAddress(){
		return self._targetAddress
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@type_.setter
	type_(value: ReceiptType){
		self._type_ = value
	}

	@mosaic.setter
	mosaic(value: Mosaic){
		self._mosaic = value
	}

	@targetAddress.setter
	targetAddress(value: Address){
		self._targetAddress = value
	}

	int get size(){
		size = 0
		size += 4
		size += 2
		size += self.type_.size
		size += self.mosaic.size
		size += self.targetAddress.size
		return size
	}

	static LockHashCompletedFeeReceipt deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		version = BigInt.from(buffer.getInt16(0, Endian.little))
		buffer = buffer[2:]
		type_ = ReceiptType.deserialize(buffer)
		buffer = buffer[type_.size:]
		mosaic = Mosaic.deserialize(buffer)
		buffer = buffer[mosaic.size:]
		targetAddress = Address.deserialize(buffer)
		buffer = buffer[targetAddress.size:]

		instance = LockHashCompletedFeeReceipt()
		instance._version = version
		instance._type_ = type_
		instance._mosaic = mosaic
		instance._targetAddress = targetAddress
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt16(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._type_.serialize()
		buffer += self._mosaic.serialize()
		buffer += self._targetAddress.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'version: 0x{self._version:X}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'mosaic: {self._mosaic.__str__()}, '
		result += f'targetAddress: {self._targetAddress.__str__()}, '
		result += ')'
		return result
	}
}


class LockHashExpiredFeeReceipt {
	RECEIPT_TYPE: ReceiptType = ReceiptType.LOCK_HASH_EXPIRED
	TYPE_HINTS = {
		'type_': 'enum:ReceiptType',
		'mosaic': 'struct:Mosaic',
		'targetAddress': 'pod:Address'
	}

	LockHashExpiredFeeReceipt(){
		self._version = 0
		self._type_ = LockHashExpiredFeeReceipt.RECEIPT_TYPE
		self._mosaic = Mosaic()
		self._targetAddress = Address()
	}

	None sort(){
		self._mosaic.sort()
	}

	@property
	int version(){
		return self._version
	}

	@property
	ReceiptType type_(){
		return self._type_
	}

	@property
	Mosaic mosaic(){
		return self._mosaic
	}

	@property
	Address targetAddress(){
		return self._targetAddress
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@type_.setter
	type_(value: ReceiptType){
		self._type_ = value
	}

	@mosaic.setter
	mosaic(value: Mosaic){
		self._mosaic = value
	}

	@targetAddress.setter
	targetAddress(value: Address){
		self._targetAddress = value
	}

	int get size(){
		size = 0
		size += 4
		size += 2
		size += self.type_.size
		size += self.mosaic.size
		size += self.targetAddress.size
		return size
	}

	static LockHashExpiredFeeReceipt deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		version = BigInt.from(buffer.getInt16(0, Endian.little))
		buffer = buffer[2:]
		type_ = ReceiptType.deserialize(buffer)
		buffer = buffer[type_.size:]
		mosaic = Mosaic.deserialize(buffer)
		buffer = buffer[mosaic.size:]
		targetAddress = Address.deserialize(buffer)
		buffer = buffer[targetAddress.size:]

		instance = LockHashExpiredFeeReceipt()
		instance._version = version
		instance._type_ = type_
		instance._mosaic = mosaic
		instance._targetAddress = targetAddress
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt16(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._type_.serialize()
		buffer += self._mosaic.serialize()
		buffer += self._targetAddress.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'version: 0x{self._version:X}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'mosaic: {self._mosaic.__str__()}, '
		result += f'targetAddress: {self._targetAddress.__str__()}, '
		result += ')'
		return result
	}
}


class LockSecretCreatedFeeReceipt {
	RECEIPT_TYPE: ReceiptType = ReceiptType.LOCK_SECRET_CREATED
	TYPE_HINTS = {
		'type_': 'enum:ReceiptType',
		'mosaic': 'struct:Mosaic',
		'targetAddress': 'pod:Address'
	}

	LockSecretCreatedFeeReceipt(){
		self._version = 0
		self._type_ = LockSecretCreatedFeeReceipt.RECEIPT_TYPE
		self._mosaic = Mosaic()
		self._targetAddress = Address()
	}

	None sort(){
		self._mosaic.sort()
	}

	@property
	int version(){
		return self._version
	}

	@property
	ReceiptType type_(){
		return self._type_
	}

	@property
	Mosaic mosaic(){
		return self._mosaic
	}

	@property
	Address targetAddress(){
		return self._targetAddress
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@type_.setter
	type_(value: ReceiptType){
		self._type_ = value
	}

	@mosaic.setter
	mosaic(value: Mosaic){
		self._mosaic = value
	}

	@targetAddress.setter
	targetAddress(value: Address){
		self._targetAddress = value
	}

	int get size(){
		size = 0
		size += 4
		size += 2
		size += self.type_.size
		size += self.mosaic.size
		size += self.targetAddress.size
		return size
	}

	static LockSecretCreatedFeeReceipt deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		version = BigInt.from(buffer.getInt16(0, Endian.little))
		buffer = buffer[2:]
		type_ = ReceiptType.deserialize(buffer)
		buffer = buffer[type_.size:]
		mosaic = Mosaic.deserialize(buffer)
		buffer = buffer[mosaic.size:]
		targetAddress = Address.deserialize(buffer)
		buffer = buffer[targetAddress.size:]

		instance = LockSecretCreatedFeeReceipt()
		instance._version = version
		instance._type_ = type_
		instance._mosaic = mosaic
		instance._targetAddress = targetAddress
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt16(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._type_.serialize()
		buffer += self._mosaic.serialize()
		buffer += self._targetAddress.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'version: 0x{self._version:X}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'mosaic: {self._mosaic.__str__()}, '
		result += f'targetAddress: {self._targetAddress.__str__()}, '
		result += ')'
		return result
	}
}


class LockSecretCompletedFeeReceipt {
	RECEIPT_TYPE: ReceiptType = ReceiptType.LOCK_SECRET_COMPLETED
	TYPE_HINTS = {
		'type_': 'enum:ReceiptType',
		'mosaic': 'struct:Mosaic',
		'targetAddress': 'pod:Address'
	}

	LockSecretCompletedFeeReceipt(){
		self._version = 0
		self._type_ = LockSecretCompletedFeeReceipt.RECEIPT_TYPE
		self._mosaic = Mosaic()
		self._targetAddress = Address()
	}

	None sort(){
		self._mosaic.sort()
	}

	@property
	int version(){
		return self._version
	}

	@property
	ReceiptType type_(){
		return self._type_
	}

	@property
	Mosaic mosaic(){
		return self._mosaic
	}

	@property
	Address targetAddress(){
		return self._targetAddress
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@type_.setter
	type_(value: ReceiptType){
		self._type_ = value
	}

	@mosaic.setter
	mosaic(value: Mosaic){
		self._mosaic = value
	}

	@targetAddress.setter
	targetAddress(value: Address){
		self._targetAddress = value
	}

	int get size(){
		size = 0
		size += 4
		size += 2
		size += self.type_.size
		size += self.mosaic.size
		size += self.targetAddress.size
		return size
	}

	static LockSecretCompletedFeeReceipt deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		version = BigInt.from(buffer.getInt16(0, Endian.little))
		buffer = buffer[2:]
		type_ = ReceiptType.deserialize(buffer)
		buffer = buffer[type_.size:]
		mosaic = Mosaic.deserialize(buffer)
		buffer = buffer[mosaic.size:]
		targetAddress = Address.deserialize(buffer)
		buffer = buffer[targetAddress.size:]

		instance = LockSecretCompletedFeeReceipt()
		instance._version = version
		instance._type_ = type_
		instance._mosaic = mosaic
		instance._targetAddress = targetAddress
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt16(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._type_.serialize()
		buffer += self._mosaic.serialize()
		buffer += self._targetAddress.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'version: 0x{self._version:X}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'mosaic: {self._mosaic.__str__()}, '
		result += f'targetAddress: {self._targetAddress.__str__()}, '
		result += ')'
		return result
	}
}


class LockSecretExpiredFeeReceipt {
	RECEIPT_TYPE: ReceiptType = ReceiptType.LOCK_SECRET_EXPIRED
	TYPE_HINTS = {
		'type_': 'enum:ReceiptType',
		'mosaic': 'struct:Mosaic',
		'targetAddress': 'pod:Address'
	}

	LockSecretExpiredFeeReceipt(){
		self._version = 0
		self._type_ = LockSecretExpiredFeeReceipt.RECEIPT_TYPE
		self._mosaic = Mosaic()
		self._targetAddress = Address()
	}

	None sort(){
		self._mosaic.sort()
	}

	@property
	int version(){
		return self._version
	}

	@property
	ReceiptType type_(){
		return self._type_
	}

	@property
	Mosaic mosaic(){
		return self._mosaic
	}

	@property
	Address targetAddress(){
		return self._targetAddress
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@type_.setter
	type_(value: ReceiptType){
		self._type_ = value
	}

	@mosaic.setter
	mosaic(value: Mosaic){
		self._mosaic = value
	}

	@targetAddress.setter
	targetAddress(value: Address){
		self._targetAddress = value
	}

	int get size(){
		size = 0
		size += 4
		size += 2
		size += self.type_.size
		size += self.mosaic.size
		size += self.targetAddress.size
		return size
	}

	static LockSecretExpiredFeeReceipt deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		version = BigInt.from(buffer.getInt16(0, Endian.little))
		buffer = buffer[2:]
		type_ = ReceiptType.deserialize(buffer)
		buffer = buffer[type_.size:]
		mosaic = Mosaic.deserialize(buffer)
		buffer = buffer[mosaic.size:]
		targetAddress = Address.deserialize(buffer)
		buffer = buffer[targetAddress.size:]

		instance = LockSecretExpiredFeeReceipt()
		instance._version = version
		instance._type_ = type_
		instance._mosaic = mosaic
		instance._targetAddress = targetAddress
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt16(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._type_.serialize()
		buffer += self._mosaic.serialize()
		buffer += self._targetAddress.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'version: 0x{self._version:X}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'mosaic: {self._mosaic.__str__()}, '
		result += f'targetAddress: {self._targetAddress.__str__()}, '
		result += ')'
		return result
	}
}


class MosaicExpiredReceipt {
	RECEIPT_TYPE: ReceiptType = ReceiptType.MOSAIC_EXPIRED
	TYPE_HINTS = {
		'type_': 'enum:ReceiptType',
		'artifactId': 'pod:MosaicId'
	}

	MosaicExpiredReceipt(){
		self._version = 0
		self._type_ = MosaicExpiredReceipt.RECEIPT_TYPE
		self._artifactId = MosaicId()
	}

	None sort(){
		pass
	}

	@property
	int version(){
		return self._version
	}

	@property
	ReceiptType type_(){
		return self._type_
	}

	@property
	MosaicId artifactId(){
		return self._artifactId
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@type_.setter
	type_(value: ReceiptType){
		self._type_ = value
	}

	@artifactId.setter
	artifactId(value: MosaicId){
		self._artifactId = value
	}

	int get size(){
		size = 0
		size += 4
		size += 2
		size += self.type_.size
		size += self.artifactId.size
		return size
	}

	static MosaicExpiredReceipt deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		version = BigInt.from(buffer.getInt16(0, Endian.little))
		buffer = buffer[2:]
		type_ = ReceiptType.deserialize(buffer)
		buffer = buffer[type_.size:]
		artifactId = MosaicId.deserialize(buffer)
		buffer = buffer[artifactId.size:]

		instance = MosaicExpiredReceipt()
		instance._version = version
		instance._type_ = type_
		instance._artifactId = artifactId
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt16(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._type_.serialize()
		buffer += self._artifactId.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'version: 0x{self._version:X}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'artifactId: {self._artifactId.__str__()}, '
		result += ')'
		return result
	}
}


class MosaicRentalFeeReceipt {
	RECEIPT_TYPE: ReceiptType = ReceiptType.MOSAIC_RENTAL_FEE
	TYPE_HINTS = {
		'type_': 'enum:ReceiptType',
		'mosaic': 'struct:Mosaic',
		'senderAddress': 'pod:Address',
		'recipientAddress': 'pod:Address'
	}

	MosaicRentalFeeReceipt(){
		self._version = 0
		self._type_ = MosaicRentalFeeReceipt.RECEIPT_TYPE
		self._mosaic = Mosaic()
		self._senderAddress = Address()
		self._recipientAddress = Address()
	}

	None sort(){
		self._mosaic.sort()
	}

	@property
	int version(){
		return self._version
	}

	@property
	ReceiptType type_(){
		return self._type_
	}

	@property
	Mosaic mosaic(){
		return self._mosaic
	}

	@property
	Address senderAddress(){
		return self._senderAddress
	}

	@property
	Address recipientAddress(){
		return self._recipientAddress
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@type_.setter
	type_(value: ReceiptType){
		self._type_ = value
	}

	@mosaic.setter
	mosaic(value: Mosaic){
		self._mosaic = value
	}

	@senderAddress.setter
	senderAddress(value: Address){
		self._senderAddress = value
	}

	@recipientAddress.setter
	recipientAddress(value: Address){
		self._recipientAddress = value
	}

	int get size(){
		size = 0
		size += 4
		size += 2
		size += self.type_.size
		size += self.mosaic.size
		size += self.senderAddress.size
		size += self.recipientAddress.size
		return size
	}

	static MosaicRentalFeeReceipt deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		version = BigInt.from(buffer.getInt16(0, Endian.little))
		buffer = buffer[2:]
		type_ = ReceiptType.deserialize(buffer)
		buffer = buffer[type_.size:]
		mosaic = Mosaic.deserialize(buffer)
		buffer = buffer[mosaic.size:]
		senderAddress = Address.deserialize(buffer)
		buffer = buffer[senderAddress.size:]
		recipientAddress = Address.deserialize(buffer)
		buffer = buffer[recipientAddress.size:]

		instance = MosaicRentalFeeReceipt()
		instance._version = version
		instance._type_ = type_
		instance._mosaic = mosaic
		instance._senderAddress = senderAddress
		instance._recipientAddress = recipientAddress
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt16(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._type_.serialize()
		buffer += self._mosaic.serialize()
		buffer += self._senderAddress.serialize()
		buffer += self._recipientAddress.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'version: 0x{self._version:X}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'mosaic: {self._mosaic.__str__()}, '
		result += f'senderAddress: {self._senderAddress.__str__()}, '
		result += f'recipientAddress: {self._recipientAddress.__str__()}, '
		result += ')'
		return result
	}
}


class NamespaceId extends BaseValue {
	static const int SIZE = 8;

	NamespaceId(BigInt namespaceId): super(SIZE, namespaceId ?? BigInt.zero);

	static NamespaceId deserialize(Uint8List payload){
		var buffer = ByteData.view(payload.buffer);
		return NamespaceId(BigInt.from(buffer.getInt64(0, Endian.little)));
	}

	Uint8List serialize(){
		var buffer = ByteData(SIZE);
		return (buffer..setInt64(0, value.toInt(), Endian.little)).buffer.asUint8List();;
	}
}


class NamespaceRegistrationType extends (Enum) {
	ROOT = 0
	CHILD = 1

	int get size(){
		return 1
	}

	static NamespaceRegistrationType deserialize(Uint8List payload){
		buffer = memoryview(payload)
		return NamespaceRegistrationType(BigInt.from(buffer.getInt8(0, Endian.little)))
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += (buffer..setInt8(0, self.value.toInt(), Endian.little)).buffer.asUint8List();
		return buffer
	}
}


class AliasAction extends (Enum) {
	UNLINK = 0
	LINK = 1

	int get size(){
		return 1
	}

	static AliasAction deserialize(Uint8List payload){
		buffer = memoryview(payload)
		return AliasAction(BigInt.from(buffer.getInt8(0, Endian.little)))
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += (buffer..setInt8(0, self.value.toInt(), Endian.little)).buffer.asUint8List();
		return buffer
	}
}


class NamespaceExpiredReceipt {
	RECEIPT_TYPE: ReceiptType = ReceiptType.NAMESPACE_EXPIRED
	TYPE_HINTS = {
		'type_': 'enum:ReceiptType',
		'artifactId': 'pod:NamespaceId'
	}

	NamespaceExpiredReceipt(){
		self._version = 0
		self._type_ = NamespaceExpiredReceipt.RECEIPT_TYPE
		self._artifactId = NamespaceId()
	}

	None sort(){
		pass
	}

	@property
	int version(){
		return self._version
	}

	@property
	ReceiptType type_(){
		return self._type_
	}

	@property
	NamespaceId artifactId(){
		return self._artifactId
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@type_.setter
	type_(value: ReceiptType){
		self._type_ = value
	}

	@artifactId.setter
	artifactId(value: NamespaceId){
		self._artifactId = value
	}

	int get size(){
		size = 0
		size += 4
		size += 2
		size += self.type_.size
		size += self.artifactId.size
		return size
	}

	static NamespaceExpiredReceipt deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		version = BigInt.from(buffer.getInt16(0, Endian.little))
		buffer = buffer[2:]
		type_ = ReceiptType.deserialize(buffer)
		buffer = buffer[type_.size:]
		artifactId = NamespaceId.deserialize(buffer)
		buffer = buffer[artifactId.size:]

		instance = NamespaceExpiredReceipt()
		instance._version = version
		instance._type_ = type_
		instance._artifactId = artifactId
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt16(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._type_.serialize()
		buffer += self._artifactId.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'version: 0x{self._version:X}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'artifactId: {self._artifactId.__str__()}, '
		result += ')'
		return result
	}
}


class NamespaceDeletedReceipt {
	RECEIPT_TYPE: ReceiptType = ReceiptType.NAMESPACE_DELETED
	TYPE_HINTS = {
		'type_': 'enum:ReceiptType',
		'artifactId': 'pod:NamespaceId'
	}

	NamespaceDeletedReceipt(){
		self._version = 0
		self._type_ = NamespaceDeletedReceipt.RECEIPT_TYPE
		self._artifactId = NamespaceId()
	}

	None sort(){
		pass
	}

	@property
	int version(){
		return self._version
	}

	@property
	ReceiptType type_(){
		return self._type_
	}

	@property
	NamespaceId artifactId(){
		return self._artifactId
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@type_.setter
	type_(value: ReceiptType){
		self._type_ = value
	}

	@artifactId.setter
	artifactId(value: NamespaceId){
		self._artifactId = value
	}

	int get size(){
		size = 0
		size += 4
		size += 2
		size += self.type_.size
		size += self.artifactId.size
		return size
	}

	static NamespaceDeletedReceipt deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		version = BigInt.from(buffer.getInt16(0, Endian.little))
		buffer = buffer[2:]
		type_ = ReceiptType.deserialize(buffer)
		buffer = buffer[type_.size:]
		artifactId = NamespaceId.deserialize(buffer)
		buffer = buffer[artifactId.size:]

		instance = NamespaceDeletedReceipt()
		instance._version = version
		instance._type_ = type_
		instance._artifactId = artifactId
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt16(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._type_.serialize()
		buffer += self._artifactId.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'version: 0x{self._version:X}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'artifactId: {self._artifactId.__str__()}, '
		result += ')'
		return result
	}
}


class NamespaceRentalFeeReceipt {
	RECEIPT_TYPE: ReceiptType = ReceiptType.NAMESPACE_RENTAL_FEE
	TYPE_HINTS = {
		'type_': 'enum:ReceiptType',
		'mosaic': 'struct:Mosaic',
		'senderAddress': 'pod:Address',
		'recipientAddress': 'pod:Address'
	}

	NamespaceRentalFeeReceipt(){
		self._version = 0
		self._type_ = NamespaceRentalFeeReceipt.RECEIPT_TYPE
		self._mosaic = Mosaic()
		self._senderAddress = Address()
		self._recipientAddress = Address()
	}

	None sort(){
		self._mosaic.sort()
	}

	@property
	int version(){
		return self._version
	}

	@property
	ReceiptType type_(){
		return self._type_
	}

	@property
	Mosaic mosaic(){
		return self._mosaic
	}

	@property
	Address senderAddress(){
		return self._senderAddress
	}

	@property
	Address recipientAddress(){
		return self._recipientAddress
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@type_.setter
	type_(value: ReceiptType){
		self._type_ = value
	}

	@mosaic.setter
	mosaic(value: Mosaic){
		self._mosaic = value
	}

	@senderAddress.setter
	senderAddress(value: Address){
		self._senderAddress = value
	}

	@recipientAddress.setter
	recipientAddress(value: Address){
		self._recipientAddress = value
	}

	int get size(){
		size = 0
		size += 4
		size += 2
		size += self.type_.size
		size += self.mosaic.size
		size += self.senderAddress.size
		size += self.recipientAddress.size
		return size
	}

	static NamespaceRentalFeeReceipt deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		version = BigInt.from(buffer.getInt16(0, Endian.little))
		buffer = buffer[2:]
		type_ = ReceiptType.deserialize(buffer)
		buffer = buffer[type_.size:]
		mosaic = Mosaic.deserialize(buffer)
		buffer = buffer[mosaic.size:]
		senderAddress = Address.deserialize(buffer)
		buffer = buffer[senderAddress.size:]
		recipientAddress = Address.deserialize(buffer)
		buffer = buffer[recipientAddress.size:]

		instance = NamespaceRentalFeeReceipt()
		instance._version = version
		instance._type_ = type_
		instance._mosaic = mosaic
		instance._senderAddress = senderAddress
		instance._recipientAddress = recipientAddress
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt16(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._type_.serialize()
		buffer += self._mosaic.serialize()
		buffer += self._senderAddress.serialize()
		buffer += self._recipientAddress.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'version: 0x{self._version:X}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'mosaic: {self._mosaic.__str__()}, '
		result += f'senderAddress: {self._senderAddress.__str__()}, '
		result += f'recipientAddress: {self._recipientAddress.__str__()}, '
		result += ')'
		return result
	}
}


class ReceiptSource {
	TYPE_HINTS = {
	}

	ReceiptSource(){
		self._primaryId = 0
		self._secondaryId = 0
	}

	None sort(){
		pass
	}

	@property
	int primaryId(){
		return self._primaryId
	}

	@property
	int secondaryId(){
		return self._secondaryId
	}

	@primaryId.setter
	primaryId(value: int){
		self._primaryId = value
	}

	@secondaryId.setter
	secondaryId(value: int){
		self._secondaryId = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		return size
	}

	static ReceiptSource deserialize(Uint8List payload){
		buffer = memoryview(payload)
		primaryId = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		secondaryId = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]

		instance = ReceiptSource()
		instance._primaryId = primaryId
		instance._secondaryId = secondaryId
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += (buffer..setInt32(0, self._primaryId.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt32(0, self._secondaryId.toInt(), Endian.little)).buffer.asUint8List();
		return buffer
	}

	str toString(){
		result = '('
		result += f'primaryId: 0x{self._primaryId:X}, '
		result += f'secondaryId: 0x{self._secondaryId:X}, '
		result += ')'
		return result
	}
}


class AddressResolutionEntry {
	TYPE_HINTS = {
		'source': 'struct:ReceiptSource',
		'resolvedValue': 'pod:Address'
	}

	AddressResolutionEntry(){
		self._source = ReceiptSource()
		self._resolvedValue = Address()
	}

	None sort(){
		self._source.sort()
	}

	@property
	ReceiptSource source(){
		return self._source
	}

	@property
	Address resolvedValue(){
		return self._resolvedValue
	}

	@source.setter
	source(value: ReceiptSource){
		self._source = value
	}

	@resolvedValue.setter
	resolvedValue(value: Address){
		self._resolvedValue = value
	}

	int get size(){
		size = 0
		size += self.source.size
		size += self.resolvedValue.size
		return size
	}

	static AddressResolutionEntry deserialize(Uint8List payload){
		buffer = memoryview(payload)
		source = ReceiptSource.deserialize(buffer)
		buffer = buffer[source.size:]
		resolvedValue = Address.deserialize(buffer)
		buffer = buffer[resolvedValue.size:]

		instance = AddressResolutionEntry()
		instance._source = source
		instance._resolvedValue = resolvedValue
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self._source.serialize()
		buffer += self._resolvedValue.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'source: {self._source.__str__()}, '
		result += f'resolvedValue: {self._resolvedValue.__str__()}, '
		result += ')'
		return result
	}
}


class AddressResolutionStatement {
	TYPE_HINTS = {
		'unresolved': 'pod:UnresolvedAddress',
		'resolutionEntries': 'array[AddressResolutionEntry]'
	}

	AddressResolutionStatement(){
		self._unresolved = UnresolvedAddress()
		self._resolutionEntries = []
	}

	None sort(){
		pass
	}

	@property
	UnresolvedAddress unresolved(){
		return self._unresolved
	}

	@property
	List[AddressResolutionEntry] resolutionEntries(){
		return self._resolutionEntries
	}

	@unresolved.setter
	unresolved(value: UnresolvedAddress){
		self._unresolved = value
	}

	@resolutionEntries.setter
	resolutionEntries(value: List[AddressResolutionEntry]){
		self._resolutionEntries = value
	}

	int get size(){
		size = 0
		size += self.unresolved.size
		size += 4
		size += ArrayHelpers.size(self.resolutionEntries)
		return size
	}

	static AddressResolutionStatement deserialize(Uint8List payload){
		buffer = memoryview(payload)
		unresolved = UnresolvedAddress.deserialize(buffer)
		buffer = buffer[unresolved.size:]
		resolutionEntriesCount = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		resolutionEntries = ArrayHelpers.read_array_count(buffer, AddressResolutionEntry, resolution_entries_count)
		buffer = buffer[ArrayHelpers.size(resolutionEntries):]

		instance = AddressResolutionStatement()
		instance._unresolved = unresolved
		instance._resolutionEntries = resolutionEntries
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self._unresolved.serialize()
		buffer += (buffer..setInt32(0, len(self._resolutionEntries).toInt(), Endian.little)).buffer.asUint8List();  # resolution_entries_count
		buffer += ArrayHelpers.write_array(self._resolutionEntries)
		return buffer
	}

	str toString(){
		result = '('
		result += f'unresolved: {self._unresolved.__str__()}, '
		result += f'resolutionEntries: {list(map(str, self._resolutionEntries))}, '
		result += ')'
		return result
	}
}


class MosaicResolutionEntry {
	TYPE_HINTS = {
		'source': 'struct:ReceiptSource',
		'resolvedValue': 'pod:MosaicId'
	}

	MosaicResolutionEntry(){
		self._source = ReceiptSource()
		self._resolvedValue = MosaicId()
	}

	None sort(){
		self._source.sort()
	}

	@property
	ReceiptSource source(){
		return self._source
	}

	@property
	MosaicId resolvedValue(){
		return self._resolvedValue
	}

	@source.setter
	source(value: ReceiptSource){
		self._source = value
	}

	@resolvedValue.setter
	resolvedValue(value: MosaicId){
		self._resolvedValue = value
	}

	int get size(){
		size = 0
		size += self.source.size
		size += self.resolvedValue.size
		return size
	}

	static MosaicResolutionEntry deserialize(Uint8List payload){
		buffer = memoryview(payload)
		source = ReceiptSource.deserialize(buffer)
		buffer = buffer[source.size:]
		resolvedValue = MosaicId.deserialize(buffer)
		buffer = buffer[resolvedValue.size:]

		instance = MosaicResolutionEntry()
		instance._source = source
		instance._resolvedValue = resolvedValue
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self._source.serialize()
		buffer += self._resolvedValue.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'source: {self._source.__str__()}, '
		result += f'resolvedValue: {self._resolvedValue.__str__()}, '
		result += ')'
		return result
	}
}


class MosaicResolutionStatement {
	TYPE_HINTS = {
		'unresolved': 'pod:UnresolvedMosaicId',
		'resolutionEntries': 'array[MosaicResolutionEntry]'
	}

	MosaicResolutionStatement(){
		self._unresolved = UnresolvedMosaicId()
		self._resolutionEntries = []
	}

	None sort(){
		pass
	}

	@property
	UnresolvedMosaicId unresolved(){
		return self._unresolved
	}

	@property
	List[MosaicResolutionEntry] resolutionEntries(){
		return self._resolutionEntries
	}

	@unresolved.setter
	unresolved(value: UnresolvedMosaicId){
		self._unresolved = value
	}

	@resolutionEntries.setter
	resolutionEntries(value: List[MosaicResolutionEntry]){
		self._resolutionEntries = value
	}

	int get size(){
		size = 0
		size += self.unresolved.size
		size += 4
		size += ArrayHelpers.size(self.resolutionEntries)
		return size
	}

	static MosaicResolutionStatement deserialize(Uint8List payload){
		buffer = memoryview(payload)
		unresolved = UnresolvedMosaicId.deserialize(buffer)
		buffer = buffer[unresolved.size:]
		resolutionEntriesCount = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		resolutionEntries = ArrayHelpers.read_array_count(buffer, MosaicResolutionEntry, resolution_entries_count)
		buffer = buffer[ArrayHelpers.size(resolutionEntries):]

		instance = MosaicResolutionStatement()
		instance._unresolved = unresolved
		instance._resolutionEntries = resolutionEntries
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self._unresolved.serialize()
		buffer += (buffer..setInt32(0, len(self._resolutionEntries).toInt(), Endian.little)).buffer.asUint8List();  # resolution_entries_count
		buffer += ArrayHelpers.write_array(self._resolutionEntries)
		return buffer
	}

	str toString(){
		result = '('
		result += f'unresolved: {self._unresolved.__str__()}, '
		result += f'resolutionEntries: {list(map(str, self._resolutionEntries))}, '
		result += ')'
		return result
	}
}


class TransactionStatement {
	TYPE_HINTS = {
		'receipts': 'array[Receipt]'
	}

	TransactionStatement(){
		self._primaryId = 0
		self._secondaryId = 0
		self._receipts = []
	}

	None sort(){
		pass
	}

	@property
	int primaryId(){
		return self._primaryId
	}

	@property
	int secondaryId(){
		return self._secondaryId
	}

	@property
	List[Receipt] receipts(){
		return self._receipts
	}

	@primaryId.setter
	primaryId(value: int){
		self._primaryId = value
	}

	@secondaryId.setter
	secondaryId(value: int){
		self._secondaryId = value
	}

	@receipts.setter
	receipts(value: List[Receipt]){
		self._receipts = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += 4
		size += ArrayHelpers.size(self.receipts)
		return size
	}

	static TransactionStatement deserialize(Uint8List payload){
		buffer = memoryview(payload)
		primaryId = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		secondaryId = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		receiptCount = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		receipts = ArrayHelpers.read_array_count(buffer, ReceiptFactory, receipt_count)
		buffer = buffer[ArrayHelpers.size(receipts):]

		instance = TransactionStatement()
		instance._primaryId = primaryId
		instance._secondaryId = secondaryId
		instance._receipts = receipts
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += (buffer..setInt32(0, self._primaryId.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt32(0, self._secondaryId.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt32(0, len(self._receipts).toInt(), Endian.little)).buffer.asUint8List();  # receipt_count
		buffer += ArrayHelpers.write_array(self._receipts)
		return buffer
	}

	str toString(){
		result = '('
		result += f'primaryId: 0x{self._primaryId:X}, '
		result += f'secondaryId: 0x{self._secondaryId:X}, '
		result += f'receipts: {list(map(str, self._receipts))}, '
		result += ')'
		return result
	}
}


class BlockStatement {
	TYPE_HINTS = {
		'transactionStatements': 'array[TransactionStatement]',
		'addressResolutionStatements': 'array[AddressResolutionStatement]',
		'mosaicResolutionStatements': 'array[MosaicResolutionStatement]'
	}

	BlockStatement(){
		self._transactionStatements = []
		self._addressResolutionStatements = []
		self._mosaicResolutionStatements = []
	}

	None sort(){
		pass
	}

	@property
	List[TransactionStatement] transactionStatements(){
		return self._transactionStatements
	}

	@property
	List[AddressResolutionStatement] addressResolutionStatements(){
		return self._addressResolutionStatements
	}

	@property
	List[MosaicResolutionStatement] mosaicResolutionStatements(){
		return self._mosaicResolutionStatements
	}

	@transactionStatements.setter
	transactionStatements(value: List[TransactionStatement]){
		self._transactionStatements = value
	}

	@addressResolutionStatements.setter
	addressResolutionStatements(value: List[AddressResolutionStatement]){
		self._addressResolutionStatements = value
	}

	@mosaicResolutionStatements.setter
	mosaicResolutionStatements(value: List[MosaicResolutionStatement]){
		self._mosaicResolutionStatements = value
	}

	int get size(){
		size = 0
		size += 4
		size += ArrayHelpers.size(self.transactionStatements)
		size += 4
		size += ArrayHelpers.size(self.addressResolutionStatements)
		size += 4
		size += ArrayHelpers.size(self.mosaicResolutionStatements)
		return size
	}

	static BlockStatement deserialize(Uint8List payload){
		buffer = memoryview(payload)
		transactionStatementCount = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		transactionStatements = ArrayHelpers.read_array_count(buffer, TransactionStatement, transaction_statement_count)
		buffer = buffer[ArrayHelpers.size(transactionStatements):]
		addressResolutionStatementCount = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		addressResolutionStatements = ArrayHelpers.read_array_count(buffer, AddressResolutionStatement, address_resolution_statement_count)
		buffer = buffer[ArrayHelpers.size(addressResolutionStatements):]
		mosaicResolutionStatementCount = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		mosaicResolutionStatements = ArrayHelpers.read_array_count(buffer, MosaicResolutionStatement, mosaic_resolution_statement_count)
		buffer = buffer[ArrayHelpers.size(mosaicResolutionStatements):]

		instance = BlockStatement()
		instance._transactionStatements = transactionStatements
		instance._addressResolutionStatements = addressResolutionStatements
		instance._mosaicResolutionStatements = mosaicResolutionStatements
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += (buffer..setInt32(0, len(self._transactionStatements).toInt(), Endian.little)).buffer.asUint8List();  # transaction_statement_count
		buffer += ArrayHelpers.write_array(self._transactionStatements)
		buffer += (buffer..setInt32(0, len(self._addressResolutionStatements).toInt(), Endian.little)).buffer.asUint8List();  # address_resolution_statement_count
		buffer += ArrayHelpers.write_array(self._addressResolutionStatements)
		buffer += (buffer..setInt32(0, len(self._mosaicResolutionStatements).toInt(), Endian.little)).buffer.asUint8List();  # mosaic_resolution_statement_count
		buffer += ArrayHelpers.write_array(self._mosaicResolutionStatements)
		return buffer
	}

	str toString(){
		result = '('
		result += f'transactionStatements: {list(map(str, self._transactionStatements))}, '
		result += f'addressResolutionStatements: {list(map(str, self._addressResolutionStatements))}, '
		result += f'mosaicResolutionStatements: {list(map(str, self._mosaicResolutionStatements))}, '
		result += ')'
		return result
	}
}


class AccountKeyLinkTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.ACCOUNT_KEY_LINK
	TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'linkedPublicKey': 'pod:PublicKey',
		'linkAction': 'enum:LinkAction'
	}

	AccountKeyLinkTransactionV1(){
		self._signature = Signature()
		self._signerPublicKey = PublicKey()
		self._version = AccountKeyLinkTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = AccountKeyLinkTransactionV1.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._linkedPublicKey = PublicKey()
		self._linkAction = LinkAction.UNLINK
		self._verifiableEntityHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
	}

	None sort(){
		pass
	}

	@property
	Signature signature(){
		return self._signature
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	TransactionType type_(){
		return self._type_
	}

	@property
	Amount fee(){
		return self._fee
	}

	@property
	Timestamp deadline(){
		return self._deadline
	}

	@property
	PublicKey linkedPublicKey(){
		return self._linkedPublicKey
	}

	@property
	LinkAction linkAction(){
		return self._linkAction
	}

	@signature.setter
	signature(value: Signature){
		self._signature = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@fee.setter
	fee(value: Amount){
		self._fee = value
	}

	@deadline.setter
	deadline(value: Timestamp){
		self._deadline = value
	}

	@linkedPublicKey.setter
	linkedPublicKey(value: PublicKey){
		self._linkedPublicKey = value
	}

	@linkAction.setter
	linkAction(value: LinkAction){
		self._linkAction = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		size += self.linkedPublicKey.size
		size += self.linkAction.size
		return size
	}

	static AccountKeyLinkTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiableEntityHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert verifiableEntityHeaderReserved_1 == 0, f'Invalid value of reserved field ({verifiableEntityHeaderReserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		linkedPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[linkedPublicKey.size:]
		linkAction = LinkAction.deserialize(buffer)
		buffer = buffer[linkAction.size:]

		instance = AccountKeyLinkTransactionV1()
		instance._signature = signature
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		instance._linkedPublicKey = linkedPublicKey
		instance._linkAction = linkAction
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._verifiableEntityHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signature.serialize()
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._linkedPublicKey.serialize()
		buffer += self._linkAction.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'linkedPublicKey: {self._linkedPublicKey.__str__()}, '
		result += f'linkAction: {self._linkAction.__str__()}, '
		result += ')'
		return result
	}
}


class EmbeddedAccountKeyLinkTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.ACCOUNT_KEY_LINK
	TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'linkedPublicKey': 'pod:PublicKey',
		'linkAction': 'enum:LinkAction'
	}

	EmbeddedAccountKeyLinkTransactionV1(){
		self._signerPublicKey = PublicKey()
		self._version = EmbeddedAccountKeyLinkTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = EmbeddedAccountKeyLinkTransactionV1.TRANSACTION_TYPE
		self._linkedPublicKey = PublicKey()
		self._linkAction = LinkAction.UNLINK
		self._embeddedTransactionHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
	}

	None sort(){
		pass
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	TransactionType type_(){
		return self._type_
	}

	@property
	PublicKey linkedPublicKey(){
		return self._linkedPublicKey
	}

	@property
	LinkAction linkAction(){
		return self._linkAction
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@linkedPublicKey.setter
	linkedPublicKey(value: PublicKey){
		self._linkedPublicKey = value
	}

	@linkAction.setter
	linkAction(value: LinkAction){
		self._linkAction = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.linkedPublicKey.size
		size += self.linkAction.size
		return size
	}

	static EmbeddedAccountKeyLinkTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		embeddedTransactionHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert embeddedTransactionHeaderReserved_1 == 0, f'Invalid value of reserved field ({embeddedTransactionHeaderReserved_1})'
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		linkedPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[linkedPublicKey.size:]
		linkAction = LinkAction.deserialize(buffer)
		buffer = buffer[linkAction.size:]

		instance = EmbeddedAccountKeyLinkTransactionV1()
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._linkedPublicKey = linkedPublicKey
		instance._linkAction = linkAction
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._embeddedTransactionHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._linkedPublicKey.serialize()
		buffer += self._linkAction.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'linkedPublicKey: {self._linkedPublicKey.__str__()}, '
		result += f'linkAction: {self._linkAction.__str__()}, '
		result += ')'
		return result
	}
}


class NodeKeyLinkTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.NODE_KEY_LINK
	TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'linkedPublicKey': 'pod:PublicKey',
		'linkAction': 'enum:LinkAction'
	}

	NodeKeyLinkTransactionV1(){
		self._signature = Signature()
		self._signerPublicKey = PublicKey()
		self._version = NodeKeyLinkTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = NodeKeyLinkTransactionV1.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._linkedPublicKey = PublicKey()
		self._linkAction = LinkAction.UNLINK
		self._verifiableEntityHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
	}

	None sort(){
		pass
	}

	@property
	Signature signature(){
		return self._signature
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	TransactionType type_(){
		return self._type_
	}

	@property
	Amount fee(){
		return self._fee
	}

	@property
	Timestamp deadline(){
		return self._deadline
	}

	@property
	PublicKey linkedPublicKey(){
		return self._linkedPublicKey
	}

	@property
	LinkAction linkAction(){
		return self._linkAction
	}

	@signature.setter
	signature(value: Signature){
		self._signature = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@fee.setter
	fee(value: Amount){
		self._fee = value
	}

	@deadline.setter
	deadline(value: Timestamp){
		self._deadline = value
	}

	@linkedPublicKey.setter
	linkedPublicKey(value: PublicKey){
		self._linkedPublicKey = value
	}

	@linkAction.setter
	linkAction(value: LinkAction){
		self._linkAction = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		size += self.linkedPublicKey.size
		size += self.linkAction.size
		return size
	}

	static NodeKeyLinkTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiableEntityHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert verifiableEntityHeaderReserved_1 == 0, f'Invalid value of reserved field ({verifiableEntityHeaderReserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		linkedPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[linkedPublicKey.size:]
		linkAction = LinkAction.deserialize(buffer)
		buffer = buffer[linkAction.size:]

		instance = NodeKeyLinkTransactionV1()
		instance._signature = signature
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		instance._linkedPublicKey = linkedPublicKey
		instance._linkAction = linkAction
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._verifiableEntityHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signature.serialize()
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._linkedPublicKey.serialize()
		buffer += self._linkAction.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'linkedPublicKey: {self._linkedPublicKey.__str__()}, '
		result += f'linkAction: {self._linkAction.__str__()}, '
		result += ')'
		return result
	}
}


class EmbeddedNodeKeyLinkTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.NODE_KEY_LINK
	TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'linkedPublicKey': 'pod:PublicKey',
		'linkAction': 'enum:LinkAction'
	}

	EmbeddedNodeKeyLinkTransactionV1(){
		self._signerPublicKey = PublicKey()
		self._version = EmbeddedNodeKeyLinkTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = EmbeddedNodeKeyLinkTransactionV1.TRANSACTION_TYPE
		self._linkedPublicKey = PublicKey()
		self._linkAction = LinkAction.UNLINK
		self._embeddedTransactionHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
	}

	None sort(){
		pass
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	TransactionType type_(){
		return self._type_
	}

	@property
	PublicKey linkedPublicKey(){
		return self._linkedPublicKey
	}

	@property
	LinkAction linkAction(){
		return self._linkAction
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@linkedPublicKey.setter
	linkedPublicKey(value: PublicKey){
		self._linkedPublicKey = value
	}

	@linkAction.setter
	linkAction(value: LinkAction){
		self._linkAction = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.linkedPublicKey.size
		size += self.linkAction.size
		return size
	}

	static EmbeddedNodeKeyLinkTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		embeddedTransactionHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert embeddedTransactionHeaderReserved_1 == 0, f'Invalid value of reserved field ({embeddedTransactionHeaderReserved_1})'
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		linkedPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[linkedPublicKey.size:]
		linkAction = LinkAction.deserialize(buffer)
		buffer = buffer[linkAction.size:]

		instance = EmbeddedNodeKeyLinkTransactionV1()
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._linkedPublicKey = linkedPublicKey
		instance._linkAction = linkAction
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._embeddedTransactionHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._linkedPublicKey.serialize()
		buffer += self._linkAction.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'linkedPublicKey: {self._linkedPublicKey.__str__()}, '
		result += f'linkAction: {self._linkAction.__str__()}, '
		result += ')'
		return result
	}
}


class Cosignature {
	TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'signature': 'pod:Signature'
	}

	Cosignature(){
		self._version = BigInt.zero
		self._signerPublicKey = PublicKey()
		self._signature = Signature()
	}

	None sort(){
		pass
	}

	@property
	BigInt version(){
		return self._version
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	Signature signature(){
		return self._signature
	}

	@version.setter
	version(value: BigInt){
		self._version = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@signature.setter
	signature(value: Signature){
		self._signature = value
	}

	int get size(){
		size = 0
		size += 8
		size += self.signerPublicKey.size
		size += self.signature.size
		return size
	}

	static Cosignature deserialize(Uint8List payload){
		buffer = memoryview(payload)
		version = BigInt.from(buffer.getInt64(0, Endian.little))
		buffer = buffer[8:]
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]

		instance = Cosignature()
		instance._version = version
		instance._signerPublicKey = signerPublicKey
		instance._signature = signature
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += (buffer..setInt64(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signerPublicKey.serialize()
		buffer += self._signature.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'version: 0x{self._version:X}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'signature: {self._signature.__str__()}, '
		result += ')'
		return result
	}
}


class DetachedCosignature {
	TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'signature': 'pod:Signature',
		'parentHash': 'pod:Hash256'
	}

	DetachedCosignature(){
		self._version = BigInt.zero
		self._signerPublicKey = PublicKey()
		self._signature = Signature()
		self._parentHash = Hash256()
	}

	None sort(){
		pass
	}

	@property
	BigInt version(){
		return self._version
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	Signature signature(){
		return self._signature
	}

	@property
	Hash256 parentHash(){
		return self._parentHash
	}

	@version.setter
	version(value: BigInt){
		self._version = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@signature.setter
	signature(value: Signature){
		self._signature = value
	}

	@parentHash.setter
	parentHash(value: Hash256){
		self._parentHash = value
	}

	int get size(){
		size = 0
		size += 8
		size += self.signerPublicKey.size
		size += self.signature.size
		size += self.parentHash.size
		return size
	}

	static DetachedCosignature deserialize(Uint8List payload){
		buffer = memoryview(payload)
		version = BigInt.from(buffer.getInt64(0, Endian.little))
		buffer = buffer[8:]
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		parentHash = Hash256.deserialize(buffer)
		buffer = buffer[parentHash.size:]

		instance = DetachedCosignature()
		instance._version = version
		instance._signerPublicKey = signerPublicKey
		instance._signature = signature
		instance._parentHash = parentHash
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += (buffer..setInt64(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signerPublicKey.serialize()
		buffer += self._signature.serialize()
		buffer += self._parentHash.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'version: 0x{self._version:X}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'signature: {self._signature.__str__()}, '
		result += f'parentHash: {self._parentHash.__str__()}, '
		result += ')'
		return result
	}
}


class AggregateCompleteTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.AGGREGATE_COMPLETE
	TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'transactionsHash': 'pod:Hash256',
		'transactions': 'array[EmbeddedTransaction]',
		'cosignatures': 'array[Cosignature]'
	}

	AggregateCompleteTransactionV1(){
		self._signature = Signature()
		self._signerPublicKey = PublicKey()
		self._version = AggregateCompleteTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = AggregateCompleteTransactionV1.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._transactionsHash = Hash256()
		self._transactions = []
		self._cosignatures = []
		self._verifiableEntityHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
		self._aggregateTransactionHeaderReserved_1 = 0  # reserved field
	}

	None sort(){
		pass
	}

	@property
	Signature signature(){
		return self._signature
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	TransactionType type_(){
		return self._type_
	}

	@property
	Amount fee(){
		return self._fee
	}

	@property
	Timestamp deadline(){
		return self._deadline
	}

	@property
	Hash256 transactionsHash(){
		return self._transactionsHash
	}

	@property
	List[EmbeddedTransaction] transactions(){
		return self._transactions
	}

	@property
	List[Cosignature] cosignatures(){
		return self._cosignatures
	}

	@signature.setter
	signature(value: Signature){
		self._signature = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@fee.setter
	fee(value: Amount){
		self._fee = value
	}

	@deadline.setter
	deadline(value: Timestamp){
		self._deadline = value
	}

	@transactionsHash.setter
	transactionsHash(value: Hash256){
		self._transactionsHash = value
	}

	@transactions.setter
	transactions(value: List[EmbeddedTransaction]){
		self._transactions = value
	}

	@cosignatures.setter
	cosignatures(value: List[Cosignature]){
		self._cosignatures = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		size += self.transactionsHash.size
		size += 4
		size += 4
		size += ArrayHelpers.size(self.transactions, 8, skip_last_element_padding=False)
		size += ArrayHelpers.size(self.cosignatures)
		return size
	}

	static AggregateCompleteTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiableEntityHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert verifiableEntityHeaderReserved_1 == 0, f'Invalid value of reserved field ({verifiableEntityHeaderReserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		transactionsHash = Hash256.deserialize(buffer)
		buffer = buffer[transactionsHash.size:]
		payloadSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		aggregateTransactionHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert aggregateTransactionHeaderReserved_1 == 0, f'Invalid value of reserved field ({aggregateTransactionHeaderReserved_1})'
		transactions = ArrayHelpers.read_variable_size_elements(buffer[:payload_size], EmbeddedTransactionFactory, 8, skip_last_element_padding=False)
		buffer = buffer[payload_size:]
		cosignatures = ArrayHelpers.read_array(buffer, Cosignature)
		buffer = buffer[ArrayHelpers.size(cosignatures):]

		instance = AggregateCompleteTransactionV1()
		instance._signature = signature
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		instance._transactionsHash = transactionsHash
		instance._transactions = transactions
		instance._cosignatures = cosignatures
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._verifiableEntityHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signature.serialize()
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._transactionsHash.serialize()
		buffer += (buffer..setInt32(0, ArrayHelpers.size(self.transactions, 8, skip_last_element_padding=False).toInt(), Endian.little)).buffer.asUint8List();  # payload_size
		buffer += (buffer..setInt32(0, self._aggregateTransactionHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += ArrayHelpers.write_variable_size_elements(self._transactions, 8, skip_last_element_padding=False)
		buffer += ArrayHelpers.write_array(self._cosignatures)
		return buffer
	}

	str toString(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'transactionsHash: {self._transactionsHash.__str__()}, '
		result += f'transactions: {list(map(str, self._transactions))}, '
		result += f'cosignatures: {list(map(str, self._cosignatures))}, '
		result += ')'
		return result
	}
}


class AggregateCompleteTransactionV2 {
	TRANSACTION_VERSION: int = 2
	TRANSACTION_TYPE: TransactionType = TransactionType.AGGREGATE_COMPLETE
	TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'transactionsHash': 'pod:Hash256',
		'transactions': 'array[EmbeddedTransaction]',
		'cosignatures': 'array[Cosignature]'
	}

	AggregateCompleteTransactionV2(){
		self._signature = Signature()
		self._signerPublicKey = PublicKey()
		self._version = AggregateCompleteTransactionV2.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = AggregateCompleteTransactionV2.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._transactionsHash = Hash256()
		self._transactions = []
		self._cosignatures = []
		self._verifiableEntityHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
		self._aggregateTransactionHeaderReserved_1 = 0  # reserved field
	}

	None sort(){
		pass
	}

	@property
	Signature signature(){
		return self._signature
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	TransactionType type_(){
		return self._type_
	}

	@property
	Amount fee(){
		return self._fee
	}

	@property
	Timestamp deadline(){
		return self._deadline
	}

	@property
	Hash256 transactionsHash(){
		return self._transactionsHash
	}

	@property
	List[EmbeddedTransaction] transactions(){
		return self._transactions
	}

	@property
	List[Cosignature] cosignatures(){
		return self._cosignatures
	}

	@signature.setter
	signature(value: Signature){
		self._signature = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@fee.setter
	fee(value: Amount){
		self._fee = value
	}

	@deadline.setter
	deadline(value: Timestamp){
		self._deadline = value
	}

	@transactionsHash.setter
	transactionsHash(value: Hash256){
		self._transactionsHash = value
	}

	@transactions.setter
	transactions(value: List[EmbeddedTransaction]){
		self._transactions = value
	}

	@cosignatures.setter
	cosignatures(value: List[Cosignature]){
		self._cosignatures = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		size += self.transactionsHash.size
		size += 4
		size += 4
		size += ArrayHelpers.size(self.transactions, 8, skip_last_element_padding=False)
		size += ArrayHelpers.size(self.cosignatures)
		return size
	}

	static AggregateCompleteTransactionV2 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiableEntityHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert verifiableEntityHeaderReserved_1 == 0, f'Invalid value of reserved field ({verifiableEntityHeaderReserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		transactionsHash = Hash256.deserialize(buffer)
		buffer = buffer[transactionsHash.size:]
		payloadSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		aggregateTransactionHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert aggregateTransactionHeaderReserved_1 == 0, f'Invalid value of reserved field ({aggregateTransactionHeaderReserved_1})'
		transactions = ArrayHelpers.read_variable_size_elements(buffer[:payload_size], EmbeddedTransactionFactory, 8, skip_last_element_padding=False)
		buffer = buffer[payload_size:]
		cosignatures = ArrayHelpers.read_array(buffer, Cosignature)
		buffer = buffer[ArrayHelpers.size(cosignatures):]

		instance = AggregateCompleteTransactionV2()
		instance._signature = signature
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		instance._transactionsHash = transactionsHash
		instance._transactions = transactions
		instance._cosignatures = cosignatures
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._verifiableEntityHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signature.serialize()
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._transactionsHash.serialize()
		buffer += (buffer..setInt32(0, ArrayHelpers.size(self.transactions, 8, skip_last_element_padding=False).toInt(), Endian.little)).buffer.asUint8List();  # payload_size
		buffer += (buffer..setInt32(0, self._aggregateTransactionHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += ArrayHelpers.write_variable_size_elements(self._transactions, 8, skip_last_element_padding=False)
		buffer += ArrayHelpers.write_array(self._cosignatures)
		return buffer
	}

	str toString(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'transactionsHash: {self._transactionsHash.__str__()}, '
		result += f'transactions: {list(map(str, self._transactions))}, '
		result += f'cosignatures: {list(map(str, self._cosignatures))}, '
		result += ')'
		return result
	}
}


class AggregateBondedTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.AGGREGATE_BONDED
	TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'transactionsHash': 'pod:Hash256',
		'transactions': 'array[EmbeddedTransaction]',
		'cosignatures': 'array[Cosignature]'
	}

	AggregateBondedTransactionV1(){
		self._signature = Signature()
		self._signerPublicKey = PublicKey()
		self._version = AggregateBondedTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = AggregateBondedTransactionV1.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._transactionsHash = Hash256()
		self._transactions = []
		self._cosignatures = []
		self._verifiableEntityHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
		self._aggregateTransactionHeaderReserved_1 = 0  # reserved field
	}

	None sort(){
		pass
	}

	@property
	Signature signature(){
		return self._signature
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	TransactionType type_(){
		return self._type_
	}

	@property
	Amount fee(){
		return self._fee
	}

	@property
	Timestamp deadline(){
		return self._deadline
	}

	@property
	Hash256 transactionsHash(){
		return self._transactionsHash
	}

	@property
	List[EmbeddedTransaction] transactions(){
		return self._transactions
	}

	@property
	List[Cosignature] cosignatures(){
		return self._cosignatures
	}

	@signature.setter
	signature(value: Signature){
		self._signature = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@fee.setter
	fee(value: Amount){
		self._fee = value
	}

	@deadline.setter
	deadline(value: Timestamp){
		self._deadline = value
	}

	@transactionsHash.setter
	transactionsHash(value: Hash256){
		self._transactionsHash = value
	}

	@transactions.setter
	transactions(value: List[EmbeddedTransaction]){
		self._transactions = value
	}

	@cosignatures.setter
	cosignatures(value: List[Cosignature]){
		self._cosignatures = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		size += self.transactionsHash.size
		size += 4
		size += 4
		size += ArrayHelpers.size(self.transactions, 8, skip_last_element_padding=False)
		size += ArrayHelpers.size(self.cosignatures)
		return size
	}

	static AggregateBondedTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiableEntityHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert verifiableEntityHeaderReserved_1 == 0, f'Invalid value of reserved field ({verifiableEntityHeaderReserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		transactionsHash = Hash256.deserialize(buffer)
		buffer = buffer[transactionsHash.size:]
		payloadSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		aggregateTransactionHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert aggregateTransactionHeaderReserved_1 == 0, f'Invalid value of reserved field ({aggregateTransactionHeaderReserved_1})'
		transactions = ArrayHelpers.read_variable_size_elements(buffer[:payload_size], EmbeddedTransactionFactory, 8, skip_last_element_padding=False)
		buffer = buffer[payload_size:]
		cosignatures = ArrayHelpers.read_array(buffer, Cosignature)
		buffer = buffer[ArrayHelpers.size(cosignatures):]

		instance = AggregateBondedTransactionV1()
		instance._signature = signature
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		instance._transactionsHash = transactionsHash
		instance._transactions = transactions
		instance._cosignatures = cosignatures
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._verifiableEntityHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signature.serialize()
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._transactionsHash.serialize()
		buffer += (buffer..setInt32(0, ArrayHelpers.size(self.transactions, 8, skip_last_element_padding=False).toInt(), Endian.little)).buffer.asUint8List();  # payload_size
		buffer += (buffer..setInt32(0, self._aggregateTransactionHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += ArrayHelpers.write_variable_size_elements(self._transactions, 8, skip_last_element_padding=False)
		buffer += ArrayHelpers.write_array(self._cosignatures)
		return buffer
	}

	str toString(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'transactionsHash: {self._transactionsHash.__str__()}, '
		result += f'transactions: {list(map(str, self._transactions))}, '
		result += f'cosignatures: {list(map(str, self._cosignatures))}, '
		result += ')'
		return result
	}
}


class AggregateBondedTransactionV2 {
	TRANSACTION_VERSION: int = 2
	TRANSACTION_TYPE: TransactionType = TransactionType.AGGREGATE_BONDED
	TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'transactionsHash': 'pod:Hash256',
		'transactions': 'array[EmbeddedTransaction]',
		'cosignatures': 'array[Cosignature]'
	}

	AggregateBondedTransactionV2(){
		self._signature = Signature()
		self._signerPublicKey = PublicKey()
		self._version = AggregateBondedTransactionV2.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = AggregateBondedTransactionV2.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._transactionsHash = Hash256()
		self._transactions = []
		self._cosignatures = []
		self._verifiableEntityHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
		self._aggregateTransactionHeaderReserved_1 = 0  # reserved field
	}

	None sort(){
		pass
	}

	@property
	Signature signature(){
		return self._signature
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	TransactionType type_(){
		return self._type_
	}

	@property
	Amount fee(){
		return self._fee
	}

	@property
	Timestamp deadline(){
		return self._deadline
	}

	@property
	Hash256 transactionsHash(){
		return self._transactionsHash
	}

	@property
	List[EmbeddedTransaction] transactions(){
		return self._transactions
	}

	@property
	List[Cosignature] cosignatures(){
		return self._cosignatures
	}

	@signature.setter
	signature(value: Signature){
		self._signature = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@fee.setter
	fee(value: Amount){
		self._fee = value
	}

	@deadline.setter
	deadline(value: Timestamp){
		self._deadline = value
	}

	@transactionsHash.setter
	transactionsHash(value: Hash256){
		self._transactionsHash = value
	}

	@transactions.setter
	transactions(value: List[EmbeddedTransaction]){
		self._transactions = value
	}

	@cosignatures.setter
	cosignatures(value: List[Cosignature]){
		self._cosignatures = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		size += self.transactionsHash.size
		size += 4
		size += 4
		size += ArrayHelpers.size(self.transactions, 8, skip_last_element_padding=False)
		size += ArrayHelpers.size(self.cosignatures)
		return size
	}

	static AggregateBondedTransactionV2 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiableEntityHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert verifiableEntityHeaderReserved_1 == 0, f'Invalid value of reserved field ({verifiableEntityHeaderReserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		transactionsHash = Hash256.deserialize(buffer)
		buffer = buffer[transactionsHash.size:]
		payloadSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		aggregateTransactionHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert aggregateTransactionHeaderReserved_1 == 0, f'Invalid value of reserved field ({aggregateTransactionHeaderReserved_1})'
		transactions = ArrayHelpers.read_variable_size_elements(buffer[:payload_size], EmbeddedTransactionFactory, 8, skip_last_element_padding=False)
		buffer = buffer[payload_size:]
		cosignatures = ArrayHelpers.read_array(buffer, Cosignature)
		buffer = buffer[ArrayHelpers.size(cosignatures):]

		instance = AggregateBondedTransactionV2()
		instance._signature = signature
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		instance._transactionsHash = transactionsHash
		instance._transactions = transactions
		instance._cosignatures = cosignatures
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._verifiableEntityHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signature.serialize()
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._transactionsHash.serialize()
		buffer += (buffer..setInt32(0, ArrayHelpers.size(self.transactions, 8, skip_last_element_padding=False).toInt(), Endian.little)).buffer.asUint8List();  # payload_size
		buffer += (buffer..setInt32(0, self._aggregateTransactionHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += ArrayHelpers.write_variable_size_elements(self._transactions, 8, skip_last_element_padding=False)
		buffer += ArrayHelpers.write_array(self._cosignatures)
		return buffer
	}

	str toString(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'transactionsHash: {self._transactionsHash.__str__()}, '
		result += f'transactions: {list(map(str, self._transactions))}, '
		result += f'cosignatures: {list(map(str, self._cosignatures))}, '
		result += ')'
		return result
	}
}


class VotingKeyLinkTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.VOTING_KEY_LINK
	TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'linkedPublicKey': 'pod:VotingPublicKey',
		'startEpoch': 'pod:FinalizationEpoch',
		'endEpoch': 'pod:FinalizationEpoch',
		'linkAction': 'enum:LinkAction'
	}

	VotingKeyLinkTransactionV1(){
		self._signature = Signature()
		self._signerPublicKey = PublicKey()
		self._version = VotingKeyLinkTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = VotingKeyLinkTransactionV1.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._linkedPublicKey = VotingPublicKey()
		self._startEpoch = FinalizationEpoch()
		self._endEpoch = FinalizationEpoch()
		self._linkAction = LinkAction.UNLINK
		self._verifiableEntityHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
	}

	None sort(){
		pass
	}

	@property
	Signature signature(){
		return self._signature
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	TransactionType type_(){
		return self._type_
	}

	@property
	Amount fee(){
		return self._fee
	}

	@property
	Timestamp deadline(){
		return self._deadline
	}

	@property
	VotingPublicKey linkedPublicKey(){
		return self._linkedPublicKey
	}

	@property
	FinalizationEpoch startEpoch(){
		return self._startEpoch
	}

	@property
	FinalizationEpoch endEpoch(){
		return self._endEpoch
	}

	@property
	LinkAction linkAction(){
		return self._linkAction
	}

	@signature.setter
	signature(value: Signature){
		self._signature = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@fee.setter
	fee(value: Amount){
		self._fee = value
	}

	@deadline.setter
	deadline(value: Timestamp){
		self._deadline = value
	}

	@linkedPublicKey.setter
	linkedPublicKey(value: VotingPublicKey){
		self._linkedPublicKey = value
	}

	@startEpoch.setter
	startEpoch(value: FinalizationEpoch){
		self._startEpoch = value
	}

	@endEpoch.setter
	endEpoch(value: FinalizationEpoch){
		self._endEpoch = value
	}

	@linkAction.setter
	linkAction(value: LinkAction){
		self._linkAction = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		size += self.linkedPublicKey.size
		size += self.startEpoch.size
		size += self.endEpoch.size
		size += self.linkAction.size
		return size
	}

	static VotingKeyLinkTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiableEntityHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert verifiableEntityHeaderReserved_1 == 0, f'Invalid value of reserved field ({verifiableEntityHeaderReserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		linkedPublicKey = VotingPublicKey.deserialize(buffer)
		buffer = buffer[linkedPublicKey.size:]
		startEpoch = FinalizationEpoch.deserialize(buffer)
		buffer = buffer[startEpoch.size:]
		endEpoch = FinalizationEpoch.deserialize(buffer)
		buffer = buffer[endEpoch.size:]
		linkAction = LinkAction.deserialize(buffer)
		buffer = buffer[linkAction.size:]

		instance = VotingKeyLinkTransactionV1()
		instance._signature = signature
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		instance._linkedPublicKey = linkedPublicKey
		instance._startEpoch = startEpoch
		instance._endEpoch = endEpoch
		instance._linkAction = linkAction
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._verifiableEntityHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signature.serialize()
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._linkedPublicKey.serialize()
		buffer += self._startEpoch.serialize()
		buffer += self._endEpoch.serialize()
		buffer += self._linkAction.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'linkedPublicKey: {self._linkedPublicKey.__str__()}, '
		result += f'startEpoch: {self._startEpoch.__str__()}, '
		result += f'endEpoch: {self._endEpoch.__str__()}, '
		result += f'linkAction: {self._linkAction.__str__()}, '
		result += ')'
		return result
	}
}


class EmbeddedVotingKeyLinkTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.VOTING_KEY_LINK
	TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'linkedPublicKey': 'pod:VotingPublicKey',
		'startEpoch': 'pod:FinalizationEpoch',
		'endEpoch': 'pod:FinalizationEpoch',
		'linkAction': 'enum:LinkAction'
	}

	EmbeddedVotingKeyLinkTransactionV1(){
		self._signerPublicKey = PublicKey()
		self._version = EmbeddedVotingKeyLinkTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = EmbeddedVotingKeyLinkTransactionV1.TRANSACTION_TYPE
		self._linkedPublicKey = VotingPublicKey()
		self._startEpoch = FinalizationEpoch()
		self._endEpoch = FinalizationEpoch()
		self._linkAction = LinkAction.UNLINK
		self._embeddedTransactionHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
	}

	None sort(){
		pass
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	TransactionType type_(){
		return self._type_
	}

	@property
	VotingPublicKey linkedPublicKey(){
		return self._linkedPublicKey
	}

	@property
	FinalizationEpoch startEpoch(){
		return self._startEpoch
	}

	@property
	FinalizationEpoch endEpoch(){
		return self._endEpoch
	}

	@property
	LinkAction linkAction(){
		return self._linkAction
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@linkedPublicKey.setter
	linkedPublicKey(value: VotingPublicKey){
		self._linkedPublicKey = value
	}

	@startEpoch.setter
	startEpoch(value: FinalizationEpoch){
		self._startEpoch = value
	}

	@endEpoch.setter
	endEpoch(value: FinalizationEpoch){
		self._endEpoch = value
	}

	@linkAction.setter
	linkAction(value: LinkAction){
		self._linkAction = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.linkedPublicKey.size
		size += self.startEpoch.size
		size += self.endEpoch.size
		size += self.linkAction.size
		return size
	}

	static EmbeddedVotingKeyLinkTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		embeddedTransactionHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert embeddedTransactionHeaderReserved_1 == 0, f'Invalid value of reserved field ({embeddedTransactionHeaderReserved_1})'
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		linkedPublicKey = VotingPublicKey.deserialize(buffer)
		buffer = buffer[linkedPublicKey.size:]
		startEpoch = FinalizationEpoch.deserialize(buffer)
		buffer = buffer[startEpoch.size:]
		endEpoch = FinalizationEpoch.deserialize(buffer)
		buffer = buffer[endEpoch.size:]
		linkAction = LinkAction.deserialize(buffer)
		buffer = buffer[linkAction.size:]

		instance = EmbeddedVotingKeyLinkTransactionV1()
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._linkedPublicKey = linkedPublicKey
		instance._startEpoch = startEpoch
		instance._endEpoch = endEpoch
		instance._linkAction = linkAction
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._embeddedTransactionHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._linkedPublicKey.serialize()
		buffer += self._startEpoch.serialize()
		buffer += self._endEpoch.serialize()
		buffer += self._linkAction.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'linkedPublicKey: {self._linkedPublicKey.__str__()}, '
		result += f'startEpoch: {self._startEpoch.__str__()}, '
		result += f'endEpoch: {self._endEpoch.__str__()}, '
		result += f'linkAction: {self._linkAction.__str__()}, '
		result += ')'
		return result
	}
}


class VrfKeyLinkTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.VRF_KEY_LINK
	TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'linkedPublicKey': 'pod:PublicKey',
		'linkAction': 'enum:LinkAction'
	}

	VrfKeyLinkTransactionV1(){
		self._signature = Signature()
		self._signerPublicKey = PublicKey()
		self._version = VrfKeyLinkTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = VrfKeyLinkTransactionV1.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._linkedPublicKey = PublicKey()
		self._linkAction = LinkAction.UNLINK
		self._verifiableEntityHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
	}

	None sort(){
		pass
	}

	@property
	Signature signature(){
		return self._signature
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	TransactionType type_(){
		return self._type_
	}

	@property
	Amount fee(){
		return self._fee
	}

	@property
	Timestamp deadline(){
		return self._deadline
	}

	@property
	PublicKey linkedPublicKey(){
		return self._linkedPublicKey
	}

	@property
	LinkAction linkAction(){
		return self._linkAction
	}

	@signature.setter
	signature(value: Signature){
		self._signature = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@fee.setter
	fee(value: Amount){
		self._fee = value
	}

	@deadline.setter
	deadline(value: Timestamp){
		self._deadline = value
	}

	@linkedPublicKey.setter
	linkedPublicKey(value: PublicKey){
		self._linkedPublicKey = value
	}

	@linkAction.setter
	linkAction(value: LinkAction){
		self._linkAction = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		size += self.linkedPublicKey.size
		size += self.linkAction.size
		return size
	}

	static VrfKeyLinkTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiableEntityHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert verifiableEntityHeaderReserved_1 == 0, f'Invalid value of reserved field ({verifiableEntityHeaderReserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		linkedPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[linkedPublicKey.size:]
		linkAction = LinkAction.deserialize(buffer)
		buffer = buffer[linkAction.size:]

		instance = VrfKeyLinkTransactionV1()
		instance._signature = signature
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		instance._linkedPublicKey = linkedPublicKey
		instance._linkAction = linkAction
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._verifiableEntityHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signature.serialize()
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._linkedPublicKey.serialize()
		buffer += self._linkAction.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'linkedPublicKey: {self._linkedPublicKey.__str__()}, '
		result += f'linkAction: {self._linkAction.__str__()}, '
		result += ')'
		return result
	}
}


class EmbeddedVrfKeyLinkTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.VRF_KEY_LINK
	TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'linkedPublicKey': 'pod:PublicKey',
		'linkAction': 'enum:LinkAction'
	}

	EmbeddedVrfKeyLinkTransactionV1(){
		self._signerPublicKey = PublicKey()
		self._version = EmbeddedVrfKeyLinkTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = EmbeddedVrfKeyLinkTransactionV1.TRANSACTION_TYPE
		self._linkedPublicKey = PublicKey()
		self._linkAction = LinkAction.UNLINK
		self._embeddedTransactionHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
	}

	None sort(){
		pass
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	TransactionType type_(){
		return self._type_
	}

	@property
	PublicKey linkedPublicKey(){
		return self._linkedPublicKey
	}

	@property
	LinkAction linkAction(){
		return self._linkAction
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@linkedPublicKey.setter
	linkedPublicKey(value: PublicKey){
		self._linkedPublicKey = value
	}

	@linkAction.setter
	linkAction(value: LinkAction){
		self._linkAction = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.linkedPublicKey.size
		size += self.linkAction.size
		return size
	}

	static EmbeddedVrfKeyLinkTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		embeddedTransactionHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert embeddedTransactionHeaderReserved_1 == 0, f'Invalid value of reserved field ({embeddedTransactionHeaderReserved_1})'
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		linkedPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[linkedPublicKey.size:]
		linkAction = LinkAction.deserialize(buffer)
		buffer = buffer[linkAction.size:]

		instance = EmbeddedVrfKeyLinkTransactionV1()
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._linkedPublicKey = linkedPublicKey
		instance._linkAction = linkAction
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._embeddedTransactionHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._linkedPublicKey.serialize()
		buffer += self._linkAction.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'linkedPublicKey: {self._linkedPublicKey.__str__()}, '
		result += f'linkAction: {self._linkAction.__str__()}, '
		result += ')'
		return result
	}
}


class HashLockTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.HASH_LOCK
	TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'mosaic': 'struct:UnresolvedMosaic',
		'duration': 'pod:BlockDuration',
		'hash': 'pod:Hash256'
	}

	HashLockTransactionV1(){
		self._signature = Signature()
		self._signerPublicKey = PublicKey()
		self._version = HashLockTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = HashLockTransactionV1.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._mosaic = UnresolvedMosaic()
		self._duration = BlockDuration()
		self._hash = Hash256()
		self._verifiableEntityHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
	}

	None sort(){
		self._mosaic.sort()
	}

	@property
	Signature signature(){
		return self._signature
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	TransactionType type_(){
		return self._type_
	}

	@property
	Amount fee(){
		return self._fee
	}

	@property
	Timestamp deadline(){
		return self._deadline
	}

	@property
	UnresolvedMosaic mosaic(){
		return self._mosaic
	}

	@property
	BlockDuration duration(){
		return self._duration
	}

	@property
	Hash256 hash(){
		return self._hash
	}

	@signature.setter
	signature(value: Signature){
		self._signature = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@fee.setter
	fee(value: Amount){
		self._fee = value
	}

	@deadline.setter
	deadline(value: Timestamp){
		self._deadline = value
	}

	@mosaic.setter
	mosaic(value: UnresolvedMosaic){
		self._mosaic = value
	}

	@duration.setter
	duration(value: BlockDuration){
		self._duration = value
	}

	@hash.setter
	hash(value: Hash256){
		self._hash = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		size += self.mosaic.size
		size += self.duration.size
		size += self.hash.size
		return size
	}

	static HashLockTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiableEntityHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert verifiableEntityHeaderReserved_1 == 0, f'Invalid value of reserved field ({verifiableEntityHeaderReserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		mosaic = UnresolvedMosaic.deserialize(buffer)
		buffer = buffer[mosaic.size:]
		duration = BlockDuration.deserialize(buffer)
		buffer = buffer[duration.size:]
		hash = Hash256.deserialize(buffer)
		buffer = buffer[hash.size:]

		instance = HashLockTransactionV1()
		instance._signature = signature
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		instance._mosaic = mosaic
		instance._duration = duration
		instance._hash = hash
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._verifiableEntityHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signature.serialize()
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._mosaic.serialize()
		buffer += self._duration.serialize()
		buffer += self._hash.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'mosaic: {self._mosaic.__str__()}, '
		result += f'duration: {self._duration.__str__()}, '
		result += f'hash: {self._hash.__str__()}, '
		result += ')'
		return result
	}
}


class EmbeddedHashLockTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.HASH_LOCK
	TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'mosaic': 'struct:UnresolvedMosaic',
		'duration': 'pod:BlockDuration',
		'hash': 'pod:Hash256'
	}

	EmbeddedHashLockTransactionV1(){
		self._signerPublicKey = PublicKey()
		self._version = EmbeddedHashLockTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = EmbeddedHashLockTransactionV1.TRANSACTION_TYPE
		self._mosaic = UnresolvedMosaic()
		self._duration = BlockDuration()
		self._hash = Hash256()
		self._embeddedTransactionHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
	}

	None sort(){
		self._mosaic.sort()
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	TransactionType type_(){
		return self._type_
	}

	@property
	UnresolvedMosaic mosaic(){
		return self._mosaic
	}

	@property
	BlockDuration duration(){
		return self._duration
	}

	@property
	Hash256 hash(){
		return self._hash
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@mosaic.setter
	mosaic(value: UnresolvedMosaic){
		self._mosaic = value
	}

	@duration.setter
	duration(value: BlockDuration){
		self._duration = value
	}

	@hash.setter
	hash(value: Hash256){
		self._hash = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.mosaic.size
		size += self.duration.size
		size += self.hash.size
		return size
	}

	static EmbeddedHashLockTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		embeddedTransactionHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert embeddedTransactionHeaderReserved_1 == 0, f'Invalid value of reserved field ({embeddedTransactionHeaderReserved_1})'
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		mosaic = UnresolvedMosaic.deserialize(buffer)
		buffer = buffer[mosaic.size:]
		duration = BlockDuration.deserialize(buffer)
		buffer = buffer[duration.size:]
		hash = Hash256.deserialize(buffer)
		buffer = buffer[hash.size:]

		instance = EmbeddedHashLockTransactionV1()
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._mosaic = mosaic
		instance._duration = duration
		instance._hash = hash
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._embeddedTransactionHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._mosaic.serialize()
		buffer += self._duration.serialize()
		buffer += self._hash.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'mosaic: {self._mosaic.__str__()}, '
		result += f'duration: {self._duration.__str__()}, '
		result += f'hash: {self._hash.__str__()}, '
		result += ')'
		return result
	}
}


class LockHashAlgorithm extends (Enum) {
	SHA3_256 = 0
	HASH_160 = 1
	HASH_256 = 2

	int get size(){
		return 1
	}

	static LockHashAlgorithm deserialize(Uint8List payload){
		buffer = memoryview(payload)
		return LockHashAlgorithm(BigInt.from(buffer.getInt8(0, Endian.little)))
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += (buffer..setInt8(0, self.value.toInt(), Endian.little)).buffer.asUint8List();
		return buffer
	}
}


class SecretLockTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.SECRET_LOCK
	TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'recipientAddress': 'pod:UnresolvedAddress',
		'secret': 'pod:Hash256',
		'mosaic': 'struct:UnresolvedMosaic',
		'duration': 'pod:BlockDuration',
		'hashAlgorithm': 'enum:LockHashAlgorithm'
	}

	SecretLockTransactionV1(){
		self._signature = Signature()
		self._signerPublicKey = PublicKey()
		self._version = SecretLockTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = SecretLockTransactionV1.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._recipientAddress = UnresolvedAddress()
		self._secret = Hash256()
		self._mosaic = UnresolvedMosaic()
		self._duration = BlockDuration()
		self._hashAlgorithm = LockHashAlgorithm.SHA3_256
		self._verifiableEntityHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
	}

	None sort(){
		self._mosaic.sort()
	}

	@property
	Signature signature(){
		return self._signature
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	TransactionType type_(){
		return self._type_
	}

	@property
	Amount fee(){
		return self._fee
	}

	@property
	Timestamp deadline(){
		return self._deadline
	}

	@property
	UnresolvedAddress recipientAddress(){
		return self._recipientAddress
	}

	@property
	Hash256 secret(){
		return self._secret
	}

	@property
	UnresolvedMosaic mosaic(){
		return self._mosaic
	}

	@property
	BlockDuration duration(){
		return self._duration
	}

	@property
	LockHashAlgorithm hashAlgorithm(){
		return self._hashAlgorithm
	}

	@signature.setter
	signature(value: Signature){
		self._signature = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@fee.setter
	fee(value: Amount){
		self._fee = value
	}

	@deadline.setter
	deadline(value: Timestamp){
		self._deadline = value
	}

	@recipientAddress.setter
	recipientAddress(value: UnresolvedAddress){
		self._recipientAddress = value
	}

	@secret.setter
	secret(value: Hash256){
		self._secret = value
	}

	@mosaic.setter
	mosaic(value: UnresolvedMosaic){
		self._mosaic = value
	}

	@duration.setter
	duration(value: BlockDuration){
		self._duration = value
	}

	@hashAlgorithm.setter
	hashAlgorithm(value: LockHashAlgorithm){
		self._hashAlgorithm = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		size += self.recipientAddress.size
		size += self.secret.size
		size += self.mosaic.size
		size += self.duration.size
		size += self.hashAlgorithm.size
		return size
	}

	static SecretLockTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiableEntityHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert verifiableEntityHeaderReserved_1 == 0, f'Invalid value of reserved field ({verifiableEntityHeaderReserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		recipientAddress = UnresolvedAddress.deserialize(buffer)
		buffer = buffer[recipientAddress.size:]
		secret = Hash256.deserialize(buffer)
		buffer = buffer[secret.size:]
		mosaic = UnresolvedMosaic.deserialize(buffer)
		buffer = buffer[mosaic.size:]
		duration = BlockDuration.deserialize(buffer)
		buffer = buffer[duration.size:]
		hashAlgorithm = LockHashAlgorithm.deserialize(buffer)
		buffer = buffer[hashAlgorithm.size:]

		instance = SecretLockTransactionV1()
		instance._signature = signature
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		instance._recipientAddress = recipientAddress
		instance._secret = secret
		instance._mosaic = mosaic
		instance._duration = duration
		instance._hashAlgorithm = hashAlgorithm
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._verifiableEntityHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signature.serialize()
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._recipientAddress.serialize()
		buffer += self._secret.serialize()
		buffer += self._mosaic.serialize()
		buffer += self._duration.serialize()
		buffer += self._hashAlgorithm.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'recipientAddress: {self._recipientAddress.__str__()}, '
		result += f'secret: {self._secret.__str__()}, '
		result += f'mosaic: {self._mosaic.__str__()}, '
		result += f'duration: {self._duration.__str__()}, '
		result += f'hashAlgorithm: {self._hashAlgorithm.__str__()}, '
		result += ')'
		return result
	}
}


class EmbeddedSecretLockTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.SECRET_LOCK
	TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'recipientAddress': 'pod:UnresolvedAddress',
		'secret': 'pod:Hash256',
		'mosaic': 'struct:UnresolvedMosaic',
		'duration': 'pod:BlockDuration',
		'hashAlgorithm': 'enum:LockHashAlgorithm'
	}

	EmbeddedSecretLockTransactionV1(){
		self._signerPublicKey = PublicKey()
		self._version = EmbeddedSecretLockTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = EmbeddedSecretLockTransactionV1.TRANSACTION_TYPE
		self._recipientAddress = UnresolvedAddress()
		self._secret = Hash256()
		self._mosaic = UnresolvedMosaic()
		self._duration = BlockDuration()
		self._hashAlgorithm = LockHashAlgorithm.SHA3_256
		self._embeddedTransactionHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
	}

	None sort(){
		self._mosaic.sort()
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	TransactionType type_(){
		return self._type_
	}

	@property
	UnresolvedAddress recipientAddress(){
		return self._recipientAddress
	}

	@property
	Hash256 secret(){
		return self._secret
	}

	@property
	UnresolvedMosaic mosaic(){
		return self._mosaic
	}

	@property
	BlockDuration duration(){
		return self._duration
	}

	@property
	LockHashAlgorithm hashAlgorithm(){
		return self._hashAlgorithm
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@recipientAddress.setter
	recipientAddress(value: UnresolvedAddress){
		self._recipientAddress = value
	}

	@secret.setter
	secret(value: Hash256){
		self._secret = value
	}

	@mosaic.setter
	mosaic(value: UnresolvedMosaic){
		self._mosaic = value
	}

	@duration.setter
	duration(value: BlockDuration){
		self._duration = value
	}

	@hashAlgorithm.setter
	hashAlgorithm(value: LockHashAlgorithm){
		self._hashAlgorithm = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.recipientAddress.size
		size += self.secret.size
		size += self.mosaic.size
		size += self.duration.size
		size += self.hashAlgorithm.size
		return size
	}

	static EmbeddedSecretLockTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		embeddedTransactionHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert embeddedTransactionHeaderReserved_1 == 0, f'Invalid value of reserved field ({embeddedTransactionHeaderReserved_1})'
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		recipientAddress = UnresolvedAddress.deserialize(buffer)
		buffer = buffer[recipientAddress.size:]
		secret = Hash256.deserialize(buffer)
		buffer = buffer[secret.size:]
		mosaic = UnresolvedMosaic.deserialize(buffer)
		buffer = buffer[mosaic.size:]
		duration = BlockDuration.deserialize(buffer)
		buffer = buffer[duration.size:]
		hashAlgorithm = LockHashAlgorithm.deserialize(buffer)
		buffer = buffer[hashAlgorithm.size:]

		instance = EmbeddedSecretLockTransactionV1()
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._recipientAddress = recipientAddress
		instance._secret = secret
		instance._mosaic = mosaic
		instance._duration = duration
		instance._hashAlgorithm = hashAlgorithm
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._embeddedTransactionHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._recipientAddress.serialize()
		buffer += self._secret.serialize()
		buffer += self._mosaic.serialize()
		buffer += self._duration.serialize()
		buffer += self._hashAlgorithm.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'recipientAddress: {self._recipientAddress.__str__()}, '
		result += f'secret: {self._secret.__str__()}, '
		result += f'mosaic: {self._mosaic.__str__()}, '
		result += f'duration: {self._duration.__str__()}, '
		result += f'hashAlgorithm: {self._hashAlgorithm.__str__()}, '
		result += ')'
		return result
	}
}


class SecretProofTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.SECRET_PROOF
	TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'recipientAddress': 'pod:UnresolvedAddress',
		'secret': 'pod:Hash256',
		'hashAlgorithm': 'enum:LockHashAlgorithm',
		'proof': 'bytes_array'
	}

	SecretProofTransactionV1(){
		self._signature = Signature()
		self._signerPublicKey = PublicKey()
		self._version = SecretProofTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = SecretProofTransactionV1.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._recipientAddress = UnresolvedAddress()
		self._secret = Hash256()
		self._hashAlgorithm = LockHashAlgorithm.SHA3_256
		self._proof = Uint8List()
		self._verifiableEntityHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
	}

	None sort(){
		pass
	}

	@property
	Signature signature(){
		return self._signature
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	TransactionType type_(){
		return self._type_
	}

	@property
	Amount fee(){
		return self._fee
	}

	@property
	Timestamp deadline(){
		return self._deadline
	}

	@property
	UnresolvedAddress recipientAddress(){
		return self._recipientAddress
	}

	@property
	Hash256 secret(){
		return self._secret
	}

	@property
	LockHashAlgorithm hashAlgorithm(){
		return self._hashAlgorithm
	}

	@property
	bytes proof(){
		return self._proof
	}

	@signature.setter
	signature(value: Signature){
		self._signature = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@fee.setter
	fee(value: Amount){
		self._fee = value
	}

	@deadline.setter
	deadline(value: Timestamp){
		self._deadline = value
	}

	@recipientAddress.setter
	recipientAddress(value: UnresolvedAddress){
		self._recipientAddress = value
	}

	@secret.setter
	secret(value: Hash256){
		self._secret = value
	}

	@hashAlgorithm.setter
	hashAlgorithm(value: LockHashAlgorithm){
		self._hashAlgorithm = value
	}

	@proof.setter
	proof(value: bytes){
		self._proof = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		size += self.recipientAddress.size
		size += self.secret.size
		size += 2
		size += self.hashAlgorithm.size
		size += len(self._proof)
		return size
	}

	static SecretProofTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiableEntityHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert verifiableEntityHeaderReserved_1 == 0, f'Invalid value of reserved field ({verifiableEntityHeaderReserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		recipientAddress = UnresolvedAddress.deserialize(buffer)
		buffer = buffer[recipientAddress.size:]
		secret = Hash256.deserialize(buffer)
		buffer = buffer[secret.size:]
		proofSize = BigInt.from(buffer.getInt16(0, Endian.little))
		buffer = buffer[2:]
		hashAlgorithm = LockHashAlgorithm.deserialize(buffer)
		buffer = buffer[hashAlgorithm.size:]
		proof = Uint8List.fromList(payload)
		buffer = buffer[proof_size:]

		instance = SecretProofTransactionV1()
		instance._signature = signature
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		instance._recipientAddress = recipientAddress
		instance._secret = secret
		instance._hashAlgorithm = hashAlgorithm
		instance._proof = proof
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._verifiableEntityHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signature.serialize()
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._recipientAddress.serialize()
		buffer += self._secret.serialize()
		buffer += (buffer..setInt16(0, len(self._proof).toInt(), Endian.little)).buffer.asUint8List();  # proof_size
		buffer += self._hashAlgorithm.serialize()
		buffer += self._proof
		return buffer
	}

	str toString(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'recipientAddress: {self._recipientAddress.__str__()}, '
		result += f'secret: {self._secret.__str__()}, '
		result += f'hashAlgorithm: {self._hashAlgorithm.__str__()}, '
		result += f'proof: {hexlify(self._proof).decode("utf8")}, '
		result += ')'
		return result
	}
}


class EmbeddedSecretProofTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.SECRET_PROOF
	TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'recipientAddress': 'pod:UnresolvedAddress',
		'secret': 'pod:Hash256',
		'hashAlgorithm': 'enum:LockHashAlgorithm',
		'proof': 'bytes_array'
	}

	EmbeddedSecretProofTransactionV1(){
		self._signerPublicKey = PublicKey()
		self._version = EmbeddedSecretProofTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = EmbeddedSecretProofTransactionV1.TRANSACTION_TYPE
		self._recipientAddress = UnresolvedAddress()
		self._secret = Hash256()
		self._hashAlgorithm = LockHashAlgorithm.SHA3_256
		self._proof = Uint8List()
		self._embeddedTransactionHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
	}

	None sort(){
		pass
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	TransactionType type_(){
		return self._type_
	}

	@property
	UnresolvedAddress recipientAddress(){
		return self._recipientAddress
	}

	@property
	Hash256 secret(){
		return self._secret
	}

	@property
	LockHashAlgorithm hashAlgorithm(){
		return self._hashAlgorithm
	}

	@property
	bytes proof(){
		return self._proof
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@recipientAddress.setter
	recipientAddress(value: UnresolvedAddress){
		self._recipientAddress = value
	}

	@secret.setter
	secret(value: Hash256){
		self._secret = value
	}

	@hashAlgorithm.setter
	hashAlgorithm(value: LockHashAlgorithm){
		self._hashAlgorithm = value
	}

	@proof.setter
	proof(value: bytes){
		self._proof = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.recipientAddress.size
		size += self.secret.size
		size += 2
		size += self.hashAlgorithm.size
		size += len(self._proof)
		return size
	}

	static EmbeddedSecretProofTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		embeddedTransactionHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert embeddedTransactionHeaderReserved_1 == 0, f'Invalid value of reserved field ({embeddedTransactionHeaderReserved_1})'
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		recipientAddress = UnresolvedAddress.deserialize(buffer)
		buffer = buffer[recipientAddress.size:]
		secret = Hash256.deserialize(buffer)
		buffer = buffer[secret.size:]
		proofSize = BigInt.from(buffer.getInt16(0, Endian.little))
		buffer = buffer[2:]
		hashAlgorithm = LockHashAlgorithm.deserialize(buffer)
		buffer = buffer[hashAlgorithm.size:]
		proof = Uint8List.fromList(payload)
		buffer = buffer[proof_size:]

		instance = EmbeddedSecretProofTransactionV1()
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._recipientAddress = recipientAddress
		instance._secret = secret
		instance._hashAlgorithm = hashAlgorithm
		instance._proof = proof
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._embeddedTransactionHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._recipientAddress.serialize()
		buffer += self._secret.serialize()
		buffer += (buffer..setInt16(0, len(self._proof).toInt(), Endian.little)).buffer.asUint8List();  # proof_size
		buffer += self._hashAlgorithm.serialize()
		buffer += self._proof
		return buffer
	}

	str toString(){
		result = '('
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'recipientAddress: {self._recipientAddress.__str__()}, '
		result += f'secret: {self._secret.__str__()}, '
		result += f'hashAlgorithm: {self._hashAlgorithm.__str__()}, '
		result += f'proof: {hexlify(self._proof).decode("utf8")}, '
		result += ')'
		return result
	}
}


class AccountMetadataTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.ACCOUNT_METADATA
	TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'targetAddress': 'pod:UnresolvedAddress',
		'value': 'bytes_array'
	}

	AccountMetadataTransactionV1(){
		self._signature = Signature()
		self._signerPublicKey = PublicKey()
		self._version = AccountMetadataTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = AccountMetadataTransactionV1.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._targetAddress = UnresolvedAddress()
		self._scopedMetadataKey = BigInt.zero
		self._valueSizeDelta = 0
		self._value = Uint8List()
		self._verifiableEntityHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
	}

	None sort(){
		pass
	}

	@property
	Signature signature(){
		return self._signature
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	TransactionType type_(){
		return self._type_
	}

	@property
	Amount fee(){
		return self._fee
	}

	@property
	Timestamp deadline(){
		return self._deadline
	}

	@property
	UnresolvedAddress targetAddress(){
		return self._targetAddress
	}

	@property
	BigInt scopedMetadataKey(){
		return self._scopedMetadataKey
	}

	@property
	int valueSizeDelta(){
		return self._valueSizeDelta
	}

	@property
	bytes value(){
		return self._value
	}

	@signature.setter
	signature(value: Signature){
		self._signature = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@fee.setter
	fee(value: Amount){
		self._fee = value
	}

	@deadline.setter
	deadline(value: Timestamp){
		self._deadline = value
	}

	@targetAddress.setter
	targetAddress(value: UnresolvedAddress){
		self._targetAddress = value
	}

	@scopedMetadataKey.setter
	scopedMetadataKey(value: BigInt){
		self._scopedMetadataKey = value
	}

	@valueSizeDelta.setter
	valueSizeDelta(value: int){
		self._valueSizeDelta = value
	}

	@value.setter
	value(value: bytes){
		self._value = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		size += self.targetAddress.size
		size += 8
		size += 2
		size += 2
		size += len(self._value)
		return size
	}

	static AccountMetadataTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiableEntityHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert verifiableEntityHeaderReserved_1 == 0, f'Invalid value of reserved field ({verifiableEntityHeaderReserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		targetAddress = UnresolvedAddress.deserialize(buffer)
		buffer = buffer[targetAddress.size:]
		scopedMetadataKey = BigInt.from(buffer.getInt64(0, Endian.little))
		buffer = buffer[8:]
		valueSizeDelta = BigInt.from(buffer.getInt16(0, Endian.little))
		buffer = buffer[2:]
		valueSize = BigInt.from(buffer.getInt16(0, Endian.little))
		buffer = buffer[2:]
		value = Uint8List.fromList(payload)
		buffer = buffer[value_size:]

		instance = AccountMetadataTransactionV1()
		instance._signature = signature
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		instance._targetAddress = targetAddress
		instance._scopedMetadataKey = scopedMetadataKey
		instance._valueSizeDelta = valueSizeDelta
		instance._value = value
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._verifiableEntityHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signature.serialize()
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._targetAddress.serialize()
		buffer += (buffer..setInt64(0, self._scopedMetadataKey.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt16(0, self._valueSizeDelta.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt16(0, len(self._value).toInt(), Endian.little)).buffer.asUint8List();  # value_size
		buffer += self._value
		return buffer
	}

	str toString(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'targetAddress: {self._targetAddress.__str__()}, '
		result += f'scopedMetadataKey: 0x{self._scopedMetadataKey:X}, '
		result += f'valueSizeDelta: 0x{self._valueSizeDelta:X}, '
		result += f'value: {hexlify(self._value).decode("utf8")}, '
		result += ')'
		return result
	}
}


class EmbeddedAccountMetadataTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.ACCOUNT_METADATA
	TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'targetAddress': 'pod:UnresolvedAddress',
		'value': 'bytes_array'
	}

	EmbeddedAccountMetadataTransactionV1(){
		self._signerPublicKey = PublicKey()
		self._version = EmbeddedAccountMetadataTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = EmbeddedAccountMetadataTransactionV1.TRANSACTION_TYPE
		self._targetAddress = UnresolvedAddress()
		self._scopedMetadataKey = BigInt.zero
		self._valueSizeDelta = 0
		self._value = Uint8List()
		self._embeddedTransactionHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
	}

	None sort(){
		pass
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	TransactionType type_(){
		return self._type_
	}

	@property
	UnresolvedAddress targetAddress(){
		return self._targetAddress
	}

	@property
	BigInt scopedMetadataKey(){
		return self._scopedMetadataKey
	}

	@property
	int valueSizeDelta(){
		return self._valueSizeDelta
	}

	@property
	bytes value(){
		return self._value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@targetAddress.setter
	targetAddress(value: UnresolvedAddress){
		self._targetAddress = value
	}

	@scopedMetadataKey.setter
	scopedMetadataKey(value: BigInt){
		self._scopedMetadataKey = value
	}

	@valueSizeDelta.setter
	valueSizeDelta(value: int){
		self._valueSizeDelta = value
	}

	@value.setter
	value(value: bytes){
		self._value = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.targetAddress.size
		size += 8
		size += 2
		size += 2
		size += len(self._value)
		return size
	}

	static EmbeddedAccountMetadataTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		embeddedTransactionHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert embeddedTransactionHeaderReserved_1 == 0, f'Invalid value of reserved field ({embeddedTransactionHeaderReserved_1})'
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		targetAddress = UnresolvedAddress.deserialize(buffer)
		buffer = buffer[targetAddress.size:]
		scopedMetadataKey = BigInt.from(buffer.getInt64(0, Endian.little))
		buffer = buffer[8:]
		valueSizeDelta = BigInt.from(buffer.getInt16(0, Endian.little))
		buffer = buffer[2:]
		valueSize = BigInt.from(buffer.getInt16(0, Endian.little))
		buffer = buffer[2:]
		value = Uint8List.fromList(payload)
		buffer = buffer[value_size:]

		instance = EmbeddedAccountMetadataTransactionV1()
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._targetAddress = targetAddress
		instance._scopedMetadataKey = scopedMetadataKey
		instance._valueSizeDelta = valueSizeDelta
		instance._value = value
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._embeddedTransactionHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._targetAddress.serialize()
		buffer += (buffer..setInt64(0, self._scopedMetadataKey.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt16(0, self._valueSizeDelta.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt16(0, len(self._value).toInt(), Endian.little)).buffer.asUint8List();  # value_size
		buffer += self._value
		return buffer
	}

	str toString(){
		result = '('
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'targetAddress: {self._targetAddress.__str__()}, '
		result += f'scopedMetadataKey: 0x{self._scopedMetadataKey:X}, '
		result += f'valueSizeDelta: 0x{self._valueSizeDelta:X}, '
		result += f'value: {hexlify(self._value).decode("utf8")}, '
		result += ')'
		return result
	}
}


class MosaicMetadataTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.MOSAIC_METADATA
	TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'targetAddress': 'pod:UnresolvedAddress',
		'targetMosaicId': 'pod:UnresolvedMosaicId',
		'value': 'bytes_array'
	}

	MosaicMetadataTransactionV1(){
		self._signature = Signature()
		self._signerPublicKey = PublicKey()
		self._version = MosaicMetadataTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = MosaicMetadataTransactionV1.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._targetAddress = UnresolvedAddress()
		self._scopedMetadataKey = BigInt.zero
		self._targetMosaicId = UnresolvedMosaicId()
		self._valueSizeDelta = 0
		self._value = Uint8List()
		self._verifiableEntityHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
	}

	None sort(){
		pass
	}

	@property
	Signature signature(){
		return self._signature
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	TransactionType type_(){
		return self._type_
	}

	@property
	Amount fee(){
		return self._fee
	}

	@property
	Timestamp deadline(){
		return self._deadline
	}

	@property
	UnresolvedAddress targetAddress(){
		return self._targetAddress
	}

	@property
	BigInt scopedMetadataKey(){
		return self._scopedMetadataKey
	}

	@property
	UnresolvedMosaicId targetMosaicId(){
		return self._targetMosaicId
	}

	@property
	int valueSizeDelta(){
		return self._valueSizeDelta
	}

	@property
	bytes value(){
		return self._value
	}

	@signature.setter
	signature(value: Signature){
		self._signature = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@fee.setter
	fee(value: Amount){
		self._fee = value
	}

	@deadline.setter
	deadline(value: Timestamp){
		self._deadline = value
	}

	@targetAddress.setter
	targetAddress(value: UnresolvedAddress){
		self._targetAddress = value
	}

	@scopedMetadataKey.setter
	scopedMetadataKey(value: BigInt){
		self._scopedMetadataKey = value
	}

	@targetMosaicId.setter
	targetMosaicId(value: UnresolvedMosaicId){
		self._targetMosaicId = value
	}

	@valueSizeDelta.setter
	valueSizeDelta(value: int){
		self._valueSizeDelta = value
	}

	@value.setter
	value(value: bytes){
		self._value = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		size += self.targetAddress.size
		size += 8
		size += self.targetMosaicId.size
		size += 2
		size += 2
		size += len(self._value)
		return size
	}

	static MosaicMetadataTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiableEntityHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert verifiableEntityHeaderReserved_1 == 0, f'Invalid value of reserved field ({verifiableEntityHeaderReserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		targetAddress = UnresolvedAddress.deserialize(buffer)
		buffer = buffer[targetAddress.size:]
		scopedMetadataKey = BigInt.from(buffer.getInt64(0, Endian.little))
		buffer = buffer[8:]
		targetMosaicId = UnresolvedMosaicId.deserialize(buffer)
		buffer = buffer[targetMosaicId.size:]
		valueSizeDelta = BigInt.from(buffer.getInt16(0, Endian.little))
		buffer = buffer[2:]
		valueSize = BigInt.from(buffer.getInt16(0, Endian.little))
		buffer = buffer[2:]
		value = Uint8List.fromList(payload)
		buffer = buffer[value_size:]

		instance = MosaicMetadataTransactionV1()
		instance._signature = signature
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		instance._targetAddress = targetAddress
		instance._scopedMetadataKey = scopedMetadataKey
		instance._targetMosaicId = targetMosaicId
		instance._valueSizeDelta = valueSizeDelta
		instance._value = value
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._verifiableEntityHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signature.serialize()
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._targetAddress.serialize()
		buffer += (buffer..setInt64(0, self._scopedMetadataKey.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._targetMosaicId.serialize()
		buffer += (buffer..setInt16(0, self._valueSizeDelta.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt16(0, len(self._value).toInt(), Endian.little)).buffer.asUint8List();  # value_size
		buffer += self._value
		return buffer
	}

	str toString(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'targetAddress: {self._targetAddress.__str__()}, '
		result += f'scopedMetadataKey: 0x{self._scopedMetadataKey:X}, '
		result += f'targetMosaicId: {self._targetMosaicId.__str__()}, '
		result += f'valueSizeDelta: 0x{self._valueSizeDelta:X}, '
		result += f'value: {hexlify(self._value).decode("utf8")}, '
		result += ')'
		return result
	}
}


class EmbeddedMosaicMetadataTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.MOSAIC_METADATA
	TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'targetAddress': 'pod:UnresolvedAddress',
		'targetMosaicId': 'pod:UnresolvedMosaicId',
		'value': 'bytes_array'
	}

	EmbeddedMosaicMetadataTransactionV1(){
		self._signerPublicKey = PublicKey()
		self._version = EmbeddedMosaicMetadataTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = EmbeddedMosaicMetadataTransactionV1.TRANSACTION_TYPE
		self._targetAddress = UnresolvedAddress()
		self._scopedMetadataKey = BigInt.zero
		self._targetMosaicId = UnresolvedMosaicId()
		self._valueSizeDelta = 0
		self._value = Uint8List()
		self._embeddedTransactionHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
	}

	None sort(){
		pass
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	TransactionType type_(){
		return self._type_
	}

	@property
	UnresolvedAddress targetAddress(){
		return self._targetAddress
	}

	@property
	BigInt scopedMetadataKey(){
		return self._scopedMetadataKey
	}

	@property
	UnresolvedMosaicId targetMosaicId(){
		return self._targetMosaicId
	}

	@property
	int valueSizeDelta(){
		return self._valueSizeDelta
	}

	@property
	bytes value(){
		return self._value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@targetAddress.setter
	targetAddress(value: UnresolvedAddress){
		self._targetAddress = value
	}

	@scopedMetadataKey.setter
	scopedMetadataKey(value: BigInt){
		self._scopedMetadataKey = value
	}

	@targetMosaicId.setter
	targetMosaicId(value: UnresolvedMosaicId){
		self._targetMosaicId = value
	}

	@valueSizeDelta.setter
	valueSizeDelta(value: int){
		self._valueSizeDelta = value
	}

	@value.setter
	value(value: bytes){
		self._value = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.targetAddress.size
		size += 8
		size += self.targetMosaicId.size
		size += 2
		size += 2
		size += len(self._value)
		return size
	}

	static EmbeddedMosaicMetadataTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		embeddedTransactionHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert embeddedTransactionHeaderReserved_1 == 0, f'Invalid value of reserved field ({embeddedTransactionHeaderReserved_1})'
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		targetAddress = UnresolvedAddress.deserialize(buffer)
		buffer = buffer[targetAddress.size:]
		scopedMetadataKey = BigInt.from(buffer.getInt64(0, Endian.little))
		buffer = buffer[8:]
		targetMosaicId = UnresolvedMosaicId.deserialize(buffer)
		buffer = buffer[targetMosaicId.size:]
		valueSizeDelta = BigInt.from(buffer.getInt16(0, Endian.little))
		buffer = buffer[2:]
		valueSize = BigInt.from(buffer.getInt16(0, Endian.little))
		buffer = buffer[2:]
		value = Uint8List.fromList(payload)
		buffer = buffer[value_size:]

		instance = EmbeddedMosaicMetadataTransactionV1()
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._targetAddress = targetAddress
		instance._scopedMetadataKey = scopedMetadataKey
		instance._targetMosaicId = targetMosaicId
		instance._valueSizeDelta = valueSizeDelta
		instance._value = value
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._embeddedTransactionHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._targetAddress.serialize()
		buffer += (buffer..setInt64(0, self._scopedMetadataKey.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._targetMosaicId.serialize()
		buffer += (buffer..setInt16(0, self._valueSizeDelta.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt16(0, len(self._value).toInt(), Endian.little)).buffer.asUint8List();  # value_size
		buffer += self._value
		return buffer
	}

	str toString(){
		result = '('
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'targetAddress: {self._targetAddress.__str__()}, '
		result += f'scopedMetadataKey: 0x{self._scopedMetadataKey:X}, '
		result += f'targetMosaicId: {self._targetMosaicId.__str__()}, '
		result += f'valueSizeDelta: 0x{self._valueSizeDelta:X}, '
		result += f'value: {hexlify(self._value).decode("utf8")}, '
		result += ')'
		return result
	}
}


class NamespaceMetadataTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.NAMESPACE_METADATA
	TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'targetAddress': 'pod:UnresolvedAddress',
		'targetNamespaceId': 'pod:NamespaceId',
		'value': 'bytes_array'
	}

	NamespaceMetadataTransactionV1(){
		self._signature = Signature()
		self._signerPublicKey = PublicKey()
		self._version = NamespaceMetadataTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = NamespaceMetadataTransactionV1.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._targetAddress = UnresolvedAddress()
		self._scopedMetadataKey = BigInt.zero
		self._targetNamespaceId = NamespaceId()
		self._valueSizeDelta = 0
		self._value = Uint8List()
		self._verifiableEntityHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
	}

	None sort(){
		pass
	}

	@property
	Signature signature(){
		return self._signature
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	TransactionType type_(){
		return self._type_
	}

	@property
	Amount fee(){
		return self._fee
	}

	@property
	Timestamp deadline(){
		return self._deadline
	}

	@property
	UnresolvedAddress targetAddress(){
		return self._targetAddress
	}

	@property
	BigInt scopedMetadataKey(){
		return self._scopedMetadataKey
	}

	@property
	NamespaceId targetNamespaceId(){
		return self._targetNamespaceId
	}

	@property
	int valueSizeDelta(){
		return self._valueSizeDelta
	}

	@property
	bytes value(){
		return self._value
	}

	@signature.setter
	signature(value: Signature){
		self._signature = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@fee.setter
	fee(value: Amount){
		self._fee = value
	}

	@deadline.setter
	deadline(value: Timestamp){
		self._deadline = value
	}

	@targetAddress.setter
	targetAddress(value: UnresolvedAddress){
		self._targetAddress = value
	}

	@scopedMetadataKey.setter
	scopedMetadataKey(value: BigInt){
		self._scopedMetadataKey = value
	}

	@targetNamespaceId.setter
	targetNamespaceId(value: NamespaceId){
		self._targetNamespaceId = value
	}

	@valueSizeDelta.setter
	valueSizeDelta(value: int){
		self._valueSizeDelta = value
	}

	@value.setter
	value(value: bytes){
		self._value = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		size += self.targetAddress.size
		size += 8
		size += self.targetNamespaceId.size
		size += 2
		size += 2
		size += len(self._value)
		return size
	}

	static NamespaceMetadataTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiableEntityHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert verifiableEntityHeaderReserved_1 == 0, f'Invalid value of reserved field ({verifiableEntityHeaderReserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		targetAddress = UnresolvedAddress.deserialize(buffer)
		buffer = buffer[targetAddress.size:]
		scopedMetadataKey = BigInt.from(buffer.getInt64(0, Endian.little))
		buffer = buffer[8:]
		targetNamespaceId = NamespaceId.deserialize(buffer)
		buffer = buffer[targetNamespaceId.size:]
		valueSizeDelta = BigInt.from(buffer.getInt16(0, Endian.little))
		buffer = buffer[2:]
		valueSize = BigInt.from(buffer.getInt16(0, Endian.little))
		buffer = buffer[2:]
		value = Uint8List.fromList(payload)
		buffer = buffer[value_size:]

		instance = NamespaceMetadataTransactionV1()
		instance._signature = signature
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		instance._targetAddress = targetAddress
		instance._scopedMetadataKey = scopedMetadataKey
		instance._targetNamespaceId = targetNamespaceId
		instance._valueSizeDelta = valueSizeDelta
		instance._value = value
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._verifiableEntityHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signature.serialize()
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._targetAddress.serialize()
		buffer += (buffer..setInt64(0, self._scopedMetadataKey.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._targetNamespaceId.serialize()
		buffer += (buffer..setInt16(0, self._valueSizeDelta.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt16(0, len(self._value).toInt(), Endian.little)).buffer.asUint8List();  # value_size
		buffer += self._value
		return buffer
	}

	str toString(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'targetAddress: {self._targetAddress.__str__()}, '
		result += f'scopedMetadataKey: 0x{self._scopedMetadataKey:X}, '
		result += f'targetNamespaceId: {self._targetNamespaceId.__str__()}, '
		result += f'valueSizeDelta: 0x{self._valueSizeDelta:X}, '
		result += f'value: {hexlify(self._value).decode("utf8")}, '
		result += ')'
		return result
	}
}


class EmbeddedNamespaceMetadataTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.NAMESPACE_METADATA
	TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'targetAddress': 'pod:UnresolvedAddress',
		'targetNamespaceId': 'pod:NamespaceId',
		'value': 'bytes_array'
	}

	EmbeddedNamespaceMetadataTransactionV1(){
		self._signerPublicKey = PublicKey()
		self._version = EmbeddedNamespaceMetadataTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = EmbeddedNamespaceMetadataTransactionV1.TRANSACTION_TYPE
		self._targetAddress = UnresolvedAddress()
		self._scopedMetadataKey = BigInt.zero
		self._targetNamespaceId = NamespaceId()
		self._valueSizeDelta = 0
		self._value = Uint8List()
		self._embeddedTransactionHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
	}

	None sort(){
		pass
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	TransactionType type_(){
		return self._type_
	}

	@property
	UnresolvedAddress targetAddress(){
		return self._targetAddress
	}

	@property
	BigInt scopedMetadataKey(){
		return self._scopedMetadataKey
	}

	@property
	NamespaceId targetNamespaceId(){
		return self._targetNamespaceId
	}

	@property
	int valueSizeDelta(){
		return self._valueSizeDelta
	}

	@property
	bytes value(){
		return self._value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@targetAddress.setter
	targetAddress(value: UnresolvedAddress){
		self._targetAddress = value
	}

	@scopedMetadataKey.setter
	scopedMetadataKey(value: BigInt){
		self._scopedMetadataKey = value
	}

	@targetNamespaceId.setter
	targetNamespaceId(value: NamespaceId){
		self._targetNamespaceId = value
	}

	@valueSizeDelta.setter
	valueSizeDelta(value: int){
		self._valueSizeDelta = value
	}

	@value.setter
	value(value: bytes){
		self._value = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.targetAddress.size
		size += 8
		size += self.targetNamespaceId.size
		size += 2
		size += 2
		size += len(self._value)
		return size
	}

	static EmbeddedNamespaceMetadataTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		embeddedTransactionHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert embeddedTransactionHeaderReserved_1 == 0, f'Invalid value of reserved field ({embeddedTransactionHeaderReserved_1})'
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		targetAddress = UnresolvedAddress.deserialize(buffer)
		buffer = buffer[targetAddress.size:]
		scopedMetadataKey = BigInt.from(buffer.getInt64(0, Endian.little))
		buffer = buffer[8:]
		targetNamespaceId = NamespaceId.deserialize(buffer)
		buffer = buffer[targetNamespaceId.size:]
		valueSizeDelta = BigInt.from(buffer.getInt16(0, Endian.little))
		buffer = buffer[2:]
		valueSize = BigInt.from(buffer.getInt16(0, Endian.little))
		buffer = buffer[2:]
		value = Uint8List.fromList(payload)
		buffer = buffer[value_size:]

		instance = EmbeddedNamespaceMetadataTransactionV1()
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._targetAddress = targetAddress
		instance._scopedMetadataKey = scopedMetadataKey
		instance._targetNamespaceId = targetNamespaceId
		instance._valueSizeDelta = valueSizeDelta
		instance._value = value
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._embeddedTransactionHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._targetAddress.serialize()
		buffer += (buffer..setInt64(0, self._scopedMetadataKey.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._targetNamespaceId.serialize()
		buffer += (buffer..setInt16(0, self._valueSizeDelta.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt16(0, len(self._value).toInt(), Endian.little)).buffer.asUint8List();  # value_size
		buffer += self._value
		return buffer
	}

	str toString(){
		result = '('
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'targetAddress: {self._targetAddress.__str__()}, '
		result += f'scopedMetadataKey: 0x{self._scopedMetadataKey:X}, '
		result += f'targetNamespaceId: {self._targetNamespaceId.__str__()}, '
		result += f'valueSizeDelta: 0x{self._valueSizeDelta:X}, '
		result += f'value: {hexlify(self._value).decode("utf8")}, '
		result += ')'
		return result
	}
}


class MosaicNonce extends BaseValue {
	static const int SIZE = 4;

	MosaicNonce(int mosaicNonce): super(SIZE, mosaicNonce ?? 0);

	static MosaicNonce deserialize(Uint8List payload){
		var buffer = ByteData.view(payload.buffer);
		return MosaicNonce(BigInt.from(buffer.getInt32(0, Endian.little)));
	}

	Uint8List serialize(){
		var buffer = ByteData(SIZE);
		return (buffer..setInt32(0, value.toInt(), Endian.little)).buffer.asUint8List();;
	}
}


class MosaicFlags extends (Flag) {
	NONE = 0
	SUPPLY_MUTABLE = 1
	TRANSFERABLE = 2
	RESTRICTABLE = 4
	REVOKABLE = 8

	int get size(){
		return 1
	}

	static MosaicFlags deserialize(Uint8List payload){
		buffer = memoryview(payload)
		return MosaicFlags(BigInt.from(buffer.getInt8(0, Endian.little)))
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += (buffer..setInt8(0, self.value.toInt(), Endian.little)).buffer.asUint8List();
		return buffer
	}
}


class MosaicSupplyChangeAction extends (Enum) {
	DECREASE = 0
	INCREASE = 1

	int get size(){
		return 1
	}

	static MosaicSupplyChangeAction deserialize(Uint8List payload){
		buffer = memoryview(payload)
		return MosaicSupplyChangeAction(BigInt.from(buffer.getInt8(0, Endian.little)))
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += (buffer..setInt8(0, self.value.toInt(), Endian.little)).buffer.asUint8List();
		return buffer
	}
}


class MosaicDefinitionTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.MOSAIC_DEFINITION
	TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'id': 'pod:MosaicId',
		'duration': 'pod:BlockDuration',
		'nonce': 'pod:MosaicNonce',
		'flags': 'enum:MosaicFlags'
	}

	MosaicDefinitionTransactionV1(){
		self._signature = Signature()
		self._signerPublicKey = PublicKey()
		self._version = MosaicDefinitionTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = MosaicDefinitionTransactionV1.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._id = MosaicId()
		self._duration = BlockDuration()
		self._nonce = MosaicNonce()
		self._flags = MosaicFlags.NONE
		self._divisibility = 0
		self._verifiableEntityHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
	}

	None sort(){
		pass
	}

	@property
	Signature signature(){
		return self._signature
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	TransactionType type_(){
		return self._type_
	}

	@property
	Amount fee(){
		return self._fee
	}

	@property
	Timestamp deadline(){
		return self._deadline
	}

	@property
	MosaicId id(){
		return self._id
	}

	@property
	BlockDuration duration(){
		return self._duration
	}

	@property
	MosaicNonce nonce(){
		return self._nonce
	}

	@property
	MosaicFlags flags(){
		return self._flags
	}

	@property
	int divisibility(){
		return self._divisibility
	}

	@signature.setter
	signature(value: Signature){
		self._signature = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@fee.setter
	fee(value: Amount){
		self._fee = value
	}

	@deadline.setter
	deadline(value: Timestamp){
		self._deadline = value
	}

	@id.setter
	id(value: MosaicId){
		self._id = value
	}

	@duration.setter
	duration(value: BlockDuration){
		self._duration = value
	}

	@nonce.setter
	nonce(value: MosaicNonce){
		self._nonce = value
	}

	@flags.setter
	flags(value: MosaicFlags){
		self._flags = value
	}

	@divisibility.setter
	divisibility(value: int){
		self._divisibility = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		size += self.id.size
		size += self.duration.size
		size += self.nonce.size
		size += self.flags.size
		size += 1
		return size
	}

	static MosaicDefinitionTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiableEntityHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert verifiableEntityHeaderReserved_1 == 0, f'Invalid value of reserved field ({verifiableEntityHeaderReserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		id = MosaicId.deserialize(buffer)
		buffer = buffer[id.size:]
		duration = BlockDuration.deserialize(buffer)
		buffer = buffer[duration.size:]
		nonce = MosaicNonce.deserialize(buffer)
		buffer = buffer[nonce.size:]
		flags = MosaicFlags.deserialize(buffer)
		buffer = buffer[flags.size:]
		divisibility = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]

		instance = MosaicDefinitionTransactionV1()
		instance._signature = signature
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		instance._id = id
		instance._duration = duration
		instance._nonce = nonce
		instance._flags = flags
		instance._divisibility = divisibility
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._verifiableEntityHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signature.serialize()
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._id.serialize()
		buffer += self._duration.serialize()
		buffer += self._nonce.serialize()
		buffer += self._flags.serialize()
		buffer += (buffer..setInt8(0, self._divisibility.toInt(), Endian.little)).buffer.asUint8List();
		return buffer
	}

	str toString(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'id: {self._id.__str__()}, '
		result += f'duration: {self._duration.__str__()}, '
		result += f'nonce: {self._nonce.__str__()}, '
		result += f'flags: {self._flags.__str__()}, '
		result += f'divisibility: 0x{self._divisibility:X}, '
		result += ')'
		return result
	}
}


class EmbeddedMosaicDefinitionTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.MOSAIC_DEFINITION
	TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'id': 'pod:MosaicId',
		'duration': 'pod:BlockDuration',
		'nonce': 'pod:MosaicNonce',
		'flags': 'enum:MosaicFlags'
	}

	EmbeddedMosaicDefinitionTransactionV1(){
		self._signerPublicKey = PublicKey()
		self._version = EmbeddedMosaicDefinitionTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = EmbeddedMosaicDefinitionTransactionV1.TRANSACTION_TYPE
		self._id = MosaicId()
		self._duration = BlockDuration()
		self._nonce = MosaicNonce()
		self._flags = MosaicFlags.NONE
		self._divisibility = 0
		self._embeddedTransactionHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
	}

	None sort(){
		pass
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	TransactionType type_(){
		return self._type_
	}

	@property
	MosaicId id(){
		return self._id
	}

	@property
	BlockDuration duration(){
		return self._duration
	}

	@property
	MosaicNonce nonce(){
		return self._nonce
	}

	@property
	MosaicFlags flags(){
		return self._flags
	}

	@property
	int divisibility(){
		return self._divisibility
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@id.setter
	id(value: MosaicId){
		self._id = value
	}

	@duration.setter
	duration(value: BlockDuration){
		self._duration = value
	}

	@nonce.setter
	nonce(value: MosaicNonce){
		self._nonce = value
	}

	@flags.setter
	flags(value: MosaicFlags){
		self._flags = value
	}

	@divisibility.setter
	divisibility(value: int){
		self._divisibility = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.id.size
		size += self.duration.size
		size += self.nonce.size
		size += self.flags.size
		size += 1
		return size
	}

	static EmbeddedMosaicDefinitionTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		embeddedTransactionHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert embeddedTransactionHeaderReserved_1 == 0, f'Invalid value of reserved field ({embeddedTransactionHeaderReserved_1})'
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		id = MosaicId.deserialize(buffer)
		buffer = buffer[id.size:]
		duration = BlockDuration.deserialize(buffer)
		buffer = buffer[duration.size:]
		nonce = MosaicNonce.deserialize(buffer)
		buffer = buffer[nonce.size:]
		flags = MosaicFlags.deserialize(buffer)
		buffer = buffer[flags.size:]
		divisibility = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]

		instance = EmbeddedMosaicDefinitionTransactionV1()
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._id = id
		instance._duration = duration
		instance._nonce = nonce
		instance._flags = flags
		instance._divisibility = divisibility
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._embeddedTransactionHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._id.serialize()
		buffer += self._duration.serialize()
		buffer += self._nonce.serialize()
		buffer += self._flags.serialize()
		buffer += (buffer..setInt8(0, self._divisibility.toInt(), Endian.little)).buffer.asUint8List();
		return buffer
	}

	str toString(){
		result = '('
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'id: {self._id.__str__()}, '
		result += f'duration: {self._duration.__str__()}, '
		result += f'nonce: {self._nonce.__str__()}, '
		result += f'flags: {self._flags.__str__()}, '
		result += f'divisibility: 0x{self._divisibility:X}, '
		result += ')'
		return result
	}
}


class MosaicSupplyChangeTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.MOSAIC_SUPPLY_CHANGE
	TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'mosaicId': 'pod:UnresolvedMosaicId',
		'delta': 'pod:Amount',
		'action': 'enum:MosaicSupplyChangeAction'
	}

	MosaicSupplyChangeTransactionV1(){
		self._signature = Signature()
		self._signerPublicKey = PublicKey()
		self._version = MosaicSupplyChangeTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = MosaicSupplyChangeTransactionV1.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._mosaicId = UnresolvedMosaicId()
		self._delta = Amount()
		self._action = MosaicSupplyChangeAction.DECREASE
		self._verifiableEntityHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
	}

	None sort(){
		pass
	}

	@property
	Signature signature(){
		return self._signature
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	TransactionType type_(){
		return self._type_
	}

	@property
	Amount fee(){
		return self._fee
	}

	@property
	Timestamp deadline(){
		return self._deadline
	}

	@property
	UnresolvedMosaicId mosaicId(){
		return self._mosaicId
	}

	@property
	Amount delta(){
		return self._delta
	}

	@property
	MosaicSupplyChangeAction action(){
		return self._action
	}

	@signature.setter
	signature(value: Signature){
		self._signature = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@fee.setter
	fee(value: Amount){
		self._fee = value
	}

	@deadline.setter
	deadline(value: Timestamp){
		self._deadline = value
	}

	@mosaicId.setter
	mosaicId(value: UnresolvedMosaicId){
		self._mosaicId = value
	}

	@delta.setter
	delta(value: Amount){
		self._delta = value
	}

	@action.setter
	action(value: MosaicSupplyChangeAction){
		self._action = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		size += self.mosaicId.size
		size += self.delta.size
		size += self.action.size
		return size
	}

	static MosaicSupplyChangeTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiableEntityHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert verifiableEntityHeaderReserved_1 == 0, f'Invalid value of reserved field ({verifiableEntityHeaderReserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		mosaicId = UnresolvedMosaicId.deserialize(buffer)
		buffer = buffer[mosaicId.size:]
		delta = Amount.deserialize(buffer)
		buffer = buffer[delta.size:]
		action = MosaicSupplyChangeAction.deserialize(buffer)
		buffer = buffer[action.size:]

		instance = MosaicSupplyChangeTransactionV1()
		instance._signature = signature
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		instance._mosaicId = mosaicId
		instance._delta = delta
		instance._action = action
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._verifiableEntityHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signature.serialize()
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._mosaicId.serialize()
		buffer += self._delta.serialize()
		buffer += self._action.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'mosaicId: {self._mosaicId.__str__()}, '
		result += f'delta: {self._delta.__str__()}, '
		result += f'action: {self._action.__str__()}, '
		result += ')'
		return result
	}
}


class EmbeddedMosaicSupplyChangeTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.MOSAIC_SUPPLY_CHANGE
	TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'mosaicId': 'pod:UnresolvedMosaicId',
		'delta': 'pod:Amount',
		'action': 'enum:MosaicSupplyChangeAction'
	}

	EmbeddedMosaicSupplyChangeTransactionV1(){
		self._signerPublicKey = PublicKey()
		self._version = EmbeddedMosaicSupplyChangeTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = EmbeddedMosaicSupplyChangeTransactionV1.TRANSACTION_TYPE
		self._mosaicId = UnresolvedMosaicId()
		self._delta = Amount()
		self._action = MosaicSupplyChangeAction.DECREASE
		self._embeddedTransactionHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
	}

	None sort(){
		pass
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	TransactionType type_(){
		return self._type_
	}

	@property
	UnresolvedMosaicId mosaicId(){
		return self._mosaicId
	}

	@property
	Amount delta(){
		return self._delta
	}

	@property
	MosaicSupplyChangeAction action(){
		return self._action
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@mosaicId.setter
	mosaicId(value: UnresolvedMosaicId){
		self._mosaicId = value
	}

	@delta.setter
	delta(value: Amount){
		self._delta = value
	}

	@action.setter
	action(value: MosaicSupplyChangeAction){
		self._action = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.mosaicId.size
		size += self.delta.size
		size += self.action.size
		return size
	}

	static EmbeddedMosaicSupplyChangeTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		embeddedTransactionHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert embeddedTransactionHeaderReserved_1 == 0, f'Invalid value of reserved field ({embeddedTransactionHeaderReserved_1})'
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		mosaicId = UnresolvedMosaicId.deserialize(buffer)
		buffer = buffer[mosaicId.size:]
		delta = Amount.deserialize(buffer)
		buffer = buffer[delta.size:]
		action = MosaicSupplyChangeAction.deserialize(buffer)
		buffer = buffer[action.size:]

		instance = EmbeddedMosaicSupplyChangeTransactionV1()
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._mosaicId = mosaicId
		instance._delta = delta
		instance._action = action
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._embeddedTransactionHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._mosaicId.serialize()
		buffer += self._delta.serialize()
		buffer += self._action.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'mosaicId: {self._mosaicId.__str__()}, '
		result += f'delta: {self._delta.__str__()}, '
		result += f'action: {self._action.__str__()}, '
		result += ')'
		return result
	}
}


class MosaicSupplyRevocationTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.MOSAIC_SUPPLY_REVOCATION
	TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'sourceAddress': 'pod:UnresolvedAddress',
		'mosaic': 'struct:UnresolvedMosaic'
	}

	MosaicSupplyRevocationTransactionV1(){
		self._signature = Signature()
		self._signerPublicKey = PublicKey()
		self._version = MosaicSupplyRevocationTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = MosaicSupplyRevocationTransactionV1.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._sourceAddress = UnresolvedAddress()
		self._mosaic = UnresolvedMosaic()
		self._verifiableEntityHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
	}

	None sort(){
		self._mosaic.sort()
	}

	@property
	Signature signature(){
		return self._signature
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	TransactionType type_(){
		return self._type_
	}

	@property
	Amount fee(){
		return self._fee
	}

	@property
	Timestamp deadline(){
		return self._deadline
	}

	@property
	UnresolvedAddress sourceAddress(){
		return self._sourceAddress
	}

	@property
	UnresolvedMosaic mosaic(){
		return self._mosaic
	}

	@signature.setter
	signature(value: Signature){
		self._signature = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@fee.setter
	fee(value: Amount){
		self._fee = value
	}

	@deadline.setter
	deadline(value: Timestamp){
		self._deadline = value
	}

	@sourceAddress.setter
	sourceAddress(value: UnresolvedAddress){
		self._sourceAddress = value
	}

	@mosaic.setter
	mosaic(value: UnresolvedMosaic){
		self._mosaic = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		size += self.sourceAddress.size
		size += self.mosaic.size
		return size
	}

	static MosaicSupplyRevocationTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiableEntityHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert verifiableEntityHeaderReserved_1 == 0, f'Invalid value of reserved field ({verifiableEntityHeaderReserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		sourceAddress = UnresolvedAddress.deserialize(buffer)
		buffer = buffer[sourceAddress.size:]
		mosaic = UnresolvedMosaic.deserialize(buffer)
		buffer = buffer[mosaic.size:]

		instance = MosaicSupplyRevocationTransactionV1()
		instance._signature = signature
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		instance._sourceAddress = sourceAddress
		instance._mosaic = mosaic
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._verifiableEntityHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signature.serialize()
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._sourceAddress.serialize()
		buffer += self._mosaic.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'sourceAddress: {self._sourceAddress.__str__()}, '
		result += f'mosaic: {self._mosaic.__str__()}, '
		result += ')'
		return result
	}
}


class EmbeddedMosaicSupplyRevocationTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.MOSAIC_SUPPLY_REVOCATION
	TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'sourceAddress': 'pod:UnresolvedAddress',
		'mosaic': 'struct:UnresolvedMosaic'
	}

	EmbeddedMosaicSupplyRevocationTransactionV1(){
		self._signerPublicKey = PublicKey()
		self._version = EmbeddedMosaicSupplyRevocationTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = EmbeddedMosaicSupplyRevocationTransactionV1.TRANSACTION_TYPE
		self._sourceAddress = UnresolvedAddress()
		self._mosaic = UnresolvedMosaic()
		self._embeddedTransactionHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
	}

	None sort(){
		self._mosaic.sort()
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	TransactionType type_(){
		return self._type_
	}

	@property
	UnresolvedAddress sourceAddress(){
		return self._sourceAddress
	}

	@property
	UnresolvedMosaic mosaic(){
		return self._mosaic
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@sourceAddress.setter
	sourceAddress(value: UnresolvedAddress){
		self._sourceAddress = value
	}

	@mosaic.setter
	mosaic(value: UnresolvedMosaic){
		self._mosaic = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.sourceAddress.size
		size += self.mosaic.size
		return size
	}

	static EmbeddedMosaicSupplyRevocationTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		embeddedTransactionHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert embeddedTransactionHeaderReserved_1 == 0, f'Invalid value of reserved field ({embeddedTransactionHeaderReserved_1})'
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		sourceAddress = UnresolvedAddress.deserialize(buffer)
		buffer = buffer[sourceAddress.size:]
		mosaic = UnresolvedMosaic.deserialize(buffer)
		buffer = buffer[mosaic.size:]

		instance = EmbeddedMosaicSupplyRevocationTransactionV1()
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._sourceAddress = sourceAddress
		instance._mosaic = mosaic
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._embeddedTransactionHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._sourceAddress.serialize()
		buffer += self._mosaic.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'sourceAddress: {self._sourceAddress.__str__()}, '
		result += f'mosaic: {self._mosaic.__str__()}, '
		result += ')'
		return result
	}
}


class MultisigAccountModificationTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.MULTISIG_ACCOUNT_MODIFICATION
	TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'addressAdditions': 'array[UnresolvedAddress]',
		'addressDeletions': 'array[UnresolvedAddress]'
	}

	MultisigAccountModificationTransactionV1(){
		self._signature = Signature()
		self._signerPublicKey = PublicKey()
		self._version = MultisigAccountModificationTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = MultisigAccountModificationTransactionV1.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._minRemovalDelta = 0
		self._minApprovalDelta = 0
		self._addressAdditions = []
		self._addressDeletions = []
		self._verifiableEntityHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
		self._multisigAccountModificationTransactionBodyReserved_1 = 0  # reserved field
	}

	None sort(){
		pass
	}

	@property
	Signature signature(){
		return self._signature
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	TransactionType type_(){
		return self._type_
	}

	@property
	Amount fee(){
		return self._fee
	}

	@property
	Timestamp deadline(){
		return self._deadline
	}

	@property
	int minRemovalDelta(){
		return self._minRemovalDelta
	}

	@property
	int minApprovalDelta(){
		return self._minApprovalDelta
	}

	@property
	List[UnresolvedAddress] addressAdditions(){
		return self._addressAdditions
	}

	@property
	List[UnresolvedAddress] addressDeletions(){
		return self._addressDeletions
	}

	@signature.setter
	signature(value: Signature){
		self._signature = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@fee.setter
	fee(value: Amount){
		self._fee = value
	}

	@deadline.setter
	deadline(value: Timestamp){
		self._deadline = value
	}

	@minRemovalDelta.setter
	minRemovalDelta(value: int){
		self._minRemovalDelta = value
	}

	@minApprovalDelta.setter
	minApprovalDelta(value: int){
		self._minApprovalDelta = value
	}

	@addressAdditions.setter
	addressAdditions(value: List[UnresolvedAddress]){
		self._addressAdditions = value
	}

	@addressDeletions.setter
	addressDeletions(value: List[UnresolvedAddress]){
		self._addressDeletions = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		size += 1
		size += 1
		size += 1
		size += 1
		size += 4
		size += ArrayHelpers.size(self.addressAdditions)
		size += ArrayHelpers.size(self.addressDeletions)
		return size
	}

	static MultisigAccountModificationTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiableEntityHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert verifiableEntityHeaderReserved_1 == 0, f'Invalid value of reserved field ({verifiableEntityHeaderReserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		minRemovalDelta = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		minApprovalDelta = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		addressAdditionsCount = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		addressDeletionsCount = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		multisigAccountModificationTransactionBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert multisigAccountModificationTransactionBodyReserved_1 == 0, f'Invalid value of reserved field ({multisigAccountModificationTransactionBodyReserved_1})'
		addressAdditions = ArrayHelpers.read_array_count(buffer, UnresolvedAddress, address_additions_count)
		buffer = buffer[ArrayHelpers.size(addressAdditions):]
		addressDeletions = ArrayHelpers.read_array_count(buffer, UnresolvedAddress, address_deletions_count)
		buffer = buffer[ArrayHelpers.size(addressDeletions):]

		instance = MultisigAccountModificationTransactionV1()
		instance._signature = signature
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		instance._minRemovalDelta = minRemovalDelta
		instance._minApprovalDelta = minApprovalDelta
		instance._addressAdditions = addressAdditions
		instance._addressDeletions = addressDeletions
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._verifiableEntityHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signature.serialize()
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += (buffer..setInt8(0, self._minRemovalDelta.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._minApprovalDelta.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, len(self._addressAdditions).toInt(), Endian.little)).buffer.asUint8List();  # address_additions_count
		buffer += (buffer..setInt8(0, len(self._addressDeletions).toInt(), Endian.little)).buffer.asUint8List();  # address_deletions_count
		buffer += (buffer..setInt32(0, self._multisigAccountModificationTransactionBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += ArrayHelpers.write_array(self._addressAdditions)
		buffer += ArrayHelpers.write_array(self._addressDeletions)
		return buffer
	}

	str toString(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'minRemovalDelta: 0x{self._minRemovalDelta:X}, '
		result += f'minApprovalDelta: 0x{self._minApprovalDelta:X}, '
		result += f'addressAdditions: {list(map(str, self._addressAdditions))}, '
		result += f'addressDeletions: {list(map(str, self._addressDeletions))}, '
		result += ')'
		return result
	}
}


class EmbeddedMultisigAccountModificationTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.MULTISIG_ACCOUNT_MODIFICATION
	TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'addressAdditions': 'array[UnresolvedAddress]',
		'addressDeletions': 'array[UnresolvedAddress]'
	}

	EmbeddedMultisigAccountModificationTransactionV1(){
		self._signerPublicKey = PublicKey()
		self._version = EmbeddedMultisigAccountModificationTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = EmbeddedMultisigAccountModificationTransactionV1.TRANSACTION_TYPE
		self._minRemovalDelta = 0
		self._minApprovalDelta = 0
		self._addressAdditions = []
		self._addressDeletions = []
		self._embeddedTransactionHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
		self._multisigAccountModificationTransactionBodyReserved_1 = 0  # reserved field
	}

	None sort(){
		pass
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	TransactionType type_(){
		return self._type_
	}

	@property
	int minRemovalDelta(){
		return self._minRemovalDelta
	}

	@property
	int minApprovalDelta(){
		return self._minApprovalDelta
	}

	@property
	List[UnresolvedAddress] addressAdditions(){
		return self._addressAdditions
	}

	@property
	List[UnresolvedAddress] addressDeletions(){
		return self._addressDeletions
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@minRemovalDelta.setter
	minRemovalDelta(value: int){
		self._minRemovalDelta = value
	}

	@minApprovalDelta.setter
	minApprovalDelta(value: int){
		self._minApprovalDelta = value
	}

	@addressAdditions.setter
	addressAdditions(value: List[UnresolvedAddress]){
		self._addressAdditions = value
	}

	@addressDeletions.setter
	addressDeletions(value: List[UnresolvedAddress]){
		self._addressDeletions = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += 1
		size += 1
		size += 1
		size += 1
		size += 4
		size += ArrayHelpers.size(self.addressAdditions)
		size += ArrayHelpers.size(self.addressDeletions)
		return size
	}

	static EmbeddedMultisigAccountModificationTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		embeddedTransactionHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert embeddedTransactionHeaderReserved_1 == 0, f'Invalid value of reserved field ({embeddedTransactionHeaderReserved_1})'
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		minRemovalDelta = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		minApprovalDelta = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		addressAdditionsCount = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		addressDeletionsCount = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		multisigAccountModificationTransactionBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert multisigAccountModificationTransactionBodyReserved_1 == 0, f'Invalid value of reserved field ({multisigAccountModificationTransactionBodyReserved_1})'
		addressAdditions = ArrayHelpers.read_array_count(buffer, UnresolvedAddress, address_additions_count)
		buffer = buffer[ArrayHelpers.size(addressAdditions):]
		addressDeletions = ArrayHelpers.read_array_count(buffer, UnresolvedAddress, address_deletions_count)
		buffer = buffer[ArrayHelpers.size(addressDeletions):]

		instance = EmbeddedMultisigAccountModificationTransactionV1()
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._minRemovalDelta = minRemovalDelta
		instance._minApprovalDelta = minApprovalDelta
		instance._addressAdditions = addressAdditions
		instance._addressDeletions = addressDeletions
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._embeddedTransactionHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += (buffer..setInt8(0, self._minRemovalDelta.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._minApprovalDelta.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, len(self._addressAdditions).toInt(), Endian.little)).buffer.asUint8List();  # address_additions_count
		buffer += (buffer..setInt8(0, len(self._addressDeletions).toInt(), Endian.little)).buffer.asUint8List();  # address_deletions_count
		buffer += (buffer..setInt32(0, self._multisigAccountModificationTransactionBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += ArrayHelpers.write_array(self._addressAdditions)
		buffer += ArrayHelpers.write_array(self._addressDeletions)
		return buffer
	}

	str toString(){
		result = '('
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'minRemovalDelta: 0x{self._minRemovalDelta:X}, '
		result += f'minApprovalDelta: 0x{self._minApprovalDelta:X}, '
		result += f'addressAdditions: {list(map(str, self._addressAdditions))}, '
		result += f'addressDeletions: {list(map(str, self._addressDeletions))}, '
		result += ')'
		return result
	}
}


class AddressAliasTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.ADDRESS_ALIAS
	TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'namespaceId': 'pod:NamespaceId',
		'address': 'pod:Address',
		'aliasAction': 'enum:AliasAction'
	}

	AddressAliasTransactionV1(){
		self._signature = Signature()
		self._signerPublicKey = PublicKey()
		self._version = AddressAliasTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = AddressAliasTransactionV1.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._namespaceId = NamespaceId()
		self._address = Address()
		self._aliasAction = AliasAction.UNLINK
		self._verifiableEntityHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
	}

	None sort(){
		pass
	}

	@property
	Signature signature(){
		return self._signature
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	TransactionType type_(){
		return self._type_
	}

	@property
	Amount fee(){
		return self._fee
	}

	@property
	Timestamp deadline(){
		return self._deadline
	}

	@property
	NamespaceId namespaceId(){
		return self._namespaceId
	}

	@property
	Address address(){
		return self._address
	}

	@property
	AliasAction aliasAction(){
		return self._aliasAction
	}

	@signature.setter
	signature(value: Signature){
		self._signature = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@fee.setter
	fee(value: Amount){
		self._fee = value
	}

	@deadline.setter
	deadline(value: Timestamp){
		self._deadline = value
	}

	@namespaceId.setter
	namespaceId(value: NamespaceId){
		self._namespaceId = value
	}

	@address.setter
	address(value: Address){
		self._address = value
	}

	@aliasAction.setter
	aliasAction(value: AliasAction){
		self._aliasAction = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		size += self.namespaceId.size
		size += self.address.size
		size += self.aliasAction.size
		return size
	}

	static AddressAliasTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiableEntityHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert verifiableEntityHeaderReserved_1 == 0, f'Invalid value of reserved field ({verifiableEntityHeaderReserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		namespaceId = NamespaceId.deserialize(buffer)
		buffer = buffer[namespaceId.size:]
		address = Address.deserialize(buffer)
		buffer = buffer[address.size:]
		aliasAction = AliasAction.deserialize(buffer)
		buffer = buffer[aliasAction.size:]

		instance = AddressAliasTransactionV1()
		instance._signature = signature
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		instance._namespaceId = namespaceId
		instance._address = address
		instance._aliasAction = aliasAction
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._verifiableEntityHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signature.serialize()
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._namespaceId.serialize()
		buffer += self._address.serialize()
		buffer += self._aliasAction.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'namespaceId: {self._namespaceId.__str__()}, '
		result += f'address: {self._address.__str__()}, '
		result += f'aliasAction: {self._aliasAction.__str__()}, '
		result += ')'
		return result
	}
}


class EmbeddedAddressAliasTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.ADDRESS_ALIAS
	TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'namespaceId': 'pod:NamespaceId',
		'address': 'pod:Address',
		'aliasAction': 'enum:AliasAction'
	}

	EmbeddedAddressAliasTransactionV1(){
		self._signerPublicKey = PublicKey()
		self._version = EmbeddedAddressAliasTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = EmbeddedAddressAliasTransactionV1.TRANSACTION_TYPE
		self._namespaceId = NamespaceId()
		self._address = Address()
		self._aliasAction = AliasAction.UNLINK
		self._embeddedTransactionHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
	}

	None sort(){
		pass
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	TransactionType type_(){
		return self._type_
	}

	@property
	NamespaceId namespaceId(){
		return self._namespaceId
	}

	@property
	Address address(){
		return self._address
	}

	@property
	AliasAction aliasAction(){
		return self._aliasAction
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@namespaceId.setter
	namespaceId(value: NamespaceId){
		self._namespaceId = value
	}

	@address.setter
	address(value: Address){
		self._address = value
	}

	@aliasAction.setter
	aliasAction(value: AliasAction){
		self._aliasAction = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.namespaceId.size
		size += self.address.size
		size += self.aliasAction.size
		return size
	}

	static EmbeddedAddressAliasTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		embeddedTransactionHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert embeddedTransactionHeaderReserved_1 == 0, f'Invalid value of reserved field ({embeddedTransactionHeaderReserved_1})'
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		namespaceId = NamespaceId.deserialize(buffer)
		buffer = buffer[namespaceId.size:]
		address = Address.deserialize(buffer)
		buffer = buffer[address.size:]
		aliasAction = AliasAction.deserialize(buffer)
		buffer = buffer[aliasAction.size:]

		instance = EmbeddedAddressAliasTransactionV1()
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._namespaceId = namespaceId
		instance._address = address
		instance._aliasAction = aliasAction
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._embeddedTransactionHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._namespaceId.serialize()
		buffer += self._address.serialize()
		buffer += self._aliasAction.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'namespaceId: {self._namespaceId.__str__()}, '
		result += f'address: {self._address.__str__()}, '
		result += f'aliasAction: {self._aliasAction.__str__()}, '
		result += ')'
		return result
	}
}


class MosaicAliasTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.MOSAIC_ALIAS
	TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'namespaceId': 'pod:NamespaceId',
		'mosaicId': 'pod:MosaicId',
		'aliasAction': 'enum:AliasAction'
	}

	MosaicAliasTransactionV1(){
		self._signature = Signature()
		self._signerPublicKey = PublicKey()
		self._version = MosaicAliasTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = MosaicAliasTransactionV1.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._namespaceId = NamespaceId()
		self._mosaicId = MosaicId()
		self._aliasAction = AliasAction.UNLINK
		self._verifiableEntityHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
	}

	None sort(){
		pass
	}

	@property
	Signature signature(){
		return self._signature
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	TransactionType type_(){
		return self._type_
	}

	@property
	Amount fee(){
		return self._fee
	}

	@property
	Timestamp deadline(){
		return self._deadline
	}

	@property
	NamespaceId namespaceId(){
		return self._namespaceId
	}

	@property
	MosaicId mosaicId(){
		return self._mosaicId
	}

	@property
	AliasAction aliasAction(){
		return self._aliasAction
	}

	@signature.setter
	signature(value: Signature){
		self._signature = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@fee.setter
	fee(value: Amount){
		self._fee = value
	}

	@deadline.setter
	deadline(value: Timestamp){
		self._deadline = value
	}

	@namespaceId.setter
	namespaceId(value: NamespaceId){
		self._namespaceId = value
	}

	@mosaicId.setter
	mosaicId(value: MosaicId){
		self._mosaicId = value
	}

	@aliasAction.setter
	aliasAction(value: AliasAction){
		self._aliasAction = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		size += self.namespaceId.size
		size += self.mosaicId.size
		size += self.aliasAction.size
		return size
	}

	static MosaicAliasTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiableEntityHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert verifiableEntityHeaderReserved_1 == 0, f'Invalid value of reserved field ({verifiableEntityHeaderReserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		namespaceId = NamespaceId.deserialize(buffer)
		buffer = buffer[namespaceId.size:]
		mosaicId = MosaicId.deserialize(buffer)
		buffer = buffer[mosaicId.size:]
		aliasAction = AliasAction.deserialize(buffer)
		buffer = buffer[aliasAction.size:]

		instance = MosaicAliasTransactionV1()
		instance._signature = signature
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		instance._namespaceId = namespaceId
		instance._mosaicId = mosaicId
		instance._aliasAction = aliasAction
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._verifiableEntityHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signature.serialize()
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._namespaceId.serialize()
		buffer += self._mosaicId.serialize()
		buffer += self._aliasAction.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'namespaceId: {self._namespaceId.__str__()}, '
		result += f'mosaicId: {self._mosaicId.__str__()}, '
		result += f'aliasAction: {self._aliasAction.__str__()}, '
		result += ')'
		return result
	}
}


class EmbeddedMosaicAliasTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.MOSAIC_ALIAS
	TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'namespaceId': 'pod:NamespaceId',
		'mosaicId': 'pod:MosaicId',
		'aliasAction': 'enum:AliasAction'
	}

	EmbeddedMosaicAliasTransactionV1(){
		self._signerPublicKey = PublicKey()
		self._version = EmbeddedMosaicAliasTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = EmbeddedMosaicAliasTransactionV1.TRANSACTION_TYPE
		self._namespaceId = NamespaceId()
		self._mosaicId = MosaicId()
		self._aliasAction = AliasAction.UNLINK
		self._embeddedTransactionHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
	}

	None sort(){
		pass
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	TransactionType type_(){
		return self._type_
	}

	@property
	NamespaceId namespaceId(){
		return self._namespaceId
	}

	@property
	MosaicId mosaicId(){
		return self._mosaicId
	}

	@property
	AliasAction aliasAction(){
		return self._aliasAction
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@namespaceId.setter
	namespaceId(value: NamespaceId){
		self._namespaceId = value
	}

	@mosaicId.setter
	mosaicId(value: MosaicId){
		self._mosaicId = value
	}

	@aliasAction.setter
	aliasAction(value: AliasAction){
		self._aliasAction = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.namespaceId.size
		size += self.mosaicId.size
		size += self.aliasAction.size
		return size
	}

	static EmbeddedMosaicAliasTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		embeddedTransactionHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert embeddedTransactionHeaderReserved_1 == 0, f'Invalid value of reserved field ({embeddedTransactionHeaderReserved_1})'
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		namespaceId = NamespaceId.deserialize(buffer)
		buffer = buffer[namespaceId.size:]
		mosaicId = MosaicId.deserialize(buffer)
		buffer = buffer[mosaicId.size:]
		aliasAction = AliasAction.deserialize(buffer)
		buffer = buffer[aliasAction.size:]

		instance = EmbeddedMosaicAliasTransactionV1()
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._namespaceId = namespaceId
		instance._mosaicId = mosaicId
		instance._aliasAction = aliasAction
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._embeddedTransactionHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._namespaceId.serialize()
		buffer += self._mosaicId.serialize()
		buffer += self._aliasAction.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'namespaceId: {self._namespaceId.__str__()}, '
		result += f'mosaicId: {self._mosaicId.__str__()}, '
		result += f'aliasAction: {self._aliasAction.__str__()}, '
		result += ')'
		return result
	}
}


class NamespaceRegistrationTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.NAMESPACE_REGISTRATION
	TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'duration': 'pod:BlockDuration',
		'parentId': 'pod:NamespaceId',
		'id': 'pod:NamespaceId',
		'registrationType': 'enum:NamespaceRegistrationType',
		'name': 'bytes_array'
	}

	NamespaceRegistrationTransactionV1(){
		self._signature = Signature()
		self._signerPublicKey = PublicKey()
		self._version = NamespaceRegistrationTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = NamespaceRegistrationTransactionV1.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._duration = BlockDuration()
		self._parentId = None
		self._id = NamespaceId()
		self._registrationType = NamespaceRegistrationType.ROOT
		self._name = Uint8List()
		self._verifiableEntityHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
	}

	None sort(){
		pass
	}

	@property
	Signature signature(){
		return self._signature
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	TransactionType type_(){
		return self._type_
	}

	@property
	Amount fee(){
		return self._fee
	}

	@property
	Timestamp deadline(){
		return self._deadline
	}

	@property
	BlockDuration duration(){
		return self._duration
	}

	@property
	NamespaceId parentId(){
		return self._parentId
	}

	@property
	NamespaceId id(){
		return self._id
	}

	@property
	NamespaceRegistrationType registrationType(){
		return self._registrationType
	}

	@property
	bytes name(){
		return self._name
	}

	@signature.setter
	signature(value: Signature){
		self._signature = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@fee.setter
	fee(value: Amount){
		self._fee = value
	}

	@deadline.setter
	deadline(value: Timestamp){
		self._deadline = value
	}

	@duration.setter
	duration(value: BlockDuration){
		self._duration = value
	}

	@parentId.setter
	parentId(value: NamespaceId){
		self._parentId = value
	}

	@id.setter
	id(value: NamespaceId){
		self._id = value
	}

	@registrationType.setter
	registrationType(value: NamespaceRegistrationType){
		self._registrationType = value
	}

	@name.setter
	name(value: bytes){
		self._name = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		if NamespaceRegistrationType.ROOT == self.registration_type:
			size += self.duration.size
		if NamespaceRegistrationType.CHILD == self.registration_type:
			size += self.parentId.size
		size += self.id.size
		size += self.registrationType.size
		size += 1
		size += len(self._name)
		return size
	}

	static NamespaceRegistrationTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiableEntityHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert verifiableEntityHeaderReserved_1 == 0, f'Invalid value of reserved field ({verifiableEntityHeaderReserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		# deserialize to temporary buffer for further processing
		duration_temporary = BlockDuration.deserialize(buffer)
		registration_type_condition = buffer[:duration_temporary.size]
		buffer = buffer[duration_temporary.size:]

		id = NamespaceId.deserialize(buffer)
		buffer = buffer[id.size:]
		registrationType = NamespaceRegistrationType.deserialize(buffer)
		buffer = buffer[registrationType.size:]
		duration = None
		if NamespaceRegistrationType.ROOT == registration_type:
			duration = BlockDuration.deserialize(registration_type_condition)
			registration_type_condition = registration_type_condition[duration.size:]
		parentId = None
		if NamespaceRegistrationType.CHILD == registration_type:
			parentId = NamespaceId.deserialize(registration_type_condition)
			registration_type_condition = registration_type_condition[parentId.size:]
		nameSize = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		name = Uint8List.fromList(payload)
		buffer = buffer[name_size:]

		instance = NamespaceRegistrationTransactionV1()
		instance._signature = signature
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		instance._duration = duration
		instance._parentId = parentId
		instance._id = id
		instance._registrationType = registrationType
		instance._name = name
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._verifiableEntityHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signature.serialize()
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		if NamespaceRegistrationType.ROOT == self.registration_type:
			buffer += self._duration.serialize()
		if NamespaceRegistrationType.CHILD == self.registration_type:
			buffer += self._parentId.serialize()
		buffer += self._id.serialize()
		buffer += self._registrationType.serialize()
		buffer += (buffer..setInt8(0, len(self._name).toInt(), Endian.little)).buffer.asUint8List();  # name_size
		buffer += self._name
		return buffer
	}

	str toString(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		if NamespaceRegistrationType.ROOT == self.registration_type:
			result += f'duration: {self._duration.__str__()}, '
		if NamespaceRegistrationType.CHILD == self.registration_type:
			result += f'parentId: {self._parentId.__str__()}, '
		result += f'id: {self._id.__str__()}, '
		result += f'registrationType: {self._registrationType.__str__()}, '
		result += f'name: {hexlify(self._name).decode("utf8")}, '
		result += ')'
		return result
	}
}


class EmbeddedNamespaceRegistrationTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.NAMESPACE_REGISTRATION
	TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'duration': 'pod:BlockDuration',
		'parentId': 'pod:NamespaceId',
		'id': 'pod:NamespaceId',
		'registrationType': 'enum:NamespaceRegistrationType',
		'name': 'bytes_array'
	}

	EmbeddedNamespaceRegistrationTransactionV1(){
		self._signerPublicKey = PublicKey()
		self._version = EmbeddedNamespaceRegistrationTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = EmbeddedNamespaceRegistrationTransactionV1.TRANSACTION_TYPE
		self._duration = BlockDuration()
		self._parentId = None
		self._id = NamespaceId()
		self._registrationType = NamespaceRegistrationType.ROOT
		self._name = Uint8List()
		self._embeddedTransactionHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
	}

	None sort(){
		pass
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	TransactionType type_(){
		return self._type_
	}

	@property
	BlockDuration duration(){
		return self._duration
	}

	@property
	NamespaceId parentId(){
		return self._parentId
	}

	@property
	NamespaceId id(){
		return self._id
	}

	@property
	NamespaceRegistrationType registrationType(){
		return self._registrationType
	}

	@property
	bytes name(){
		return self._name
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@duration.setter
	duration(value: BlockDuration){
		self._duration = value
	}

	@parentId.setter
	parentId(value: NamespaceId){
		self._parentId = value
	}

	@id.setter
	id(value: NamespaceId){
		self._id = value
	}

	@registrationType.setter
	registrationType(value: NamespaceRegistrationType){
		self._registrationType = value
	}

	@name.setter
	name(value: bytes){
		self._name = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		if NamespaceRegistrationType.ROOT == self.registration_type:
			size += self.duration.size
		if NamespaceRegistrationType.CHILD == self.registration_type:
			size += self.parentId.size
		size += self.id.size
		size += self.registrationType.size
		size += 1
		size += len(self._name)
		return size
	}

	static EmbeddedNamespaceRegistrationTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		embeddedTransactionHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert embeddedTransactionHeaderReserved_1 == 0, f'Invalid value of reserved field ({embeddedTransactionHeaderReserved_1})'
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		# deserialize to temporary buffer for further processing
		duration_temporary = BlockDuration.deserialize(buffer)
		registration_type_condition = buffer[:duration_temporary.size]
		buffer = buffer[duration_temporary.size:]

		id = NamespaceId.deserialize(buffer)
		buffer = buffer[id.size:]
		registrationType = NamespaceRegistrationType.deserialize(buffer)
		buffer = buffer[registrationType.size:]
		duration = None
		if NamespaceRegistrationType.ROOT == registration_type:
			duration = BlockDuration.deserialize(registration_type_condition)
			registration_type_condition = registration_type_condition[duration.size:]
		parentId = None
		if NamespaceRegistrationType.CHILD == registration_type:
			parentId = NamespaceId.deserialize(registration_type_condition)
			registration_type_condition = registration_type_condition[parentId.size:]
		nameSize = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		name = Uint8List.fromList(payload)
		buffer = buffer[name_size:]

		instance = EmbeddedNamespaceRegistrationTransactionV1()
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._duration = duration
		instance._parentId = parentId
		instance._id = id
		instance._registrationType = registrationType
		instance._name = name
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._embeddedTransactionHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		if NamespaceRegistrationType.ROOT == self.registration_type:
			buffer += self._duration.serialize()
		if NamespaceRegistrationType.CHILD == self.registration_type:
			buffer += self._parentId.serialize()
		buffer += self._id.serialize()
		buffer += self._registrationType.serialize()
		buffer += (buffer..setInt8(0, len(self._name).toInt(), Endian.little)).buffer.asUint8List();  # name_size
		buffer += self._name
		return buffer
	}

	str toString(){
		result = '('
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		if NamespaceRegistrationType.ROOT == self.registration_type:
			result += f'duration: {self._duration.__str__()}, '
		if NamespaceRegistrationType.CHILD == self.registration_type:
			result += f'parentId: {self._parentId.__str__()}, '
		result += f'id: {self._id.__str__()}, '
		result += f'registrationType: {self._registrationType.__str__()}, '
		result += f'name: {hexlify(self._name).decode("utf8")}, '
		result += ')'
		return result
	}
}


class AccountRestrictionFlags extends (Flag) {
	ADDRESS = 1
	MOSAIC_ID = 2
	TRANSACTION_TYPE = 4
	OUTGOING = 16384
	BLOCK = 32768

	int get size(){
		return 2
	}

	static AccountRestrictionFlags deserialize(Uint8List payload){
		buffer = memoryview(payload)
		return AccountRestrictionFlags(BigInt.from(buffer.getInt16(0, Endian.little)))
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += (buffer..setInt16(0, self.value.toInt(), Endian.little)).buffer.asUint8List();
		return buffer
	}
}


class AccountAddressRestrictionTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.ACCOUNT_ADDRESS_RESTRICTION
	TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'restrictionFlags': 'enum:AccountRestrictionFlags',
		'restrictionAdditions': 'array[UnresolvedAddress]',
		'restrictionDeletions': 'array[UnresolvedAddress]'
	}

	AccountAddressRestrictionTransactionV1(){
		self._signature = Signature()
		self._signerPublicKey = PublicKey()
		self._version = AccountAddressRestrictionTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = AccountAddressRestrictionTransactionV1.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._restrictionFlags = AccountRestrictionFlags.ADDRESS
		self._restrictionAdditions = []
		self._restrictionDeletions = []
		self._verifiableEntityHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
		self._accountRestrictionTransactionBodyReserved_1 = 0  # reserved field
	}

	None sort(){
		pass
	}

	@property
	Signature signature(){
		return self._signature
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	TransactionType type_(){
		return self._type_
	}

	@property
	Amount fee(){
		return self._fee
	}

	@property
	Timestamp deadline(){
		return self._deadline
	}

	@property
	AccountRestrictionFlags restrictionFlags(){
		return self._restrictionFlags
	}

	@property
	List[UnresolvedAddress] restrictionAdditions(){
		return self._restrictionAdditions
	}

	@property
	List[UnresolvedAddress] restrictionDeletions(){
		return self._restrictionDeletions
	}

	@signature.setter
	signature(value: Signature){
		self._signature = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@fee.setter
	fee(value: Amount){
		self._fee = value
	}

	@deadline.setter
	deadline(value: Timestamp){
		self._deadline = value
	}

	@restrictionFlags.setter
	restrictionFlags(value: AccountRestrictionFlags){
		self._restrictionFlags = value
	}

	@restrictionAdditions.setter
	restrictionAdditions(value: List[UnresolvedAddress]){
		self._restrictionAdditions = value
	}

	@restrictionDeletions.setter
	restrictionDeletions(value: List[UnresolvedAddress]){
		self._restrictionDeletions = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		size += self.restrictionFlags.size
		size += 1
		size += 1
		size += 4
		size += ArrayHelpers.size(self.restrictionAdditions)
		size += ArrayHelpers.size(self.restrictionDeletions)
		return size
	}

	static AccountAddressRestrictionTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiableEntityHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert verifiableEntityHeaderReserved_1 == 0, f'Invalid value of reserved field ({verifiableEntityHeaderReserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		restrictionFlags = AccountRestrictionFlags.deserialize(buffer)
		buffer = buffer[restrictionFlags.size:]
		restrictionAdditionsCount = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		restrictionDeletionsCount = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		accountRestrictionTransactionBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert accountRestrictionTransactionBodyReserved_1 == 0, f'Invalid value of reserved field ({accountRestrictionTransactionBodyReserved_1})'
		restrictionAdditions = ArrayHelpers.read_array_count(buffer, UnresolvedAddress, restriction_additions_count)
		buffer = buffer[ArrayHelpers.size(restrictionAdditions):]
		restrictionDeletions = ArrayHelpers.read_array_count(buffer, UnresolvedAddress, restriction_deletions_count)
		buffer = buffer[ArrayHelpers.size(restrictionDeletions):]

		instance = AccountAddressRestrictionTransactionV1()
		instance._signature = signature
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		instance._restrictionFlags = restrictionFlags
		instance._restrictionAdditions = restrictionAdditions
		instance._restrictionDeletions = restrictionDeletions
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._verifiableEntityHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signature.serialize()
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._restrictionFlags.serialize()
		buffer += (buffer..setInt8(0, len(self._restrictionAdditions).toInt(), Endian.little)).buffer.asUint8List();  # restriction_additions_count
		buffer += (buffer..setInt8(0, len(self._restrictionDeletions).toInt(), Endian.little)).buffer.asUint8List();  # restriction_deletions_count
		buffer += (buffer..setInt32(0, self._accountRestrictionTransactionBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += ArrayHelpers.write_array(self._restrictionAdditions)
		buffer += ArrayHelpers.write_array(self._restrictionDeletions)
		return buffer
	}

	str toString(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'restrictionFlags: {self._restrictionFlags.__str__()}, '
		result += f'restrictionAdditions: {list(map(str, self._restrictionAdditions))}, '
		result += f'restrictionDeletions: {list(map(str, self._restrictionDeletions))}, '
		result += ')'
		return result
	}
}


class EmbeddedAccountAddressRestrictionTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.ACCOUNT_ADDRESS_RESTRICTION
	TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'restrictionFlags': 'enum:AccountRestrictionFlags',
		'restrictionAdditions': 'array[UnresolvedAddress]',
		'restrictionDeletions': 'array[UnresolvedAddress]'
	}

	EmbeddedAccountAddressRestrictionTransactionV1(){
		self._signerPublicKey = PublicKey()
		self._version = EmbeddedAccountAddressRestrictionTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = EmbeddedAccountAddressRestrictionTransactionV1.TRANSACTION_TYPE
		self._restrictionFlags = AccountRestrictionFlags.ADDRESS
		self._restrictionAdditions = []
		self._restrictionDeletions = []
		self._embeddedTransactionHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
		self._accountRestrictionTransactionBodyReserved_1 = 0  # reserved field
	}

	None sort(){
		pass
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	TransactionType type_(){
		return self._type_
	}

	@property
	AccountRestrictionFlags restrictionFlags(){
		return self._restrictionFlags
	}

	@property
	List[UnresolvedAddress] restrictionAdditions(){
		return self._restrictionAdditions
	}

	@property
	List[UnresolvedAddress] restrictionDeletions(){
		return self._restrictionDeletions
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@restrictionFlags.setter
	restrictionFlags(value: AccountRestrictionFlags){
		self._restrictionFlags = value
	}

	@restrictionAdditions.setter
	restrictionAdditions(value: List[UnresolvedAddress]){
		self._restrictionAdditions = value
	}

	@restrictionDeletions.setter
	restrictionDeletions(value: List[UnresolvedAddress]){
		self._restrictionDeletions = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.restrictionFlags.size
		size += 1
		size += 1
		size += 4
		size += ArrayHelpers.size(self.restrictionAdditions)
		size += ArrayHelpers.size(self.restrictionDeletions)
		return size
	}

	static EmbeddedAccountAddressRestrictionTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		embeddedTransactionHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert embeddedTransactionHeaderReserved_1 == 0, f'Invalid value of reserved field ({embeddedTransactionHeaderReserved_1})'
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		restrictionFlags = AccountRestrictionFlags.deserialize(buffer)
		buffer = buffer[restrictionFlags.size:]
		restrictionAdditionsCount = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		restrictionDeletionsCount = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		accountRestrictionTransactionBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert accountRestrictionTransactionBodyReserved_1 == 0, f'Invalid value of reserved field ({accountRestrictionTransactionBodyReserved_1})'
		restrictionAdditions = ArrayHelpers.read_array_count(buffer, UnresolvedAddress, restriction_additions_count)
		buffer = buffer[ArrayHelpers.size(restrictionAdditions):]
		restrictionDeletions = ArrayHelpers.read_array_count(buffer, UnresolvedAddress, restriction_deletions_count)
		buffer = buffer[ArrayHelpers.size(restrictionDeletions):]

		instance = EmbeddedAccountAddressRestrictionTransactionV1()
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._restrictionFlags = restrictionFlags
		instance._restrictionAdditions = restrictionAdditions
		instance._restrictionDeletions = restrictionDeletions
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._embeddedTransactionHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._restrictionFlags.serialize()
		buffer += (buffer..setInt8(0, len(self._restrictionAdditions).toInt(), Endian.little)).buffer.asUint8List();  # restriction_additions_count
		buffer += (buffer..setInt8(0, len(self._restrictionDeletions).toInt(), Endian.little)).buffer.asUint8List();  # restriction_deletions_count
		buffer += (buffer..setInt32(0, self._accountRestrictionTransactionBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += ArrayHelpers.write_array(self._restrictionAdditions)
		buffer += ArrayHelpers.write_array(self._restrictionDeletions)
		return buffer
	}

	str toString(){
		result = '('
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'restrictionFlags: {self._restrictionFlags.__str__()}, '
		result += f'restrictionAdditions: {list(map(str, self._restrictionAdditions))}, '
		result += f'restrictionDeletions: {list(map(str, self._restrictionDeletions))}, '
		result += ')'
		return result
	}
}


class AccountMosaicRestrictionTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.ACCOUNT_MOSAIC_RESTRICTION
	TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'restrictionFlags': 'enum:AccountRestrictionFlags',
		'restrictionAdditions': 'array[UnresolvedMosaicId]',
		'restrictionDeletions': 'array[UnresolvedMosaicId]'
	}

	AccountMosaicRestrictionTransactionV1(){
		self._signature = Signature()
		self._signerPublicKey = PublicKey()
		self._version = AccountMosaicRestrictionTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = AccountMosaicRestrictionTransactionV1.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._restrictionFlags = AccountRestrictionFlags.ADDRESS
		self._restrictionAdditions = []
		self._restrictionDeletions = []
		self._verifiableEntityHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
		self._accountRestrictionTransactionBodyReserved_1 = 0  # reserved field
	}

	None sort(){
		pass
	}

	@property
	Signature signature(){
		return self._signature
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	TransactionType type_(){
		return self._type_
	}

	@property
	Amount fee(){
		return self._fee
	}

	@property
	Timestamp deadline(){
		return self._deadline
	}

	@property
	AccountRestrictionFlags restrictionFlags(){
		return self._restrictionFlags
	}

	@property
	List[UnresolvedMosaicId] restrictionAdditions(){
		return self._restrictionAdditions
	}

	@property
	List[UnresolvedMosaicId] restrictionDeletions(){
		return self._restrictionDeletions
	}

	@signature.setter
	signature(value: Signature){
		self._signature = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@fee.setter
	fee(value: Amount){
		self._fee = value
	}

	@deadline.setter
	deadline(value: Timestamp){
		self._deadline = value
	}

	@restrictionFlags.setter
	restrictionFlags(value: AccountRestrictionFlags){
		self._restrictionFlags = value
	}

	@restrictionAdditions.setter
	restrictionAdditions(value: List[UnresolvedMosaicId]){
		self._restrictionAdditions = value
	}

	@restrictionDeletions.setter
	restrictionDeletions(value: List[UnresolvedMosaicId]){
		self._restrictionDeletions = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		size += self.restrictionFlags.size
		size += 1
		size += 1
		size += 4
		size += ArrayHelpers.size(self.restrictionAdditions)
		size += ArrayHelpers.size(self.restrictionDeletions)
		return size
	}

	static AccountMosaicRestrictionTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiableEntityHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert verifiableEntityHeaderReserved_1 == 0, f'Invalid value of reserved field ({verifiableEntityHeaderReserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		restrictionFlags = AccountRestrictionFlags.deserialize(buffer)
		buffer = buffer[restrictionFlags.size:]
		restrictionAdditionsCount = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		restrictionDeletionsCount = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		accountRestrictionTransactionBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert accountRestrictionTransactionBodyReserved_1 == 0, f'Invalid value of reserved field ({accountRestrictionTransactionBodyReserved_1})'
		restrictionAdditions = ArrayHelpers.read_array_count(buffer, UnresolvedMosaicId, restriction_additions_count)
		buffer = buffer[ArrayHelpers.size(restrictionAdditions):]
		restrictionDeletions = ArrayHelpers.read_array_count(buffer, UnresolvedMosaicId, restriction_deletions_count)
		buffer = buffer[ArrayHelpers.size(restrictionDeletions):]

		instance = AccountMosaicRestrictionTransactionV1()
		instance._signature = signature
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		instance._restrictionFlags = restrictionFlags
		instance._restrictionAdditions = restrictionAdditions
		instance._restrictionDeletions = restrictionDeletions
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._verifiableEntityHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signature.serialize()
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._restrictionFlags.serialize()
		buffer += (buffer..setInt8(0, len(self._restrictionAdditions).toInt(), Endian.little)).buffer.asUint8List();  # restriction_additions_count
		buffer += (buffer..setInt8(0, len(self._restrictionDeletions).toInt(), Endian.little)).buffer.asUint8List();  # restriction_deletions_count
		buffer += (buffer..setInt32(0, self._accountRestrictionTransactionBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += ArrayHelpers.write_array(self._restrictionAdditions)
		buffer += ArrayHelpers.write_array(self._restrictionDeletions)
		return buffer
	}

	str toString(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'restrictionFlags: {self._restrictionFlags.__str__()}, '
		result += f'restrictionAdditions: {list(map(str, self._restrictionAdditions))}, '
		result += f'restrictionDeletions: {list(map(str, self._restrictionDeletions))}, '
		result += ')'
		return result
	}
}


class EmbeddedAccountMosaicRestrictionTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.ACCOUNT_MOSAIC_RESTRICTION
	TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'restrictionFlags': 'enum:AccountRestrictionFlags',
		'restrictionAdditions': 'array[UnresolvedMosaicId]',
		'restrictionDeletions': 'array[UnresolvedMosaicId]'
	}

	EmbeddedAccountMosaicRestrictionTransactionV1(){
		self._signerPublicKey = PublicKey()
		self._version = EmbeddedAccountMosaicRestrictionTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = EmbeddedAccountMosaicRestrictionTransactionV1.TRANSACTION_TYPE
		self._restrictionFlags = AccountRestrictionFlags.ADDRESS
		self._restrictionAdditions = []
		self._restrictionDeletions = []
		self._embeddedTransactionHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
		self._accountRestrictionTransactionBodyReserved_1 = 0  # reserved field
	}

	None sort(){
		pass
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	TransactionType type_(){
		return self._type_
	}

	@property
	AccountRestrictionFlags restrictionFlags(){
		return self._restrictionFlags
	}

	@property
	List[UnresolvedMosaicId] restrictionAdditions(){
		return self._restrictionAdditions
	}

	@property
	List[UnresolvedMosaicId] restrictionDeletions(){
		return self._restrictionDeletions
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@restrictionFlags.setter
	restrictionFlags(value: AccountRestrictionFlags){
		self._restrictionFlags = value
	}

	@restrictionAdditions.setter
	restrictionAdditions(value: List[UnresolvedMosaicId]){
		self._restrictionAdditions = value
	}

	@restrictionDeletions.setter
	restrictionDeletions(value: List[UnresolvedMosaicId]){
		self._restrictionDeletions = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.restrictionFlags.size
		size += 1
		size += 1
		size += 4
		size += ArrayHelpers.size(self.restrictionAdditions)
		size += ArrayHelpers.size(self.restrictionDeletions)
		return size
	}

	static EmbeddedAccountMosaicRestrictionTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		embeddedTransactionHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert embeddedTransactionHeaderReserved_1 == 0, f'Invalid value of reserved field ({embeddedTransactionHeaderReserved_1})'
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		restrictionFlags = AccountRestrictionFlags.deserialize(buffer)
		buffer = buffer[restrictionFlags.size:]
		restrictionAdditionsCount = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		restrictionDeletionsCount = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		accountRestrictionTransactionBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert accountRestrictionTransactionBodyReserved_1 == 0, f'Invalid value of reserved field ({accountRestrictionTransactionBodyReserved_1})'
		restrictionAdditions = ArrayHelpers.read_array_count(buffer, UnresolvedMosaicId, restriction_additions_count)
		buffer = buffer[ArrayHelpers.size(restrictionAdditions):]
		restrictionDeletions = ArrayHelpers.read_array_count(buffer, UnresolvedMosaicId, restriction_deletions_count)
		buffer = buffer[ArrayHelpers.size(restrictionDeletions):]

		instance = EmbeddedAccountMosaicRestrictionTransactionV1()
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._restrictionFlags = restrictionFlags
		instance._restrictionAdditions = restrictionAdditions
		instance._restrictionDeletions = restrictionDeletions
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._embeddedTransactionHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._restrictionFlags.serialize()
		buffer += (buffer..setInt8(0, len(self._restrictionAdditions).toInt(), Endian.little)).buffer.asUint8List();  # restriction_additions_count
		buffer += (buffer..setInt8(0, len(self._restrictionDeletions).toInt(), Endian.little)).buffer.asUint8List();  # restriction_deletions_count
		buffer += (buffer..setInt32(0, self._accountRestrictionTransactionBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += ArrayHelpers.write_array(self._restrictionAdditions)
		buffer += ArrayHelpers.write_array(self._restrictionDeletions)
		return buffer
	}

	str toString(){
		result = '('
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'restrictionFlags: {self._restrictionFlags.__str__()}, '
		result += f'restrictionAdditions: {list(map(str, self._restrictionAdditions))}, '
		result += f'restrictionDeletions: {list(map(str, self._restrictionDeletions))}, '
		result += ')'
		return result
	}
}


class AccountOperationRestrictionTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.ACCOUNT_OPERATION_RESTRICTION
	TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'restrictionFlags': 'enum:AccountRestrictionFlags',
		'restrictionAdditions': 'array[TransactionType]',
		'restrictionDeletions': 'array[TransactionType]'
	}

	AccountOperationRestrictionTransactionV1(){
		self._signature = Signature()
		self._signerPublicKey = PublicKey()
		self._version = AccountOperationRestrictionTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = AccountOperationRestrictionTransactionV1.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._restrictionFlags = AccountRestrictionFlags.ADDRESS
		self._restrictionAdditions = []
		self._restrictionDeletions = []
		self._verifiableEntityHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
		self._accountRestrictionTransactionBodyReserved_1 = 0  # reserved field
	}

	None sort(){
		pass
	}

	@property
	Signature signature(){
		return self._signature
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	TransactionType type_(){
		return self._type_
	}

	@property
	Amount fee(){
		return self._fee
	}

	@property
	Timestamp deadline(){
		return self._deadline
	}

	@property
	AccountRestrictionFlags restrictionFlags(){
		return self._restrictionFlags
	}

	@property
	List[TransactionType] restrictionAdditions(){
		return self._restrictionAdditions
	}

	@property
	List[TransactionType] restrictionDeletions(){
		return self._restrictionDeletions
	}

	@signature.setter
	signature(value: Signature){
		self._signature = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@fee.setter
	fee(value: Amount){
		self._fee = value
	}

	@deadline.setter
	deadline(value: Timestamp){
		self._deadline = value
	}

	@restrictionFlags.setter
	restrictionFlags(value: AccountRestrictionFlags){
		self._restrictionFlags = value
	}

	@restrictionAdditions.setter
	restrictionAdditions(value: List[TransactionType]){
		self._restrictionAdditions = value
	}

	@restrictionDeletions.setter
	restrictionDeletions(value: List[TransactionType]){
		self._restrictionDeletions = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		size += self.restrictionFlags.size
		size += 1
		size += 1
		size += 4
		size += ArrayHelpers.size(self.restrictionAdditions)
		size += ArrayHelpers.size(self.restrictionDeletions)
		return size
	}

	static AccountOperationRestrictionTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiableEntityHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert verifiableEntityHeaderReserved_1 == 0, f'Invalid value of reserved field ({verifiableEntityHeaderReserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		restrictionFlags = AccountRestrictionFlags.deserialize(buffer)
		buffer = buffer[restrictionFlags.size:]
		restrictionAdditionsCount = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		restrictionDeletionsCount = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		accountRestrictionTransactionBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert accountRestrictionTransactionBodyReserved_1 == 0, f'Invalid value of reserved field ({accountRestrictionTransactionBodyReserved_1})'
		restrictionAdditions = ArrayHelpers.read_array_count(buffer, TransactionType, restriction_additions_count)
		buffer = buffer[ArrayHelpers.size(restrictionAdditions):]
		restrictionDeletions = ArrayHelpers.read_array_count(buffer, TransactionType, restriction_deletions_count)
		buffer = buffer[ArrayHelpers.size(restrictionDeletions):]

		instance = AccountOperationRestrictionTransactionV1()
		instance._signature = signature
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		instance._restrictionFlags = restrictionFlags
		instance._restrictionAdditions = restrictionAdditions
		instance._restrictionDeletions = restrictionDeletions
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._verifiableEntityHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signature.serialize()
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._restrictionFlags.serialize()
		buffer += (buffer..setInt8(0, len(self._restrictionAdditions).toInt(), Endian.little)).buffer.asUint8List();  # restriction_additions_count
		buffer += (buffer..setInt8(0, len(self._restrictionDeletions).toInt(), Endian.little)).buffer.asUint8List();  # restriction_deletions_count
		buffer += (buffer..setInt32(0, self._accountRestrictionTransactionBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += ArrayHelpers.write_array(self._restrictionAdditions)
		buffer += ArrayHelpers.write_array(self._restrictionDeletions)
		return buffer
	}

	str toString(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'restrictionFlags: {self._restrictionFlags.__str__()}, '
		result += f'restrictionAdditions: {list(map(str, self._restrictionAdditions))}, '
		result += f'restrictionDeletions: {list(map(str, self._restrictionDeletions))}, '
		result += ')'
		return result
	}
}


class EmbeddedAccountOperationRestrictionTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.ACCOUNT_OPERATION_RESTRICTION
	TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'restrictionFlags': 'enum:AccountRestrictionFlags',
		'restrictionAdditions': 'array[TransactionType]',
		'restrictionDeletions': 'array[TransactionType]'
	}

	EmbeddedAccountOperationRestrictionTransactionV1(){
		self._signerPublicKey = PublicKey()
		self._version = EmbeddedAccountOperationRestrictionTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = EmbeddedAccountOperationRestrictionTransactionV1.TRANSACTION_TYPE
		self._restrictionFlags = AccountRestrictionFlags.ADDRESS
		self._restrictionAdditions = []
		self._restrictionDeletions = []
		self._embeddedTransactionHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
		self._accountRestrictionTransactionBodyReserved_1 = 0  # reserved field
	}

	None sort(){
		pass
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	TransactionType type_(){
		return self._type_
	}

	@property
	AccountRestrictionFlags restrictionFlags(){
		return self._restrictionFlags
	}

	@property
	List[TransactionType] restrictionAdditions(){
		return self._restrictionAdditions
	}

	@property
	List[TransactionType] restrictionDeletions(){
		return self._restrictionDeletions
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@restrictionFlags.setter
	restrictionFlags(value: AccountRestrictionFlags){
		self._restrictionFlags = value
	}

	@restrictionAdditions.setter
	restrictionAdditions(value: List[TransactionType]){
		self._restrictionAdditions = value
	}

	@restrictionDeletions.setter
	restrictionDeletions(value: List[TransactionType]){
		self._restrictionDeletions = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.restrictionFlags.size
		size += 1
		size += 1
		size += 4
		size += ArrayHelpers.size(self.restrictionAdditions)
		size += ArrayHelpers.size(self.restrictionDeletions)
		return size
	}

	static EmbeddedAccountOperationRestrictionTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		embeddedTransactionHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert embeddedTransactionHeaderReserved_1 == 0, f'Invalid value of reserved field ({embeddedTransactionHeaderReserved_1})'
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		restrictionFlags = AccountRestrictionFlags.deserialize(buffer)
		buffer = buffer[restrictionFlags.size:]
		restrictionAdditionsCount = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		restrictionDeletionsCount = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		accountRestrictionTransactionBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert accountRestrictionTransactionBodyReserved_1 == 0, f'Invalid value of reserved field ({accountRestrictionTransactionBodyReserved_1})'
		restrictionAdditions = ArrayHelpers.read_array_count(buffer, TransactionType, restriction_additions_count)
		buffer = buffer[ArrayHelpers.size(restrictionAdditions):]
		restrictionDeletions = ArrayHelpers.read_array_count(buffer, TransactionType, restriction_deletions_count)
		buffer = buffer[ArrayHelpers.size(restrictionDeletions):]

		instance = EmbeddedAccountOperationRestrictionTransactionV1()
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._restrictionFlags = restrictionFlags
		instance._restrictionAdditions = restrictionAdditions
		instance._restrictionDeletions = restrictionDeletions
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._embeddedTransactionHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._restrictionFlags.serialize()
		buffer += (buffer..setInt8(0, len(self._restrictionAdditions).toInt(), Endian.little)).buffer.asUint8List();  # restriction_additions_count
		buffer += (buffer..setInt8(0, len(self._restrictionDeletions).toInt(), Endian.little)).buffer.asUint8List();  # restriction_deletions_count
		buffer += (buffer..setInt32(0, self._accountRestrictionTransactionBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += ArrayHelpers.write_array(self._restrictionAdditions)
		buffer += ArrayHelpers.write_array(self._restrictionDeletions)
		return buffer
	}

	str toString(){
		result = '('
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'restrictionFlags: {self._restrictionFlags.__str__()}, '
		result += f'restrictionAdditions: {list(map(str, self._restrictionAdditions))}, '
		result += f'restrictionDeletions: {list(map(str, self._restrictionDeletions))}, '
		result += ')'
		return result
	}
}


class MosaicAddressRestrictionTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.MOSAIC_ADDRESS_RESTRICTION
	TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'mosaicId': 'pod:UnresolvedMosaicId',
		'targetAddress': 'pod:UnresolvedAddress'
	}

	MosaicAddressRestrictionTransactionV1(){
		self._signature = Signature()
		self._signerPublicKey = PublicKey()
		self._version = MosaicAddressRestrictionTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = MosaicAddressRestrictionTransactionV1.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._mosaicId = UnresolvedMosaicId()
		self._restrictionKey = BigInt.zero
		self._previousRestrictionValue = BigInt.zero
		self._newRestrictionValue = BigInt.zero
		self._targetAddress = UnresolvedAddress()
		self._verifiableEntityHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
	}

	None sort(){
		pass
	}

	@property
	Signature signature(){
		return self._signature
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	TransactionType type_(){
		return self._type_
	}

	@property
	Amount fee(){
		return self._fee
	}

	@property
	Timestamp deadline(){
		return self._deadline
	}

	@property
	UnresolvedMosaicId mosaicId(){
		return self._mosaicId
	}

	@property
	BigInt restrictionKey(){
		return self._restrictionKey
	}

	@property
	BigInt previousRestrictionValue(){
		return self._previousRestrictionValue
	}

	@property
	BigInt newRestrictionValue(){
		return self._newRestrictionValue
	}

	@property
	UnresolvedAddress targetAddress(){
		return self._targetAddress
	}

	@signature.setter
	signature(value: Signature){
		self._signature = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@fee.setter
	fee(value: Amount){
		self._fee = value
	}

	@deadline.setter
	deadline(value: Timestamp){
		self._deadline = value
	}

	@mosaicId.setter
	mosaicId(value: UnresolvedMosaicId){
		self._mosaicId = value
	}

	@restrictionKey.setter
	restrictionKey(value: BigInt){
		self._restrictionKey = value
	}

	@previousRestrictionValue.setter
	previousRestrictionValue(value: BigInt){
		self._previousRestrictionValue = value
	}

	@newRestrictionValue.setter
	newRestrictionValue(value: BigInt){
		self._newRestrictionValue = value
	}

	@targetAddress.setter
	targetAddress(value: UnresolvedAddress){
		self._targetAddress = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		size += self.mosaicId.size
		size += 8
		size += 8
		size += 8
		size += self.targetAddress.size
		return size
	}

	static MosaicAddressRestrictionTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiableEntityHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert verifiableEntityHeaderReserved_1 == 0, f'Invalid value of reserved field ({verifiableEntityHeaderReserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		mosaicId = UnresolvedMosaicId.deserialize(buffer)
		buffer = buffer[mosaicId.size:]
		restrictionKey = BigInt.from(buffer.getInt64(0, Endian.little))
		buffer = buffer[8:]
		previousRestrictionValue = BigInt.from(buffer.getInt64(0, Endian.little))
		buffer = buffer[8:]
		newRestrictionValue = BigInt.from(buffer.getInt64(0, Endian.little))
		buffer = buffer[8:]
		targetAddress = UnresolvedAddress.deserialize(buffer)
		buffer = buffer[targetAddress.size:]

		instance = MosaicAddressRestrictionTransactionV1()
		instance._signature = signature
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		instance._mosaicId = mosaicId
		instance._restrictionKey = restrictionKey
		instance._previousRestrictionValue = previousRestrictionValue
		instance._newRestrictionValue = newRestrictionValue
		instance._targetAddress = targetAddress
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._verifiableEntityHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signature.serialize()
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._mosaicId.serialize()
		buffer += (buffer..setInt64(0, self._restrictionKey.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt64(0, self._previousRestrictionValue.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt64(0, self._newRestrictionValue.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._targetAddress.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'mosaicId: {self._mosaicId.__str__()}, '
		result += f'restrictionKey: 0x{self._restrictionKey:X}, '
		result += f'previousRestrictionValue: 0x{self._previousRestrictionValue:X}, '
		result += f'newRestrictionValue: 0x{self._newRestrictionValue:X}, '
		result += f'targetAddress: {self._targetAddress.__str__()}, '
		result += ')'
		return result
	}
}


class EmbeddedMosaicAddressRestrictionTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.MOSAIC_ADDRESS_RESTRICTION
	TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'mosaicId': 'pod:UnresolvedMosaicId',
		'targetAddress': 'pod:UnresolvedAddress'
	}

	EmbeddedMosaicAddressRestrictionTransactionV1(){
		self._signerPublicKey = PublicKey()
		self._version = EmbeddedMosaicAddressRestrictionTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = EmbeddedMosaicAddressRestrictionTransactionV1.TRANSACTION_TYPE
		self._mosaicId = UnresolvedMosaicId()
		self._restrictionKey = BigInt.zero
		self._previousRestrictionValue = BigInt.zero
		self._newRestrictionValue = BigInt.zero
		self._targetAddress = UnresolvedAddress()
		self._embeddedTransactionHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
	}

	None sort(){
		pass
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	TransactionType type_(){
		return self._type_
	}

	@property
	UnresolvedMosaicId mosaicId(){
		return self._mosaicId
	}

	@property
	BigInt restrictionKey(){
		return self._restrictionKey
	}

	@property
	BigInt previousRestrictionValue(){
		return self._previousRestrictionValue
	}

	@property
	BigInt newRestrictionValue(){
		return self._newRestrictionValue
	}

	@property
	UnresolvedAddress targetAddress(){
		return self._targetAddress
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@mosaicId.setter
	mosaicId(value: UnresolvedMosaicId){
		self._mosaicId = value
	}

	@restrictionKey.setter
	restrictionKey(value: BigInt){
		self._restrictionKey = value
	}

	@previousRestrictionValue.setter
	previousRestrictionValue(value: BigInt){
		self._previousRestrictionValue = value
	}

	@newRestrictionValue.setter
	newRestrictionValue(value: BigInt){
		self._newRestrictionValue = value
	}

	@targetAddress.setter
	targetAddress(value: UnresolvedAddress){
		self._targetAddress = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.mosaicId.size
		size += 8
		size += 8
		size += 8
		size += self.targetAddress.size
		return size
	}

	static EmbeddedMosaicAddressRestrictionTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		embeddedTransactionHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert embeddedTransactionHeaderReserved_1 == 0, f'Invalid value of reserved field ({embeddedTransactionHeaderReserved_1})'
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		mosaicId = UnresolvedMosaicId.deserialize(buffer)
		buffer = buffer[mosaicId.size:]
		restrictionKey = BigInt.from(buffer.getInt64(0, Endian.little))
		buffer = buffer[8:]
		previousRestrictionValue = BigInt.from(buffer.getInt64(0, Endian.little))
		buffer = buffer[8:]
		newRestrictionValue = BigInt.from(buffer.getInt64(0, Endian.little))
		buffer = buffer[8:]
		targetAddress = UnresolvedAddress.deserialize(buffer)
		buffer = buffer[targetAddress.size:]

		instance = EmbeddedMosaicAddressRestrictionTransactionV1()
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._mosaicId = mosaicId
		instance._restrictionKey = restrictionKey
		instance._previousRestrictionValue = previousRestrictionValue
		instance._newRestrictionValue = newRestrictionValue
		instance._targetAddress = targetAddress
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._embeddedTransactionHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._mosaicId.serialize()
		buffer += (buffer..setInt64(0, self._restrictionKey.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt64(0, self._previousRestrictionValue.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt64(0, self._newRestrictionValue.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._targetAddress.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'mosaicId: {self._mosaicId.__str__()}, '
		result += f'restrictionKey: 0x{self._restrictionKey:X}, '
		result += f'previousRestrictionValue: 0x{self._previousRestrictionValue:X}, '
		result += f'newRestrictionValue: 0x{self._newRestrictionValue:X}, '
		result += f'targetAddress: {self._targetAddress.__str__()}, '
		result += ')'
		return result
	}
}


class MosaicRestrictionKey extends BaseValue {
	static const int SIZE = 8;

	MosaicRestrictionKey(BigInt mosaicRestrictionKey): super(SIZE, mosaicRestrictionKey ?? BigInt.zero);

	static MosaicRestrictionKey deserialize(Uint8List payload){
		var buffer = ByteData.view(payload.buffer);
		return MosaicRestrictionKey(BigInt.from(buffer.getInt64(0, Endian.little)));
	}

	Uint8List serialize(){
		var buffer = ByteData(SIZE);
		return (buffer..setInt64(0, value.toInt(), Endian.little)).buffer.asUint8List();;
	}
}


class MosaicRestrictionType extends (Enum) {
	NONE = 0
	EQ = 1
	NE = 2
	LT = 3
	LE = 4
	GT = 5
	GE = 6

	int get size(){
		return 1
	}

	static MosaicRestrictionType deserialize(Uint8List payload){
		buffer = memoryview(payload)
		return MosaicRestrictionType(BigInt.from(buffer.getInt8(0, Endian.little)))
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += (buffer..setInt8(0, self.value.toInt(), Endian.little)).buffer.asUint8List();
		return buffer
	}
}


class MosaicGlobalRestrictionTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.MOSAIC_GLOBAL_RESTRICTION
	TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'mosaicId': 'pod:UnresolvedMosaicId',
		'referenceMosaicId': 'pod:UnresolvedMosaicId',
		'previousRestrictionType': 'enum:MosaicRestrictionType',
		'newRestrictionType': 'enum:MosaicRestrictionType'
	}

	MosaicGlobalRestrictionTransactionV1(){
		self._signature = Signature()
		self._signerPublicKey = PublicKey()
		self._version = MosaicGlobalRestrictionTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = MosaicGlobalRestrictionTransactionV1.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._mosaicId = UnresolvedMosaicId()
		self._referenceMosaicId = UnresolvedMosaicId()
		self._restrictionKey = BigInt.zero
		self._previousRestrictionValue = BigInt.zero
		self._newRestrictionValue = BigInt.zero
		self._previousRestrictionType = MosaicRestrictionType.NONE
		self._newRestrictionType = MosaicRestrictionType.NONE
		self._verifiableEntityHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
	}

	None sort(){
		pass
	}

	@property
	Signature signature(){
		return self._signature
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	TransactionType type_(){
		return self._type_
	}

	@property
	Amount fee(){
		return self._fee
	}

	@property
	Timestamp deadline(){
		return self._deadline
	}

	@property
	UnresolvedMosaicId mosaicId(){
		return self._mosaicId
	}

	@property
	UnresolvedMosaicId referenceMosaicId(){
		return self._referenceMosaicId
	}

	@property
	BigInt restrictionKey(){
		return self._restrictionKey
	}

	@property
	BigInt previousRestrictionValue(){
		return self._previousRestrictionValue
	}

	@property
	BigInt newRestrictionValue(){
		return self._newRestrictionValue
	}

	@property
	MosaicRestrictionType previousRestrictionType(){
		return self._previousRestrictionType
	}

	@property
	MosaicRestrictionType newRestrictionType(){
		return self._newRestrictionType
	}

	@signature.setter
	signature(value: Signature){
		self._signature = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@fee.setter
	fee(value: Amount){
		self._fee = value
	}

	@deadline.setter
	deadline(value: Timestamp){
		self._deadline = value
	}

	@mosaicId.setter
	mosaicId(value: UnresolvedMosaicId){
		self._mosaicId = value
	}

	@referenceMosaicId.setter
	referenceMosaicId(value: UnresolvedMosaicId){
		self._referenceMosaicId = value
	}

	@restrictionKey.setter
	restrictionKey(value: BigInt){
		self._restrictionKey = value
	}

	@previousRestrictionValue.setter
	previousRestrictionValue(value: BigInt){
		self._previousRestrictionValue = value
	}

	@newRestrictionValue.setter
	newRestrictionValue(value: BigInt){
		self._newRestrictionValue = value
	}

	@previousRestrictionType.setter
	previousRestrictionType(value: MosaicRestrictionType){
		self._previousRestrictionType = value
	}

	@newRestrictionType.setter
	newRestrictionType(value: MosaicRestrictionType){
		self._newRestrictionType = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		size += self.mosaicId.size
		size += self.referenceMosaicId.size
		size += 8
		size += 8
		size += 8
		size += self.previousRestrictionType.size
		size += self.newRestrictionType.size
		return size
	}

	static MosaicGlobalRestrictionTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiableEntityHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert verifiableEntityHeaderReserved_1 == 0, f'Invalid value of reserved field ({verifiableEntityHeaderReserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		mosaicId = UnresolvedMosaicId.deserialize(buffer)
		buffer = buffer[mosaicId.size:]
		referenceMosaicId = UnresolvedMosaicId.deserialize(buffer)
		buffer = buffer[referenceMosaicId.size:]
		restrictionKey = BigInt.from(buffer.getInt64(0, Endian.little))
		buffer = buffer[8:]
		previousRestrictionValue = BigInt.from(buffer.getInt64(0, Endian.little))
		buffer = buffer[8:]
		newRestrictionValue = BigInt.from(buffer.getInt64(0, Endian.little))
		buffer = buffer[8:]
		previousRestrictionType = MosaicRestrictionType.deserialize(buffer)
		buffer = buffer[previousRestrictionType.size:]
		newRestrictionType = MosaicRestrictionType.deserialize(buffer)
		buffer = buffer[newRestrictionType.size:]

		instance = MosaicGlobalRestrictionTransactionV1()
		instance._signature = signature
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		instance._mosaicId = mosaicId
		instance._referenceMosaicId = referenceMosaicId
		instance._restrictionKey = restrictionKey
		instance._previousRestrictionValue = previousRestrictionValue
		instance._newRestrictionValue = newRestrictionValue
		instance._previousRestrictionType = previousRestrictionType
		instance._newRestrictionType = newRestrictionType
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._verifiableEntityHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signature.serialize()
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._mosaicId.serialize()
		buffer += self._referenceMosaicId.serialize()
		buffer += (buffer..setInt64(0, self._restrictionKey.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt64(0, self._previousRestrictionValue.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt64(0, self._newRestrictionValue.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._previousRestrictionType.serialize()
		buffer += self._newRestrictionType.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'mosaicId: {self._mosaicId.__str__()}, '
		result += f'referenceMosaicId: {self._referenceMosaicId.__str__()}, '
		result += f'restrictionKey: 0x{self._restrictionKey:X}, '
		result += f'previousRestrictionValue: 0x{self._previousRestrictionValue:X}, '
		result += f'newRestrictionValue: 0x{self._newRestrictionValue:X}, '
		result += f'previousRestrictionType: {self._previousRestrictionType.__str__()}, '
		result += f'newRestrictionType: {self._newRestrictionType.__str__()}, '
		result += ')'
		return result
	}
}


class EmbeddedMosaicGlobalRestrictionTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.MOSAIC_GLOBAL_RESTRICTION
	TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'mosaicId': 'pod:UnresolvedMosaicId',
		'referenceMosaicId': 'pod:UnresolvedMosaicId',
		'previousRestrictionType': 'enum:MosaicRestrictionType',
		'newRestrictionType': 'enum:MosaicRestrictionType'
	}

	EmbeddedMosaicGlobalRestrictionTransactionV1(){
		self._signerPublicKey = PublicKey()
		self._version = EmbeddedMosaicGlobalRestrictionTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = EmbeddedMosaicGlobalRestrictionTransactionV1.TRANSACTION_TYPE
		self._mosaicId = UnresolvedMosaicId()
		self._referenceMosaicId = UnresolvedMosaicId()
		self._restrictionKey = BigInt.zero
		self._previousRestrictionValue = BigInt.zero
		self._newRestrictionValue = BigInt.zero
		self._previousRestrictionType = MosaicRestrictionType.NONE
		self._newRestrictionType = MosaicRestrictionType.NONE
		self._embeddedTransactionHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
	}

	None sort(){
		pass
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	TransactionType type_(){
		return self._type_
	}

	@property
	UnresolvedMosaicId mosaicId(){
		return self._mosaicId
	}

	@property
	UnresolvedMosaicId referenceMosaicId(){
		return self._referenceMosaicId
	}

	@property
	BigInt restrictionKey(){
		return self._restrictionKey
	}

	@property
	BigInt previousRestrictionValue(){
		return self._previousRestrictionValue
	}

	@property
	BigInt newRestrictionValue(){
		return self._newRestrictionValue
	}

	@property
	MosaicRestrictionType previousRestrictionType(){
		return self._previousRestrictionType
	}

	@property
	MosaicRestrictionType newRestrictionType(){
		return self._newRestrictionType
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@mosaicId.setter
	mosaicId(value: UnresolvedMosaicId){
		self._mosaicId = value
	}

	@referenceMosaicId.setter
	referenceMosaicId(value: UnresolvedMosaicId){
		self._referenceMosaicId = value
	}

	@restrictionKey.setter
	restrictionKey(value: BigInt){
		self._restrictionKey = value
	}

	@previousRestrictionValue.setter
	previousRestrictionValue(value: BigInt){
		self._previousRestrictionValue = value
	}

	@newRestrictionValue.setter
	newRestrictionValue(value: BigInt){
		self._newRestrictionValue = value
	}

	@previousRestrictionType.setter
	previousRestrictionType(value: MosaicRestrictionType){
		self._previousRestrictionType = value
	}

	@newRestrictionType.setter
	newRestrictionType(value: MosaicRestrictionType){
		self._newRestrictionType = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.mosaicId.size
		size += self.referenceMosaicId.size
		size += 8
		size += 8
		size += 8
		size += self.previousRestrictionType.size
		size += self.newRestrictionType.size
		return size
	}

	static EmbeddedMosaicGlobalRestrictionTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		embeddedTransactionHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert embeddedTransactionHeaderReserved_1 == 0, f'Invalid value of reserved field ({embeddedTransactionHeaderReserved_1})'
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		mosaicId = UnresolvedMosaicId.deserialize(buffer)
		buffer = buffer[mosaicId.size:]
		referenceMosaicId = UnresolvedMosaicId.deserialize(buffer)
		buffer = buffer[referenceMosaicId.size:]
		restrictionKey = BigInt.from(buffer.getInt64(0, Endian.little))
		buffer = buffer[8:]
		previousRestrictionValue = BigInt.from(buffer.getInt64(0, Endian.little))
		buffer = buffer[8:]
		newRestrictionValue = BigInt.from(buffer.getInt64(0, Endian.little))
		buffer = buffer[8:]
		previousRestrictionType = MosaicRestrictionType.deserialize(buffer)
		buffer = buffer[previousRestrictionType.size:]
		newRestrictionType = MosaicRestrictionType.deserialize(buffer)
		buffer = buffer[newRestrictionType.size:]

		instance = EmbeddedMosaicGlobalRestrictionTransactionV1()
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._mosaicId = mosaicId
		instance._referenceMosaicId = referenceMosaicId
		instance._restrictionKey = restrictionKey
		instance._previousRestrictionValue = previousRestrictionValue
		instance._newRestrictionValue = newRestrictionValue
		instance._previousRestrictionType = previousRestrictionType
		instance._newRestrictionType = newRestrictionType
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._embeddedTransactionHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._mosaicId.serialize()
		buffer += self._referenceMosaicId.serialize()
		buffer += (buffer..setInt64(0, self._restrictionKey.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt64(0, self._previousRestrictionValue.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt64(0, self._newRestrictionValue.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._previousRestrictionType.serialize()
		buffer += self._newRestrictionType.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'mosaicId: {self._mosaicId.__str__()}, '
		result += f'referenceMosaicId: {self._referenceMosaicId.__str__()}, '
		result += f'restrictionKey: 0x{self._restrictionKey:X}, '
		result += f'previousRestrictionValue: 0x{self._previousRestrictionValue:X}, '
		result += f'newRestrictionValue: 0x{self._newRestrictionValue:X}, '
		result += f'previousRestrictionType: {self._previousRestrictionType.__str__()}, '
		result += f'newRestrictionType: {self._newRestrictionType.__str__()}, '
		result += ')'
		return result
	}
}


class TransferTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.TRANSFER
	TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'recipientAddress': 'pod:UnresolvedAddress',
		'mosaics': 'array[UnresolvedMosaic]',
		'message': 'bytes_array'
	}

	TransferTransactionV1(){
		self._signature = Signature()
		self._signerPublicKey = PublicKey()
		self._version = TransferTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = TransferTransactionV1.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._recipientAddress = UnresolvedAddress()
		self._mosaics = []
		self._message = Uint8List()
		self._verifiableEntityHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
		self._transferTransactionBodyReserved_1 = 0  # reserved field
		self._transferTransactionBodyReserved_2 = 0  # reserved field
	}

	None sort(){
		self._mosaics = sorted(self._mosaics, key=lambda e: e.mosaic_id.comparer() if hasattr(e.mosaic_id, 'comparer') else e.mosaic_id)
	}

	@property
	Signature signature(){
		return self._signature
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	TransactionType type_(){
		return self._type_
	}

	@property
	Amount fee(){
		return self._fee
	}

	@property
	Timestamp deadline(){
		return self._deadline
	}

	@property
	UnresolvedAddress recipientAddress(){
		return self._recipientAddress
	}

	@property
	List[UnresolvedMosaic] mosaics(){
		return self._mosaics
	}

	@property
	bytes message(){
		return self._message
	}

	@signature.setter
	signature(value: Signature){
		self._signature = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@fee.setter
	fee(value: Amount){
		self._fee = value
	}

	@deadline.setter
	deadline(value: Timestamp){
		self._deadline = value
	}

	@recipientAddress.setter
	recipientAddress(value: UnresolvedAddress){
		self._recipientAddress = value
	}

	@mosaics.setter
	mosaics(value: List[UnresolvedMosaic]){
		self._mosaics = value
	}

	@message.setter
	message(value: bytes){
		self._message = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		size += self.recipientAddress.size
		size += 2
		size += 1
		size += 1
		size += 4
		size += ArrayHelpers.size(self.mosaics)
		size += len(self._message)
		return size
	}

	static TransferTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiableEntityHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert verifiableEntityHeaderReserved_1 == 0, f'Invalid value of reserved field ({verifiableEntityHeaderReserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		recipientAddress = UnresolvedAddress.deserialize(buffer)
		buffer = buffer[recipientAddress.size:]
		messageSize = BigInt.from(buffer.getInt16(0, Endian.little))
		buffer = buffer[2:]
		mosaicsCount = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		transferTransactionBodyReserved_1 = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		assert transferTransactionBodyReserved_1 == 0, f'Invalid value of reserved field ({transferTransactionBodyReserved_1})'
		transferTransactionBodyReserved_2 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert transferTransactionBodyReserved_2 == 0, f'Invalid value of reserved field ({transferTransactionBodyReserved_2})'
		mosaics = ArrayHelpers.read_array_count(buffer, UnresolvedMosaic, mosaics_count, lambda e: e.mosaic_id.comparer() if hasattr(e.mosaic_id, 'comparer') else e.mosaic_id)
		buffer = buffer[ArrayHelpers.size(mosaics):]
		message = Uint8List.fromList(payload)
		buffer = buffer[message_size:]

		instance = TransferTransactionV1()
		instance._signature = signature
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		instance._recipientAddress = recipientAddress
		instance._mosaics = mosaics
		instance._message = message
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._verifiableEntityHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signature.serialize()
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._recipientAddress.serialize()
		buffer += (buffer..setInt16(0, len(self._message).toInt(), Endian.little)).buffer.asUint8List();  # message_size
		buffer += (buffer..setInt8(0, len(self._mosaics).toInt(), Endian.little)).buffer.asUint8List();  # mosaics_count
		buffer += (buffer..setInt8(0, self._transferTransactionBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt32(0, self._transferTransactionBodyReserved_2.toInt(), Endian.little)).buffer.asUint8List();
		buffer += ArrayHelpers.write_array(self._mosaics, lambda e: e.mosaic_id.comparer() if hasattr(e.mosaic_id, 'comparer') else e.mosaic_id)
		buffer += self._message
		return buffer
	}

	str toString(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'recipientAddress: {self._recipientAddress.__str__()}, '
		result += f'mosaics: {list(map(str, self._mosaics))}, '
		result += f'message: {hexlify(self._message).decode("utf8")}, '
		result += ')'
		return result
	}
}


class EmbeddedTransferTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.TRANSFER
	TYPE_HINTS = {
		'signerPublicKey': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'recipientAddress': 'pod:UnresolvedAddress',
		'mosaics': 'array[UnresolvedMosaic]',
		'message': 'bytes_array'
	}

	EmbeddedTransferTransactionV1(){
		self._signerPublicKey = PublicKey()
		self._version = EmbeddedTransferTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = EmbeddedTransferTransactionV1.TRANSACTION_TYPE
		self._recipientAddress = UnresolvedAddress()
		self._mosaics = []
		self._message = Uint8List()
		self._embeddedTransactionHeaderReserved_1 = 0  # reserved field
		self._entityBodyReserved_1 = 0  # reserved field
		self._transferTransactionBodyReserved_1 = 0  # reserved field
		self._transferTransactionBodyReserved_2 = 0  # reserved field
	}

	None sort(){
		self._mosaics = sorted(self._mosaics, key=lambda e: e.mosaic_id.comparer() if hasattr(e.mosaic_id, 'comparer') else e.mosaic_id)
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	int version(){
		return self._version
	}

	@property
	NetworkType network(){
		return self._network
	}

	@property
	TransactionType type_(){
		return self._type_
	}

	@property
	UnresolvedAddress recipientAddress(){
		return self._recipientAddress
	}

	@property
	List[UnresolvedMosaic] mosaics(){
		return self._mosaics
	}

	@property
	bytes message(){
		return self._message
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@recipientAddress.setter
	recipientAddress(value: UnresolvedAddress){
		self._recipientAddress = value
	}

	@mosaics.setter
	mosaics(value: List[UnresolvedMosaic]){
		self._mosaics = value
	}

	@message.setter
	message(value: bytes){
		self._message = value
	}

	int get size(){
		size = 0
		size += 4
		size += 4
		size += self.signerPublicKey.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.recipientAddress.size
		size += 2
		size += 1
		size += 1
		size += 4
		size += ArrayHelpers.size(self.mosaics)
		size += len(self._message)
		return size
	}

	static EmbeddedTransferTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		size_ = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		embeddedTransactionHeaderReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert embeddedTransactionHeaderReserved_1 == 0, f'Invalid value of reserved field ({embeddedTransactionHeaderReserved_1})'
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		recipientAddress = UnresolvedAddress.deserialize(buffer)
		buffer = buffer[recipientAddress.size:]
		messageSize = BigInt.from(buffer.getInt16(0, Endian.little))
		buffer = buffer[2:]
		mosaicsCount = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		transferTransactionBodyReserved_1 = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		assert transferTransactionBodyReserved_1 == 0, f'Invalid value of reserved field ({transferTransactionBodyReserved_1})'
		transferTransactionBodyReserved_2 = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert transferTransactionBodyReserved_2 == 0, f'Invalid value of reserved field ({transferTransactionBodyReserved_2})'
		mosaics = ArrayHelpers.read_array_count(buffer, UnresolvedMosaic, mosaics_count, lambda e: e.mosaic_id.comparer() if hasattr(e.mosaic_id, 'comparer') else e.mosaic_id)
		buffer = buffer[ArrayHelpers.size(mosaics):]
		message = Uint8List.fromList(payload)
		buffer = buffer[message_size:]

		instance = EmbeddedTransferTransactionV1()
		instance._signerPublicKey = signerPublicKey
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._recipientAddress = recipientAddress
		instance._mosaics = mosaics
		instance._message = message
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += (buffer..setInt32(0, self._embeddedTransactionHeaderReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._recipientAddress.serialize()
		buffer += (buffer..setInt16(0, len(self._message).toInt(), Endian.little)).buffer.asUint8List();  # message_size
		buffer += (buffer..setInt8(0, len(self._mosaics).toInt(), Endian.little)).buffer.asUint8List();  # mosaics_count
		buffer += (buffer..setInt8(0, self._transferTransactionBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt32(0, self._transferTransactionBodyReserved_2.toInt(), Endian.little)).buffer.asUint8List();
		buffer += ArrayHelpers.write_array(self._mosaics, lambda e: e.mosaic_id.comparer() if hasattr(e.mosaic_id, 'comparer') else e.mosaic_id)
		buffer += self._message
		return buffer
	}

	str toString(){
		result = '('
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'recipientAddress: {self._recipientAddress.__str__()}, '
		result += f'mosaics: {list(map(str, self._mosaics))}, '
		result += f'message: {hexlify(self._message).decode("utf8")}, '
		result += ')'
		return result
	}
}


class TransactionFactory {
	@classmethod
	Transaction deserialize(payload: bytes){
		buffer = bytes(payload)
		parent = Transaction.deserialize(buffer)
		mapping = {
			(AccountKeyLinkTransactionV1.TRANSACTION_TYPE, AccountKeyLinkTransactionV1.TRANSACTION_VERSION): AccountKeyLinkTransactionV1,
			(NodeKeyLinkTransactionV1.TRANSACTION_TYPE, NodeKeyLinkTransactionV1.TRANSACTION_VERSION): NodeKeyLinkTransactionV1,
			(AggregateCompleteTransactionV1.TRANSACTION_TYPE, AggregateCompleteTransactionV1.TRANSACTION_VERSION): AggregateCompleteTransactionV1,
			(AggregateCompleteTransactionV2.TRANSACTION_TYPE, AggregateCompleteTransactionV2.TRANSACTION_VERSION): AggregateCompleteTransactionV2,
			(AggregateBondedTransactionV1.TRANSACTION_TYPE, AggregateBondedTransactionV1.TRANSACTION_VERSION): AggregateBondedTransactionV1,
			(AggregateBondedTransactionV2.TRANSACTION_TYPE, AggregateBondedTransactionV2.TRANSACTION_VERSION): AggregateBondedTransactionV2,
			(VotingKeyLinkTransactionV1.TRANSACTION_TYPE, VotingKeyLinkTransactionV1.TRANSACTION_VERSION): VotingKeyLinkTransactionV1,
			(VrfKeyLinkTransactionV1.TRANSACTION_TYPE, VrfKeyLinkTransactionV1.TRANSACTION_VERSION): VrfKeyLinkTransactionV1,
			(HashLockTransactionV1.TRANSACTION_TYPE, HashLockTransactionV1.TRANSACTION_VERSION): HashLockTransactionV1,
			(SecretLockTransactionV1.TRANSACTION_TYPE, SecretLockTransactionV1.TRANSACTION_VERSION): SecretLockTransactionV1,
			(SecretProofTransactionV1.TRANSACTION_TYPE, SecretProofTransactionV1.TRANSACTION_VERSION): SecretProofTransactionV1,
			(AccountMetadataTransactionV1.TRANSACTION_TYPE, AccountMetadataTransactionV1.TRANSACTION_VERSION): AccountMetadataTransactionV1,
			(MosaicMetadataTransactionV1.TRANSACTION_TYPE, MosaicMetadataTransactionV1.TRANSACTION_VERSION): MosaicMetadataTransactionV1,
			(NamespaceMetadataTransactionV1.TRANSACTION_TYPE, NamespaceMetadataTransactionV1.TRANSACTION_VERSION): NamespaceMetadataTransactionV1,
			(MosaicDefinitionTransactionV1.TRANSACTION_TYPE, MosaicDefinitionTransactionV1.TRANSACTION_VERSION): MosaicDefinitionTransactionV1,
			(MosaicSupplyChangeTransactionV1.TRANSACTION_TYPE, MosaicSupplyChangeTransactionV1.TRANSACTION_VERSION): MosaicSupplyChangeTransactionV1,
			(MosaicSupplyRevocationTransactionV1.TRANSACTION_TYPE, MosaicSupplyRevocationTransactionV1.TRANSACTION_VERSION): MosaicSupplyRevocationTransactionV1,
			(MultisigAccountModificationTransactionV1.TRANSACTION_TYPE, MultisigAccountModificationTransactionV1.TRANSACTION_VERSION): MultisigAccountModificationTransactionV1,
			(AddressAliasTransactionV1.TRANSACTION_TYPE, AddressAliasTransactionV1.TRANSACTION_VERSION): AddressAliasTransactionV1,
			(MosaicAliasTransactionV1.TRANSACTION_TYPE, MosaicAliasTransactionV1.TRANSACTION_VERSION): MosaicAliasTransactionV1,
			(NamespaceRegistrationTransactionV1.TRANSACTION_TYPE, NamespaceRegistrationTransactionV1.TRANSACTION_VERSION): NamespaceRegistrationTransactionV1,
			(AccountAddressRestrictionTransactionV1.TRANSACTION_TYPE, AccountAddressRestrictionTransactionV1.TRANSACTION_VERSION): AccountAddressRestrictionTransactionV1,
			(AccountMosaicRestrictionTransactionV1.TRANSACTION_TYPE, AccountMosaicRestrictionTransactionV1.TRANSACTION_VERSION): AccountMosaicRestrictionTransactionV1,
			(AccountOperationRestrictionTransactionV1.TRANSACTION_TYPE, AccountOperationRestrictionTransactionV1.TRANSACTION_VERSION): AccountOperationRestrictionTransactionV1,
			(MosaicAddressRestrictionTransactionV1.TRANSACTION_TYPE, MosaicAddressRestrictionTransactionV1.TRANSACTION_VERSION): MosaicAddressRestrictionTransactionV1,
			(MosaicGlobalRestrictionTransactionV1.TRANSACTION_TYPE, MosaicGlobalRestrictionTransactionV1.TRANSACTION_VERSION): MosaicGlobalRestrictionTransactionV1,
			(TransferTransactionV1.TRANSACTION_TYPE, TransferTransactionV1.TRANSACTION_VERSION): TransferTransactionV1
		}
		discriminator = (parent.type_, parent.version)
		factory_class = mapping[discriminator]
		return factory_class.deserialize(buffer)
	}

	@classmethod
	Transaction create_by_name(entity_name: str){
		mapping = {
			'account_key_link_transaction_v1': AccountKeyLinkTransactionV1,
			'node_key_link_transaction_v1': NodeKeyLinkTransactionV1,
			'aggregate_complete_transaction_v1': AggregateCompleteTransactionV1,
			'aggregate_complete_transaction_v2': AggregateCompleteTransactionV2,
			'aggregate_bonded_transaction_v1': AggregateBondedTransactionV1,
			'aggregate_bonded_transaction_v2': AggregateBondedTransactionV2,
			'voting_key_link_transaction_v1': VotingKeyLinkTransactionV1,
			'vrf_key_link_transaction_v1': VrfKeyLinkTransactionV1,
			'hash_lock_transaction_v1': HashLockTransactionV1,
			'secret_lock_transaction_v1': SecretLockTransactionV1,
			'secret_proof_transaction_v1': SecretProofTransactionV1,
			'account_metadata_transaction_v1': AccountMetadataTransactionV1,
			'mosaic_metadata_transaction_v1': MosaicMetadataTransactionV1,
			'namespace_metadata_transaction_v1': NamespaceMetadataTransactionV1,
			'mosaic_definition_transaction_v1': MosaicDefinitionTransactionV1,
			'mosaic_supply_change_transaction_v1': MosaicSupplyChangeTransactionV1,
			'mosaic_supply_revocation_transaction_v1': MosaicSupplyRevocationTransactionV1,
			'multisig_account_modification_transaction_v1': MultisigAccountModificationTransactionV1,
			'address_alias_transaction_v1': AddressAliasTransactionV1,
			'mosaic_alias_transaction_v1': MosaicAliasTransactionV1,
			'namespace_registration_transaction_v1': NamespaceRegistrationTransactionV1,
			'account_address_restriction_transaction_v1': AccountAddressRestrictionTransactionV1,
			'account_mosaic_restriction_transaction_v1': AccountMosaicRestrictionTransactionV1,
			'account_operation_restriction_transaction_v1': AccountOperationRestrictionTransactionV1,
			'mosaic_address_restriction_transaction_v1': MosaicAddressRestrictionTransactionV1,
			'mosaic_global_restriction_transaction_v1': MosaicGlobalRestrictionTransactionV1,
			'transfer_transaction_v1': TransferTransactionV1
		}

		if entity_name not in mapping:
			raise ValueError(f'unknown Transaction type {entity_name}')

		return mapping[entity_name]()
	}
}


class EmbeddedTransactionFactory {
	@classmethod
	EmbeddedTransaction deserialize(payload: bytes){
		buffer = bytes(payload)
		parent = EmbeddedTransaction.deserialize(buffer)
		mapping = {
			(EmbeddedAccountKeyLinkTransactionV1.TRANSACTION_TYPE, EmbeddedAccountKeyLinkTransactionV1.TRANSACTION_VERSION): EmbeddedAccountKeyLinkTransactionV1,
			(EmbeddedNodeKeyLinkTransactionV1.TRANSACTION_TYPE, EmbeddedNodeKeyLinkTransactionV1.TRANSACTION_VERSION): EmbeddedNodeKeyLinkTransactionV1,
			(EmbeddedVotingKeyLinkTransactionV1.TRANSACTION_TYPE, EmbeddedVotingKeyLinkTransactionV1.TRANSACTION_VERSION): EmbeddedVotingKeyLinkTransactionV1,
			(EmbeddedVrfKeyLinkTransactionV1.TRANSACTION_TYPE, EmbeddedVrfKeyLinkTransactionV1.TRANSACTION_VERSION): EmbeddedVrfKeyLinkTransactionV1,
			(EmbeddedHashLockTransactionV1.TRANSACTION_TYPE, EmbeddedHashLockTransactionV1.TRANSACTION_VERSION): EmbeddedHashLockTransactionV1,
			(EmbeddedSecretLockTransactionV1.TRANSACTION_TYPE, EmbeddedSecretLockTransactionV1.TRANSACTION_VERSION): EmbeddedSecretLockTransactionV1,
			(EmbeddedSecretProofTransactionV1.TRANSACTION_TYPE, EmbeddedSecretProofTransactionV1.TRANSACTION_VERSION): EmbeddedSecretProofTransactionV1,
			(EmbeddedAccountMetadataTransactionV1.TRANSACTION_TYPE, EmbeddedAccountMetadataTransactionV1.TRANSACTION_VERSION): EmbeddedAccountMetadataTransactionV1,
			(EmbeddedMosaicMetadataTransactionV1.TRANSACTION_TYPE, EmbeddedMosaicMetadataTransactionV1.TRANSACTION_VERSION): EmbeddedMosaicMetadataTransactionV1,
			(EmbeddedNamespaceMetadataTransactionV1.TRANSACTION_TYPE, EmbeddedNamespaceMetadataTransactionV1.TRANSACTION_VERSION): EmbeddedNamespaceMetadataTransactionV1,
			(EmbeddedMosaicDefinitionTransactionV1.TRANSACTION_TYPE, EmbeddedMosaicDefinitionTransactionV1.TRANSACTION_VERSION): EmbeddedMosaicDefinitionTransactionV1,
			(EmbeddedMosaicSupplyChangeTransactionV1.TRANSACTION_TYPE, EmbeddedMosaicSupplyChangeTransactionV1.TRANSACTION_VERSION): EmbeddedMosaicSupplyChangeTransactionV1,
			(EmbeddedMosaicSupplyRevocationTransactionV1.TRANSACTION_TYPE, EmbeddedMosaicSupplyRevocationTransactionV1.TRANSACTION_VERSION): EmbeddedMosaicSupplyRevocationTransactionV1,
			(EmbeddedMultisigAccountModificationTransactionV1.TRANSACTION_TYPE, EmbeddedMultisigAccountModificationTransactionV1.TRANSACTION_VERSION): EmbeddedMultisigAccountModificationTransactionV1,
			(EmbeddedAddressAliasTransactionV1.TRANSACTION_TYPE, EmbeddedAddressAliasTransactionV1.TRANSACTION_VERSION): EmbeddedAddressAliasTransactionV1,
			(EmbeddedMosaicAliasTransactionV1.TRANSACTION_TYPE, EmbeddedMosaicAliasTransactionV1.TRANSACTION_VERSION): EmbeddedMosaicAliasTransactionV1,
			(EmbeddedNamespaceRegistrationTransactionV1.TRANSACTION_TYPE, EmbeddedNamespaceRegistrationTransactionV1.TRANSACTION_VERSION): EmbeddedNamespaceRegistrationTransactionV1,
			(EmbeddedAccountAddressRestrictionTransactionV1.TRANSACTION_TYPE, EmbeddedAccountAddressRestrictionTransactionV1.TRANSACTION_VERSION): EmbeddedAccountAddressRestrictionTransactionV1,
			(EmbeddedAccountMosaicRestrictionTransactionV1.TRANSACTION_TYPE, EmbeddedAccountMosaicRestrictionTransactionV1.TRANSACTION_VERSION): EmbeddedAccountMosaicRestrictionTransactionV1,
			(EmbeddedAccountOperationRestrictionTransactionV1.TRANSACTION_TYPE, EmbeddedAccountOperationRestrictionTransactionV1.TRANSACTION_VERSION): EmbeddedAccountOperationRestrictionTransactionV1,
			(EmbeddedMosaicAddressRestrictionTransactionV1.TRANSACTION_TYPE, EmbeddedMosaicAddressRestrictionTransactionV1.TRANSACTION_VERSION): EmbeddedMosaicAddressRestrictionTransactionV1,
			(EmbeddedMosaicGlobalRestrictionTransactionV1.TRANSACTION_TYPE, EmbeddedMosaicGlobalRestrictionTransactionV1.TRANSACTION_VERSION): EmbeddedMosaicGlobalRestrictionTransactionV1,
			(EmbeddedTransferTransactionV1.TRANSACTION_TYPE, EmbeddedTransferTransactionV1.TRANSACTION_VERSION): EmbeddedTransferTransactionV1
		}
		discriminator = (parent.type_, parent.version)
		factory_class = mapping[discriminator]
		return factory_class.deserialize(buffer)
	}

	@classmethod
	EmbeddedTransaction create_by_name(entity_name: str){
		mapping = {
			'account_key_link_transaction_v1': EmbeddedAccountKeyLinkTransactionV1,
			'node_key_link_transaction_v1': EmbeddedNodeKeyLinkTransactionV1,
			'voting_key_link_transaction_v1': EmbeddedVotingKeyLinkTransactionV1,
			'vrf_key_link_transaction_v1': EmbeddedVrfKeyLinkTransactionV1,
			'hash_lock_transaction_v1': EmbeddedHashLockTransactionV1,
			'secret_lock_transaction_v1': EmbeddedSecretLockTransactionV1,
			'secret_proof_transaction_v1': EmbeddedSecretProofTransactionV1,
			'account_metadata_transaction_v1': EmbeddedAccountMetadataTransactionV1,
			'mosaic_metadata_transaction_v1': EmbeddedMosaicMetadataTransactionV1,
			'namespace_metadata_transaction_v1': EmbeddedNamespaceMetadataTransactionV1,
			'mosaic_definition_transaction_v1': EmbeddedMosaicDefinitionTransactionV1,
			'mosaic_supply_change_transaction_v1': EmbeddedMosaicSupplyChangeTransactionV1,
			'mosaic_supply_revocation_transaction_v1': EmbeddedMosaicSupplyRevocationTransactionV1,
			'multisig_account_modification_transaction_v1': EmbeddedMultisigAccountModificationTransactionV1,
			'address_alias_transaction_v1': EmbeddedAddressAliasTransactionV1,
			'mosaic_alias_transaction_v1': EmbeddedMosaicAliasTransactionV1,
			'namespace_registration_transaction_v1': EmbeddedNamespaceRegistrationTransactionV1,
			'account_address_restriction_transaction_v1': EmbeddedAccountAddressRestrictionTransactionV1,
			'account_mosaic_restriction_transaction_v1': EmbeddedAccountMosaicRestrictionTransactionV1,
			'account_operation_restriction_transaction_v1': EmbeddedAccountOperationRestrictionTransactionV1,
			'mosaic_address_restriction_transaction_v1': EmbeddedMosaicAddressRestrictionTransactionV1,
			'mosaic_global_restriction_transaction_v1': EmbeddedMosaicGlobalRestrictionTransactionV1,
			'transfer_transaction_v1': EmbeddedTransferTransactionV1
		}

		if entity_name not in mapping:
			raise ValueError(f'unknown EmbeddedTransaction type {entity_name}')

		return mapping[entity_name]()
	}
}


class BlockFactory {
	@classmethod
	Block deserialize(payload: bytes){
		buffer = bytes(payload)
		parent = Block.deserialize(buffer)
		mapping = {
			(NemesisBlockV1.BLOCK_TYPE): NemesisBlockV1,
			(NormalBlockV1.BLOCK_TYPE): NormalBlockV1,
			(ImportanceBlockV1.BLOCK_TYPE): ImportanceBlockV1
		}
		discriminator = (parent.type_)
		factory_class = mapping[discriminator]
		return factory_class.deserialize(buffer)
	}

	@classmethod
	Block create_by_name(entity_name: str){
		mapping = {
			'nemesis_block_v1': NemesisBlockV1,
			'normal_block_v1': NormalBlockV1,
			'importance_block_v1': ImportanceBlockV1
		}

		if entity_name not in mapping:
			raise ValueError(f'unknown Block type {entity_name}')

		return mapping[entity_name]()
	}
}


class ReceiptFactory {
	@classmethod
	Receipt deserialize(payload: bytes){
		buffer = bytes(payload)
		parent = Receipt.deserialize(buffer)
		mapping = {
			(HarvestFeeReceipt.RECEIPT_TYPE): HarvestFeeReceipt,
			(InflationReceipt.RECEIPT_TYPE): InflationReceipt,
			(LockHashCreatedFeeReceipt.RECEIPT_TYPE): LockHashCreatedFeeReceipt,
			(LockHashCompletedFeeReceipt.RECEIPT_TYPE): LockHashCompletedFeeReceipt,
			(LockHashExpiredFeeReceipt.RECEIPT_TYPE): LockHashExpiredFeeReceipt,
			(LockSecretCreatedFeeReceipt.RECEIPT_TYPE): LockSecretCreatedFeeReceipt,
			(LockSecretCompletedFeeReceipt.RECEIPT_TYPE): LockSecretCompletedFeeReceipt,
			(LockSecretExpiredFeeReceipt.RECEIPT_TYPE): LockSecretExpiredFeeReceipt,
			(MosaicExpiredReceipt.RECEIPT_TYPE): MosaicExpiredReceipt,
			(MosaicRentalFeeReceipt.RECEIPT_TYPE): MosaicRentalFeeReceipt,
			(NamespaceExpiredReceipt.RECEIPT_TYPE): NamespaceExpiredReceipt,
			(NamespaceDeletedReceipt.RECEIPT_TYPE): NamespaceDeletedReceipt,
			(NamespaceRentalFeeReceipt.RECEIPT_TYPE): NamespaceRentalFeeReceipt
		}
		discriminator = (parent.type_)
		factory_class = mapping[discriminator]
		return factory_class.deserialize(buffer)
	}

	@classmethod
	Receipt create_by_name(entity_name: str){
		mapping = {
			'harvest_fee_receipt': HarvestFeeReceipt,
			'inflation_receipt': InflationReceipt,
			'lock_hash_created_fee_receipt': LockHashCreatedFeeReceipt,
			'lock_hash_completed_fee_receipt': LockHashCompletedFeeReceipt,
			'lock_hash_expired_fee_receipt': LockHashExpiredFeeReceipt,
			'lock_secret_created_fee_receipt': LockSecretCreatedFeeReceipt,
			'lock_secret_completed_fee_receipt': LockSecretCompletedFeeReceipt,
			'lock_secret_expired_fee_receipt': LockSecretExpiredFeeReceipt,
			'mosaic_expired_receipt': MosaicExpiredReceipt,
			'mosaic_rental_fee_receipt': MosaicRentalFeeReceipt,
			'namespace_expired_receipt': NamespaceExpiredReceipt,
			'namespace_deleted_receipt': NamespaceDeletedReceipt,
			'namespace_rental_fee_receipt': NamespaceRentalFeeReceipt
		}

		if entity_name not in mapping:
			raise ValueError(f'unknown Receipt type {entity_name}')

		return mapping[entity_name]()
	}
}
