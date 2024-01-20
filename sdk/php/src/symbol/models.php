<?php
	namespace symbol;
	require_once dirname(__FILE__).'/../BaseValue.php';
	require_once dirname(__FILE__).'/../utils/converter.php';
	use BaseValue;
	use utils\Converter;
class Amount extends BaseValue {
	const SIZE = 8;

	public function __construct($amount = 0){
		parent::__construct(self::SIZE, $amount);
	}

	public static function deserialize($payload){
		$byteArray = $payload;
		return new Amount(Converter::bytesToInt(byteArray));
	}

	public function serialize(){
		return Converter::intToBytes($$this->value);
	}
}


class BlockDuration extends BaseValue {
	const SIZE = 8;

	public function __construct($block_duration = 0){
		parent::__construct(self::SIZE, $block_duration);
	}

	public static function deserialize($payload){
		$byteArray = $payload;
		return new BlockDuration(Converter::bytesToInt(byteArray));
	}

	public function serialize(){
		return Converter::intToBytes($$this->value);
	}
}


class BlockFeeMultiplier extends BaseValue {
	const SIZE = 4;

	public function __construct($block_fee_multiplier = 0){
		parent::__construct(self::SIZE, $block_fee_multiplier);
	}

	public static function deserialize($payload){
		$byteArray = $payload;
		return new BlockFeeMultiplier(Converter::bytesToInt(byteArray));
	}

	public function serialize(){
		return Converter::intToBytes($$this->value);
	}
}


class Difficulty extends BaseValue {
	const SIZE = 8;

	public function __construct($difficulty = 0){
		parent::__construct(self::SIZE, $difficulty);
	}

	public static function deserialize($payload){
		$byteArray = $payload;
		return new Difficulty(Converter::bytesToInt(byteArray));
	}

	public function serialize(){
		return Converter::intToBytes($$this->value);
	}
}


class FinalizationEpoch extends BaseValue {
	const SIZE = 4;

	public function __construct($finalization_epoch = 0){
		parent::__construct(self::SIZE, $finalization_epoch);
	}

	public static function deserialize($payload){
		$byteArray = $payload;
		return new FinalizationEpoch(Converter::bytesToInt(byteArray));
	}

	public function serialize(){
		return Converter::intToBytes($$this->value);
	}
}


class FinalizationPoint extends BaseValue {
	const SIZE = 4;

	public function __construct($finalization_point = 0){
		parent::__construct(self::SIZE, $finalization_point);
	}

	public static function deserialize($payload){
		$byteArray = $payload;
		return new FinalizationPoint(Converter::bytesToInt(byteArray));
	}

	public function serialize(){
		return Converter::intToBytes($$this->value);
	}
}


class Height extends BaseValue {
	const SIZE = 8;

	public function __construct($height = 0){
		parent::__construct(self::SIZE, $height);
	}

	public static function deserialize($payload){
		$byteArray = $payload;
		return new Height(Converter::bytesToInt(byteArray));
	}

	public function serialize(){
		return Converter::intToBytes($$this->value);
	}
}


class Importance extends BaseValue {
	const SIZE = 8;

	public function __construct($importance = 0){
		parent::__construct(self::SIZE, $importance);
	}

	public static function deserialize($payload){
		$byteArray = $payload;
		return new Importance(Converter::bytesToInt(byteArray));
	}

	public function serialize(){
		return Converter::intToBytes($$this->value);
	}
}


class ImportanceHeight extends BaseValue {
	const SIZE = 8;

	public function __construct($importance_height = 0){
		parent::__construct(self::SIZE, $importance_height);
	}

	public static function deserialize($payload){
		$byteArray = $payload;
		return new ImportanceHeight(Converter::bytesToInt(byteArray));
	}

	public function serialize(){
		return Converter::intToBytes($$this->value);
	}
}


class UnresolvedMosaicId extends BaseValue {
	const SIZE = 8;

	public function __construct($unresolved_mosaic_id = 0){
		parent::__construct(self::SIZE, $unresolved_mosaic_id);
	}

	public static function deserialize($payload){
		$byteArray = $payload;
		return new UnresolvedMosaicId(Converter::bytesToInt(byteArray));
	}

	public function serialize(){
		return Converter::intToBytes($$this->value);
	}
}


class MosaicId extends BaseValue {
	const SIZE = 8;

	public function __construct($mosaic_id = 0){
		parent::__construct(self::SIZE, $mosaic_id);
	}

	public static function deserialize($payload){
		$byteArray = $payload;
		return new MosaicId(Converter::bytesToInt(byteArray));
	}

	public function serialize(){
		return Converter::intToBytes($$this->value);
	}
}


class Timestamp extends BaseValue {
	const SIZE = 8;

	public function __construct($timestamp = 0){
		parent::__construct(self::SIZE, $timestamp);
	}

	public static function deserialize($payload){
		$byteArray = $payload;
		return new Timestamp(Converter::bytesToInt(byteArray));
	}

	public function serialize(){
		return Converter::intToBytes($$this->value);
	}
}


class UnresolvedAddress extends ByteArray {
	const SIZE = 24;

	public function __construct(unresolved_address = bytes(24)){
		parent::__construct(self::SIZE, $unresolved_address);
	}

	size(){
		return 24;
	}

	public static function deserialize($payload){
		$byteArray = $payload;
		return new UnresolvedAddress(ArrayHelpers.get_bytes(buffer, 24));
	}

	public function serialize(){
		return this.bytes;
	}
}


class Address extends ByteArray {
	const SIZE = 24;

	public function __construct(address = bytes(24)){
		parent::__construct(self::SIZE, $address);
	}

	size(){
		return 24;
	}

	public static function deserialize($payload){
		$byteArray = $payload;
		return new Address(ArrayHelpers.get_bytes(buffer, 24));
	}

	public function serialize(){
		return this.bytes;
	}
}


class Hash256 extends ByteArray {
	const SIZE = 32;

	public function __construct(hash256 = bytes(32)){
		parent::__construct(self::SIZE, $hash256);
	}

	size(){
		return 32;
	}

	public static function deserialize($payload){
		$byteArray = $payload;
		return new Hash256(ArrayHelpers.get_bytes(buffer, 32));
	}

	public function serialize(){
		return this.bytes;
	}
}


class Hash512 extends ByteArray {
	const SIZE = 64;

	public function __construct(hash512 = bytes(64)){
		parent::__construct(self::SIZE, $hash512);
	}

	size(){
		return 64;
	}

	public static function deserialize($payload){
		$byteArray = $payload;
		return new Hash512(ArrayHelpers.get_bytes(buffer, 64));
	}

	public function serialize(){
		return this.bytes;
	}
}


class PublicKey extends ByteArray {
	const SIZE = 32;

	public function __construct(public_key = bytes(32)){
		parent::__construct(self::SIZE, $public_key);
	}

	size(){
		return 32;
	}

	public static function deserialize($payload){
		$byteArray = $payload;
		return new PublicKey(ArrayHelpers.get_bytes(buffer, 32));
	}

	public function serialize(){
		return this.bytes;
	}
}


class VotingPublicKey extends ByteArray {
	const SIZE = 32;

	public function __construct(voting_public_key = bytes(32)){
		parent::__construct(self::SIZE, $voting_public_key);
	}

	size(){
		return 32;
	}

	public static function deserialize($payload){
		$byteArray = $payload;
		return new VotingPublicKey(ArrayHelpers.get_bytes(buffer, 32));
	}

	public function serialize(){
		return this.bytes;
	}
}


class Signature extends ByteArray {
	const SIZE = 64;

	public function __construct(signature = bytes(64)){
		parent::__construct(self::SIZE, $signature);
	}

	size(){
		return 64;
	}

	public static function deserialize($payload){
		$byteArray = $payload;
		return new Signature(ArrayHelpers.get_bytes(buffer, 64));
	}

	public function serialize(){
		return this.bytes;
	}
}


class Mosaic {
	TYPE_HINTS = {
		'mosaic_id': 'pod:MosaicId',
		'amount': 'pod:Amount'
	}

	public function __construct(){
		self._mosaic_id = MosaicId()
		self._amount = Amount()
	}

	sort(){
		pass
	}

	mosaic_id(){
		return self._mosaic_id
	}

	amount(){
		return self._amount
	}

	mosaic_id(value: MosaicId){
		self._mosaic_id = value
	}

	amount(value: Amount){
		self._amount = value
	}

	size(){
		size = 0
		size += self.mosaic_id.size
		size += self.amount.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		mosaic_id = MosaicId.deserialize(buffer)
		buffer = buffer[mosaic_id.size:]
		amount = Amount.deserialize(buffer)
		buffer = buffer[amount.size:]

		instance = Mosaic()
		instance._mosaic_id = mosaic_id
		instance._amount = amount
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self._mosaic_id.serialize()
		buffer += self._amount.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'mosaic_id: {self._mosaic_id.__str__()}, '
		result += f'amount: {self._amount.__str__()}, '
		result += ')'
		return result
	}
}


class UnresolvedMosaic {
	TYPE_HINTS = {
		'mosaic_id': 'pod:UnresolvedMosaicId',
		'amount': 'pod:Amount'
	}

	public function __construct(){
		self._mosaic_id = UnresolvedMosaicId()
		self._amount = Amount()
	}

	sort(){
		pass
	}

	mosaic_id(){
		return self._mosaic_id
	}

	amount(){
		return self._amount
	}

	mosaic_id(value: UnresolvedMosaicId){
		self._mosaic_id = value
	}

	amount(value: Amount){
		self._amount = value
	}

	size(){
		size = 0
		size += self.mosaic_id.size
		size += self.amount.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		mosaic_id = UnresolvedMosaicId.deserialize(buffer)
		buffer = buffer[mosaic_id.size:]
		amount = Amount.deserialize(buffer)
		buffer = buffer[amount.size:]

		instance = UnresolvedMosaic()
		instance._mosaic_id = mosaic_id
		instance._amount = amount
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self._mosaic_id.serialize()
		buffer += self._amount.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'mosaic_id: {self._mosaic_id.__str__()}, '
		result += f'amount: {self._amount.__str__()}, '
		result += ')'
		return result
	}
}


class LinkAction extends (Enum) {
	UNLINK = 0
	LINK = 1

	size(){
		return 1
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		return LinkAction(Converter::bytesToInt(byteArray))
	}

	public function serialize(){
		buffer = bytes()
		buffer += Converter::intToBytes($self.value)
		return buffer
	}
}


class NetworkType extends (Enum) {
	MAINNET = 104
	TESTNET = 152

	size(){
		return 1
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		return NetworkType(Converter::bytesToInt(byteArray))
	}

	public function serialize(){
		buffer = bytes()
		buffer += Converter::intToBytes($self.value)
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

	size(){
		return 2
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		return TransactionType(Converter::bytesToInt(byteArray))
	}

	public function serialize(){
		buffer = bytes()
		buffer += Converter::intToBytes($self.value)
		return buffer
	}
}


class Transaction {
	TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp'
	}

	public function __construct(){
		self._signature = Signature()
		self._signer_public_key = PublicKey()
		self._version = 0
		self._network = NetworkType.MAINNET
		self._type_ = TransactionType.ACCOUNT_KEY_LINK
		self._fee = Amount()
		self._deadline = Timestamp()
		self._verifiable_entity_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
	}

	sort(){
		pass
	}

	signature(){
		return self._signature
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	fee(){
		return self._fee
	}

	deadline(){
		return self._deadline
	}

	signature(value: Signature){
		self._signature = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	fee(value: Amount){
		self._fee = value
	}

	deadline(value: Timestamp){
		self._deadline = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signer_public_key.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiable_entity_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert verifiable_entity_header_reserved_1 == 0, f'Invalid value of reserved field ({verifiable_entity_header_reserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
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
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._verifiable_entity_header_reserved_1)
		buffer += self._signature.serialize()
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
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
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType'
	}

	public function __construct(){
		self._signer_public_key = PublicKey()
		self._version = 0
		self._network = NetworkType.MAINNET
		self._type_ = TransactionType.ACCOUNT_KEY_LINK
		self._embedded_transaction_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
	}

	sort(){
		pass
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signer_public_key.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		embedded_transaction_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert embedded_transaction_header_reserved_1 == 0, f'Invalid value of reserved field ({embedded_transaction_header_reserved_1})'
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]

		instance = EmbeddedTransaction()
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._embedded_transaction_header_reserved_1)
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += ')'
		return result
	}
}


class ProofGamma extends ByteArray {
	const SIZE = 32;

	public function __construct(proof_gamma = bytes(32)){
		parent::__construct(self::SIZE, $proof_gamma);
	}

	size(){
		return 32;
	}

	public static function deserialize($payload){
		$byteArray = $payload;
		return new ProofGamma(ArrayHelpers.get_bytes(buffer, 32));
	}

	public function serialize(){
		return this.bytes;
	}
}


class ProofVerificationHash extends ByteArray {
	const SIZE = 16;

	public function __construct(proof_verification_hash = bytes(16)){
		parent::__construct(self::SIZE, $proof_verification_hash);
	}

	size(){
		return 16;
	}

	public static function deserialize($payload){
		$byteArray = $payload;
		return new ProofVerificationHash(ArrayHelpers.get_bytes(buffer, 16));
	}

	public function serialize(){
		return this.bytes;
	}
}


class ProofScalar extends ByteArray {
	const SIZE = 32;

	public function __construct(proof_scalar = bytes(32)){
		parent::__construct(self::SIZE, $proof_scalar);
	}

	size(){
		return 32;
	}

	public static function deserialize($payload){
		$byteArray = $payload;
		return new ProofScalar(ArrayHelpers.get_bytes(buffer, 32));
	}

	public function serialize(){
		return this.bytes;
	}
}


class BlockType extends (Enum) {
	NEMESIS = 32835
	NORMAL = 33091
	IMPORTANCE = 33347

	size(){
		return 2
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		return BlockType(Converter::bytesToInt(byteArray))
	}

	public function serialize(){
		buffer = bytes()
		buffer += Converter::intToBytes($self.value)
		return buffer
	}
}


class VrfProof {
	TYPE_HINTS = {
		'gamma': 'pod:ProofGamma',
		'verification_hash': 'pod:ProofVerificationHash',
		'scalar': 'pod:ProofScalar'
	}

	public function __construct(){
		self._gamma = ProofGamma()
		self._verification_hash = ProofVerificationHash()
		self._scalar = ProofScalar()
	}

	sort(){
		pass
	}

	gamma(){
		return self._gamma
	}

	verification_hash(){
		return self._verification_hash
	}

	scalar(){
		return self._scalar
	}

	gamma(value: ProofGamma){
		self._gamma = value
	}

	verification_hash(value: ProofVerificationHash){
		self._verification_hash = value
	}

	scalar(value: ProofScalar){
		self._scalar = value
	}

	size(){
		size = 0
		size += self.gamma.size
		size += self.verification_hash.size
		size += self.scalar.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		gamma = ProofGamma.deserialize(buffer)
		buffer = buffer[gamma.size:]
		verification_hash = ProofVerificationHash.deserialize(buffer)
		buffer = buffer[verification_hash.size:]
		scalar = ProofScalar.deserialize(buffer)
		buffer = buffer[scalar.size:]

		instance = VrfProof()
		instance._gamma = gamma
		instance._verification_hash = verification_hash
		instance._scalar = scalar
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self._gamma.serialize()
		buffer += self._verification_hash.serialize()
		buffer += self._scalar.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'gamma: {self._gamma.__str__()}, '
		result += f'verification_hash: {self._verification_hash.__str__()}, '
		result += f'scalar: {self._scalar.__str__()}, '
		result += ')'
		return result
	}
}


class Block {
	TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:BlockType',
		'height': 'pod:Height',
		'timestamp': 'pod:Timestamp',
		'difficulty': 'pod:Difficulty',
		'generation_hash_proof': 'struct:VrfProof',
		'previous_block_hash': 'pod:Hash256',
		'transactions_hash': 'pod:Hash256',
		'receipts_hash': 'pod:Hash256',
		'state_hash': 'pod:Hash256',
		'beneficiary_address': 'pod:Address',
		'fee_multiplier': 'pod:BlockFeeMultiplier'
	}

	public function __construct(){
		self._signature = Signature()
		self._signer_public_key = PublicKey()
		self._version = 0
		self._network = NetworkType.MAINNET
		self._type_ = BlockType.NEMESIS
		self._height = Height()
		self._timestamp = Timestamp()
		self._difficulty = Difficulty()
		self._generation_hash_proof = VrfProof()
		self._previous_block_hash = Hash256()
		self._transactions_hash = Hash256()
		self._receipts_hash = Hash256()
		self._state_hash = Hash256()
		self._beneficiary_address = Address()
		self._fee_multiplier = BlockFeeMultiplier()
		self._verifiable_entity_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
	}

	sort(){
		self._generation_hash_proof.sort()
	}

	signature(){
		return self._signature
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	height(){
		return self._height
	}

	timestamp(){
		return self._timestamp
	}

	difficulty(){
		return self._difficulty
	}

	generation_hash_proof(){
		return self._generation_hash_proof
	}

	previous_block_hash(){
		return self._previous_block_hash
	}

	transactions_hash(){
		return self._transactions_hash
	}

	receipts_hash(){
		return self._receipts_hash
	}

	state_hash(){
		return self._state_hash
	}

	beneficiary_address(){
		return self._beneficiary_address
	}

	fee_multiplier(){
		return self._fee_multiplier
	}

	signature(value: Signature){
		self._signature = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: BlockType){
		self._type_ = value
	}

	height(value: Height){
		self._height = value
	}

	timestamp(value: Timestamp){
		self._timestamp = value
	}

	difficulty(value: Difficulty){
		self._difficulty = value
	}

	generation_hash_proof(value: VrfProof){
		self._generation_hash_proof = value
	}

	previous_block_hash(value: Hash256){
		self._previous_block_hash = value
	}

	transactions_hash(value: Hash256){
		self._transactions_hash = value
	}

	receipts_hash(value: Hash256){
		self._receipts_hash = value
	}

	state_hash(value: Hash256){
		self._state_hash = value
	}

	beneficiary_address(value: Address){
		self._beneficiary_address = value
	}

	fee_multiplier(value: BlockFeeMultiplier){
		self._fee_multiplier = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signer_public_key.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.height.size
		size += self.timestamp.size
		size += self.difficulty.size
		size += self.generation_hash_proof.size
		size += self.previous_block_hash.size
		size += self.transactions_hash.size
		size += self.receipts_hash.size
		size += self.state_hash.size
		size += self.beneficiary_address.size
		size += self.fee_multiplier.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiable_entity_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert verifiable_entity_header_reserved_1 == 0, f'Invalid value of reserved field ({verifiable_entity_header_reserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
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
		generation_hash_proof = VrfProof.deserialize(buffer)
		buffer = buffer[generation_hash_proof.size:]
		previous_block_hash = Hash256.deserialize(buffer)
		buffer = buffer[previous_block_hash.size:]
		transactions_hash = Hash256.deserialize(buffer)
		buffer = buffer[transactions_hash.size:]
		receipts_hash = Hash256.deserialize(buffer)
		buffer = buffer[receipts_hash.size:]
		state_hash = Hash256.deserialize(buffer)
		buffer = buffer[state_hash.size:]
		beneficiary_address = Address.deserialize(buffer)
		buffer = buffer[beneficiary_address.size:]
		fee_multiplier = BlockFeeMultiplier.deserialize(buffer)
		buffer = buffer[fee_multiplier.size:]

		instance = Block()
		instance._signature = signature
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._height = height
		instance._timestamp = timestamp
		instance._difficulty = difficulty
		instance._generation_hash_proof = generation_hash_proof
		instance._previous_block_hash = previous_block_hash
		instance._transactions_hash = transactions_hash
		instance._receipts_hash = receipts_hash
		instance._state_hash = state_hash
		instance._beneficiary_address = beneficiary_address
		instance._fee_multiplier = fee_multiplier
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._verifiable_entity_header_reserved_1)
		buffer += self._signature.serialize()
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._height.serialize()
		buffer += self._timestamp.serialize()
		buffer += self._difficulty.serialize()
		buffer += self._generation_hash_proof.serialize()
		buffer += self._previous_block_hash.serialize()
		buffer += self._transactions_hash.serialize()
		buffer += self._receipts_hash.serialize()
		buffer += self._state_hash.serialize()
		buffer += self._beneficiary_address.serialize()
		buffer += self._fee_multiplier.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'height: {self._height.__str__()}, '
		result += f'timestamp: {self._timestamp.__str__()}, '
		result += f'difficulty: {self._difficulty.__str__()}, '
		result += f'generation_hash_proof: {self._generation_hash_proof.__str__()}, '
		result += f'previous_block_hash: {self._previous_block_hash.__str__()}, '
		result += f'transactions_hash: {self._transactions_hash.__str__()}, '
		result += f'receipts_hash: {self._receipts_hash.__str__()}, '
		result += f'state_hash: {self._state_hash.__str__()}, '
		result += f'beneficiary_address: {self._beneficiary_address.__str__()}, '
		result += f'fee_multiplier: {self._fee_multiplier.__str__()}, '
		result += ')'
		return result
	}
}


