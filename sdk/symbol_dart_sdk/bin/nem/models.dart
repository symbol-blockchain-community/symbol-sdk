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


class Timestamp extends BaseValue {
	static const int SIZE = 4;

	Timestamp(int timestamp): super(SIZE, timestamp ?? 0);

	static Timestamp deserialize(Uint8List payload){
		var buffer = ByteData.view(payload.buffer);
		return Timestamp(BigInt.from(buffer.getInt32(0, Endian.little)));
	}

	Uint8List serialize(){
		var buffer = ByteData(SIZE);
		return (buffer..setInt32(0, value.toInt(), Endian.little)).buffer.asUint8List();;
	}
}


class Address extends ByteArray {
	static const int SIZE = 40;

	Address(Uint8List address): super(SIZE, address ?? Uint8List(40));

	int get size(){
		return 40
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
	TRANSFER = 257
	ACCOUNT_KEY_LINK = 2049
	MULTISIG_ACCOUNT_MODIFICATION = 4097
	MULTISIG_COSIGNATURE = 4098
	MULTISIG = 4100
	NAMESPACE_REGISTRATION = 8193
	MOSAIC_DEFINITION = 16385
	MOSAIC_SUPPLY_CHANGE = 16386

	int get size(){
		return 4
	}

	static TransactionType deserialize(Uint8List payload){
		buffer = memoryview(payload)
		return TransactionType(BigInt.from(buffer.getInt32(0, Endian.little)))
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += (buffer..setInt32(0, self.value.toInt(), Endian.little)).buffer.asUint8List();
		return buffer
	}
}


class Transaction {
	TYPE_HINTS = {
		'type_': 'enum:TransactionType',
		'network': 'enum:NetworkType',
		'timestamp': 'pod:Timestamp',
		'signerPublicKey': 'pod:PublicKey',
		'signature': 'pod:Signature',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp'
	}

	Transaction(){
		self._type_ = TransactionType.TRANSFER
		self._version = 0
		self._network = NetworkType.MAINNET
		self._timestamp = Timestamp()
		self._signerPublicKey = PublicKey()
		self._signature = Signature()
		self._fee = Amount()
		self._deadline = Timestamp()
		self._entityBodyReserved_1 = 0  # reserved field
		self._signerPublicKeySize = 32  # reserved field
		self._signatureSize = 64  # reserved field
	}

	None sort(){
		pass
	}

