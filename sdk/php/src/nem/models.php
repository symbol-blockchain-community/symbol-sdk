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


class Timestamp extends BaseValue {
	const SIZE = 4;

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


class Address extends ByteArray {
	const SIZE = 40;

	public function __construct(address = bytes(40)){
		parent::__construct(self::SIZE, $address);
	}

	size(){
		return 40;
	}

	public static function deserialize($payload){
		$byteArray = $payload;
		return new Address(ArrayHelpers.get_bytes(buffer, 40));
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
	TRANSFER = 257
	ACCOUNT_KEY_LINK = 2049
	MULTISIG_ACCOUNT_MODIFICATION = 4097
	MULTISIG_COSIGNATURE = 4098
	MULTISIG = 4100
	NAMESPACE_REGISTRATION = 8193
	MOSAIC_DEFINITION = 16385
	MOSAIC_SUPPLY_CHANGE = 16386

	size(){
		return 4
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
		'type_': 'enum:TransactionType',
		'network': 'enum:NetworkType',
		'timestamp': 'pod:Timestamp',
		'signer_public_key': 'pod:PublicKey',
		'signature': 'pod:Signature',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp'
	}

	public function __construct(){
		self._type_ = TransactionType.TRANSFER
		self._version = 0
		self._network = NetworkType.MAINNET
		self._timestamp = Timestamp()
		self._signer_public_key = PublicKey()
		self._signature = Signature()
		self._fee = Amount()
		self._deadline = Timestamp()
		self._entity_body_reserved_1 = 0  # reserved field
		self._signer_public_key_size = 32  # reserved field
		self._signature_size = 64  # reserved field
	}

	sort(){
		pass
	}

	type_(){
		return self._type_
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	timestamp(){
		return self._timestamp
	}

	signer_public_key(){
		return self._signer_public_key
	}

	signature(){
		return self._signature
	}

	fee(){
		return self._fee
	}

	deadline(){
		return self._deadline
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	timestamp(value: Timestamp){
		self._timestamp = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	signature(value: Signature){
		self._signature = value
	}

	fee(value: Amount){
		self._fee = value
	}

	deadline(value: Timestamp){
		self._deadline = value
	}

	size(){
		size = 0
		size += self.type_.size
		size += 1
		size += 2
		size += self.network.size
		size += self.timestamp.size
		size += 4
		size += self.signer_public_key.size
		size += 4
		size += self.signature.size
		size += self.fee.size
		size += self.deadline.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[2:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		timestamp = Timestamp.deserialize(buffer)
		buffer = buffer[timestamp.size:]
		signer_public_key_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert signer_public_key_size == 32, f'Invalid value of reserved field ({signer_public_key_size})'
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		signature_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert signature_size == 64, f'Invalid value of reserved field ({signature_size})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]

		instance = Transaction()
		instance._type_ = type_
		instance._version = version
		instance._network = network
		instance._timestamp = timestamp
		instance._signer_public_key = signer_public_key
		instance._signature = signature
		instance._fee = fee
		instance._deadline = deadline
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self._type_.serialize()
		buffer += Converter::intToBytes($self._version)
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += self._network.serialize()
		buffer += self._timestamp.serialize()
		buffer += Converter::intToBytes($self._signer_public_key_size)
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._signature_size)
		buffer += self._signature.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'type_: {self._type_.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'timestamp: {self._timestamp.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'signature: {self._signature.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += ')'
		return result
	}
}


class NonVerifiableTransaction {
	TYPE_HINTS = {
		'type_': 'enum:TransactionType',
		'network': 'enum:NetworkType',
		'timestamp': 'pod:Timestamp',
		'signer_public_key': 'pod:PublicKey',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp'
	}

	public function __construct(){
		self._type_ = TransactionType.TRANSFER
		self._version = 0
		self._network = NetworkType.MAINNET
		self._timestamp = Timestamp()
		self._signer_public_key = PublicKey()
		self._fee = Amount()
		self._deadline = Timestamp()
		self._entity_body_reserved_1 = 0  # reserved field
		self._signer_public_key_size = 32  # reserved field
	}

	sort(){
		pass
	}

	type_(){
		return self._type_
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	timestamp(){
		return self._timestamp
	}

	signer_public_key(){
		return self._signer_public_key
	}

	fee(){
		return self._fee
	}

	deadline(){
		return self._deadline
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	timestamp(value: Timestamp){
		self._timestamp = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	fee(value: Amount){
		self._fee = value
	}

	deadline(value: Timestamp){
		self._deadline = value
	}

	size(){
		size = 0
		size += self.type_.size
		size += 1
		size += 2
		size += self.network.size
		size += self.timestamp.size
		size += 4
		size += self.signer_public_key.size
		size += self.fee.size
		size += self.deadline.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[2:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		timestamp = Timestamp.deserialize(buffer)
		buffer = buffer[timestamp.size:]
		signer_public_key_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert signer_public_key_size == 32, f'Invalid value of reserved field ({signer_public_key_size})'
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]

		instance = NonVerifiableTransaction()
		instance._type_ = type_
		instance._version = version
		instance._network = network
		instance._timestamp = timestamp
		instance._signer_public_key = signer_public_key
		instance._fee = fee
		instance._deadline = deadline
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self._type_.serialize()
		buffer += Converter::intToBytes($self._version)
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += self._network.serialize()
		buffer += self._timestamp.serialize()
		buffer += Converter::intToBytes($self._signer_public_key_size)
		buffer += self._signer_public_key.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'type_: {self._type_.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'timestamp: {self._timestamp.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += ')'
		return result
	}
}


class LinkAction extends (Enum) {
	LINK = 1
	UNLINK = 2

	size(){
		return 4
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


class AccountKeyLinkTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.ACCOUNT_KEY_LINK
	TYPE_HINTS = {
		'type_': 'enum:TransactionType',
		'network': 'enum:NetworkType',
		'timestamp': 'pod:Timestamp',
		'signer_public_key': 'pod:PublicKey',
		'signature': 'pod:Signature',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'link_action': 'enum:LinkAction',
		'remote_public_key': 'pod:PublicKey'
	}

	public function __construct(){
		self._type_ = AccountKeyLinkTransactionV1.TRANSACTION_TYPE
		self._version = AccountKeyLinkTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._timestamp = Timestamp()
		self._signer_public_key = PublicKey()
		self._signature = Signature()
		self._fee = Amount()
		self._deadline = Timestamp()
		self._link_action = LinkAction.LINK
		self._remote_public_key = PublicKey()
		self._entity_body_reserved_1 = 0  # reserved field
		self._signer_public_key_size = 32  # reserved field
		self._signature_size = 64  # reserved field
		self._remote_public_key_size = 32  # reserved field
	}

	sort(){
		pass
	}

	type_(){
		return self._type_
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	timestamp(){
		return self._timestamp
	}

	signer_public_key(){
		return self._signer_public_key
	}

	signature(){
		return self._signature
	}

	fee(){
		return self._fee
	}

	deadline(){
		return self._deadline
	}

	link_action(){
		return self._link_action
	}

	remote_public_key(){
		return self._remote_public_key
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	timestamp(value: Timestamp){
		self._timestamp = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	signature(value: Signature){
		self._signature = value
	}

	fee(value: Amount){
		self._fee = value
	}

	deadline(value: Timestamp){
		self._deadline = value
	}

	link_action(value: LinkAction){
		self._link_action = value
	}

	remote_public_key(value: PublicKey){
		self._remote_public_key = value
	}

	size(){
		size = 0
		size += self.type_.size
		size += 1
		size += 2
		size += self.network.size
		size += self.timestamp.size
		size += 4
		size += self.signer_public_key.size
		size += 4
		size += self.signature.size
		size += self.fee.size
		size += self.deadline.size
		size += self.link_action.size
		size += 4
		size += self.remote_public_key.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[2:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		timestamp = Timestamp.deserialize(buffer)
		buffer = buffer[timestamp.size:]
		signer_public_key_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert signer_public_key_size == 32, f'Invalid value of reserved field ({signer_public_key_size})'
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		signature_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert signature_size == 64, f'Invalid value of reserved field ({signature_size})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		link_action = LinkAction.deserialize(buffer)
		buffer = buffer[link_action.size:]
		remote_public_key_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert remote_public_key_size == 32, f'Invalid value of reserved field ({remote_public_key_size})'
		remote_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[remote_public_key.size:]

		instance = AccountKeyLinkTransactionV1()
		instance._type_ = type_
		instance._version = version
		instance._network = network
		instance._timestamp = timestamp
		instance._signer_public_key = signer_public_key
		instance._signature = signature
		instance._fee = fee
		instance._deadline = deadline
		instance._link_action = link_action
		instance._remote_public_key = remote_public_key
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self._type_.serialize()
		buffer += Converter::intToBytes($self._version)
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += self._network.serialize()
		buffer += self._timestamp.serialize()
		buffer += Converter::intToBytes($self._signer_public_key_size)
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._signature_size)
		buffer += self._signature.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._link_action.serialize()
		buffer += Converter::intToBytes($self._remote_public_key_size)
		buffer += self._remote_public_key.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'type_: {self._type_.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'timestamp: {self._timestamp.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'signature: {self._signature.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'link_action: {self._link_action.__str__()}, '
		result += f'remote_public_key: {self._remote_public_key.__str__()}, '
		result += ')'
		return result
	}
}


class NonVerifiableAccountKeyLinkTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.ACCOUNT_KEY_LINK
	TYPE_HINTS = {
		'type_': 'enum:TransactionType',
		'network': 'enum:NetworkType',
		'timestamp': 'pod:Timestamp',
		'signer_public_key': 'pod:PublicKey',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'link_action': 'enum:LinkAction',
		'remote_public_key': 'pod:PublicKey'
	}

	public function __construct(){
		self._type_ = NonVerifiableAccountKeyLinkTransactionV1.TRANSACTION_TYPE
		self._version = NonVerifiableAccountKeyLinkTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._timestamp = Timestamp()
		self._signer_public_key = PublicKey()
		self._fee = Amount()
		self._deadline = Timestamp()
		self._link_action = LinkAction.LINK
		self._remote_public_key = PublicKey()
		self._entity_body_reserved_1 = 0  # reserved field
		self._signer_public_key_size = 32  # reserved field
		self._remote_public_key_size = 32  # reserved field
	}

	sort(){
		pass
	}

	type_(){
		return self._type_
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	timestamp(){
		return self._timestamp
	}

	signer_public_key(){
		return self._signer_public_key
	}

	fee(){
		return self._fee
	}

	deadline(){
		return self._deadline
	}

	link_action(){
		return self._link_action
	}

	remote_public_key(){
		return self._remote_public_key
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	timestamp(value: Timestamp){
		self._timestamp = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	fee(value: Amount){
		self._fee = value
	}

	deadline(value: Timestamp){
		self._deadline = value
	}

	link_action(value: LinkAction){
		self._link_action = value
	}

	remote_public_key(value: PublicKey){
		self._remote_public_key = value
	}

	size(){
		size = 0
		size += self.type_.size
		size += 1
		size += 2
		size += self.network.size
		size += self.timestamp.size
		size += 4
		size += self.signer_public_key.size
		size += self.fee.size
		size += self.deadline.size
		size += self.link_action.size
		size += 4
		size += self.remote_public_key.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[2:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		timestamp = Timestamp.deserialize(buffer)
		buffer = buffer[timestamp.size:]
		signer_public_key_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert signer_public_key_size == 32, f'Invalid value of reserved field ({signer_public_key_size})'
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		link_action = LinkAction.deserialize(buffer)
		buffer = buffer[link_action.size:]
		remote_public_key_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert remote_public_key_size == 32, f'Invalid value of reserved field ({remote_public_key_size})'
		remote_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[remote_public_key.size:]

		instance = NonVerifiableAccountKeyLinkTransactionV1()
		instance._type_ = type_
		instance._version = version
		instance._network = network
		instance._timestamp = timestamp
		instance._signer_public_key = signer_public_key
		instance._fee = fee
		instance._deadline = deadline
		instance._link_action = link_action
		instance._remote_public_key = remote_public_key
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self._type_.serialize()
		buffer += Converter::intToBytes($self._version)
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += self._network.serialize()
		buffer += self._timestamp.serialize()
		buffer += Converter::intToBytes($self._signer_public_key_size)
		buffer += self._signer_public_key.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._link_action.serialize()
		buffer += Converter::intToBytes($self._remote_public_key_size)
		buffer += self._remote_public_key.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'type_: {self._type_.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'timestamp: {self._timestamp.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'link_action: {self._link_action.__str__()}, '
		result += f'remote_public_key: {self._remote_public_key.__str__()}, '
		result += ')'
		return result
	}
}


class NamespaceId {
	TYPE_HINTS = {
		'name': 'bytes_array'
	}

	public function __construct(){
		self._name = bytes()
	}

	sort(){
		pass
	}

	name(){
		return self._name
	}

	name(value: bytes){
		self._name = value
	}

	size(){
		size = 0
		size += 4
		size += len(self._name)
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		name_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		name = ArrayHelpers.get_bytes(buffer, name_size)
		buffer = buffer[name_size:]

		instance = NamespaceId()
		instance._name = name
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += Converter::intToBytes($len(self._name))  # name_size
		buffer += self._name
		return buffer
	}

	__str__(){
		result = '('
		result += f'name: {hexlify(self._name).decode("utf8")}, '
		result += ')'
		return result
	}
}


class MosaicId {
	TYPE_HINTS = {
		'namespace_id': 'struct:NamespaceId',
		'name': 'bytes_array'
	}

	public function __construct(){
		self._namespace_id = NamespaceId()
		self._name = bytes()
	}

	sort(){
		self._namespace_id.sort()
	}

	namespace_id(){
		return self._namespace_id
	}

	name(){
		return self._name
	}

	namespace_id(value: NamespaceId){
		self._namespace_id = value
	}

	name(value: bytes){
		self._name = value
	}

	size(){
		size = 0
		size += self.namespace_id.size
		size += 4
		size += len(self._name)
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		namespace_id = NamespaceId.deserialize(buffer)
		buffer = buffer[namespace_id.size:]
		name_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		name = ArrayHelpers.get_bytes(buffer, name_size)
		buffer = buffer[name_size:]

		instance = MosaicId()
		instance._namespace_id = namespace_id
		instance._name = name
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self._namespace_id.serialize()
		buffer += Converter::intToBytes($len(self._name))  # name_size
		buffer += self._name
		return buffer
	}

	__str__(){
		result = '('
		result += f'namespace_id: {self._namespace_id.__str__()}, '
		result += f'name: {hexlify(self._name).decode("utf8")}, '
		result += ')'
		return result
	}
}


class Mosaic {
	TYPE_HINTS = {
		'mosaic_id': 'struct:MosaicId',
		'amount': 'pod:Amount'
	}

	public function __construct(){
		self._mosaic_id = MosaicId()
		self._amount = Amount()
	}

	sort(){
		self._mosaic_id.sort()
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
		size += 4
		size += self.mosaic_id.size
		size += self.amount.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		mosaic_id_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		# marking sizeof field
		mosaic_id = MosaicId.deserialize(buffer[:mosaic_id_size])
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
		buffer += Converter::intToBytes($self.mosaic_id.size)  # mosaic_id_size
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


class SizePrefixedMosaic {
	TYPE_HINTS = {
		'mosaic': 'struct:Mosaic'
	}

	public function __construct(){
		self._mosaic = Mosaic()
	}

	sort(){
		self._mosaic.sort()
	}

	mosaic(){
		return self._mosaic
	}

	mosaic(value: Mosaic){
		self._mosaic = value
	}

	size(){
		size = 0
		size += 4
		size += self.mosaic.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		mosaic_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		# marking sizeof field
		mosaic = Mosaic.deserialize(buffer[:mosaic_size])
		buffer = buffer[mosaic.size:]

		instance = SizePrefixedMosaic()
		instance._mosaic = mosaic
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += Converter::intToBytes($self.mosaic.size)  # mosaic_size
		buffer += self._mosaic.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'mosaic: {self._mosaic.__str__()}, '
		result += ')'
		return result
	}
}


class MosaicTransferFeeType extends (Enum) {
	ABSOLUTE = 1
	PERCENTILE = 2

	size(){
		return 4
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		return MosaicTransferFeeType(Converter::bytesToInt(byteArray))
	}

	public function serialize(){
		buffer = bytes()
		buffer += Converter::intToBytes($self.value)
		return buffer
	}
}


class MosaicLevy {
	TYPE_HINTS = {
		'transfer_fee_type': 'enum:MosaicTransferFeeType',
		'recipient_address': 'pod:Address',
		'mosaic_id': 'struct:MosaicId',
		'fee': 'pod:Amount'
	}

	public function __construct(){
		self._transfer_fee_type = MosaicTransferFeeType.ABSOLUTE
		self._recipient_address = Address()
		self._mosaic_id = MosaicId()
		self._fee = Amount()
		self._recipient_address_size = 40  # reserved field
	}

	sort(){
		self._mosaic_id.sort()
	}

	transfer_fee_type(){
		return self._transfer_fee_type
	}

	recipient_address(){
		return self._recipient_address
	}

	mosaic_id(){
		return self._mosaic_id
	}

	fee(){
		return self._fee
	}

	transfer_fee_type(value: MosaicTransferFeeType){
		self._transfer_fee_type = value
	}

	recipient_address(value: Address){
		self._recipient_address = value
	}

	mosaic_id(value: MosaicId){
		self._mosaic_id = value
	}

	fee(value: Amount){
		self._fee = value
	}

	size(){
		size = 0
		size += self.transfer_fee_type.size
		size += 4
		size += self.recipient_address.size
		size += 4
		size += self.mosaic_id.size
		size += self.fee.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		transfer_fee_type = MosaicTransferFeeType.deserialize(buffer)
		buffer = buffer[transfer_fee_type.size:]
		recipient_address_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert recipient_address_size == 40, f'Invalid value of reserved field ({recipient_address_size})'
		recipient_address = Address.deserialize(buffer)
		buffer = buffer[recipient_address.size:]
		mosaic_id_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		# marking sizeof field
		mosaic_id = MosaicId.deserialize(buffer[:mosaic_id_size])
		buffer = buffer[mosaic_id.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]

		instance = MosaicLevy()
		instance._transfer_fee_type = transfer_fee_type
		instance._recipient_address = recipient_address
		instance._mosaic_id = mosaic_id
		instance._fee = fee
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self._transfer_fee_type.serialize()
		buffer += Converter::intToBytes($self._recipient_address_size)
		buffer += self._recipient_address.serialize()
		buffer += Converter::intToBytes($self.mosaic_id.size)  # mosaic_id_size
		buffer += self._mosaic_id.serialize()
		buffer += self._fee.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'transfer_fee_type: {self._transfer_fee_type.__str__()}, '
		result += f'recipient_address: {self._recipient_address.__str__()}, '
		result += f'mosaic_id: {self._mosaic_id.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += ')'
		return result
	}
}


class MosaicProperty {
	TYPE_HINTS = {
		'name': 'bytes_array',
		'value': 'bytes_array'
	}

	public function __construct(){
		self._name = bytes()
		self._value = bytes()
	}

	sort(){
		pass
	}

	name(){
		return self._name
	}

	value(){
		return self._value
	}

	name(value: bytes){
		self._name = value
	}

	value(value: bytes){
		self._value = value
	}

	size(){
		size = 0
		size += 4
		size += len(self._name)
		size += 4
		size += len(self._value)
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		name_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		name = ArrayHelpers.get_bytes(buffer, name_size)
		buffer = buffer[name_size:]
		value_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		value = ArrayHelpers.get_bytes(buffer, value_size)
		buffer = buffer[value_size:]

		instance = MosaicProperty()
		instance._name = name
		instance._value = value
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += Converter::intToBytes($len(self._name))  # name_size
		buffer += self._name
		buffer += Converter::intToBytes($len(self._value))  # value_size
		buffer += self._value
		return buffer
	}

	__str__(){
		result = '('
		result += f'name: {hexlify(self._name).decode("utf8")}, '
		result += f'value: {hexlify(self._value).decode("utf8")}, '
		result += ')'
		return result
	}
}


class SizePrefixedMosaicProperty {
	TYPE_HINTS = {
		'property_': 'struct:MosaicProperty'
	}

	public function __construct(){
		self._property_ = MosaicProperty()
	}

	sort(){
		self._property_.sort()
	}

	property_(){
		return self._property_
	}

	property_(value: MosaicProperty){
		self._property_ = value
	}

	size(){
		size = 0
		size += 4
		size += self.property_.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		property_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		# marking sizeof field
		property_ = MosaicProperty.deserialize(buffer[:property_size])
		buffer = buffer[property_.size:]

		instance = SizePrefixedMosaicProperty()
		instance._property_ = property_
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += Converter::intToBytes($self.property_.size)  # property_size
		buffer += self._property_.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'property_: {self._property_.__str__()}, '
		result += ')'
		return result
	}
}


class MosaicDefinition {
	TYPE_HINTS = {
		'owner_public_key': 'pod:PublicKey',
		'id': 'struct:MosaicId',
		'description': 'bytes_array',
		'properties': 'array[SizePrefixedMosaicProperty]',
		'levy': 'struct:MosaicLevy'
	}

	public function __construct(){
		self._owner_public_key = PublicKey()
		self._id = MosaicId()
		self._description = bytes()
		self._properties = []
		self._levy = None
		self._owner_public_key_size = 32  # reserved field
	}

	sort(){
		self._id.sort()
		if 0 != self.levy_size_computed:
			self._levy.sort()
	}

	owner_public_key(){
		return self._owner_public_key
	}

	id(){
		return self._id
	}

	description(){
		return self._description
	}

	properties(){
		return self._properties
	}

	levy(){
		return self._levy
	}

	levy_size_computed(){
		return 0 if not self.levy else self.levy.size + 0
	}

	owner_public_key(value: PublicKey){
		self._owner_public_key = value
	}

	id(value: MosaicId){
		self._id = value
	}

	description(value: bytes){
		self._description = value
	}

	properties(value: List[SizePrefixedMosaicProperty]){
		self._properties = value
	}

	levy(value: MosaicLevy){
		self._levy = value
	}

	size(){
		size = 0
		size += 4
		size += self.owner_public_key.size
		size += 4
		size += self.id.size
		size += 4
		size += len(self._description)
		size += 4
		size += ArrayHelpers.size(self.properties)
		size += 4
		if 0 != self.levy_size_computed:
			size += self.levy.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		owner_public_key_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert owner_public_key_size == 32, f'Invalid value of reserved field ({owner_public_key_size})'
		owner_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[owner_public_key.size:]
		id_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		# marking sizeof field
		id = MosaicId.deserialize(buffer[:id_size])
		buffer = buffer[id.size:]
		description_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		description = ArrayHelpers.get_bytes(buffer, description_size)
		buffer = buffer[description_size:]
		properties_count = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		properties = ArrayHelpers.read_array_count(buffer, SizePrefixedMosaicProperty, properties_count)
		buffer = buffer[ArrayHelpers.size(properties):]
		levy_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		levy = None
		if 0 != levy_size:
			levy = MosaicLevy.deserialize(buffer)
			buffer = buffer[levy.size:]

		instance = MosaicDefinition()
		instance._owner_public_key = owner_public_key
		instance._id = id
		instance._description = description
		instance._properties = properties
		instance._levy = levy
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += Converter::intToBytes($self._owner_public_key_size)
		buffer += self._owner_public_key.serialize()
		buffer += Converter::intToBytes($self.id.size)  # id_size
		buffer += self._id.serialize()
		buffer += Converter::intToBytes($len(self._description))  # description_size
		buffer += self._description
		buffer += Converter::intToBytes($len(self._properties))  # properties_count
		buffer += ArrayHelpers.write_array(self._properties)
		buffer += Converter::intToBytes($self.levy_size_computed)
		if 0 != self.levy_size_computed:
			buffer += self._levy.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'owner_public_key: {self._owner_public_key.__str__()}, '
		result += f'id: {self._id.__str__()}, '
		result += f'description: {hexlify(self._description).decode("utf8")}, '
		result += f'properties: {list(map(str, self._properties))}, '
		if 0 != self.levy_size_computed:
			result += f'levy: {self._levy.__str__()}, '
		result += ')'
		return result
	}
}


class MosaicDefinitionTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.MOSAIC_DEFINITION
	TYPE_HINTS = {
		'type_': 'enum:TransactionType',
		'network': 'enum:NetworkType',
		'timestamp': 'pod:Timestamp',
		'signer_public_key': 'pod:PublicKey',
		'signature': 'pod:Signature',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'mosaic_definition': 'struct:MosaicDefinition',
		'rental_fee_sink': 'pod:Address',
		'rental_fee': 'pod:Amount'
	}

	public function __construct(){
		self._type_ = MosaicDefinitionTransactionV1.TRANSACTION_TYPE
		self._version = MosaicDefinitionTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._timestamp = Timestamp()
		self._signer_public_key = PublicKey()
		self._signature = Signature()
		self._fee = Amount()
		self._deadline = Timestamp()
		self._mosaic_definition = MosaicDefinition()
		self._rental_fee_sink = Address()
		self._rental_fee = Amount()
		self._entity_body_reserved_1 = 0  # reserved field
		self._signer_public_key_size = 32  # reserved field
		self._signature_size = 64  # reserved field
		self._rental_fee_sink_size = 40  # reserved field
	}

	sort(){
		self._mosaic_definition.sort()
	}

	type_(){
		return self._type_
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	timestamp(){
		return self._timestamp
	}

	signer_public_key(){
		return self._signer_public_key
	}

	signature(){
		return self._signature
	}

	fee(){
		return self._fee
	}

	deadline(){
		return self._deadline
	}

	mosaic_definition(){
		return self._mosaic_definition
	}

	rental_fee_sink(){
		return self._rental_fee_sink
	}

	rental_fee(){
		return self._rental_fee
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	timestamp(value: Timestamp){
		self._timestamp = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	signature(value: Signature){
		self._signature = value
	}

	fee(value: Amount){
		self._fee = value
	}

	deadline(value: Timestamp){
		self._deadline = value
	}

	mosaic_definition(value: MosaicDefinition){
		self._mosaic_definition = value
	}

	rental_fee_sink(value: Address){
		self._rental_fee_sink = value
	}

	rental_fee(value: Amount){
		self._rental_fee = value
	}

	size(){
		size = 0
		size += self.type_.size
		size += 1
		size += 2
		size += self.network.size
		size += self.timestamp.size
		size += 4
		size += self.signer_public_key.size
		size += 4
		size += self.signature.size
		size += self.fee.size
		size += self.deadline.size
		size += 4
		size += self.mosaic_definition.size
		size += 4
		size += self.rental_fee_sink.size
		size += self.rental_fee.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[2:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		timestamp = Timestamp.deserialize(buffer)
		buffer = buffer[timestamp.size:]
		signer_public_key_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert signer_public_key_size == 32, f'Invalid value of reserved field ({signer_public_key_size})'
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		signature_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert signature_size == 64, f'Invalid value of reserved field ({signature_size})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		mosaic_definition_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		# marking sizeof field
		mosaic_definition = MosaicDefinition.deserialize(buffer[:mosaic_definition_size])
		buffer = buffer[mosaic_definition.size:]
		rental_fee_sink_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert rental_fee_sink_size == 40, f'Invalid value of reserved field ({rental_fee_sink_size})'
		rental_fee_sink = Address.deserialize(buffer)
		buffer = buffer[rental_fee_sink.size:]
		rental_fee = Amount.deserialize(buffer)
		buffer = buffer[rental_fee.size:]

		instance = MosaicDefinitionTransactionV1()
		instance._type_ = type_
		instance._version = version
		instance._network = network
		instance._timestamp = timestamp
		instance._signer_public_key = signer_public_key
		instance._signature = signature
		instance._fee = fee
		instance._deadline = deadline
		instance._mosaic_definition = mosaic_definition
		instance._rental_fee_sink = rental_fee_sink
		instance._rental_fee = rental_fee
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self._type_.serialize()
		buffer += Converter::intToBytes($self._version)
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += self._network.serialize()
		buffer += self._timestamp.serialize()
		buffer += Converter::intToBytes($self._signer_public_key_size)
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._signature_size)
		buffer += self._signature.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += Converter::intToBytes($self.mosaic_definition.size)  # mosaic_definition_size
		buffer += self._mosaic_definition.serialize()
		buffer += Converter::intToBytes($self._rental_fee_sink_size)
		buffer += self._rental_fee_sink.serialize()
		buffer += self._rental_fee.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'type_: {self._type_.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'timestamp: {self._timestamp.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'signature: {self._signature.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'mosaic_definition: {self._mosaic_definition.__str__()}, '
		result += f'rental_fee_sink: {self._rental_fee_sink.__str__()}, '
		result += f'rental_fee: {self._rental_fee.__str__()}, '
		result += ')'
		return result
	}
}


class NonVerifiableMosaicDefinitionTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.MOSAIC_DEFINITION
	TYPE_HINTS = {
		'type_': 'enum:TransactionType',
		'network': 'enum:NetworkType',
		'timestamp': 'pod:Timestamp',
		'signer_public_key': 'pod:PublicKey',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'mosaic_definition': 'struct:MosaicDefinition',
		'rental_fee_sink': 'pod:Address',
		'rental_fee': 'pod:Amount'
	}

	public function __construct(){
		self._type_ = NonVerifiableMosaicDefinitionTransactionV1.TRANSACTION_TYPE
		self._version = NonVerifiableMosaicDefinitionTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._timestamp = Timestamp()
		self._signer_public_key = PublicKey()
		self._fee = Amount()
		self._deadline = Timestamp()
		self._mosaic_definition = MosaicDefinition()
		self._rental_fee_sink = Address()
		self._rental_fee = Amount()
		self._entity_body_reserved_1 = 0  # reserved field
		self._signer_public_key_size = 32  # reserved field
		self._rental_fee_sink_size = 40  # reserved field
	}

	sort(){
		self._mosaic_definition.sort()
	}

	type_(){
		return self._type_
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	timestamp(){
		return self._timestamp
	}

	signer_public_key(){
		return self._signer_public_key
	}

	fee(){
		return self._fee
	}

	deadline(){
		return self._deadline
	}

	mosaic_definition(){
		return self._mosaic_definition
	}

	rental_fee_sink(){
		return self._rental_fee_sink
	}

	rental_fee(){
		return self._rental_fee
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	timestamp(value: Timestamp){
		self._timestamp = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	fee(value: Amount){
		self._fee = value
	}

	deadline(value: Timestamp){
		self._deadline = value
	}

	mosaic_definition(value: MosaicDefinition){
		self._mosaic_definition = value
	}

	rental_fee_sink(value: Address){
		self._rental_fee_sink = value
	}

	rental_fee(value: Amount){
		self._rental_fee = value
	}

	size(){
		size = 0
		size += self.type_.size
		size += 1
		size += 2
		size += self.network.size
		size += self.timestamp.size
		size += 4
		size += self.signer_public_key.size
		size += self.fee.size
		size += self.deadline.size
		size += 4
		size += self.mosaic_definition.size
		size += 4
		size += self.rental_fee_sink.size
		size += self.rental_fee.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[2:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		timestamp = Timestamp.deserialize(buffer)
		buffer = buffer[timestamp.size:]
		signer_public_key_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert signer_public_key_size == 32, f'Invalid value of reserved field ({signer_public_key_size})'
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		mosaic_definition_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		# marking sizeof field
		mosaic_definition = MosaicDefinition.deserialize(buffer[:mosaic_definition_size])
		buffer = buffer[mosaic_definition.size:]
		rental_fee_sink_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert rental_fee_sink_size == 40, f'Invalid value of reserved field ({rental_fee_sink_size})'
		rental_fee_sink = Address.deserialize(buffer)
		buffer = buffer[rental_fee_sink.size:]
		rental_fee = Amount.deserialize(buffer)
		buffer = buffer[rental_fee.size:]

		instance = NonVerifiableMosaicDefinitionTransactionV1()
		instance._type_ = type_
		instance._version = version
		instance._network = network
		instance._timestamp = timestamp
		instance._signer_public_key = signer_public_key
		instance._fee = fee
		instance._deadline = deadline
		instance._mosaic_definition = mosaic_definition
		instance._rental_fee_sink = rental_fee_sink
		instance._rental_fee = rental_fee
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self._type_.serialize()
		buffer += Converter::intToBytes($self._version)
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += self._network.serialize()
		buffer += self._timestamp.serialize()
		buffer += Converter::intToBytes($self._signer_public_key_size)
		buffer += self._signer_public_key.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += Converter::intToBytes($self.mosaic_definition.size)  # mosaic_definition_size
		buffer += self._mosaic_definition.serialize()
		buffer += Converter::intToBytes($self._rental_fee_sink_size)
		buffer += self._rental_fee_sink.serialize()
		buffer += self._rental_fee.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'type_: {self._type_.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'timestamp: {self._timestamp.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'mosaic_definition: {self._mosaic_definition.__str__()}, '
		result += f'rental_fee_sink: {self._rental_fee_sink.__str__()}, '
		result += f'rental_fee: {self._rental_fee.__str__()}, '
		result += ')'
		return result
	}
}


class MosaicSupplyChangeAction extends (Enum) {
	INCREASE = 1
	DECREASE = 2

	size(){
		return 4
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


class MosaicSupplyChangeTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.MOSAIC_SUPPLY_CHANGE
	TYPE_HINTS = {
		'type_': 'enum:TransactionType',
		'network': 'enum:NetworkType',
		'timestamp': 'pod:Timestamp',
		'signer_public_key': 'pod:PublicKey',
		'signature': 'pod:Signature',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'mosaic_id': 'struct:MosaicId',
		'action': 'enum:MosaicSupplyChangeAction',
		'delta': 'pod:Amount'
	}

	public function __construct(){
		self._type_ = MosaicSupplyChangeTransactionV1.TRANSACTION_TYPE
		self._version = MosaicSupplyChangeTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._timestamp = Timestamp()
		self._signer_public_key = PublicKey()
		self._signature = Signature()
		self._fee = Amount()
		self._deadline = Timestamp()
		self._mosaic_id = MosaicId()
		self._action = MosaicSupplyChangeAction.INCREASE
		self._delta = Amount()
		self._entity_body_reserved_1 = 0  # reserved field
		self._signer_public_key_size = 32  # reserved field
		self._signature_size = 64  # reserved field
	}

	sort(){
		self._mosaic_id.sort()
	}

	type_(){
		return self._type_
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	timestamp(){
		return self._timestamp
	}

	signer_public_key(){
		return self._signer_public_key
	}

	signature(){
		return self._signature
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

	action(){
		return self._action
	}

	delta(){
		return self._delta
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	timestamp(value: Timestamp){
		self._timestamp = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	signature(value: Signature){
		self._signature = value
	}

	fee(value: Amount){
		self._fee = value
	}

	deadline(value: Timestamp){
		self._deadline = value
	}

	mosaic_id(value: MosaicId){
		self._mosaic_id = value
	}

	action(value: MosaicSupplyChangeAction){
		self._action = value
	}

	delta(value: Amount){
		self._delta = value
	}

	size(){
		size = 0
		size += self.type_.size
		size += 1
		size += 2
		size += self.network.size
		size += self.timestamp.size
		size += 4
		size += self.signer_public_key.size
		size += 4
		size += self.signature.size
		size += self.fee.size
		size += self.deadline.size
		size += 4
		size += self.mosaic_id.size
		size += self.action.size
		size += self.delta.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[2:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		timestamp = Timestamp.deserialize(buffer)
		buffer = buffer[timestamp.size:]
		signer_public_key_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert signer_public_key_size == 32, f'Invalid value of reserved field ({signer_public_key_size})'
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		signature_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert signature_size == 64, f'Invalid value of reserved field ({signature_size})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		mosaic_id_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		# marking sizeof field
		mosaic_id = MosaicId.deserialize(buffer[:mosaic_id_size])
		buffer = buffer[mosaic_id.size:]
		action = MosaicSupplyChangeAction.deserialize(buffer)
		buffer = buffer[action.size:]
		delta = Amount.deserialize(buffer)
		buffer = buffer[delta.size:]

		instance = MosaicSupplyChangeTransactionV1()
		instance._type_ = type_
		instance._version = version
		instance._network = network
		instance._timestamp = timestamp
		instance._signer_public_key = signer_public_key
		instance._signature = signature
		instance._fee = fee
		instance._deadline = deadline
		instance._mosaic_id = mosaic_id
		instance._action = action
		instance._delta = delta
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self._type_.serialize()
		buffer += Converter::intToBytes($self._version)
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += self._network.serialize()
		buffer += self._timestamp.serialize()
		buffer += Converter::intToBytes($self._signer_public_key_size)
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._signature_size)
		buffer += self._signature.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += Converter::intToBytes($self.mosaic_id.size)  # mosaic_id_size
		buffer += self._mosaic_id.serialize()
		buffer += self._action.serialize()
		buffer += self._delta.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'type_: {self._type_.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'timestamp: {self._timestamp.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'signature: {self._signature.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'mosaic_id: {self._mosaic_id.__str__()}, '
		result += f'action: {self._action.__str__()}, '
		result += f'delta: {self._delta.__str__()}, '
		result += ')'
		return result
	}
}


class NonVerifiableMosaicSupplyChangeTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.MOSAIC_SUPPLY_CHANGE
	TYPE_HINTS = {
		'type_': 'enum:TransactionType',
		'network': 'enum:NetworkType',
		'timestamp': 'pod:Timestamp',
		'signer_public_key': 'pod:PublicKey',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'mosaic_id': 'struct:MosaicId',
		'action': 'enum:MosaicSupplyChangeAction',
		'delta': 'pod:Amount'
	}

	public function __construct(){
		self._type_ = NonVerifiableMosaicSupplyChangeTransactionV1.TRANSACTION_TYPE
		self._version = NonVerifiableMosaicSupplyChangeTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._timestamp = Timestamp()
		self._signer_public_key = PublicKey()
		self._fee = Amount()
		self._deadline = Timestamp()
		self._mosaic_id = MosaicId()
		self._action = MosaicSupplyChangeAction.INCREASE
		self._delta = Amount()
		self._entity_body_reserved_1 = 0  # reserved field
		self._signer_public_key_size = 32  # reserved field
	}

	sort(){
		self._mosaic_id.sort()
	}

	type_(){
		return self._type_
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	timestamp(){
		return self._timestamp
	}

	signer_public_key(){
		return self._signer_public_key
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

	action(){
		return self._action
	}

	delta(){
		return self._delta
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	timestamp(value: Timestamp){
		self._timestamp = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	fee(value: Amount){
		self._fee = value
	}

	deadline(value: Timestamp){
		self._deadline = value
	}

	mosaic_id(value: MosaicId){
		self._mosaic_id = value
	}

	action(value: MosaicSupplyChangeAction){
		self._action = value
	}

	delta(value: Amount){
		self._delta = value
	}

	size(){
		size = 0
		size += self.type_.size
		size += 1
		size += 2
		size += self.network.size
		size += self.timestamp.size
		size += 4
		size += self.signer_public_key.size
		size += self.fee.size
		size += self.deadline.size
		size += 4
		size += self.mosaic_id.size
		size += self.action.size
		size += self.delta.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[2:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		timestamp = Timestamp.deserialize(buffer)
		buffer = buffer[timestamp.size:]
		signer_public_key_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert signer_public_key_size == 32, f'Invalid value of reserved field ({signer_public_key_size})'
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		mosaic_id_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		# marking sizeof field
		mosaic_id = MosaicId.deserialize(buffer[:mosaic_id_size])
		buffer = buffer[mosaic_id.size:]
		action = MosaicSupplyChangeAction.deserialize(buffer)
		buffer = buffer[action.size:]
		delta = Amount.deserialize(buffer)
		buffer = buffer[delta.size:]

		instance = NonVerifiableMosaicSupplyChangeTransactionV1()
		instance._type_ = type_
		instance._version = version
		instance._network = network
		instance._timestamp = timestamp
		instance._signer_public_key = signer_public_key
		instance._fee = fee
		instance._deadline = deadline
		instance._mosaic_id = mosaic_id
		instance._action = action
		instance._delta = delta
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self._type_.serialize()
		buffer += Converter::intToBytes($self._version)
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += self._network.serialize()
		buffer += self._timestamp.serialize()
		buffer += Converter::intToBytes($self._signer_public_key_size)
		buffer += self._signer_public_key.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += Converter::intToBytes($self.mosaic_id.size)  # mosaic_id_size
		buffer += self._mosaic_id.serialize()
		buffer += self._action.serialize()
		buffer += self._delta.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'type_: {self._type_.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'timestamp: {self._timestamp.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'mosaic_id: {self._mosaic_id.__str__()}, '
		result += f'action: {self._action.__str__()}, '
		result += f'delta: {self._delta.__str__()}, '
		result += ')'
		return result
	}
}


class MultisigAccountModificationType extends (Enum) {
	ADD_COSIGNATORY = 1
	DELETE_COSIGNATORY = 2

	size(){
		return 4
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		return MultisigAccountModificationType(Converter::bytesToInt(byteArray))
	}

	public function serialize(){
		buffer = bytes()
		buffer += Converter::intToBytes($self.value)
		return buffer
	}
}


class MultisigAccountModification {
	TYPE_HINTS = {
		'modification_type': 'enum:MultisigAccountModificationType',
		'cosignatory_public_key': 'pod:PublicKey'
	}

	public function __construct(){
		self._modification_type = MultisigAccountModificationType.ADD_COSIGNATORY
		self._cosignatory_public_key = PublicKey()
		self._cosignatory_public_key_size = 32  # reserved field
	}

	comparer(){
		from ..Transforms import ripemd_keccak_256  # pylint: disable=import-outside-toplevel

		return (
			self.modification_type if not isinstance(self.modification_type, Enum) else self.modification_type.value,
			ripemd_keccak_256(self.cosignatory_public_key.bytes),
		)
	}

	sort(){
		pass
	}

	modification_type(){
		return self._modification_type
	}

	cosignatory_public_key(){
		return self._cosignatory_public_key
	}

	modification_type(value: MultisigAccountModificationType){
		self._modification_type = value
	}

	cosignatory_public_key(value: PublicKey){
		self._cosignatory_public_key = value
	}

	size(){
		size = 0
		size += self.modification_type.size
		size += 4
		size += self.cosignatory_public_key.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		modification_type = MultisigAccountModificationType.deserialize(buffer)
		buffer = buffer[modification_type.size:]
		cosignatory_public_key_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert cosignatory_public_key_size == 32, f'Invalid value of reserved field ({cosignatory_public_key_size})'
		cosignatory_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[cosignatory_public_key.size:]

		instance = MultisigAccountModification()
		instance._modification_type = modification_type
		instance._cosignatory_public_key = cosignatory_public_key
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self._modification_type.serialize()
		buffer += Converter::intToBytes($self._cosignatory_public_key_size)
		buffer += self._cosignatory_public_key.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'modification_type: {self._modification_type.__str__()}, '
		result += f'cosignatory_public_key: {self._cosignatory_public_key.__str__()}, '
		result += ')'
		return result
	}
}


class SizePrefixedMultisigAccountModification {
	TYPE_HINTS = {
		'modification': 'struct:MultisigAccountModification'
	}

	public function __construct(){
		self._modification = MultisigAccountModification()
	}

	sort(){
		self._modification.sort()
	}

	modification(){
		return self._modification
	}

	modification(value: MultisigAccountModification){
		self._modification = value
	}

	size(){
		size = 0
		size += 4
		size += self.modification.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		modification_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		# marking sizeof field
		modification = MultisigAccountModification.deserialize(buffer[:modification_size])
		buffer = buffer[modification.size:]

		instance = SizePrefixedMultisigAccountModification()
		instance._modification = modification
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += Converter::intToBytes($self.modification.size)  # modification_size
		buffer += self._modification.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'modification: {self._modification.__str__()}, '
		result += ')'
		return result
	}
}


class MultisigAccountModificationTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.MULTISIG_ACCOUNT_MODIFICATION
	TYPE_HINTS = {
		'type_': 'enum:TransactionType',
		'network': 'enum:NetworkType',
		'timestamp': 'pod:Timestamp',
		'signer_public_key': 'pod:PublicKey',
		'signature': 'pod:Signature',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'modifications': 'array[SizePrefixedMultisigAccountModification]'
	}

	public function __construct(){
		self._type_ = MultisigAccountModificationTransactionV1.TRANSACTION_TYPE
		self._version = MultisigAccountModificationTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._timestamp = Timestamp()
		self._signer_public_key = PublicKey()
		self._signature = Signature()
		self._fee = Amount()
		self._deadline = Timestamp()
		self._modifications = []
		self._entity_body_reserved_1 = 0  # reserved field
		self._signer_public_key_size = 32  # reserved field
		self._signature_size = 64  # reserved field
	}

	sort(){
		self._modifications = sorted(self._modifications, key=lambda e: e.modification.comparer() if hasattr(e.modification, 'comparer') else e.modification)
	}

	type_(){
		return self._type_
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	timestamp(){
		return self._timestamp
	}

	signer_public_key(){
		return self._signer_public_key
	}

	signature(){
		return self._signature
	}

	fee(){
		return self._fee
	}

	deadline(){
		return self._deadline
	}

	modifications(){
		return self._modifications
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	timestamp(value: Timestamp){
		self._timestamp = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	signature(value: Signature){
		self._signature = value
	}

	fee(value: Amount){
		self._fee = value
	}

	deadline(value: Timestamp){
		self._deadline = value
	}

	modifications(value: List[SizePrefixedMultisigAccountModification]){
		self._modifications = value
	}

	size(){
		size = 0
		size += self.type_.size
		size += 1
		size += 2
		size += self.network.size
		size += self.timestamp.size
		size += 4
		size += self.signer_public_key.size
		size += 4
		size += self.signature.size
		size += self.fee.size
		size += self.deadline.size
		size += 4
		size += ArrayHelpers.size(self.modifications)
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[2:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		timestamp = Timestamp.deserialize(buffer)
		buffer = buffer[timestamp.size:]
		signer_public_key_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert signer_public_key_size == 32, f'Invalid value of reserved field ({signer_public_key_size})'
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		signature_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert signature_size == 64, f'Invalid value of reserved field ({signature_size})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		modifications_count = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		modifications = ArrayHelpers.read_array_count(buffer, SizePrefixedMultisigAccountModification, modifications_count, lambda e: e.modification.comparer() if hasattr(e.modification, 'comparer') else e.modification)
		buffer = buffer[ArrayHelpers.size(modifications):]

		instance = MultisigAccountModificationTransactionV1()
		instance._type_ = type_
		instance._version = version
		instance._network = network
		instance._timestamp = timestamp
		instance._signer_public_key = signer_public_key
		instance._signature = signature
		instance._fee = fee
		instance._deadline = deadline
		instance._modifications = modifications
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self._type_.serialize()
		buffer += Converter::intToBytes($self._version)
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += self._network.serialize()
		buffer += self._timestamp.serialize()
		buffer += Converter::intToBytes($self._signer_public_key_size)
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._signature_size)
		buffer += self._signature.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += Converter::intToBytes($len(self._modifications))  # modifications_count
		buffer += ArrayHelpers.write_array(self._modifications, lambda e: e.modification.comparer() if hasattr(e.modification, 'comparer') else e.modification)
		return buffer
	}

	__str__(){
		result = '('
		result += f'type_: {self._type_.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'timestamp: {self._timestamp.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'signature: {self._signature.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'modifications: {list(map(str, self._modifications))}, '
		result += ')'
		return result
	}
}


class NonVerifiableMultisigAccountModificationTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.MULTISIG_ACCOUNT_MODIFICATION
	TYPE_HINTS = {
		'type_': 'enum:TransactionType',
		'network': 'enum:NetworkType',
		'timestamp': 'pod:Timestamp',
		'signer_public_key': 'pod:PublicKey',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'modifications': 'array[SizePrefixedMultisigAccountModification]'
	}

	public function __construct(){
		self._type_ = NonVerifiableMultisigAccountModificationTransactionV1.TRANSACTION_TYPE
		self._version = NonVerifiableMultisigAccountModificationTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._timestamp = Timestamp()
		self._signer_public_key = PublicKey()
		self._fee = Amount()
		self._deadline = Timestamp()
		self._modifications = []
		self._entity_body_reserved_1 = 0  # reserved field
		self._signer_public_key_size = 32  # reserved field
	}

	sort(){
		self._modifications = sorted(self._modifications, key=lambda e: e.modification.comparer() if hasattr(e.modification, 'comparer') else e.modification)
	}

	type_(){
		return self._type_
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	timestamp(){
		return self._timestamp
	}

	signer_public_key(){
		return self._signer_public_key
	}

	fee(){
		return self._fee
	}

	deadline(){
		return self._deadline
	}

	modifications(){
		return self._modifications
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	timestamp(value: Timestamp){
		self._timestamp = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	fee(value: Amount){
		self._fee = value
	}

	deadline(value: Timestamp){
		self._deadline = value
	}

	modifications(value: List[SizePrefixedMultisigAccountModification]){
		self._modifications = value
	}

	size(){
		size = 0
		size += self.type_.size
		size += 1
		size += 2
		size += self.network.size
		size += self.timestamp.size
		size += 4
		size += self.signer_public_key.size
		size += self.fee.size
		size += self.deadline.size
		size += 4
		size += ArrayHelpers.size(self.modifications)
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[2:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		timestamp = Timestamp.deserialize(buffer)
		buffer = buffer[timestamp.size:]
		signer_public_key_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert signer_public_key_size == 32, f'Invalid value of reserved field ({signer_public_key_size})'
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		modifications_count = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		modifications = ArrayHelpers.read_array_count(buffer, SizePrefixedMultisigAccountModification, modifications_count, lambda e: e.modification.comparer() if hasattr(e.modification, 'comparer') else e.modification)
		buffer = buffer[ArrayHelpers.size(modifications):]

		instance = NonVerifiableMultisigAccountModificationTransactionV1()
		instance._type_ = type_
		instance._version = version
		instance._network = network
		instance._timestamp = timestamp
		instance._signer_public_key = signer_public_key
		instance._fee = fee
		instance._deadline = deadline
		instance._modifications = modifications
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self._type_.serialize()
		buffer += Converter::intToBytes($self._version)
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += self._network.serialize()
		buffer += self._timestamp.serialize()
		buffer += Converter::intToBytes($self._signer_public_key_size)
		buffer += self._signer_public_key.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += Converter::intToBytes($len(self._modifications))  # modifications_count
		buffer += ArrayHelpers.write_array(self._modifications, lambda e: e.modification.comparer() if hasattr(e.modification, 'comparer') else e.modification)
		return buffer
	}

	__str__(){
		result = '('
		result += f'type_: {self._type_.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'timestamp: {self._timestamp.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'modifications: {list(map(str, self._modifications))}, '
		result += ')'
		return result
	}
}


class MultisigAccountModificationTransactionV2 {
	TRANSACTION_VERSION: int = 2
	TRANSACTION_TYPE: TransactionType = TransactionType.MULTISIG_ACCOUNT_MODIFICATION
	TYPE_HINTS = {
		'type_': 'enum:TransactionType',
		'network': 'enum:NetworkType',
		'timestamp': 'pod:Timestamp',
		'signer_public_key': 'pod:PublicKey',
		'signature': 'pod:Signature',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'modifications': 'array[SizePrefixedMultisigAccountModification]'
	}

	public function __construct(){
		self._type_ = MultisigAccountModificationTransactionV2.TRANSACTION_TYPE
		self._version = MultisigAccountModificationTransactionV2.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._timestamp = Timestamp()
		self._signer_public_key = PublicKey()
		self._signature = Signature()
		self._fee = Amount()
		self._deadline = Timestamp()
		self._modifications = []
		self._min_approval_delta = 0
		self._entity_body_reserved_1 = 0  # reserved field
		self._signer_public_key_size = 32  # reserved field
		self._signature_size = 64  # reserved field
		self._min_approval_delta_size = 4  # reserved field
	}

	sort(){
		self._modifications = sorted(self._modifications, key=lambda e: e.modification.comparer() if hasattr(e.modification, 'comparer') else e.modification)
	}

	type_(){
		return self._type_
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	timestamp(){
		return self._timestamp
	}

	signer_public_key(){
		return self._signer_public_key
	}

	signature(){
		return self._signature
	}

	fee(){
		return self._fee
	}

	deadline(){
		return self._deadline
	}

	modifications(){
		return self._modifications
	}

	min_approval_delta(){
		return self._min_approval_delta
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	timestamp(value: Timestamp){
		self._timestamp = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	signature(value: Signature){
		self._signature = value
	}

	fee(value: Amount){
		self._fee = value
	}

	deadline(value: Timestamp){
		self._deadline = value
	}

	modifications(value: List[SizePrefixedMultisigAccountModification]){
		self._modifications = value
	}

	min_approval_delta(value: int){
		self._min_approval_delta = value
	}

	size(){
		size = 0
		size += self.type_.size
		size += 1
		size += 2
		size += self.network.size
		size += self.timestamp.size
		size += 4
		size += self.signer_public_key.size
		size += 4
		size += self.signature.size
		size += self.fee.size
		size += self.deadline.size
		size += 4
		size += ArrayHelpers.size(self.modifications)
		size += 4
		size += 4
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[2:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		timestamp = Timestamp.deserialize(buffer)
		buffer = buffer[timestamp.size:]
		signer_public_key_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert signer_public_key_size == 32, f'Invalid value of reserved field ({signer_public_key_size})'
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		signature_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert signature_size == 64, f'Invalid value of reserved field ({signature_size})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		modifications_count = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		modifications = ArrayHelpers.read_array_count(buffer, SizePrefixedMultisigAccountModification, modifications_count, lambda e: e.modification.comparer() if hasattr(e.modification, 'comparer') else e.modification)
		buffer = buffer[ArrayHelpers.size(modifications):]
		min_approval_delta_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert min_approval_delta_size == 4, f'Invalid value of reserved field ({min_approval_delta_size})'
		min_approval_delta = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]

		instance = MultisigAccountModificationTransactionV2()
		instance._type_ = type_
		instance._version = version
		instance._network = network
		instance._timestamp = timestamp
		instance._signer_public_key = signer_public_key
		instance._signature = signature
		instance._fee = fee
		instance._deadline = deadline
		instance._modifications = modifications
		instance._min_approval_delta = min_approval_delta
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self._type_.serialize()
		buffer += Converter::intToBytes($self._version)
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += self._network.serialize()
		buffer += self._timestamp.serialize()
		buffer += Converter::intToBytes($self._signer_public_key_size)
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._signature_size)
		buffer += self._signature.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += Converter::intToBytes($len(self._modifications))  # modifications_count
		buffer += ArrayHelpers.write_array(self._modifications, lambda e: e.modification.comparer() if hasattr(e.modification, 'comparer') else e.modification)
		buffer += Converter::intToBytes($self._min_approval_delta_size)
		buffer += Converter::intToBytes($self._min_approval_delta)
		return buffer
	}

	__str__(){
		result = '('
		result += f'type_: {self._type_.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'timestamp: {self._timestamp.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'signature: {self._signature.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'modifications: {list(map(str, self._modifications))}, '
		result += f'min_approval_delta: 0x{self._min_approval_delta:X}, '
		result += ')'
		return result
	}
}


class NonVerifiableMultisigAccountModificationTransactionV2 {
	TRANSACTION_VERSION: int = 2
	TRANSACTION_TYPE: TransactionType = TransactionType.MULTISIG_ACCOUNT_MODIFICATION
	TYPE_HINTS = {
		'type_': 'enum:TransactionType',
		'network': 'enum:NetworkType',
		'timestamp': 'pod:Timestamp',
		'signer_public_key': 'pod:PublicKey',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'modifications': 'array[SizePrefixedMultisigAccountModification]'
	}

	public function __construct(){
		self._type_ = NonVerifiableMultisigAccountModificationTransactionV2.TRANSACTION_TYPE
		self._version = NonVerifiableMultisigAccountModificationTransactionV2.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._timestamp = Timestamp()
		self._signer_public_key = PublicKey()
		self._fee = Amount()
		self._deadline = Timestamp()
		self._modifications = []
		self._min_approval_delta = 0
		self._entity_body_reserved_1 = 0  # reserved field
		self._signer_public_key_size = 32  # reserved field
		self._min_approval_delta_size = 4  # reserved field
	}

	sort(){
		self._modifications = sorted(self._modifications, key=lambda e: e.modification.comparer() if hasattr(e.modification, 'comparer') else e.modification)
	}

	type_(){
		return self._type_
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	timestamp(){
		return self._timestamp
	}

	signer_public_key(){
		return self._signer_public_key
	}

	fee(){
		return self._fee
	}

	deadline(){
		return self._deadline
	}

	modifications(){
		return self._modifications
	}

	min_approval_delta(){
		return self._min_approval_delta
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	timestamp(value: Timestamp){
		self._timestamp = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	fee(value: Amount){
		self._fee = value
	}

	deadline(value: Timestamp){
		self._deadline = value
	}

	modifications(value: List[SizePrefixedMultisigAccountModification]){
		self._modifications = value
	}

	min_approval_delta(value: int){
		self._min_approval_delta = value
	}

	size(){
		size = 0
		size += self.type_.size
		size += 1
		size += 2
		size += self.network.size
		size += self.timestamp.size
		size += 4
		size += self.signer_public_key.size
		size += self.fee.size
		size += self.deadline.size
		size += 4
		size += ArrayHelpers.size(self.modifications)
		size += 4
		size += 4
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[2:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		timestamp = Timestamp.deserialize(buffer)
		buffer = buffer[timestamp.size:]
		signer_public_key_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert signer_public_key_size == 32, f'Invalid value of reserved field ({signer_public_key_size})'
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		modifications_count = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		modifications = ArrayHelpers.read_array_count(buffer, SizePrefixedMultisigAccountModification, modifications_count, lambda e: e.modification.comparer() if hasattr(e.modification, 'comparer') else e.modification)
		buffer = buffer[ArrayHelpers.size(modifications):]
		min_approval_delta_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert min_approval_delta_size == 4, f'Invalid value of reserved field ({min_approval_delta_size})'
		min_approval_delta = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]

		instance = NonVerifiableMultisigAccountModificationTransactionV2()
		instance._type_ = type_
		instance._version = version
		instance._network = network
		instance._timestamp = timestamp
		instance._signer_public_key = signer_public_key
		instance._fee = fee
		instance._deadline = deadline
		instance._modifications = modifications
		instance._min_approval_delta = min_approval_delta
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self._type_.serialize()
		buffer += Converter::intToBytes($self._version)
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += self._network.serialize()
		buffer += self._timestamp.serialize()
		buffer += Converter::intToBytes($self._signer_public_key_size)
		buffer += self._signer_public_key.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += Converter::intToBytes($len(self._modifications))  # modifications_count
		buffer += ArrayHelpers.write_array(self._modifications, lambda e: e.modification.comparer() if hasattr(e.modification, 'comparer') else e.modification)
		buffer += Converter::intToBytes($self._min_approval_delta_size)
		buffer += Converter::intToBytes($self._min_approval_delta)
		return buffer
	}

	__str__(){
		result = '('
		result += f'type_: {self._type_.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'timestamp: {self._timestamp.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'modifications: {list(map(str, self._modifications))}, '
		result += f'min_approval_delta: 0x{self._min_approval_delta:X}, '
		result += ')'
		return result
	}
}


class CosignatureV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.MULTISIG_COSIGNATURE
	TYPE_HINTS = {
		'type_': 'enum:TransactionType',
		'network': 'enum:NetworkType',
		'timestamp': 'pod:Timestamp',
		'signer_public_key': 'pod:PublicKey',
		'signature': 'pod:Signature',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'multisig_transaction_hash': 'pod:Hash256',
		'multisig_account_address': 'pod:Address'
	}

	public function __construct(){
		self._type_ = CosignatureV1.TRANSACTION_TYPE
		self._version = CosignatureV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._timestamp = Timestamp()
		self._signer_public_key = PublicKey()
		self._signature = Signature()
		self._fee = Amount()
		self._deadline = Timestamp()
		self._multisig_transaction_hash = Hash256()
		self._multisig_account_address = Address()
		self._entity_body_reserved_1 = 0  # reserved field
		self._signer_public_key_size = 32  # reserved field
		self._signature_size = 64  # reserved field
		self._multisig_transaction_hash_outer_size = 36  # reserved field
		self._multisig_transaction_hash_size = 32  # reserved field
		self._multisig_account_address_size = 40  # reserved field
	}

	sort(){
		pass
	}

	type_(){
		return self._type_
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	timestamp(){
		return self._timestamp
	}

	signer_public_key(){
		return self._signer_public_key
	}

	signature(){
		return self._signature
	}

	fee(){
		return self._fee
	}

	deadline(){
		return self._deadline
	}

	multisig_transaction_hash(){
		return self._multisig_transaction_hash
	}

	multisig_account_address(){
		return self._multisig_account_address
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	timestamp(value: Timestamp){
		self._timestamp = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	signature(value: Signature){
		self._signature = value
	}

	fee(value: Amount){
		self._fee = value
	}

	deadline(value: Timestamp){
		self._deadline = value
	}

	multisig_transaction_hash(value: Hash256){
		self._multisig_transaction_hash = value
	}

	multisig_account_address(value: Address){
		self._multisig_account_address = value
	}

	size(){
		size = 0
		size += self.type_.size
		size += 1
		size += 2
		size += self.network.size
		size += self.timestamp.size
		size += 4
		size += self.signer_public_key.size
		size += 4
		size += self.signature.size
		size += self.fee.size
		size += self.deadline.size
		size += 4
		size += 4
		size += self.multisig_transaction_hash.size
		size += 4
		size += self.multisig_account_address.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[2:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		timestamp = Timestamp.deserialize(buffer)
		buffer = buffer[timestamp.size:]
		signer_public_key_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert signer_public_key_size == 32, f'Invalid value of reserved field ({signer_public_key_size})'
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		signature_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert signature_size == 64, f'Invalid value of reserved field ({signature_size})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		multisig_transaction_hash_outer_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert multisig_transaction_hash_outer_size == 36, f'Invalid value of reserved field ({multisig_transaction_hash_outer_size})'
		multisig_transaction_hash_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert multisig_transaction_hash_size == 32, f'Invalid value of reserved field ({multisig_transaction_hash_size})'
		multisig_transaction_hash = Hash256.deserialize(buffer)
		buffer = buffer[multisig_transaction_hash.size:]
		multisig_account_address_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert multisig_account_address_size == 40, f'Invalid value of reserved field ({multisig_account_address_size})'
		multisig_account_address = Address.deserialize(buffer)
		buffer = buffer[multisig_account_address.size:]

		instance = CosignatureV1()
		instance._type_ = type_
		instance._version = version
		instance._network = network
		instance._timestamp = timestamp
		instance._signer_public_key = signer_public_key
		instance._signature = signature
		instance._fee = fee
		instance._deadline = deadline
		instance._multisig_transaction_hash = multisig_transaction_hash
		instance._multisig_account_address = multisig_account_address
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self._type_.serialize()
		buffer += Converter::intToBytes($self._version)
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += self._network.serialize()
		buffer += self._timestamp.serialize()
		buffer += Converter::intToBytes($self._signer_public_key_size)
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._signature_size)
		buffer += self._signature.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += Converter::intToBytes($self._multisig_transaction_hash_outer_size)
		buffer += Converter::intToBytes($self._multisig_transaction_hash_size)
		buffer += self._multisig_transaction_hash.serialize()
		buffer += Converter::intToBytes($self._multisig_account_address_size)
		buffer += self._multisig_account_address.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'type_: {self._type_.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'timestamp: {self._timestamp.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'signature: {self._signature.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'multisig_transaction_hash: {self._multisig_transaction_hash.__str__()}, '
		result += f'multisig_account_address: {self._multisig_account_address.__str__()}, '
		result += ')'
		return result
	}
}


class SizePrefixedCosignatureV1 {
	TYPE_HINTS = {
		'cosignature': 'struct:CosignatureV1'
	}

	public function __construct(){
		self._cosignature = CosignatureV1()
	}

	sort(){
		self._cosignature.sort()
	}

	cosignature(){
		return self._cosignature
	}

	cosignature(value: CosignatureV1){
		self._cosignature = value
	}

	size(){
		size = 0
		size += 4
		size += self.cosignature.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		cosignature_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		# marking sizeof field
		cosignature = CosignatureV1.deserialize(buffer[:cosignature_size])
		buffer = buffer[cosignature.size:]

		instance = SizePrefixedCosignatureV1()
		instance._cosignature = cosignature
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += Converter::intToBytes($self.cosignature.size)  # cosignature_size
		buffer += self._cosignature.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'cosignature: {self._cosignature.__str__()}, '
		result += ')'
		return result
	}
}


class MultisigTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.MULTISIG
	TYPE_HINTS = {
		'type_': 'enum:TransactionType',
		'network': 'enum:NetworkType',
		'timestamp': 'pod:Timestamp',
		'signer_public_key': 'pod:PublicKey',
		'signature': 'pod:Signature',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'inner_transaction': 'struct:NonVerifiableTransaction',
		'cosignatures': 'array[SizePrefixedCosignatureV1]'
	}

	public function __construct(){
		self._type_ = MultisigTransactionV1.TRANSACTION_TYPE
		self._version = MultisigTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._timestamp = Timestamp()
		self._signer_public_key = PublicKey()
		self._signature = Signature()
		self._fee = Amount()
		self._deadline = Timestamp()
		self._inner_transaction = NonVerifiableTransaction()
		self._cosignatures = []
		self._entity_body_reserved_1 = 0  # reserved field
		self._signer_public_key_size = 32  # reserved field
		self._signature_size = 64  # reserved field
	}

	sort(){
		self._inner_transaction.sort()
	}

	type_(){
		return self._type_
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	timestamp(){
		return self._timestamp
	}

	signer_public_key(){
		return self._signer_public_key
	}

	signature(){
		return self._signature
	}

	fee(){
		return self._fee
	}

	deadline(){
		return self._deadline
	}

	inner_transaction(){
		return self._inner_transaction
	}

	cosignatures(){
		return self._cosignatures
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	timestamp(value: Timestamp){
		self._timestamp = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	signature(value: Signature){
		self._signature = value
	}

	fee(value: Amount){
		self._fee = value
	}

	deadline(value: Timestamp){
		self._deadline = value
	}

	inner_transaction(value: NonVerifiableTransaction){
		self._inner_transaction = value
	}

	cosignatures(value: List[SizePrefixedCosignatureV1]){
		self._cosignatures = value
	}

	size(){
		size = 0
		size += self.type_.size
		size += 1
		size += 2
		size += self.network.size
		size += self.timestamp.size
		size += 4
		size += self.signer_public_key.size
		size += 4
		size += self.signature.size
		size += self.fee.size
		size += self.deadline.size
		size += 4
		size += self.inner_transaction.size
		size += 4
		size += ArrayHelpers.size(self.cosignatures)
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[2:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		timestamp = Timestamp.deserialize(buffer)
		buffer = buffer[timestamp.size:]
		signer_public_key_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert signer_public_key_size == 32, f'Invalid value of reserved field ({signer_public_key_size})'
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		signature_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert signature_size == 64, f'Invalid value of reserved field ({signature_size})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		inner_transaction_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		# marking sizeof field
		inner_transaction = NonVerifiableTransactionFactory.deserialize(buffer[:inner_transaction_size])
		buffer = buffer[inner_transaction.size:]
		cosignatures_count = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		cosignatures = ArrayHelpers.read_array_count(buffer, SizePrefixedCosignatureV1, cosignatures_count)
		buffer = buffer[ArrayHelpers.size(cosignatures):]

		instance = MultisigTransactionV1()
		instance._type_ = type_
		instance._version = version
		instance._network = network
		instance._timestamp = timestamp
		instance._signer_public_key = signer_public_key
		instance._signature = signature
		instance._fee = fee
		instance._deadline = deadline
		instance._inner_transaction = inner_transaction
		instance._cosignatures = cosignatures
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self._type_.serialize()
		buffer += Converter::intToBytes($self._version)
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += self._network.serialize()
		buffer += self._timestamp.serialize()
		buffer += Converter::intToBytes($self._signer_public_key_size)
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._signature_size)
		buffer += self._signature.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += Converter::intToBytes($self.inner_transaction.size)  # inner_transaction_size
		buffer += self._inner_transaction.serialize()
		buffer += Converter::intToBytes($len(self._cosignatures))  # cosignatures_count
		buffer += ArrayHelpers.write_array(self._cosignatures)
		return buffer
	}

	__str__(){
		result = '('
		result += f'type_: {self._type_.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'timestamp: {self._timestamp.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'signature: {self._signature.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'inner_transaction: {self._inner_transaction.__str__()}, '
		result += f'cosignatures: {list(map(str, self._cosignatures))}, '
		result += ')'
		return result
	}
}


class NonVerifiableMultisigTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.MULTISIG
	TYPE_HINTS = {
		'type_': 'enum:TransactionType',
		'network': 'enum:NetworkType',
		'timestamp': 'pod:Timestamp',
		'signer_public_key': 'pod:PublicKey',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'inner_transaction': 'struct:NonVerifiableTransaction'
	}

	public function __construct(){
		self._type_ = NonVerifiableMultisigTransactionV1.TRANSACTION_TYPE
		self._version = NonVerifiableMultisigTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._timestamp = Timestamp()
		self._signer_public_key = PublicKey()
		self._fee = Amount()
		self._deadline = Timestamp()
		self._inner_transaction = NonVerifiableTransaction()
		self._entity_body_reserved_1 = 0  # reserved field
		self._signer_public_key_size = 32  # reserved field
	}

	sort(){
		self._inner_transaction.sort()
	}

	type_(){
		return self._type_
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	timestamp(){
		return self._timestamp
	}

	signer_public_key(){
		return self._signer_public_key
	}

	fee(){
		return self._fee
	}

	deadline(){
		return self._deadline
	}

	inner_transaction(){
		return self._inner_transaction
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	timestamp(value: Timestamp){
		self._timestamp = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	fee(value: Amount){
		self._fee = value
	}

	deadline(value: Timestamp){
		self._deadline = value
	}

	inner_transaction(value: NonVerifiableTransaction){
		self._inner_transaction = value
	}

	size(){
		size = 0
		size += self.type_.size
		size += 1
		size += 2
		size += self.network.size
		size += self.timestamp.size
		size += 4
		size += self.signer_public_key.size
		size += self.fee.size
		size += self.deadline.size
		size += 4
		size += self.inner_transaction.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[2:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		timestamp = Timestamp.deserialize(buffer)
		buffer = buffer[timestamp.size:]
		signer_public_key_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert signer_public_key_size == 32, f'Invalid value of reserved field ({signer_public_key_size})'
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		inner_transaction_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		# marking sizeof field
		inner_transaction = NonVerifiableTransactionFactory.deserialize(buffer[:inner_transaction_size])
		buffer = buffer[inner_transaction.size:]

		instance = NonVerifiableMultisigTransactionV1()
		instance._type_ = type_
		instance._version = version
		instance._network = network
		instance._timestamp = timestamp
		instance._signer_public_key = signer_public_key
		instance._fee = fee
		instance._deadline = deadline
		instance._inner_transaction = inner_transaction
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self._type_.serialize()
		buffer += Converter::intToBytes($self._version)
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += self._network.serialize()
		buffer += self._timestamp.serialize()
		buffer += Converter::intToBytes($self._signer_public_key_size)
		buffer += self._signer_public_key.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += Converter::intToBytes($self.inner_transaction.size)  # inner_transaction_size
		buffer += self._inner_transaction.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'type_: {self._type_.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'timestamp: {self._timestamp.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'inner_transaction: {self._inner_transaction.__str__()}, '
		result += ')'
		return result
	}
}


class NamespaceRegistrationTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.NAMESPACE_REGISTRATION
	TYPE_HINTS = {
		'type_': 'enum:TransactionType',
		'network': 'enum:NetworkType',
		'timestamp': 'pod:Timestamp',
		'signer_public_key': 'pod:PublicKey',
		'signature': 'pod:Signature',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'rental_fee_sink': 'pod:Address',
		'rental_fee': 'pod:Amount',
		'name': 'bytes_array',
		'parent_name': 'bytes_array'
	}

	public function __construct(){
		self._type_ = NamespaceRegistrationTransactionV1.TRANSACTION_TYPE
		self._version = NamespaceRegistrationTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._timestamp = Timestamp()
		self._signer_public_key = PublicKey()
		self._signature = Signature()
		self._fee = Amount()
		self._deadline = Timestamp()
		self._rental_fee_sink = Address()
		self._rental_fee = Amount()
		self._name = bytes()
		self._parent_name = None
		self._entity_body_reserved_1 = 0  # reserved field
		self._signer_public_key_size = 32  # reserved field
		self._signature_size = 64  # reserved field
		self._rental_fee_sink_size = 40  # reserved field
	}

	sort(){
		pass
	}

	type_(){
		return self._type_
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	timestamp(){
		return self._timestamp
	}

	signer_public_key(){
		return self._signer_public_key
	}

	signature(){
		return self._signature
	}

	fee(){
		return self._fee
	}

	deadline(){
		return self._deadline
	}

	rental_fee_sink(){
		return self._rental_fee_sink
	}

	rental_fee(){
		return self._rental_fee
	}

	name(){
		return self._name
	}

	parent_name(){
		return self._parent_name
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	timestamp(value: Timestamp){
		self._timestamp = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	signature(value: Signature){
		self._signature = value
	}

	fee(value: Amount){
		self._fee = value
	}

	deadline(value: Timestamp){
		self._deadline = value
	}

	rental_fee_sink(value: Address){
		self._rental_fee_sink = value
	}

	rental_fee(value: Amount){
		self._rental_fee = value
	}

	name(value: bytes){
		self._name = value
	}

	parent_name(value: bytes){
		self._parent_name = value
	}

	size(){
		size = 0
		size += self.type_.size
		size += 1
		size += 2
		size += self.network.size
		size += self.timestamp.size
		size += 4
		size += self.signer_public_key.size
		size += 4
		size += self.signature.size
		size += self.fee.size
		size += self.deadline.size
		size += 4
		size += self.rental_fee_sink.size
		size += self.rental_fee.size
		size += 4
		size += len(self._name)
		size += 4
		if self.parent_name:
			size += len(self._parent_name)
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[2:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		timestamp = Timestamp.deserialize(buffer)
		buffer = buffer[timestamp.size:]
		signer_public_key_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert signer_public_key_size == 32, f'Invalid value of reserved field ({signer_public_key_size})'
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		signature_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert signature_size == 64, f'Invalid value of reserved field ({signature_size})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		rental_fee_sink_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert rental_fee_sink_size == 40, f'Invalid value of reserved field ({rental_fee_sink_size})'
		rental_fee_sink = Address.deserialize(buffer)
		buffer = buffer[rental_fee_sink.size:]
		rental_fee = Amount.deserialize(buffer)
		buffer = buffer[rental_fee.size:]
		name_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		name = ArrayHelpers.get_bytes(buffer, name_size)
		buffer = buffer[name_size:]
		parent_name_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		parent_name = None
		if 4294967295 != parent_name_size:
			parent_name = ArrayHelpers.get_bytes(buffer, parent_name_size)
			buffer = buffer[parent_name_size:]

		instance = NamespaceRegistrationTransactionV1()
		instance._type_ = type_
		instance._version = version
		instance._network = network
		instance._timestamp = timestamp
		instance._signer_public_key = signer_public_key
		instance._signature = signature
		instance._fee = fee
		instance._deadline = deadline
		instance._rental_fee_sink = rental_fee_sink
		instance._rental_fee = rental_fee
		instance._name = name
		instance._parent_name = parent_name
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self._type_.serialize()
		buffer += Converter::intToBytes($self._version)
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += self._network.serialize()
		buffer += self._timestamp.serialize()
		buffer += Converter::intToBytes($self._signer_public_key_size)
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._signature_size)
		buffer += self._signature.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += Converter::intToBytes($self._rental_fee_sink_size)
		buffer += self._rental_fee_sink.serialize()
		buffer += self._rental_fee.serialize()
		buffer += Converter::intToBytes($len(self._name))  # name_size
		buffer += self._name
		buffer += Converter::intToBytes($(len(self._parent_name) if self._parent_name is not None else 4294967295))  # parent_name_size
		if self.parent_name:
			buffer += self._parent_name
		return buffer
	}

	__str__(){
		result = '('
		result += f'type_: {self._type_.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'timestamp: {self._timestamp.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'signature: {self._signature.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'rental_fee_sink: {self._rental_fee_sink.__str__()}, '
		result += f'rental_fee: {self._rental_fee.__str__()}, '
		result += f'name: {hexlify(self._name).decode("utf8")}, '
		if self.parent_name:
			result += f'parent_name: {hexlify(self._parent_name).decode("utf8")}, '
		result += ')'
		return result
	}
}


class NonVerifiableNamespaceRegistrationTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.NAMESPACE_REGISTRATION
	TYPE_HINTS = {
		'type_': 'enum:TransactionType',
		'network': 'enum:NetworkType',
		'timestamp': 'pod:Timestamp',
		'signer_public_key': 'pod:PublicKey',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'rental_fee_sink': 'pod:Address',
		'rental_fee': 'pod:Amount',
		'name': 'bytes_array',
		'parent_name': 'bytes_array'
	}

	public function __construct(){
		self._type_ = NonVerifiableNamespaceRegistrationTransactionV1.TRANSACTION_TYPE
		self._version = NonVerifiableNamespaceRegistrationTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._timestamp = Timestamp()
		self._signer_public_key = PublicKey()
		self._fee = Amount()
		self._deadline = Timestamp()
		self._rental_fee_sink = Address()
		self._rental_fee = Amount()
		self._name = bytes()
		self._parent_name = None
		self._entity_body_reserved_1 = 0  # reserved field
		self._signer_public_key_size = 32  # reserved field
		self._rental_fee_sink_size = 40  # reserved field
	}

	sort(){
		pass
	}

	type_(){
		return self._type_
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	timestamp(){
		return self._timestamp
	}

	signer_public_key(){
		return self._signer_public_key
	}

	fee(){
		return self._fee
	}

	deadline(){
		return self._deadline
	}

	rental_fee_sink(){
		return self._rental_fee_sink
	}

	rental_fee(){
		return self._rental_fee
	}

	name(){
		return self._name
	}

	parent_name(){
		return self._parent_name
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	timestamp(value: Timestamp){
		self._timestamp = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	fee(value: Amount){
		self._fee = value
	}

	deadline(value: Timestamp){
		self._deadline = value
	}

	rental_fee_sink(value: Address){
		self._rental_fee_sink = value
	}

	rental_fee(value: Amount){
		self._rental_fee = value
	}

	name(value: bytes){
		self._name = value
	}

	parent_name(value: bytes){
		self._parent_name = value
	}

	size(){
		size = 0
		size += self.type_.size
		size += 1
		size += 2
		size += self.network.size
		size += self.timestamp.size
		size += 4
		size += self.signer_public_key.size
		size += self.fee.size
		size += self.deadline.size
		size += 4
		size += self.rental_fee_sink.size
		size += self.rental_fee.size
		size += 4
		size += len(self._name)
		size += 4
		if self.parent_name:
			size += len(self._parent_name)
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[2:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		timestamp = Timestamp.deserialize(buffer)
		buffer = buffer[timestamp.size:]
		signer_public_key_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert signer_public_key_size == 32, f'Invalid value of reserved field ({signer_public_key_size})'
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		rental_fee_sink_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert rental_fee_sink_size == 40, f'Invalid value of reserved field ({rental_fee_sink_size})'
		rental_fee_sink = Address.deserialize(buffer)
		buffer = buffer[rental_fee_sink.size:]
		rental_fee = Amount.deserialize(buffer)
		buffer = buffer[rental_fee.size:]
		name_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		name = ArrayHelpers.get_bytes(buffer, name_size)
		buffer = buffer[name_size:]
		parent_name_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		parent_name = None
		if 4294967295 != parent_name_size:
			parent_name = ArrayHelpers.get_bytes(buffer, parent_name_size)
			buffer = buffer[parent_name_size:]

		instance = NonVerifiableNamespaceRegistrationTransactionV1()
		instance._type_ = type_
		instance._version = version
		instance._network = network
		instance._timestamp = timestamp
		instance._signer_public_key = signer_public_key
		instance._fee = fee
		instance._deadline = deadline
		instance._rental_fee_sink = rental_fee_sink
		instance._rental_fee = rental_fee
		instance._name = name
		instance._parent_name = parent_name
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self._type_.serialize()
		buffer += Converter::intToBytes($self._version)
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += self._network.serialize()
		buffer += self._timestamp.serialize()
		buffer += Converter::intToBytes($self._signer_public_key_size)
		buffer += self._signer_public_key.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += Converter::intToBytes($self._rental_fee_sink_size)
		buffer += self._rental_fee_sink.serialize()
		buffer += self._rental_fee.serialize()
		buffer += Converter::intToBytes($len(self._name))  # name_size
		buffer += self._name
		buffer += Converter::intToBytes($(len(self._parent_name) if self._parent_name is not None else 4294967295))  # parent_name_size
		if self.parent_name:
			buffer += self._parent_name
		return buffer
	}

	__str__(){
		result = '('
		result += f'type_: {self._type_.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'timestamp: {self._timestamp.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'rental_fee_sink: {self._rental_fee_sink.__str__()}, '
		result += f'rental_fee: {self._rental_fee.__str__()}, '
		result += f'name: {hexlify(self._name).decode("utf8")}, '
		if self.parent_name:
			result += f'parent_name: {hexlify(self._parent_name).decode("utf8")}, '
		result += ')'
		return result
	}
}


class MessageType extends (Enum) {
	PLAIN = 1
	ENCRYPTED = 2

	size(){
		return 4
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		return MessageType(Converter::bytesToInt(byteArray))
	}

	public function serialize(){
		buffer = bytes()
		buffer += Converter::intToBytes($self.value)
		return buffer
	}
}


class Message {
	TYPE_HINTS = {
		'message_type': 'enum:MessageType',
		'message': 'bytes_array'
	}

	public function __construct(){
		self._message_type = MessageType.PLAIN
		self._message = bytes()
	}

	sort(){
		pass
	}

	message_type(){
		return self._message_type
	}

	message(){
		return self._message
	}

	message_type(value: MessageType){
		self._message_type = value
	}

	message(value: bytes){
		self._message = value
	}

	size(){
		size = 0
		size += self.message_type.size
		size += 4
		size += len(self._message)
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		message_type = MessageType.deserialize(buffer)
		buffer = buffer[message_type.size:]
		message_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		message = ArrayHelpers.get_bytes(buffer, message_size)
		buffer = buffer[message_size:]

		instance = Message()
		instance._message_type = message_type
		instance._message = message
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self._message_type.serialize()
		buffer += Converter::intToBytes($len(self._message))  # message_size
		buffer += self._message
		return buffer
	}

	__str__(){
		result = '('
		result += f'message_type: {self._message_type.__str__()}, '
		result += f'message: {hexlify(self._message).decode("utf8")}, '
		result += ')'
		return result
	}
}


class TransferTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.TRANSFER
	TYPE_HINTS = {
		'type_': 'enum:TransactionType',
		'network': 'enum:NetworkType',
		'timestamp': 'pod:Timestamp',
		'signer_public_key': 'pod:PublicKey',
		'signature': 'pod:Signature',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'recipient_address': 'pod:Address',
		'amount': 'pod:Amount',
		'message': 'struct:Message'
	}

	public function __construct(){
		self._type_ = TransferTransactionV1.TRANSACTION_TYPE
		self._version = TransferTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._timestamp = Timestamp()
		self._signer_public_key = PublicKey()
		self._signature = Signature()
		self._fee = Amount()
		self._deadline = Timestamp()
		self._recipient_address = Address()
		self._amount = Amount()
		self._message = None
		self._entity_body_reserved_1 = 0  # reserved field
		self._signer_public_key_size = 32  # reserved field
		self._signature_size = 64  # reserved field
		self._recipient_address_size = 40  # reserved field
	}

	sort(){
		if 0 != self.message_envelope_size_computed:
			self._message.sort()
	}

	type_(){
		return self._type_
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	timestamp(){
		return self._timestamp
	}

	signer_public_key(){
		return self._signer_public_key
	}

	signature(){
		return self._signature
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

	amount(){
		return self._amount
	}

	message(){
		return self._message
	}

	message_envelope_size_computed(){
		return 0 if not self.message else self.message.size + 0
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	timestamp(value: Timestamp){
		self._timestamp = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	signature(value: Signature){
		self._signature = value
	}

	fee(value: Amount){
		self._fee = value
	}

	deadline(value: Timestamp){
		self._deadline = value
	}

	recipient_address(value: Address){
		self._recipient_address = value
	}

	amount(value: Amount){
		self._amount = value
	}

	message(value: Message){
		self._message = value
	}

	size(){
		size = 0
		size += self.type_.size
		size += 1
		size += 2
		size += self.network.size
		size += self.timestamp.size
		size += 4
		size += self.signer_public_key.size
		size += 4
		size += self.signature.size
		size += self.fee.size
		size += self.deadline.size
		size += 4
		size += self.recipient_address.size
		size += self.amount.size
		size += 4
		if 0 != self.message_envelope_size_computed:
			size += self.message.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[2:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		timestamp = Timestamp.deserialize(buffer)
		buffer = buffer[timestamp.size:]
		signer_public_key_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert signer_public_key_size == 32, f'Invalid value of reserved field ({signer_public_key_size})'
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		signature_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert signature_size == 64, f'Invalid value of reserved field ({signature_size})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		recipient_address_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert recipient_address_size == 40, f'Invalid value of reserved field ({recipient_address_size})'
		recipient_address = Address.deserialize(buffer)
		buffer = buffer[recipient_address.size:]
		amount = Amount.deserialize(buffer)
		buffer = buffer[amount.size:]
		message_envelope_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		message = None
		if 0 != message_envelope_size:
			message = Message.deserialize(buffer)
			buffer = buffer[message.size:]

		instance = TransferTransactionV1()
		instance._type_ = type_
		instance._version = version
		instance._network = network
		instance._timestamp = timestamp
		instance._signer_public_key = signer_public_key
		instance._signature = signature
		instance._fee = fee
		instance._deadline = deadline
		instance._recipient_address = recipient_address
		instance._amount = amount
		instance._message = message
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self._type_.serialize()
		buffer += Converter::intToBytes($self._version)
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += self._network.serialize()
		buffer += self._timestamp.serialize()
		buffer += Converter::intToBytes($self._signer_public_key_size)
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._signature_size)
		buffer += self._signature.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += Converter::intToBytes($self._recipient_address_size)
		buffer += self._recipient_address.serialize()
		buffer += self._amount.serialize()
		buffer += Converter::intToBytes($self.message_envelope_size_computed)
		if 0 != self.message_envelope_size_computed:
			buffer += self._message.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'type_: {self._type_.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'timestamp: {self._timestamp.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'signature: {self._signature.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'recipient_address: {self._recipient_address.__str__()}, '
		result += f'amount: {self._amount.__str__()}, '
		if 0 != self.message_envelope_size_computed:
			result += f'message: {self._message.__str__()}, '
		result += ')'
		return result
	}
}


class NonVerifiableTransferTransactionV1 {
	TRANSACTION_VERSION: int = 1
	TRANSACTION_TYPE: TransactionType = TransactionType.TRANSFER
	TYPE_HINTS = {
		'type_': 'enum:TransactionType',
		'network': 'enum:NetworkType',
		'timestamp': 'pod:Timestamp',
		'signer_public_key': 'pod:PublicKey',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'recipient_address': 'pod:Address',
		'amount': 'pod:Amount',
		'message': 'struct:Message'
	}

	public function __construct(){
		self._type_ = NonVerifiableTransferTransactionV1.TRANSACTION_TYPE
		self._version = NonVerifiableTransferTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._timestamp = Timestamp()
		self._signer_public_key = PublicKey()
		self._fee = Amount()
		self._deadline = Timestamp()
		self._recipient_address = Address()
		self._amount = Amount()
		self._message = None
		self._entity_body_reserved_1 = 0  # reserved field
		self._signer_public_key_size = 32  # reserved field
		self._recipient_address_size = 40  # reserved field
	}

	sort(){
		if 0 != self.message_envelope_size_computed:
			self._message.sort()
	}

	type_(){
		return self._type_
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	timestamp(){
		return self._timestamp
	}

	signer_public_key(){
		return self._signer_public_key
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

	amount(){
		return self._amount
	}

	message(){
		return self._message
	}

	message_envelope_size_computed(){
		return 0 if not self.message else self.message.size + 0
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	timestamp(value: Timestamp){
		self._timestamp = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	fee(value: Amount){
		self._fee = value
	}

	deadline(value: Timestamp){
		self._deadline = value
	}

	recipient_address(value: Address){
		self._recipient_address = value
	}

	amount(value: Amount){
		self._amount = value
	}

	message(value: Message){
		self._message = value
	}

	size(){
		size = 0
		size += self.type_.size
		size += 1
		size += 2
		size += self.network.size
		size += self.timestamp.size
		size += 4
		size += self.signer_public_key.size
		size += self.fee.size
		size += self.deadline.size
		size += 4
		size += self.recipient_address.size
		size += self.amount.size
		size += 4
		if 0 != self.message_envelope_size_computed:
			size += self.message.size
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[2:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		timestamp = Timestamp.deserialize(buffer)
		buffer = buffer[timestamp.size:]
		signer_public_key_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert signer_public_key_size == 32, f'Invalid value of reserved field ({signer_public_key_size})'
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		recipient_address_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert recipient_address_size == 40, f'Invalid value of reserved field ({recipient_address_size})'
		recipient_address = Address.deserialize(buffer)
		buffer = buffer[recipient_address.size:]
		amount = Amount.deserialize(buffer)
		buffer = buffer[amount.size:]
		message_envelope_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		message = None
		if 0 != message_envelope_size:
			message = Message.deserialize(buffer)
			buffer = buffer[message.size:]

		instance = NonVerifiableTransferTransactionV1()
		instance._type_ = type_
		instance._version = version
		instance._network = network
		instance._timestamp = timestamp
		instance._signer_public_key = signer_public_key
		instance._fee = fee
		instance._deadline = deadline
		instance._recipient_address = recipient_address
		instance._amount = amount
		instance._message = message
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self._type_.serialize()
		buffer += Converter::intToBytes($self._version)
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += self._network.serialize()
		buffer += self._timestamp.serialize()
		buffer += Converter::intToBytes($self._signer_public_key_size)
		buffer += self._signer_public_key.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += Converter::intToBytes($self._recipient_address_size)
		buffer += self._recipient_address.serialize()
		buffer += self._amount.serialize()
		buffer += Converter::intToBytes($self.message_envelope_size_computed)
		if 0 != self.message_envelope_size_computed:
			buffer += self._message.serialize()
		return buffer
	}

	__str__(){
		result = '('
		result += f'type_: {self._type_.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'timestamp: {self._timestamp.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'recipient_address: {self._recipient_address.__str__()}, '
		result += f'amount: {self._amount.__str__()}, '
		if 0 != self.message_envelope_size_computed:
			result += f'message: {self._message.__str__()}, '
		result += ')'
		return result
	}
}


class TransferTransactionV2 {
	TRANSACTION_VERSION: int = 2
	TRANSACTION_TYPE: TransactionType = TransactionType.TRANSFER
	TYPE_HINTS = {
		'type_': 'enum:TransactionType',
		'network': 'enum:NetworkType',
		'timestamp': 'pod:Timestamp',
		'signer_public_key': 'pod:PublicKey',
		'signature': 'pod:Signature',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'recipient_address': 'pod:Address',
		'amount': 'pod:Amount',
		'message': 'struct:Message',
		'mosaics': 'array[SizePrefixedMosaic]'
	}

	public function __construct(){
		self._type_ = TransferTransactionV2.TRANSACTION_TYPE
		self._version = TransferTransactionV2.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._timestamp = Timestamp()
		self._signer_public_key = PublicKey()
		self._signature = Signature()
		self._fee = Amount()
		self._deadline = Timestamp()
		self._recipient_address = Address()
		self._amount = Amount()
		self._message = None
		self._mosaics = []
		self._entity_body_reserved_1 = 0  # reserved field
		self._signer_public_key_size = 32  # reserved field
		self._signature_size = 64  # reserved field
		self._recipient_address_size = 40  # reserved field
	}

	sort(){
		if 0 != self.message_envelope_size_computed:
			self._message.sort()
	}

	type_(){
		return self._type_
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	timestamp(){
		return self._timestamp
	}

	signer_public_key(){
		return self._signer_public_key
	}

	signature(){
		return self._signature
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

	amount(){
		return self._amount
	}

	message(){
		return self._message
	}

	mosaics(){
		return self._mosaics
	}

	message_envelope_size_computed(){
		return 0 if not self.message else self.message.size + 0
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	timestamp(value: Timestamp){
		self._timestamp = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	signature(value: Signature){
		self._signature = value
	}

	fee(value: Amount){
		self._fee = value
	}

	deadline(value: Timestamp){
		self._deadline = value
	}

	recipient_address(value: Address){
		self._recipient_address = value
	}

	amount(value: Amount){
		self._amount = value
	}

	message(value: Message){
		self._message = value
	}

	mosaics(value: List[SizePrefixedMosaic]){
		self._mosaics = value
	}

	size(){
		size = 0
		size += self.type_.size
		size += 1
		size += 2
		size += self.network.size
		size += self.timestamp.size
		size += 4
		size += self.signer_public_key.size
		size += 4
		size += self.signature.size
		size += self.fee.size
		size += self.deadline.size
		size += 4
		size += self.recipient_address.size
		size += self.amount.size
		size += 4
		if 0 != self.message_envelope_size_computed:
			size += self.message.size
		size += 4
		size += ArrayHelpers.size(self.mosaics)
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[2:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		timestamp = Timestamp.deserialize(buffer)
		buffer = buffer[timestamp.size:]
		signer_public_key_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert signer_public_key_size == 32, f'Invalid value of reserved field ({signer_public_key_size})'
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		signature_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert signature_size == 64, f'Invalid value of reserved field ({signature_size})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		recipient_address_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert recipient_address_size == 40, f'Invalid value of reserved field ({recipient_address_size})'
		recipient_address = Address.deserialize(buffer)
		buffer = buffer[recipient_address.size:]
		amount = Amount.deserialize(buffer)
		buffer = buffer[amount.size:]
		message_envelope_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		message = None
		if 0 != message_envelope_size:
			message = Message.deserialize(buffer)
			buffer = buffer[message.size:]
		mosaics_count = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		mosaics = ArrayHelpers.read_array_count(buffer, SizePrefixedMosaic, mosaics_count)
		buffer = buffer[ArrayHelpers.size(mosaics):]

		instance = TransferTransactionV2()
		instance._type_ = type_
		instance._version = version
		instance._network = network
		instance._timestamp = timestamp
		instance._signer_public_key = signer_public_key
		instance._signature = signature
		instance._fee = fee
		instance._deadline = deadline
		instance._recipient_address = recipient_address
		instance._amount = amount
		instance._message = message
		instance._mosaics = mosaics
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self._type_.serialize()
		buffer += Converter::intToBytes($self._version)
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += self._network.serialize()
		buffer += self._timestamp.serialize()
		buffer += Converter::intToBytes($self._signer_public_key_size)
		buffer += self._signer_public_key.serialize()
		buffer += Converter::intToBytes($self._signature_size)
		buffer += self._signature.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += Converter::intToBytes($self._recipient_address_size)
		buffer += self._recipient_address.serialize()
		buffer += self._amount.serialize()
		buffer += Converter::intToBytes($self.message_envelope_size_computed)
		if 0 != self.message_envelope_size_computed:
			buffer += self._message.serialize()
		buffer += Converter::intToBytes($len(self._mosaics))  # mosaics_count
		buffer += ArrayHelpers.write_array(self._mosaics)
		return buffer
	}

	__str__(){
		result = '('
		result += f'type_: {self._type_.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'timestamp: {self._timestamp.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'signature: {self._signature.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'recipient_address: {self._recipient_address.__str__()}, '
		result += f'amount: {self._amount.__str__()}, '
		if 0 != self.message_envelope_size_computed:
			result += f'message: {self._message.__str__()}, '
		result += f'mosaics: {list(map(str, self._mosaics))}, '
		result += ')'
		return result
	}
}


class NonVerifiableTransferTransactionV2 {
	TRANSACTION_VERSION: int = 2
	TRANSACTION_TYPE: TransactionType = TransactionType.TRANSFER
	TYPE_HINTS = {
		'type_': 'enum:TransactionType',
		'network': 'enum:NetworkType',
		'timestamp': 'pod:Timestamp',
		'signer_public_key': 'pod:PublicKey',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'recipient_address': 'pod:Address',
		'amount': 'pod:Amount',
		'message': 'struct:Message',
		'mosaics': 'array[SizePrefixedMosaic]'
	}

	public function __construct(){
		self._type_ = NonVerifiableTransferTransactionV2.TRANSACTION_TYPE
		self._version = NonVerifiableTransferTransactionV2.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._timestamp = Timestamp()
		self._signer_public_key = PublicKey()
		self._fee = Amount()
		self._deadline = Timestamp()
		self._recipient_address = Address()
		self._amount = Amount()
		self._message = None
		self._mosaics = []
		self._entity_body_reserved_1 = 0  # reserved field
		self._signer_public_key_size = 32  # reserved field
		self._recipient_address_size = 40  # reserved field
	}

	sort(){
		if 0 != self.message_envelope_size_computed:
			self._message.sort()
	}

	type_(){
		return self._type_
	}

	version(){
		return self._version
	}

	network(){
		return self._network
	}

	timestamp(){
		return self._timestamp
	}

	signer_public_key(){
		return self._signer_public_key
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

	amount(){
		return self._amount
	}

	message(){
		return self._message
	}

	mosaics(){
		return self._mosaics
	}

	message_envelope_size_computed(){
		return 0 if not self.message else self.message.size + 0
	}

	type_(value: TransactionType){
		self._type_ = value
	}

	version(value: int){
		self._version = value
	}

	network(value: NetworkType){
		self._network = value
	}

	timestamp(value: Timestamp){
		self._timestamp = value
	}

	signer_public_key(value: PublicKey){
		self._signer_public_key = value
	}

	fee(value: Amount){
		self._fee = value
	}

	deadline(value: Timestamp){
		self._deadline = value
	}

	recipient_address(value: Address){
		self._recipient_address = value
	}

	amount(value: Amount){
		self._amount = value
	}

	message(value: Message){
		self._message = value
	}

	mosaics(value: List[SizePrefixedMosaic]){
		self._mosaics = value
	}

	size(){
		size = 0
		size += self.type_.size
		size += 1
		size += 2
		size += self.network.size
		size += self.timestamp.size
		size += 4
		size += self.signer_public_key.size
		size += self.fee.size
		size += self.deadline.size
		size += 4
		size += self.recipient_address.size
		size += self.amount.size
		size += 4
		if 0 != self.message_envelope_size_computed:
			size += self.message.size
		size += 4
		size += ArrayHelpers.size(self.mosaics)
		return size
	}

	public static function deserialize($payload){
		buffer = memoryview(payload)
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		version = Converter::bytesToInt(byteArray)
		buffer = buffer[1:]
		entity_body_reserved_1 = Converter::bytesToInt(byteArray)
		buffer = buffer[2:]
		assert entity_body_reserved_1 == 0, f'Invalid value of reserved field ({entity_body_reserved_1})'
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		timestamp = Timestamp.deserialize(buffer)
		buffer = buffer[timestamp.size:]
		signer_public_key_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert signer_public_key_size == 32, f'Invalid value of reserved field ({signer_public_key_size})'
		signer_public_key = PublicKey.deserialize(buffer)
		buffer = buffer[signer_public_key.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		recipient_address_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		assert recipient_address_size == 40, f'Invalid value of reserved field ({recipient_address_size})'
		recipient_address = Address.deserialize(buffer)
		buffer = buffer[recipient_address.size:]
		amount = Amount.deserialize(buffer)
		buffer = buffer[amount.size:]
		message_envelope_size = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		message = None
		if 0 != message_envelope_size:
			message = Message.deserialize(buffer)
			buffer = buffer[message.size:]
		mosaics_count = Converter::bytesToInt(byteArray)
		buffer = buffer[4:]
		mosaics = ArrayHelpers.read_array_count(buffer, SizePrefixedMosaic, mosaics_count)
		buffer = buffer[ArrayHelpers.size(mosaics):]

		instance = NonVerifiableTransferTransactionV2()
		instance._type_ = type_
		instance._version = version
		instance._network = network
		instance._timestamp = timestamp
		instance._signer_public_key = signer_public_key
		instance._fee = fee
		instance._deadline = deadline
		instance._recipient_address = recipient_address
		instance._amount = amount
		instance._message = message
		instance._mosaics = mosaics
		return instance
	}

	public function serialize(){
		buffer = bytes()
		buffer += self._type_.serialize()
		buffer += Converter::intToBytes($self._version)
		buffer += Converter::intToBytes($self._entity_body_reserved_1)
		buffer += self._network.serialize()
		buffer += self._timestamp.serialize()
		buffer += Converter::intToBytes($self._signer_public_key_size)
		buffer += self._signer_public_key.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += Converter::intToBytes($self._recipient_address_size)
		buffer += self._recipient_address.serialize()
		buffer += self._amount.serialize()
		buffer += Converter::intToBytes($self.message_envelope_size_computed)
		if 0 != self.message_envelope_size_computed:
			buffer += self._message.serialize()
		buffer += Converter::intToBytes($len(self._mosaics))  # mosaics_count
		buffer += ArrayHelpers.write_array(self._mosaics)
		return buffer
	}

	__str__(){
		result = '('
		result += f'type_: {self._type_.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'timestamp: {self._timestamp.__str__()}, '
		result += f'signer_public_key: {self._signer_public_key.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'recipient_address: {self._recipient_address.__str__()}, '
		result += f'amount: {self._amount.__str__()}, '
		if 0 != self.message_envelope_size_computed:
			result += f'message: {self._message.__str__()}, '
		result += f'mosaics: {list(map(str, self._mosaics))}, '
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
			(MosaicDefinitionTransactionV1.TRANSACTION_TYPE, MosaicDefinitionTransactionV1.TRANSACTION_VERSION): MosaicDefinitionTransactionV1,
			(MosaicSupplyChangeTransactionV1.TRANSACTION_TYPE, MosaicSupplyChangeTransactionV1.TRANSACTION_VERSION): MosaicSupplyChangeTransactionV1,
			(MultisigAccountModificationTransactionV1.TRANSACTION_TYPE, MultisigAccountModificationTransactionV1.TRANSACTION_VERSION): MultisigAccountModificationTransactionV1,
			(MultisigAccountModificationTransactionV2.TRANSACTION_TYPE, MultisigAccountModificationTransactionV2.TRANSACTION_VERSION): MultisigAccountModificationTransactionV2,
			(CosignatureV1.TRANSACTION_TYPE, CosignatureV1.TRANSACTION_VERSION): CosignatureV1,
			(MultisigTransactionV1.TRANSACTION_TYPE, MultisigTransactionV1.TRANSACTION_VERSION): MultisigTransactionV1,
			(NamespaceRegistrationTransactionV1.TRANSACTION_TYPE, NamespaceRegistrationTransactionV1.TRANSACTION_VERSION): NamespaceRegistrationTransactionV1,
			(TransferTransactionV1.TRANSACTION_TYPE, TransferTransactionV1.TRANSACTION_VERSION): TransferTransactionV1,
			(TransferTransactionV2.TRANSACTION_TYPE, TransferTransactionV2.TRANSACTION_VERSION): TransferTransactionV2
		}
		discriminator = (parent.type_, parent.version)
		factory_class = mapping[discriminator]
		return factory_class.deserialize(buffer)
	}

	create_by_name(entity_name: str){
		mapping = {
			'account_key_link_transaction_v1': AccountKeyLinkTransactionV1,
			'mosaic_definition_transaction_v1': MosaicDefinitionTransactionV1,
			'mosaic_supply_change_transaction_v1': MosaicSupplyChangeTransactionV1,
			'multisig_account_modification_transaction_v1': MultisigAccountModificationTransactionV1,
			'multisig_account_modification_transaction_v2': MultisigAccountModificationTransactionV2,
			'cosignature_v1': CosignatureV1,
			'multisig_transaction_v1': MultisigTransactionV1,
			'namespace_registration_transaction_v1': NamespaceRegistrationTransactionV1,
			'transfer_transaction_v1': TransferTransactionV1,
			'transfer_transaction_v2': TransferTransactionV2
		}

		if entity_name not in mapping:
			raise ValueError(f'unknown Transaction type {entity_name}')

		return mapping[entity_name]()
	}
}


class NonVerifiableTransactionFactory {
	deserialize(payload: bytes){
		buffer = bytes(payload)
		parent = NonVerifiableTransaction.deserialize(buffer)
		mapping = {
			(NonVerifiableAccountKeyLinkTransactionV1.TRANSACTION_TYPE, NonVerifiableAccountKeyLinkTransactionV1.TRANSACTION_VERSION): NonVerifiableAccountKeyLinkTransactionV1,
			(NonVerifiableMosaicDefinitionTransactionV1.TRANSACTION_TYPE, NonVerifiableMosaicDefinitionTransactionV1.TRANSACTION_VERSION): NonVerifiableMosaicDefinitionTransactionV1,
			(NonVerifiableMosaicSupplyChangeTransactionV1.TRANSACTION_TYPE, NonVerifiableMosaicSupplyChangeTransactionV1.TRANSACTION_VERSION): NonVerifiableMosaicSupplyChangeTransactionV1,
			(NonVerifiableMultisigAccountModificationTransactionV1.TRANSACTION_TYPE, NonVerifiableMultisigAccountModificationTransactionV1.TRANSACTION_VERSION): NonVerifiableMultisigAccountModificationTransactionV1,
			(NonVerifiableMultisigAccountModificationTransactionV2.TRANSACTION_TYPE, NonVerifiableMultisigAccountModificationTransactionV2.TRANSACTION_VERSION): NonVerifiableMultisigAccountModificationTransactionV2,
			(NonVerifiableMultisigTransactionV1.TRANSACTION_TYPE, NonVerifiableMultisigTransactionV1.TRANSACTION_VERSION): NonVerifiableMultisigTransactionV1,
			(NonVerifiableNamespaceRegistrationTransactionV1.TRANSACTION_TYPE, NonVerifiableNamespaceRegistrationTransactionV1.TRANSACTION_VERSION): NonVerifiableNamespaceRegistrationTransactionV1,
			(NonVerifiableTransferTransactionV1.TRANSACTION_TYPE, NonVerifiableTransferTransactionV1.TRANSACTION_VERSION): NonVerifiableTransferTransactionV1,
			(NonVerifiableTransferTransactionV2.TRANSACTION_TYPE, NonVerifiableTransferTransactionV2.TRANSACTION_VERSION): NonVerifiableTransferTransactionV2
		}
		discriminator = (parent.type_, parent.version)
		factory_class = mapping[discriminator]
		return factory_class.deserialize(buffer)
	}

	create_by_name(entity_name: str){
		mapping = {
			'non_verifiable_account_key_link_transaction_v1': NonVerifiableAccountKeyLinkTransactionV1,
			'non_verifiable_mosaic_definition_transaction_v1': NonVerifiableMosaicDefinitionTransactionV1,
			'non_verifiable_mosaic_supply_change_transaction_v1': NonVerifiableMosaicSupplyChangeTransactionV1,
			'non_verifiable_multisig_account_modification_transaction_v1': NonVerifiableMultisigAccountModificationTransactionV1,
			'non_verifiable_multisig_account_modification_transaction_v2': NonVerifiableMultisigAccountModificationTransactionV2,
			'non_verifiable_multisig_transaction_v1': NonVerifiableMultisigTransactionV1,
			'non_verifiable_namespace_registration_transaction_v1': NonVerifiableNamespaceRegistrationTransactionV1,
			'non_verifiable_transfer_transaction_v1': NonVerifiableTransferTransactionV1,
			'non_verifiable_transfer_transaction_v2': NonVerifiableTransferTransactionV2
		}

		if entity_name not in mapping:
			raise ValueError(f'unknown NonVerifiableTransaction type {entity_name}')

		return mapping[entity_name]()
	}
}