class NemesisBlockV1 {
	BLOCK_VERSION: int = 1
	BLOCK_TYPE: BlockType = BlockType.NEMESIS
	TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:BlockType',
		'height': 'pod:Height',
		'timestamp': 'pod:Timestamp',
		'difficulty': 'pod:Difficulty',
		'generation_hash_proof': 'struct:VrfProof',
		'previous_block_hash': 'pod:Hash256',
		'transactions_hash': 'pod:Hash256',
		'receipts_hash': 'pod:Hash256',
		'state_hash': 'pod:Hash256',
		'beneficiary_address': 'pod:Address',
		'fee_multiplier': 'pod:BlockFeeMultiplier',
		'total_voting_balance': 'pod:Amount',
		'previous_importance_block_hash': 'pod:Hash256',
		'transactions': 'array[Transaction]'
	}

	public function __construct(){
		self._signature = Signature()
		self._signer_public_key = PublicKey()
		self._version = NemesisBlockV1.BLOCK_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = NemesisBlockV1.BLOCK_TYPE
		self._height = Height()
		self._timestamp = Timestamp()
		self._difficulty = Difficulty()
		self._generation_hash_proof = VrfProof()
		self._previous_block_hash = Hash256()
		self._transactions_hash = Hash256()
		self._receipts_hash = Hash256()
		self._state_hash = Hash256()
		self._beneficiary_address = Address()
		self._fee_multiplier = BlockFeeMultiplier()
		self._voting_eligible_accounts_count = 0
		self._harvesting_eligible_accounts_count = 0
		self._total_voting_balance = Amount()
		self._previous_importance_block_hash = Hash256()
		self._transactions = []
		self._verifiable_entity_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
	}

	sort(){
		self._generation_hash_proof.sort()
	}

	signature(){
		return self._signature
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	height(){
		return self._height
	}

	timestamp(){
		return self._timestamp
	}

	difficulty(){
		return self._difficulty
	}

	generation_hash_proof(){
		return self._generation_hash_proof
	}

	previous_block_hash(){
		return self._previous_block_hash
	}

	transactions_hash(){
		return self._transactions_hash
	}

	receipts_hash(){
		return self._receipts_hash
	}

	state_hash(){
		return self._state_hash
	}

	beneficiary_address(){
		return self._beneficiary_address
	}

	fee_multiplier(){
		return self._fee_multiplier
	}

	voting_eligible_accounts_count(){
		return self._voting_eligible_accounts_count
	}

	harvesting_eligible_accounts_count(){
		return self._harvesting_eligible_accounts_count
	}

	total_voting_balance(){
		return self._total_voting_balance
	}

	previous_importance_block_hash(){
		return self._previous_importance_block_hash
	}

	transactions(){
		return self._transactions
	}

	signature(value: Signature){
		self._signature = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: BlockType){
		self._type_ = value
	}

	height(value: Height){
		self._height = value
	}

	timestamp(value: Timestamp){
		self._timestamp = value
	}

	difficulty(value: Difficulty){
		self._difficulty = value
	}

	generation_hash_proof(value: VrfProof){
		self._generation_hash_proof = value
	}

	previous_block_hash(value: Hash256){
		self._previous_block_hash = value
	}

	transactions_hash(value: Hash256){
		self._transactions_hash = value
	}

	receipts_hash(value: Hash256){
		self._receipts_hash = value
	}

	state_hash(value: Hash256){
		self._state_hash = value
	}

	beneficiary_address(value: Address){
		self._beneficiary_address = value
	}

	fee_multiplier(value: BlockFeeMultiplier){
		self._fee_multiplier = value
	}

	voting_eligible_accounts_count(value: int){
		self._voting_eligible_accounts_count = value
	}

	harvesting_eligible_accounts_count(value: int){
		self._harvesting_eligible_accounts_count = value
	}

	total_voting_balance(value: Amount){
		self._total_voting_balance = value
	}

	previous_importance_block_hash(value: Hash256){
		self._previous_importance_block_hash = value
	}

	transactions(value: List[Transaction]){
		self._transactions = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signer_public_key.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.height.size
		size += self.timestamp.size
		size += self.difficulty.size
		size += self.generation_hash_proof.size
		size += self.previous_block_hash.size
		size += self.transactions_hash.size
		size += self.receipts_hash.size
		size += self.state_hash.size
		size += self.beneficiary_address.size
		size += self.fee_multiplier.size
		size += 4
		size += 8
		size += self.total_voting_balance.size
		size += self.previous_importance_block_hash.size
		size += ArrayHelpers.size(self.transactions, 8, skip_last_element_padding=True)
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiable_entity_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert verifiable_entity_header_reserved_1 == 0, f'Invalid value of reserved field ({verifiable_entity_header_reserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
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
		generation_hash_proof = VrfProof.deserialize(buffer)
		buffer = buffer[generation_hash_proof.size:]
		previous_block_hash = Hash256.deserialize(buffer)
		buffer = buffer[previous_block_hash.size:]
		transactions_hash = Hash256.deserialize(buffer)
		buffer = buffer[transactions_hash.size:]
		receipts_hash = Hash256.deserialize(buffer)
		buffer = buffer[receipts_hash.size:]
		state_hash = Hash256.deserialize(buffer)
		buffer = buffer[state_hash.size:]
		beneficiary_address = Address.deserialize(buffer)
		buffer = buffer[beneficiary_address.size:]
		fee_multiplier = BlockFeeMultiplier.deserialize(buffer)
		buffer = buffer[fee_multiplier.size:]
		voting_eligible_accounts_count = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		harvesting_eligible_accounts_count = Converter::bytesToInt(byteArray)
		buffer = buffer[8:]
		total_voting_balance = Amount.deserialize(buffer)
		buffer = buffer[total_voting_balance.size:]
		previous_importance_block_hash = Hash256.deserialize(buffer)
		buffer = buffer[previous_importance_block_hash.size:]
		transactions = ArrayHelpers.read_variable_size_elements(buffer, TransactionFactory, 8, skip_last_element_padding=True)
		buffer = buffer[ArrayHelpers.size(transactions, 8, skip_last_element_padding=True):]

		instance = NemesisBlockV1()
		instance._signature = signature
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._height = height
		instance._timestamp = timestamp
		instance._difficulty = difficulty
		instance._generation_hash_proof = generation_hash_proof
		instance._previous_block_hash = previous_block_hash
		instance._transactions_hash = transactions_hash
		instance._receipts_hash = receipts_hash
		instance._state_hash = state_hash
		instance._beneficiary_address = beneficiary_address
		instance._fee_multiplier = fee_multiplier
		instance._voting_eligible_accounts_count = voting_eligible_accounts_count
		instance._harvesting_eligible_accounts_count = harvesting_eligible_accounts_count
		instance._total_voting_balance = total_voting_balance
		instance._previous_importance_block_hash = previous_importance_block_hash
		instance._transactions = transactions
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._verifiable_entity_header_reserved_1)
		buffer += self._signature.serialize()
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._height.serialize()
		buffer += self._timestamp.serialize()
		buffer += self._difficulty.serialize()
		buffer += self._generation_hash_proof.serialize()
		buffer += self._previous_block_hash.serialize()
		buffer += self._transactions_hash.serialize()
		buffer += self._receipts_hash.serialize()
		buffer += self._state_hash.serialize()
		buffer += self._beneficiary_address.serialize()
		buffer += self._fee_multiplier.serialize()
		buffer += Converter::intToBytes($self._voting_eligible_accounts_count)
		buffer += Converter::intToBytes($self._harvesting_eligible_accounts_count)
		buffer += self._total_voting_balance.serialize()
		buffer += self._previous_importance_block_hash.serialize()
		buffer += ArrayHelpers.write_variable_size_elements(self._transactions, 8, skip_last_element_padding=True)
		return buffer
	}

	__str__(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'height: {self._height.__str__()}, '
		result += f'timestamp: {self._timestamp.__str__()}, '
		result += f'difficulty: {self._difficulty.__str__()}, '
		result += f'generation_hash_proof: {self._generation_hash_proof.__str__()}, '
		result += f'previous_block_hash: {self._previous_block_hash.__str__()}, '
		result += f'transactions_hash: {self._transactions_hash.__str__()}, '
		result += f'receipts_hash: {self._receipts_hash.__str__()}, '
		result += f'state_hash: {self._state_hash.__str__()}, '
		result += f'beneficiary_address: {self._beneficiary_address.__str__()}, '
		result += f'fee_multiplier: {self._fee_multiplier.__str__()}, '
		result += f'voting_eligible_accounts_count: 0x{self._voting_eligible_accounts_count:X}, '
		result += f'harvesting_eligible_accounts_count: 0x{self._harvesting_eligible_accounts_count:X}, '
		result += f'total_voting_balance: {self._total_voting_balance.__str__()}, '
		result += f'previous_importance_block_hash: {self._previous_importance_block_hash.__str__()}, '
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
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:BlockType',
		'height': 'pod:Height',
		'timestamp': 'pod:Timestamp',
		'difficulty': 'pod:Difficulty',
		'generation_hash_proof': 'struct:VrfProof',
		'previous_block_hash': 'pod:Hash256',
		'transactions_hash': 'pod:Hash256',
		'receipts_hash': 'pod:Hash256',
		'state_hash': 'pod:Hash256',
		'beneficiary_address': 'pod:Address',
		'fee_multiplier': 'pod:BlockFeeMultiplier',
		'transactions': 'array[Transaction]'
	}

	public function __construct(){
		self._signature = Signature()
		self._signer_public_key = PublicKey()
		self._version = NormalBlockV1.BLOCK_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = NormalBlockV1.BLOCK_TYPE
		self._height = Height()
		self._timestamp = Timestamp()
		self._difficulty = Difficulty()
		self._generation_hash_proof = VrfProof()
		self._previous_block_hash = Hash256()
		self._transactions_hash = Hash256()
		self._receipts_hash = Hash256()
		self._state_hash = Hash256()
		self._beneficiary_address = Address()
		self._fee_multiplier = BlockFeeMultiplier()
		self._transactions = []
		self._verifiable_entity_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
		self._block_header_reserved_1 = 0  # reserved field
	}

	sort(){
		self._generation_hash_proof.sort()
	}

	signature(){
		return self._signature
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	height(){
		return self._height
	}

	timestamp(){
		return self._timestamp
	}

	difficulty(){
		return self._difficulty
	}

	generation_hash_proof(){
		return self._generation_hash_proof
	}

	previous_block_hash(){
		return self._previous_block_hash
	}

	transactions_hash(){
		return self._transactions_hash
	}

	receipts_hash(){
		return self._receipts_hash
	}

	state_hash(){
		return self._state_hash
	}

	beneficiary_address(){
		return self._beneficiary_address
	}

	fee_multiplier(){
		return self._fee_multiplier
	}

	transactions(){
		return self._transactions
	}

	signature(value: Signature){
		self._signature = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: BlockType){
		self._type_ = value
	}

	height(value: Height){
		self._height = value
	}

	timestamp(value: Timestamp){
		self._timestamp = value
	}

	difficulty(value: Difficulty){
		self._difficulty = value
	}

	generation_hash_proof(value: VrfProof){
		self._generation_hash_proof = value
	}

	previous_block_hash(value: Hash256){
		self._previous_block_hash = value
	}

	transactions_hash(value: Hash256){
		self._transactions_hash = value
	}

	receipts_hash(value: Hash256){
		self._receipts_hash = value
	}

	state_hash(value: Hash256){
		self._state_hash = value
	}

	beneficiary_address(value: Address){
		self._beneficiary_address = value
	}

	fee_multiplier(value: BlockFeeMultiplier){
		self._fee_multiplier = value
	}

	transactions(value: List[Transaction]){
		self._transactions = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signer_public_key.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.height.size
		size += self.timestamp.size
		size += self.difficulty.size
		size += self.generation_hash_proof.size
		size += self.previous_block_hash.size
		size += self.transactions_hash.size
		size += self.receipts_hash.size
		size += self.state_hash.size
		size += self.beneficiary_address.size
		size += self.fee_multiplier.size
		size += 4
		size += ArrayHelpers.size(self.transactions, 8, skip_last_element_padding=True)
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiable_entity_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert verifiable_entity_header_reserved_1 == 0, f'Invalid value of reserved field ({verifiable_entity_header_reserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
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
		generation_hash_proof = VrfProof.deserialize(buffer)
		buffer = buffer[generation_hash_proof.size:]
		previous_block_hash = Hash256.deserialize(buffer)
		buffer = buffer[previous_block_hash.size:]
		transactions_hash = Hash256.deserialize(buffer)
		buffer = buffer[transactions_hash.size:]
		receipts_hash = Hash256.deserialize(buffer)
		buffer = buffer[receipts_hash.size:]
		state_hash = Hash256.deserialize(buffer)
		buffer = buffer[state_hash.size:]
		beneficiary_address = Address.deserialize(buffer)
		buffer = buffer[beneficiary_address.size:]
		fee_multiplier = BlockFeeMultiplier.deserialize(buffer)
		buffer = buffer[fee_multiplier.size:]
		block_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert block_header_reserved_1 == 0, f'Invalid value of reserved field ({block_header_reserved_1})'
		transactions = ArrayHelpers.read_variable_size_elements(buffer, TransactionFactory, 8, skip_last_element_padding=True)
		buffer = buffer[ArrayHelpers.size(transactions, 8, skip_last_element_padding=True):]

		instance = NormalBlockV1()
		instance._signature = signature
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._height = height
		instance._timestamp = timestamp
		instance._difficulty = difficulty
		instance._generation_hash_proof = generation_hash_proof
		instance._previous_block_hash = previous_block_hash
		instance._transactions_hash = transactions_hash
		instance._receipts_hash = receipts_hash
		instance._state_hash = state_hash
		instance._beneficiary_address = beneficiary_address
		instance._fee_multiplier = fee_multiplier
		instance._transactions = transactions
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._verifiable_entity_header_reserved_1)
		buffer += self._signature.serialize()
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._height.serialize()
		buffer += self._timestamp.serialize()
		buffer += self._difficulty.serialize()
		buffer += self._generation_hash_proof.serialize()
		buffer += self._previous_block_hash.serialize()
		buffer += self._transactions_hash.serialize()
		buffer += self._receipts_hash.serialize()
		buffer += self._state_hash.serialize()
		buffer += self._beneficiary_address.serialize()
		buffer += self._fee_multiplier.serialize()
		buffer += Converter::intToBytes($self._block_header_reserved_1)
		buffer += ArrayHelpers.write_variable_size_elements(self._transactions, 8, skip_last_element_padding=True)
		return buffer
	}

	__str__(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'height: {self._height.__str__()}, '
		result += f'timestamp: {self._timestamp.__str__()}, '
		result += f'difficulty: {self._difficulty.__str__()}, '
		result += f'generation_hash_proof: {self._generation_hash_proof.__str__()}, '
		result += f'previous_block_hash: {self._previous_block_hash.__str__()}, '
		result += f'transactions_hash: {self._transactions_hash.__str__()}, '
		result += f'receipts_hash: {self._receipts_hash.__str__()}, '
		result += f'state_hash: {self._state_hash.__str__()}, '
		result += f'beneficiary_address: {self._beneficiary_address.__str__()}, '
		result += f'fee_multiplier: {self._fee_multiplier.__str__()}, '
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
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:BlockType',
		'height': 'pod:Height',
		'timestamp': 'pod:Timestamp',
		'difficulty': 'pod:Difficulty',
		'generation_hash_proof': 'struct:VrfProof',
		'previous_block_hash': 'pod:Hash256',
		'transactions_hash': 'pod:Hash256',
		'receipts_hash': 'pod:Hash256',
		'state_hash': 'pod:Hash256',
		'beneficiary_address': 'pod:Address',
		'fee_multiplier': 'pod:BlockFeeMultiplier',
		'total_voting_balance': 'pod:Amount',
		'previous_importance_block_hash': 'pod:Hash256',
		'transactions': 'array[Transaction]'
	}

	public function __construct(){
		self._signature = Signature()
		self._signer_public_key = PublicKey()
		self._version = ImportanceBlockV1.BLOCK_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = ImportanceBlockV1.BLOCK_TYPE
		self._height = Height()
		self._timestamp = Timestamp()
		self._difficulty = Difficulty()
		self._generation_hash_proof = VrfProof()
		self._previous_block_hash = Hash256()
		self._transactions_hash = Hash256()
		self._receipts_hash = Hash256()
		self._state_hash = Hash256()
		self._beneficiary_address = Address()
		self._fee_multiplier = BlockFeeMultiplier()
		self._voting_eligible_accounts_count = 0
		self._harvesting_eligible_accounts_count = 0
		self._total_voting_balance = Amount()
		self._previous_importance_block_hash = Hash256()
		self._transactions = []
		self._verifiable_entity_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
	}

	sort(){
		self._generation_hash_proof.sort()
	}

	signature(){
		return self._signature
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	height(){
		return self._height
	}

	timestamp(){
		return self._timestamp
	}

	difficulty(){
		return self._difficulty
	}

	generation_hash_proof(){
		return self._generation_hash_proof
	}

	previous_block_hash(){
		return self._previous_block_hash
	}

	transactions_hash(){
		return self._transactions_hash
	}

	receipts_hash(){
		return self._receipts_hash
	}

	state_hash(){
		return self._state_hash
	}

	beneficiary_address(){
		return self._beneficiary_address
	}

	fee_multiplier(){
		return self._fee_multiplier
	}

	voting_eligible_accounts_count(){
		return self._voting_eligible_accounts_count
	}

	harvesting_eligible_accounts_count(){
		return self._harvesting_eligible_accounts_count
	}

	total_voting_balance(){
		return self._total_voting_balance
	}

	previous_importance_block_hash(){
		return self._previous_importance_block_hash
	}

	transactions(){
		return self._transactions
	}

	signature(value: Signature){
		self._signature = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: BlockType){
		self._type_ = value
	}

	height(value: Height){
		self._height = value
	}

	timestamp(value: Timestamp){
		self._timestamp = value
	}

	difficulty(value: Difficulty){
		self._difficulty = value
	}

	generation_hash_proof(value: VrfProof){
		self._generation_hash_proof = value
	}

	previous_block_hash(value: Hash256){
		self._previous_block_hash = value
	}

	transactions_hash(value: Hash256){
		self._transactions_hash = value
	}

	receipts_hash(value: Hash256){
		self._receipts_hash = value
	}

	state_hash(value: Hash256){
		self._state_hash = value
	}

	beneficiary_address(value: Address){
		self._beneficiary_address = value
	}

	fee_multiplier(value: BlockFeeMultiplier){
		self._fee_multiplier = value
	}

	voting_eligible_accounts_count(value: int){
		self._voting_eligible_accounts_count = value
	}

	harvesting_eligible_accounts_count(value: int){
		self._harvesting_eligible_accounts_count = value
	}

	total_voting_balance(value: Amount){
		self._total_voting_balance = value
	}

	previous_importance_block_hash(value: Hash256){
		self._previous_importance_block_hash = value
	}

	transactions(value: List[Transaction]){
		self._transactions = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signer_public_key.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.height.size
		size += self.timestamp.size
		size += self.difficulty.size
		size += self.generation_hash_proof.size
		size += self.previous_block_hash.size
		size += self.transactions_hash.size
		size += self.receipts_hash.size
		size += self.state_hash.size
		size += self.beneficiary_address.size
		size += self.fee_multiplier.size
		size += 4
		size += 8
		size += self.total_voting_balance.size
		size += self.previous_importance_block_hash.size
		size += ArrayHelpers.size(self.transactions, 8, skip_last_element_padding=True)
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiable_entity_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert verifiable_entity_header_reserved_1 == 0, f'Invalid value of reserved field ({verifiable_entity_header_reserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
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
		generation_hash_proof = VrfProof.deserialize(buffer)
		buffer = buffer[generation_hash_proof.size:]
		previous_block_hash = Hash256.deserialize(buffer)
		buffer = buffer[previous_block_hash.size:]
		transactions_hash = Hash256.deserialize(buffer)
		buffer = buffer[transactions_hash.size:]
		receipts_hash = Hash256.deserialize(buffer)
		buffer = buffer[receipts_hash.size:]
		state_hash = Hash256.deserialize(buffer)
		buffer = buffer[state_hash.size:]
		beneficiary_address = Address.deserialize(buffer)
		buffer = buffer[beneficiary_address.size:]
		fee_multiplier = BlockFeeMultiplier.deserialize(buffer)
		buffer = buffer[fee_multiplier.size:]
		voting_eligible_accounts_count = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		harvesting_eligible_accounts_count = Converter::bytesToInt(byteArray)
		buffer = buffer[8:]
		total_voting_balance = Amount.deserialize(buffer)
		buffer = buffer[total_voting_balance.size:]
		previous_importance_block_hash = Hash256.deserialize(buffer)
		buffer = buffer[previous_importance_block_hash.size:]
		transactions = ArrayHelpers.read_variable_size_elements(buffer, TransactionFactory, 8, skip_last_element_padding=True)
		buffer = buffer[ArrayHelpers.size(transactions, 8, skip_last_element_padding=True):]

		instance = ImportanceBlockV1()
		instance._signature = signature
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._height = height
		instance._timestamp = timestamp
		instance._difficulty = difficulty
		instance._generation_hash_proof = generation_hash_proof
		instance._previous_block_hash = previous_block_hash
		instance._transactions_hash = transactions_hash
		instance._receipts_hash = receipts_hash
		instance._state_hash = state_hash
		instance._beneficiary_address = beneficiary_address
		instance._fee_multiplier = fee_multiplier
		instance._voting_eligible_accounts_count = voting_eligible_accounts_count
		instance._harvesting_eligible_accounts_count = harvesting_eligible_accounts_count
		instance._total_voting_balance = total_voting_balance
		instance._previous_importance_block_hash = previous_importance_block_hash
		instance._transactions = transactions
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._verifiable_entity_header_reserved_1)
		buffer += self._signature.serialize()
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._height.serialize()
		buffer += self._timestamp.serialize()
		buffer += self._difficulty.serialize()
		buffer += self._generation_hash_proof.serialize()
		buffer += self._previous_block_hash.serialize()
		buffer += self._transactions_hash.serialize()
		buffer += self._receipts_hash.serialize()
		buffer += self._state_hash.serialize()
		buffer += self._beneficiary_address.serialize()
		buffer += self._fee_multiplier.serialize()
		buffer += Converter::intToBytes($self._voting_eligible_accounts_count)
		buffer += Converter::intToBytes($self._harvesting_eligible_accounts_count)
		buffer += self._total_voting_balance.serialize()
		buffer += self._previous_importance_block_hash.serialize()
		buffer += ArrayHelpers.write_variable_size_elements(self._transactions, 8, skip_last_element_padding=True)
		return buffer
	}

	__str__(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'height: {self._height.__str__()}, '
		result += f'timestamp: {self._timestamp.__str__()}, '
		result += f'difficulty: {self._difficulty.__str__()}, '
		result += f'generation_hash_proof: {self._generation_hash_proof.__str__()}, '
		result += f'previous_block_hash: {self._previous_block_hash.__str__()}, '
		result += f'transactions_hash: {self._transactions_hash.__str__()}, '
		result += f'receipts_hash: {self._receipts_hash.__str__()}, '
		result += f'state_hash: {self._state_hash.__str__()}, '
		result += f'beneficiary_address: {self._beneficiary_address.__str__()}, '
		result += f'fee_multiplier: {self._fee_multiplier.__str__()}, '
		result += f'voting_eligible_accounts_count: 0x{self._voting_eligible_accounts_count:X}, '
		result += f'harvesting_eligible_accounts_count: 0x{self._harvesting_eligible_accounts_count:X}, '
		result += f'total_voting_balance: {self._total_voting_balance.__str__()}, '
		result += f'previous_importance_block_hash: {self._previous_importance_block_hash.__str__()}, '
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

	public function __construct(){
		self._epoch = FinalizationEpoch()
		self._point = FinalizationPoint()
	}

	sort(){
		pass
	}

	epoch(){
		return self._epoch
	}

	point(){
		return self._point
	}

	epoch(value: FinalizationEpoch){
		self._epoch = value
	}

	point(value: FinalizationPoint){
		self._point = value
	}

	size(){
		size = 0
		size += self.epoch.size
		size += self.point.size
		return size
	}

	public static function deserialize($payload){
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

	public function serialize(){
		buffer = bytes()
		buffer += self._epoch.serialize()
		buffer += self._point.serialize()
		return buffer
	}

	__str__(){
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

	public function __construct(){
		self._round = FinalizationRound()
		self._height = Height()
		self._hash = Hash256()
	}

	sort(){
		self._round.sort()
	}

	round(){
		return self._round
	}

	height(){
		return self._height
	}

	hash(){
		return self._hash
	}

	round(value: FinalizationRound){
		self._round = value
	}

	height(value: Height){
		self._height = value
	}

	hash(value: Hash256){
		self._hash = value
	}

	size(){
		size = 0
		size += self.round.size
		size += self.height.size
		size += self.hash.size
		return size
	}

	public static function deserialize($payload){
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

	public function serialize(){
		buffer = bytes()
		buffer += self._round.serialize()
		buffer += self._height.serialize()
		buffer += self._hash.serialize()
		return buffer
	}

	__str__(){
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

	size(){
		return 2
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		return ReceiptType(Converter::bytesToInt(byteArray))
	}

	public function serialize(){
		buffer = bytes()
		buffer += Converter::intToBytes($self.value)
		return buffer
	}
}


class Receipt {
	TYPE_HINTS = {
		'type_': 'enum:ReceiptType'
	}

	public function __construct(){
		self._version = 0
		self._type_ = ReceiptType.MOSAIC_RENTAL_FEE
	}

	sort(){
		pass
	}

	version(){
		return self._version
	}

	type_(){
		return self._type_
	}

	version(value: int){
		self._version = value
	}

	type_(value: ReceiptType){
		self._type_ = value
	}

	size(){
		size = 0
		size += 4
		size += 2
		size += self.type_.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[2:]
		type_ = ReceiptType.deserialize(buffer)
		buffer = buffer[type_.size:]

		instance = Receipt()
		instance._version = version
		instance._type_ = type_
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._version)
		buffer += self._type_.serialize()
		return buffer
	}

	__str__(){
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
		'target_address': 'pod:Address'
	}

	public function __construct(){
		self._version = 0
		self._type_ = HarvestFeeReceipt.RECEIPT_TYPE
		self._mosaic = Mosaic()
		self._target_address = Address()
	}

	sort(){
		self._mosaic.sort()
	}

	version(){
		return self._version
	}

	type_(){
		return self._type_
	}

	mosaic(){
		return self._mosaic
	}

	target_address(){
		return self._target_address
	}

	version(value: int){
		self._version = value
	}

	type_(value: ReceiptType){
		self._type_ = value
	}

	mosaic(value: Mosaic){
		self._mosaic = value
	}

	target_address(value: Address){
		self._target_address = value
	}

	size(){
		size = 0
		size += 4
		size += 2
		size += self.type_.size
		size += self.mosaic.size
		size += self.target_address.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[2:]
		type_ = ReceiptType.deserialize(buffer)
		buffer = buffer[type_.size:]
		mosaic = Mosaic.deserialize(buffer)
		buffer = buffer[mosaic.size:]
		target_address = Address.deserialize(buffer)
		buffer = buffer[target_address.size:]

		instance = HarvestFeeReceipt()
		instance._version = version
		instance._type_ = type_
		instance._mosaic = mosaic
		instance._target_address = target_address
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._version)
		buffer += self._type_.serialize()
		buffer += self._mosaic.serialize()
		buffer += self._target_address.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'version: 0x{self._version:X}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'mosaic: {self._mosaic.__str__()}, '
		result += f'target_address: {self._target_address.__str__()}, '
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

	public function __construct(){
		self._version = 0
		self._type_ = InflationReceipt.RECEIPT_TYPE
		self._mosaic = Mosaic()
	}

	sort(){
		self._mosaic.sort()
	}

	version(){
		return self._version
	}

	type_(){
		return self._type_
	}

	mosaic(){
		return self._mosaic
	}

	version(value: int){
		self._version = value
	}

	type_(value: ReceiptType){
		self._type_ = value
	}

	mosaic(value: Mosaic){
		self._mosaic = value
	}

	size(){
		size = 0
		size += 4
		size += 2
		size += self.type_.size
		size += self.mosaic.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		version = Converter::bytesToInt(byteArray)
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

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._version)
		buffer += self._type_.serialize()
		buffer += self._mosaic.serialize()
		return buffer
	}

	__str__(){
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
		'target_address': 'pod:Address'
	}

	public function __construct(){
		self._version = 0
		self._type_ = LockHashCreatedFeeReceipt.RECEIPT_TYPE
		self._mosaic = Mosaic()
		self._target_address = Address()
	}

	sort(){
		self._mosaic.sort()
	}

	version(){
		return self._version
	}

	type_(){
		return self._type_
	}

	mosaic(){
		return self._mosaic
	}

	target_address(){
		return self._target_address
	}

	version(value: int){
		self._version = value
	}

	type_(value: ReceiptType){
		self._type_ = value
	}

	mosaic(value: Mosaic){
		self._mosaic = value
	}

	target_address(value: Address){
		self._target_address = value
	}

	size(){
		size = 0
		size += 4
		size += 2
		size += self.type_.size
		size += self.mosaic.size
		size += self.target_address.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[2:]
		type_ = ReceiptType.deserialize(buffer)
		buffer = buffer[type_.size:]
		mosaic = Mosaic.deserialize(buffer)
		buffer = buffer[mosaic.size:]
		target_address = Address.deserialize(buffer)
		buffer = buffer[target_address.size:]

		instance = LockHashCreatedFeeReceipt()
		instance._version = version
		instance._type_ = type_
		instance._mosaic = mosaic
		instance._target_address = target_address
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._version)
		buffer += self._type_.serialize()
		buffer += self._mosaic.serialize()
		buffer += self._target_address.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'version: 0x{self._version:X}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'mosaic: {self._mosaic.__str__()}, '
		result += f'target_address: {self._target_address.__str__()}, '
		result += ')'
		return result
	}
}


class LockHashCompletedFeeReceipt {
	RECEIPT_TYPE: ReceiptType = ReceiptType.LOCK_HASH_COMPLETED
	TYPE_HINTS = {
		'type_': 'enum:ReceiptType',
		'mosaic': 'struct:Mosaic',
		'target_address': 'pod:Address'
	}

	public function __construct(){
		self._version = 0
		self._type_ = LockHashCompletedFeeReceipt.RECEIPT_TYPE
		self._mosaic = Mosaic()
		self._target_address = Address()
	}

	sort(){
		self._mosaic.sort()
	}

	version(){
		return self._version
	}

	type_(){
		return self._type_
	}

	mosaic(){
		return self._mosaic
	}

	target_address(){
		return self._target_address
	}

	version(value: int){
		self._version = value
	}

	type_(value: ReceiptType){
		self._type_ = value
	}

	mosaic(value: Mosaic){
		self._mosaic = value
	}

	target_address(value: Address){
		self._target_address = value
	}

	size(){
		size = 0
		size += 4
		size += 2
		size += self.type_.size
		size += self.mosaic.size
		size += self.target_address.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[2:]
		type_ = ReceiptType.deserialize(buffer)
		buffer = buffer[type_.size:]
		mosaic = Mosaic.deserialize(buffer)
		buffer = buffer[mosaic.size:]
		target_address = Address.deserialize(buffer)
		buffer = buffer[target_address.size:]

		instance = LockHashCompletedFeeReceipt()
		instance._version = version
		instance._type_ = type_
		instance._mosaic = mosaic
		instance._target_address = target_address
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._version)
		buffer += self._type_.serialize()
		buffer += self._mosaic.serialize()
		buffer += self._target_address.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'version: 0x{self._version:X}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'mosaic: {self._mosaic.__str__()}, '
		result += f'target_address: {self._target_address.__str__()}, '
		result += ')'
		return result
	}
}


class LockHashExpiredFeeReceipt {
	RECEIPT_TYPE: ReceiptType = ReceiptType.LOCK_HASH_EXPIRED
	TYPE_HINTS = {
		'type_': 'enum:ReceiptType',
		'mosaic': 'struct:Mosaic',
		'target_address': 'pod:Address'
	}

	public function __construct(){
		self._version = 0
		self._type_ = LockHashExpiredFeeReceipt.RECEIPT_TYPE
		self._mosaic = Mosaic()
		self._target_address = Address()
	}

	sort(){
		self._mosaic.sort()
	}

	version(){
		return self._version
	}

	type_(){
		return self._type_
	}

	mosaic(){
		return self._mosaic
	}

	target_address(){
		return self._target_address
	}

	version(value: int){
		self._version = value
	}

	type_(value: ReceiptType){
		self._type_ = value
	}

	mosaic(value: Mosaic){
		self._mosaic = value
	}

	target_address(value: Address){
		self._target_address = value
	}

	size(){
		size = 0
		size += 4
		size += 2
		size += self.type_.size
		size += self.mosaic.size
		size += self.target_address.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[2:]
		type_ = ReceiptType.deserialize(buffer)
		buffer = buffer[type_.size:]
		mosaic = Mosaic.deserialize(buffer)
		buffer = buffer[mosaic.size:]
		target_address = Address.deserialize(buffer)
		buffer = buffer[target_address.size:]

		instance = LockHashExpiredFeeReceipt()
		instance._version = version
		instance._type_ = type_
		instance._mosaic = mosaic
		instance._target_address = target_address
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._version)
		buffer += self._type_.serialize()
		buffer += self._mosaic.serialize()
		buffer += self._target_address.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'version: 0x{self._version:X}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'mosaic: {self._mosaic.__str__()}, '
		result += f'target_address: {self._target_address.__str__()}, '
		result += ')'
		return result
	}
}


class LockSecretCreatedFeeReceipt {
	RECEIPT_TYPE: ReceiptType = ReceiptType.LOCK_SECRET_CREATED
	TYPE_HINTS = {
		'type_': 'enum:ReceiptType',
		'mosaic': 'struct:Mosaic',
		'target_address': 'pod:Address'
	}

	public function __construct(){
		self._version = 0
		self._type_ = LockSecretCreatedFeeReceipt.RECEIPT_TYPE
		self._mosaic = Mosaic()
		self._target_address = Address()
	}

	sort(){
		self._mosaic.sort()
	}

	version(){
		return self._version
	}

	type_(){
		return self._type_
	}

	mosaic(){
		return self._mosaic
	}

	target_address(){
		return self._target_address
	}

	version(value: int){
		self._version = value
	}

	type_(value: ReceiptType){
		self._type_ = value
	}

	mosaic(value: Mosaic){
		self._mosaic = value
	}

	target_address(value: Address){
		self._target_address = value
	}

	size(){
		size = 0
		size += 4
		size += 2
		size += self.type_.size
		size += self.mosaic.size
		size += self.target_address.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[2:]
		type_ = ReceiptType.deserialize(buffer)
		buffer = buffer[type_.size:]
		mosaic = Mosaic.deserialize(buffer)
		buffer = buffer[mosaic.size:]
		target_address = Address.deserialize(buffer)
		buffer = buffer[target_address.size:]

		instance = LockSecretCreatedFeeReceipt()
		instance._version = version
		instance._type_ = type_
		instance._mosaic = mosaic
		instance._target_address = target_address
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._version)
		buffer += self._type_.serialize()
		buffer += self._mosaic.serialize()
		buffer += self._target_address.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'version: 0x{self._version:X}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'mosaic: {self._mosaic.__str__()}, '
		result += f'target_address: {self._target_address.__str__()}, '
		result += ')'
		return result
	}
}