	@property
	TransactionType type_(){
		return self._type_
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
	Timestamp timestamp(){
		return self._timestamp
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
	Amount fee(){
		return self._fee
	}

	@property
	Timestamp deadline(){
		return self._deadline
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@timestamp.setter
	timestamp(value: Timestamp){
		self._timestamp = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@signature.setter
	signature(value: Signature){
		self._signature = value
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
		size += self.type_.size
		size += 1
		size += 2
		size += self.network.size
		size += self.timestamp.size
		size += 4
		size += self.signerPublicKey.size
		size += 4
		size += self.signature.size
		size += self.fee.size
		size += self.deadline.size
		return size
	}

	static Transaction deserialize(Uint8List payload){
		buffer = memoryview(payload)
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt16(0, Endian.little))
		buffer = buffer[2:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		timestamp = Timestamp.deserialize(buffer)
		buffer = buffer[timestamp.size:]
		signerPublicKeySize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert signerPublicKeySize == 32, f'Invalid value of reserved field ({signerPublicKeySize})'
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		signatureSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert signatureSize == 64, f'Invalid value of reserved field ({signatureSize})'
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
		instance._signerPublicKey = signerPublicKey
		instance._signature = signature
		instance._fee = fee
		instance._deadline = deadline
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self._type_.serialize()
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt16(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._timestamp.serialize()
		buffer += (buffer..setInt32(0, self._signerPublicKeySize.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._signatureSize.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signature.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'type_: {self._type_.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'timestamp: {self._timestamp.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
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
		'signerPublicKey': 'pod:PublicKey',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp'
	}

	NonVerifiableTransaction(){
		self._type_ = TransactionType.TRANSFER
		self._version = 0
		self._network = NetworkType.MAINNET
		self._timestamp = Timestamp()
		self._signerPublicKey = PublicKey()
		self._fee = Amount()
		self._deadline = Timestamp()
		self._entityBodyReserved_1 = 0  # reserved field
		self._signerPublicKeySize = 32  # reserved field
	}

	None sort(){
		pass
	}

	@property
	TransactionType type_(){
		return self._type_
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
	Timestamp timestamp(){
		return self._timestamp
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
	}

	@property
	Amount fee(){
		return self._fee
	}

	@property
	Timestamp deadline(){
		return self._deadline
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@timestamp.setter
	timestamp(value: Timestamp){
		self._timestamp = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
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
		size += self.type_.size
		size += 1
		size += 2
		size += self.network.size
		size += self.timestamp.size
		size += 4
		size += self.signerPublicKey.size
		size += self.fee.size
		size += self.deadline.size
		return size
	}

	static NonVerifiableTransaction deserialize(Uint8List payload){
		buffer = memoryview(payload)
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt16(0, Endian.little))
		buffer = buffer[2:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		timestamp = Timestamp.deserialize(buffer)
		buffer = buffer[timestamp.size:]
		signerPublicKeySize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert signerPublicKeySize == 32, f'Invalid value of reserved field ({signerPublicKeySize})'
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]

		instance = NonVerifiableTransaction()
		instance._type_ = type_
		instance._version = version
		instance._network = network
		instance._timestamp = timestamp
		instance._signerPublicKey = signerPublicKey
		instance._fee = fee
		instance._deadline = deadline
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self._type_.serialize()
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt16(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._timestamp.serialize()
		buffer += (buffer..setInt32(0, self._signerPublicKeySize.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signerPublicKey.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'type_: {self._type_.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'timestamp: {self._timestamp.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += ')'
		return result
	}
}


class LinkAction extends (Enum) {
	LINK = 1
	UNLINK = 2

	int get size(){
		return 4
	}

	static LinkAction deserialize(Uint8List payload){
		buffer = memoryview(payload)
		return LinkAction(BigInt.from(buffer.getInt32(0, Endian.little)))
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += (buffer..setInt32(0, self.value.toInt(), Endian.little)).buffer.asUint8List();
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
		'signerPublicKey': 'pod:PublicKey',
		'signature': 'pod:Signature',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'linkAction': 'enum:LinkAction',
		'remotePublicKey': 'pod:PublicKey'
	}

	AccountKeyLinkTransactionV1(){
		self._type_ = AccountKeyLinkTransactionV1.TRANSACTION_TYPE
		self._version = AccountKeyLinkTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._timestamp = Timestamp()
		self._signerPublicKey = PublicKey()
		self._signature = Signature()
		self._fee = Amount()
		self._deadline = Timestamp()
		self._linkAction = LinkAction.LINK
		self._remotePublicKey = PublicKey()
		self._entityBodyReserved_1 = 0  # reserved field
		self._signerPublicKeySize = 32  # reserved field
		self._signatureSize = 64  # reserved field
		self._remotePublicKeySize = 32  # reserved field
	}

	None sort(){
		pass
	}

	@property
	TransactionType type_(){
		return self._type_
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
	Timestamp timestamp(){
		return self._timestamp
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
	Amount fee(){
		return self._fee
	}

	@property
	Timestamp deadline(){
		return self._deadline
	}

	@property
	LinkAction linkAction(){
		return self._linkAction
	}

	@property
	PublicKey remotePublicKey(){
		return self._remotePublicKey
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@timestamp.setter
	timestamp(value: Timestamp){
		self._timestamp = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@signature.setter
	signature(value: Signature){
		self._signature = value
	}

	@fee.setter
	fee(value: Amount){
		self._fee = value
	}

	@deadline.setter
	deadline(value: Timestamp){
		self._deadline = value
	}

	@linkAction.setter
	linkAction(value: LinkAction){
		self._linkAction = value
	}

	@remotePublicKey.setter
	remotePublicKey(value: PublicKey){
		self._remotePublicKey = value
	}

	int get size(){
		size = 0
		size += self.type_.size
		size += 1
		size += 2
		size += self.network.size
		size += self.timestamp.size
		size += 4
		size += self.signerPublicKey.size
		size += 4
		size += self.signature.size
		size += self.fee.size
		size += self.deadline.size
		size += self.linkAction.size
		size += 4
		size += self.remotePublicKey.size
		return size
	}

	static AccountKeyLinkTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt16(0, Endian.little))
		buffer = buffer[2:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		timestamp = Timestamp.deserialize(buffer)
		buffer = buffer[timestamp.size:]
		signerPublicKeySize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert signerPublicKeySize == 32, f'Invalid value of reserved field ({signerPublicKeySize})'
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		signatureSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert signatureSize == 64, f'Invalid value of reserved field ({signatureSize})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		linkAction = LinkAction.deserialize(buffer)
		buffer = buffer[linkAction.size:]
		remotePublicKeySize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert remotePublicKeySize == 32, f'Invalid value of reserved field ({remotePublicKeySize})'
		remotePublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[remotePublicKey.size:]

		instance = AccountKeyLinkTransactionV1()
		instance._type_ = type_
		instance._version = version
		instance._network = network
		instance._timestamp = timestamp
		instance._signerPublicKey = signerPublicKey
		instance._signature = signature
		instance._fee = fee
		instance._deadline = deadline
		instance._linkAction = linkAction
		instance._remotePublicKey = remotePublicKey
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self._type_.serialize()
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt16(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._timestamp.serialize()
		buffer += (buffer..setInt32(0, self._signerPublicKeySize.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._signatureSize.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signature.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._linkAction.serialize()
		buffer += (buffer..setInt32(0, self._remotePublicKeySize.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._remotePublicKey.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'type_: {self._type_.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'timestamp: {self._timestamp.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'signature: {self._signature.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'linkAction: {self._linkAction.__str__()}, '
		result += f'remotePublicKey: {self._remotePublicKey.__str__()}, '
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
		'signerPublicKey': 'pod:PublicKey',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'linkAction': 'enum:LinkAction',
		'remotePublicKey': 'pod:PublicKey'
	}

	NonVerifiableAccountKeyLinkTransactionV1(){
		self._type_ = NonVerifiableAccountKeyLinkTransactionV1.TRANSACTION_TYPE
		self._version = NonVerifiableAccountKeyLinkTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._timestamp = Timestamp()
		self._signerPublicKey = PublicKey()
		self._fee = Amount()
		self._deadline = Timestamp()
		self._linkAction = LinkAction.LINK
		self._remotePublicKey = PublicKey()
		self._entityBodyReserved_1 = 0  # reserved field
		self._signerPublicKeySize = 32  # reserved field
		self._remotePublicKeySize = 32  # reserved field
	}

	None sort(){
		pass
	}

	@property
	TransactionType type_(){
		return self._type_
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
	Timestamp timestamp(){
		return self._timestamp
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
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
	LinkAction linkAction(){
		return self._linkAction
	}

	@property
	PublicKey remotePublicKey(){
		return self._remotePublicKey
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@timestamp.setter
	timestamp(value: Timestamp){
		self._timestamp = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@fee.setter
	fee(value: Amount){
		self._fee = value
	}

	@deadline.setter
	deadline(value: Timestamp){
		self._deadline = value
	}

	@linkAction.setter
	linkAction(value: LinkAction){
		self._linkAction = value
	}

	@remotePublicKey.setter
	remotePublicKey(value: PublicKey){
		self._remotePublicKey = value
	}

	int get size(){
		size = 0
		size += self.type_.size
		size += 1
		size += 2
		size += self.network.size
		size += self.timestamp.size
		size += 4
		size += self.signerPublicKey.size
		size += self.fee.size
		size += self.deadline.size
		size += self.linkAction.size
		size += 4
		size += self.remotePublicKey.size
		return size
	}

	static NonVerifiableAccountKeyLinkTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt16(0, Endian.little))
		buffer = buffer[2:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		timestamp = Timestamp.deserialize(buffer)
		buffer = buffer[timestamp.size:]
		signerPublicKeySize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert signerPublicKeySize == 32, f'Invalid value of reserved field ({signerPublicKeySize})'
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		linkAction = LinkAction.deserialize(buffer)
		buffer = buffer[linkAction.size:]
		remotePublicKeySize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert remotePublicKeySize == 32, f'Invalid value of reserved field ({remotePublicKeySize})'
		remotePublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[remotePublicKey.size:]

		instance = NonVerifiableAccountKeyLinkTransactionV1()
		instance._type_ = type_
		instance._version = version
		instance._network = network
		instance._timestamp = timestamp
		instance._signerPublicKey = signerPublicKey
		instance._fee = fee
		instance._deadline = deadline
		instance._linkAction = linkAction
		instance._remotePublicKey = remotePublicKey
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self._type_.serialize()
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt16(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._timestamp.serialize()
		buffer += (buffer..setInt32(0, self._signerPublicKeySize.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signerPublicKey.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += self._linkAction.serialize()
		buffer += (buffer..setInt32(0, self._remotePublicKeySize.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._remotePublicKey.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'type_: {self._type_.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'timestamp: {self._timestamp.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'linkAction: {self._linkAction.__str__()}, '
		result += f'remotePublicKey: {self._remotePublicKey.__str__()}, '
		result += ')'
		return result
	}
}


class NamespaceId {
	TYPE_HINTS = {
		'name': 'bytes_array'
	}

	NamespaceId(){
		self._name = Uint8List()
	}

	None sort(){
		pass
	}

	@property
	bytes name(){
		return self._name
	}

	@name.setter
	name(value: bytes){
		self._name = value
	}

	int get size(){
		size = 0
		size += 4
		size += len(self._name)
		return size
	}

	static NamespaceId deserialize(Uint8List payload){
		buffer = memoryview(payload)
		nameSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		name = Uint8List.fromList(payload)
		buffer = buffer[name_size:]

		instance = NamespaceId()
		instance._name = name
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += (buffer..setInt32(0, len(self._name).toInt(), Endian.little)).buffer.asUint8List();  # name_size
		buffer += self._name
		return buffer
	}

	str toString(){
		result = '('
		result += f'name: {hexlify(self._name).decode("utf8")}, '
		result += ')'
		return result
	}
}


class MosaicId {
	TYPE_HINTS = {
		'namespaceId': 'struct:NamespaceId',
		'name': 'bytes_array'
	}

	MosaicId(){
		self._namespaceId = NamespaceId()
		self._name = Uint8List()
	}

	None sort(){
		self._namespaceId.sort()
	}

	@property
	NamespaceId namespaceId(){
		return self._namespaceId
	}

	@property
	bytes name(){
		return self._name
	}

	@namespaceId.setter
	namespaceId(value: NamespaceId){
		self._namespaceId = value
	}

	@name.setter
	name(value: bytes){
		self._name = value
	}

	int get size(){
		size = 0
		size += self.namespaceId.size
		size += 4
		size += len(self._name)
		return size
	}

	static MosaicId deserialize(Uint8List payload){
		buffer = memoryview(payload)
		namespaceId = NamespaceId.deserialize(buffer)
		buffer = buffer[namespaceId.size:]
		nameSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		name = Uint8List.fromList(payload)
		buffer = buffer[name_size:]

		instance = MosaicId()
		instance._namespaceId = namespaceId
		instance._name = name
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self._namespaceId.serialize()
		buffer += (buffer..setInt32(0, len(self._name).toInt(), Endian.little)).buffer.asUint8List();  # name_size
		buffer += self._name
		return buffer
	}

	str toString(){
		result = '('
		result += f'namespaceId: {self._namespaceId.__str__()}, '
		result += f'name: {hexlify(self._name).decode("utf8")}, '
		result += ')'
		return result
	}
}


class Mosaic {
	TYPE_HINTS = {
		'mosaicId': 'struct:MosaicId',
		'amount': 'pod:Amount'
	}

	Mosaic(){
		self._mosaicId = MosaicId()
		self._amount = Amount()
	}

	None sort(){
		self._mosaicId.sort()
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
		size += 4
		size += self.mosaicId.size
		size += self.amount.size
		return size
	}

	static Mosaic deserialize(Uint8List payload){
		buffer = memoryview(payload)
		mosaicIdSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		# marking sizeof field
		mosaicId = MosaicId.deserialize(buffer[:mosaic_id_size])
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
		buffer += (buffer..setInt32(0, self.mosaicId.size.toInt(), Endian.little)).buffer.asUint8List();  # mosaic_id_size
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


class SizePrefixedMosaic {
	TYPE_HINTS = {
		'mosaic': 'struct:Mosaic'
	}

	SizePrefixedMosaic(){
		self._mosaic = Mosaic()
	}

	None sort(){
		self._mosaic.sort()
	}

	@property
	Mosaic mosaic(){
		return self._mosaic
	}

	@mosaic.setter
	mosaic(value: Mosaic){
		self._mosaic = value
	}

	int get size(){
		size = 0
		size += 4
		size += self.mosaic.size
		return size
	}

	static SizePrefixedMosaic deserialize(Uint8List payload){
		buffer = memoryview(payload)
		mosaicSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		# marking sizeof field
		mosaic = Mosaic.deserialize(buffer[:mosaic_size])
		buffer = buffer[mosaic.size:]

		instance = SizePrefixedMosaic()
		instance._mosaic = mosaic
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += (buffer..setInt32(0, self.mosaic.size.toInt(), Endian.little)).buffer.asUint8List();  # mosaic_size
		buffer += self._mosaic.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'mosaic: {self._mosaic.__str__()}, '
		result += ')'
		return result
	}
}


class MosaicTransferFeeType extends (Enum) {
	ABSOLUTE = 1
	PERCENTILE = 2

	int get size(){
		return 4
	}

	static MosaicTransferFeeType deserialize(Uint8List payload){
		buffer = memoryview(payload)
		return MosaicTransferFeeType(BigInt.from(buffer.getInt32(0, Endian.little)))
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += (buffer..setInt32(0, self.value.toInt(), Endian.little)).buffer.asUint8List();
		return buffer
	}
}


class MosaicLevy {
	TYPE_HINTS = {
		'transferFeeType': 'enum:MosaicTransferFeeType',
		'recipientAddress': 'pod:Address',
		'mosaicId': 'struct:MosaicId',
		'fee': 'pod:Amount'
	}

	MosaicLevy(){
		self._transferFeeType = MosaicTransferFeeType.ABSOLUTE
		self._recipientAddress = Address()
		self._mosaicId = MosaicId()
		self._fee = Amount()
		self._recipientAddressSize = 40  # reserved field
	}

	None sort(){
		self._mosaicId.sort()
	}

	@property
	MosaicTransferFeeType transferFeeType(){
		return self._transferFeeType
	}

	@property
	Address recipientAddress(){
		return self._recipientAddress
	}

	@property
	MosaicId mosaicId(){
		return self._mosaicId
	}

	@property
	Amount fee(){
		return self._fee
	}

	@transferFeeType.setter
	transferFeeType(value: MosaicTransferFeeType){
		self._transferFeeType = value
	}

	@recipientAddress.setter
	recipientAddress(value: Address){
		self._recipientAddress = value
	}

	@mosaicId.setter
	mosaicId(value: MosaicId){
		self._mosaicId = value
	}

	@fee.setter
	fee(value: Amount){
		self._fee = value
	}

	int get size(){
		size = 0
		size += self.transferFeeType.size
		size += 4
		size += self.recipientAddress.size
		size += 4
		size += self.mosaicId.size
		size += self.fee.size
		return size
	}

	static MosaicLevy deserialize(Uint8List payload){
		buffer = memoryview(payload)
		transferFeeType = MosaicTransferFeeType.deserialize(buffer)
		buffer = buffer[transferFeeType.size:]
		recipientAddressSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert recipientAddressSize == 40, f'Invalid value of reserved field ({recipientAddressSize})'
		recipientAddress = Address.deserialize(buffer)
		buffer = buffer[recipientAddress.size:]
		mosaicIdSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		# marking sizeof field
		mosaicId = MosaicId.deserialize(buffer[:mosaic_id_size])
		buffer = buffer[mosaicId.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]

		instance = MosaicLevy()
		instance._transferFeeType = transferFeeType
		instance._recipientAddress = recipientAddress
		instance._mosaicId = mosaicId
		instance._fee = fee
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self._transferFeeType.serialize()
		buffer += (buffer..setInt32(0, self._recipientAddressSize.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._recipientAddress.serialize()
		buffer += (buffer..setInt32(0, self.mosaicId.size.toInt(), Endian.little)).buffer.asUint8List();  # mosaic_id_size
		buffer += self._mosaicId.serialize()
		buffer += self._fee.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'transferFeeType: {self._transferFeeType.__str__()}, '
		result += f'recipientAddress: {self._recipientAddress.__str__()}, '
		result += f'mosaicId: {self._mosaicId.__str__()}, '
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

	MosaicProperty(){
		self._name = Uint8List()
		self._value = Uint8List()
	}

	None sort(){
		pass
	}

	@property
	bytes name(){
		return self._name
	}

	@property
	bytes value(){
		return self._value
	}

	@name.setter
	name(value: bytes){
		self._name = value
	}

	@value.setter
	value(value: bytes){
		self._value = value
	}

	int get size(){
		size = 0
		size += 4
		size += len(self._name)
		size += 4
		size += len(self._value)
		return size
	}

	static MosaicProperty deserialize(Uint8List payload){
		buffer = memoryview(payload)
		nameSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		name = Uint8List.fromList(payload)
		buffer = buffer[name_size:]
		valueSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		value = Uint8List.fromList(payload)
		buffer = buffer[value_size:]

		instance = MosaicProperty()
		instance._name = name
		instance._value = value
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += (buffer..setInt32(0, len(self._name).toInt(), Endian.little)).buffer.asUint8List();  # name_size
		buffer += self._name
		buffer += (buffer..setInt32(0, len(self._value).toInt(), Endian.little)).buffer.asUint8List();  # value_size
		buffer += self._value
		return buffer
	}

	str toString(){
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

	SizePrefixedMosaicProperty(){
		self._property_ = MosaicProperty()
	}

	None sort(){
		self._property_.sort()
	}

	@property
	MosaicProperty property_(){
		return self._property_
	}

	@property_.setter
	property_(value: MosaicProperty){
		self._property_ = value
	}

	int get size(){
		size = 0
		size += 4
		size += self.property_.size
		return size
	}

	static SizePrefixedMosaicProperty deserialize(Uint8List payload){
		buffer = memoryview(payload)
		propertySize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		# marking sizeof field
		property_ = MosaicProperty.deserialize(buffer[:property_size])
		buffer = buffer[property_.size:]

		instance = SizePrefixedMosaicProperty()
		instance._property_ = property_
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += (buffer..setInt32(0, self.property_.size.toInt(), Endian.little)).buffer.asUint8List();  # property_size
		buffer += self._property_.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'property_: {self._property_.__str__()}, '
		result += ')'
		return result
	}
}


class MosaicDefinition {
	TYPE_HINTS = {
		'ownerPublicKey': 'pod:PublicKey',
		'id': 'struct:MosaicId',
		'description': 'bytes_array',
		'properties': 'array[SizePrefixedMosaicProperty]',
		'levy': 'struct:MosaicLevy'
	}

	MosaicDefinition(){
		self._ownerPublicKey = PublicKey()
		self._id = MosaicId()
		self._description = Uint8List()
		self._properties = []
		self._levy = None
		self._ownerPublicKeySize = 32  # reserved field
	}

	None sort(){
		self._id.sort()
		if 0 != self.levy_size_computed:
			self._levy.sort()
	}

	@property
	PublicKey ownerPublicKey(){
		return self._ownerPublicKey
	}

	@property
	MosaicId id(){
		return self._id
	}

	@property
	bytes description(){
		return self._description
	}

	@property
	List[SizePrefixedMosaicProperty] properties(){
		return self._properties
	}

	@property
	MosaicLevy levy(){
		return self._levy
	}

	@property
	int levySize_computed(){
		return 0 if not self.levy else self.levy.size + 0
	}

	@ownerPublicKey.setter
	ownerPublicKey(value: PublicKey){
		self._ownerPublicKey = value
	}

	@id.setter
	id(value: MosaicId){
		self._id = value
	}

	@description.setter
	description(value: bytes){
		self._description = value
	}

	@properties.setter
	properties(value: List[SizePrefixedMosaicProperty]){
		self._properties = value
	}

	@levy.setter
	levy(value: MosaicLevy){
		self._levy = value
	}

	int get size(){
		size = 0
		size += 4
		size += self.ownerPublicKey.size
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

	static MosaicDefinition deserialize(Uint8List payload){
		buffer = memoryview(payload)
		ownerPublicKeySize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert ownerPublicKeySize == 32, f'Invalid value of reserved field ({ownerPublicKeySize})'
		ownerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[ownerPublicKey.size:]
		idSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		# marking sizeof field
		id = MosaicId.deserialize(buffer[:id_size])
		buffer = buffer[id.size:]
		descriptionSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		description = Uint8List.fromList(payload)
		buffer = buffer[description_size:]
		propertiesCount = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		properties = ArrayHelpers.read_array_count(buffer, SizePrefixedMosaicProperty, properties_count)
		buffer = buffer[ArrayHelpers.size(properties):]
		levySize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		levy = None
		if 0 != levy_size:
			levy = MosaicLevy.deserialize(buffer)
			buffer = buffer[levy.size:]

		instance = MosaicDefinition()
		instance._ownerPublicKey = ownerPublicKey
		instance._id = id
		instance._description = description
		instance._properties = properties
		instance._levy = levy
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += (buffer..setInt32(0, self._ownerPublicKeySize.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._ownerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self.id.size.toInt(), Endian.little)).buffer.asUint8List();  # id_size
		buffer += self._id.serialize()
		buffer += (buffer..setInt32(0, len(self._description).toInt(), Endian.little)).buffer.asUint8List();  # description_size
		buffer += self._description
		buffer += (buffer..setInt32(0, len(self._properties).toInt(), Endian.little)).buffer.asUint8List();  # properties_count
		buffer += ArrayHelpers.write_array(self._properties)
		buffer += (buffer..setInt32(0, self.levySize_computed.toInt(), Endian.little)).buffer.asUint8List();
		if 0 != self.levy_size_computed:
			buffer += self._levy.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'ownerPublicKey: {self._ownerPublicKey.__str__()}, '
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
		'signerPublicKey': 'pod:PublicKey',
		'signature': 'pod:Signature',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'mosaicDefinition': 'struct:MosaicDefinition',
		'rentalFeeSink': 'pod:Address',
		'rentalFee': 'pod:Amount'
	}

	MosaicDefinitionTransactionV1(){
		self._type_ = MosaicDefinitionTransactionV1.TRANSACTION_TYPE
		self._version = MosaicDefinitionTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._timestamp = Timestamp()
		self._signerPublicKey = PublicKey()
		self._signature = Signature()
		self._fee = Amount()
		self._deadline = Timestamp()
		self._mosaicDefinition = MosaicDefinition()
		self._rentalFeeSink = Address()
		self._rentalFee = Amount()
		self._entityBodyReserved_1 = 0  # reserved field
		self._signerPublicKeySize = 32  # reserved field
		self._signatureSize = 64  # reserved field
		self._rentalFeeSinkSize = 40  # reserved field
	}

	None sort(){
		self._mosaicDefinition.sort()
	}

	@property
	TransactionType type_(){
		return self._type_
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
	Timestamp timestamp(){
		return self._timestamp
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
	Amount fee(){
		return self._fee
	}

	@property
	Timestamp deadline(){
		return self._deadline
	}

	@property
	MosaicDefinition mosaicDefinition(){
		return self._mosaicDefinition
	}

	@property
	Address rentalFeeSink(){
		return self._rentalFeeSink
	}

	@property
	Amount rentalFee(){
		return self._rentalFee
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@timestamp.setter
	timestamp(value: Timestamp){
		self._timestamp = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@signature.setter
	signature(value: Signature){
		self._signature = value
	}

	@fee.setter
	fee(value: Amount){
		self._fee = value
	}

	@deadline.setter
	deadline(value: Timestamp){
		self._deadline = value
	}

	@mosaicDefinition.setter
	mosaicDefinition(value: MosaicDefinition){
		self._mosaicDefinition = value
	}

	@rentalFeeSink.setter
	rentalFeeSink(value: Address){
		self._rentalFeeSink = value
	}

	@rentalFee.setter
	rentalFee(value: Amount){
		self._rentalFee = value
	}

	int get size(){
		size = 0
		size += self.type_.size
		size += 1
		size += 2
		size += self.network.size
		size += self.timestamp.size
		size += 4
		size += self.signerPublicKey.size
		size += 4
		size += self.signature.size
		size += self.fee.size
		size += self.deadline.size
		size += 4
		size += self.mosaicDefinition.size
		size += 4
		size += self.rentalFeeSink.size
		size += self.rentalFee.size
		return size
	}

	static MosaicDefinitionTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt16(0, Endian.little))
		buffer = buffer[2:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		timestamp = Timestamp.deserialize(buffer)
		buffer = buffer[timestamp.size:]
		signerPublicKeySize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert signerPublicKeySize == 32, f'Invalid value of reserved field ({signerPublicKeySize})'
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		signatureSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert signatureSize == 64, f'Invalid value of reserved field ({signatureSize})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		mosaicDefinitionSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		# marking sizeof field
		mosaicDefinition = MosaicDefinition.deserialize(buffer[:mosaic_definition_size])
		buffer = buffer[mosaicDefinition.size:]
		rentalFeeSinkSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert rentalFeeSinkSize == 40, f'Invalid value of reserved field ({rentalFeeSinkSize})'
		rentalFeeSink = Address.deserialize(buffer)
		buffer = buffer[rentalFeeSink.size:]
		rentalFee = Amount.deserialize(buffer)
		buffer = buffer[rentalFee.size:]

		instance = MosaicDefinitionTransactionV1()
		instance._type_ = type_
		instance._version = version
		instance._network = network
		instance._timestamp = timestamp
		instance._signerPublicKey = signerPublicKey
		instance._signature = signature
		instance._fee = fee
		instance._deadline = deadline
		instance._mosaicDefinition = mosaicDefinition
		instance._rentalFeeSink = rentalFeeSink
		instance._rentalFee = rentalFee
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self._type_.serialize()
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt16(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._timestamp.serialize()
		buffer += (buffer..setInt32(0, self._signerPublicKeySize.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._signatureSize.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signature.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += (buffer..setInt32(0, self.mosaicDefinition.size.toInt(), Endian.little)).buffer.asUint8List();  # mosaic_definition_size
		buffer += self._mosaicDefinition.serialize()
		buffer += (buffer..setInt32(0, self._rentalFeeSinkSize.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._rentalFeeSink.serialize()
		buffer += self._rentalFee.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'type_: {self._type_.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'timestamp: {self._timestamp.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'signature: {self._signature.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'mosaicDefinition: {self._mosaicDefinition.__str__()}, '
		result += f'rentalFeeSink: {self._rentalFeeSink.__str__()}, '
		result += f'rentalFee: {self._rentalFee.__str__()}, '
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
		'signerPublicKey': 'pod:PublicKey',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'mosaicDefinition': 'struct:MosaicDefinition',
		'rentalFeeSink': 'pod:Address',
		'rentalFee': 'pod:Amount'
	}

	NonVerifiableMosaicDefinitionTransactionV1(){
		self._type_ = NonVerifiableMosaicDefinitionTransactionV1.TRANSACTION_TYPE
		self._version = NonVerifiableMosaicDefinitionTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._timestamp = Timestamp()
		self._signerPublicKey = PublicKey()
		self._fee = Amount()
		self._deadline = Timestamp()
		self._mosaicDefinition = MosaicDefinition()
		self._rentalFeeSink = Address()
		self._rentalFee = Amount()
		self._entityBodyReserved_1 = 0  # reserved field
		self._signerPublicKeySize = 32  # reserved field
		self._rentalFeeSinkSize = 40  # reserved field
	}

	None sort(){
		self._mosaicDefinition.sort()
	}

	@property
	TransactionType type_(){
		return self._type_
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
	Timestamp timestamp(){
		return self._timestamp
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
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
	MosaicDefinition mosaicDefinition(){
		return self._mosaicDefinition
	}

	@property
	Address rentalFeeSink(){
		return self._rentalFeeSink
	}

	@property
	Amount rentalFee(){
		return self._rentalFee
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@timestamp.setter
	timestamp(value: Timestamp){
		self._timestamp = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@fee.setter
	fee(value: Amount){
		self._fee = value
	}

	@deadline.setter
	deadline(value: Timestamp){
		self._deadline = value
	}

	@mosaicDefinition.setter
	mosaicDefinition(value: MosaicDefinition){
		self._mosaicDefinition = value
	}

	@rentalFeeSink.setter
	rentalFeeSink(value: Address){
		self._rentalFeeSink = value
	}

	@rentalFee.setter
	rentalFee(value: Amount){
		self._rentalFee = value
	}

	int get size(){
		size = 0
		size += self.type_.size
		size += 1
		size += 2
		size += self.network.size
		size += self.timestamp.size
		size += 4
		size += self.signerPublicKey.size
		size += self.fee.size
		size += self.deadline.size
		size += 4
		size += self.mosaicDefinition.size
		size += 4
		size += self.rentalFeeSink.size
		size += self.rentalFee.size
		return size
	}

	static NonVerifiableMosaicDefinitionTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt16(0, Endian.little))
		buffer = buffer[2:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		timestamp = Timestamp.deserialize(buffer)
		buffer = buffer[timestamp.size:]
		signerPublicKeySize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert signerPublicKeySize == 32, f'Invalid value of reserved field ({signerPublicKeySize})'
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		mosaicDefinitionSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		# marking sizeof field
		mosaicDefinition = MosaicDefinition.deserialize(buffer[:mosaic_definition_size])
		buffer = buffer[mosaicDefinition.size:]
		rentalFeeSinkSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert rentalFeeSinkSize == 40, f'Invalid value of reserved field ({rentalFeeSinkSize})'
		rentalFeeSink = Address.deserialize(buffer)
		buffer = buffer[rentalFeeSink.size:]
		rentalFee = Amount.deserialize(buffer)
		buffer = buffer[rentalFee.size:]

		instance = NonVerifiableMosaicDefinitionTransactionV1()
		instance._type_ = type_
		instance._version = version
		instance._network = network
		instance._timestamp = timestamp
		instance._signerPublicKey = signerPublicKey
		instance._fee = fee
		instance._deadline = deadline
		instance._mosaicDefinition = mosaicDefinition
		instance._rentalFeeSink = rentalFeeSink
		instance._rentalFee = rentalFee
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self._type_.serialize()
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt16(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._timestamp.serialize()
		buffer += (buffer..setInt32(0, self._signerPublicKeySize.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signerPublicKey.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += (buffer..setInt32(0, self.mosaicDefinition.size.toInt(), Endian.little)).buffer.asUint8List();  # mosaic_definition_size
		buffer += self._mosaicDefinition.serialize()
		buffer += (buffer..setInt32(0, self._rentalFeeSinkSize.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._rentalFeeSink.serialize()
		buffer += self._rentalFee.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'type_: {self._type_.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'timestamp: {self._timestamp.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'mosaicDefinition: {self._mosaicDefinition.__str__()}, '
		result += f'rentalFeeSink: {self._rentalFeeSink.__str__()}, '
		result += f'rentalFee: {self._rentalFee.__str__()}, '
		result += ')'
		return result
	}
}


class MosaicSupplyChangeAction extends (Enum) {
	INCREASE = 1
	DECREASE = 2

	int get size(){
		return 4
	}

	static MosaicSupplyChangeAction deserialize(Uint8List payload){
		buffer = memoryview(payload)
		return MosaicSupplyChangeAction(BigInt.from(buffer.getInt32(0, Endian.little)))
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += (buffer..setInt32(0, self.value.toInt(), Endian.little)).buffer.asUint8List();
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
		'signerPublicKey': 'pod:PublicKey',
		'signature': 'pod:Signature',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'mosaicId': 'struct:MosaicId',
		'action': 'enum:MosaicSupplyChangeAction',
		'delta': 'pod:Amount'
	}

	MosaicSupplyChangeTransactionV1(){
		self._type_ = MosaicSupplyChangeTransactionV1.TRANSACTION_TYPE
		self._version = MosaicSupplyChangeTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._timestamp = Timestamp()
		self._signerPublicKey = PublicKey()
		self._signature = Signature()
		self._fee = Amount()
		self._deadline = Timestamp()
		self._mosaicId = MosaicId()
		self._action = MosaicSupplyChangeAction.INCREASE
		self._delta = Amount()
		self._entityBodyReserved_1 = 0  # reserved field
		self._signerPublicKeySize = 32  # reserved field
		self._signatureSize = 64  # reserved field
	}

	None sort(){
		self._mosaicId.sort()
	}

	@property
	TransactionType type_(){
		return self._type_
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
	Timestamp timestamp(){
		return self._timestamp
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
	Amount fee(){
		return self._fee
	}

	@property
	Timestamp deadline(){
		return self._deadline
	}

	@property
	MosaicId mosaicId(){
		return self._mosaicId
	}

	@property
	MosaicSupplyChangeAction action(){
		return self._action
	}

	@property
	Amount delta(){
		return self._delta
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@timestamp.setter
	timestamp(value: Timestamp){
		self._timestamp = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@signature.setter
	signature(value: Signature){
		self._signature = value
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
	mosaicId(value: MosaicId){
		self._mosaicId = value
	}

	@action.setter
	action(value: MosaicSupplyChangeAction){
		self._action = value
	}

	@delta.setter
	delta(value: Amount){
		self._delta = value
	}

	int get size(){
		size = 0
		size += self.type_.size
		size += 1
		size += 2
		size += self.network.size
		size += self.timestamp.size
		size += 4
		size += self.signerPublicKey.size
		size += 4
		size += self.signature.size
		size += self.fee.size
		size += self.deadline.size
		size += 4
		size += self.mosaicId.size
		size += self.action.size
		size += self.delta.size
		return size
	}

	static MosaicSupplyChangeTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt16(0, Endian.little))
		buffer = buffer[2:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		timestamp = Timestamp.deserialize(buffer)
		buffer = buffer[timestamp.size:]
		signerPublicKeySize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert signerPublicKeySize == 32, f'Invalid value of reserved field ({signerPublicKeySize})'
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		signatureSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert signatureSize == 64, f'Invalid value of reserved field ({signatureSize})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		mosaicIdSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		# marking sizeof field
		mosaicId = MosaicId.deserialize(buffer[:mosaic_id_size])
		buffer = buffer[mosaicId.size:]
		action = MosaicSupplyChangeAction.deserialize(buffer)
		buffer = buffer[action.size:]
		delta = Amount.deserialize(buffer)
		buffer = buffer[delta.size:]

		instance = MosaicSupplyChangeTransactionV1()
		instance._type_ = type_
		instance._version = version
		instance._network = network
		instance._timestamp = timestamp
		instance._signerPublicKey = signerPublicKey
		instance._signature = signature
		instance._fee = fee
		instance._deadline = deadline
		instance._mosaicId = mosaicId
		instance._action = action
		instance._delta = delta
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self._type_.serialize()
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt16(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._timestamp.serialize()
		buffer += (buffer..setInt32(0, self._signerPublicKeySize.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._signatureSize.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signature.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += (buffer..setInt32(0, self.mosaicId.size.toInt(), Endian.little)).buffer.asUint8List();  # mosaic_id_size
		buffer += self._mosaicId.serialize()
		buffer += self._action.serialize()
		buffer += self._delta.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'type_: {self._type_.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'timestamp: {self._timestamp.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'signature: {self._signature.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'mosaicId: {self._mosaicId.__str__()}, '
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
		'signerPublicKey': 'pod:PublicKey',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'mosaicId': 'struct:MosaicId',
		'action': 'enum:MosaicSupplyChangeAction',
		'delta': 'pod:Amount'
	}

	NonVerifiableMosaicSupplyChangeTransactionV1(){
		self._type_ = NonVerifiableMosaicSupplyChangeTransactionV1.TRANSACTION_TYPE
		self._version = NonVerifiableMosaicSupplyChangeTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._timestamp = Timestamp()
		self._signerPublicKey = PublicKey()
		self._fee = Amount()
		self._deadline = Timestamp()
		self._mosaicId = MosaicId()
		self._action = MosaicSupplyChangeAction.INCREASE
		self._delta = Amount()
		self._entityBodyReserved_1 = 0  # reserved field
		self._signerPublicKeySize = 32  # reserved field
	}

	None sort(){
		self._mosaicId.sort()
	}

	@property
	TransactionType type_(){
		return self._type_
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
	Timestamp timestamp(){
		return self._timestamp
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
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
	MosaicId mosaicId(){
		return self._mosaicId
	}

	@property
	MosaicSupplyChangeAction action(){
		return self._action
	}

	@property
	Amount delta(){
		return self._delta
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@timestamp.setter
	timestamp(value: Timestamp){
		self._timestamp = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
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
	mosaicId(value: MosaicId){
		self._mosaicId = value
	}

	@action.setter
	action(value: MosaicSupplyChangeAction){
		self._action = value
	}

	@delta.setter
	delta(value: Amount){
		self._delta = value
	}

	int get size(){
		size = 0
		size += self.type_.size
		size += 1
		size += 2
		size += self.network.size
		size += self.timestamp.size
		size += 4
		size += self.signerPublicKey.size
		size += self.fee.size
		size += self.deadline.size
		size += 4
		size += self.mosaicId.size
		size += self.action.size
		size += self.delta.size
		return size
	}

	static NonVerifiableMosaicSupplyChangeTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt16(0, Endian.little))
		buffer = buffer[2:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		timestamp = Timestamp.deserialize(buffer)
		buffer = buffer[timestamp.size:]
		signerPublicKeySize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert signerPublicKeySize == 32, f'Invalid value of reserved field ({signerPublicKeySize})'
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		mosaicIdSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		# marking sizeof field
		mosaicId = MosaicId.deserialize(buffer[:mosaic_id_size])
		buffer = buffer[mosaicId.size:]
		action = MosaicSupplyChangeAction.deserialize(buffer)
		buffer = buffer[action.size:]
		delta = Amount.deserialize(buffer)
		buffer = buffer[delta.size:]

		instance = NonVerifiableMosaicSupplyChangeTransactionV1()
		instance._type_ = type_
		instance._version = version
		instance._network = network
		instance._timestamp = timestamp
		instance._signerPublicKey = signerPublicKey
		instance._fee = fee
		instance._deadline = deadline
		instance._mosaicId = mosaicId
		instance._action = action
		instance._delta = delta
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self._type_.serialize()
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt16(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._timestamp.serialize()
		buffer += (buffer..setInt32(0, self._signerPublicKeySize.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signerPublicKey.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += (buffer..setInt32(0, self.mosaicId.size.toInt(), Endian.little)).buffer.asUint8List();  # mosaic_id_size
		buffer += self._mosaicId.serialize()
		buffer += self._action.serialize()
		buffer += self._delta.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'type_: {self._type_.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'timestamp: {self._timestamp.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'mosaicId: {self._mosaicId.__str__()}, '
		result += f'action: {self._action.__str__()}, '
		result += f'delta: {self._delta.__str__()}, '
		result += ')'
		return result
	}
}


class MultisigAccountModificationType extends (Enum) {
	ADD_COSIGNATORY = 1
	DELETE_COSIGNATORY = 2

	int get size(){
		return 4
	}

	static MultisigAccountModificationType deserialize(Uint8List payload){
		buffer = memoryview(payload)
		return MultisigAccountModificationType(BigInt.from(buffer.getInt32(0, Endian.little)))
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += (buffer..setInt32(0, self.value.toInt(), Endian.little)).buffer.asUint8List();
		return buffer
	}
}


class MultisigAccountModification {
	TYPE_HINTS = {
		'modificationType': 'enum:MultisigAccountModificationType',
		'cosignatoryPublicKey': 'pod:PublicKey'
	}

	MultisigAccountModification(){
		self._modificationType = MultisigAccountModificationType.ADD_COSIGNATORY
		self._cosignatoryPublicKey = PublicKey()
		self._cosignatoryPublicKeySize = 32  # reserved field
	}

	tuple comparer(){
		from ..Transforms import ripemd_keccak_256  # pylint: disable=import-outside-toplevel

		return (
			self.modification_type if not isinstance(self.modification_type, Enum) else self.modification_type.value,
			ripemd_keccak_256(self.cosignatory_public_key.bytes),
		)
	}

	None sort(){
		pass
	}

	@property
	MultisigAccountModificationType modificationType(){
		return self._modificationType
	}

	@property
	PublicKey cosignatoryPublicKey(){
		return self._cosignatoryPublicKey
	}

	@modificationType.setter
	modificationType(value: MultisigAccountModificationType){
		self._modificationType = value
	}

	@cosignatoryPublicKey.setter
	cosignatoryPublicKey(value: PublicKey){
		self._cosignatoryPublicKey = value
	}

	int get size(){
		size = 0
		size += self.modificationType.size
		size += 4
		size += self.cosignatoryPublicKey.size
		return size
	}

	static MultisigAccountModification deserialize(Uint8List payload){
		buffer = memoryview(payload)
		modificationType = MultisigAccountModificationType.deserialize(buffer)
		buffer = buffer[modificationType.size:]
		cosignatoryPublicKeySize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert cosignatoryPublicKeySize == 32, f'Invalid value of reserved field ({cosignatoryPublicKeySize})'
		cosignatoryPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[cosignatoryPublicKey.size:]

		instance = MultisigAccountModification()
		instance._modificationType = modificationType
		instance._cosignatoryPublicKey = cosignatoryPublicKey
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self._modificationType.serialize()
		buffer += (buffer..setInt32(0, self._cosignatoryPublicKeySize.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._cosignatoryPublicKey.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'modificationType: {self._modificationType.__str__()}, '
		result += f'cosignatoryPublicKey: {self._cosignatoryPublicKey.__str__()}, '
		result += ')'
		return result
	}
}


class SizePrefixedMultisigAccountModification {
	TYPE_HINTS = {
		'modification': 'struct:MultisigAccountModification'
	}

	SizePrefixedMultisigAccountModification(){
		self._modification = MultisigAccountModification()
	}

	None sort(){
		self._modification.sort()
	}

	@property
	MultisigAccountModification modification(){
		return self._modification
	}

	@modification.setter
	modification(value: MultisigAccountModification){
		self._modification = value
	}

	int get size(){
		size = 0
		size += 4
		size += self.modification.size
		return size
	}

	static SizePrefixedMultisigAccountModification deserialize(Uint8List payload){
		buffer = memoryview(payload)
		modificationSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		# marking sizeof field
		modification = MultisigAccountModification.deserialize(buffer[:modification_size])
		buffer = buffer[modification.size:]

		instance = SizePrefixedMultisigAccountModification()
		instance._modification = modification
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += (buffer..setInt32(0, self.modification.size.toInt(), Endian.little)).buffer.asUint8List();  # modification_size
		buffer += self._modification.serialize()
		return buffer
	}

	str toString(){
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
		'signerPublicKey': 'pod:PublicKey',
		'signature': 'pod:Signature',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'modifications': 'array[SizePrefixedMultisigAccountModification]'
	}

	MultisigAccountModificationTransactionV1(){
		self._type_ = MultisigAccountModificationTransactionV1.TRANSACTION_TYPE
		self._version = MultisigAccountModificationTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._timestamp = Timestamp()
		self._signerPublicKey = PublicKey()
		self._signature = Signature()
		self._fee = Amount()
		self._deadline = Timestamp()
		self._modifications = []
		self._entityBodyReserved_1 = 0  # reserved field
		self._signerPublicKeySize = 32  # reserved field
		self._signatureSize = 64  # reserved field
	}

	None sort(){
		self._modifications = sorted(self._modifications, key=lambda e: e.modification.comparer() if hasattr(e.modification, 'comparer') else e.modification)
	}

	@property
	TransactionType type_(){
		return self._type_
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
	Timestamp timestamp(){
		return self._timestamp
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
	Amount fee(){
		return self._fee
	}

	@property
	Timestamp deadline(){
		return self._deadline
	}

	@property
	List[SizePrefixedMultisigAccountModification] modifications(){
		return self._modifications
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@timestamp.setter
	timestamp(value: Timestamp){
		self._timestamp = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@signature.setter
	signature(value: Signature){
		self._signature = value
	}

	@fee.setter
	fee(value: Amount){
		self._fee = value
	}

	@deadline.setter
	deadline(value: Timestamp){
		self._deadline = value
	}

	@modifications.setter
	modifications(value: List[SizePrefixedMultisigAccountModification]){
		self._modifications = value
	}

	int get size(){
		size = 0
		size += self.type_.size
		size += 1
		size += 2
		size += self.network.size
		size += self.timestamp.size
		size += 4
		size += self.signerPublicKey.size
		size += 4
		size += self.signature.size
		size += self.fee.size
		size += self.deadline.size
		size += 4
		size += ArrayHelpers.size(self.modifications)
		return size
	}

	static MultisigAccountModificationTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt16(0, Endian.little))
		buffer = buffer[2:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		timestamp = Timestamp.deserialize(buffer)
		buffer = buffer[timestamp.size:]
		signerPublicKeySize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert signerPublicKeySize == 32, f'Invalid value of reserved field ({signerPublicKeySize})'
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		signatureSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert signatureSize == 64, f'Invalid value of reserved field ({signatureSize})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		modificationsCount = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		modifications = ArrayHelpers.read_array_count(buffer, SizePrefixedMultisigAccountModification, modifications_count, lambda e: e.modification.comparer() if hasattr(e.modification, 'comparer') else e.modification)
		buffer = buffer[ArrayHelpers.size(modifications):]

		instance = MultisigAccountModificationTransactionV1()
		instance._type_ = type_
		instance._version = version
		instance._network = network
		instance._timestamp = timestamp
		instance._signerPublicKey = signerPublicKey
		instance._signature = signature
		instance._fee = fee
		instance._deadline = deadline
		instance._modifications = modifications
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self._type_.serialize()
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt16(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._timestamp.serialize()
		buffer += (buffer..setInt32(0, self._signerPublicKeySize.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._signatureSize.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signature.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += (buffer..setInt32(0, len(self._modifications).toInt(), Endian.little)).buffer.asUint8List();  # modifications_count
		buffer += ArrayHelpers.write_array(self._modifications, lambda e: e.modification.comparer() if hasattr(e.modification, 'comparer') else e.modification)
		return buffer
	}

	str toString(){
		result = '('
		result += f'type_: {self._type_.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'timestamp: {self._timestamp.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
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
		'signerPublicKey': 'pod:PublicKey',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'modifications': 'array[SizePrefixedMultisigAccountModification]'
	}

	NonVerifiableMultisigAccountModificationTransactionV1(){
		self._type_ = NonVerifiableMultisigAccountModificationTransactionV1.TRANSACTION_TYPE
		self._version = NonVerifiableMultisigAccountModificationTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._timestamp = Timestamp()
		self._signerPublicKey = PublicKey()
		self._fee = Amount()
		self._deadline = Timestamp()
		self._modifications = []
		self._entityBodyReserved_1 = 0  # reserved field
		self._signerPublicKeySize = 32  # reserved field
	}

	None sort(){
		self._modifications = sorted(self._modifications, key=lambda e: e.modification.comparer() if hasattr(e.modification, 'comparer') else e.modification)
	}

	@property
	TransactionType type_(){
		return self._type_
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
	Timestamp timestamp(){
		return self._timestamp
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
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
	List[SizePrefixedMultisigAccountModification] modifications(){
		return self._modifications
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@timestamp.setter
	timestamp(value: Timestamp){
		self._timestamp = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@fee.setter
	fee(value: Amount){
		self._fee = value
	}

	@deadline.setter
	deadline(value: Timestamp){
		self._deadline = value
	}

	@modifications.setter
	modifications(value: List[SizePrefixedMultisigAccountModification]){
		self._modifications = value
	}

	int get size(){
		size = 0
		size += self.type_.size
		size += 1
		size += 2
		size += self.network.size
		size += self.timestamp.size
		size += 4
		size += self.signerPublicKey.size
		size += self.fee.size
		size += self.deadline.size
		size += 4
		size += ArrayHelpers.size(self.modifications)
		return size
	}

	static NonVerifiableMultisigAccountModificationTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt16(0, Endian.little))
		buffer = buffer[2:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		timestamp = Timestamp.deserialize(buffer)
		buffer = buffer[timestamp.size:]
		signerPublicKeySize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert signerPublicKeySize == 32, f'Invalid value of reserved field ({signerPublicKeySize})'
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		modificationsCount = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		modifications = ArrayHelpers.read_array_count(buffer, SizePrefixedMultisigAccountModification, modifications_count, lambda e: e.modification.comparer() if hasattr(e.modification, 'comparer') else e.modification)
		buffer = buffer[ArrayHelpers.size(modifications):]

		instance = NonVerifiableMultisigAccountModificationTransactionV1()
		instance._type_ = type_
		instance._version = version
		instance._network = network
		instance._timestamp = timestamp
		instance._signerPublicKey = signerPublicKey
		instance._fee = fee
		instance._deadline = deadline
		instance._modifications = modifications
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self._type_.serialize()
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt16(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._timestamp.serialize()
		buffer += (buffer..setInt32(0, self._signerPublicKeySize.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signerPublicKey.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += (buffer..setInt32(0, len(self._modifications).toInt(), Endian.little)).buffer.asUint8List();  # modifications_count
		buffer += ArrayHelpers.write_array(self._modifications, lambda e: e.modification.comparer() if hasattr(e.modification, 'comparer') else e.modification)
		return buffer
	}

	str toString(){
		result = '('
		result += f'type_: {self._type_.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'timestamp: {self._timestamp.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
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
		'signerPublicKey': 'pod:PublicKey',
		'signature': 'pod:Signature',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'modifications': 'array[SizePrefixedMultisigAccountModification]'
	}

	MultisigAccountModificationTransactionV2(){
		self._type_ = MultisigAccountModificationTransactionV2.TRANSACTION_TYPE
		self._version = MultisigAccountModificationTransactionV2.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._timestamp = Timestamp()
		self._signerPublicKey = PublicKey()
		self._signature = Signature()
		self._fee = Amount()
		self._deadline = Timestamp()
		self._modifications = []
		self._minApprovalDelta = 0
		self._entityBodyReserved_1 = 0  # reserved field
		self._signerPublicKeySize = 32  # reserved field
		self._signatureSize = 64  # reserved field
		self._minApprovalDeltaSize = 4  # reserved field
	}

	None sort(){
		self._modifications = sorted(self._modifications, key=lambda e: e.modification.comparer() if hasattr(e.modification, 'comparer') else e.modification)
	}

	@property
	TransactionType type_(){
		return self._type_
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
	Timestamp timestamp(){
		return self._timestamp
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
	Amount fee(){
		return self._fee
	}

	@property
	Timestamp deadline(){
		return self._deadline
	}

	@property
	List[SizePrefixedMultisigAccountModification] modifications(){
		return self._modifications
	}

	@property
	int minApprovalDelta(){
		return self._minApprovalDelta
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@timestamp.setter
	timestamp(value: Timestamp){
		self._timestamp = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@signature.setter
	signature(value: Signature){
		self._signature = value
	}

	@fee.setter
	fee(value: Amount){
		self._fee = value
	}

	@deadline.setter
	deadline(value: Timestamp){
		self._deadline = value
	}

	@modifications.setter
	modifications(value: List[SizePrefixedMultisigAccountModification]){
		self._modifications = value
	}

	@minApprovalDelta.setter
	minApprovalDelta(value: int){
		self._minApprovalDelta = value
	}

	int get size(){
		size = 0
		size += self.type_.size
		size += 1
		size += 2
		size += self.network.size
		size += self.timestamp.size
		size += 4
		size += self.signerPublicKey.size
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

	static MultisigAccountModificationTransactionV2 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt16(0, Endian.little))
		buffer = buffer[2:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		timestamp = Timestamp.deserialize(buffer)
		buffer = buffer[timestamp.size:]
		signerPublicKeySize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert signerPublicKeySize == 32, f'Invalid value of reserved field ({signerPublicKeySize})'
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		signatureSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert signatureSize == 64, f'Invalid value of reserved field ({signatureSize})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		modificationsCount = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		modifications = ArrayHelpers.read_array_count(buffer, SizePrefixedMultisigAccountModification, modifications_count, lambda e: e.modification.comparer() if hasattr(e.modification, 'comparer') else e.modification)
		buffer = buffer[ArrayHelpers.size(modifications):]
		minApprovalDeltaSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert minApprovalDeltaSize == 4, f'Invalid value of reserved field ({minApprovalDeltaSize})'
		minApprovalDelta = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]

		instance = MultisigAccountModificationTransactionV2()
		instance._type_ = type_
		instance._version = version
		instance._network = network
		instance._timestamp = timestamp
		instance._signerPublicKey = signerPublicKey
		instance._signature = signature
		instance._fee = fee
		instance._deadline = deadline
		instance._modifications = modifications
		instance._minApprovalDelta = minApprovalDelta
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self._type_.serialize()
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt16(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._timestamp.serialize()
		buffer += (buffer..setInt32(0, self._signerPublicKeySize.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._signatureSize.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signature.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += (buffer..setInt32(0, len(self._modifications).toInt(), Endian.little)).buffer.asUint8List();  # modifications_count
		buffer += ArrayHelpers.write_array(self._modifications, lambda e: e.modification.comparer() if hasattr(e.modification, 'comparer') else e.modification)
		buffer += (buffer..setInt32(0, self._minApprovalDeltaSize.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt32(0, self._minApprovalDelta.toInt(), Endian.little)).buffer.asUint8List();
		return buffer
	}

	str toString(){
		result = '('
		result += f'type_: {self._type_.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'timestamp: {self._timestamp.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'signature: {self._signature.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'modifications: {list(map(str, self._modifications))}, '
		result += f'minApprovalDelta: 0x{self._minApprovalDelta:X}, '
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
		'signerPublicKey': 'pod:PublicKey',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'modifications': 'array[SizePrefixedMultisigAccountModification]'
	}

	NonVerifiableMultisigAccountModificationTransactionV2(){
		self._type_ = NonVerifiableMultisigAccountModificationTransactionV2.TRANSACTION_TYPE
		self._version = NonVerifiableMultisigAccountModificationTransactionV2.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._timestamp = Timestamp()
		self._signerPublicKey = PublicKey()
		self._fee = Amount()
		self._deadline = Timestamp()
		self._modifications = []
		self._minApprovalDelta = 0
		self._entityBodyReserved_1 = 0  # reserved field
		self._signerPublicKeySize = 32  # reserved field
		self._minApprovalDeltaSize = 4  # reserved field
	}

	None sort(){
		self._modifications = sorted(self._modifications, key=lambda e: e.modification.comparer() if hasattr(e.modification, 'comparer') else e.modification)
	}

	@property
	TransactionType type_(){
		return self._type_
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
	Timestamp timestamp(){
		return self._timestamp
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
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
	List[SizePrefixedMultisigAccountModification] modifications(){
		return self._modifications
	}

	@property
	int minApprovalDelta(){
		return self._minApprovalDelta
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@timestamp.setter
	timestamp(value: Timestamp){
		self._timestamp = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@fee.setter
	fee(value: Amount){
		self._fee = value
	}

	@deadline.setter
	deadline(value: Timestamp){
		self._deadline = value
	}

	@modifications.setter
	modifications(value: List[SizePrefixedMultisigAccountModification]){
		self._modifications = value
	}

	@minApprovalDelta.setter
	minApprovalDelta(value: int){
		self._minApprovalDelta = value
	}

	int get size(){
		size = 0
		size += self.type_.size
		size += 1
		size += 2
		size += self.network.size
		size += self.timestamp.size
		size += 4
		size += self.signerPublicKey.size
		size += self.fee.size
		size += self.deadline.size
		size += 4
		size += ArrayHelpers.size(self.modifications)
		size += 4
		size += 4
		return size
	}

	static NonVerifiableMultisigAccountModificationTransactionV2 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt16(0, Endian.little))
		buffer = buffer[2:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		timestamp = Timestamp.deserialize(buffer)
		buffer = buffer[timestamp.size:]
		signerPublicKeySize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert signerPublicKeySize == 32, f'Invalid value of reserved field ({signerPublicKeySize})'
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		modificationsCount = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		modifications = ArrayHelpers.read_array_count(buffer, SizePrefixedMultisigAccountModification, modifications_count, lambda e: e.modification.comparer() if hasattr(e.modification, 'comparer') else e.modification)
		buffer = buffer[ArrayHelpers.size(modifications):]
		minApprovalDeltaSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert minApprovalDeltaSize == 4, f'Invalid value of reserved field ({minApprovalDeltaSize})'
		minApprovalDelta = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]

		instance = NonVerifiableMultisigAccountModificationTransactionV2()
		instance._type_ = type_
		instance._version = version
		instance._network = network
		instance._timestamp = timestamp
		instance._signerPublicKey = signerPublicKey
		instance._fee = fee
		instance._deadline = deadline
		instance._modifications = modifications
		instance._minApprovalDelta = minApprovalDelta
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self._type_.serialize()
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt16(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._timestamp.serialize()
		buffer += (buffer..setInt32(0, self._signerPublicKeySize.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signerPublicKey.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += (buffer..setInt32(0, len(self._modifications).toInt(), Endian.little)).buffer.asUint8List();  # modifications_count
		buffer += ArrayHelpers.write_array(self._modifications, lambda e: e.modification.comparer() if hasattr(e.modification, 'comparer') else e.modification)
		buffer += (buffer..setInt32(0, self._minApprovalDeltaSize.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt32(0, self._minApprovalDelta.toInt(), Endian.little)).buffer.asUint8List();
		return buffer
	}

	str toString(){
		result = '('
		result += f'type_: {self._type_.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'timestamp: {self._timestamp.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'modifications: {list(map(str, self._modifications))}, '
		result += f'minApprovalDelta: 0x{self._minApprovalDelta:X}, '
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
		'signerPublicKey': 'pod:PublicKey',
		'signature': 'pod:Signature',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'multisigTransactionHash': 'pod:Hash256',
		'multisigAccountAddress': 'pod:Address'
	}

	CosignatureV1(){
		self._type_ = CosignatureV1.TRANSACTION_TYPE
		self._version = CosignatureV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._timestamp = Timestamp()
		self._signerPublicKey = PublicKey()
		self._signature = Signature()
		self._fee = Amount()
		self._deadline = Timestamp()
		self._multisigTransactionHash = Hash256()
		self._multisigAccountAddress = Address()
		self._entityBodyReserved_1 = 0  # reserved field
		self._signerPublicKeySize = 32  # reserved field
		self._signatureSize = 64  # reserved field
		self._multisigTransactionHashOuterSize = 36  # reserved field
		self._multisigTransactionHashSize = 32  # reserved field
		self._multisigAccountAddressSize = 40  # reserved field
	}

	None sort(){
		pass
	}

	@property
	TransactionType type_(){
		return self._type_
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
	Timestamp timestamp(){
		return self._timestamp
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
	Amount fee(){
		return self._fee
	}

	@property
	Timestamp deadline(){
		return self._deadline
	}

	@property
	Hash256 multisigTransactionHash(){
		return self._multisigTransactionHash
	}

	@property
	Address multisigAccountAddress(){
		return self._multisigAccountAddress
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@timestamp.setter
	timestamp(value: Timestamp){
		self._timestamp = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@signature.setter
	signature(value: Signature){
		self._signature = value
	}

	@fee.setter
	fee(value: Amount){
		self._fee = value
	}

	@deadline.setter
	deadline(value: Timestamp){
		self._deadline = value
	}

	@multisigTransactionHash.setter
	multisigTransactionHash(value: Hash256){
		self._multisigTransactionHash = value
	}

	@multisigAccountAddress.setter
	multisigAccountAddress(value: Address){
		self._multisigAccountAddress = value
	}

	int get size(){
		size = 0
		size += self.type_.size
		size += 1
		size += 2
		size += self.network.size
		size += self.timestamp.size
		size += 4
		size += self.signerPublicKey.size
		size += 4
		size += self.signature.size
		size += self.fee.size
		size += self.deadline.size
		size += 4
		size += 4
		size += self.multisigTransactionHash.size
		size += 4
		size += self.multisigAccountAddress.size
		return size
	}

	static CosignatureV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt16(0, Endian.little))
		buffer = buffer[2:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		timestamp = Timestamp.deserialize(buffer)
		buffer = buffer[timestamp.size:]
		signerPublicKeySize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert signerPublicKeySize == 32, f'Invalid value of reserved field ({signerPublicKeySize})'
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		signatureSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert signatureSize == 64, f'Invalid value of reserved field ({signatureSize})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		multisigTransactionHashOuterSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert multisigTransactionHashOuterSize == 36, f'Invalid value of reserved field ({multisigTransactionHashOuterSize})'
		multisigTransactionHashSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert multisigTransactionHashSize == 32, f'Invalid value of reserved field ({multisigTransactionHashSize})'
		multisigTransactionHash = Hash256.deserialize(buffer)
		buffer = buffer[multisigTransactionHash.size:]
		multisigAccountAddressSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert multisigAccountAddressSize == 40, f'Invalid value of reserved field ({multisigAccountAddressSize})'
		multisigAccountAddress = Address.deserialize(buffer)
		buffer = buffer[multisigAccountAddress.size:]

		instance = CosignatureV1()
		instance._type_ = type_
		instance._version = version
		instance._network = network
		instance._timestamp = timestamp
		instance._signerPublicKey = signerPublicKey
		instance._signature = signature
		instance._fee = fee
		instance._deadline = deadline
		instance._multisigTransactionHash = multisigTransactionHash
		instance._multisigAccountAddress = multisigAccountAddress
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self._type_.serialize()
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt16(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._timestamp.serialize()
		buffer += (buffer..setInt32(0, self._signerPublicKeySize.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._signatureSize.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signature.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += (buffer..setInt32(0, self._multisigTransactionHashOuterSize.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt32(0, self._multisigTransactionHashSize.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._multisigTransactionHash.serialize()
		buffer += (buffer..setInt32(0, self._multisigAccountAddressSize.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._multisigAccountAddress.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'type_: {self._type_.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'timestamp: {self._timestamp.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'signature: {self._signature.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'multisigTransactionHash: {self._multisigTransactionHash.__str__()}, '
		result += f'multisigAccountAddress: {self._multisigAccountAddress.__str__()}, '
		result += ')'
		return result
	}
}


class SizePrefixedCosignatureV1 {
	TYPE_HINTS = {
		'cosignature': 'struct:CosignatureV1'
	}

	SizePrefixedCosignatureV1(){
		self._cosignature = CosignatureV1()
	}

	None sort(){
		self._cosignature.sort()
	}

	@property
	CosignatureV1 cosignature(){
		return self._cosignature
	}

	@cosignature.setter
	cosignature(value: CosignatureV1){
		self._cosignature = value
	}

	int get size(){
		size = 0
		size += 4
		size += self.cosignature.size
		return size
	}

	static SizePrefixedCosignatureV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		cosignatureSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		# marking sizeof field
		cosignature = CosignatureV1.deserialize(buffer[:cosignature_size])
		buffer = buffer[cosignature.size:]

		instance = SizePrefixedCosignatureV1()
		instance._cosignature = cosignature
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += (buffer..setInt32(0, self.cosignature.size.toInt(), Endian.little)).buffer.asUint8List();  # cosignature_size
		buffer += self._cosignature.serialize()
		return buffer
	}

	str toString(){
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
		'signerPublicKey': 'pod:PublicKey',
		'signature': 'pod:Signature',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'innerTransaction': 'struct:NonVerifiableTransaction',
		'cosignatures': 'array[SizePrefixedCosignatureV1]'
	}

	MultisigTransactionV1(){
		self._type_ = MultisigTransactionV1.TRANSACTION_TYPE
		self._version = MultisigTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._timestamp = Timestamp()
		self._signerPublicKey = PublicKey()
		self._signature = Signature()
		self._fee = Amount()
		self._deadline = Timestamp()
		self._innerTransaction = NonVerifiableTransaction()
		self._cosignatures = []
		self._entityBodyReserved_1 = 0  # reserved field
		self._signerPublicKeySize = 32  # reserved field
		self._signatureSize = 64  # reserved field
	}

	None sort(){
		self._innerTransaction.sort()
	}

	@property
	TransactionType type_(){
		return self._type_
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
	Timestamp timestamp(){
		return self._timestamp
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
	Amount fee(){
		return self._fee
	}

	@property
	Timestamp deadline(){
		return self._deadline
	}

	@property
	NonVerifiableTransaction innerTransaction(){
		return self._innerTransaction
	}

	@property
	List[SizePrefixedCosignatureV1] cosignatures(){
		return self._cosignatures
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@timestamp.setter
	timestamp(value: Timestamp){
		self._timestamp = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@signature.setter
	signature(value: Signature){
		self._signature = value
	}

	@fee.setter
	fee(value: Amount){
		self._fee = value
	}

	@deadline.setter
	deadline(value: Timestamp){
		self._deadline = value
	}

	@innerTransaction.setter
	innerTransaction(value: NonVerifiableTransaction){
		self._innerTransaction = value
	}

	@cosignatures.setter
	cosignatures(value: List[SizePrefixedCosignatureV1]){
		self._cosignatures = value
	}

	int get size(){
		size = 0
		size += self.type_.size
		size += 1
		size += 2
		size += self.network.size
		size += self.timestamp.size
		size += 4
		size += self.signerPublicKey.size
		size += 4
		size += self.signature.size
		size += self.fee.size
		size += self.deadline.size
		size += 4
		size += self.innerTransaction.size
		size += 4
		size += ArrayHelpers.size(self.cosignatures)
		return size
	}

	static MultisigTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt16(0, Endian.little))
		buffer = buffer[2:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		timestamp = Timestamp.deserialize(buffer)
		buffer = buffer[timestamp.size:]
		signerPublicKeySize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert signerPublicKeySize == 32, f'Invalid value of reserved field ({signerPublicKeySize})'
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		signatureSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert signatureSize == 64, f'Invalid value of reserved field ({signatureSize})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		innerTransactionSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		# marking sizeof field
		innerTransaction = NonVerifiableTransactionFactory.deserialize(buffer[:inner_transaction_size])
		buffer = buffer[innerTransaction.size:]
		cosignaturesCount = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		cosignatures = ArrayHelpers.read_array_count(buffer, SizePrefixedCosignatureV1, cosignatures_count)
		buffer = buffer[ArrayHelpers.size(cosignatures):]

		instance = MultisigTransactionV1()
		instance._type_ = type_
		instance._version = version
		instance._network = network
		instance._timestamp = timestamp
		instance._signerPublicKey = signerPublicKey
		instance._signature = signature
		instance._fee = fee
		instance._deadline = deadline
		instance._innerTransaction = innerTransaction
		instance._cosignatures = cosignatures
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self._type_.serialize()
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt16(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._timestamp.serialize()
		buffer += (buffer..setInt32(0, self._signerPublicKeySize.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._signatureSize.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signature.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += (buffer..setInt32(0, self.innerTransaction.size.toInt(), Endian.little)).buffer.asUint8List();  # inner_transaction_size
		buffer += self._innerTransaction.serialize()
		buffer += (buffer..setInt32(0, len(self._cosignatures).toInt(), Endian.little)).buffer.asUint8List();  # cosignatures_count
		buffer += ArrayHelpers.write_array(self._cosignatures)
		return buffer
	}

	str toString(){
		result = '('
		result += f'type_: {self._type_.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'timestamp: {self._timestamp.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'signature: {self._signature.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'innerTransaction: {self._innerTransaction.__str__()}, '
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
		'signerPublicKey': 'pod:PublicKey',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'innerTransaction': 'struct:NonVerifiableTransaction'
	}

	NonVerifiableMultisigTransactionV1(){
		self._type_ = NonVerifiableMultisigTransactionV1.TRANSACTION_TYPE
		self._version = NonVerifiableMultisigTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._timestamp = Timestamp()
		self._signerPublicKey = PublicKey()
		self._fee = Amount()
		self._deadline = Timestamp()
		self._innerTransaction = NonVerifiableTransaction()
		self._entityBodyReserved_1 = 0  # reserved field
		self._signerPublicKeySize = 32  # reserved field
	}

	None sort(){
		self._innerTransaction.sort()
	}

	@property
	TransactionType type_(){
		return self._type_
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
	Timestamp timestamp(){
		return self._timestamp
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
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
	NonVerifiableTransaction innerTransaction(){
		return self._innerTransaction
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@timestamp.setter
	timestamp(value: Timestamp){
		self._timestamp = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@fee.setter
	fee(value: Amount){
		self._fee = value
	}

	@deadline.setter
	deadline(value: Timestamp){
		self._deadline = value
	}

	@innerTransaction.setter
	innerTransaction(value: NonVerifiableTransaction){
		self._innerTransaction = value
	}

	int get size(){
		size = 0
		size += self.type_.size
		size += 1
		size += 2
		size += self.network.size
		size += self.timestamp.size
		size += 4
		size += self.signerPublicKey.size
		size += self.fee.size
		size += self.deadline.size
		size += 4
		size += self.innerTransaction.size
		return size
	}

	static NonVerifiableMultisigTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt16(0, Endian.little))
		buffer = buffer[2:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		timestamp = Timestamp.deserialize(buffer)
		buffer = buffer[timestamp.size:]
		signerPublicKeySize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert signerPublicKeySize == 32, f'Invalid value of reserved field ({signerPublicKeySize})'
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		innerTransactionSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		# marking sizeof field
		innerTransaction = NonVerifiableTransactionFactory.deserialize(buffer[:inner_transaction_size])
		buffer = buffer[innerTransaction.size:]

		instance = NonVerifiableMultisigTransactionV1()
		instance._type_ = type_
		instance._version = version
		instance._network = network
		instance._timestamp = timestamp
		instance._signerPublicKey = signerPublicKey
		instance._fee = fee
		instance._deadline = deadline
		instance._innerTransaction = innerTransaction
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self._type_.serialize()
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt16(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._timestamp.serialize()
		buffer += (buffer..setInt32(0, self._signerPublicKeySize.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signerPublicKey.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += (buffer..setInt32(0, self.innerTransaction.size.toInt(), Endian.little)).buffer.asUint8List();  # inner_transaction_size
		buffer += self._innerTransaction.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'type_: {self._type_.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'timestamp: {self._timestamp.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'innerTransaction: {self._innerTransaction.__str__()}, '
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
		'signerPublicKey': 'pod:PublicKey',
		'signature': 'pod:Signature',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'rentalFeeSink': 'pod:Address',
		'rentalFee': 'pod:Amount',
		'name': 'bytes_array',
		'parentName': 'bytes_array'
	}

	NamespaceRegistrationTransactionV1(){
		self._type_ = NamespaceRegistrationTransactionV1.TRANSACTION_TYPE
		self._version = NamespaceRegistrationTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._timestamp = Timestamp()
		self._signerPublicKey = PublicKey()
		self._signature = Signature()
		self._fee = Amount()
		self._deadline = Timestamp()
		self._rentalFeeSink = Address()
		self._rentalFee = Amount()
		self._name = Uint8List()
		self._parentName = None
		self._entityBodyReserved_1 = 0  # reserved field
		self._signerPublicKeySize = 32  # reserved field
		self._signatureSize = 64  # reserved field
		self._rentalFeeSinkSize = 40  # reserved field
	}

	None sort(){
		pass
	}

	@property
	TransactionType type_(){
		return self._type_
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
	Timestamp timestamp(){
		return self._timestamp
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
	Amount fee(){
		return self._fee
	}

	@property
	Timestamp deadline(){
		return self._deadline
	}

	@property
	Address rentalFeeSink(){
		return self._rentalFeeSink
	}

	@property
	Amount rentalFee(){
		return self._rentalFee
	}

	@property
	bytes name(){
		return self._name
	}

	@property
	bytes parentName(){
		return self._parentName
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@timestamp.setter
	timestamp(value: Timestamp){
		self._timestamp = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@signature.setter
	signature(value: Signature){
		self._signature = value
	}

	@fee.setter
	fee(value: Amount){
		self._fee = value
	}

	@deadline.setter
	deadline(value: Timestamp){
		self._deadline = value
	}

	@rentalFeeSink.setter
	rentalFeeSink(value: Address){
		self._rentalFeeSink = value
	}

	@rentalFee.setter
	rentalFee(value: Amount){
		self._rentalFee = value
	}

	@name.setter
	name(value: bytes){
		self._name = value
	}

	@parentName.setter
	parentName(value: bytes){
		self._parentName = value
	}

	int get size(){
		size = 0
		size += self.type_.size
		size += 1
		size += 2
		size += self.network.size
		size += self.timestamp.size
		size += 4
		size += self.signerPublicKey.size
		size += 4
		size += self.signature.size
		size += self.fee.size
		size += self.deadline.size
		size += 4
		size += self.rentalFeeSink.size
		size += self.rentalFee.size
		size += 4
		size += len(self._name)
		size += 4
		if self.parent_name:
			size += len(self._parentName)
		return size
	}

	static NamespaceRegistrationTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt16(0, Endian.little))
		buffer = buffer[2:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		timestamp = Timestamp.deserialize(buffer)
		buffer = buffer[timestamp.size:]
		signerPublicKeySize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert signerPublicKeySize == 32, f'Invalid value of reserved field ({signerPublicKeySize})'
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		signatureSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert signatureSize == 64, f'Invalid value of reserved field ({signatureSize})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		rentalFeeSinkSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert rentalFeeSinkSize == 40, f'Invalid value of reserved field ({rentalFeeSinkSize})'
		rentalFeeSink = Address.deserialize(buffer)
		buffer = buffer[rentalFeeSink.size:]
		rentalFee = Amount.deserialize(buffer)
		buffer = buffer[rentalFee.size:]
		nameSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		name = Uint8List.fromList(payload)
		buffer = buffer[name_size:]
		parentNameSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		parentName = None
		if 4294967295 != parent_name_size:
			parentName = Uint8List.fromList(payload)
			buffer = buffer[parent_name_size:]

		instance = NamespaceRegistrationTransactionV1()
		instance._type_ = type_
		instance._version = version
		instance._network = network
		instance._timestamp = timestamp
		instance._signerPublicKey = signerPublicKey
		instance._signature = signature
		instance._fee = fee
		instance._deadline = deadline
		instance._rentalFeeSink = rentalFeeSink
		instance._rentalFee = rentalFee
		instance._name = name
		instance._parentName = parentName
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self._type_.serialize()
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt16(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._timestamp.serialize()
		buffer += (buffer..setInt32(0, self._signerPublicKeySize.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._signatureSize.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signature.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += (buffer..setInt32(0, self._rentalFeeSinkSize.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._rentalFeeSink.serialize()
		buffer += self._rentalFee.serialize()
		buffer += (buffer..setInt32(0, len(self._name).toInt(), Endian.little)).buffer.asUint8List();  # name_size
		buffer += self._name
		buffer += (buffer..setInt32(0, (len(self._parentName) if self._parentName is not None else 4294967295).toInt(), Endian.little)).buffer.asUint8List();  # parent_name_size
		if self.parent_name:
			buffer += self._parentName
		return buffer
	}

	str toString(){
		result = '('
		result += f'type_: {self._type_.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'timestamp: {self._timestamp.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'signature: {self._signature.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'rentalFeeSink: {self._rentalFeeSink.__str__()}, '
		result += f'rentalFee: {self._rentalFee.__str__()}, '
		result += f'name: {hexlify(self._name).decode("utf8")}, '
		if self.parent_name:
			result += f'parentName: {hexlify(self._parentName).decode("utf8")}, '
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
		'signerPublicKey': 'pod:PublicKey',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'rentalFeeSink': 'pod:Address',
		'rentalFee': 'pod:Amount',
		'name': 'bytes_array',
		'parentName': 'bytes_array'
	}

	NonVerifiableNamespaceRegistrationTransactionV1(){
		self._type_ = NonVerifiableNamespaceRegistrationTransactionV1.TRANSACTION_TYPE
		self._version = NonVerifiableNamespaceRegistrationTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._timestamp = Timestamp()
		self._signerPublicKey = PublicKey()
		self._fee = Amount()
		self._deadline = Timestamp()
		self._rentalFeeSink = Address()
		self._rentalFee = Amount()
		self._name = Uint8List()
		self._parentName = None
		self._entityBodyReserved_1 = 0  # reserved field
		self._signerPublicKeySize = 32  # reserved field
		self._rentalFeeSinkSize = 40  # reserved field
	}

	None sort(){
		pass
	}

	@property
	TransactionType type_(){
		return self._type_
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
	Timestamp timestamp(){
		return self._timestamp
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
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
	Address rentalFeeSink(){
		return self._rentalFeeSink
	}

	@property
	Amount rentalFee(){
		return self._rentalFee
	}

	@property
	bytes name(){
		return self._name
	}

	@property
	bytes parentName(){
		return self._parentName
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@timestamp.setter
	timestamp(value: Timestamp){
		self._timestamp = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@fee.setter
	fee(value: Amount){
		self._fee = value
	}

	@deadline.setter
	deadline(value: Timestamp){
		self._deadline = value
	}

	@rentalFeeSink.setter
	rentalFeeSink(value: Address){
		self._rentalFeeSink = value
	}

	@rentalFee.setter
	rentalFee(value: Amount){
		self._rentalFee = value
	}

	@name.setter
	name(value: bytes){
		self._name = value
	}

	@parentName.setter
	parentName(value: bytes){
		self._parentName = value
	}

	int get size(){
		size = 0
		size += self.type_.size
		size += 1
		size += 2
		size += self.network.size
		size += self.timestamp.size
		size += 4
		size += self.signerPublicKey.size
		size += self.fee.size
		size += self.deadline.size
		size += 4
		size += self.rentalFeeSink.size
		size += self.rentalFee.size
		size += 4
		size += len(self._name)
		size += 4
		if self.parent_name:
			size += len(self._parentName)
		return size
	}

	static NonVerifiableNamespaceRegistrationTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt16(0, Endian.little))
		buffer = buffer[2:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		timestamp = Timestamp.deserialize(buffer)
		buffer = buffer[timestamp.size:]
		signerPublicKeySize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert signerPublicKeySize == 32, f'Invalid value of reserved field ({signerPublicKeySize})'
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		rentalFeeSinkSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert rentalFeeSinkSize == 40, f'Invalid value of reserved field ({rentalFeeSinkSize})'
		rentalFeeSink = Address.deserialize(buffer)
		buffer = buffer[rentalFeeSink.size:]
		rentalFee = Amount.deserialize(buffer)
		buffer = buffer[rentalFee.size:]
		nameSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		name = Uint8List.fromList(payload)
		buffer = buffer[name_size:]
		parentNameSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		parentName = None
		if 4294967295 != parent_name_size:
			parentName = Uint8List.fromList(payload)
			buffer = buffer[parent_name_size:]

		instance = NonVerifiableNamespaceRegistrationTransactionV1()
		instance._type_ = type_
		instance._version = version
		instance._network = network
		instance._timestamp = timestamp
		instance._signerPublicKey = signerPublicKey
		instance._fee = fee
		instance._deadline = deadline
		instance._rentalFeeSink = rentalFeeSink
		instance._rentalFee = rentalFee
		instance._name = name
		instance._parentName = parentName
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self._type_.serialize()
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt16(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._timestamp.serialize()
		buffer += (buffer..setInt32(0, self._signerPublicKeySize.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signerPublicKey.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += (buffer..setInt32(0, self._rentalFeeSinkSize.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._rentalFeeSink.serialize()
		buffer += self._rentalFee.serialize()
		buffer += (buffer..setInt32(0, len(self._name).toInt(), Endian.little)).buffer.asUint8List();  # name_size
		buffer += self._name
		buffer += (buffer..setInt32(0, (len(self._parentName) if self._parentName is not None else 4294967295).toInt(), Endian.little)).buffer.asUint8List();  # parent_name_size
		if self.parent_name:
			buffer += self._parentName
		return buffer
	}

	str toString(){
		result = '('
		result += f'type_: {self._type_.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'timestamp: {self._timestamp.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'rentalFeeSink: {self._rentalFeeSink.__str__()}, '
		result += f'rentalFee: {self._rentalFee.__str__()}, '
		result += f'name: {hexlify(self._name).decode("utf8")}, '
		if self.parent_name:
			result += f'parentName: {hexlify(self._parentName).decode("utf8")}, '
		result += ')'
		return result
	}
}


class MessageType extends (Enum) {
	PLAIN = 1
	ENCRYPTED = 2

	int get size(){
		return 4
	}

	static MessageType deserialize(Uint8List payload){
		buffer = memoryview(payload)
		return MessageType(BigInt.from(buffer.getInt32(0, Endian.little)))
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += (buffer..setInt32(0, self.value.toInt(), Endian.little)).buffer.asUint8List();
		return buffer
	}
}


class Message {
	TYPE_HINTS = {
		'messageType': 'enum:MessageType',
		'message': 'bytes_array'
	}

	Message(){
		self._messageType = MessageType.PLAIN
		self._message = Uint8List()
	}

	None sort(){
		pass
	}

	@property
	MessageType messageType(){
		return self._messageType
	}

	@property
	bytes message(){
		return self._message
	}

	@messageType.setter
	messageType(value: MessageType){
		self._messageType = value
	}

	@message.setter
	message(value: bytes){
		self._message = value
	}

	int get size(){
		size = 0
		size += self.messageType.size
		size += 4
		size += len(self._message)
		return size
	}

	static Message deserialize(Uint8List payload){
		buffer = memoryview(payload)
		messageType = MessageType.deserialize(buffer)
		buffer = buffer[messageType.size:]
		messageSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		message = Uint8List.fromList(payload)
		buffer = buffer[message_size:]

		instance = Message()
		instance._messageType = messageType
		instance._message = message
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self._messageType.serialize()
		buffer += (buffer..setInt32(0, len(self._message).toInt(), Endian.little)).buffer.asUint8List();  # message_size
		buffer += self._message
		return buffer
	}

	str toString(){
		result = '('
		result += f'messageType: {self._messageType.__str__()}, '
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
		'signerPublicKey': 'pod:PublicKey',
		'signature': 'pod:Signature',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'recipientAddress': 'pod:Address',
		'amount': 'pod:Amount',
		'message': 'struct:Message'
	}

	TransferTransactionV1(){
		self._type_ = TransferTransactionV1.TRANSACTION_TYPE
		self._version = TransferTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._timestamp = Timestamp()
		self._signerPublicKey = PublicKey()
		self._signature = Signature()
		self._fee = Amount()
		self._deadline = Timestamp()
		self._recipientAddress = Address()
		self._amount = Amount()
		self._message = None
		self._entityBodyReserved_1 = 0  # reserved field
		self._signerPublicKeySize = 32  # reserved field
		self._signatureSize = 64  # reserved field
		self._recipientAddressSize = 40  # reserved field
	}

	None sort(){
		if 0 != self.message_envelope_size_computed:
			self._message.sort()
	}

	@property
	TransactionType type_(){
		return self._type_
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
	Timestamp timestamp(){
		return self._timestamp
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
	Amount fee(){
		return self._fee
	}

	@property
	Timestamp deadline(){
		return self._deadline
	}

	@property
	Address recipientAddress(){
		return self._recipientAddress
	}

	@property
	Amount amount(){
		return self._amount
	}

	@property
	Message message(){
		return self._message
	}

	@property
	int messageEnvelopeSize_computed(){
		return 0 if not self.message else self.message.size + 0
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@timestamp.setter
	timestamp(value: Timestamp){
		self._timestamp = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@signature.setter
	signature(value: Signature){
		self._signature = value
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
	recipientAddress(value: Address){
		self._recipientAddress = value
	}

	@amount.setter
	amount(value: Amount){
		self._amount = value
	}

	@message.setter
	message(value: Message){
		self._message = value
	}

	int get size(){
		size = 0
		size += self.type_.size
		size += 1
		size += 2
		size += self.network.size
		size += self.timestamp.size
		size += 4
		size += self.signerPublicKey.size
		size += 4
		size += self.signature.size
		size += self.fee.size
		size += self.deadline.size
		size += 4
		size += self.recipientAddress.size
		size += self.amount.size
		size += 4
		if 0 != self.message_envelope_size_computed:
			size += self.message.size
		return size
	}

	static TransferTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt16(0, Endian.little))
		buffer = buffer[2:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		timestamp = Timestamp.deserialize(buffer)
		buffer = buffer[timestamp.size:]
		signerPublicKeySize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert signerPublicKeySize == 32, f'Invalid value of reserved field ({signerPublicKeySize})'
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		signatureSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert signatureSize == 64, f'Invalid value of reserved field ({signatureSize})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		recipientAddressSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert recipientAddressSize == 40, f'Invalid value of reserved field ({recipientAddressSize})'
		recipientAddress = Address.deserialize(buffer)
		buffer = buffer[recipientAddress.size:]
		amount = Amount.deserialize(buffer)
		buffer = buffer[amount.size:]
		messageEnvelopeSize = BigInt.from(buffer.getInt32(0, Endian.little))
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
		instance._signerPublicKey = signerPublicKey
		instance._signature = signature
		instance._fee = fee
		instance._deadline = deadline
		instance._recipientAddress = recipientAddress
		instance._amount = amount
		instance._message = message
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self._type_.serialize()
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt16(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._timestamp.serialize()
		buffer += (buffer..setInt32(0, self._signerPublicKeySize.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._signatureSize.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signature.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += (buffer..setInt32(0, self._recipientAddressSize.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._recipientAddress.serialize()
		buffer += self._amount.serialize()
		buffer += (buffer..setInt32(0, self.messageEnvelopeSize_computed.toInt(), Endian.little)).buffer.asUint8List();
		if 0 != self.message_envelope_size_computed:
			buffer += self._message.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'type_: {self._type_.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'timestamp: {self._timestamp.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'signature: {self._signature.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'recipientAddress: {self._recipientAddress.__str__()}, '
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
		'signerPublicKey': 'pod:PublicKey',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'recipientAddress': 'pod:Address',
		'amount': 'pod:Amount',
		'message': 'struct:Message'
	}

	NonVerifiableTransferTransactionV1(){
		self._type_ = NonVerifiableTransferTransactionV1.TRANSACTION_TYPE
		self._version = NonVerifiableTransferTransactionV1.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._timestamp = Timestamp()
		self._signerPublicKey = PublicKey()
		self._fee = Amount()
		self._deadline = Timestamp()
		self._recipientAddress = Address()
		self._amount = Amount()
		self._message = None
		self._entityBodyReserved_1 = 0  # reserved field
		self._signerPublicKeySize = 32  # reserved field
		self._recipientAddressSize = 40  # reserved field
	}

	None sort(){
		if 0 != self.message_envelope_size_computed:
			self._message.sort()
	}

	@property
	TransactionType type_(){
		return self._type_
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
	Timestamp timestamp(){
		return self._timestamp
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
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
	Address recipientAddress(){
		return self._recipientAddress
	}

	@property
	Amount amount(){
		return self._amount
	}

	@property
	Message message(){
		return self._message
	}

	@property
	int messageEnvelopeSize_computed(){
		return 0 if not self.message else self.message.size + 0
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@timestamp.setter
	timestamp(value: Timestamp){
		self._timestamp = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
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
	recipientAddress(value: Address){
		self._recipientAddress = value
	}

	@amount.setter
	amount(value: Amount){
		self._amount = value
	}

	@message.setter
	message(value: Message){
		self._message = value
	}

	int get size(){
		size = 0
		size += self.type_.size
		size += 1
		size += 2
		size += self.network.size
		size += self.timestamp.size
		size += 4
		size += self.signerPublicKey.size
		size += self.fee.size
		size += self.deadline.size
		size += 4
		size += self.recipientAddress.size
		size += self.amount.size
		size += 4
		if 0 != self.message_envelope_size_computed:
			size += self.message.size
		return size
	}

	static NonVerifiableTransferTransactionV1 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt16(0, Endian.little))
		buffer = buffer[2:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		timestamp = Timestamp.deserialize(buffer)
		buffer = buffer[timestamp.size:]
		signerPublicKeySize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert signerPublicKeySize == 32, f'Invalid value of reserved field ({signerPublicKeySize})'
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		recipientAddressSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert recipientAddressSize == 40, f'Invalid value of reserved field ({recipientAddressSize})'
		recipientAddress = Address.deserialize(buffer)
		buffer = buffer[recipientAddress.size:]
		amount = Amount.deserialize(buffer)
		buffer = buffer[amount.size:]
		messageEnvelopeSize = BigInt.from(buffer.getInt32(0, Endian.little))
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
		instance._signerPublicKey = signerPublicKey
		instance._fee = fee
		instance._deadline = deadline
		instance._recipientAddress = recipientAddress
		instance._amount = amount
		instance._message = message
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self._type_.serialize()
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt16(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._timestamp.serialize()
		buffer += (buffer..setInt32(0, self._signerPublicKeySize.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signerPublicKey.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += (buffer..setInt32(0, self._recipientAddressSize.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._recipientAddress.serialize()
		buffer += self._amount.serialize()
		buffer += (buffer..setInt32(0, self.messageEnvelopeSize_computed.toInt(), Endian.little)).buffer.asUint8List();
		if 0 != self.message_envelope_size_computed:
			buffer += self._message.serialize()
		return buffer
	}

	str toString(){
		result = '('
		result += f'type_: {self._type_.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'timestamp: {self._timestamp.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'recipientAddress: {self._recipientAddress.__str__()}, '
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
		'signerPublicKey': 'pod:PublicKey',
		'signature': 'pod:Signature',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'recipientAddress': 'pod:Address',
		'amount': 'pod:Amount',
		'message': 'struct:Message',
		'mosaics': 'array[SizePrefixedMosaic]'
	}

	TransferTransactionV2(){
		self._type_ = TransferTransactionV2.TRANSACTION_TYPE
		self._version = TransferTransactionV2.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._timestamp = Timestamp()
		self._signerPublicKey = PublicKey()
		self._signature = Signature()
		self._fee = Amount()
		self._deadline = Timestamp()
		self._recipientAddress = Address()
		self._amount = Amount()
		self._message = None
		self._mosaics = []
		self._entityBodyReserved_1 = 0  # reserved field
		self._signerPublicKeySize = 32  # reserved field
		self._signatureSize = 64  # reserved field
		self._recipientAddressSize = 40  # reserved field
	}

	None sort(){
		if 0 != self.message_envelope_size_computed:
			self._message.sort()
	}

	@property
	TransactionType type_(){
		return self._type_
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
	Timestamp timestamp(){
		return self._timestamp
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
	Amount fee(){
		return self._fee
	}

	@property
	Timestamp deadline(){
		return self._deadline
	}

	@property
	Address recipientAddress(){
		return self._recipientAddress
	}

	@property
	Amount amount(){
		return self._amount
	}

	@property
	Message message(){
		return self._message
	}

	@property
	List[SizePrefixedMosaic] mosaics(){
		return self._mosaics
	}

	@property
	int messageEnvelopeSize_computed(){
		return 0 if not self.message else self.message.size + 0
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@timestamp.setter
	timestamp(value: Timestamp){
		self._timestamp = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
	}

	@signature.setter
	signature(value: Signature){
		self._signature = value
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
	recipientAddress(value: Address){
		self._recipientAddress = value
	}

	@amount.setter
	amount(value: Amount){
		self._amount = value
	}

	@message.setter
	message(value: Message){
		self._message = value
	}

	@mosaics.setter
	mosaics(value: List[SizePrefixedMosaic]){
		self._mosaics = value
	}

	int get size(){
		size = 0
		size += self.type_.size
		size += 1
		size += 2
		size += self.network.size
		size += self.timestamp.size
		size += 4
		size += self.signerPublicKey.size
		size += 4
		size += self.signature.size
		size += self.fee.size
		size += self.deadline.size
		size += 4
		size += self.recipientAddress.size
		size += self.amount.size
		size += 4
		if 0 != self.message_envelope_size_computed:
			size += self.message.size
		size += 4
		size += ArrayHelpers.size(self.mosaics)
		return size
	}

	static TransferTransactionV2 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt16(0, Endian.little))
		buffer = buffer[2:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		timestamp = Timestamp.deserialize(buffer)
		buffer = buffer[timestamp.size:]
		signerPublicKeySize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert signerPublicKeySize == 32, f'Invalid value of reserved field ({signerPublicKeySize})'
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		signatureSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert signatureSize == 64, f'Invalid value of reserved field ({signatureSize})'
		signature = Signature.deserialize(buffer)
		buffer = buffer[signature.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		recipientAddressSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert recipientAddressSize == 40, f'Invalid value of reserved field ({recipientAddressSize})'
		recipientAddress = Address.deserialize(buffer)
		buffer = buffer[recipientAddress.size:]
		amount = Amount.deserialize(buffer)
		buffer = buffer[amount.size:]
		messageEnvelopeSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		message = None
		if 0 != message_envelope_size:
			message = Message.deserialize(buffer)
			buffer = buffer[message.size:]
		mosaicsCount = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		mosaics = ArrayHelpers.read_array_count(buffer, SizePrefixedMosaic, mosaics_count)
		buffer = buffer[ArrayHelpers.size(mosaics):]

		instance = TransferTransactionV2()
		instance._type_ = type_
		instance._version = version
		instance._network = network
		instance._timestamp = timestamp
		instance._signerPublicKey = signerPublicKey
		instance._signature = signature
		instance._fee = fee
		instance._deadline = deadline
		instance._recipientAddress = recipientAddress
		instance._amount = amount
		instance._message = message
		instance._mosaics = mosaics
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self._type_.serialize()
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt16(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._timestamp.serialize()
		buffer += (buffer..setInt32(0, self._signerPublicKeySize.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signerPublicKey.serialize()
		buffer += (buffer..setInt32(0, self._signatureSize.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signature.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += (buffer..setInt32(0, self._recipientAddressSize.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._recipientAddress.serialize()
		buffer += self._amount.serialize()
		buffer += (buffer..setInt32(0, self.messageEnvelopeSize_computed.toInt(), Endian.little)).buffer.asUint8List();
		if 0 != self.message_envelope_size_computed:
			buffer += self._message.serialize()
		buffer += (buffer..setInt32(0, len(self._mosaics).toInt(), Endian.little)).buffer.asUint8List();  # mosaics_count
		buffer += ArrayHelpers.write_array(self._mosaics)
		return buffer
	}

	str toString(){
		result = '('
		result += f'type_: {self._type_.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'timestamp: {self._timestamp.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'signature: {self._signature.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'recipientAddress: {self._recipientAddress.__str__()}, '
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
		'signerPublicKey': 'pod:PublicKey',
		'fee': 'pod:Amount',
		'deadline': 'pod:Timestamp',
		'recipientAddress': 'pod:Address',
		'amount': 'pod:Amount',
		'message': 'struct:Message',
		'mosaics': 'array[SizePrefixedMosaic]'
	}

	NonVerifiableTransferTransactionV2(){
		self._type_ = NonVerifiableTransferTransactionV2.TRANSACTION_TYPE
		self._version = NonVerifiableTransferTransactionV2.TRANSACTION_VERSION
		self._network = NetworkType.MAINNET
		self._timestamp = Timestamp()
		self._signerPublicKey = PublicKey()
		self._fee = Amount()
		self._deadline = Timestamp()
		self._recipientAddress = Address()
		self._amount = Amount()
		self._message = None
		self._mosaics = []
		self._entityBodyReserved_1 = 0  # reserved field
		self._signerPublicKeySize = 32  # reserved field
		self._recipientAddressSize = 40  # reserved field
	}

	None sort(){
		if 0 != self.message_envelope_size_computed:
			self._message.sort()
	}

	@property
	TransactionType type_(){
		return self._type_
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
	Timestamp timestamp(){
		return self._timestamp
	}

	@property
	PublicKey signerPublicKey(){
		return self._signerPublicKey
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
	Address recipientAddress(){
		return self._recipientAddress
	}

	@property
	Amount amount(){
		return self._amount
	}

	@property
	Message message(){
		return self._message
	}

	@property
	List[SizePrefixedMosaic] mosaics(){
		return self._mosaics
	}

	@property
	int messageEnvelopeSize_computed(){
		return 0 if not self.message else self.message.size + 0
	}

	@type_.setter
	type_(value: TransactionType){
		self._type_ = value
	}

	@version.setter
	version(value: int){
		self._version = value
	}

	@network.setter
	network(value: NetworkType){
		self._network = value
	}

	@timestamp.setter
	timestamp(value: Timestamp){
		self._timestamp = value
	}

	@signerPublicKey.setter
	signerPublicKey(value: PublicKey){
		self._signerPublicKey = value
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
	recipientAddress(value: Address){
		self._recipientAddress = value
	}

	@amount.setter
	amount(value: Amount){
		self._amount = value
	}

	@message.setter
	message(value: Message){
		self._message = value
	}

	@mosaics.setter
	mosaics(value: List[SizePrefixedMosaic]){
		self._mosaics = value
	}

	int get size(){
		size = 0
		size += self.type_.size
		size += 1
		size += 2
		size += self.network.size
		size += self.timestamp.size
		size += 4
		size += self.signerPublicKey.size
		size += self.fee.size
		size += self.deadline.size
		size += 4
		size += self.recipientAddress.size
		size += self.amount.size
		size += 4
		if 0 != self.message_envelope_size_computed:
			size += self.message.size
		size += 4
		size += ArrayHelpers.size(self.mosaics)
		return size
	}

	static NonVerifiableTransferTransactionV2 deserialize(Uint8List payload){
		buffer = memoryview(payload)
		type_ = TransactionType.deserialize(buffer)
		buffer = buffer[type_.size:]
		version = BigInt.from(buffer.getInt8(0, Endian.little))
		buffer = buffer[1:]
		entityBodyReserved_1 = BigInt.from(buffer.getInt16(0, Endian.little))
		buffer = buffer[2:]
		assert entityBodyReserved_1 == 0, f'Invalid value of reserved field ({entityBodyReserved_1})'
		network = NetworkType.deserialize(buffer)
		buffer = buffer[network.size:]
		timestamp = Timestamp.deserialize(buffer)
		buffer = buffer[timestamp.size:]
		signerPublicKeySize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert signerPublicKeySize == 32, f'Invalid value of reserved field ({signerPublicKeySize})'
		signerPublicKey = PublicKey.deserialize(buffer)
		buffer = buffer[signerPublicKey.size:]
		fee = Amount.deserialize(buffer)
		buffer = buffer[fee.size:]
		deadline = Timestamp.deserialize(buffer)
		buffer = buffer[deadline.size:]
		recipientAddressSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		assert recipientAddressSize == 40, f'Invalid value of reserved field ({recipientAddressSize})'
		recipientAddress = Address.deserialize(buffer)
		buffer = buffer[recipientAddress.size:]
		amount = Amount.deserialize(buffer)
		buffer = buffer[amount.size:]
		messageEnvelopeSize = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		message = None
		if 0 != message_envelope_size:
			message = Message.deserialize(buffer)
			buffer = buffer[message.size:]
		mosaicsCount = BigInt.from(buffer.getInt32(0, Endian.little))
		buffer = buffer[4:]
		mosaics = ArrayHelpers.read_array_count(buffer, SizePrefixedMosaic, mosaics_count)
		buffer = buffer[ArrayHelpers.size(mosaics):]

		instance = NonVerifiableTransferTransactionV2()
		instance._type_ = type_
		instance._version = version
		instance._network = network
		instance._timestamp = timestamp
		instance._signerPublicKey = signerPublicKey
		instance._fee = fee
		instance._deadline = deadline
		instance._recipientAddress = recipientAddress
		instance._amount = amount
		instance._message = message
		instance._mosaics = mosaics
		return instance
	}

	Uint8List serialize(){
		buffer = bytes()
		buffer += self._type_.serialize()
		buffer += (buffer..setInt8(0, self._version.toInt(), Endian.little)).buffer.asUint8List();
		buffer += (buffer..setInt16(0, self._entityBodyReserved_1.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._network.serialize()
		buffer += self._timestamp.serialize()
		buffer += (buffer..setInt32(0, self._signerPublicKeySize.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._signerPublicKey.serialize()
		buffer += self._fee.serialize()
		buffer += self._deadline.serialize()
		buffer += (buffer..setInt32(0, self._recipientAddressSize.toInt(), Endian.little)).buffer.asUint8List();
		buffer += self._recipientAddress.serialize()
		buffer += self._amount.serialize()
		buffer += (buffer..setInt32(0, self.messageEnvelopeSize_computed.toInt(), Endian.little)).buffer.asUint8List();
		if 0 != self.message_envelope_size_computed:
			buffer += self._message.serialize()
		buffer += (buffer..setInt32(0, len(self._mosaics).toInt(), Endian.little)).buffer.asUint8List();  # mosaics_count
		buffer += ArrayHelpers.write_array(self._mosaics)
		return buffer
	}

	str toString(){
		result = '('
		result += f'type_: {self._type_.__str__()}, '
		result += f'version: 0x{self._version:X}, '
		result += f'network: {self._network.__str__()}, '
		result += f'timestamp: {self._timestamp.__str__()}, '
		result += f'signerPublicKey: {self._signerPublicKey.__str__()}, '
		result += f'fee: {self._fee.__str__()}, '
		result += f'deadline: {self._deadline.__str__()}, '
		result += f'recipientAddress: {self._recipientAddress.__str__()}, '
		result += f'amount: {self._amount.__str__()}, '
		if 0 != self.message_envelope_size_computed:
			result += f'message: {self._message.__str__()}, '
		result += f'mosaics: {list(map(str, self._mosaics))}, '
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

	@classmethod
	Transaction create_by_name(entity_name: str){
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
	@classmethod
	NonVerifiableTransaction deserialize(payload: bytes){
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

	@classmethod
	NonVerifiableTransaction create_by_name(entity_name: str){
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