class LockSecretCompletedFeeReceipt {
	RECEIPT_TYPE: ReceiptType = ReceiptType.LOCK_SECRET_COMPLETED
	TYPE_HINTS = {
		'type_': 'enum:ReceiptType',
		'mosaic': 'struct:Mosaic',
		'target_address': 'pod:Address'
	}

	public function __construct(){
		self._version = 0
		self._type_ = LockSecretCompletedFeeReceipt.RECEIPT_TYPE
		self._mosaic = Mosaic()
		self._target_address = Address()
	}

	sort(){
		self._mosaic.sort()
	}

	version(){
		return self._version
	}

	type_(){
		return self._type_
	}

	mosaic(){
		return self._mosaic
	}

	target_address(){
		return self._target_address
	}

	version(value: int){
		self._version = value
	}

	type_(value: ReceiptType){
		self._type_ = value
	}

	mosaic(value: Mosaic){
		self._mosaic = value
	}

	target_address(value: Address){
		self._target_address = value
	}

	size(){
		size = 0
		size += 4
		size += 2
		size += self.type_.size
		size += self.mosaic.size
		size += self.target_address.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[2:]
		type_ = ReceiptType.deserialize(buffer)
		buffer = buffer[type_.size:]
		mosaic = Mosaic.deserialize(buffer)
		buffer = buffer[mosaic.size:]
		target_address = Address.deserialize(buffer)
		buffer = buffer[target_address.size:]

		instance = LockSecretCompletedFeeReceipt()
		instance._version = version
		instance._type_ = type_
		instance._mosaic = mosaic
		instance._target_address = target_address
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._version)
		buffer += self._type_.serialize()
		buffer += self._mosaic.serialize()
		buffer += self._target_address.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'version: 0x{self._version:X}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'mosaic: {self._mosaic.__str__()}, '
		result += f'target_address: {self._target_address.__str__()}, '
		result += ')'
		return result
	}
}


class LockSecretExpiredFeeReceipt {
	RECEIPT_TYPE: ReceiptType = ReceiptType.LOCK_SECRET_EXPIRED
	TYPE_HINTS = {
		'type_': 'enum:ReceiptType',
		'mosaic': 'struct:Mosaic',
		'target_address': 'pod:Address'
	}

	public function __construct(){
		self._version = 0
		self._type_ = LockSecretExpiredFeeReceipt.RECEIPT_TYPE
		self._mosaic = Mosaic()
		self._target_address = Address()
	}

	sort(){
		self._mosaic.sort()
	}

	version(){
		return self._version
	}

	type_(){
		return self._type_
	}

	mosaic(){
		return self._mosaic
	}

	target_address(){
		return self._target_address
	}

	version(value: int){
		self._version = value
	}

	type_(value: ReceiptType){
		self._type_ = value
	}

	mosaic(value: Mosaic){
		self._mosaic = value
	}

	target_address(value: Address){
		self._target_address = value
	}

	size(){
		size = 0
		size += 4
		size += 2
		size += self.type_.size
		size += self.mosaic.size
		size += self.target_address.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[2:]
		type_ = ReceiptType.deserialize(buffer)
		buffer = buffer[type_.size:]
		mosaic = Mosaic.deserialize(buffer)
		buffer = buffer[mosaic.size:]
		target_address = Address.deserialize(buffer)
		buffer = buffer[target_address.size:]

		instance = LockSecretExpiredFeeReceipt()
		instance._version = version
		instance._type_ = type_
		instance._mosaic = mosaic
		instance._target_address = target_address
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._version)
		buffer += self._type_.serialize()
		buffer += self._mosaic.serialize()
		buffer += self._target_address.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'version: 0x{self._version:X}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'mosaic: {self._mosaic.__str__()}, '
		result += f'target_address: {self._target_address.__str__()}, '
		result += ')'
		return result
	}
}


class MosaicExpiredReceipt {
	RECEIPT_TYPE: ReceiptType = ReceiptType.MOSAIC_EXPIRED
	TYPE_HINTS = {
		'type_': 'enum:ReceiptType',
		'artifact_id': 'pod:MosaicId'
	}

	public function __construct(){
		self._version = 0
		self._type_ = MosaicExpiredReceipt.RECEIPT_TYPE
		self._artifact_id = MosaicId()
	}

	sort(){
		pass
	}

	version(){
		return self._version
	}

	type_(){
		return self._type_
	}

	artifact_id(){
		return self._artifact_id
	}

	version(value: int){
		self._version = value
	}

	type_(value: ReceiptType){
		self._type_ = value
	}

	artifact_id(value: MosaicId){
		self._artifact_id = value
	}

	size(){
		size = 0
		size += 4
		size += 2
		size += self.type_.size
		size += self.artifact_id.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[2:]
		type_ = ReceiptType.deserialize(buffer)
		buffer = buffer[type_.size:]
		artifact_id = MosaicId.deserialize(buffer)
		buffer = buffer[artifact_id.size:]

		instance = MosaicExpiredReceipt()
		instance._version = version
		instance._type_ = type_
		instance._artifact_id = artifact_id
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._version)
		buffer += self._type_.serialize()
		buffer += self._artifact_id.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'version: 0x{self._version:X}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'artifact_id: {self._artifact_id.__str__()}, '
		result += ')'
		return result
	}
}


class MosaicRentalFeeReceipt {
	RECEIPT_TYPE: ReceiptType = ReceiptType.MOSAIC_RENTAL_FEE
	TYPE_HINTS = {
		'type_': 'enum:ReceiptType',
		'mosaic': 'struct:Mosaic',
		'sender_address': 'pod:Address',
		'recipient_address': 'pod:Address'
	}

	public function __construct(){
		self._version = 0
		self._type_ = MosaicRentalFeeReceipt.RECEIPT_TYPE
		self._mosaic = Mosaic()
		self._sender_address = Address()
		self._recipient_address = Address()
	}

	sort(){
		self._mosaic.sort()
	}

	version(){
		return self._version
	}

	type_(){
		return self._type_
	}

	mosaic(){
		return self._mosaic
	}

	sender_address(){
		return self._sender_address
	}

	recipient_address(){
		return self._recipient_address
	}

	version(value: int){
		self._version = value
	}

	type_(value: ReceiptType){
		self._type_ = value
	}

	mosaic(value: Mosaic){
		self._mosaic = value
	}

	sender_address(value: Address){
		self._sender_address = value
	}

	recipient_address(value: Address){
		self._recipient_address = value
	}

	size(){
		size = 0
		size += 4
		size += 2
		size += self.type_.size
		size += self.mosaic.size
		size += self.sender_address.size
		size += self.recipient_address.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[2:]
		type_ = ReceiptType.deserialize(buffer)
		buffer = buffer[type_.size:]
		mosaic = Mosaic.deserialize(buffer)
		buffer = buffer[mosaic.size:]
		sender_address = Address.deserialize(buffer)
		buffer = buffer[sender_address.size:]
		recipient_address = Address.deserialize(buffer)
		buffer = buffer[recipient_address.size:]

		instance = MosaicRentalFeeReceipt()
		instance._version = version
		instance._type_ = type_
		instance._mosaic = mosaic
		instance._sender_address = sender_address
		instance._recipient_address = recipient_address
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._version)
		buffer += self._type_.serialize()
		buffer += self._mosaic.serialize()
		buffer += self._sender_address.serialize()
		buffer += self._recipient_address.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'version: 0x{self._version:X}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'mosaic: {self._mosaic.__str__()}, '
		result += f'sender_address: {self._sender_address.__str__()}, '
		result += f'recipient_address: {self._recipient_address.__str__()}, '
		result += ')'
		return result
	}
}


class NamespaceId extends BaseValue {
	const SIZE = 8;

	public function __construct($namespace_id = 0){
		parent::__construct(self::SIZE, $namespace_id);
	}

	public static function deserialize($payload){
		$byteArray = $payload;
		return new NamespaceId(Converter::bytesToInt(byteArray));
	}

	public function serialize(){
		return Converter::intToBytes($$this->value);
	}
}


class NamespaceRegistrationType extends (Enum) {
	ROOT = 0
	CHILD = 1

	size(){
		return 1
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		return NamespaceRegistrationType(Converter::bytesToInt(byteArray))
	}

	public function serialize(){
		buffer = bytes()
		buffer += Converter::intToBytes($self.value)
		return buffer
	}
}


class AliasAction extends (Enum) {
	UNLINK = 0
	LINK = 1

	size(){
		return 1
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		return AliasAction(Converter::bytesToInt(byteArray))
	}

	public function serialize(){
		buffer = bytes()
		buffer += Converter::intToBytes($self.value)
		return buffer
	}
}


class NamespaceExpiredReceipt {
	RECEIPT_TYPE: ReceiptType = ReceiptType.NAMESPACE_EXPIRED
	TYPE_HINTS = {
		'type_': 'enum:ReceiptType',
		'artifact_id': 'pod:NamespaceId'
	}

	public function __construct(){
		self._version = 0
		self._type_ = NamespaceExpiredReceipt.RECEIPT_TYPE
		self._artifact_id = NamespaceId()
	}

	sort(){
		pass
	}

	version(){
		return self._version
	}

	type_(){
		return self._type_
	}

	artifact_id(){
		return self._artifact_id
	}

	version(value: int){
		self._version = value
	}

	type_(value: ReceiptType){
		self._type_ = value
	}

	artifact_id(value: NamespaceId){
		self._artifact_id = value
	}

	size(){
		size = 0
		size += 4
		size += 2
		size += self.type_.size
		size += self.artifact_id.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[2:]
		type_ = ReceiptType.deserialize(buffer)
		buffer = buffer[type_.size:]
		artifact_id = NamespaceId.deserialize(buffer)
		buffer = buffer[artifact_id.size:]

		instance = NamespaceExpiredReceipt()
		instance._version = version
		instance._type_ = type_
		instance._artifact_id = artifact_id
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._version)
		buffer += self._type_.serialize()
		buffer += self._artifact_id.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'version: 0x{self._version:X}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'artifact_id: {self._artifact_id.__str__()}, '
		result += ')'
		return result
	}
}


class NamespaceDeletedReceipt {
	RECEIPT_TYPE: ReceiptType = ReceiptType.NAMESPACE_DELETED
	TYPE_HINTS = {
		'type_': 'enum:ReceiptType',
		'artifact_id': 'pod:NamespaceId'
	}

	public function __construct(){
		self._version = 0
		self._type_ = NamespaceDeletedReceipt.RECEIPT_TYPE
		self._artifact_id = NamespaceId()
	}

	sort(){
		pass
	}

	version(){
		return self._version
	}

	type_(){
		return self._type_
	}

	artifact_id(){
		return self._artifact_id
	}

	version(value: int){
		self._version = value
	}

	type_(value: ReceiptType){
		self._type_ = value
	}

	artifact_id(value: NamespaceId){
		self._artifact_id = value
	}

	size(){
		size = 0
		size += 4
		size += 2
		size += self.type_.size
		size += self.artifact_id.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[2:]
		type_ = ReceiptType.deserialize(buffer)
		buffer = buffer[type_.size:]
		artifact_id = NamespaceId.deserialize(buffer)
		buffer = buffer[artifact_id.size:]

		instance = NamespaceDeletedReceipt()
		instance._version = version
		instance._type_ = type_
		instance._artifact_id = artifact_id
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._version)
		buffer += self._type_.serialize()
		buffer += self._artifact_id.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'version: 0x{self._version:X}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'artifact_id: {self._artifact_id.__str__()}, '
		result += ')'
		return result
	}
}


class NamespaceRentalFeeReceipt {
	RECEIPT_TYPE: ReceiptType = ReceiptType.NAMESPACE_RENTAL_FEE
	TYPE_HINTS = {
		'type_': 'enum:ReceiptType',
		'mosaic': 'struct:Mosaic',
		'sender_address': 'pod:Address',
		'recipient_address': 'pod:Address'
	}

	public function __construct(){
		self._version = 0
		self._type_ = NamespaceRentalFeeReceipt.RECEIPT_TYPE
		self._mosaic = Mosaic()
		self._sender_address = Address()
		self._recipient_address = Address()
	}

	sort(){
		self._mosaic.sort()
	}

	version(){
		return self._version
	}

	type_(){
		return self._type_
	}

	mosaic(){
		return self._mosaic
	}

	sender_address(){
		return self._sender_address
	}

	recipient_address(){
		return self._recipient_address
	}

	version(value: int){
		self._version = value
	}

	type_(value: ReceiptType){
		self._type_ = value
	}

	mosaic(value: Mosaic){
		self._mosaic = value
	}

	sender_address(value: Address){
		self._sender_address = value
	}

	recipient_address(value: Address){
		self._recipient_address = value
	}

	size(){
		size = 0
		size += 4
		size += 2
		size += self.type_.size
		size += self.mosaic.size
		size += self.sender_address.size
		size += self.recipient_address.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[2:]
		type_ = ReceiptType.deserialize(buffer)
		buffer = buffer[type_.size:]
		mosaic = Mosaic.deserialize(buffer)
		buffer = buffer[mosaic.size:]
		sender_address = Address.deserialize(buffer)
		buffer = buffer[sender_address.size:]
		recipient_address = Address.deserialize(buffer)
		buffer = buffer[recipient_address.size:]

		instance = NamespaceRentalFeeReceipt()
		instance._version = version
		instance._type_ = type_
		instance._mosaic = mosaic
		instance._sender_address = sender_address
		instance._recipient_address = recipient_address
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._version)
		buffer += self._type_.serialize()
		buffer += self._mosaic.serialize()
		buffer += self._sender_address.serialize()
		buffer += self._recipient_address.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'version: 0x{self._version:X}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'mosaic: {self._mosaic.__str__()}, '
		result += f'sender_address: {self._sender_address.__str__()}, '
		result += f'recipient_address: {self._recipient_address.__str__()}, '
		result += ')'
		return result
	}
}


class ReceiptSource {
	TYPE_HINTS = {
	}

	public function __construct(){
		self._primary_id = 0
		self._secondary_id = 0
	}

	sort(){
		pass
	}

	primary_id(){
		return self._primary_id
	}

	secondary_id(){
		return self._secondary_id
	}

	primary_id(value: int){
		self._primary_id = value
	}

	secondary_id(value: int){
		self._secondary_id = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		primary_id = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		secondary_id = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]

		instance = ReceiptSource()
		instance._primary_id = primary_id
		instance._secondary_id = secondary_id
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += Converter::intToBytes($self._primary_id)
		buffer += Converter::intToBytes($self._secondary_id)
		return buffer
	}

	__str__(){
		result = '('
		result += f'primary_id: 0x{self._primary_id:X}, '
		result += f'secondary_id: 0x{self._secondary_id:X}, '
		result += ')'
		return result
	}
}


class AddressResolutionEntry {
	TYPE_HINTS = {
		'source': 'struct:ReceiptSource',
		'resolved_value': 'pod:Address'
	}

	public function __construct(){
		self._source = ReceiptSource()
		self._resolved_value = Address()
	}

	sort(){
		self._source.sort()
	}

	source(){
		return self._source
	}

	resolved_value(){
		return self._resolved_value
	}

	source(value: ReceiptSource){
		self._source = value
	}

	resolved_value(value: Address){
		self._resolved_value = value
	}

	size(){
		size = 0
		size += self.source.size
		size += self.resolved_value.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		source = ReceiptSource.deserialize(buffer)
		buffer = buffer[source.size:]
		resolved_value = Address.deserialize(buffer)
		buffer = buffer[resolved_value.size:]

		instance = AddressResolutionEntry()
		instance._source = source
		instance._resolved_value = resolved_value
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self._source.serialize()
		buffer += self._resolved_value.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'source: {self._source.__str__()}, '
		result += f'resolved_value: {self._resolved_value.__str__()}, '
		result += ')'
		return result
	}
}


class AddressResolutionStatement {
	TYPE_HINTS = {
		'unresolved': 'pod:UnresolvedAddress',
		'resolution_entries': 'array[AddressResolutionEntry]'
	}

	public function __construct(){
		self._unresolved = UnresolvedAddress()
		self._resolution_entries = []
	}

	sort(){
		pass
	}

	unresolved(){
		return self._unresolved
	}

	resolution_entries(){
		return self._resolution_entries
	}

	unresolved(value: UnresolvedAddress){
		self._unresolved = value
	}

	resolution_entries(value: List[AddressResolutionEntry]){
		self._resolution_entries = value
	}

	size(){
		size = 0
		size += self.unresolved.size
		size += 4
		size += ArrayHelpers.size(self.resolution_entries)
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		unresolved = UnresolvedAddress.deserialize(buffer)
		buffer = buffer[unresolved.size:]
		resolution_entries_count = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		resolution_entries = ArrayHelpers.read_array_count(buffer, AddressResolutionEntry, resolution_entries_count)
		buffer = buffer[ArrayHelpers.size(resolution_entries):]

		instance = AddressResolutionStatement()
		instance._unresolved = unresolved
		instance._resolution_entries = resolution_entries
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self._unresolved.serialize()
		buffer += Converter::intToBytes($len(self._resolution_entries))  # resolution_entries_count
		buffer += ArrayHelpers.write_array(self._resolution_entries)
		return buffer
	}

	__str__(){
		result = '('
		result += f'unresolved: {self._unresolved.__str__()}, '
		result += f'resolution_entries: {list(map(str, self._resolution_entries))}, '
		result += ')'
		return result
	}
}


class MosaicResolutionEntry {
	TYPE_HINTS = {
		'source': 'struct:ReceiptSource',
		'resolved_value': 'pod:MosaicId'
	}

	public function __construct(){
		self._source = ReceiptSource()
		self._resolved_value = MosaicId()
	}

	sort(){
		self._source.sort()
	}

	source(){
		return self._source
	}

	resolved_value(){
		return self._resolved_value
	}

	source(value: ReceiptSource){
		self._source = value
	}

	resolved_value(value: MosaicId){
		self._resolved_value = value
	}

	size(){
		size = 0
		size += self.source.size
		size += self.resolved_value.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		source = ReceiptSource.deserialize(buffer)
		buffer = buffer[source.size:]
		resolved_value = MosaicId.deserialize(buffer)
		buffer = buffer[resolved_value.size:]

		instance = MosaicResolutionEntry()
		instance._source = source
		instance._resolved_value = resolved_value
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self._source.serialize()
		buffer += self._resolved_value.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'source: {self._source.__str__()}, '
		result += f'resolved_value: {self._resolved_value.__str__()}, '
		result += ')'
		return result
	}
}


class MosaicResolutionStatement {
	TYPE_HINTS = {
		'unresolved': 'pod:UnresolvedMosaicId',
		'resolution_entries': 'array[MosaicResolutionEntry]'
	}

	public function __construct(){
		self._unresolved = UnresolvedMosaicId()
		self._resolution_entries = []
	}

	sort(){
		pass
	}

	unresolved(){
		return self._unresolved
	}

	resolution_entries(){
		return self._resolution_entries
	}

	unresolved(value: UnresolvedMosaicId){
		self._unresolved = value
	}

	resolution_entries(value: List[MosaicResolutionEntry]){
		self._resolution_entries = value
	}

	size(){
		size = 0
		size += self.unresolved.size
		size += 4
		size += ArrayHelpers.size(self.resolution_entries)
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		unresolved = UnresolvedMosaicId.deserialize(buffer)
		buffer = buffer[unresolved.size:]
		resolution_entries_count = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		resolution_entries = ArrayHelpers.read_array_count(buffer, MosaicResolutionEntry, resolution_entries_count)
		buffer = buffer[ArrayHelpers.size(resolution_entries):]

		instance = MosaicResolutionStatement()
		instance._unresolved = unresolved
		instance._resolution_entries = resolution_entries
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self._unresolved.serialize()
		buffer += Converter::intToBytes($len(self._resolution_entries))  # resolution_entries_count
		buffer += ArrayHelpers.write_array(self._resolution_entries)
		return buffer
	}

	__str__(){
		result = '('
		result += f'unresolved: {self._unresolved.__str__()}, '
		result += f'resolution_entries: {list(map(str, self._resolution_entries))}, '
		result += ')'
		return result
	}
}


class TransactionStatement {
	TYPE_HINTS = {
		'receipts': 'array[Receipt]'
	}

	public function __construct(){
		self._primary_id = 0
		self._secondary_id = 0
		self._receipts = []
	}

	sort(){
		pass
	}

	primary_id(){
		return self._primary_id
	}

	secondary_id(){
		return self._secondary_id
	}

	receipts(){
		return self._receipts
	}

	primary_id(value: int){
		self._primary_id = value
	}

	secondary_id(value: int){
		self._secondary_id = value
	}

	receipts(value: List[Receipt]){
		self._receipts = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += 4
		size += ArrayHelpers.size(self.receipts)
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		primary_id = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		secondary_id = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		receipt_count = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		receipts = ArrayHelpers.read_array_count(buffer, ReceiptFactory, receipt_count)
		buffer = buffer[ArrayHelpers.size(receipts):]

		instance = TransactionStatement()
		instance._primary_id = primary_id
		instance._secondary_id = secondary_id
		instance._receipts = receipts
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += Converter::intToBytes($self._primary_id)
		buffer += Converter::intToBytes($self._secondary_id)
		buffer += Converter::intToBytes($len(self._receipts))  # receipt_count
		buffer += ArrayHelpers.write_array(self._receipts)
		return buffer
	}

	__str__(){
		result = '('
		result += f'primary_id: 0x{self._primary_id:X}, '
		result += f'secondary_id: 0x{self._secondary_id:X}, '
		result += f'receipts: {list(map(str, self._receipts))}, '
		result += ')'
		return result
	}
}


class BlockStatement {
	TYPE_HINTS = {
		'transaction_statements': 'array[TransactionStatement]',
		'address_resolution_statements': 'array[AddressResolutionStatement]',
		'mosaic_resolution_statements': 'array[MosaicResolutionStatement]'
	}

	public function __construct(){
		self._transaction_statements = []
		self._address_resolution_statements = []
		self._mosaic_resolution_statements = []
	}

	sort(){
		pass
	}

	transaction_statements(){
		return self._transaction_statements
	}

	address_resolution_statements(){
		return self._address_resolution_statements
	}

	mosaic_resolution_statements(){
		return self._mosaic_resolution_statements
	}

	transaction_statements(value: List[TransactionStatement]){
		self._transaction_statements = value
	}

	address_resolution_statements(value: List[AddressResolutionStatement]){
		self._address_resolution_statements = value
	}

	mosaic_resolution_statements(value: List[MosaicResolutionStatement]){
		self._mosaic_resolution_statements = value
	}

	size(){
		size = 0
		size += 4
		size += ArrayHelpers.size(self.transaction_statements)
		size += 4
		size += ArrayHelpers.size(self.address_resolution_statements)
		size += 4
		size += ArrayHelpers.size(self.mosaic_resolution_statements)
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		transaction_statement_count = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		transaction_statements = ArrayHelpers.read_array_count(buffer, TransactionStatement, transaction_statement_count)
		buffer = buffer[ArrayHelpers.size(transaction_statements):]
		address_resolution_statement_count = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		address_resolution_statements = ArrayHelpers.read_array_count(buffer, AddressResolutionStatement, address_resolution_statement_count)
		buffer = buffer[ArrayHelpers.size(address_resolution_statements):]
		mosaic_resolution_statement_count = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		mosaic_resolution_statements = ArrayHelpers.read_array_count(buffer, MosaicResolutionStatement, mosaic_resolution_statement_count)
		buffer = buffer[ArrayHelpers.size(mosaic_resolution_statements):]

		instance = BlockStatement()
		instance._transaction_statements = transaction_statements
		instance._address_resolution_statements = address_resolution_statements
		instance._mosaic_resolution_statements = mosaic_resolution_statements
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += Converter::intToBytes($len(self._transaction_statements))  # transaction_statement_count
		buffer += ArrayHelpers.write_array(self._transaction_statements)
		buffer += Converter::intToBytes($len(self._address_resolution_statements))  # address_resolution_statement_count
		buffer += ArrayHelpers.write_array(self._address_resolution_statements)
		buffer += Converter::intToBytes($len(self._mosaic_resolution_statements))  # mosaic_resolution_statement_count
		buffer += ArrayHelpers.write_array(self._mosaic_resolution_statements)
		return buffer
	}

	__str__(){
		result = '('
		result += f'transaction_statements: {list(map(str, self._transaction_statements))}, '
		result += f'address_resolution_statements: {list(map(str, self._address_resolution_statements))}, '
		result += f'mosaic_resolution_statements: {list(map(str, self._mosaic_resolution_statements))}, '
		result += ')'
		return result
	}
}


class AccountKeyLinkTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.ACCOUNT_KEY_LINK
	TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'linked_public_key': 'pod:PublicKey',
		'link_action': 'enum:LinkAction'
	}

	public function __construct(){
		self._signature = Signature()
		self._signer_public_key = PublicKey()
		self._version = AccountKeyLinkTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = AccountKeyLinkTransactionV1.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._linked_public_key = PublicKey()
		self._link_action = LinkAction.UNLINK
		self._verifiable_entity_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
	}

	sort(){
		pass
	}

	signature(){
		return self._signature
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	fee(){
		return self._fee
	}

	deadline(){
		return self._deadline
	}

	linked_public_key(){
		return self._linked_public_key
	}

	link_action(){
		return self._link_action
	}

	signature(value: Signature){
		self._signature = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	fee(value: Amount){
		self._fee = value
	}

	deadline(value: Timestamp){
		self._deadline = value
	}

	linked_public_key(value: PublicKey){
		self._linked_public_key = value
	}

	link_action(value: LinkAction){
		self._link_action = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signer_public_key.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		size += self.linked_public_key.size
		size += self.link_action.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiable_entity_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert verifiable_entity_header_reserved_1 == 0, f'Invalid value of reserved field ({verifiable_entity_header_reserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		linked_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[linked_public_key.size:]
		link_action = LinkAction.deserialize(buffer)
		buffer = buffer[link_action.size:]

		instance = AccountKeyLinkTransactionV1()
		instance._signature = signature
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		instance._linked_public_key = linked_public_key
		instance._link_action = link_action
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._verifiable_entity_header_reserved_1)
		buffer += self._signature.serialize()
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._linked_public_key.serialize()
		buffer += self._link_action.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'linked_public_key: {self._linked_public_key.__str__()}, '
		result += f'link_action: {self._link_action.__str__()}, '
		result += ')'
		return result
	}
}


class EmbeddedAccountKeyLinkTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.ACCOUNT_KEY_LINK
	TYPE_HINTS = {
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'linked_public_key': 'pod:PublicKey',
		'link_action': 'enum:LinkAction'
	}

	public function __construct(){
		self._signer_public_key = PublicKey()
		self._version = EmbeddedAccountKeyLinkTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = EmbeddedAccountKeyLinkTransactionV1.TRANSACTION_TYPE
		self._linked_public_key = PublicKey()
		self._link_action = LinkAction.UNLINK
		self._embedded_transaction_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
	}

	sort(){
		pass
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	linked_public_key(){
		return self._linked_public_key
	}

	link_action(){
		return self._link_action
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	linked_public_key(value: PublicKey){
		self._linked_public_key = value
	}

	link_action(value: LinkAction){
		self._link_action = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signer_public_key.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.linked_public_key.size
		size += self.link_action.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		embedded_transaction_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert embedded_transaction_header_reserved_1 == 0, f'Invalid value of reserved field ({embedded_transaction_header_reserved_1})'
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		linked_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[linked_public_key.size:]
		link_action = LinkAction.deserialize(buffer)
		buffer = buffer[link_action.size:]

		instance = EmbeddedAccountKeyLinkTransactionV1()
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._linked_public_key = linked_public_key
		instance._link_action = link_action
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._embedded_transaction_header_reserved_1)
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._linked_public_key.serialize()
		buffer += self._link_action.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'linked_public_key: {self._linked_public_key.__str__()}, '
		result += f'link_action: {self._link_action.__str__()}, '
		result += ')'
		return result
	}
}


class NodeKeyLinkTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.NODE_KEY_LINK
	TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'linked_public_key': 'pod:PublicKey',
		'link_action': 'enum:LinkAction'
	}

	public function __construct(){
		self._signature = Signature()
		self._signer_public_key = PublicKey()
		self._version = NodeKeyLinkTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = NodeKeyLinkTransactionV1.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._linked_public_key = PublicKey()
		self._link_action = LinkAction.UNLINK
		self._verifiable_entity_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
	}

	sort(){
		pass
	}

	signature(){
		return self._signature
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	fee(){
		return self._fee
	}

	deadline(){
		return self._deadline
	}

	linked_public_key(){
		return self._linked_public_key
	}

	link_action(){
		return self._link_action
	}

	signature(value: Signature){
		self._signature = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	fee(value: Amount){
		self._fee = value
	}

	deadline(value: Timestamp){
		self._deadline = value
	}

	linked_public_key(value: PublicKey){
		self._linked_public_key = value
	}

	link_action(value: LinkAction){
		self._link_action = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signer_public_key.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		size += self.linked_public_key.size
		size += self.link_action.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiable_entity_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert verifiable_entity_header_reserved_1 == 0, f'Invalid value of reserved field ({verifiable_entity_header_reserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		linked_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[linked_public_key.size:]
		link_action = LinkAction.deserialize(buffer)
		buffer = buffer[link_action.size:]

		instance = NodeKeyLinkTransactionV1()
		instance._signature = signature
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		instance._linked_public_key = linked_public_key
		instance._link_action = link_action
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._verifiable_entity_header_reserved_1)
		buffer += self._signature.serialize()
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._linked_public_key.serialize()
		buffer += self._link_action.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'linked_public_key: {self._linked_public_key.__str__()}, '
		result += f'link_action: {self._link_action.__str__()}, '
		result += ')'
		return result
	}
}


class EmbeddedNodeKeyLinkTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.NODE_KEY_LINK
	TYPE_HINTS = {
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'linked_public_key': 'pod:PublicKey',
		'link_action': 'enum:LinkAction'
	}

	public function __construct(){
		self._signer_public_key = PublicKey()
		self._version = EmbeddedNodeKeyLinkTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = EmbeddedNodeKeyLinkTransactionV1.TRANSACTION_TYPE
		self._linked_public_key = PublicKey()
		self._link_action = LinkAction.UNLINK
		self._embedded_transaction_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
	}

	sort(){
		pass
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	linked_public_key(){
		return self._linked_public_key
	}

	link_action(){
		return self._link_action
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	linked_public_key(value: PublicKey){
		self._linked_public_key = value
	}

	link_action(value: LinkAction){
		self._link_action = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signer_public_key.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.linked_public_key.size
		size += self.link_action.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		embedded_transaction_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert embedded_transaction_header_reserved_1 == 0, f'Invalid value of reserved field ({embedded_transaction_header_reserved_1})'
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		linked_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[linked_public_key.size:]
		link_action = LinkAction.deserialize(buffer)
		buffer = buffer[link_action.size:]

		instance = EmbeddedNodeKeyLinkTransactionV1()
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._linked_public_key = linked_public_key
		instance._link_action = link_action
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._embedded_transaction_header_reserved_1)
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._linked_public_key.serialize()
		buffer += self._link_action.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'linked_public_key: {self._linked_public_key.__str__()}, '
		result += f'link_action: {self._link_action.__str__()}, '
		result += ')'
		return result
	}
}


class Cosignature {
	TYPE_HINTS = {
		'signer_public_key': 'pod:PublicKey',
		'signature': 'pod:Signature'
	}

	public function __construct(){
		self._version = 0
		self._signer_public_key = PublicKey()
		self._signature = Signature()
	}

	sort(){
		pass
	}

	version(){
		return self._version
	}

	signer_public_key(){
		return self._signer_public_key
	}

	signature(){
		return self._signature
	}

	version(value: int){
		self._version = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	signature(value: Signature){
		self._signature = value
	}

	size(){
		size = 0
		size += 8
		size += self.signer_public_key.size
		size += self.signature.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[8:]
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]

		instance = Cosignature()
		instance._version = version
		instance._signer_public_key = signer_public_key
		instance._signature = signature
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += Converter::intToBytes($self._version)
		buffer += self._signer_public_key.serialize()
		buffer += self._signature.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'version: 0x{self._version:X}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'signature: {self._signature.__str__()}, '
		result += ')'
		return result
	}
}


class DetachedCosignature {
	TYPE_HINTS = {
		'signer_public_key': 'pod:PublicKey',
		'signature': 'pod:Signature',
		'parent_hash': 'pod:Hash256'
	}

	public function __construct(){
		self._version = 0
		self._signer_public_key = PublicKey()
		self._signature = Signature()
		self._parent_hash = Hash256()
	}

	sort(){
		pass
	}

	version(){
		return self._version
	}

	signer_public_key(){
		return self._signer_public_key
	}

	signature(){
		return self._signature
	}

	parent_hash(){
		return self._parent_hash
	}

	version(value: int){
		self._version = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	signature(value: Signature){
		self._signature = value
	}

	parent_hash(value: Hash256){
		self._parent_hash = value
	}

	size(){
		size = 0
		size += 8
		size += self.signer_public_key.size
		size += self.signature.size
		size += self.parent_hash.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[8:]
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		parent_hash = Hash256.deserialize(buffer)
		buffer = buffer[parent_hash.size:]

		instance = DetachedCosignature()
		instance._version = version
		instance._signer_public_key = signer_public_key
		instance._signature = signature
		instance._parent_hash = parent_hash
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += Converter::intToBytes($self._version)
		buffer += self._signer_public_key.serialize()
		buffer += self._signature.serialize()
		buffer += self._parent_hash.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'version: 0x{self._version:X}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'signature: {self._signature.__str__()}, '
		result += f'parent_hash: {self._parent_hash.__str__()}, '
		result += ')'
		return result
	}
}


class AggregateCompleteTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.AGGREGATE_COMPLETE
	TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'transactions_hash': 'pod:Hash256',
		'transactions': 'array[EmbeddedTransaction]',
		'cosignatures': 'array[Cosignature]'
	}

	public function __construct(){
		self._signature = Signature()
		self._signer_public_key = PublicKey()
		self._version = AggregateCompleteTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = AggregateCompleteTransactionV1.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._transactions_hash = Hash256()
		self._transactions = []
		self._cosignatures = []
		self._verifiable_entity_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
		self._aggregate_transaction_header_reserved_1 = 0  # reserved field
	}

	sort(){
		pass
	}

	signature(){
		return self._signature
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	fee(){
		return self._fee
	}

	deadline(){
		return self._deadline
	}

	transactions_hash(){
		return self._transactions_hash
	}

	transactions(){
		return self._transactions
	}

	cosignatures(){
		return self._cosignatures
	}

	signature(value: Signature){
		self._signature = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	fee(value: Amount){
		self._fee = value
	}

	deadline(value: Timestamp){
		self._deadline = value
	}

	transactions_hash(value: Hash256){
		self._transactions_hash = value
	}

	transactions(value: List[EmbeddedTransaction]){
		self._transactions = value
	}

	cosignatures(value: List[Cosignature]){
		self._cosignatures = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signer_public_key.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		size += self.transactions_hash.size
		size += 4
		size += 4
		size += ArrayHelpers.size(self.transactions, 8, skip_last_element_padding=False)
		size += ArrayHelpers.size(self.cosignatures)
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiable_entity_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert verifiable_entity_header_reserved_1 == 0, f'Invalid value of reserved field ({verifiable_entity_header_reserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		transactions_hash = Hash256.deserialize(buffer)
		buffer = buffer[transactions_hash.size:]
		payload_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		aggregate_transaction_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert aggregate_transaction_header_reserved_1 == 0, f'Invalid value of reserved field ({aggregate_transaction_header_reserved_1})'
		transactions = ArrayHelpers.read_variable_size_elements(buffer[:payload_size], EmbeddedTransactionFactory, 8, skip_last_element_padding=False)
		buffer = buffer[payload_size:]
		cosignatures = ArrayHelpers.read_array(buffer, Cosignature)
		buffer = buffer[ArrayHelpers.size(cosignatures):]

		instance = AggregateCompleteTransactionV1()
		instance._signature = signature
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		instance._transactions_hash = transactions_hash
		instance._transactions = transactions
		instance._cosignatures = cosignatures
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._verifiable_entity_header_reserved_1)
		buffer += self._signature.serialize()
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._transactions_hash.serialize()
		buffer += Converter::intToBytes($ArrayHelpers.size(self.transactions, 8, skip_last_element_padding=False))  # payload_size
		buffer += Converter::intToBytes($self._aggregate_transaction_header_reserved_1)
		buffer += ArrayHelpers.write_variable_size_elements(self._transactions, 8, skip_last_element_padding=False)
		buffer += ArrayHelpers.write_array(self._cosignatures)
		return buffer
	}

	__str__(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'transactions_hash: {self._transactions_hash.__str__()}, '
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
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'transactions_hash': 'pod:Hash256',
		'transactions': 'array[EmbeddedTransaction]',
		'cosignatures': 'array[Cosignature]'
	}

	public function __construct(){
		self._signature = Signature()
		self._signer_public_key = PublicKey()
		self._version = AggregateCompleteTransactionV2.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = AggregateCompleteTransactionV2.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._transactions_hash = Hash256()
		self._transactions = []
		self._cosignatures = []
		self._verifiable_entity_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
		self._aggregate_transaction_header_reserved_1 = 0  # reserved field
	}

	sort(){
		pass
	}

	signature(){
		return self._signature
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	fee(){
		return self._fee
	}

	deadline(){
		return self._deadline
	}

	transactions_hash(){
		return self._transactions_hash
	}

	transactions(){
		return self._transactions
	}

	cosignatures(){
		return self._cosignatures
	}

	signature(value: Signature){
		self._signature = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	fee(value: Amount){
		self._fee = value
	}

	deadline(value: Timestamp){
		self._deadline = value
	}

	transactions_hash(value: Hash256){
		self._transactions_hash = value
	}

	transactions(value: List[EmbeddedTransaction]){
		self._transactions = value
	}

	cosignatures(value: List[Cosignature]){
		self._cosignatures = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signer_public_key.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		size += self.transactions_hash.size
		size += 4
		size += 4
		size += ArrayHelpers.size(self.transactions, 8, skip_last_element_padding=False)
		size += ArrayHelpers.size(self.cosignatures)
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiable_entity_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert verifiable_entity_header_reserved_1 == 0, f'Invalid value of reserved field ({verifiable_entity_header_reserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		transactions_hash = Hash256.deserialize(buffer)
		buffer = buffer[transactions_hash.size:]
		payload_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		aggregate_transaction_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert aggregate_transaction_header_reserved_1 == 0, f'Invalid value of reserved field ({aggregate_transaction_header_reserved_1})'
		transactions = ArrayHelpers.read_variable_size_elements(buffer[:payload_size], EmbeddedTransactionFactory, 8, skip_last_element_padding=False)
		buffer = buffer[payload_size:]
		cosignatures = ArrayHelpers.read_array(buffer, Cosignature)
		buffer = buffer[ArrayHelpers.size(cosignatures):]

		instance = AggregateCompleteTransactionV2()
		instance._signature = signature
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		instance._transactions_hash = transactions_hash
		instance._transactions = transactions
		instance._cosignatures = cosignatures
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._verifiable_entity_header_reserved_1)
		buffer += self._signature.serialize()
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._transactions_hash.serialize()
		buffer += Converter::intToBytes($ArrayHelpers.size(self.transactions, 8, skip_last_element_padding=False))  # payload_size
		buffer += Converter::intToBytes($self._aggregate_transaction_header_reserved_1)
		buffer += ArrayHelpers.write_variable_size_elements(self._transactions, 8, skip_last_element_padding=False)
		buffer += ArrayHelpers.write_array(self._cosignatures)
		return buffer
	}

	__str__(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'transactions_hash: {self._transactions_hash.__str__()}, '
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
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'transactions_hash': 'pod:Hash256',
		'transactions': 'array[EmbeddedTransaction]',
		'cosignatures': 'array[Cosignature]'
	}

	public function __construct(){
		self._signature = Signature()
		self._signer_public_key = PublicKey()
		self._version = AggregateBondedTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = AggregateBondedTransactionV1.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._transactions_hash = Hash256()
		self._transactions = []
		self._cosignatures = []
		self._verifiable_entity_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
		self._aggregate_transaction_header_reserved_1 = 0  # reserved field
	}

	sort(){
		pass
	}

	signature(){
		return self._signature
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	fee(){
		return self._fee
	}

	deadline(){
		return self._deadline
	}

	transactions_hash(){
		return self._transactions_hash
	}

	transactions(){
		return self._transactions
	}

	cosignatures(){
		return self._cosignatures
	}

	signature(value: Signature){
		self._signature = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	fee(value: Amount){
		self._fee = value
	}

	deadline(value: Timestamp){
		self._deadline = value
	}

	transactions_hash(value: Hash256){
		self._transactions_hash = value
	}

	transactions(value: List[EmbeddedTransaction]){
		self._transactions = value
	}

	cosignatures(value: List[Cosignature]){
		self._cosignatures = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signer_public_key.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		size += self.transactions_hash.size
		size += 4
		size += 4
		size += ArrayHelpers.size(self.transactions, 8, skip_last_element_padding=False)
		size += ArrayHelpers.size(self.cosignatures)
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiable_entity_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert verifiable_entity_header_reserved_1 == 0, f'Invalid value of reserved field ({verifiable_entity_header_reserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		transactions_hash = Hash256.deserialize(buffer)
		buffer = buffer[transactions_hash.size:]
		payload_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		aggregate_transaction_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert aggregate_transaction_header_reserved_1 == 0, f'Invalid value of reserved field ({aggregate_transaction_header_reserved_1})'
		transactions = ArrayHelpers.read_variable_size_elements(buffer[:payload_size], EmbeddedTransactionFactory, 8, skip_last_element_padding=False)
		buffer = buffer[payload_size:]
		cosignatures = ArrayHelpers.read_array(buffer, Cosignature)
		buffer = buffer[ArrayHelpers.size(cosignatures):]

		instance = AggregateBondedTransactionV1()
		instance._signature = signature
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		instance._transactions_hash = transactions_hash
		instance._transactions = transactions
		instance._cosignatures = cosignatures
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._verifiable_entity_header_reserved_1)
		buffer += self._signature.serialize()
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._transactions_hash.serialize()
		buffer += Converter::intToBytes($ArrayHelpers.size(self.transactions, 8, skip_last_element_padding=False))  # payload_size
		buffer += Converter::intToBytes($self._aggregate_transaction_header_reserved_1)
		buffer += ArrayHelpers.write_variable_size_elements(self._transactions, 8, skip_last_element_padding=False)
		buffer += ArrayHelpers.write_array(self._cosignatures)
		return buffer
	}

	__str__(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'transactions_hash: {self._transactions_hash.__str__()}, '
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
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'transactions_hash': 'pod:Hash256',
		'transactions': 'array[EmbeddedTransaction]',
		'cosignatures': 'array[Cosignature]'
	}

	public function __construct(){
		self._signature = Signature()
		self._signer_public_key = PublicKey()
		self._version = AggregateBondedTransactionV2.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = AggregateBondedTransactionV2.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._transactions_hash = Hash256()
		self._transactions = []
		self._cosignatures = []
		self._verifiable_entity_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
		self._aggregate_transaction_header_reserved_1 = 0  # reserved field
	}

	sort(){
		pass
	}

	signature(){
		return self._signature
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	fee(){
		return self._fee
	}

	deadline(){
		return self._deadline
	}

	transactions_hash(){
		return self._transactions_hash
	}

	transactions(){
		return self._transactions
	}

	cosignatures(){
		return self._cosignatures
	}

	signature(value: Signature){
		self._signature = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	fee(value: Amount){
		self._fee = value
	}

	deadline(value: Timestamp){
		self._deadline = value
	}

	transactions_hash(value: Hash256){
		self._transactions_hash = value
	}

	transactions(value: List[EmbeddedTransaction]){
		self._transactions = value
	}

	cosignatures(value: List[Cosignature]){
		self._cosignatures = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signer_public_key.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		size += self.transactions_hash.size
		size += 4
		size += 4
		size += ArrayHelpers.size(self.transactions, 8, skip_last_element_padding=False)
		size += ArrayHelpers.size(self.cosignatures)
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiable_entity_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert verifiable_entity_header_reserved_1 == 0, f'Invalid value of reserved field ({verifiable_entity_header_reserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		transactions_hash = Hash256.deserialize(buffer)
		buffer = buffer[transactions_hash.size:]
		payload_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		aggregate_transaction_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert aggregate_transaction_header_reserved_1 == 0, f'Invalid value of reserved field ({aggregate_transaction_header_reserved_1})'
		transactions = ArrayHelpers.read_variable_size_elements(buffer[:payload_size], EmbeddedTransactionFactory, 8, skip_last_element_padding=False)
		buffer = buffer[payload_size:]
		cosignatures = ArrayHelpers.read_array(buffer, Cosignature)
		buffer = buffer[ArrayHelpers.size(cosignatures):]

		instance = AggregateBondedTransactionV2()
		instance._signature = signature
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		instance._transactions_hash = transactions_hash
		instance._transactions = transactions
		instance._cosignatures = cosignatures
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._verifiable_entity_header_reserved_1)
		buffer += self._signature.serialize()
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._transactions_hash.serialize()
		buffer += Converter::intToBytes($ArrayHelpers.size(self.transactions, 8, skip_last_element_padding=False))  # payload_size
		buffer += Converter::intToBytes($self._aggregate_transaction_header_reserved_1)
		buffer += ArrayHelpers.write_variable_size_elements(self._transactions, 8, skip_last_element_padding=False)
		buffer += ArrayHelpers.write_array(self._cosignatures)
		return buffer
	}

	__str__(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'transactions_hash: {self._transactions_hash.__str__()}, '
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
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'linked_public_key': 'pod:VotingPublicKey',
		'start_epoch': 'pod:FinalizationEpoch',
		'end_epoch': 'pod:FinalizationEpoch',
		'link_action': 'enum:LinkAction'
	}

	public function __construct(){
		self._signature = Signature()
		self._signer_public_key = PublicKey()
		self._version = VotingKeyLinkTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = VotingKeyLinkTransactionV1.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._linked_public_key = VotingPublicKey()
		self._start_epoch = FinalizationEpoch()
		self._end_epoch = FinalizationEpoch()
		self._link_action = LinkAction.UNLINK
		self._verifiable_entity_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
	}

	sort(){
		pass
	}

	signature(){
		return self._signature
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	fee(){
		return self._fee
	}

	deadline(){
		return self._deadline
	}

	linked_public_key(){
		return self._linked_public_key
	}

	start_epoch(){
		return self._start_epoch
	}

	end_epoch(){
		return self._end_epoch
	}

	link_action(){
		return self._link_action
	}

	signature(value: Signature){
		self._signature = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	fee(value: Amount){
		self._fee = value
	}

	deadline(value: Timestamp){
		self._deadline = value
	}

	linked_public_key(value: VotingPublicKey){
		self._linked_public_key = value
	}

	start_epoch(value: FinalizationEpoch){
		self._start_epoch = value
	}

	end_epoch(value: FinalizationEpoch){
		self._end_epoch = value
	}

	link_action(value: LinkAction){
		self._link_action = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signer_public_key.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		size += self.linked_public_key.size
		size += self.start_epoch.size
		size += self.end_epoch.size
		size += self.link_action.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiable_entity_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert verifiable_entity_header_reserved_1 == 0, f'Invalid value of reserved field ({verifiable_entity_header_reserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		linked_public_key = VotingPublicKey.deserialize(buffer)
		buffer = buffer[linked_public_key.size:]
		start_epoch = FinalizationEpoch.deserialize(buffer)
		buffer = buffer[start_epoch.size:]
		end_epoch = FinalizationEpoch.deserialize(buffer)
		buffer = buffer[end_epoch.size:]
		link_action = LinkAction.deserialize(buffer)
		buffer = buffer[link_action.size:]

		instance = VotingKeyLinkTransactionV1()
		instance._signature = signature
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		instance._linked_public_key = linked_public_key
		instance._start_epoch = start_epoch
		instance._end_epoch = end_epoch
		instance._link_action = link_action
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._verifiable_entity_header_reserved_1)
		buffer += self._signature.serialize()
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._linked_public_key.serialize()
		buffer += self._start_epoch.serialize()
		buffer += self._end_epoch.serialize()
		buffer += self._link_action.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'linked_public_key: {self._linked_public_key.__str__()}, '
		result += f'start_epoch: {self._start_epoch.__str__()}, '
		result += f'end_epoch: {self._end_epoch.__str__()}, '
		result += f'link_action: {self._link_action.__str__()}, '
		result += ')'
		return result
	}
}


class EmbeddedVotingKeyLinkTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.VOTING_KEY_LINK
	TYPE_HINTS = {
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'linked_public_key': 'pod:VotingPublicKey',
		'start_epoch': 'pod:FinalizationEpoch',
		'end_epoch': 'pod:FinalizationEpoch',
		'link_action': 'enum:LinkAction'
	}

	public function __construct(){
		self._signer_public_key = PublicKey()
		self._version = EmbeddedVotingKeyLinkTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = EmbeddedVotingKeyLinkTransactionV1.TRANSACTION_TYPE
		self._linked_public_key = VotingPublicKey()
		self._start_epoch = FinalizationEpoch()
		self._end_epoch = FinalizationEpoch()
		self._link_action = LinkAction.UNLINK
		self._embedded_transaction_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
	}

	sort(){
		pass
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	linked_public_key(){
		return self._linked_public_key
	}

	start_epoch(){
		return self._start_epoch
	}

	end_epoch(){
		return self._end_epoch
	}

	link_action(){
		return self._link_action
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	linked_public_key(value: VotingPublicKey){
		self._linked_public_key = value
	}

	start_epoch(value: FinalizationEpoch){
		self._start_epoch = value
	}

	end_epoch(value: FinalizationEpoch){
		self._end_epoch = value
	}

	link_action(value: LinkAction){
		self._link_action = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signer_public_key.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.linked_public_key.size
		size += self.start_epoch.size
		size += self.end_epoch.size
		size += self.link_action.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		embedded_transaction_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert embedded_transaction_header_reserved_1 == 0, f'Invalid value of reserved field ({embedded_transaction_header_reserved_1})'
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		linked_public_key = VotingPublicKey.deserialize(buffer)
		buffer = buffer[linked_public_key.size:]
		start_epoch = FinalizationEpoch.deserialize(buffer)
		buffer = buffer[start_epoch.size:]
		end_epoch = FinalizationEpoch.deserialize(buffer)
		buffer = buffer[end_epoch.size:]
		link_action = LinkAction.deserialize(buffer)
		buffer = buffer[link_action.size:]

		instance = EmbeddedVotingKeyLinkTransactionV1()
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._linked_public_key = linked_public_key
		instance._start_epoch = start_epoch
		instance._end_epoch = end_epoch
		instance._link_action = link_action
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._embedded_transaction_header_reserved_1)
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._linked_public_key.serialize()
		buffer += self._start_epoch.serialize()
		buffer += self._end_epoch.serialize()
		buffer += self._link_action.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'linked_public_key: {self._linked_public_key.__str__()}, '
		result += f'start_epoch: {self._start_epoch.__str__()}, '
		result += f'end_epoch: {self._end_epoch.__str__()}, '
		result += f'link_action: {self._link_action.__str__()}, '
		result += ')'
		return result
	}
}


class VrfKeyLinkTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.VRF_KEY_LINK
	TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'linked_public_key': 'pod:PublicKey',
		'link_action': 'enum:LinkAction'
	}

	public function __construct(){
		self._signature = Signature()
		self._signer_public_key = PublicKey()
		self._version = VrfKeyLinkTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = VrfKeyLinkTransactionV1.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._linked_public_key = PublicKey()
		self._link_action = LinkAction.UNLINK
		self._verifiable_entity_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
	}

	sort(){
		pass
	}

	signature(){
		return self._signature
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	fee(){
		return self._fee
	}

	deadline(){
		return self._deadline
	}

	linked_public_key(){
		return self._linked_public_key
	}

	link_action(){
		return self._link_action
	}

	signature(value: Signature){
		self._signature = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	fee(value: Amount){
		self._fee = value
	}

	deadline(value: Timestamp){
		self._deadline = value
	}

	linked_public_key(value: PublicKey){
		self._linked_public_key = value
	}

	link_action(value: LinkAction){
		self._link_action = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signer_public_key.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		size += self.linked_public_key.size
		size += self.link_action.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiable_entity_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert verifiable_entity_header_reserved_1 == 0, f'Invalid value of reserved field ({verifiable_entity_header_reserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		linked_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[linked_public_key.size:]
		link_action = LinkAction.deserialize(buffer)
		buffer = buffer[link_action.size:]

		instance = VrfKeyLinkTransactionV1()
		instance._signature = signature
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		instance._linked_public_key = linked_public_key
		instance._link_action = link_action
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._verifiable_entity_header_reserved_1)
		buffer += self._signature.serialize()
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._linked_public_key.serialize()
		buffer += self._link_action.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'linked_public_key: {self._linked_public_key.__str__()}, '
		result += f'link_action: {self._link_action.__str__()}, '
		result += ')'
		return result
	}
}


class EmbeddedVrfKeyLinkTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.VRF_KEY_LINK
	TYPE_HINTS = {
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'linked_public_key': 'pod:PublicKey',
		'link_action': 'enum:LinkAction'
	}

	public function __construct(){
		self._signer_public_key = PublicKey()
		self._version = EmbeddedVrfKeyLinkTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = EmbeddedVrfKeyLinkTransactionV1.TRANSACTION_TYPE
		self._linked_public_key = PublicKey()
		self._link_action = LinkAction.UNLINK
		self._embedded_transaction_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
	}

	sort(){
		pass
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	linked_public_key(){
		return self._linked_public_key
	}

	link_action(){
		return self._link_action
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	linked_public_key(value: PublicKey){
		self._linked_public_key = value
	}

	link_action(value: LinkAction){
		self._link_action = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signer_public_key.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.linked_public_key.size
		size += self.link_action.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		embedded_transaction_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert embedded_transaction_header_reserved_1 == 0, f'Invalid value of reserved field ({embedded_transaction_header_reserved_1})'
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		linked_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[linked_public_key.size:]
		link_action = LinkAction.deserialize(buffer)
		buffer = buffer[link_action.size:]

		instance = EmbeddedVrfKeyLinkTransactionV1()
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._linked_public_key = linked_public_key
		instance._link_action = link_action
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._embedded_transaction_header_reserved_1)
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._linked_public_key.serialize()
		buffer += self._link_action.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'linked_public_key: {self._linked_public_key.__str__()}, '
		result += f'link_action: {self._link_action.__str__()}, '
		result += ')'
		return result
	}
}


class HashLockTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.HASH_LOCK
	TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'mosaic': 'struct:UnresolvedMosaic',
		'duration': 'pod:BlockDuration',
		'hash': 'pod:Hash256'
	}

	public function __construct(){
		self._signature = Signature()
		self._signer_public_key = PublicKey()
		self._version = HashLockTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = HashLockTransactionV1.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._mosaic = UnresolvedMosaic()
		self._duration = BlockDuration()
		self._hash = Hash256()
		self._verifiable_entity_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
	}

	sort(){
		self._mosaic.sort()
	}

	signature(){
		return self._signature
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	fee(){
		return self._fee
	}

	deadline(){
		return self._deadline
	}

	mosaic(){
		return self._mosaic
	}

	duration(){
		return self._duration
	}

	hash(){
		return self._hash
	}

	signature(value: Signature){
		self._signature = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	fee(value: Amount){
		self._fee = value
	}

	deadline(value: Timestamp){
		self._deadline = value
	}

	mosaic(value: UnresolvedMosaic){
		self._mosaic = value
	}

	duration(value: BlockDuration){
		self._duration = value
	}

	hash(value: Hash256){
		self._hash = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signer_public_key.size
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

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiable_entity_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert verifiable_entity_header_reserved_1 == 0, f'Invalid value of reserved field ({verifiable_entity_header_reserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
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
		instance._signer_public_key = signer_public_key
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

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._verifiable_entity_header_reserved_1)
		buffer += self._signature.serialize()
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._mosaic.serialize()
		buffer += self._duration.serialize()
		buffer += self._hash.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
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
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'mosaic': 'struct:UnresolvedMosaic',
		'duration': 'pod:BlockDuration',
		'hash': 'pod:Hash256'
	}

	public function __construct(){
		self._signer_public_key = PublicKey()
		self._version = EmbeddedHashLockTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = EmbeddedHashLockTransactionV1.TRANSACTION_TYPE
		self._mosaic = UnresolvedMosaic()
		self._duration = BlockDuration()
		self._hash = Hash256()
		self._embedded_transaction_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
	}

	sort(){
		self._mosaic.sort()
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	mosaic(){
		return self._mosaic
	}

	duration(){
		return self._duration
	}

	hash(){
		return self._hash
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	mosaic(value: UnresolvedMosaic){
		self._mosaic = value
	}

	duration(value: BlockDuration){
		self._duration = value
	}

	hash(value: Hash256){
		self._hash = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signer_public_key.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.mosaic.size
		size += self.duration.size
		size += self.hash.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		embedded_transaction_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert embedded_transaction_header_reserved_1 == 0, f'Invalid value of reserved field ({embedded_transaction_header_reserved_1})'
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
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
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._mosaic = mosaic
		instance._duration = duration
		instance._hash = hash
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._embedded_transaction_header_reserved_1)
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._mosaic.serialize()
		buffer += self._duration.serialize()
		buffer += self._hash.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
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

	size(){
		return 1
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		return LockHashAlgorithm(Converter::bytesToInt(byteArray))
	}

	public function serialize(){
		buffer = bytes()
		buffer += Converter::intToBytes($self.value)
		return buffer
	}
}


class SecretLockTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.SECRET_LOCK
	TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'recipient_address': 'pod:UnresolvedAddress',
		'secret': 'pod:Hash256',
		'mosaic': 'struct:UnresolvedMosaic',
		'duration': 'pod:BlockDuration',
		'hash_algorithm': 'enum:LockHashAlgorithm'
	}

	public function __construct(){
		self._signature = Signature()
		self._signer_public_key = PublicKey()
		self._version = SecretLockTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = SecretLockTransactionV1.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._recipient_address = UnresolvedAddress()
		self._secret = Hash256()
		self._mosaic = UnresolvedMosaic()
		self._duration = BlockDuration()
		self._hash_algorithm = LockHashAlgorithm.SHA3_256
		self._verifiable_entity_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
	}

	sort(){
		self._mosaic.sort()
	}

	signature(){
		return self._signature
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	fee(){
		return self._fee
	}

	deadline(){
		return self._deadline
	}

	recipient_address(){
		return self._recipient_address
	}

	secret(){
		return self._secret
	}

	mosaic(){
		return self._mosaic
	}

	duration(){
		return self._duration
	}

	hash_algorithm(){
		return self._hash_algorithm
	}

	signature(value: Signature){
		self._signature = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	fee(value: Amount){
		self._fee = value
	}

	deadline(value: Timestamp){
		self._deadline = value
	}

	recipient_address(value: UnresolvedAddress){
		self._recipient_address = value
	}

	secret(value: Hash256){
		self._secret = value
	}

	mosaic(value: UnresolvedMosaic){
		self._mosaic = value
	}

	duration(value: BlockDuration){
		self._duration = value
	}

	hash_algorithm(value: LockHashAlgorithm){
		self._hash_algorithm = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signer_public_key.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		size += self.recipient_address.size
		size += self.secret.size
		size += self.mosaic.size
		size += self.duration.size
		size += self.hash_algorithm.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiable_entity_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert verifiable_entity_header_reserved_1 == 0, f'Invalid value of reserved field ({verifiable_entity_header_reserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		recipient_address = UnresolvedAddress.deserialize(buffer)
		buffer = buffer[recipient_address.size:]
		secret = Hash256.deserialize(buffer)
		buffer = buffer[secret.size:]
		mosaic = UnresolvedMosaic.deserialize(buffer)
		buffer = buffer[mosaic.size:]
		duration = BlockDuration.deserialize(buffer)
		buffer = buffer[duration.size:]
		hash_algorithm = LockHashAlgorithm.deserialize(buffer)
		buffer = buffer[hash_algorithm.size:]

		instance = SecretLockTransactionV1()
		instance._signature = signature
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		instance._recipient_address = recipient_address
		instance._secret = secret
		instance._mosaic = mosaic
		instance._duration = duration
		instance._hash_algorithm = hash_algorithm
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._verifiable_entity_header_reserved_1)
		buffer += self._signature.serialize()
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._recipient_address.serialize()
		buffer += self._secret.serialize()
		buffer += self._mosaic.serialize()
		buffer += self._duration.serialize()
		buffer += self._hash_algorithm.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'recipient_address: {self._recipient_address.__str__()}, '
		result += f'secret: {self._secret.__str__()}, '
		result += f'mosaic: {self._mosaic.__str__()}, '
		result += f'duration: {self._duration.__str__()}, '
		result += f'hash_algorithm: {self._hash_algorithm.__str__()}, '
		result += ')'
		return result
	}
}


class EmbeddedSecretLockTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.SECRET_LOCK
	TYPE_HINTS = {
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'recipient_address': 'pod:UnresolvedAddress',
		'secret': 'pod:Hash256',
		'mosaic': 'struct:UnresolvedMosaic',
		'duration': 'pod:BlockDuration',
		'hash_algorithm': 'enum:LockHashAlgorithm'
	}

	public function __construct(){
		self._signer_public_key = PublicKey()
		self._version = EmbeddedSecretLockTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = EmbeddedSecretLockTransactionV1.TRANSACTION_TYPE
		self._recipient_address = UnresolvedAddress()
		self._secret = Hash256()
		self._mosaic = UnresolvedMosaic()
		self._duration = BlockDuration()
		self._hash_algorithm = LockHashAlgorithm.SHA3_256
		self._embedded_transaction_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
	}

	sort(){
		self._mosaic.sort()
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	recipient_address(){
		return self._recipient_address
	}

	secret(){
		return self._secret
	}

	mosaic(){
		return self._mosaic
	}

	duration(){
		return self._duration
	}

	hash_algorithm(){
		return self._hash_algorithm
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	recipient_address(value: UnresolvedAddress){
		self._recipient_address = value
	}

	secret(value: Hash256){
		self._secret = value
	}

	mosaic(value: UnresolvedMosaic){
		self._mosaic = value
	}

	duration(value: BlockDuration){
		self._duration = value
	}

	hash_algorithm(value: LockHashAlgorithm){
		self._hash_algorithm = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signer_public_key.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.recipient_address.size
		size += self.secret.size
		size += self.mosaic.size
		size += self.duration.size
		size += self.hash_algorithm.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		embedded_transaction_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert embedded_transaction_header_reserved_1 == 0, f'Invalid value of reserved field ({embedded_transaction_header_reserved_1})'
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		recipient_address = UnresolvedAddress.deserialize(buffer)
		buffer = buffer[recipient_address.size:]
		secret = Hash256.deserialize(buffer)
		buffer = buffer[secret.size:]
		mosaic = UnresolvedMosaic.deserialize(buffer)
		buffer = buffer[mosaic.size:]
		duration = BlockDuration.deserialize(buffer)
		buffer = buffer[duration.size:]
		hash_algorithm = LockHashAlgorithm.deserialize(buffer)
		buffer = buffer[hash_algorithm.size:]

		instance = EmbeddedSecretLockTransactionV1()
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._recipient_address = recipient_address
		instance._secret = secret
		instance._mosaic = mosaic
		instance._duration = duration
		instance._hash_algorithm = hash_algorithm
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._embedded_transaction_header_reserved_1)
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._recipient_address.serialize()
		buffer += self._secret.serialize()
		buffer += self._mosaic.serialize()
		buffer += self._duration.serialize()
		buffer += self._hash_algorithm.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'recipient_address: {self._recipient_address.__str__()}, '
		result += f'secret: {self._secret.__str__()}, '
		result += f'mosaic: {self._mosaic.__str__()}, '
		result += f'duration: {self._duration.__str__()}, '
		result += f'hash_algorithm: {self._hash_algorithm.__str__()}, '
		result += ')'
		return result
	}
}


class SecretProofTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.SECRET_PROOF
	TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'recipient_address': 'pod:UnresolvedAddress',
		'secret': 'pod:Hash256',
		'hash_algorithm': 'enum:LockHashAlgorithm',
		'proof': 'bytes_array'
	}

	public function __construct(){
		self._signature = Signature()
		self._signer_public_key = PublicKey()
		self._version = SecretProofTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = SecretProofTransactionV1.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._recipient_address = UnresolvedAddress()
		self._secret = Hash256()
		self._hash_algorithm = LockHashAlgorithm.SHA3_256
		self._proof = bytes()
		self._verifiable_entity_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
	}

	sort(){
		pass
	}

	signature(){
		return self._signature
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	fee(){
		return self._fee
	}

	deadline(){
		return self._deadline
	}

	recipient_address(){
		return self._recipient_address
	}

	secret(){
		return self._secret
	}

	hash_algorithm(){
		return self._hash_algorithm
	}

	proof(){
		return self._proof
	}

	signature(value: Signature){
		self._signature = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	fee(value: Amount){
		self._fee = value
	}

	deadline(value: Timestamp){
		self._deadline = value
	}

	recipient_address(value: UnresolvedAddress){
		self._recipient_address = value
	}

	secret(value: Hash256){
		self._secret = value
	}

	hash_algorithm(value: LockHashAlgorithm){
		self._hash_algorithm = value
	}

	proof(value: bytes){
		self._proof = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signer_public_key.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		size += self.recipient_address.size
		size += self.secret.size
		size += 2
		size += self.hash_algorithm.size
		size += len(self._proof)
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiable_entity_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert verifiable_entity_header_reserved_1 == 0, f'Invalid value of reserved field ({verifiable_entity_header_reserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		recipient_address = UnresolvedAddress.deserialize(buffer)
		buffer = buffer[recipient_address.size:]
		secret = Hash256.deserialize(buffer)
		buffer = buffer[secret.size:]
		proof_size = Converter::bytesToInt(byteArray)
		buffer = buffer[2:]
		hash_algorithm = LockHashAlgorithm.deserialize(buffer)
		buffer = buffer[hash_algorithm.size:]
		proof = ArrayHelpers.get_bytes(buffer, proof_size)
		buffer = buffer[proof_size:]

		instance = SecretProofTransactionV1()
		instance._signature = signature
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		instance._recipient_address = recipient_address
		instance._secret = secret
		instance._hash_algorithm = hash_algorithm
		instance._proof = proof
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._verifiable_entity_header_reserved_1)
		buffer += self._signature.serialize()
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._recipient_address.serialize()
		buffer += self._secret.serialize()
		buffer += Converter::intToBytes($len(self._proof))  # proof_size
		buffer += self._hash_algorithm.serialize()
		buffer += self._proof
		return buffer
	}

	__str__(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'recipient_address: {self._recipient_address.__str__()}, '
		result += f'secret: {self._secret.__str__()}, '
		result += f'hash_algorithm: {self._hash_algorithm.__str__()}, '
		result += f'proof: {hexlify(self._proof).decode("utf8")}, '
		result += ')'
		return result
	}
}


class EmbeddedSecretProofTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.SECRET_PROOF
	TYPE_HINTS = {
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'recipient_address': 'pod:UnresolvedAddress',
		'secret': 'pod:Hash256',
		'hash_algorithm': 'enum:LockHashAlgorithm',
		'proof': 'bytes_array'
	}

	public function __construct(){
		self._signer_public_key = PublicKey()
		self._version = EmbeddedSecretProofTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = EmbeddedSecretProofTransactionV1.TRANSACTION_TYPE
		self._recipient_address = UnresolvedAddress()
		self._secret = Hash256()
		self._hash_algorithm = LockHashAlgorithm.SHA3_256
		self._proof = bytes()
		self._embedded_transaction_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
	}

	sort(){
		pass
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	recipient_address(){
		return self._recipient_address
	}

	secret(){
		return self._secret
	}

	hash_algorithm(){
		return self._hash_algorithm
	}

	proof(){
		return self._proof
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	recipient_address(value: UnresolvedAddress){
		self._recipient_address = value
	}

	secret(value: Hash256){
		self._secret = value
	}

	hash_algorithm(value: LockHashAlgorithm){
		self._hash_algorithm = value
	}

	proof(value: bytes){
		self._proof = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signer_public_key.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.recipient_address.size
		size += self.secret.size
		size += 2
		size += self.hash_algorithm.size
		size += len(self._proof)
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		embedded_transaction_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert embedded_transaction_header_reserved_1 == 0, f'Invalid value of reserved field ({embedded_transaction_header_reserved_1})'
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		recipient_address = UnresolvedAddress.deserialize(buffer)
		buffer = buffer[recipient_address.size:]
		secret = Hash256.deserialize(buffer)
		buffer = buffer[secret.size:]
		proof_size = Converter::bytesToInt(byteArray)
		buffer = buffer[2:]
		hash_algorithm = LockHashAlgorithm.deserialize(buffer)
		buffer = buffer[hash_algorithm.size:]
		proof = ArrayHelpers.get_bytes(buffer, proof_size)
		buffer = buffer[proof_size:]

		instance = EmbeddedSecretProofTransactionV1()
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._recipient_address = recipient_address
		instance._secret = secret
		instance._hash_algorithm = hash_algorithm
		instance._proof = proof
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._embedded_transaction_header_reserved_1)
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._recipient_address.serialize()
		buffer += self._secret.serialize()
		buffer += Converter::intToBytes($len(self._proof))  # proof_size
		buffer += self._hash_algorithm.serialize()
		buffer += self._proof
		return buffer
	}

	__str__(){
		result = '('
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'recipient_address: {self._recipient_address.__str__()}, '
		result += f'secret: {self._secret.__str__()}, '
		result += f'hash_algorithm: {self._hash_algorithm.__str__()}, '
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
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'target_address': 'pod:UnresolvedAddress',
		'value': 'bytes_array'
	}

	public function __construct(){
		self._signature = Signature()
		self._signer_public_key = PublicKey()
		self._version = AccountMetadataTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = AccountMetadataTransactionV1.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._target_address = UnresolvedAddress()
		self._scoped_metadata_key = 0
		self._value_size_delta = 0
		self._value = bytes()
		self._verifiable_entity_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
	}

	sort(){
		pass
	}

	signature(){
		return self._signature
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	fee(){
		return self._fee
	}

	deadline(){
		return self._deadline
	}

	target_address(){
		return self._target_address
	}

	scoped_metadata_key(){
		return self._scoped_metadata_key
	}

	value_size_delta(){
		return self._value_size_delta
	}

	value(){
		return self._value
	}

	signature(value: Signature){
		self._signature = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	fee(value: Amount){
		self._fee = value
	}

	deadline(value: Timestamp){
		self._deadline = value
	}

	target_address(value: UnresolvedAddress){
		self._target_address = value
	}

	scoped_metadata_key(value: int){
		self._scoped_metadata_key = value
	}

	value_size_delta(value: int){
		self._value_size_delta = value
	}

	value(value: bytes){
		self._value = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signer_public_key.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		size += self.target_address.size
		size += 8
		size += 2
		size += 2
		size += len(self._value)
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiable_entity_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert verifiable_entity_header_reserved_1 == 0, f'Invalid value of reserved field ({verifiable_entity_header_reserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		target_address = UnresolvedAddress.deserialize(buffer)
		buffer = buffer[target_address.size:]
		scoped_metadata_key = Converter::bytesToInt(byteArray)
		buffer = buffer[8:]
		value_size_delta = Converter::bytesToInt(byteArray)
		buffer = buffer[2:]
		value_size = Converter::bytesToInt(byteArray)
		buffer = buffer[2:]
		value = ArrayHelpers.get_bytes(buffer, value_size)
		buffer = buffer[value_size:]

		instance = AccountMetadataTransactionV1()
		instance._signature = signature
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		instance._target_address = target_address
		instance._scoped_metadata_key = scoped_metadata_key
		instance._value_size_delta = value_size_delta
		instance._value = value
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._verifiable_entity_header_reserved_1)
		buffer += self._signature.serialize()
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._target_address.serialize()
		buffer += Converter::intToBytes($self._scoped_metadata_key)
		buffer += Converter::intToBytes($self._value_size_delta)
		buffer += Converter::intToBytes($len(self._value))  # value_size
		buffer += self._value
		return buffer
	}

	__str__(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'target_address: {self._target_address.__str__()}, '
		result += f'scoped_metadata_key: 0x{self._scoped_metadata_key:X}, '
		result += f'value_size_delta: 0x{self._value_size_delta:X}, '
		result += f'value: {hexlify(self._value).decode("utf8")}, '
		result += ')'
		return result
	}
}


class EmbeddedAccountMetadataTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.ACCOUNT_METADATA
	TYPE_HINTS = {
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'target_address': 'pod:UnresolvedAddress',
		'value': 'bytes_array'
	}

	public function __construct(){
		self._signer_public_key = PublicKey()
		self._version = EmbeddedAccountMetadataTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = EmbeddedAccountMetadataTransactionV1.TRANSACTION_TYPE
		self._target_address = UnresolvedAddress()
		self._scoped_metadata_key = 0
		self._value_size_delta = 0
		self._value = bytes()
		self._embedded_transaction_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
	}

	sort(){
		pass
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	target_address(){
		return self._target_address
	}

	scoped_metadata_key(){
		return self._scoped_metadata_key
	}

	value_size_delta(){
		return self._value_size_delta
	}

	value(){
		return self._value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	target_address(value: UnresolvedAddress){
		self._target_address = value
	}

	scoped_metadata_key(value: int){
		self._scoped_metadata_key = value
	}

	value_size_delta(value: int){
		self._value_size_delta = value
	}

	value(value: bytes){
		self._value = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signer_public_key.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.target_address.size
		size += 8
		size += 2
		size += 2
		size += len(self._value)
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		embedded_transaction_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert embedded_transaction_header_reserved_1 == 0, f'Invalid value of reserved field ({embedded_transaction_header_reserved_1})'
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		target_address = UnresolvedAddress.deserialize(buffer)
		buffer = buffer[target_address.size:]
		scoped_metadata_key = Converter::bytesToInt(byteArray)
		buffer = buffer[8:]
		value_size_delta = Converter::bytesToInt(byteArray)
		buffer = buffer[2:]
		value_size = Converter::bytesToInt(byteArray)
		buffer = buffer[2:]
		value = ArrayHelpers.get_bytes(buffer, value_size)
		buffer = buffer[value_size:]

		instance = EmbeddedAccountMetadataTransactionV1()
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._target_address = target_address
		instance._scoped_metadata_key = scoped_metadata_key
		instance._value_size_delta = value_size_delta
		instance._value = value
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._embedded_transaction_header_reserved_1)
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._target_address.serialize()
		buffer += Converter::intToBytes($self._scoped_metadata_key)
		buffer += Converter::intToBytes($self._value_size_delta)
		buffer += Converter::intToBytes($len(self._value))  # value_size
		buffer += self._value
		return buffer
	}

	__str__(){
		result = '('
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'target_address: {self._target_address.__str__()}, '
		result += f'scoped_metadata_key: 0x{self._scoped_metadata_key:X}, '
		result += f'value_size_delta: 0x{self._value_size_delta:X}, '
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
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'target_address': 'pod:UnresolvedAddress',
		'target_mosaic_id': 'pod:UnresolvedMosaicId',
		'value': 'bytes_array'
	}

	public function __construct(){
		self._signature = Signature()
		self._signer_public_key = PublicKey()
		self._version = MosaicMetadataTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = MosaicMetadataTransactionV1.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._target_address = UnresolvedAddress()
		self._scoped_metadata_key = 0
		self._target_mosaic_id = UnresolvedMosaicId()
		self._value_size_delta = 0
		self._value = bytes()
		self._verifiable_entity_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
	}

	sort(){
		pass
	}

	signature(){
		return self._signature
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	fee(){
		return self._fee
	}

	deadline(){
		return self._deadline
	}

	target_address(){
		return self._target_address
	}

	scoped_metadata_key(){
		return self._scoped_metadata_key
	}

	target_mosaic_id(){
		return self._target_mosaic_id
	}

	value_size_delta(){
		return self._value_size_delta
	}

	value(){
		return self._value
	}

	signature(value: Signature){
		self._signature = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	fee(value: Amount){
		self._fee = value
	}

	deadline(value: Timestamp){
		self._deadline = value
	}

	target_address(value: UnresolvedAddress){
		self._target_address = value
	}

	scoped_metadata_key(value: int){
		self._scoped_metadata_key = value
	}

	target_mosaic_id(value: UnresolvedMosaicId){
		self._target_mosaic_id = value
	}

	value_size_delta(value: int){
		self._value_size_delta = value
	}

	value(value: bytes){
		self._value = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signer_public_key.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		size += self.target_address.size
		size += 8
		size += self.target_mosaic_id.size
		size += 2
		size += 2
		size += len(self._value)
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiable_entity_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert verifiable_entity_header_reserved_1 == 0, f'Invalid value of reserved field ({verifiable_entity_header_reserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		target_address = UnresolvedAddress.deserialize(buffer)
		buffer = buffer[target_address.size:]
		scoped_metadata_key = Converter::bytesToInt(byteArray)
		buffer = buffer[8:]
		target_mosaic_id = UnresolvedMosaicId.deserialize(buffer)
		buffer = buffer[target_mosaic_id.size:]
		value_size_delta = Converter::bytesToInt(byteArray)
		buffer = buffer[2:]
		value_size = Converter::bytesToInt(byteArray)
		buffer = buffer[2:]
		value = ArrayHelpers.get_bytes(buffer, value_size)
		buffer = buffer[value_size:]

		instance = MosaicMetadataTransactionV1()
		instance._signature = signature
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		instance._target_address = target_address
		instance._scoped_metadata_key = scoped_metadata_key
		instance._target_mosaic_id = target_mosaic_id
		instance._value_size_delta = value_size_delta
		instance._value = value
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._verifiable_entity_header_reserved_1)
		buffer += self._signature.serialize()
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._target_address.serialize()
		buffer += Converter::intToBytes($self._scoped_metadata_key)
		buffer += self._target_mosaic_id.serialize()
		buffer += Converter::intToBytes($self._value_size_delta)
		buffer += Converter::intToBytes($len(self._value))  # value_size
		buffer += self._value
		return buffer
	}

	__str__(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'target_address: {self._target_address.__str__()}, '
		result += f'scoped_metadata_key: 0x{self._scoped_metadata_key:X}, '
		result += f'target_mosaic_id: {self._target_mosaic_id.__str__()}, '
		result += f'value_size_delta: 0x{self._value_size_delta:X}, '
		result += f'value: {hexlify(self._value).decode("utf8")}, '
		result += ')'
		return result
	}
}


class EmbeddedMosaicMetadataTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.MOSAIC_METADATA
	TYPE_HINTS = {
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'target_address': 'pod:UnresolvedAddress',
		'target_mosaic_id': 'pod:UnresolvedMosaicId',
		'value': 'bytes_array'
	}

	public function __construct(){
		self._signer_public_key = PublicKey()
		self._version = EmbeddedMosaicMetadataTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = EmbeddedMosaicMetadataTransactionV1.TRANSACTION_TYPE
		self._target_address = UnresolvedAddress()
		self._scoped_metadata_key = 0
		self._target_mosaic_id = UnresolvedMosaicId()
		self._value_size_delta = 0
		self._value = bytes()
		self._embedded_transaction_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
	}

	sort(){
		pass
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	target_address(){
		return self._target_address
	}

	scoped_metadata_key(){
		return self._scoped_metadata_key
	}

	target_mosaic_id(){
		return self._target_mosaic_id
	}

	value_size_delta(){
		return self._value_size_delta
	}

	value(){
		return self._value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	target_address(value: UnresolvedAddress){
		self._target_address = value
	}

	scoped_metadata_key(value: int){
		self._scoped_metadata_key = value
	}

	target_mosaic_id(value: UnresolvedMosaicId){
		self._target_mosaic_id = value
	}

	value_size_delta(value: int){
		self._value_size_delta = value
	}

	value(value: bytes){
		self._value = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signer_public_key.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.target_address.size
		size += 8
		size += self.target_mosaic_id.size
		size += 2
		size += 2
		size += len(self._value)
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		embedded_transaction_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert embedded_transaction_header_reserved_1 == 0, f'Invalid value of reserved field ({embedded_transaction_header_reserved_1})'
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		target_address = UnresolvedAddress.deserialize(buffer)
		buffer = buffer[target_address.size:]
		scoped_metadata_key = Converter::bytesToInt(byteArray)
		buffer = buffer[8:]
		target_mosaic_id = UnresolvedMosaicId.deserialize(buffer)
		buffer = buffer[target_mosaic_id.size:]
		value_size_delta = Converter::bytesToInt(byteArray)
		buffer = buffer[2:]
		value_size = Converter::bytesToInt(byteArray)
		buffer = buffer[2:]
		value = ArrayHelpers.get_bytes(buffer, value_size)
		buffer = buffer[value_size:]

		instance = EmbeddedMosaicMetadataTransactionV1()
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._target_address = target_address
		instance._scoped_metadata_key = scoped_metadata_key
		instance._target_mosaic_id = target_mosaic_id
		instance._value_size_delta = value_size_delta
		instance._value = value
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._embedded_transaction_header_reserved_1)
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._target_address.serialize()
		buffer += Converter::intToBytes($self._scoped_metadata_key)
		buffer += self._target_mosaic_id.serialize()
		buffer += Converter::intToBytes($self._value_size_delta)
		buffer += Converter::intToBytes($len(self._value))  # value_size
		buffer += self._value
		return buffer
	}

	__str__(){
		result = '('
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'target_address: {self._target_address.__str__()}, '
		result += f'scoped_metadata_key: 0x{self._scoped_metadata_key:X}, '
		result += f'target_mosaic_id: {self._target_mosaic_id.__str__()}, '
		result += f'value_size_delta: 0x{self._value_size_delta:X}, '
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
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'target_address': 'pod:UnresolvedAddress',
		'target_namespace_id': 'pod:NamespaceId',
		'value': 'bytes_array'
	}

	public function __construct(){
		self._signature = Signature()
		self._signer_public_key = PublicKey()
		self._version = NamespaceMetadataTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = NamespaceMetadataTransactionV1.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._target_address = UnresolvedAddress()
		self._scoped_metadata_key = 0
		self._target_namespace_id = NamespaceId()
		self._value_size_delta = 0
		self._value = bytes()
		self._verifiable_entity_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
	}

	sort(){
		pass
	}

	signature(){
		return self._signature
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	fee(){
		return self._fee
	}

	deadline(){
		return self._deadline
	}

	target_address(){
		return self._target_address
	}

	scoped_metadata_key(){
		return self._scoped_metadata_key
	}

	target_namespace_id(){
		return self._target_namespace_id
	}

	value_size_delta(){
		return self._value_size_delta
	}

	value(){
		return self._value
	}

	signature(value: Signature){
		self._signature = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	fee(value: Amount){
		self._fee = value
	}

	deadline(value: Timestamp){
		self._deadline = value
	}

	target_address(value: UnresolvedAddress){
		self._target_address = value
	}

	scoped_metadata_key(value: int){
		self._scoped_metadata_key = value
	}

	target_namespace_id(value: NamespaceId){
		self._target_namespace_id = value
	}

	value_size_delta(value: int){
		self._value_size_delta = value
	}

	value(value: bytes){
		self._value = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signer_public_key.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		size += self.target_address.size
		size += 8
		size += self.target_namespace_id.size
		size += 2
		size += 2
		size += len(self._value)
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiable_entity_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert verifiable_entity_header_reserved_1 == 0, f'Invalid value of reserved field ({verifiable_entity_header_reserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		target_address = UnresolvedAddress.deserialize(buffer)
		buffer = buffer[target_address.size:]
		scoped_metadata_key = Converter::bytesToInt(byteArray)
		buffer = buffer[8:]
		target_namespace_id = NamespaceId.deserialize(buffer)
		buffer = buffer[target_namespace_id.size:]
		value_size_delta = Converter::bytesToInt(byteArray)
		buffer = buffer[2:]
		value_size = Converter::bytesToInt(byteArray)
		buffer = buffer[2:]
		value = ArrayHelpers.get_bytes(buffer, value_size)
		buffer = buffer[value_size:]

		instance = NamespaceMetadataTransactionV1()
		instance._signature = signature
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		instance._target_address = target_address
		instance._scoped_metadata_key = scoped_metadata_key
		instance._target_namespace_id = target_namespace_id
		instance._value_size_delta = value_size_delta
		instance._value = value
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._verifiable_entity_header_reserved_1)
		buffer += self._signature.serialize()
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._target_address.serialize()
		buffer += Converter::intToBytes($self._scoped_metadata_key)
		buffer += self._target_namespace_id.serialize()
		buffer += Converter::intToBytes($self._value_size_delta)
		buffer += Converter::intToBytes($len(self._value))  # value_size
		buffer += self._value
		return buffer
	}

	__str__(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'target_address: {self._target_address.__str__()}, '
		result += f'scoped_metadata_key: 0x{self._scoped_metadata_key:X}, '
		result += f'target_namespace_id: {self._target_namespace_id.__str__()}, '
		result += f'value_size_delta: 0x{self._value_size_delta:X}, '
		result += f'value: {hexlify(self._value).decode("utf8")}, '
		result += ')'
		return result
	}
}


class EmbeddedNamespaceMetadataTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.NAMESPACE_METADATA
	TYPE_HINTS = {
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'target_address': 'pod:UnresolvedAddress',
		'target_namespace_id': 'pod:NamespaceId',
		'value': 'bytes_array'
	}

	public function __construct(){
		self._signer_public_key = PublicKey()
		self._version = EmbeddedNamespaceMetadataTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = EmbeddedNamespaceMetadataTransactionV1.TRANSACTION_TYPE
		self._target_address = UnresolvedAddress()
		self._scoped_metadata_key = 0
		self._target_namespace_id = NamespaceId()
		self._value_size_delta = 0
		self._value = bytes()
		self._embedded_transaction_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
	}

	sort(){
		pass
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	target_address(){
		return self._target_address
	}

	scoped_metadata_key(){
		return self._scoped_metadata_key
	}

	target_namespace_id(){
		return self._target_namespace_id
	}

	value_size_delta(){
		return self._value_size_delta
	}

	value(){
		return self._value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	target_address(value: UnresolvedAddress){
		self._target_address = value
	}

	scoped_metadata_key(value: int){
		self._scoped_metadata_key = value
	}

	target_namespace_id(value: NamespaceId){
		self._target_namespace_id = value
	}

	value_size_delta(value: int){
		self._value_size_delta = value
	}

	value(value: bytes){
		self._value = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signer_public_key.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.target_address.size
		size += 8
		size += self.target_namespace_id.size
		size += 2
		size += 2
		size += len(self._value)
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		embedded_transaction_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert embedded_transaction_header_reserved_1 == 0, f'Invalid value of reserved field ({embedded_transaction_header_reserved_1})'
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		target_address = UnresolvedAddress.deserialize(buffer)
		buffer = buffer[target_address.size:]
		scoped_metadata_key = Converter::bytesToInt(byteArray)
		buffer = buffer[8:]
		target_namespace_id = NamespaceId.deserialize(buffer)
		buffer = buffer[target_namespace_id.size:]
		value_size_delta = Converter::bytesToInt(byteArray)
		buffer = buffer[2:]
		value_size = Converter::bytesToInt(byteArray)
		buffer = buffer[2:]
		value = ArrayHelpers.get_bytes(buffer, value_size)
		buffer = buffer[value_size:]

		instance = EmbeddedNamespaceMetadataTransactionV1()
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._target_address = target_address
		instance._scoped_metadata_key = scoped_metadata_key
		instance._target_namespace_id = target_namespace_id
		instance._value_size_delta = value_size_delta
		instance._value = value
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._embedded_transaction_header_reserved_1)
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._target_address.serialize()
		buffer += Converter::intToBytes($self._scoped_metadata_key)
		buffer += self._target_namespace_id.serialize()
		buffer += Converter::intToBytes($self._value_size_delta)
		buffer += Converter::intToBytes($len(self._value))  # value_size
		buffer += self._value
		return buffer
	}

	__str__(){
		result = '('
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'target_address: {self._target_address.__str__()}, '
		result += f'scoped_metadata_key: 0x{self._scoped_metadata_key:X}, '
		result += f'target_namespace_id: {self._target_namespace_id.__str__()}, '
		result += f'value_size_delta: 0x{self._value_size_delta:X}, '
		result += f'value: {hexlify(self._value).decode("utf8")}, '
		result += ')'
		return result
	}
}


class MosaicNonce extends BaseValue {
	const SIZE = 4;

	public function __construct($mosaic_nonce = 0){
		parent::__construct(self::SIZE, $mosaic_nonce);
	}

	public static function deserialize($payload){
		$byteArray = $payload;
		return new MosaicNonce(Converter::bytesToInt(byteArray));
	}

	public function serialize(){
		return Converter::intToBytes($$this->value);
	}
}


class MosaicFlags extends (Flag) {
	NONE = 0
	SUPPLY_MUTABLE = 1
	TRANSFERABLE = 2
	RESTRICTABLE = 4
	REVOKABLE = 8

	size(){
		return 1
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		return MosaicFlags(Converter::bytesToInt(byteArray))
	}

	public function serialize(){
		buffer = bytes()
		buffer += Converter::intToBytes($self.value)
		return buffer
	}
}


class MosaicSupplyChangeAction extends (Enum) {
	DECREASE = 0
	INCREASE = 1

	size(){
		return 1
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		return MosaicSupplyChangeAction(Converter::bytesToInt(byteArray))
	}

	public function serialize(){
		buffer = bytes()
		buffer += Converter::intToBytes($self.value)
		return buffer
	}
}


class MosaicDefinitionTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.MOSAIC_DEFINITION
	TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'id': 'pod:MosaicId',
		'duration': 'pod:BlockDuration',
		'nonce': 'pod:MosaicNonce',
		'flags': 'enum:MosaicFlags'
	}

	public function __construct(){
		self._signature = Signature()
		self._signer_public_key = PublicKey()
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
		self._verifiable_entity_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
	}

	sort(){
		pass
	}

	signature(){
		return self._signature
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	fee(){
		return self._fee
	}

	deadline(){
		return self._deadline
	}

	id(){
		return self._id
	}

	duration(){
		return self._duration
	}

	nonce(){
		return self._nonce
	}

	flags(){
		return self._flags
	}

	divisibility(){
		return self._divisibility
	}

	signature(value: Signature){
		self._signature = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	fee(value: Amount){
		self._fee = value
	}

	deadline(value: Timestamp){
		self._deadline = value
	}

	id(value: MosaicId){
		self._id = value
	}

	duration(value: BlockDuration){
		self._duration = value
	}

	nonce(value: MosaicNonce){
		self._nonce = value
	}

	flags(value: MosaicFlags){
		self._flags = value
	}

	divisibility(value: int){
		self._divisibility = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signer_public_key.size
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

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiable_entity_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert verifiable_entity_header_reserved_1 == 0, f'Invalid value of reserved field ({verifiable_entity_header_reserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
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
		divisibility = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]

		instance = MosaicDefinitionTransactionV1()
		instance._signature = signature
		instance._signer_public_key = signer_public_key
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

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._verifiable_entity_header_reserved_1)
		buffer += self._signature.serialize()
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._id.serialize()
		buffer += self._duration.serialize()
		buffer += self._nonce.serialize()
		buffer += self._flags.serialize()
		buffer += Converter::intToBytes($self._divisibility)
		return buffer
	}

	__str__(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
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
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'id': 'pod:MosaicId',
		'duration': 'pod:BlockDuration',
		'nonce': 'pod:MosaicNonce',
		'flags': 'enum:MosaicFlags'
	}

	public function __construct(){
		self._signer_public_key = PublicKey()
		self._version = EmbeddedMosaicDefinitionTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = EmbeddedMosaicDefinitionTransactionV1.TRANSACTION_TYPE
		self._id = MosaicId()
		self._duration = BlockDuration()
		self._nonce = MosaicNonce()
		self._flags = MosaicFlags.NONE
		self._divisibility = 0
		self._embedded_transaction_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
	}

	sort(){
		pass
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	id(){
		return self._id
	}

	duration(){
		return self._duration
	}

	nonce(){
		return self._nonce
	}

	flags(){
		return self._flags
	}

	divisibility(){
		return self._divisibility
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	id(value: MosaicId){
		self._id = value
	}

	duration(value: BlockDuration){
		self._duration = value
	}

	nonce(value: MosaicNonce){
		self._nonce = value
	}

	flags(value: MosaicFlags){
		self._flags = value
	}

	divisibility(value: int){
		self._divisibility = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signer_public_key.size
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

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		embedded_transaction_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert embedded_transaction_header_reserved_1 == 0, f'Invalid value of reserved field ({embedded_transaction_header_reserved_1})'
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
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
		divisibility = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]

		instance = EmbeddedMosaicDefinitionTransactionV1()
		instance._signer_public_key = signer_public_key
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

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._embedded_transaction_header_reserved_1)
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._id.serialize()
		buffer += self._duration.serialize()
		buffer += self._nonce.serialize()
		buffer += self._flags.serialize()
		buffer += Converter::intToBytes($self._divisibility)
		return buffer
	}

	__str__(){
		result = '('
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
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
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'mosaic_id': 'pod:UnresolvedMosaicId',
		'delta': 'pod:Amount',
		'action': 'enum:MosaicSupplyChangeAction'
	}

	public function __construct(){
		self._signature = Signature()
		self._signer_public_key = PublicKey()
		self._version = MosaicSupplyChangeTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = MosaicSupplyChangeTransactionV1.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._mosaic_id = UnresolvedMosaicId()
		self._delta = Amount()
		self._action = MosaicSupplyChangeAction.DECREASE
		self._verifiable_entity_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
	}

	sort(){
		pass
	}

	signature(){
		return self._signature
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	fee(){
		return self._fee
	}

	deadline(){
		return self._deadline
	}

	mosaic_id(){
		return self._mosaic_id
	}

	delta(){
		return self._delta
	}

	action(){
		return self._action
	}

	signature(value: Signature){
		self._signature = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	fee(value: Amount){
		self._fee = value
	}

	deadline(value: Timestamp){
		self._deadline = value
	}

	mosaic_id(value: UnresolvedMosaicId){
		self._mosaic_id = value
	}

	delta(value: Amount){
		self._delta = value
	}

	action(value: MosaicSupplyChangeAction){
		self._action = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signer_public_key.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		size += self.mosaic_id.size
		size += self.delta.size
		size += self.action.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiable_entity_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert verifiable_entity_header_reserved_1 == 0, f'Invalid value of reserved field ({verifiable_entity_header_reserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		mosaic_id = UnresolvedMosaicId.deserialize(buffer)
		buffer = buffer[mosaic_id.size:]
		delta = Amount.deserialize(buffer)
		buffer = buffer[delta.size:]
		action = MosaicSupplyChangeAction.deserialize(buffer)
		buffer = buffer[action.size:]

		instance = MosaicSupplyChangeTransactionV1()
		instance._signature = signature
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		instance._mosaic_id = mosaic_id
		instance._delta = delta
		instance._action = action
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._verifiable_entity_header_reserved_1)
		buffer += self._signature.serialize()
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._mosaic_id.serialize()
		buffer += self._delta.serialize()
		buffer += self._action.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'mosaic_id: {self._mosaic_id.__str__()}, '
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
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'mosaic_id': 'pod:UnresolvedMosaicId',
		'delta': 'pod:Amount',
		'action': 'enum:MosaicSupplyChangeAction'
	}

	public function __construct(){
		self._signer_public_key = PublicKey()
		self._version = EmbeddedMosaicSupplyChangeTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = EmbeddedMosaicSupplyChangeTransactionV1.TRANSACTION_TYPE
		self._mosaic_id = UnresolvedMosaicId()
		self._delta = Amount()
		self._action = MosaicSupplyChangeAction.DECREASE
		self._embedded_transaction_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
	}

	sort(){
		pass
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	mosaic_id(){
		return self._mosaic_id
	}

	delta(){
		return self._delta
	}

	action(){
		return self._action
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	mosaic_id(value: UnresolvedMosaicId){
		self._mosaic_id = value
	}

	delta(value: Amount){
		self._delta = value
	}

	action(value: MosaicSupplyChangeAction){
		self._action = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signer_public_key.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.mosaic_id.size
		size += self.delta.size
		size += self.action.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		embedded_transaction_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert embedded_transaction_header_reserved_1 == 0, f'Invalid value of reserved field ({embedded_transaction_header_reserved_1})'
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		mosaic_id = UnresolvedMosaicId.deserialize(buffer)
		buffer = buffer[mosaic_id.size:]
		delta = Amount.deserialize(buffer)
		buffer = buffer[delta.size:]
		action = MosaicSupplyChangeAction.deserialize(buffer)
		buffer = buffer[action.size:]

		instance = EmbeddedMosaicSupplyChangeTransactionV1()
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._mosaic_id = mosaic_id
		instance._delta = delta
		instance._action = action
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._embedded_transaction_header_reserved_1)
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._mosaic_id.serialize()
		buffer += self._delta.serialize()
		buffer += self._action.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'mosaic_id: {self._mosaic_id.__str__()}, '
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
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'source_address': 'pod:UnresolvedAddress',
		'mosaic': 'struct:UnresolvedMosaic'
	}

	public function __construct(){
		self._signature = Signature()
		self._signer_public_key = PublicKey()
		self._version = MosaicSupplyRevocationTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = MosaicSupplyRevocationTransactionV1.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._source_address = UnresolvedAddress()
		self._mosaic = UnresolvedMosaic()
		self._verifiable_entity_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
	}

	sort(){
		self._mosaic.sort()
	}

	signature(){
		return self._signature
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	fee(){
		return self._fee
	}

	deadline(){
		return self._deadline
	}

	source_address(){
		return self._source_address
	}

	mosaic(){
		return self._mosaic
	}

	signature(value: Signature){
		self._signature = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	fee(value: Amount){
		self._fee = value
	}

	deadline(value: Timestamp){
		self._deadline = value
	}

	source_address(value: UnresolvedAddress){
		self._source_address = value
	}

	mosaic(value: UnresolvedMosaic){
		self._mosaic = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signer_public_key.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		size += self.source_address.size
		size += self.mosaic.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiable_entity_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert verifiable_entity_header_reserved_1 == 0, f'Invalid value of reserved field ({verifiable_entity_header_reserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		source_address = UnresolvedAddress.deserialize(buffer)
		buffer = buffer[source_address.size:]
		mosaic = UnresolvedMosaic.deserialize(buffer)
		buffer = buffer[mosaic.size:]

		instance = MosaicSupplyRevocationTransactionV1()
		instance._signature = signature
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		instance._source_address = source_address
		instance._mosaic = mosaic
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._verifiable_entity_header_reserved_1)
		buffer += self._signature.serialize()
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._source_address.serialize()
		buffer += self._mosaic.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'source_address: {self._source_address.__str__()}, '
		result += f'mosaic: {self._mosaic.__str__()}, '
		result += ')'
		return result
	}
}


class EmbeddedMosaicSupplyRevocationTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.MOSAIC_SUPPLY_REVOCATION
	TYPE_HINTS = {
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'source_address': 'pod:UnresolvedAddress',
		'mosaic': 'struct:UnresolvedMosaic'
	}

	public function __construct(){
		self._signer_public_key = PublicKey()
		self._version = EmbeddedMosaicSupplyRevocationTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = EmbeddedMosaicSupplyRevocationTransactionV1.TRANSACTION_TYPE
		self._source_address = UnresolvedAddress()
		self._mosaic = UnresolvedMosaic()
		self._embedded_transaction_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
	}

	sort(){
		self._mosaic.sort()
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	source_address(){
		return self._source_address
	}

	mosaic(){
		return self._mosaic
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	source_address(value: UnresolvedAddress){
		self._source_address = value
	}

	mosaic(value: UnresolvedMosaic){
		self._mosaic = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signer_public_key.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.source_address.size
		size += self.mosaic.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		embedded_transaction_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert embedded_transaction_header_reserved_1 == 0, f'Invalid value of reserved field ({embedded_transaction_header_reserved_1})'
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		source_address = UnresolvedAddress.deserialize(buffer)
		buffer = buffer[source_address.size:]
		mosaic = UnresolvedMosaic.deserialize(buffer)
		buffer = buffer[mosaic.size:]

		instance = EmbeddedMosaicSupplyRevocationTransactionV1()
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._source_address = source_address
		instance._mosaic = mosaic
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._embedded_transaction_header_reserved_1)
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._source_address.serialize()
		buffer += self._mosaic.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'source_address: {self._source_address.__str__()}, '
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
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'address_additions': 'array[UnresolvedAddress]',
		'address_deletions': 'array[UnresolvedAddress]'
	}

	public function __construct(){
		self._signature = Signature()
		self._signer_public_key = PublicKey()
		self._version = MultisigAccountModificationTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = MultisigAccountModificationTransactionV1.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._min_removal_delta = 0
		self._min_approval_delta = 0
		self._address_additions = []
		self._address_deletions = []
		self._verifiable_entity_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
		self._multisig_account_modification_transaction_body_reserved_1 = 0  # reserved field
	}

	sort(){
		pass
	}

	signature(){
		return self._signature
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	fee(){
		return self._fee
	}

	deadline(){
		return self._deadline
	}

	min_removal_delta(){
		return self._min_removal_delta
	}

	min_approval_delta(){
		return self._min_approval_delta
	}

	address_additions(){
		return self._address_additions
	}

	address_deletions(){
		return self._address_deletions
	}

	signature(value: Signature){
		self._signature = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	fee(value: Amount){
		self._fee = value
	}

	deadline(value: Timestamp){
		self._deadline = value
	}

	min_removal_delta(value: int){
		self._min_removal_delta = value
	}

	min_approval_delta(value: int){
		self._min_approval_delta = value
	}

	address_additions(value: List[UnresolvedAddress]){
		self._address_additions = value
	}

	address_deletions(value: List[UnresolvedAddress]){
		self._address_deletions = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signer_public_key.size
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
		size += ArrayHelpers.size(self.address_additions)
		size += ArrayHelpers.size(self.address_deletions)
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiable_entity_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert verifiable_entity_header_reserved_1 == 0, f'Invalid value of reserved field ({verifiable_entity_header_reserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		min_removal_delta = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		min_approval_delta = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		address_additions_count = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		address_deletions_count = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		multisig_account_modification_transaction_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert multisig_account_modification_transaction_body_reserved_1 == 0, f'Invalid value of reserved field ({multisig_account_modification_transaction_body_reserved_1})'
		address_additions = ArrayHelpers.read_array_count(buffer, UnresolvedAddress, address_additions_count)
		buffer = buffer[ArrayHelpers.size(address_additions):]
		address_deletions = ArrayHelpers.read_array_count(buffer, UnresolvedAddress, address_deletions_count)
		buffer = buffer[ArrayHelpers.size(address_deletions):]

		instance = MultisigAccountModificationTransactionV1()
		instance._signature = signature
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		instance._min_removal_delta = min_removal_delta
		instance._min_approval_delta = min_approval_delta
		instance._address_additions = address_additions
		instance._address_deletions = address_deletions
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._verifiable_entity_header_reserved_1)
		buffer += self._signature.serialize()
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += Converter::intToBytes($self._min_removal_delta)
		buffer += Converter::intToBytes($self._min_approval_delta)
		buffer += Converter::intToBytes($len(self._address_additions))  # address_additions_count
		buffer += Converter::intToBytes($len(self._address_deletions))  # address_deletions_count
		buffer += Converter::intToBytes($self._multisig_account_modification_transaction_body_reserved_1)
		buffer += ArrayHelpers.write_array(self._address_additions)
		buffer += ArrayHelpers.write_array(self._address_deletions)
		return buffer
	}

	__str__(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'min_removal_delta: 0x{self._min_removal_delta:X}, '
		result += f'min_approval_delta: 0x{self._min_approval_delta:X}, '
		result += f'address_additions: {list(map(str, self._address_additions))}, '
		result += f'address_deletions: {list(map(str, self._address_deletions))}, '
		result += ')'
		return result
	}
}


class EmbeddedMultisigAccountModificationTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.MULTISIG_ACCOUNT_MODIFICATION
	TYPE_HINTS = {
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'address_additions': 'array[UnresolvedAddress]',
		'address_deletions': 'array[UnresolvedAddress]'
	}

	public function __construct(){
		self._signer_public_key = PublicKey()
		self._version = EmbeddedMultisigAccountModificationTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = EmbeddedMultisigAccountModificationTransactionV1.TRANSACTION_TYPE
		self._min_removal_delta = 0
		self._min_approval_delta = 0
		self._address_additions = []
		self._address_deletions = []
		self._embedded_transaction_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
		self._multisig_account_modification_transaction_body_reserved_1 = 0  # reserved field
	}

	sort(){
		pass
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	min_removal_delta(){
		return self._min_removal_delta
	}

	min_approval_delta(){
		return self._min_approval_delta
	}

	address_additions(){
		return self._address_additions
	}

	address_deletions(){
		return self._address_deletions
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	min_removal_delta(value: int){
		self._min_removal_delta = value
	}

	min_approval_delta(value: int){
		self._min_approval_delta = value
	}

	address_additions(value: List[UnresolvedAddress]){
		self._address_additions = value
	}

	address_deletions(value: List[UnresolvedAddress]){
		self._address_deletions = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signer_public_key.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += 1
		size += 1
		size += 1
		size += 1
		size += 4
		size += ArrayHelpers.size(self.address_additions)
		size += ArrayHelpers.size(self.address_deletions)
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		embedded_transaction_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert embedded_transaction_header_reserved_1 == 0, f'Invalid value of reserved field ({embedded_transaction_header_reserved_1})'
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		min_removal_delta = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		min_approval_delta = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		address_additions_count = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		address_deletions_count = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		multisig_account_modification_transaction_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert multisig_account_modification_transaction_body_reserved_1 == 0, f'Invalid value of reserved field ({multisig_account_modification_transaction_body_reserved_1})'
		address_additions = ArrayHelpers.read_array_count(buffer, UnresolvedAddress, address_additions_count)
		buffer = buffer[ArrayHelpers.size(address_additions):]
		address_deletions = ArrayHelpers.read_array_count(buffer, UnresolvedAddress, address_deletions_count)
		buffer = buffer[ArrayHelpers.size(address_deletions):]

		instance = EmbeddedMultisigAccountModificationTransactionV1()
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._min_removal_delta = min_removal_delta
		instance._min_approval_delta = min_approval_delta
		instance._address_additions = address_additions
		instance._address_deletions = address_deletions
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._embedded_transaction_header_reserved_1)
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += Converter::intToBytes($self._min_removal_delta)
		buffer += Converter::intToBytes($self._min_approval_delta)
		buffer += Converter::intToBytes($len(self._address_additions))  # address_additions_count
		buffer += Converter::intToBytes($len(self._address_deletions))  # address_deletions_count
		buffer += Converter::intToBytes($self._multisig_account_modification_transaction_body_reserved_1)
		buffer += ArrayHelpers.write_array(self._address_additions)
		buffer += ArrayHelpers.write_array(self._address_deletions)
		return buffer
	}

	__str__(){
		result = '('
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'min_removal_delta: 0x{self._min_removal_delta:X}, '
		result += f'min_approval_delta: 0x{self._min_approval_delta:X}, '
		result += f'address_additions: {list(map(str, self._address_additions))}, '
		result += f'address_deletions: {list(map(str, self._address_deletions))}, '
		result += ')'
		return result
	}
}


class AddressAliasTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.ADDRESS_ALIAS
	TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'namespace_id': 'pod:NamespaceId',
		'address': 'pod:Address',
		'alias_action': 'enum:AliasAction'
	}

	public function __construct(){
		self._signature = Signature()
		self._signer_public_key = PublicKey()
		self._version = AddressAliasTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = AddressAliasTransactionV1.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._namespace_id = NamespaceId()
		self._address = Address()
		self._alias_action = AliasAction.UNLINK
		self._verifiable_entity_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
	}

	sort(){
		pass
	}

	signature(){
		return self._signature
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	fee(){
		return self._fee
	}

	deadline(){
		return self._deadline
	}

	namespace_id(){
		return self._namespace_id
	}

	address(){
		return self._address
	}

	alias_action(){
		return self._alias_action
	}

	signature(value: Signature){
		self._signature = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	fee(value: Amount){
		self._fee = value
	}

	deadline(value: Timestamp){
		self._deadline = value
	}

	namespace_id(value: NamespaceId){
		self._namespace_id = value
	}

	address(value: Address){
		self._address = value
	}

	alias_action(value: AliasAction){
		self._alias_action = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signer_public_key.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		size += self.namespace_id.size
		size += self.address.size
		size += self.alias_action.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiable_entity_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert verifiable_entity_header_reserved_1 == 0, f'Invalid value of reserved field ({verifiable_entity_header_reserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		namespace_id = NamespaceId.deserialize(buffer)
		buffer = buffer[namespace_id.size:]
		address = Address.deserialize(buffer)
		buffer = buffer[address.size:]
		alias_action = AliasAction.deserialize(buffer)
		buffer = buffer[alias_action.size:]

		instance = AddressAliasTransactionV1()
		instance._signature = signature
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		instance._namespace_id = namespace_id
		instance._address = address
		instance._alias_action = alias_action
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._verifiable_entity_header_reserved_1)
		buffer += self._signature.serialize()
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._namespace_id.serialize()
		buffer += self._address.serialize()
		buffer += self._alias_action.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'namespace_id: {self._namespace_id.__str__()}, '
		result += f'address: {self._address.__str__()}, '
		result += f'alias_action: {self._alias_action.__str__()}, '
		result += ')'
		return result
	}
}


class EmbeddedAddressAliasTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.ADDRESS_ALIAS
	TYPE_HINTS = {
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'namespace_id': 'pod:NamespaceId',
		'address': 'pod:Address',
		'alias_action': 'enum:AliasAction'
	}

	public function __construct(){
		self._signer_public_key = PublicKey()
		self._version = EmbeddedAddressAliasTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = EmbeddedAddressAliasTransactionV1.TRANSACTION_TYPE
		self._namespace_id = NamespaceId()
		self._address = Address()
		self._alias_action = AliasAction.UNLINK
		self._embedded_transaction_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
	}

	sort(){
		pass
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	namespace_id(){
		return self._namespace_id
	}

	address(){
		return self._address
	}

	alias_action(){
		return self._alias_action
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	namespace_id(value: NamespaceId){
		self._namespace_id = value
	}

	address(value: Address){
		self._address = value
	}

	alias_action(value: AliasAction){
		self._alias_action = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signer_public_key.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.namespace_id.size
		size += self.address.size
		size += self.alias_action.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		embedded_transaction_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert embedded_transaction_header_reserved_1 == 0, f'Invalid value of reserved field ({embedded_transaction_header_reserved_1})'
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		namespace_id = NamespaceId.deserialize(buffer)
		buffer = buffer[namespace_id.size:]
		address = Address.deserialize(buffer)
		buffer = buffer[address.size:]
		alias_action = AliasAction.deserialize(buffer)
		buffer = buffer[alias_action.size:]

		instance = EmbeddedAddressAliasTransactionV1()
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._namespace_id = namespace_id
		instance._address = address
		instance._alias_action = alias_action
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._embedded_transaction_header_reserved_1)
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._namespace_id.serialize()
		buffer += self._address.serialize()
		buffer += self._alias_action.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'namespace_id: {self._namespace_id.__str__()}, '
		result += f'address: {self._address.__str__()}, '
		result += f'alias_action: {self._alias_action.__str__()}, '
		result += ')'
		return result
	}
}


class MosaicAliasTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.MOSAIC_ALIAS
	TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'namespace_id': 'pod:NamespaceId',
		'mosaic_id': 'pod:MosaicId',
		'alias_action': 'enum:AliasAction'
	}

	public function __construct(){
		self._signature = Signature()
		self._signer_public_key = PublicKey()
		self._version = MosaicAliasTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = MosaicAliasTransactionV1.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._namespace_id = NamespaceId()
		self._mosaic_id = MosaicId()
		self._alias_action = AliasAction.UNLINK
		self._verifiable_entity_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
	}

	sort(){
		pass
	}

	signature(){
		return self._signature
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	fee(){
		return self._fee
	}

	deadline(){
		return self._deadline
	}

	namespace_id(){
		return self._namespace_id
	}

	mosaic_id(){
		return self._mosaic_id
	}

	alias_action(){
		return self._alias_action
	}

	signature(value: Signature){
		self._signature = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	fee(value: Amount){
		self._fee = value
	}

	deadline(value: Timestamp){
		self._deadline = value
	}

	namespace_id(value: NamespaceId){
		self._namespace_id = value
	}

	mosaic_id(value: MosaicId){
		self._mosaic_id = value
	}

	alias_action(value: AliasAction){
		self._alias_action = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signer_public_key.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		size += self.namespace_id.size
		size += self.mosaic_id.size
		size += self.alias_action.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiable_entity_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert verifiable_entity_header_reserved_1 == 0, f'Invalid value of reserved field ({verifiable_entity_header_reserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		namespace_id = NamespaceId.deserialize(buffer)
		buffer = buffer[namespace_id.size:]
		mosaic_id = MosaicId.deserialize(buffer)
		buffer = buffer[mosaic_id.size:]
		alias_action = AliasAction.deserialize(buffer)
		buffer = buffer[alias_action.size:]

		instance = MosaicAliasTransactionV1()
		instance._signature = signature
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		instance._namespace_id = namespace_id
		instance._mosaic_id = mosaic_id
		instance._alias_action = alias_action
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._verifiable_entity_header_reserved_1)
		buffer += self._signature.serialize()
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._namespace_id.serialize()
		buffer += self._mosaic_id.serialize()
		buffer += self._alias_action.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'namespace_id: {self._namespace_id.__str__()}, '
		result += f'mosaic_id: {self._mosaic_id.__str__()}, '
		result += f'alias_action: {self._alias_action.__str__()}, '
		result += ')'
		return result
	}
}


class EmbeddedMosaicAliasTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.MOSAIC_ALIAS
	TYPE_HINTS = {
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'namespace_id': 'pod:NamespaceId',
		'mosaic_id': 'pod:MosaicId',
		'alias_action': 'enum:AliasAction'
	}

	public function __construct(){
		self._signer_public_key = PublicKey()
		self._version = EmbeddedMosaicAliasTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = EmbeddedMosaicAliasTransactionV1.TRANSACTION_TYPE
		self._namespace_id = NamespaceId()
		self._mosaic_id = MosaicId()
		self._alias_action = AliasAction.UNLINK
		self._embedded_transaction_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
	}

	sort(){
		pass
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	namespace_id(){
		return self._namespace_id
	}

	mosaic_id(){
		return self._mosaic_id
	}

	alias_action(){
		return self._alias_action
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	namespace_id(value: NamespaceId){
		self._namespace_id = value
	}

	mosaic_id(value: MosaicId){
		self._mosaic_id = value
	}

	alias_action(value: AliasAction){
		self._alias_action = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signer_public_key.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.namespace_id.size
		size += self.mosaic_id.size
		size += self.alias_action.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		embedded_transaction_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert embedded_transaction_header_reserved_1 == 0, f'Invalid value of reserved field ({embedded_transaction_header_reserved_1})'
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		namespace_id = NamespaceId.deserialize(buffer)
		buffer = buffer[namespace_id.size:]
		mosaic_id = MosaicId.deserialize(buffer)
		buffer = buffer[mosaic_id.size:]
		alias_action = AliasAction.deserialize(buffer)
		buffer = buffer[alias_action.size:]

		instance = EmbeddedMosaicAliasTransactionV1()
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._namespace_id = namespace_id
		instance._mosaic_id = mosaic_id
		instance._alias_action = alias_action
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._embedded_transaction_header_reserved_1)
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._namespace_id.serialize()
		buffer += self._mosaic_id.serialize()
		buffer += self._alias_action.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'namespace_id: {self._namespace_id.__str__()}, '
		result += f'mosaic_id: {self._mosaic_id.__str__()}, '
		result += f'alias_action: {self._alias_action.__str__()}, '
		result += ')'
		return result
	}
}


class NamespaceRegistrationTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.NAMESPACE_REGISTRATION
	TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'duration': 'pod:BlockDuration',
		'parent_id': 'pod:NamespaceId',
		'id': 'pod:NamespaceId',
		'registration_type': 'enum:NamespaceRegistrationType',
		'name': 'bytes_array'
	}

	public function __construct(){
		self._signature = Signature()
		self._signer_public_key = PublicKey()
		self._version = NamespaceRegistrationTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = NamespaceRegistrationTransactionV1.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._duration = BlockDuration()
		self._parent_id = None
		self._id = NamespaceId()
		self._registration_type = NamespaceRegistrationType.ROOT
		self._name = bytes()
		self._verifiable_entity_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
	}

	sort(){
		pass
	}

	signature(){
		return self._signature
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	fee(){
		return self._fee
	}

	deadline(){
		return self._deadline
	}

	duration(){
		return self._duration
	}

	parent_id(){
		return self._parent_id
	}

	id(){
		return self._id
	}

	registration_type(){
		return self._registration_type
	}

	name(){
		return self._name
	}

	signature(value: Signature){
		self._signature = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	fee(value: Amount){
		self._fee = value
	}

	deadline(value: Timestamp){
		self._deadline = value
	}

	duration(value: BlockDuration){
		self._duration = value
	}

	parent_id(value: NamespaceId){
		self._parent_id = value
	}

	id(value: NamespaceId){
		self._id = value
	}

	registration_type(value: NamespaceRegistrationType){
		self._registration_type = value
	}

	name(value: bytes){
		self._name = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signer_public_key.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		if NamespaceRegistrationType.ROOT == self.registration_type:
			size += self.duration.size
		if NamespaceRegistrationType.CHILD == self.registration_type:
			size += self.parent_id.size
		size += self.id.size
		size += self.registration_type.size
		size += 1
		size += len(self._name)
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiable_entity_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert verifiable_entity_header_reserved_1 == 0, f'Invalid value of reserved field ({verifiable_entity_header_reserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
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
		registration_type = NamespaceRegistrationType.deserialize(buffer)
		buffer = buffer[registration_type.size:]
		duration = None
		if NamespaceRegistrationType.ROOT == registration_type:
			duration = BlockDuration.deserialize(registration_type_condition)
			registration_type_condition = registration_type_condition[duration.size:]
		parent_id = None
		if NamespaceRegistrationType.CHILD == registration_type:
			parent_id = NamespaceId.deserialize(registration_type_condition)
			registration_type_condition = registration_type_condition[parent_id.size:]
		name_size = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		name = ArrayHelpers.get_bytes(buffer, name_size)
		buffer = buffer[name_size:]

		instance = NamespaceRegistrationTransactionV1()
		instance._signature = signature
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		instance._duration = duration
		instance._parent_id = parent_id
		instance._id = id
		instance._registration_type = registration_type
		instance._name = name
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._verifiable_entity_header_reserved_1)
		buffer += self._signature.serialize()
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		if NamespaceRegistrationType.ROOT == self.registration_type:
			buffer += self._duration.serialize()
		if NamespaceRegistrationType.CHILD == self.registration_type:
			buffer += self._parent_id.serialize()
		buffer += self._id.serialize()
		buffer += self._registration_type.serialize()
		buffer += Converter::intToBytes($len(self._name))  # name_size
		buffer += self._name
		return buffer
	}

	__str__(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		if NamespaceRegistrationType.ROOT == self.registration_type:
			result += f'duration: {self._duration.__str__()}, '
		if NamespaceRegistrationType.CHILD == self.registration_type:
			result += f'parent_id: {self._parent_id.__str__()}, '
		result += f'id: {self._id.__str__()}, '
		result += f'registration_type: {self._registration_type.__str__()}, '
		result += f'name: {hexlify(self._name).decode("utf8")}, '
		result += ')'
		return result
	}
}


class EmbeddedNamespaceRegistrationTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.NAMESPACE_REGISTRATION
	TYPE_HINTS = {
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'duration': 'pod:BlockDuration',
		'parent_id': 'pod:NamespaceId',
		'id': 'pod:NamespaceId',
		'registration_type': 'enum:NamespaceRegistrationType',
		'name': 'bytes_array'
	}

	public function __construct(){
		self._signer_public_key = PublicKey()
		self._version = EmbeddedNamespaceRegistrationTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = EmbeddedNamespaceRegistrationTransactionV1.TRANSACTION_TYPE
		self._duration = BlockDuration()
		self._parent_id = None
		self._id = NamespaceId()
		self._registration_type = NamespaceRegistrationType.ROOT
		self._name = bytes()
		self._embedded_transaction_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
	}

	sort(){
		pass
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	duration(){
		return self._duration
	}

	parent_id(){
		return self._parent_id
	}

	id(){
		return self._id
	}

	registration_type(){
		return self._registration_type
	}

	name(){
		return self._name
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	duration(value: BlockDuration){
		self._duration = value
	}

	parent_id(value: NamespaceId){
		self._parent_id = value
	}

	id(value: NamespaceId){
		self._id = value
	}

	registration_type(value: NamespaceRegistrationType){
		self._registration_type = value
	}

	name(value: bytes){
		self._name = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signer_public_key.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		if NamespaceRegistrationType.ROOT == self.registration_type:
			size += self.duration.size
		if NamespaceRegistrationType.CHILD == self.registration_type:
			size += self.parent_id.size
		size += self.id.size
		size += self.registration_type.size
		size += 1
		size += len(self._name)
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		embedded_transaction_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert embedded_transaction_header_reserved_1 == 0, f'Invalid value of reserved field ({embedded_transaction_header_reserved_1})'
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
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
		registration_type = NamespaceRegistrationType.deserialize(buffer)
		buffer = buffer[registration_type.size:]
		duration = None
		if NamespaceRegistrationType.ROOT == registration_type:
			duration = BlockDuration.deserialize(registration_type_condition)
			registration_type_condition = registration_type_condition[duration.size:]
		parent_id = None
		if NamespaceRegistrationType.CHILD == registration_type:
			parent_id = NamespaceId.deserialize(registration_type_condition)
			registration_type_condition = registration_type_condition[parent_id.size:]
		name_size = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		name = ArrayHelpers.get_bytes(buffer, name_size)
		buffer = buffer[name_size:]

		instance = EmbeddedNamespaceRegistrationTransactionV1()
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._duration = duration
		instance._parent_id = parent_id
		instance._id = id
		instance._registration_type = registration_type
		instance._name = name
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._embedded_transaction_header_reserved_1)
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		if NamespaceRegistrationType.ROOT == self.registration_type:
			buffer += self._duration.serialize()
		if NamespaceRegistrationType.CHILD == self.registration_type:
			buffer += self._parent_id.serialize()
		buffer += self._id.serialize()
		buffer += self._registration_type.serialize()
		buffer += Converter::intToBytes($len(self._name))  # name_size
		buffer += self._name
		return buffer
	}

	__str__(){
		result = '('
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		if NamespaceRegistrationType.ROOT == self.registration_type:
			result += f'duration: {self._duration.__str__()}, '
		if NamespaceRegistrationType.CHILD == self.registration_type:
			result += f'parent_id: {self._parent_id.__str__()}, '
		result += f'id: {self._id.__str__()}, '
		result += f'registration_type: {self._registration_type.__str__()}, '
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

	size(){
		return 2
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		return AccountRestrictionFlags(Converter::bytesToInt(byteArray))
	}

	public function serialize(){
		buffer = bytes()
		buffer += Converter::intToBytes($self.value)
		return buffer
	}
}


class AccountAddressRestrictionTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.ACCOUNT_ADDRESS_RESTRICTION
	TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'restriction_flags': 'enum:AccountRestrictionFlags',
		'restriction_additions': 'array[UnresolvedAddress]',
		'restriction_deletions': 'array[UnresolvedAddress]'
	}

	public function __construct(){
		self._signature = Signature()
		self._signer_public_key = PublicKey()
		self._version = AccountAddressRestrictionTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = AccountAddressRestrictionTransactionV1.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._restriction_flags = AccountRestrictionFlags.ADDRESS
		self._restriction_additions = []
		self._restriction_deletions = []
		self._verifiable_entity_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
		self._account_restriction_transaction_body_reserved_1 = 0  # reserved field
	}

	sort(){
		pass
	}

	signature(){
		return self._signature
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	fee(){
		return self._fee
	}

	deadline(){
		return self._deadline
	}

	restriction_flags(){
		return self._restriction_flags
	}

	restriction_additions(){
		return self._restriction_additions
	}

	restriction_deletions(){
		return self._restriction_deletions
	}

	signature(value: Signature){
		self._signature = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	fee(value: Amount){
		self._fee = value
	}

	deadline(value: Timestamp){
		self._deadline = value
	}

	restriction_flags(value: AccountRestrictionFlags){
		self._restriction_flags = value
	}

	restriction_additions(value: List[UnresolvedAddress]){
		self._restriction_additions = value
	}

	restriction_deletions(value: List[UnresolvedAddress]){
		self._restriction_deletions = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signer_public_key.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		size += self.restriction_flags.size
		size += 1
		size += 1
		size += 4
		size += ArrayHelpers.size(self.restriction_additions)
		size += ArrayHelpers.size(self.restriction_deletions)
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiable_entity_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert verifiable_entity_header_reserved_1 == 0, f'Invalid value of reserved field ({verifiable_entity_header_reserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		restriction_flags = AccountRestrictionFlags.deserialize(buffer)
		buffer = buffer[restriction_flags.size:]
		restriction_additions_count = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		restriction_deletions_count = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		account_restriction_transaction_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert account_restriction_transaction_body_reserved_1 == 0, f'Invalid value of reserved field ({account_restriction_transaction_body_reserved_1})'
		restriction_additions = ArrayHelpers.read_array_count(buffer, UnresolvedAddress, restriction_additions_count)
		buffer = buffer[ArrayHelpers.size(restriction_additions):]
		restriction_deletions = ArrayHelpers.read_array_count(buffer, UnresolvedAddress, restriction_deletions_count)
		buffer = buffer[ArrayHelpers.size(restriction_deletions):]

		instance = AccountAddressRestrictionTransactionV1()
		instance._signature = signature
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		instance._restriction_flags = restriction_flags
		instance._restriction_additions = restriction_additions
		instance._restriction_deletions = restriction_deletions
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._verifiable_entity_header_reserved_1)
		buffer += self._signature.serialize()
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._restriction_flags.serialize()
		buffer += Converter::intToBytes($len(self._restriction_additions))  # restriction_additions_count
		buffer += Converter::intToBytes($len(self._restriction_deletions))  # restriction_deletions_count
		buffer += Converter::intToBytes($self._account_restriction_transaction_body_reserved_1)
		buffer += ArrayHelpers.write_array(self._restriction_additions)
		buffer += ArrayHelpers.write_array(self._restriction_deletions)
		return buffer
	}

	__str__(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'restriction_flags: {self._restriction_flags.__str__()}, '
		result += f'restriction_additions: {list(map(str, self._restriction_additions))}, '
		result += f'restriction_deletions: {list(map(str, self._restriction_deletions))}, '
		result += ')'
		return result
	}
}


class EmbeddedAccountAddressRestrictionTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.ACCOUNT_ADDRESS_RESTRICTION
	TYPE_HINTS = {
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'restriction_flags': 'enum:AccountRestrictionFlags',
		'restriction_additions': 'array[UnresolvedAddress]',
		'restriction_deletions': 'array[UnresolvedAddress]'
	}

	public function __construct(){
		self._signer_public_key = PublicKey()
		self._version = EmbeddedAccountAddressRestrictionTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = EmbeddedAccountAddressRestrictionTransactionV1.TRANSACTION_TYPE
		self._restriction_flags = AccountRestrictionFlags.ADDRESS
		self._restriction_additions = []
		self._restriction_deletions = []
		self._embedded_transaction_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
		self._account_restriction_transaction_body_reserved_1 = 0  # reserved field
	}

	sort(){
		pass
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	restriction_flags(){
		return self._restriction_flags
	}

	restriction_additions(){
		return self._restriction_additions
	}

	restriction_deletions(){
		return self._restriction_deletions
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	restriction_flags(value: AccountRestrictionFlags){
		self._restriction_flags = value
	}

	restriction_additions(value: List[UnresolvedAddress]){
		self._restriction_additions = value
	}

	restriction_deletions(value: List[UnresolvedAddress]){
		self._restriction_deletions = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signer_public_key.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.restriction_flags.size
		size += 1
		size += 1
		size += 4
		size += ArrayHelpers.size(self.restriction_additions)
		size += ArrayHelpers.size(self.restriction_deletions)
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		embedded_transaction_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert embedded_transaction_header_reserved_1 == 0, f'Invalid value of reserved field ({embedded_transaction_header_reserved_1})'
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		restriction_flags = AccountRestrictionFlags.deserialize(buffer)
		buffer = buffer[restriction_flags.size:]
		restriction_additions_count = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		restriction_deletions_count = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		account_restriction_transaction_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert account_restriction_transaction_body_reserved_1 == 0, f'Invalid value of reserved field ({account_restriction_transaction_body_reserved_1})'
		restriction_additions = ArrayHelpers.read_array_count(buffer, UnresolvedAddress, restriction_additions_count)
		buffer = buffer[ArrayHelpers.size(restriction_additions):]
		restriction_deletions = ArrayHelpers.read_array_count(buffer, UnresolvedAddress, restriction_deletions_count)
		buffer = buffer[ArrayHelpers.size(restriction_deletions):]

		instance = EmbeddedAccountAddressRestrictionTransactionV1()
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._restriction_flags = restriction_flags
		instance._restriction_additions = restriction_additions
		instance._restriction_deletions = restriction_deletions
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._embedded_transaction_header_reserved_1)
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._restriction_flags.serialize()
		buffer += Converter::intToBytes($len(self._restriction_additions))  # restriction_additions_count
		buffer += Converter::intToBytes($len(self._restriction_deletions))  # restriction_deletions_count
		buffer += Converter::intToBytes($self._account_restriction_transaction_body_reserved_1)
		buffer += ArrayHelpers.write_array(self._restriction_additions)
		buffer += ArrayHelpers.write_array(self._restriction_deletions)
		return buffer
	}

	__str__(){
		result = '('
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'restriction_flags: {self._restriction_flags.__str__()}, '
		result += f'restriction_additions: {list(map(str, self._restriction_additions))}, '
		result += f'restriction_deletions: {list(map(str, self._restriction_deletions))}, '
		result += ')'
		return result
	}
}


class AccountMosaicRestrictionTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.ACCOUNT_MOSAIC_RESTRICTION
	TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'restriction_flags': 'enum:AccountRestrictionFlags',
		'restriction_additions': 'array[UnresolvedMosaicId]',
		'restriction_deletions': 'array[UnresolvedMosaicId]'
	}

	public function __construct(){
		self._signature = Signature()
		self._signer_public_key = PublicKey()
		self._version = AccountMosaicRestrictionTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = AccountMosaicRestrictionTransactionV1.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._restriction_flags = AccountRestrictionFlags.ADDRESS
		self._restriction_additions = []
		self._restriction_deletions = []
		self._verifiable_entity_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
		self._account_restriction_transaction_body_reserved_1 = 0  # reserved field
	}

	sort(){
		pass
	}

	signature(){
		return self._signature
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	fee(){
		return self._fee
	}

	deadline(){
		return self._deadline
	}

	restriction_flags(){
		return self._restriction_flags
	}

	restriction_additions(){
		return self._restriction_additions
	}

	restriction_deletions(){
		return self._restriction_deletions
	}

	signature(value: Signature){
		self._signature = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	fee(value: Amount){
		self._fee = value
	}

	deadline(value: Timestamp){
		self._deadline = value
	}

	restriction_flags(value: AccountRestrictionFlags){
		self._restriction_flags = value
	}

	restriction_additions(value: List[UnresolvedMosaicId]){
		self._restriction_additions = value
	}

	restriction_deletions(value: List[UnresolvedMosaicId]){
		self._restriction_deletions = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signer_public_key.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		size += self.restriction_flags.size
		size += 1
		size += 1
		size += 4
		size += ArrayHelpers.size(self.restriction_additions)
		size += ArrayHelpers.size(self.restriction_deletions)
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiable_entity_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert verifiable_entity_header_reserved_1 == 0, f'Invalid value of reserved field ({verifiable_entity_header_reserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		restriction_flags = AccountRestrictionFlags.deserialize(buffer)
		buffer = buffer[restriction_flags.size:]
		restriction_additions_count = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		restriction_deletions_count = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		account_restriction_transaction_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert account_restriction_transaction_body_reserved_1 == 0, f'Invalid value of reserved field ({account_restriction_transaction_body_reserved_1})'
		restriction_additions = ArrayHelpers.read_array_count(buffer, UnresolvedMosaicId, restriction_additions_count)
		buffer = buffer[ArrayHelpers.size(restriction_additions):]
		restriction_deletions = ArrayHelpers.read_array_count(buffer, UnresolvedMosaicId, restriction_deletions_count)
		buffer = buffer[ArrayHelpers.size(restriction_deletions):]

		instance = AccountMosaicRestrictionTransactionV1()
		instance._signature = signature
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		instance._restriction_flags = restriction_flags
		instance._restriction_additions = restriction_additions
		instance._restriction_deletions = restriction_deletions
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._verifiable_entity_header_reserved_1)
		buffer += self._signature.serialize()
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._restriction_flags.serialize()
		buffer += Converter::intToBytes($len(self._restriction_additions))  # restriction_additions_count
		buffer += Converter::intToBytes($len(self._restriction_deletions))  # restriction_deletions_count
		buffer += Converter::intToBytes($self._account_restriction_transaction_body_reserved_1)
		buffer += ArrayHelpers.write_array(self._restriction_additions)
		buffer += ArrayHelpers.write_array(self._restriction_deletions)
		return buffer
	}

	__str__(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'restriction_flags: {self._restriction_flags.__str__()}, '
		result += f'restriction_additions: {list(map(str, self._restriction_additions))}, '
		result += f'restriction_deletions: {list(map(str, self._restriction_deletions))}, '
		result += ')'
		return result
	}
}


class EmbeddedAccountMosaicRestrictionTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.ACCOUNT_MOSAIC_RESTRICTION
	TYPE_HINTS = {
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'restriction_flags': 'enum:AccountRestrictionFlags',
		'restriction_additions': 'array[UnresolvedMosaicId]',
		'restriction_deletions': 'array[UnresolvedMosaicId]'
	}

	public function __construct(){
		self._signer_public_key = PublicKey()
		self._version = EmbeddedAccountMosaicRestrictionTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = EmbeddedAccountMosaicRestrictionTransactionV1.TRANSACTION_TYPE
		self._restriction_flags = AccountRestrictionFlags.ADDRESS
		self._restriction_additions = []
		self._restriction_deletions = []
		self._embedded_transaction_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
		self._account_restriction_transaction_body_reserved_1 = 0  # reserved field
	}

	sort(){
		pass
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	restriction_flags(){
		return self._restriction_flags
	}

	restriction_additions(){
		return self._restriction_additions
	}

	restriction_deletions(){
		return self._restriction_deletions
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	restriction_flags(value: AccountRestrictionFlags){
		self._restriction_flags = value
	}

	restriction_additions(value: List[UnresolvedMosaicId]){
		self._restriction_additions = value
	}

	restriction_deletions(value: List[UnresolvedMosaicId]){
		self._restriction_deletions = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signer_public_key.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.restriction_flags.size
		size += 1
		size += 1
		size += 4
		size += ArrayHelpers.size(self.restriction_additions)
		size += ArrayHelpers.size(self.restriction_deletions)
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		embedded_transaction_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert embedded_transaction_header_reserved_1 == 0, f'Invalid value of reserved field ({embedded_transaction_header_reserved_1})'
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		restriction_flags = AccountRestrictionFlags.deserialize(buffer)
		buffer = buffer[restriction_flags.size:]
		restriction_additions_count = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		restriction_deletions_count = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		account_restriction_transaction_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert account_restriction_transaction_body_reserved_1 == 0, f'Invalid value of reserved field ({account_restriction_transaction_body_reserved_1})'
		restriction_additions = ArrayHelpers.read_array_count(buffer, UnresolvedMosaicId, restriction_additions_count)
		buffer = buffer[ArrayHelpers.size(restriction_additions):]
		restriction_deletions = ArrayHelpers.read_array_count(buffer, UnresolvedMosaicId, restriction_deletions_count)
		buffer = buffer[ArrayHelpers.size(restriction_deletions):]

		instance = EmbeddedAccountMosaicRestrictionTransactionV1()
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._restriction_flags = restriction_flags
		instance._restriction_additions = restriction_additions
		instance._restriction_deletions = restriction_deletions
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._embedded_transaction_header_reserved_1)
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._restriction_flags.serialize()
		buffer += Converter::intToBytes($len(self._restriction_additions))  # restriction_additions_count
		buffer += Converter::intToBytes($len(self._restriction_deletions))  # restriction_deletions_count
		buffer += Converter::intToBytes($self._account_restriction_transaction_body_reserved_1)
		buffer += ArrayHelpers.write_array(self._restriction_additions)
		buffer += ArrayHelpers.write_array(self._restriction_deletions)
		return buffer
	}

	__str__(){
		result = '('
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'restriction_flags: {self._restriction_flags.__str__()}, '
		result += f'restriction_additions: {list(map(str, self._restriction_additions))}, '
		result += f'restriction_deletions: {list(map(str, self._restriction_deletions))}, '
		result += ')'
		return result
	}
}


class AccountOperationRestrictionTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.ACCOUNT_OPERATION_RESTRICTION
	TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'restriction_flags': 'enum:AccountRestrictionFlags',
		'restriction_additions': 'array[TransactionType]',
		'restriction_deletions': 'array[TransactionType]'
	}

	public function __construct(){
		self._signature = Signature()
		self._signer_public_key = PublicKey()
		self._version = AccountOperationRestrictionTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = AccountOperationRestrictionTransactionV1.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._restriction_flags = AccountRestrictionFlags.ADDRESS
		self._restriction_additions = []
		self._restriction_deletions = []
		self._verifiable_entity_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
		self._account_restriction_transaction_body_reserved_1 = 0  # reserved field
	}

	sort(){
		pass
	}

	signature(){
		return self._signature
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	fee(){
		return self._fee
	}

	deadline(){
		return self._deadline
	}

	restriction_flags(){
		return self._restriction_flags
	}

	restriction_additions(){
		return self._restriction_additions
	}

	restriction_deletions(){
		return self._restriction_deletions
	}

	signature(value: Signature){
		self._signature = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	fee(value: Amount){
		self._fee = value
	}

	deadline(value: Timestamp){
		self._deadline = value
	}

	restriction_flags(value: AccountRestrictionFlags){
		self._restriction_flags = value
	}

	restriction_additions(value: List[TransactionType]){
		self._restriction_additions = value
	}

	restriction_deletions(value: List[TransactionType]){
		self._restriction_deletions = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signer_public_key.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		size += self.restriction_flags.size
		size += 1
		size += 1
		size += 4
		size += ArrayHelpers.size(self.restriction_additions)
		size += ArrayHelpers.size(self.restriction_deletions)
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiable_entity_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert verifiable_entity_header_reserved_1 == 0, f'Invalid value of reserved field ({verifiable_entity_header_reserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		restriction_flags = AccountRestrictionFlags.deserialize(buffer)
		buffer = buffer[restriction_flags.size:]
		restriction_additions_count = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		restriction_deletions_count = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		account_restriction_transaction_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert account_restriction_transaction_body_reserved_1 == 0, f'Invalid value of reserved field ({account_restriction_transaction_body_reserved_1})'
		restriction_additions = ArrayHelpers.read_array_count(buffer, TransactionType, restriction_additions_count)
		buffer = buffer[ArrayHelpers.size(restriction_additions):]
		restriction_deletions = ArrayHelpers.read_array_count(buffer, TransactionType, restriction_deletions_count)
		buffer = buffer[ArrayHelpers.size(restriction_deletions):]

		instance = AccountOperationRestrictionTransactionV1()
		instance._signature = signature
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		instance._restriction_flags = restriction_flags
		instance._restriction_additions = restriction_additions
		instance._restriction_deletions = restriction_deletions
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._verifiable_entity_header_reserved_1)
		buffer += self._signature.serialize()
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._restriction_flags.serialize()
		buffer += Converter::intToBytes($len(self._restriction_additions))  # restriction_additions_count
		buffer += Converter::intToBytes($len(self._restriction_deletions))  # restriction_deletions_count
		buffer += Converter::intToBytes($self._account_restriction_transaction_body_reserved_1)
		buffer += ArrayHelpers.write_array(self._restriction_additions)
		buffer += ArrayHelpers.write_array(self._restriction_deletions)
		return buffer
	}

	__str__(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'restriction_flags: {self._restriction_flags.__str__()}, '
		result += f'restriction_additions: {list(map(str, self._restriction_additions))}, '
		result += f'restriction_deletions: {list(map(str, self._restriction_deletions))}, '
		result += ')'
		return result
	}
}


class EmbeddedAccountOperationRestrictionTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.ACCOUNT_OPERATION_RESTRICTION
	TYPE_HINTS = {
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'restriction_flags': 'enum:AccountRestrictionFlags',
		'restriction_additions': 'array[TransactionType]',
		'restriction_deletions': 'array[TransactionType]'
	}

	public function __construct(){
		self._signer_public_key = PublicKey()
		self._version = EmbeddedAccountOperationRestrictionTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = EmbeddedAccountOperationRestrictionTransactionV1.TRANSACTION_TYPE
		self._restriction_flags = AccountRestrictionFlags.ADDRESS
		self._restriction_additions = []
		self._restriction_deletions = []
		self._embedded_transaction_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
		self._account_restriction_transaction_body_reserved_1 = 0  # reserved field
	}

	sort(){
		pass
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	restriction_flags(){
		return self._restriction_flags
	}

	restriction_additions(){
		return self._restriction_additions
	}

	restriction_deletions(){
		return self._restriction_deletions
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	restriction_flags(value: AccountRestrictionFlags){
		self._restriction_flags = value
	}

	restriction_additions(value: List[TransactionType]){
		self._restriction_additions = value
	}

	restriction_deletions(value: List[TransactionType]){
		self._restriction_deletions = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signer_public_key.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.restriction_flags.size
		size += 1
		size += 1
		size += 4
		size += ArrayHelpers.size(self.restriction_additions)
		size += ArrayHelpers.size(self.restriction_deletions)
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		embedded_transaction_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert embedded_transaction_header_reserved_1 == 0, f'Invalid value of reserved field ({embedded_transaction_header_reserved_1})'
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		restriction_flags = AccountRestrictionFlags.deserialize(buffer)
		buffer = buffer[restriction_flags.size:]
		restriction_additions_count = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		restriction_deletions_count = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		account_restriction_transaction_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert account_restriction_transaction_body_reserved_1 == 0, f'Invalid value of reserved field ({account_restriction_transaction_body_reserved_1})'
		restriction_additions = ArrayHelpers.read_array_count(buffer, TransactionType, restriction_additions_count)
		buffer = buffer[ArrayHelpers.size(restriction_additions):]
		restriction_deletions = ArrayHelpers.read_array_count(buffer, TransactionType, restriction_deletions_count)
		buffer = buffer[ArrayHelpers.size(restriction_deletions):]

		instance = EmbeddedAccountOperationRestrictionTransactionV1()
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._restriction_flags = restriction_flags
		instance._restriction_additions = restriction_additions
		instance._restriction_deletions = restriction_deletions
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._embedded_transaction_header_reserved_1)
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._restriction_flags.serialize()
		buffer += Converter::intToBytes($len(self._restriction_additions))  # restriction_additions_count
		buffer += Converter::intToBytes($len(self._restriction_deletions))  # restriction_deletions_count
		buffer += Converter::intToBytes($self._account_restriction_transaction_body_reserved_1)
		buffer += ArrayHelpers.write_array(self._restriction_additions)
		buffer += ArrayHelpers.write_array(self._restriction_deletions)
		return buffer
	}

	__str__(){
		result = '('
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'restriction_flags: {self._restriction_flags.__str__()}, '
		result += f'restriction_additions: {list(map(str, self._restriction_additions))}, '
		result += f'restriction_deletions: {list(map(str, self._restriction_deletions))}, '
		result += ')'
		return result
	}
}


class MosaicAddressRestrictionTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.MOSAIC_ADDRESS_RESTRICTION
	TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'mosaic_id': 'pod:UnresolvedMosaicId',
		'target_address': 'pod:UnresolvedAddress'
	}

	public function __construct(){
		self._signature = Signature()
		self._signer_public_key = PublicKey()
		self._version = MosaicAddressRestrictionTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = MosaicAddressRestrictionTransactionV1.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._mosaic_id = UnresolvedMosaicId()
		self._restriction_key = 0
		self._previous_restriction_value = 0
		self._new_restriction_value = 0
		self._target_address = UnresolvedAddress()
		self._verifiable_entity_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
	}

	sort(){
		pass
	}

	signature(){
		return self._signature
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	fee(){
		return self._fee
	}

	deadline(){
		return self._deadline
	}

	mosaic_id(){
		return self._mosaic_id
	}

	restriction_key(){
		return self._restriction_key
	}

	previous_restriction_value(){
		return self._previous_restriction_value
	}

	new_restriction_value(){
		return self._new_restriction_value
	}

	target_address(){
		return self._target_address
	}

	signature(value: Signature){
		self._signature = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	fee(value: Amount){
		self._fee = value
	}

	deadline(value: Timestamp){
		self._deadline = value
	}

	mosaic_id(value: UnresolvedMosaicId){
		self._mosaic_id = value
	}

	restriction_key(value: int){
		self._restriction_key = value
	}

	previous_restriction_value(value: int){
		self._previous_restriction_value = value
	}

	new_restriction_value(value: int){
		self._new_restriction_value = value
	}

	target_address(value: UnresolvedAddress){
		self._target_address = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signer_public_key.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		size += self.mosaic_id.size
		size += 8
		size += 8
		size += 8
		size += self.target_address.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiable_entity_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert verifiable_entity_header_reserved_1 == 0, f'Invalid value of reserved field ({verifiable_entity_header_reserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		mosaic_id = UnresolvedMosaicId.deserialize(buffer)
		buffer = buffer[mosaic_id.size:]
		restriction_key = Converter::bytesToInt(byteArray)
		buffer = buffer[8:]
		previous_restriction_value = Converter::bytesToInt(byteArray)
		buffer = buffer[8:]
		new_restriction_value = Converter::bytesToInt(byteArray)
		buffer = buffer[8:]
		target_address = UnresolvedAddress.deserialize(buffer)
		buffer = buffer[target_address.size:]

		instance = MosaicAddressRestrictionTransactionV1()
		instance._signature = signature
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		instance._mosaic_id = mosaic_id
		instance._restriction_key = restriction_key
		instance._previous_restriction_value = previous_restriction_value
		instance._new_restriction_value = new_restriction_value
		instance._target_address = target_address
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._verifiable_entity_header_reserved_1)
		buffer += self._signature.serialize()
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._mosaic_id.serialize()
		buffer += Converter::intToBytes($self._restriction_key)
		buffer += Converter::intToBytes($self._previous_restriction_value)
		buffer += Converter::intToBytes($self._new_restriction_value)
		buffer += self._target_address.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'mosaic_id: {self._mosaic_id.__str__()}, '
		result += f'restriction_key: 0x{self._restriction_key:X}, '
		result += f'previous_restriction_value: 0x{self._previous_restriction_value:X}, '
		result += f'new_restriction_value: 0x{self._new_restriction_value:X}, '
		result += f'target_address: {self._target_address.__str__()}, '
		result += ')'
		return result
	}
}


class EmbeddedMosaicAddressRestrictionTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.MOSAIC_ADDRESS_RESTRICTION
	TYPE_HINTS = {
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'mosaic_id': 'pod:UnresolvedMosaicId',
		'target_address': 'pod:UnresolvedAddress'
	}

	public function __construct(){
		self._signer_public_key = PublicKey()
		self._version = EmbeddedMosaicAddressRestrictionTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = EmbeddedMosaicAddressRestrictionTransactionV1.TRANSACTION_TYPE
		self._mosaic_id = UnresolvedMosaicId()
		self._restriction_key = 0
		self._previous_restriction_value = 0
		self._new_restriction_value = 0
		self._target_address = UnresolvedAddress()
		self._embedded_transaction_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
	}

	sort(){
		pass
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	mosaic_id(){
		return self._mosaic_id
	}

	restriction_key(){
		return self._restriction_key
	}

	previous_restriction_value(){
		return self._previous_restriction_value
	}

	new_restriction_value(){
		return self._new_restriction_value
	}

	target_address(){
		return self._target_address
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	mosaic_id(value: UnresolvedMosaicId){
		self._mosaic_id = value
	}

	restriction_key(value: int){
		self._restriction_key = value
	}

	previous_restriction_value(value: int){
		self._previous_restriction_value = value
	}

	new_restriction_value(value: int){
		self._new_restriction_value = value
	}

	target_address(value: UnresolvedAddress){
		self._target_address = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signer_public_key.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.mosaic_id.size
		size += 8
		size += 8
		size += 8
		size += self.target_address.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		embedded_transaction_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert embedded_transaction_header_reserved_1 == 0, f'Invalid value of reserved field ({embedded_transaction_header_reserved_1})'
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		mosaic_id = UnresolvedMosaicId.deserialize(buffer)
		buffer = buffer[mosaic_id.size:]
		restriction_key = Converter::bytesToInt(byteArray)
		buffer = buffer[8:]
		previous_restriction_value = Converter::bytesToInt(byteArray)
		buffer = buffer[8:]
		new_restriction_value = Converter::bytesToInt(byteArray)
		buffer = buffer[8:]
		target_address = UnresolvedAddress.deserialize(buffer)
		buffer = buffer[target_address.size:]

		instance = EmbeddedMosaicAddressRestrictionTransactionV1()
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._mosaic_id = mosaic_id
		instance._restriction_key = restriction_key
		instance._previous_restriction_value = previous_restriction_value
		instance._new_restriction_value = new_restriction_value
		instance._target_address = target_address
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._embedded_transaction_header_reserved_1)
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._mosaic_id.serialize()
		buffer += Converter::intToBytes($self._restriction_key)
		buffer += Converter::intToBytes($self._previous_restriction_value)
		buffer += Converter::intToBytes($self._new_restriction_value)
		buffer += self._target_address.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'mosaic_id: {self._mosaic_id.__str__()}, '
		result += f'restriction_key: 0x{self._restriction_key:X}, '
		result += f'previous_restriction_value: 0x{self._previous_restriction_value:X}, '
		result += f'new_restriction_value: 0x{self._new_restriction_value:X}, '
		result += f'target_address: {self._target_address.__str__()}, '
		result += ')'
		return result
	}
}


class MosaicRestrictionKey extends BaseValue {
	const SIZE = 8;

	public function __construct($mosaic_restriction_key = 0){
		parent::__construct(self::SIZE, $mosaic_restriction_key);
	}

	public static function deserialize($payload){
		$byteArray = $payload;
		return new MosaicRestrictionKey(Converter::bytesToInt(byteArray));
	}

	public function serialize(){
		return Converter::intToBytes($$this->value);
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

	size(){
		return 1
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		return MosaicRestrictionType(Converter::bytesToInt(byteArray))
	}

	public function serialize(){
		buffer = bytes()
		buffer += Converter::intToBytes($self.value)
		return buffer
	}
}


class MosaicGlobalRestrictionTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.MOSAIC_GLOBAL_RESTRICTION
	TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'mosaic_id': 'pod:UnresolvedMosaicId',
		'reference_mosaic_id': 'pod:UnresolvedMosaicId',
		'previous_restriction_type': 'enum:MosaicRestrictionType',
		'new_restriction_type': 'enum:MosaicRestrictionType'
	}

	public function __construct(){
		self._signature = Signature()
		self._signer_public_key = PublicKey()
		self._version = MosaicGlobalRestrictionTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = MosaicGlobalRestrictionTransactionV1.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._mosaic_id = UnresolvedMosaicId()
		self._reference_mosaic_id = UnresolvedMosaicId()
		self._restriction_key = 0
		self._previous_restriction_value = 0
		self._new_restriction_value = 0
		self._previous_restriction_type = MosaicRestrictionType.NONE
		self._new_restriction_type = MosaicRestrictionType.NONE
		self._verifiable_entity_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
	}

	sort(){
		pass
	}

	signature(){
		return self._signature
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	fee(){
		return self._fee
	}

	deadline(){
		return self._deadline
	}

	mosaic_id(){
		return self._mosaic_id
	}

	reference_mosaic_id(){
		return self._reference_mosaic_id
	}

	restriction_key(){
		return self._restriction_key
	}

	previous_restriction_value(){
		return self._previous_restriction_value
	}

	new_restriction_value(){
		return self._new_restriction_value
	}

	previous_restriction_type(){
		return self._previous_restriction_type
	}

	new_restriction_type(){
		return self._new_restriction_type
	}

	signature(value: Signature){
		self._signature = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	fee(value: Amount){
		self._fee = value
	}

	deadline(value: Timestamp){
		self._deadline = value
	}

	mosaic_id(value: UnresolvedMosaicId){
		self._mosaic_id = value
	}

	reference_mosaic_id(value: UnresolvedMosaicId){
		self._reference_mosaic_id = value
	}

	restriction_key(value: int){
		self._restriction_key = value
	}

	previous_restriction_value(value: int){
		self._previous_restriction_value = value
	}

	new_restriction_value(value: int){
		self._new_restriction_value = value
	}

	previous_restriction_type(value: MosaicRestrictionType){
		self._previous_restriction_type = value
	}

	new_restriction_type(value: MosaicRestrictionType){
		self._new_restriction_type = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signer_public_key.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		size += self.mosaic_id.size
		size += self.reference_mosaic_id.size
		size += 8
		size += 8
		size += 8
		size += self.previous_restriction_type.size
		size += self.new_restriction_type.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiable_entity_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert verifiable_entity_header_reserved_1 == 0, f'Invalid value of reserved field ({verifiable_entity_header_reserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		mosaic_id = UnresolvedMosaicId.deserialize(buffer)
		buffer = buffer[mosaic_id.size:]
		reference_mosaic_id = UnresolvedMosaicId.deserialize(buffer)
		buffer = buffer[reference_mosaic_id.size:]
		restriction_key = Converter::bytesToInt(byteArray)
		buffer = buffer[8:]
		previous_restriction_value = Converter::bytesToInt(byteArray)
		buffer = buffer[8:]
		new_restriction_value = Converter::bytesToInt(byteArray)
		buffer = buffer[8:]
		previous_restriction_type = MosaicRestrictionType.deserialize(buffer)
		buffer = buffer[previous_restriction_type.size:]
		new_restriction_type = MosaicRestrictionType.deserialize(buffer)
		buffer = buffer[new_restriction_type.size:]

		instance = MosaicGlobalRestrictionTransactionV1()
		instance._signature = signature
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		instance._mosaic_id = mosaic_id
		instance._reference_mosaic_id = reference_mosaic_id
		instance._restriction_key = restriction_key
		instance._previous_restriction_value = previous_restriction_value
		instance._new_restriction_value = new_restriction_value
		instance._previous_restriction_type = previous_restriction_type
		instance._new_restriction_type = new_restriction_type
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._verifiable_entity_header_reserved_1)
		buffer += self._signature.serialize()
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._mosaic_id.serialize()
		buffer += self._reference_mosaic_id.serialize()
		buffer += Converter::intToBytes($self._restriction_key)
		buffer += Converter::intToBytes($self._previous_restriction_value)
		buffer += Converter::intToBytes($self._new_restriction_value)
		buffer += self._previous_restriction_type.serialize()
		buffer += self._new_restriction_type.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'mosaic_id: {self._mosaic_id.__str__()}, '
		result += f'reference_mosaic_id: {self._reference_mosaic_id.__str__()}, '
		result += f'restriction_key: 0x{self._restriction_key:X}, '
		result += f'previous_restriction_value: 0x{self._previous_restriction_value:X}, '
		result += f'new_restriction_value: 0x{self._new_restriction_value:X}, '
		result += f'previous_restriction_type: {self._previous_restriction_type.__str__()}, '
		result += f'new_restriction_type: {self._new_restriction_type.__str__()}, '
		result += ')'
		return result
	}
}


class EmbeddedMosaicGlobalRestrictionTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.MOSAIC_GLOBAL_RESTRICTION
	TYPE_HINTS = {
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'mosaic_id': 'pod:UnresolvedMosaicId',
		'reference_mosaic_id': 'pod:UnresolvedMosaicId',
		'previous_restriction_type': 'enum:MosaicRestrictionType',
		'new_restriction_type': 'enum:MosaicRestrictionType'
	}

	public function __construct(){
		self._signer_public_key = PublicKey()
		self._version = EmbeddedMosaicGlobalRestrictionTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = EmbeddedMosaicGlobalRestrictionTransactionV1.TRANSACTION_TYPE
		self._mosaic_id = UnresolvedMosaicId()
		self._reference_mosaic_id = UnresolvedMosaicId()
		self._restriction_key = 0
		self._previous_restriction_value = 0
		self._new_restriction_value = 0
		self._previous_restriction_type = MosaicRestrictionType.NONE
		self._new_restriction_type = MosaicRestrictionType.NONE
		self._embedded_transaction_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
	}

	sort(){
		pass
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	mosaic_id(){
		return self._mosaic_id
	}

	reference_mosaic_id(){
		return self._reference_mosaic_id
	}

	restriction_key(){
		return self._restriction_key
	}

	previous_restriction_value(){
		return self._previous_restriction_value
	}

	new_restriction_value(){
		return self._new_restriction_value
	}

	previous_restriction_type(){
		return self._previous_restriction_type
	}

	new_restriction_type(){
		return self._new_restriction_type
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	mosaic_id(value: UnresolvedMosaicId){
		self._mosaic_id = value
	}

	reference_mosaic_id(value: UnresolvedMosaicId){
		self._reference_mosaic_id = value
	}

	restriction_key(value: int){
		self._restriction_key = value
	}

	previous_restriction_value(value: int){
		self._previous_restriction_value = value
	}

	new_restriction_value(value: int){
		self._new_restriction_value = value
	}

	previous_restriction_type(value: MosaicRestrictionType){
		self._previous_restriction_type = value
	}

	new_restriction_type(value: MosaicRestrictionType){
		self._new_restriction_type = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signer_public_key.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.mosaic_id.size
		size += self.reference_mosaic_id.size
		size += 8
		size += 8
		size += 8
		size += self.previous_restriction_type.size
		size += self.new_restriction_type.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		embedded_transaction_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert embedded_transaction_header_reserved_1 == 0, f'Invalid value of reserved field ({embedded_transaction_header_reserved_1})'
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		mosaic_id = UnresolvedMosaicId.deserialize(buffer)
		buffer = buffer[mosaic_id.size:]
		reference_mosaic_id = UnresolvedMosaicId.deserialize(buffer)
		buffer = buffer[reference_mosaic_id.size:]
		restriction_key = Converter::bytesToInt(byteArray)
		buffer = buffer[8:]
		previous_restriction_value = Converter::bytesToInt(byteArray)
		buffer = buffer[8:]
		new_restriction_value = Converter::bytesToInt(byteArray)
		buffer = buffer[8:]
		previous_restriction_type = MosaicRestrictionType.deserialize(buffer)
		buffer = buffer[previous_restriction_type.size:]
		new_restriction_type = MosaicRestrictionType.deserialize(buffer)
		buffer = buffer[new_restriction_type.size:]

		instance = EmbeddedMosaicGlobalRestrictionTransactionV1()
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._mosaic_id = mosaic_id
		instance._reference_mosaic_id = reference_mosaic_id
		instance._restriction_key = restriction_key
		instance._previous_restriction_value = previous_restriction_value
		instance._new_restriction_value = new_restriction_value
		instance._previous_restriction_type = previous_restriction_type
		instance._new_restriction_type = new_restriction_type
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._embedded_transaction_header_reserved_1)
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._mosaic_id.serialize()
		buffer += self._reference_mosaic_id.serialize()
		buffer += Converter::intToBytes($self._restriction_key)
		buffer += Converter::intToBytes($self._previous_restriction_value)
		buffer += Converter::intToBytes($self._new_restriction_value)
		buffer += self._previous_restriction_type.serialize()
		buffer += self._new_restriction_type.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'mosaic_id: {self._mosaic_id.__str__()}, '
		result += f'reference_mosaic_id: {self._reference_mosaic_id.__str__()}, '
		result += f'restriction_key: 0x{self._restriction_key:X}, '
		result += f'previous_restriction_value: 0x{self._previous_restriction_value:X}, '
		result += f'new_restriction_value: 0x{self._new_restriction_value:X}, '
		result += f'previous_restriction_type: {self._previous_restriction_type.__str__()}, '
		result += f'new_restriction_type: {self._new_restriction_type.__str__()}, '
		result += ')'
		return result
	}
}


class TransferTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.TRANSFER
	TYPE_HINTS = {
		'signature': 'pod:Signature',
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'recipient_address': 'pod:UnresolvedAddress',
		'mosaics': 'array[UnresolvedMosaic]',
		'message': 'bytes_array'
	}

	public function __construct(){
		self._signature = Signature()
		self._signer_public_key = PublicKey()
		self._version = TransferTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = TransferTransactionV1.TRANSACTION_TYPE
		self._fee = Amount()
		self._deadline = Timestamp()
		self._recipient_address = UnresolvedAddress()
		self._mosaics = []
		self._message = bytes()
		self._verifiable_entity_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
		self._transfer_transaction_body_reserved_1 = 0  # reserved field
		self._transfer_transaction_body_reserved_2 = 0  # reserved field
	}

	sort(){
		self._mosaics = sorted(self._mosaics, key=lambda e: e.mosaic_id.comparer() if hasattr(e.mosaic_id, 'comparer') else e.mosaic_id)
	}

	signature(){
		return self._signature
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	fee(){
		return self._fee
	}

	deadline(){
		return self._deadline
	}

	recipient_address(){
		return self._recipient_address
	}

	mosaics(){
		return self._mosaics
	}

	message(){
		return self._message
	}

	signature(value: Signature){
		self._signature = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	fee(value: Amount){
		self._fee = value
	}

	deadline(value: Timestamp){
		self._deadline = value
	}

	recipient_address(value: UnresolvedAddress){
		self._recipient_address = value
	}

	mosaics(value: List[UnresolvedMosaic]){
		self._mosaics = value
	}

	message(value: bytes){
		self._message = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signature.size
		size += self.signer_public_key.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.fee.size
		size += self.deadline.size
		size += self.recipient_address.size
		size += 2
		size += 1
		size += 1
		size += 4
		size += ArrayHelpers.size(self.mosaics)
		size += len(self._message)
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		verifiable_entity_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert verifiable_entity_header_reserved_1 == 0, f'Invalid value of reserved field ({verifiable_entity_header_reserved_1})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		recipient_address = UnresolvedAddress.deserialize(buffer)
		buffer = buffer[recipient_address.size:]
		message_size = Converter::bytesToInt(byteArray)
		buffer = buffer[2:]
		mosaics_count = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		transfer_transaction_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		assert transfer_transaction_body_reserved_1 == 0, f'Invalid value of reserved field ({transfer_transaction_body_reserved_1})'
		transfer_transaction_body_reserved_2 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert transfer_transaction_body_reserved_2 == 0, f'Invalid value of reserved field ({transfer_transaction_body_reserved_2})'
		mosaics = ArrayHelpers.read_array_count(buffer, UnresolvedMosaic, mosaics_count, lambda e: e.mosaic_id.comparer() if hasattr(e.mosaic_id, 'comparer') else e.mosaic_id)
		buffer = buffer[ArrayHelpers.size(mosaics):]
		message = ArrayHelpers.get_bytes(buffer, message_size)
		buffer = buffer[message_size:]

		instance = TransferTransactionV1()
		instance._signature = signature
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._fee = fee
		instance._deadline = deadline
		instance._recipient_address = recipient_address
		instance._mosaics = mosaics
		instance._message = message
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._verifiable_entity_header_reserved_1)
		buffer += self._signature.serialize()
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._recipient_address.serialize()
		buffer += Converter::intToBytes($len(self._message))  # message_size
		buffer += Converter::intToBytes($len(self._mosaics))  # mosaics_count
		buffer += Converter::intToBytes($self._transfer_transaction_body_reserved_1)
		buffer += Converter::intToBytes($self._transfer_transaction_body_reserved_2)
		buffer += ArrayHelpers.write_array(self._mosaics, lambda e: e.mosaic_id.comparer() if hasattr(e.mosaic_id, 'comparer') else e.mosaic_id)
		buffer += self._message
		return buffer
	}

	__str__(){
		result = '('
		result += f'signature: {self._signature.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'recipient_address: {self._recipient_address.__str__()}, '
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
		'signer_public_key': 'pod:PublicKey',
		'network': 'enum:NetworkType',
		'type_': 'enum:TransactionType',
		'recipient_address': 'pod:UnresolvedAddress',
		'mosaics': 'array[UnresolvedMosaic]',
		'message': 'bytes_array'
	}

	public function __construct(){
		self._signer_public_key = PublicKey()
		self._version = EmbeddedTransferTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._type_ = EmbeddedTransferTransactionV1.TRANSACTION_TYPE
		self._recipient_address = UnresolvedAddress()
		self._mosaics = []
		self._message = bytes()
		self._embedded_transaction_header_reserved_1 = 0  # reserved field
		self._entity_body_reserved_1 = 0  # reserved field
		self._transfer_transaction_body_reserved_1 = 0  # reserved field
		self._transfer_transaction_body_reserved_2 = 0  # reserved field
	}

	sort(){
		self._mosaics = sorted(self._mosaics, key=lambda e: e.mosaic_id.comparer() if hasattr(e.mosaic_id, 'comparer') else e.mosaic_id)
	}

	signer_public_key(){
		return self._signer_public_key
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	type_(){
		return self._type_
	}

	recipient_address(){
		return self._recipient_address
	}

	mosaics(){
		return self._mosaics
	}

	message(){
		return self._message
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	recipient_address(value: UnresolvedAddress){
		self._recipient_address = value
	}

	mosaics(value: List[UnresolvedMosaic]){
		self._mosaics = value
	}

	message(value: bytes){
		self._message = value
	}

	size(){
		size = 0
		size += 4
		size += 4
		size += self.signer_public_key.size
		size += 4
		size += 1
		size += self.network.size
		size += self.type_.size
		size += self.recipient_address.size
		size += 2
		size += 1
		size += 1
		size += 4
		size += ArrayHelpers.size(self.mosaics)
		size += len(self._message)
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		size_ = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		buffer = buffer[:size_ - 4]
		del size_
		embedded_transaction_header_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert embedded_transaction_header_reserved_1 == 0, f'Invalid value of reserved field ({embedded_transaction_header_reserved_1})'
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		recipient_address = UnresolvedAddress.deserialize(buffer)
		buffer = buffer[recipient_address.size:]
		message_size = Converter::bytesToInt(byteArray)
		buffer = buffer[2:]
		mosaics_count = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		transfer_transaction_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		assert transfer_transaction_body_reserved_1 == 0, f'Invalid value of reserved field ({transfer_transaction_body_reserved_1})'
		transfer_transaction_body_reserved_2 = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert transfer_transaction_body_reserved_2 == 0, f'Invalid value of reserved field ({transfer_transaction_body_reserved_2})'
		mosaics = ArrayHelpers.read_array_count(buffer, UnresolvedMosaic, mosaics_count, lambda e: e.mosaic_id.comparer() if hasattr(e.mosaic_id, 'comparer') else e.mosaic_id)
		buffer = buffer[ArrayHelpers.size(mosaics):]
		message = ArrayHelpers.get_bytes(buffer, message_size)
		buffer = buffer[message_size:]

		instance = EmbeddedTransferTransactionV1()
		instance._signer_public_key = signer_public_key
		instance._version = version
		instance._network = network
		instance._type_ = type_
		instance._recipient_address = recipient_address
		instance._mosaics = mosaics
		instance._message = message
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self.size.to_bytes(4, byteorder='little', signed=False)
		buffer += Converter::intToBytes($self._embedded_transaction_header_reserved_1)
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += Converter::intToBytes($self._version)
		buffer += self._network.serialize()
		buffer += self._type_.serialize()
		buffer += self._recipient_address.serialize()
		buffer += Converter::intToBytes($len(self._message))  # message_size
		buffer += Converter::intToBytes($len(self._mosaics))  # mosaics_count
		buffer += Converter::intToBytes($self._transfer_transaction_body_reserved_1)
		buffer += Converter::intToBytes($self._transfer_transaction_body_reserved_2)
		buffer += ArrayHelpers.write_array(self._mosaics, lambda e: e.mosaic_id.comparer() if hasattr(e.mosaic_id, 'comparer') else e.mosaic_id)
		buffer += self._message
		return buffer
	}

	__str__(){
		result = '('
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'type_: {self._type_.__str__()}, '
		result += f'recipient_address: {self._recipient_address.__str__()}, '
		result += f'mosaics: {list(map(str, self._mosaics))}, '
		result += f'message: {hexlify(self._message).decode("utf8")}, '
		result += ')'
		return result
	}
}


class TransactionFactory {
	deserialize(payload: bytes){
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

	create_by_name(entity_name: str){
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
	deserialize(payload: bytes){
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

	create_by_name(entity_name: str){
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
	deserialize(payload: bytes){
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

	create_by_name(entity_name: str){
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
	deserialize(payload: bytes){
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

	create_by_name(entity_name: str){
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
