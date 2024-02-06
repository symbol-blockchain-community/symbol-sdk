namespace SymbolSdk.Symbol{

public class Amount : BaseValue, ISerializer {
	public const byte SIZE = 8;

	public Amount(object? amount = null): base(SIZE, amount) {
	}

	public static Amount Deserialize(BinaryReader br) {
		return new Amount(br.ReadUInt64());
	}

	public byte[] Serialize() {
		return BitConverter.GetBytes(Value);
	}
}

public class BlockDuration : BaseValue, ISerializer {
	public const byte SIZE = 8;

	public BlockDuration(object? blockDuration = null): base(SIZE, blockDuration) {
	}

	public static BlockDuration Deserialize(BinaryReader br) {
		return new BlockDuration(br.ReadUInt64());
	}

	public byte[] Serialize() {
		return BitConverter.GetBytes(Value);
	}
}

public class BlockFeeMultiplier : BaseValue, ISerializer {
	public const byte SIZE = 4;

	public BlockFeeMultiplier(object? blockFeeMultiplier = null): base(SIZE, blockFeeMultiplier) {
	}

	public static BlockFeeMultiplier Deserialize(BinaryReader br) {
		return new BlockFeeMultiplier(br.ReadUInt32());
	}

	public byte[] Serialize() {
		return BitConverter.GetBytes((uint)Value);
	}
}

public class Difficulty : BaseValue, ISerializer {
	public const byte SIZE = 8;

	public Difficulty(object? difficulty = null): base(SIZE, difficulty) {
	}

	public static Difficulty Deserialize(BinaryReader br) {
		return new Difficulty(br.ReadUInt64());
	}

	public byte[] Serialize() {
		return BitConverter.GetBytes(Value);
	}
}

public class FinalizationEpoch : BaseValue, ISerializer {
	public const byte SIZE = 4;

	public FinalizationEpoch(object? finalizationEpoch = null): base(SIZE, finalizationEpoch) {
	}

	public static FinalizationEpoch Deserialize(BinaryReader br) {
		return new FinalizationEpoch(br.ReadUInt32());
	}

	public byte[] Serialize() {
		return BitConverter.GetBytes((uint)Value);
	}
}

public class FinalizationPoint : BaseValue, ISerializer {
	public const byte SIZE = 4;

	public FinalizationPoint(object? finalizationPoint = null): base(SIZE, finalizationPoint) {
	}

	public static FinalizationPoint Deserialize(BinaryReader br) {
		return new FinalizationPoint(br.ReadUInt32());
	}

	public byte[] Serialize() {
		return BitConverter.GetBytes((uint)Value);
	}
}

public class Height : BaseValue, ISerializer {
	public const byte SIZE = 8;

	public Height(object? height = null): base(SIZE, height) {
	}

	public static Height Deserialize(BinaryReader br) {
		return new Height(br.ReadUInt64());
	}

	public byte[] Serialize() {
		return BitConverter.GetBytes(Value);
	}
}

public class Importance : BaseValue, ISerializer {
	public const byte SIZE = 8;

	public Importance(object? importance = null): base(SIZE, importance) {
	}

	public static Importance Deserialize(BinaryReader br) {
		return new Importance(br.ReadUInt64());
	}

	public byte[] Serialize() {
		return BitConverter.GetBytes(Value);
	}
}

public class ImportanceHeight : BaseValue, ISerializer {
	public const byte SIZE = 8;

	public ImportanceHeight(object? importanceHeight = null): base(SIZE, importanceHeight) {
	}

	public static ImportanceHeight Deserialize(BinaryReader br) {
		return new ImportanceHeight(br.ReadUInt64());
	}

	public byte[] Serialize() {
		return BitConverter.GetBytes(Value);
	}
}

public class UnresolvedMosaicId : BaseValue, ISerializer {
	public const byte SIZE = 8;

	public UnresolvedMosaicId(object? unresolvedMosaicId = null): base(SIZE, unresolvedMosaicId) {
	}

	public static UnresolvedMosaicId Deserialize(BinaryReader br) {
		return new UnresolvedMosaicId(br.ReadUInt64());
	}

	public byte[] Serialize() {
		return BitConverter.GetBytes(Value);
	}
}

public class MosaicId : BaseValue, ISerializer {
	public const byte SIZE = 8;

	public MosaicId(object? mosaicId = null): base(SIZE, mosaicId) {
	}

	public static MosaicId Deserialize(BinaryReader br) {
		return new MosaicId(br.ReadUInt64());
	}

	public byte[] Serialize() {
		return BitConverter.GetBytes(Value);
	}
}

public class Timestamp : BaseValue, ISerializer {
	public const byte SIZE = 8;

	public Timestamp(object? timestamp = null): base(SIZE, timestamp) {
	}

	public static Timestamp Deserialize(BinaryReader br) {
		return new Timestamp(br.ReadUInt64());
	}

	public byte[] Serialize() {
		return BitConverter.GetBytes(Value);
	}
}

public class UnresolvedAddress : ByteArray, ISerializer {
	public const byte SIZE = 24;

	public UnresolvedAddress(object? unresolvedAddress = null): base(SIZE, unresolvedAddress) {
	}

	public static UnresolvedAddress Deserialize(BinaryReader br) {
		return new UnresolvedAddress(br.ReadBytes(24));
	}

	public byte[] Serialize() {
		return bytes;
	}
}

public class Address : ByteArray, ISerializer {
	public const byte SIZE = 24;

	public Address(object? address = null): base(SIZE, address) {
	}

	public static Address Deserialize(BinaryReader br) {
		return new Address(br.ReadBytes(24));
	}

	public byte[] Serialize() {
		return bytes;
	}
}

public class Hash256 : ByteArray, ISerializer {
	public const byte SIZE = 32;

	public Hash256(object? hash256 = null): base(SIZE, hash256) {
	}

	public static Hash256 Deserialize(BinaryReader br) {
		return new Hash256(br.ReadBytes(32));
	}

	public byte[] Serialize() {
		return bytes;
	}
}

public class Hash512 : ByteArray, ISerializer {
	public const byte SIZE = 64;

	public Hash512(object? hash512 = null): base(SIZE, hash512) {
	}

	public static Hash512 Deserialize(BinaryReader br) {
		return new Hash512(br.ReadBytes(64));
	}

	public byte[] Serialize() {
		return bytes;
	}
}

public class PublicKey : ByteArray, ISerializer {
	public const byte SIZE = 32;

	public PublicKey(object? publicKey = null): base(SIZE, publicKey) {
	}

	public static PublicKey Deserialize(BinaryReader br) {
		return new PublicKey(br.ReadBytes(32));
	}

	public byte[] Serialize() {
		return bytes;
	}
}

public class VotingPublicKey : ByteArray, ISerializer {
	public const byte SIZE = 32;

	public VotingPublicKey(object? votingPublicKey = null): base(SIZE, votingPublicKey) {
	}

	public static VotingPublicKey Deserialize(BinaryReader br) {
		return new VotingPublicKey(br.ReadBytes(32));
	}

	public byte[] Serialize() {
		return bytes;
	}
}

public class Signature : ByteArray, ISerializer {
	public const byte SIZE = 64;

	public Signature(object? signature = null): base(SIZE, signature) {
	}

	public static Signature Deserialize(BinaryReader br) {
		return new Signature(br.ReadBytes(64));
	}

	public byte[] Serialize() {
		return bytes;
	}
}

public class Mosaic : ISerializer {
	public Mosaic(MosaicId? mosaicId = null, Amount? amount = null) {
		MosaicId = mosaicId ?? new MosaicId();
		Amount = amount ?? new Amount();
	}

	public void Sort() {
	}

	public MosaicId MosaicId {
		get; set;
	}

	public Amount Amount {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += MosaicId.Size;
			size += Amount.Size;
			return size;
		}
	}

	public static Mosaic Deserialize(BinaryReader br) {
		var mosaicId = MosaicId.Deserialize(br);
		var amount = Amount.Deserialize(br);

		var instance = new Mosaic(
			mosaicId,
			amount);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(MosaicId.Serialize()); 
		bw.Write(Amount.Serialize()); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"mosaicId: {MosaicId}, ";
		result += $"amount: {Amount}, ";
		result += ")";
		return result;
	}
}

public class UnresolvedMosaic : ISerializer {
	public UnresolvedMosaic(UnresolvedMosaicId? mosaicId = null, Amount? amount = null) {
		MosaicId = mosaicId ?? new UnresolvedMosaicId();
		Amount = amount ?? new Amount();
	}

	public void Sort() {
	}

	public UnresolvedMosaicId MosaicId {
		get; set;
	}

	public Amount Amount {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += MosaicId.Size;
			size += Amount.Size;
			return size;
		}
	}

	public static UnresolvedMosaic Deserialize(BinaryReader br) {
		var mosaicId = UnresolvedMosaicId.Deserialize(br);
		var amount = Amount.Deserialize(br);

		var instance = new UnresolvedMosaic(
			mosaicId,
			amount);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(MosaicId.Serialize()); 
		bw.Write(Amount.Serialize()); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"mosaicId: {MosaicId}, ";
		result += $"amount: {Amount}, ";
		result += ")";
		return result;
	}
}

public class LinkAction : IEnum<byte> {
	public static readonly LinkAction UNLINK = new LinkAction(0);

	public static readonly LinkAction LINK = new LinkAction(1);

	public byte Value { get; }

	public LinkAction(byte value = 0) {
		Value = value;
	}

	internal static string ValueToKey(uint value) {
		var values = new uint[]{
			0, 1
		};
		var keys = new []{
			"UNLINK", "LINK"
		};

		var index = Array.IndexOf(values, value);
		if (-1 == index)
			throw new Exception($"invalid enum value {value}");

		return keys[index];
	}

	internal static LinkAction FromValue(uint value) {
		return value switch
		{
			0 => UNLINK,
			1 => LINK,
			_ => throw new Exception($"invalid enum value {value}")
		};
	}

	public uint Size {
		get {
			return 1;
		}
	}

	public static LinkAction Deserialize(BinaryReader br) {
		return FromValue(br.ReadByte());
	}

	public byte[] Serialize() {
		return new []{Value};
	}

	public override string ToString() {
		return $"LinkAction.{ValueToKey(Value)}";
	}
}

public class NetworkType : IEnum<byte> {
	public static readonly NetworkType MAINNET = new NetworkType(104);

	public static readonly NetworkType TESTNET = new NetworkType(152);

	public byte Value { get; }

	public NetworkType(byte value = 0) {
		Value = value;
	}

	internal static string ValueToKey(uint value) {
		var values = new uint[]{
			104, 152
		};
		var keys = new []{
			"MAINNET", "TESTNET"
		};

		var index = Array.IndexOf(values, value);
		if (-1 == index)
			throw new Exception($"invalid enum value {value}");

		return keys[index];
	}

	internal static NetworkType FromValue(uint value) {
		return value switch
		{
			104 => MAINNET,
			152 => TESTNET,
			_ => throw new Exception($"invalid enum value {value}")
		};
	}

	public uint Size {
		get {
			return 1;
		}
	}

	public static NetworkType Deserialize(BinaryReader br) {
		return FromValue(br.ReadByte());
	}

	public byte[] Serialize() {
		return new []{Value};
	}

	public override string ToString() {
		return $"NetworkType.{ValueToKey(Value)}";
	}
}

public class TransactionType : IEnum<ushort> {
	public static readonly TransactionType ACCOUNT_KEY_LINK = new TransactionType(16716);

	public static readonly TransactionType NODE_KEY_LINK = new TransactionType(16972);

	public static readonly TransactionType AGGREGATE_COMPLETE = new TransactionType(16705);

	public static readonly TransactionType AGGREGATE_BONDED = new TransactionType(16961);

	public static readonly TransactionType VOTING_KEY_LINK = new TransactionType(16707);

	public static readonly TransactionType VRF_KEY_LINK = new TransactionType(16963);

	public static readonly TransactionType HASH_LOCK = new TransactionType(16712);

	public static readonly TransactionType SECRET_LOCK = new TransactionType(16722);

	public static readonly TransactionType SECRET_PROOF = new TransactionType(16978);

	public static readonly TransactionType ACCOUNT_METADATA = new TransactionType(16708);

	public static readonly TransactionType MOSAIC_METADATA = new TransactionType(16964);

	public static readonly TransactionType NAMESPACE_METADATA = new TransactionType(17220);

	public static readonly TransactionType MOSAIC_DEFINITION = new TransactionType(16717);

	public static readonly TransactionType MOSAIC_SUPPLY_CHANGE = new TransactionType(16973);

	public static readonly TransactionType MOSAIC_SUPPLY_REVOCATION = new TransactionType(17229);

	public static readonly TransactionType MULTISIG_ACCOUNT_MODIFICATION = new TransactionType(16725);

	public static readonly TransactionType ADDRESS_ALIAS = new TransactionType(16974);

	public static readonly TransactionType MOSAIC_ALIAS = new TransactionType(17230);

	public static readonly TransactionType NAMESPACE_REGISTRATION = new TransactionType(16718);

	public static readonly TransactionType ACCOUNT_ADDRESS_RESTRICTION = new TransactionType(16720);

	public static readonly TransactionType ACCOUNT_MOSAIC_RESTRICTION = new TransactionType(16976);

	public static readonly TransactionType ACCOUNT_OPERATION_RESTRICTION = new TransactionType(17232);

	public static readonly TransactionType MOSAIC_ADDRESS_RESTRICTION = new TransactionType(16977);

	public static readonly TransactionType MOSAIC_GLOBAL_RESTRICTION = new TransactionType(16721);

	public static readonly TransactionType TRANSFER = new TransactionType(16724);

	public ushort Value { get; }

	public TransactionType(ushort value = 0) {
		Value = value;
	}

	internal static string ValueToKey(uint value) {
		var values = new uint[]{
			16716, 16972, 16705, 16961, 16707, 16963, 16712, 16722, 16978, 16708, 16964, 17220, 16717, 16973, 17229, 16725, 16974, 17230,
			16718, 16720, 16976, 17232, 16977, 16721, 16724
		};
		var keys = new []{
			"ACCOUNT_KEY_LINK", "NODE_KEY_LINK", "AGGREGATE_COMPLETE", "AGGREGATE_BONDED", "VOTING_KEY_LINK", "VRF_KEY_LINK", "HASH_LOCK",
			"SECRET_LOCK", "SECRET_PROOF", "ACCOUNT_METADATA", "MOSAIC_METADATA", "NAMESPACE_METADATA", "MOSAIC_DEFINITION",
			"MOSAIC_SUPPLY_CHANGE", "MOSAIC_SUPPLY_REVOCATION", "MULTISIG_ACCOUNT_MODIFICATION", "ADDRESS_ALIAS", "MOSAIC_ALIAS",
			"NAMESPACE_REGISTRATION", "ACCOUNT_ADDRESS_RESTRICTION", "ACCOUNT_MOSAIC_RESTRICTION", "ACCOUNT_OPERATION_RESTRICTION",
			"MOSAIC_ADDRESS_RESTRICTION", "MOSAIC_GLOBAL_RESTRICTION", "TRANSFER"
		};

		var index = Array.IndexOf(values, value);
		if (-1 == index)
			throw new Exception($"invalid enum value {value}");

		return keys[index];
	}

	internal static TransactionType FromValue(uint value) {
		return value switch
		{
			16716 => ACCOUNT_KEY_LINK,
			16972 => NODE_KEY_LINK,
			16705 => AGGREGATE_COMPLETE,
			16961 => AGGREGATE_BONDED,
			16707 => VOTING_KEY_LINK,
			16963 => VRF_KEY_LINK,
			16712 => HASH_LOCK,
			16722 => SECRET_LOCK,
			16978 => SECRET_PROOF,
			16708 => ACCOUNT_METADATA,
			16964 => MOSAIC_METADATA,
			17220 => NAMESPACE_METADATA,
			16717 => MOSAIC_DEFINITION,
			16973 => MOSAIC_SUPPLY_CHANGE,
			17229 => MOSAIC_SUPPLY_REVOCATION,
			16725 => MULTISIG_ACCOUNT_MODIFICATION,
			16974 => ADDRESS_ALIAS,
			17230 => MOSAIC_ALIAS,
			16718 => NAMESPACE_REGISTRATION,
			16720 => ACCOUNT_ADDRESS_RESTRICTION,
			16976 => ACCOUNT_MOSAIC_RESTRICTION,
			17232 => ACCOUNT_OPERATION_RESTRICTION,
			16977 => MOSAIC_ADDRESS_RESTRICTION,
			16721 => MOSAIC_GLOBAL_RESTRICTION,
			16724 => TRANSFER,
			_ => throw new Exception($"invalid enum value {value}")
		};
	}

	public uint Size {
		get {
			return 2;
		}
	}

	public static TransactionType Deserialize(BinaryReader br) {
		return FromValue(br.ReadUInt16());
	}

	public byte[] Serialize() {
		return BitConverter.GetBytes(Value);
	}

	public override string ToString() {
		return $"TransactionType.{ValueToKey(Value)}";
	}
}

public class Transaction : ITransaction {
	private readonly uint VerifiableEntityHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;

	public Transaction(
	    Signature? signature = null,
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    TransactionType? type = null,
	    Amount? fee = null,
	    Timestamp? deadline = null
	) {
		Signature = signature ?? new Signature();
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? 0;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? TransactionType.ACCOUNT_KEY_LINK;
		Fee = fee ?? new Amount();
		Deadline = deadline ?? new Timestamp();
		VerifiableEntityHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
	}

	public void Sort() {
	}

	public Signature Signature {
		get; set;
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public TransactionType Type {
		get; set;
	}

	public Amount Fee {
		get; set;
	}

	public Timestamp Deadline {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += Signature.Size;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += Fee.Size;
			size += Deadline.Size;
			return size;
		}
	}

	public static Transaction Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var verifiableEntityHeaderReserved_1 = br.ReadUInt32();
		if (0 != verifiableEntityHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({verifiableEntityHeaderReserved_1})");
		var signature = Signature.Deserialize(br);
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = TransactionType.Deserialize(br);
		var fee = Amount.Deserialize(br);
		var deadline = Timestamp.Deserialize(br);

		var instance = new Transaction(
			signature,
			signerPublicKey,
			version,
			network,
			type,
			fee,
			deadline);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(VerifiableEntityHeaderReserved_1)); 
		bw.Write(Signature.Serialize()); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(Fee.Serialize()); 
		bw.Write(Deadline.Serialize()); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signature: {Signature}, ";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"fee: {Fee}, ";
		result += $"deadline: {Deadline}, ";
		result += ")";
		return result;
	}
}

public class EmbeddedTransaction : IBaseTransaction {
	private readonly uint EmbeddedTransactionHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;

	public EmbeddedTransaction(
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    TransactionType? type = null
	) {
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? 0;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? TransactionType.ACCOUNT_KEY_LINK;
		EmbeddedTransactionHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
	}

	public void Sort() {
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public TransactionType Type {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			return size;
		}
	}

	public static EmbeddedTransaction Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var embeddedTransactionHeaderReserved_1 = br.ReadUInt32();
		if (0 != embeddedTransactionHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({embeddedTransactionHeaderReserved_1})");
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = TransactionType.Deserialize(br);

		var instance = new EmbeddedTransaction(
			signerPublicKey,
			version,
			network,
			type);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(EmbeddedTransactionHeaderReserved_1)); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += ")";
		return result;
	}
}

public class ProofGamma : ByteArray, ISerializer {
	public const byte SIZE = 32;

	public ProofGamma(object? proofGamma = null): base(SIZE, proofGamma) {
	}

	public static ProofGamma Deserialize(BinaryReader br) {
		return new ProofGamma(br.ReadBytes(32));
	}

	public byte[] Serialize() {
		return bytes;
	}
}

public class ProofVerificationHash : ByteArray, ISerializer {
	public const byte SIZE = 16;

	public ProofVerificationHash(object? proofVerificationHash = null): base(SIZE, proofVerificationHash) {
	}

	public static ProofVerificationHash Deserialize(BinaryReader br) {
		return new ProofVerificationHash(br.ReadBytes(16));
	}

	public byte[] Serialize() {
		return bytes;
	}
}

public class ProofScalar : ByteArray, ISerializer {
	public const byte SIZE = 32;

	public ProofScalar(object? proofScalar = null): base(SIZE, proofScalar) {
	}

	public static ProofScalar Deserialize(BinaryReader br) {
		return new ProofScalar(br.ReadBytes(32));
	}

	public byte[] Serialize() {
		return bytes;
	}
}

public class BlockType : IEnum<ushort> {
	public static readonly BlockType NEMESIS = new BlockType(32835);

	public static readonly BlockType NORMAL = new BlockType(33091);

	public static readonly BlockType IMPORTANCE = new BlockType(33347);

	public ushort Value { get; }

	public BlockType(ushort value = 0) {
		Value = value;
	}

	internal static string ValueToKey(uint value) {
		var values = new uint[]{
			32835, 33091, 33347
		};
		var keys = new []{
			"NEMESIS", "NORMAL", "IMPORTANCE"
		};

		var index = Array.IndexOf(values, value);
		if (-1 == index)
			throw new Exception($"invalid enum value {value}");

		return keys[index];
	}

	internal static BlockType FromValue(uint value) {
		return value switch
		{
			32835 => NEMESIS,
			33091 => NORMAL,
			33347 => IMPORTANCE,
			_ => throw new Exception($"invalid enum value {value}")
		};
	}

	public uint Size {
		get {
			return 2;
		}
	}

	public static BlockType Deserialize(BinaryReader br) {
		return FromValue(br.ReadUInt16());
	}

	public byte[] Serialize() {
		return BitConverter.GetBytes(Value);
	}

	public override string ToString() {
		return $"BlockType.{ValueToKey(Value)}";
	}
}

public class VrfProof : ISerializer {
	public VrfProof(ProofGamma? gamma = null, ProofVerificationHash? verificationHash = null, ProofScalar? scalar = null) {
		Gamma = gamma ?? new ProofGamma();
		VerificationHash = verificationHash ?? new ProofVerificationHash();
		Scalar = scalar ?? new ProofScalar();
	}

	public void Sort() {
	}

	public ProofGamma Gamma {
		get; set;
	}

	public ProofVerificationHash VerificationHash {
		get; set;
	}

	public ProofScalar Scalar {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += Gamma.Size;
			size += VerificationHash.Size;
			size += Scalar.Size;
			return size;
		}
	}

	public static VrfProof Deserialize(BinaryReader br) {
		var gamma = ProofGamma.Deserialize(br);
		var verificationHash = ProofVerificationHash.Deserialize(br);
		var scalar = ProofScalar.Deserialize(br);

		var instance = new VrfProof(
			gamma,
			verificationHash,
			scalar);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Gamma.Serialize()); 
		bw.Write(VerificationHash.Serialize()); 
		bw.Write(Scalar.Serialize()); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"gamma: {Gamma}, ";
		result += $"verificationHash: {VerificationHash}, ";
		result += $"scalar: {Scalar}, ";
		result += ")";
		return result;
	}
}

public class Block : ISerializer {
	private readonly uint VerifiableEntityHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;

	public Block(
	    Signature? signature = null,
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    BlockType? type = null,
	    Height? height = null,
	    Timestamp? timestamp = null,
	    Difficulty? difficulty = null,
	    VrfProof? generationHashProof = null,
	    Hash256? previousBlockHash = null,
	    Hash256? transactionsHash = null,
	    Hash256? receiptsHash = null,
	    Hash256? stateHash = null,
	    Address? beneficiaryAddress = null,
	    BlockFeeMultiplier? feeMultiplier = null
	) {
		Signature = signature ?? new Signature();
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? 0;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? BlockType.NEMESIS;
		Height = height ?? new Height();
		Timestamp = timestamp ?? new Timestamp();
		Difficulty = difficulty ?? new Difficulty();
		GenerationHashProof = generationHashProof ?? new VrfProof();
		PreviousBlockHash = previousBlockHash ?? new Hash256();
		TransactionsHash = transactionsHash ?? new Hash256();
		ReceiptsHash = receiptsHash ?? new Hash256();
		StateHash = stateHash ?? new Hash256();
		BeneficiaryAddress = beneficiaryAddress ?? new Address();
		FeeMultiplier = feeMultiplier ?? new BlockFeeMultiplier();
		VerifiableEntityHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
	}

	public void Sort() {
		GenerationHashProof.Sort();
	}

	public Signature Signature {
		get; set;
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public BlockType Type {
		get; set;
	}

	public Height Height {
		get; set;
	}

	public Timestamp Timestamp {
		get; set;
	}

	public Difficulty Difficulty {
		get; set;
	}

	public VrfProof GenerationHashProof {
		get; set;
	}

	public Hash256 PreviousBlockHash {
		get; set;
	}

	public Hash256 TransactionsHash {
		get; set;
	}

	public Hash256 ReceiptsHash {
		get; set;
	}

	public Hash256 StateHash {
		get; set;
	}

	public Address BeneficiaryAddress {
		get; set;
	}

	public BlockFeeMultiplier FeeMultiplier {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += Signature.Size;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += Height.Size;
			size += Timestamp.Size;
			size += Difficulty.Size;
			size += GenerationHashProof.Size;
			size += PreviousBlockHash.Size;
			size += TransactionsHash.Size;
			size += ReceiptsHash.Size;
			size += StateHash.Size;
			size += BeneficiaryAddress.Size;
			size += FeeMultiplier.Size;
			return size;
		}
	}

	public static Block Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var verifiableEntityHeaderReserved_1 = br.ReadUInt32();
		if (0 != verifiableEntityHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({verifiableEntityHeaderReserved_1})");
		var signature = Signature.Deserialize(br);
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = BlockType.Deserialize(br);
		var height = Height.Deserialize(br);
		var timestamp = Timestamp.Deserialize(br);
		var difficulty = Difficulty.Deserialize(br);
		var generationHashProof = VrfProof.Deserialize(br);
		var previousBlockHash = Hash256.Deserialize(br);
		var transactionsHash = Hash256.Deserialize(br);
		var receiptsHash = Hash256.Deserialize(br);
		var stateHash = Hash256.Deserialize(br);
		var beneficiaryAddress = Address.Deserialize(br);
		var feeMultiplier = BlockFeeMultiplier.Deserialize(br);

		var instance = new Block(
			signature,
			signerPublicKey,
			version,
			network,
			type,
			height,
			timestamp,
			difficulty,
			generationHashProof,
			previousBlockHash,
			transactionsHash,
			receiptsHash,
			stateHash,
			beneficiaryAddress,
			feeMultiplier);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(VerifiableEntityHeaderReserved_1)); 
		bw.Write(Signature.Serialize()); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(Height.Serialize()); 
		bw.Write(Timestamp.Serialize()); 
		bw.Write(Difficulty.Serialize()); 
		bw.Write(GenerationHashProof.Serialize()); 
		bw.Write(PreviousBlockHash.Serialize()); 
		bw.Write(TransactionsHash.Serialize()); 
		bw.Write(ReceiptsHash.Serialize()); 
		bw.Write(StateHash.Serialize()); 
		bw.Write(BeneficiaryAddress.Serialize()); 
		bw.Write(FeeMultiplier.Serialize()); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signature: {Signature}, ";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"height: {Height}, ";
		result += $"timestamp: {Timestamp}, ";
		result += $"difficulty: {Difficulty}, ";
		result += $"generationHashProof: {GenerationHashProof}, ";
		result += $"previousBlockHash: {PreviousBlockHash}, ";
		result += $"transactionsHash: {TransactionsHash}, ";
		result += $"receiptsHash: {ReceiptsHash}, ";
		result += $"stateHash: {StateHash}, ";
		result += $"beneficiaryAddress: {BeneficiaryAddress}, ";
		result += $"feeMultiplier: {FeeMultiplier}, ";
		result += ")";
		return result;
	}
}

public class NemesisBlockV1 : ISerializer {
	public const byte BLOCK_VERSION = 1;

	public static readonly BlockType BLOCK_TYPE = BlockType.NEMESIS;

	private readonly uint VerifiableEntityHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;

	public NemesisBlockV1(
	    Signature? signature = null,
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    BlockType? type = null,
	    Height? height = null,
	    Timestamp? timestamp = null,
	    Difficulty? difficulty = null,
	    VrfProof? generationHashProof = null,
	    Hash256? previousBlockHash = null,
	    Hash256? transactionsHash = null,
	    Hash256? receiptsHash = null,
	    Hash256? stateHash = null,
	    Address? beneficiaryAddress = null,
	    BlockFeeMultiplier? feeMultiplier = null,
	    uint? votingEligibleAccountsCount = null,
	    ulong? harvestingEligibleAccountsCount = null,
	    Amount? totalVotingBalance = null,
	    Hash256? previousImportanceBlockHash = null,
	    ITransaction[]? transactions = null
	) {
		Signature = signature ?? new Signature();
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? NemesisBlockV1.BLOCK_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? NemesisBlockV1.BLOCK_TYPE;
		Height = height ?? new Height();
		Timestamp = timestamp ?? new Timestamp();
		Difficulty = difficulty ?? new Difficulty();
		GenerationHashProof = generationHashProof ?? new VrfProof();
		PreviousBlockHash = previousBlockHash ?? new Hash256();
		TransactionsHash = transactionsHash ?? new Hash256();
		ReceiptsHash = receiptsHash ?? new Hash256();
		StateHash = stateHash ?? new Hash256();
		BeneficiaryAddress = beneficiaryAddress ?? new Address();
		FeeMultiplier = feeMultiplier ?? new BlockFeeMultiplier();
		VotingEligibleAccountsCount = votingEligibleAccountsCount ?? 0;
		HarvestingEligibleAccountsCount = harvestingEligibleAccountsCount ?? 0;
		TotalVotingBalance = totalVotingBalance ?? new Amount();
		PreviousImportanceBlockHash = previousImportanceBlockHash ?? new Hash256();
		Transactions = transactions ?? Array.Empty<ITransaction>();
		VerifiableEntityHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
	}

	public void Sort() {
		GenerationHashProof.Sort();
	}

	public Signature Signature {
		get; set;
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public BlockType Type {
		get; set;
	}

	public Height Height {
		get; set;
	}

	public Timestamp Timestamp {
		get; set;
	}

	public Difficulty Difficulty {
		get; set;
	}

	public VrfProof GenerationHashProof {
		get; set;
	}

	public Hash256 PreviousBlockHash {
		get; set;
	}

	public Hash256 TransactionsHash {
		get; set;
	}

	public Hash256 ReceiptsHash {
		get; set;
	}

	public Hash256 StateHash {
		get; set;
	}

	public Address BeneficiaryAddress {
		get; set;
	}

	public BlockFeeMultiplier FeeMultiplier {
		get; set;
	}

	public uint VotingEligibleAccountsCount {
		get; set;
	}

	public ulong HarvestingEligibleAccountsCount {
		get; set;
	}

	public Amount TotalVotingBalance {
		get; set;
	}

	public Hash256 PreviousImportanceBlockHash {
		get; set;
	}

	public ITransaction[] Transactions {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += Signature.Size;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += Height.Size;
			size += Timestamp.Size;
			size += Difficulty.Size;
			size += GenerationHashProof.Size;
			size += PreviousBlockHash.Size;
			size += TransactionsHash.Size;
			size += ReceiptsHash.Size;
			size += StateHash.Size;
			size += BeneficiaryAddress.Size;
			size += FeeMultiplier.Size;
			size += 4;
			size += 8;
			size += TotalVotingBalance.Size;
			size += PreviousImportanceBlockHash.Size;
			size += ArrayHelpers.Size(Transactions, 8, true);
			return size;
		}
	}

	public static NemesisBlockV1 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var verifiableEntityHeaderReserved_1 = br.ReadUInt32();
		if (0 != verifiableEntityHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({verifiableEntityHeaderReserved_1})");
		var signature = Signature.Deserialize(br);
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = BlockType.Deserialize(br);
		var height = Height.Deserialize(br);
		var timestamp = Timestamp.Deserialize(br);
		var difficulty = Difficulty.Deserialize(br);
		var generationHashProof = VrfProof.Deserialize(br);
		var previousBlockHash = Hash256.Deserialize(br);
		var transactionsHash = Hash256.Deserialize(br);
		var receiptsHash = Hash256.Deserialize(br);
		var stateHash = Hash256.Deserialize(br);
		var beneficiaryAddress = Address.Deserialize(br);
		var feeMultiplier = BlockFeeMultiplier.Deserialize(br);
		var votingEligibleAccountsCount = br.ReadUInt32();
		var harvestingEligibleAccountsCount = br.ReadUInt64();
		var totalVotingBalance = Amount.Deserialize(br);
		var previousImportanceBlockHash = Hash256.Deserialize(br);
		var transactions = ArrayHelpers.ReadVariableSizeElements(br, TransactionFactory.Deserialize, (uint)(br.BaseStream.Length - br.BaseStream.Position), 8, true);

		var instance = new NemesisBlockV1(
			signature,
			signerPublicKey,
			version,
			network,
			type,
			height,
			timestamp,
			difficulty,
			generationHashProof,
			previousBlockHash,
			transactionsHash,
			receiptsHash,
			stateHash,
			beneficiaryAddress,
			feeMultiplier,
			votingEligibleAccountsCount,
			harvestingEligibleAccountsCount,
			totalVotingBalance,
			previousImportanceBlockHash,
			transactions);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(VerifiableEntityHeaderReserved_1)); 
		bw.Write(Signature.Serialize()); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(Height.Serialize()); 
		bw.Write(Timestamp.Serialize()); 
		bw.Write(Difficulty.Serialize()); 
		bw.Write(GenerationHashProof.Serialize()); 
		bw.Write(PreviousBlockHash.Serialize()); 
		bw.Write(TransactionsHash.Serialize()); 
		bw.Write(ReceiptsHash.Serialize()); 
		bw.Write(StateHash.Serialize()); 
		bw.Write(BeneficiaryAddress.Serialize()); 
		bw.Write(FeeMultiplier.Serialize()); 
		bw.Write(BitConverter.GetBytes(VotingEligibleAccountsCount)); 
		bw.Write(BitConverter.GetBytes(HarvestingEligibleAccountsCount)); 
		bw.Write(TotalVotingBalance.Serialize()); 
		bw.Write(PreviousImportanceBlockHash.Serialize()); 
		Sort();
		ArrayHelpers.WriteVariableSizeElements(bw, Transactions, 8, true);
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signature: {Signature}, ";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"height: {Height}, ";
		result += $"timestamp: {Timestamp}, ";
		result += $"difficulty: {Difficulty}, ";
		result += $"generationHashProof: {GenerationHashProof}, ";
		result += $"previousBlockHash: {PreviousBlockHash}, ";
		result += $"transactionsHash: {TransactionsHash}, ";
		result += $"receiptsHash: {ReceiptsHash}, ";
		result += $"stateHash: {StateHash}, ";
		result += $"beneficiaryAddress: {BeneficiaryAddress}, ";
		result += $"feeMultiplier: {FeeMultiplier}, ";
		result += $"votingEligibleAccountsCount: {Converter.ToString(VotingEligibleAccountsCount)}, ";
		result += $"harvestingEligibleAccountsCount: {Converter.ToString(HarvestingEligibleAccountsCount)}, ";
		result += $"totalVotingBalance: {TotalVotingBalance}, ";
		result += $"previousImportanceBlockHash: {PreviousImportanceBlockHash}, ";
		result += $"transactions: [{string.Join(",", Transactions.Select(e => e.ToString()))}], ";
		result += ")";
		return result;
	}
}

public class NormalBlockV1 : ISerializer {
	public const byte BLOCK_VERSION = 1;

	public static readonly BlockType BLOCK_TYPE = BlockType.NORMAL;

	private readonly uint VerifiableEntityHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;
	private readonly uint BlockHeaderReserved_1;

	public NormalBlockV1(
	    Signature? signature = null,
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    BlockType? type = null,
	    Height? height = null,
	    Timestamp? timestamp = null,
	    Difficulty? difficulty = null,
	    VrfProof? generationHashProof = null,
	    Hash256? previousBlockHash = null,
	    Hash256? transactionsHash = null,
	    Hash256? receiptsHash = null,
	    Hash256? stateHash = null,
	    Address? beneficiaryAddress = null,
	    BlockFeeMultiplier? feeMultiplier = null,
	    ITransaction[]? transactions = null
	) {
		Signature = signature ?? new Signature();
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? NormalBlockV1.BLOCK_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? NormalBlockV1.BLOCK_TYPE;
		Height = height ?? new Height();
		Timestamp = timestamp ?? new Timestamp();
		Difficulty = difficulty ?? new Difficulty();
		GenerationHashProof = generationHashProof ?? new VrfProof();
		PreviousBlockHash = previousBlockHash ?? new Hash256();
		TransactionsHash = transactionsHash ?? new Hash256();
		ReceiptsHash = receiptsHash ?? new Hash256();
		StateHash = stateHash ?? new Hash256();
		BeneficiaryAddress = beneficiaryAddress ?? new Address();
		FeeMultiplier = feeMultiplier ?? new BlockFeeMultiplier();
		Transactions = transactions ?? Array.Empty<ITransaction>();
		VerifiableEntityHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
		BlockHeaderReserved_1 = 0; // reserved field
	}

	public void Sort() {
		GenerationHashProof.Sort();
	}

	public Signature Signature {
		get; set;
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public BlockType Type {
		get; set;
	}

	public Height Height {
		get; set;
	}

	public Timestamp Timestamp {
		get; set;
	}

	public Difficulty Difficulty {
		get; set;
	}

	public VrfProof GenerationHashProof {
		get; set;
	}

	public Hash256 PreviousBlockHash {
		get; set;
	}

	public Hash256 TransactionsHash {
		get; set;
	}

	public Hash256 ReceiptsHash {
		get; set;
	}

	public Hash256 StateHash {
		get; set;
	}

	public Address BeneficiaryAddress {
		get; set;
	}

	public BlockFeeMultiplier FeeMultiplier {
		get; set;
	}

	public ITransaction[] Transactions {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += Signature.Size;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += Height.Size;
			size += Timestamp.Size;
			size += Difficulty.Size;
			size += GenerationHashProof.Size;
			size += PreviousBlockHash.Size;
			size += TransactionsHash.Size;
			size += ReceiptsHash.Size;
			size += StateHash.Size;
			size += BeneficiaryAddress.Size;
			size += FeeMultiplier.Size;
			size += 4;
			size += ArrayHelpers.Size(Transactions, 8, true);
			return size;
		}
	}

	public static NormalBlockV1 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var verifiableEntityHeaderReserved_1 = br.ReadUInt32();
		if (0 != verifiableEntityHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({verifiableEntityHeaderReserved_1})");
		var signature = Signature.Deserialize(br);
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = BlockType.Deserialize(br);
		var height = Height.Deserialize(br);
		var timestamp = Timestamp.Deserialize(br);
		var difficulty = Difficulty.Deserialize(br);
		var generationHashProof = VrfProof.Deserialize(br);
		var previousBlockHash = Hash256.Deserialize(br);
		var transactionsHash = Hash256.Deserialize(br);
		var receiptsHash = Hash256.Deserialize(br);
		var stateHash = Hash256.Deserialize(br);
		var beneficiaryAddress = Address.Deserialize(br);
		var feeMultiplier = BlockFeeMultiplier.Deserialize(br);
		var blockHeaderReserved_1 = br.ReadUInt32();
		if (0 != blockHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({blockHeaderReserved_1})");
		var transactions = ArrayHelpers.ReadVariableSizeElements(br, TransactionFactory.Deserialize, (uint)(br.BaseStream.Length - br.BaseStream.Position), 8, true);

		var instance = new NormalBlockV1(
			signature,
			signerPublicKey,
			version,
			network,
			type,
			height,
			timestamp,
			difficulty,
			generationHashProof,
			previousBlockHash,
			transactionsHash,
			receiptsHash,
			stateHash,
			beneficiaryAddress,
			feeMultiplier,
			transactions);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(VerifiableEntityHeaderReserved_1)); 
		bw.Write(Signature.Serialize()); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(Height.Serialize()); 
		bw.Write(Timestamp.Serialize()); 
		bw.Write(Difficulty.Serialize()); 
		bw.Write(GenerationHashProof.Serialize()); 
		bw.Write(PreviousBlockHash.Serialize()); 
		bw.Write(TransactionsHash.Serialize()); 
		bw.Write(ReceiptsHash.Serialize()); 
		bw.Write(StateHash.Serialize()); 
		bw.Write(BeneficiaryAddress.Serialize()); 
		bw.Write(FeeMultiplier.Serialize()); 
		bw.Write(BitConverter.GetBytes(BlockHeaderReserved_1)); 
		Sort();
		ArrayHelpers.WriteVariableSizeElements(bw, Transactions, 8, true);
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signature: {Signature}, ";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"height: {Height}, ";
		result += $"timestamp: {Timestamp}, ";
		result += $"difficulty: {Difficulty}, ";
		result += $"generationHashProof: {GenerationHashProof}, ";
		result += $"previousBlockHash: {PreviousBlockHash}, ";
		result += $"transactionsHash: {TransactionsHash}, ";
		result += $"receiptsHash: {ReceiptsHash}, ";
		result += $"stateHash: {StateHash}, ";
		result += $"beneficiaryAddress: {BeneficiaryAddress}, ";
		result += $"feeMultiplier: {FeeMultiplier}, ";
		result += $"transactions: [{string.Join(",", Transactions.Select(e => e.ToString()))}], ";
		result += ")";
		return result;
	}
}

public class ImportanceBlockV1 : ISerializer {
	public const byte BLOCK_VERSION = 1;

	public static readonly BlockType BLOCK_TYPE = BlockType.IMPORTANCE;

	private readonly uint VerifiableEntityHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;

	public ImportanceBlockV1(
	    Signature? signature = null,
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    BlockType? type = null,
	    Height? height = null,
	    Timestamp? timestamp = null,
	    Difficulty? difficulty = null,
	    VrfProof? generationHashProof = null,
	    Hash256? previousBlockHash = null,
	    Hash256? transactionsHash = null,
	    Hash256? receiptsHash = null,
	    Hash256? stateHash = null,
	    Address? beneficiaryAddress = null,
	    BlockFeeMultiplier? feeMultiplier = null,
	    uint? votingEligibleAccountsCount = null,
	    ulong? harvestingEligibleAccountsCount = null,
	    Amount? totalVotingBalance = null,
	    Hash256? previousImportanceBlockHash = null,
	    ITransaction[]? transactions = null
	) {
		Signature = signature ?? new Signature();
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? ImportanceBlockV1.BLOCK_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? ImportanceBlockV1.BLOCK_TYPE;
		Height = height ?? new Height();
		Timestamp = timestamp ?? new Timestamp();
		Difficulty = difficulty ?? new Difficulty();
		GenerationHashProof = generationHashProof ?? new VrfProof();
		PreviousBlockHash = previousBlockHash ?? new Hash256();
		TransactionsHash = transactionsHash ?? new Hash256();
		ReceiptsHash = receiptsHash ?? new Hash256();
		StateHash = stateHash ?? new Hash256();
		BeneficiaryAddress = beneficiaryAddress ?? new Address();
		FeeMultiplier = feeMultiplier ?? new BlockFeeMultiplier();
		VotingEligibleAccountsCount = votingEligibleAccountsCount ?? 0;
		HarvestingEligibleAccountsCount = harvestingEligibleAccountsCount ?? 0;
		TotalVotingBalance = totalVotingBalance ?? new Amount();
		PreviousImportanceBlockHash = previousImportanceBlockHash ?? new Hash256();
		Transactions = transactions ?? Array.Empty<ITransaction>();
		VerifiableEntityHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
	}

	public void Sort() {
		GenerationHashProof.Sort();
	}

	public Signature Signature {
		get; set;
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public BlockType Type {
		get; set;
	}

	public Height Height {
		get; set;
	}

	public Timestamp Timestamp {
		get; set;
	}

	public Difficulty Difficulty {
		get; set;
	}

	public VrfProof GenerationHashProof {
		get; set;
	}

	public Hash256 PreviousBlockHash {
		get; set;
	}

	public Hash256 TransactionsHash {
		get; set;
	}

	public Hash256 ReceiptsHash {
		get; set;
	}

	public Hash256 StateHash {
		get; set;
	}

	public Address BeneficiaryAddress {
		get; set;
	}

	public BlockFeeMultiplier FeeMultiplier {
		get; set;
	}

	public uint VotingEligibleAccountsCount {
		get; set;
	}

	public ulong HarvestingEligibleAccountsCount {
		get; set;
	}

	public Amount TotalVotingBalance {
		get; set;
	}

	public Hash256 PreviousImportanceBlockHash {
		get; set;
	}

	public ITransaction[] Transactions {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += Signature.Size;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += Height.Size;
			size += Timestamp.Size;
			size += Difficulty.Size;
			size += GenerationHashProof.Size;
			size += PreviousBlockHash.Size;
			size += TransactionsHash.Size;
			size += ReceiptsHash.Size;
			size += StateHash.Size;
			size += BeneficiaryAddress.Size;
			size += FeeMultiplier.Size;
			size += 4;
			size += 8;
			size += TotalVotingBalance.Size;
			size += PreviousImportanceBlockHash.Size;
			size += ArrayHelpers.Size(Transactions, 8, true);
			return size;
		}
	}

	public static ImportanceBlockV1 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var verifiableEntityHeaderReserved_1 = br.ReadUInt32();
		if (0 != verifiableEntityHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({verifiableEntityHeaderReserved_1})");
		var signature = Signature.Deserialize(br);
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = BlockType.Deserialize(br);
		var height = Height.Deserialize(br);
		var timestamp = Timestamp.Deserialize(br);
		var difficulty = Difficulty.Deserialize(br);
		var generationHashProof = VrfProof.Deserialize(br);
		var previousBlockHash = Hash256.Deserialize(br);
		var transactionsHash = Hash256.Deserialize(br);
		var receiptsHash = Hash256.Deserialize(br);
		var stateHash = Hash256.Deserialize(br);
		var beneficiaryAddress = Address.Deserialize(br);
		var feeMultiplier = BlockFeeMultiplier.Deserialize(br);
		var votingEligibleAccountsCount = br.ReadUInt32();
		var harvestingEligibleAccountsCount = br.ReadUInt64();
		var totalVotingBalance = Amount.Deserialize(br);
		var previousImportanceBlockHash = Hash256.Deserialize(br);
		var transactions = ArrayHelpers.ReadVariableSizeElements(br, TransactionFactory.Deserialize, (uint)(br.BaseStream.Length - br.BaseStream.Position), 8, true);

		var instance = new ImportanceBlockV1(
			signature,
			signerPublicKey,
			version,
			network,
			type,
			height,
			timestamp,
			difficulty,
			generationHashProof,
			previousBlockHash,
			transactionsHash,
			receiptsHash,
			stateHash,
			beneficiaryAddress,
			feeMultiplier,
			votingEligibleAccountsCount,
			harvestingEligibleAccountsCount,
			totalVotingBalance,
			previousImportanceBlockHash,
			transactions);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(VerifiableEntityHeaderReserved_1)); 
		bw.Write(Signature.Serialize()); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(Height.Serialize()); 
		bw.Write(Timestamp.Serialize()); 
		bw.Write(Difficulty.Serialize()); 
		bw.Write(GenerationHashProof.Serialize()); 
		bw.Write(PreviousBlockHash.Serialize()); 
		bw.Write(TransactionsHash.Serialize()); 
		bw.Write(ReceiptsHash.Serialize()); 
		bw.Write(StateHash.Serialize()); 
		bw.Write(BeneficiaryAddress.Serialize()); 
		bw.Write(FeeMultiplier.Serialize()); 
		bw.Write(BitConverter.GetBytes(VotingEligibleAccountsCount)); 
		bw.Write(BitConverter.GetBytes(HarvestingEligibleAccountsCount)); 
		bw.Write(TotalVotingBalance.Serialize()); 
		bw.Write(PreviousImportanceBlockHash.Serialize()); 
		Sort();
		ArrayHelpers.WriteVariableSizeElements(bw, Transactions, 8, true);
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signature: {Signature}, ";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"height: {Height}, ";
		result += $"timestamp: {Timestamp}, ";
		result += $"difficulty: {Difficulty}, ";
		result += $"generationHashProof: {GenerationHashProof}, ";
		result += $"previousBlockHash: {PreviousBlockHash}, ";
		result += $"transactionsHash: {TransactionsHash}, ";
		result += $"receiptsHash: {ReceiptsHash}, ";
		result += $"stateHash: {StateHash}, ";
		result += $"beneficiaryAddress: {BeneficiaryAddress}, ";
		result += $"feeMultiplier: {FeeMultiplier}, ";
		result += $"votingEligibleAccountsCount: {Converter.ToString(VotingEligibleAccountsCount)}, ";
		result += $"harvestingEligibleAccountsCount: {Converter.ToString(HarvestingEligibleAccountsCount)}, ";
		result += $"totalVotingBalance: {TotalVotingBalance}, ";
		result += $"previousImportanceBlockHash: {PreviousImportanceBlockHash}, ";
		result += $"transactions: [{string.Join(",", Transactions.Select(e => e.ToString()))}], ";
		result += ")";
		return result;
	}
}

public class FinalizationRound : ISerializer {
	public FinalizationRound(FinalizationEpoch? epoch = null, FinalizationPoint? point = null) {
		Epoch = epoch ?? new FinalizationEpoch();
		Point = point ?? new FinalizationPoint();
	}

	public void Sort() {
	}

	public FinalizationEpoch Epoch {
		get; set;
	}

	public FinalizationPoint Point {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += Epoch.Size;
			size += Point.Size;
			return size;
		}
	}

	public static FinalizationRound Deserialize(BinaryReader br) {
		var epoch = FinalizationEpoch.Deserialize(br);
		var point = FinalizationPoint.Deserialize(br);

		var instance = new FinalizationRound(
			epoch,
			point);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Epoch.Serialize()); 
		bw.Write(Point.Serialize()); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"epoch: {Epoch}, ";
		result += $"point: {Point}, ";
		result += ")";
		return result;
	}
}

public class FinalizedBlockHeader : ISerializer {
	public FinalizedBlockHeader(FinalizationRound? round = null, Height? height = null, Hash256? hash = null) {
		Round = round ?? new FinalizationRound();
		Height = height ?? new Height();
		Hash = hash ?? new Hash256();
	}

	public void Sort() {
		Round.Sort();
	}

	public FinalizationRound Round {
		get; set;
	}

	public Height Height {
		get; set;
	}

	public Hash256 Hash {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += Round.Size;
			size += Height.Size;
			size += Hash.Size;
			return size;
		}
	}

	public static FinalizedBlockHeader Deserialize(BinaryReader br) {
		var round = FinalizationRound.Deserialize(br);
		var height = Height.Deserialize(br);
		var hash = Hash256.Deserialize(br);

		var instance = new FinalizedBlockHeader(
			round,
			height,
			hash);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Round.Serialize()); 
		bw.Write(Height.Serialize()); 
		bw.Write(Hash.Serialize()); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"round: {Round}, ";
		result += $"height: {Height}, ";
		result += $"hash: {Hash}, ";
		result += ")";
		return result;
	}
}

public class ReceiptType : IEnum<ushort> {
	public static readonly ReceiptType MOSAIC_RENTAL_FEE = new ReceiptType(4685);

	public static readonly ReceiptType NAMESPACE_RENTAL_FEE = new ReceiptType(4942);

	public static readonly ReceiptType HARVEST_FEE = new ReceiptType(8515);

	public static readonly ReceiptType LOCK_HASH_COMPLETED = new ReceiptType(8776);

	public static readonly ReceiptType LOCK_HASH_EXPIRED = new ReceiptType(9032);

	public static readonly ReceiptType LOCK_SECRET_COMPLETED = new ReceiptType(8786);

	public static readonly ReceiptType LOCK_SECRET_EXPIRED = new ReceiptType(9042);

	public static readonly ReceiptType LOCK_HASH_CREATED = new ReceiptType(12616);

	public static readonly ReceiptType LOCK_SECRET_CREATED = new ReceiptType(12626);

	public static readonly ReceiptType MOSAIC_EXPIRED = new ReceiptType(16717);

	public static readonly ReceiptType NAMESPACE_EXPIRED = new ReceiptType(16718);

	public static readonly ReceiptType NAMESPACE_DELETED = new ReceiptType(16974);

	public static readonly ReceiptType INFLATION = new ReceiptType(20803);

	public static readonly ReceiptType TRANSACTION_GROUP = new ReceiptType(57667);

	public static readonly ReceiptType ADDRESS_ALIAS_RESOLUTION = new ReceiptType(61763);

	public static readonly ReceiptType MOSAIC_ALIAS_RESOLUTION = new ReceiptType(62019);

	public ushort Value { get; }

	public ReceiptType(ushort value = 0) {
		Value = value;
	}

	internal static string ValueToKey(uint value) {
		var values = new uint[]{
			4685, 4942, 8515, 8776, 9032, 8786, 9042, 12616, 12626, 16717, 16718, 16974, 20803, 57667, 61763, 62019
		};
		var keys = new []{
			"MOSAIC_RENTAL_FEE", "NAMESPACE_RENTAL_FEE", "HARVEST_FEE", "LOCK_HASH_COMPLETED", "LOCK_HASH_EXPIRED", "LOCK_SECRET_COMPLETED",
			"LOCK_SECRET_EXPIRED", "LOCK_HASH_CREATED", "LOCK_SECRET_CREATED", "MOSAIC_EXPIRED", "NAMESPACE_EXPIRED", "NAMESPACE_DELETED",
			"INFLATION", "TRANSACTION_GROUP", "ADDRESS_ALIAS_RESOLUTION", "MOSAIC_ALIAS_RESOLUTION"
		};

		var index = Array.IndexOf(values, value);
		if (-1 == index)
			throw new Exception($"invalid enum value {value}");

		return keys[index];
	}

	internal static ReceiptType FromValue(uint value) {
		return value switch
		{
			4685 => MOSAIC_RENTAL_FEE,
			4942 => NAMESPACE_RENTAL_FEE,
			8515 => HARVEST_FEE,
			8776 => LOCK_HASH_COMPLETED,
			9032 => LOCK_HASH_EXPIRED,
			8786 => LOCK_SECRET_COMPLETED,
			9042 => LOCK_SECRET_EXPIRED,
			12616 => LOCK_HASH_CREATED,
			12626 => LOCK_SECRET_CREATED,
			16717 => MOSAIC_EXPIRED,
			16718 => NAMESPACE_EXPIRED,
			16974 => NAMESPACE_DELETED,
			20803 => INFLATION,
			57667 => TRANSACTION_GROUP,
			61763 => ADDRESS_ALIAS_RESOLUTION,
			62019 => MOSAIC_ALIAS_RESOLUTION,
			_ => throw new Exception($"invalid enum value {value}")
		};
	}

	public uint Size {
		get {
			return 2;
		}
	}

	public static ReceiptType Deserialize(BinaryReader br) {
		return FromValue(br.ReadUInt16());
	}

	public byte[] Serialize() {
		return BitConverter.GetBytes(Value);
	}

	public override string ToString() {
		return $"ReceiptType.{ValueToKey(Value)}";
	}
}

public class Receipt : ISerializer {
	public Receipt(ushort? version = null, ReceiptType? type = null) {
		Version = version ?? 0;
		Type = type ?? ReceiptType.MOSAIC_RENTAL_FEE;
	}

	public void Sort() {
	}

	public ushort Version {
		get; set;
	}

	public ReceiptType Type {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 2;
			size += Type.Size;
			return size;
		}
	}

	public static Receipt Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var version = br.ReadUInt16();
		var type = ReceiptType.Deserialize(br);

		var instance = new Receipt(
			version,
			type);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(Version)); 
		bw.Write(Type.Serialize()); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"type: {Type}, ";
		result += ")";
		return result;
	}
}

public class HarvestFeeReceipt : ISerializer {
	public static readonly ReceiptType RECEIPT_TYPE = ReceiptType.HARVEST_FEE;


	public HarvestFeeReceipt(
	    ushort? version = null,
	    ReceiptType? type = null,
	    Mosaic? mosaic = null,
	    Address? targetAddress = null
	) {
		Version = version ?? 0;
		Type = type ?? HarvestFeeReceipt.RECEIPT_TYPE;
		Mosaic = mosaic ?? new Mosaic();
		TargetAddress = targetAddress ?? new Address();
	}

	public void Sort() {
		Mosaic.Sort();
	}

	public ushort Version {
		get; set;
	}

	public ReceiptType Type {
		get; set;
	}

	public Mosaic Mosaic {
		get; set;
	}

	public Address TargetAddress {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 2;
			size += Type.Size;
			size += Mosaic.Size;
			size += TargetAddress.Size;
			return size;
		}
	}

	public static HarvestFeeReceipt Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var version = br.ReadUInt16();
		var type = ReceiptType.Deserialize(br);
		var mosaic = Mosaic.Deserialize(br);
		var targetAddress = Address.Deserialize(br);

		var instance = new HarvestFeeReceipt(
			version,
			type,
			mosaic,
			targetAddress);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(Version)); 
		bw.Write(Type.Serialize()); 
		bw.Write(Mosaic.Serialize()); 
		bw.Write(TargetAddress.Serialize()); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"type: {Type}, ";
		result += $"mosaic: {Mosaic}, ";
		result += $"targetAddress: {TargetAddress}, ";
		result += ")";
		return result;
	}
}

public class InflationReceipt : ISerializer {
	public static readonly ReceiptType RECEIPT_TYPE = ReceiptType.INFLATION;


	public InflationReceipt(ushort? version = null, ReceiptType? type = null, Mosaic? mosaic = null) {
		Version = version ?? 0;
		Type = type ?? InflationReceipt.RECEIPT_TYPE;
		Mosaic = mosaic ?? new Mosaic();
	}

	public void Sort() {
		Mosaic.Sort();
	}

	public ushort Version {
		get; set;
	}

	public ReceiptType Type {
		get; set;
	}

	public Mosaic Mosaic {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 2;
			size += Type.Size;
			size += Mosaic.Size;
			return size;
		}
	}

	public static InflationReceipt Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var version = br.ReadUInt16();
		var type = ReceiptType.Deserialize(br);
		var mosaic = Mosaic.Deserialize(br);

		var instance = new InflationReceipt(
			version,
			type,
			mosaic);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(Version)); 
		bw.Write(Type.Serialize()); 
		bw.Write(Mosaic.Serialize()); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"type: {Type}, ";
		result += $"mosaic: {Mosaic}, ";
		result += ")";
		return result;
	}
}

public class LockHashCreatedFeeReceipt : ISerializer {
	public static readonly ReceiptType RECEIPT_TYPE = ReceiptType.LOCK_HASH_CREATED;


	public LockHashCreatedFeeReceipt(
	    ushort? version = null,
	    ReceiptType? type = null,
	    Mosaic? mosaic = null,
	    Address? targetAddress = null
	) {
		Version = version ?? 0;
		Type = type ?? LockHashCreatedFeeReceipt.RECEIPT_TYPE;
		Mosaic = mosaic ?? new Mosaic();
		TargetAddress = targetAddress ?? new Address();
	}

	public void Sort() {
		Mosaic.Sort();
	}

	public ushort Version {
		get; set;
	}

	public ReceiptType Type {
		get; set;
	}

	public Mosaic Mosaic {
		get; set;
	}

	public Address TargetAddress {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 2;
			size += Type.Size;
			size += Mosaic.Size;
			size += TargetAddress.Size;
			return size;
		}
	}

	public static LockHashCreatedFeeReceipt Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var version = br.ReadUInt16();
		var type = ReceiptType.Deserialize(br);
		var mosaic = Mosaic.Deserialize(br);
		var targetAddress = Address.Deserialize(br);

		var instance = new LockHashCreatedFeeReceipt(
			version,
			type,
			mosaic,
			targetAddress);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(Version)); 
		bw.Write(Type.Serialize()); 
		bw.Write(Mosaic.Serialize()); 
		bw.Write(TargetAddress.Serialize()); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"type: {Type}, ";
		result += $"mosaic: {Mosaic}, ";
		result += $"targetAddress: {TargetAddress}, ";
		result += ")";
		return result;
	}
}

public class LockHashCompletedFeeReceipt : ISerializer {
	public static readonly ReceiptType RECEIPT_TYPE = ReceiptType.LOCK_HASH_COMPLETED;


	public LockHashCompletedFeeReceipt(
	    ushort? version = null,
	    ReceiptType? type = null,
	    Mosaic? mosaic = null,
	    Address? targetAddress = null
	) {
		Version = version ?? 0;
		Type = type ?? LockHashCompletedFeeReceipt.RECEIPT_TYPE;
		Mosaic = mosaic ?? new Mosaic();
		TargetAddress = targetAddress ?? new Address();
	}

	public void Sort() {
		Mosaic.Sort();
	}

	public ushort Version {
		get; set;
	}

	public ReceiptType Type {
		get; set;
	}

	public Mosaic Mosaic {
		get; set;
	}

	public Address TargetAddress {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 2;
			size += Type.Size;
			size += Mosaic.Size;
			size += TargetAddress.Size;
			return size;
		}
	}

	public static LockHashCompletedFeeReceipt Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var version = br.ReadUInt16();
		var type = ReceiptType.Deserialize(br);
		var mosaic = Mosaic.Deserialize(br);
		var targetAddress = Address.Deserialize(br);

		var instance = new LockHashCompletedFeeReceipt(
			version,
			type,
			mosaic,
			targetAddress);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(Version)); 
		bw.Write(Type.Serialize()); 
		bw.Write(Mosaic.Serialize()); 
		bw.Write(TargetAddress.Serialize()); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"type: {Type}, ";
		result += $"mosaic: {Mosaic}, ";
		result += $"targetAddress: {TargetAddress}, ";
		result += ")";
		return result;
	}
}

public class LockHashExpiredFeeReceipt : ISerializer {
	public static readonly ReceiptType RECEIPT_TYPE = ReceiptType.LOCK_HASH_EXPIRED;


	public LockHashExpiredFeeReceipt(
	    ushort? version = null,
	    ReceiptType? type = null,
	    Mosaic? mosaic = null,
	    Address? targetAddress = null
	) {
		Version = version ?? 0;
		Type = type ?? LockHashExpiredFeeReceipt.RECEIPT_TYPE;
		Mosaic = mosaic ?? new Mosaic();
		TargetAddress = targetAddress ?? new Address();
	}

	public void Sort() {
		Mosaic.Sort();
	}

	public ushort Version {
		get; set;
	}

	public ReceiptType Type {
		get; set;
	}

	public Mosaic Mosaic {
		get; set;
	}

	public Address TargetAddress {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 2;
			size += Type.Size;
			size += Mosaic.Size;
			size += TargetAddress.Size;
			return size;
		}
	}

	public static LockHashExpiredFeeReceipt Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var version = br.ReadUInt16();
		var type = ReceiptType.Deserialize(br);
		var mosaic = Mosaic.Deserialize(br);
		var targetAddress = Address.Deserialize(br);

		var instance = new LockHashExpiredFeeReceipt(
			version,
			type,
			mosaic,
			targetAddress);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(Version)); 
		bw.Write(Type.Serialize()); 
		bw.Write(Mosaic.Serialize()); 
		bw.Write(TargetAddress.Serialize()); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"type: {Type}, ";
		result += $"mosaic: {Mosaic}, ";
		result += $"targetAddress: {TargetAddress}, ";
		result += ")";
		return result;
	}
}

public class LockSecretCreatedFeeReceipt : ISerializer {
	public static readonly ReceiptType RECEIPT_TYPE = ReceiptType.LOCK_SECRET_CREATED;


	public LockSecretCreatedFeeReceipt(
	    ushort? version = null,
	    ReceiptType? type = null,
	    Mosaic? mosaic = null,
	    Address? targetAddress = null
	) {
		Version = version ?? 0;
		Type = type ?? LockSecretCreatedFeeReceipt.RECEIPT_TYPE;
		Mosaic = mosaic ?? new Mosaic();
		TargetAddress = targetAddress ?? new Address();
	}

	public void Sort() {
		Mosaic.Sort();
	}

	public ushort Version {
		get; set;
	}

	public ReceiptType Type {
		get; set;
	}

	public Mosaic Mosaic {
		get; set;
	}

	public Address TargetAddress {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 2;
			size += Type.Size;
			size += Mosaic.Size;
			size += TargetAddress.Size;
			return size;
		}
	}

	public static LockSecretCreatedFeeReceipt Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var version = br.ReadUInt16();
		var type = ReceiptType.Deserialize(br);
		var mosaic = Mosaic.Deserialize(br);
		var targetAddress = Address.Deserialize(br);

		var instance = new LockSecretCreatedFeeReceipt(
			version,
			type,
			mosaic,
			targetAddress);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(Version)); 
		bw.Write(Type.Serialize()); 
		bw.Write(Mosaic.Serialize()); 
		bw.Write(TargetAddress.Serialize()); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"type: {Type}, ";
		result += $"mosaic: {Mosaic}, ";
		result += $"targetAddress: {TargetAddress}, ";
		result += ")";
		return result;
	}
}

public class LockSecretCompletedFeeReceipt : ISerializer {
	public static readonly ReceiptType RECEIPT_TYPE = ReceiptType.LOCK_SECRET_COMPLETED;


	public LockSecretCompletedFeeReceipt(
	    ushort? version = null,
	    ReceiptType? type = null,
	    Mosaic? mosaic = null,
	    Address? targetAddress = null
	) {
		Version = version ?? 0;
		Type = type ?? LockSecretCompletedFeeReceipt.RECEIPT_TYPE;
		Mosaic = mosaic ?? new Mosaic();
		TargetAddress = targetAddress ?? new Address();
	}

	public void Sort() {
		Mosaic.Sort();
	}

	public ushort Version {
		get; set;
	}

	public ReceiptType Type {
		get; set;
	}

	public Mosaic Mosaic {
		get; set;
	}

	public Address TargetAddress {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 2;
			size += Type.Size;
			size += Mosaic.Size;
			size += TargetAddress.Size;
			return size;
		}
	}

	public static LockSecretCompletedFeeReceipt Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var version = br.ReadUInt16();
		var type = ReceiptType.Deserialize(br);
		var mosaic = Mosaic.Deserialize(br);
		var targetAddress = Address.Deserialize(br);

		var instance = new LockSecretCompletedFeeReceipt(
			version,
			type,
			mosaic,
			targetAddress);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(Version)); 
		bw.Write(Type.Serialize()); 
		bw.Write(Mosaic.Serialize()); 
		bw.Write(TargetAddress.Serialize()); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"type: {Type}, ";
		result += $"mosaic: {Mosaic}, ";
		result += $"targetAddress: {TargetAddress}, ";
		result += ")";
		return result;
	}
}

public class LockSecretExpiredFeeReceipt : ISerializer {
	public static readonly ReceiptType RECEIPT_TYPE = ReceiptType.LOCK_SECRET_EXPIRED;


	public LockSecretExpiredFeeReceipt(
	    ushort? version = null,
	    ReceiptType? type = null,
	    Mosaic? mosaic = null,
	    Address? targetAddress = null
	) {
		Version = version ?? 0;
		Type = type ?? LockSecretExpiredFeeReceipt.RECEIPT_TYPE;
		Mosaic = mosaic ?? new Mosaic();
		TargetAddress = targetAddress ?? new Address();
	}

	public void Sort() {
		Mosaic.Sort();
	}

	public ushort Version {
		get; set;
	}

	public ReceiptType Type {
		get; set;
	}

	public Mosaic Mosaic {
		get; set;
	}

	public Address TargetAddress {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 2;
			size += Type.Size;
			size += Mosaic.Size;
			size += TargetAddress.Size;
			return size;
		}
	}

	public static LockSecretExpiredFeeReceipt Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var version = br.ReadUInt16();
		var type = ReceiptType.Deserialize(br);
		var mosaic = Mosaic.Deserialize(br);
		var targetAddress = Address.Deserialize(br);

		var instance = new LockSecretExpiredFeeReceipt(
			version,
			type,
			mosaic,
			targetAddress);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(Version)); 
		bw.Write(Type.Serialize()); 
		bw.Write(Mosaic.Serialize()); 
		bw.Write(TargetAddress.Serialize()); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"type: {Type}, ";
		result += $"mosaic: {Mosaic}, ";
		result += $"targetAddress: {TargetAddress}, ";
		result += ")";
		return result;
	}
}

public class MosaicExpiredReceipt : ISerializer {
	public static readonly ReceiptType RECEIPT_TYPE = ReceiptType.MOSAIC_EXPIRED;


	public MosaicExpiredReceipt(ushort? version = null, ReceiptType? type = null, MosaicId? artifactId = null) {
		Version = version ?? 0;
		Type = type ?? MosaicExpiredReceipt.RECEIPT_TYPE;
		ArtifactId = artifactId ?? new MosaicId();
	}

	public void Sort() {
	}

	public ushort Version {
		get; set;
	}

	public ReceiptType Type {
		get; set;
	}

	public MosaicId ArtifactId {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 2;
			size += Type.Size;
			size += ArtifactId.Size;
			return size;
		}
	}

	public static MosaicExpiredReceipt Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var version = br.ReadUInt16();
		var type = ReceiptType.Deserialize(br);
		var artifactId = MosaicId.Deserialize(br);

		var instance = new MosaicExpiredReceipt(
			version,
			type,
			artifactId);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(Version)); 
		bw.Write(Type.Serialize()); 
		bw.Write(ArtifactId.Serialize()); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"type: {Type}, ";
		result += $"artifactId: {ArtifactId}, ";
		result += ")";
		return result;
	}
}

public class MosaicRentalFeeReceipt : ISerializer {
	public static readonly ReceiptType RECEIPT_TYPE = ReceiptType.MOSAIC_RENTAL_FEE;


	public MosaicRentalFeeReceipt(
	    ushort? version = null,
	    ReceiptType? type = null,
	    Mosaic? mosaic = null,
	    Address? senderAddress = null,
	    Address? recipientAddress = null
	) {
		Version = version ?? 0;
		Type = type ?? MosaicRentalFeeReceipt.RECEIPT_TYPE;
		Mosaic = mosaic ?? new Mosaic();
		SenderAddress = senderAddress ?? new Address();
		RecipientAddress = recipientAddress ?? new Address();
	}

	public void Sort() {
		Mosaic.Sort();
	}

	public ushort Version {
		get; set;
	}

	public ReceiptType Type {
		get; set;
	}

	public Mosaic Mosaic {
		get; set;
	}

	public Address SenderAddress {
		get; set;
	}

	public Address RecipientAddress {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 2;
			size += Type.Size;
			size += Mosaic.Size;
			size += SenderAddress.Size;
			size += RecipientAddress.Size;
			return size;
		}
	}

	public static MosaicRentalFeeReceipt Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var version = br.ReadUInt16();
		var type = ReceiptType.Deserialize(br);
		var mosaic = Mosaic.Deserialize(br);
		var senderAddress = Address.Deserialize(br);
		var recipientAddress = Address.Deserialize(br);

		var instance = new MosaicRentalFeeReceipt(
			version,
			type,
			mosaic,
			senderAddress,
			recipientAddress);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(Version)); 
		bw.Write(Type.Serialize()); 
		bw.Write(Mosaic.Serialize()); 
		bw.Write(SenderAddress.Serialize()); 
		bw.Write(RecipientAddress.Serialize()); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"type: {Type}, ";
		result += $"mosaic: {Mosaic}, ";
		result += $"senderAddress: {SenderAddress}, ";
		result += $"recipientAddress: {RecipientAddress}, ";
		result += ")";
		return result;
	}
}

public class NamespaceId : BaseValue, ISerializer {
	public const byte SIZE = 8;

	public NamespaceId(object? namespaceId = null): base(SIZE, namespaceId) {
	}

	public static NamespaceId Deserialize(BinaryReader br) {
		return new NamespaceId(br.ReadUInt64());
	}

	public byte[] Serialize() {
		return BitConverter.GetBytes(Value);
	}
}

public class NamespaceRegistrationType : IEnum<byte> {
	public static readonly NamespaceRegistrationType ROOT = new NamespaceRegistrationType(0);

	public static readonly NamespaceRegistrationType CHILD = new NamespaceRegistrationType(1);

	public byte Value { get; }

	public NamespaceRegistrationType(byte value = 0) {
		Value = value;
	}

	internal static string ValueToKey(uint value) {
		var values = new uint[]{
			0, 1
		};
		var keys = new []{
			"ROOT", "CHILD"
		};

		var index = Array.IndexOf(values, value);
		if (-1 == index)
			throw new Exception($"invalid enum value {value}");

		return keys[index];
	}

	internal static NamespaceRegistrationType FromValue(uint value) {
		return value switch
		{
			0 => ROOT,
			1 => CHILD,
			_ => throw new Exception($"invalid enum value {value}")
		};
	}

	public uint Size {
		get {
			return 1;
		}
	}

	public static NamespaceRegistrationType Deserialize(BinaryReader br) {
		return FromValue(br.ReadByte());
	}

	public byte[] Serialize() {
		return new []{Value};
	}

	public override string ToString() {
		return $"NamespaceRegistrationType.{ValueToKey(Value)}";
	}
}

public class AliasAction : IEnum<byte> {
	public static readonly AliasAction UNLINK = new AliasAction(0);

	public static readonly AliasAction LINK = new AliasAction(1);

	public byte Value { get; }

	public AliasAction(byte value = 0) {
		Value = value;
	}

	internal static string ValueToKey(uint value) {
		var values = new uint[]{
			0, 1
		};
		var keys = new []{
			"UNLINK", "LINK"
		};

		var index = Array.IndexOf(values, value);
		if (-1 == index)
			throw new Exception($"invalid enum value {value}");

		return keys[index];
	}

	internal static AliasAction FromValue(uint value) {
		return value switch
		{
			0 => UNLINK,
			1 => LINK,
			_ => throw new Exception($"invalid enum value {value}")
		};
	}

	public uint Size {
		get {
			return 1;
		}
	}

	public static AliasAction Deserialize(BinaryReader br) {
		return FromValue(br.ReadByte());
	}

	public byte[] Serialize() {
		return new []{Value};
	}

	public override string ToString() {
		return $"AliasAction.{ValueToKey(Value)}";
	}
}

public class NamespaceExpiredReceipt : ISerializer {
	public static readonly ReceiptType RECEIPT_TYPE = ReceiptType.NAMESPACE_EXPIRED;


	public NamespaceExpiredReceipt(ushort? version = null, ReceiptType? type = null, NamespaceId? artifactId = null) {
		Version = version ?? 0;
		Type = type ?? NamespaceExpiredReceipt.RECEIPT_TYPE;
		ArtifactId = artifactId ?? new NamespaceId();
	}

	public void Sort() {
	}

	public ushort Version {
		get; set;
	}

	public ReceiptType Type {
		get; set;
	}

	public NamespaceId ArtifactId {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 2;
			size += Type.Size;
			size += ArtifactId.Size;
			return size;
		}
	}

	public static NamespaceExpiredReceipt Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var version = br.ReadUInt16();
		var type = ReceiptType.Deserialize(br);
		var artifactId = NamespaceId.Deserialize(br);

		var instance = new NamespaceExpiredReceipt(
			version,
			type,
			artifactId);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(Version)); 
		bw.Write(Type.Serialize()); 
		bw.Write(ArtifactId.Serialize()); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"type: {Type}, ";
		result += $"artifactId: {ArtifactId}, ";
		result += ")";
		return result;
	}
}

public class NamespaceDeletedReceipt : ISerializer {
	public static readonly ReceiptType RECEIPT_TYPE = ReceiptType.NAMESPACE_DELETED;


	public NamespaceDeletedReceipt(ushort? version = null, ReceiptType? type = null, NamespaceId? artifactId = null) {
		Version = version ?? 0;
		Type = type ?? NamespaceDeletedReceipt.RECEIPT_TYPE;
		ArtifactId = artifactId ?? new NamespaceId();
	}

	public void Sort() {
	}

	public ushort Version {
		get; set;
	}

	public ReceiptType Type {
		get; set;
	}

	public NamespaceId ArtifactId {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 2;
			size += Type.Size;
			size += ArtifactId.Size;
			return size;
		}
	}

	public static NamespaceDeletedReceipt Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var version = br.ReadUInt16();
		var type = ReceiptType.Deserialize(br);
		var artifactId = NamespaceId.Deserialize(br);

		var instance = new NamespaceDeletedReceipt(
			version,
			type,
			artifactId);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(Version)); 
		bw.Write(Type.Serialize()); 
		bw.Write(ArtifactId.Serialize()); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"type: {Type}, ";
		result += $"artifactId: {ArtifactId}, ";
		result += ")";
		return result;
	}
}

public class NamespaceRentalFeeReceipt : ISerializer {
	public static readonly ReceiptType RECEIPT_TYPE = ReceiptType.NAMESPACE_RENTAL_FEE;


	public NamespaceRentalFeeReceipt(
	    ushort? version = null,
	    ReceiptType? type = null,
	    Mosaic? mosaic = null,
	    Address? senderAddress = null,
	    Address? recipientAddress = null
	) {
		Version = version ?? 0;
		Type = type ?? NamespaceRentalFeeReceipt.RECEIPT_TYPE;
		Mosaic = mosaic ?? new Mosaic();
		SenderAddress = senderAddress ?? new Address();
		RecipientAddress = recipientAddress ?? new Address();
	}

	public void Sort() {
		Mosaic.Sort();
	}

	public ushort Version {
		get; set;
	}

	public ReceiptType Type {
		get; set;
	}

	public Mosaic Mosaic {
		get; set;
	}

	public Address SenderAddress {
		get; set;
	}

	public Address RecipientAddress {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 2;
			size += Type.Size;
			size += Mosaic.Size;
			size += SenderAddress.Size;
			size += RecipientAddress.Size;
			return size;
		}
	}

	public static NamespaceRentalFeeReceipt Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var version = br.ReadUInt16();
		var type = ReceiptType.Deserialize(br);
		var mosaic = Mosaic.Deserialize(br);
		var senderAddress = Address.Deserialize(br);
		var recipientAddress = Address.Deserialize(br);

		var instance = new NamespaceRentalFeeReceipt(
			version,
			type,
			mosaic,
			senderAddress,
			recipientAddress);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(Version)); 
		bw.Write(Type.Serialize()); 
		bw.Write(Mosaic.Serialize()); 
		bw.Write(SenderAddress.Serialize()); 
		bw.Write(RecipientAddress.Serialize()); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"type: {Type}, ";
		result += $"mosaic: {Mosaic}, ";
		result += $"senderAddress: {SenderAddress}, ";
		result += $"recipientAddress: {RecipientAddress}, ";
		result += ")";
		return result;
	}
}

public class ReceiptSource : ISerializer {
	public ReceiptSource(uint? primaryId = null, uint? secondaryId = null) {
		PrimaryId = primaryId ?? 0;
		SecondaryId = secondaryId ?? 0;
	}

	public void Sort() {
	}

	public uint PrimaryId {
		get; set;
	}

	public uint SecondaryId {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			return size;
		}
	}

	public static ReceiptSource Deserialize(BinaryReader br) {
		var primaryId = br.ReadUInt32();
		var secondaryId = br.ReadUInt32();

		var instance = new ReceiptSource(
			primaryId,
			secondaryId);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(BitConverter.GetBytes(PrimaryId)); 
		bw.Write(BitConverter.GetBytes(SecondaryId)); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"primaryId: {Converter.ToString(PrimaryId)}, ";
		result += $"secondaryId: {Converter.ToString(SecondaryId)}, ";
		result += ")";
		return result;
	}
}

public class AddressResolutionEntry : ISerializer {
	public AddressResolutionEntry(ReceiptSource? source = null, Address? resolvedValue = null) {
		Source = source ?? new ReceiptSource();
		ResolvedValue = resolvedValue ?? new Address();
	}

	public void Sort() {
		Source.Sort();
	}

	public ReceiptSource Source {
		get; set;
	}

	public Address ResolvedValue {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += Source.Size;
			size += ResolvedValue.Size;
			return size;
		}
	}

	public static AddressResolutionEntry Deserialize(BinaryReader br) {
		var source = ReceiptSource.Deserialize(br);
		var resolvedValue = Address.Deserialize(br);

		var instance = new AddressResolutionEntry(
			source,
			resolvedValue);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Source.Serialize()); 
		bw.Write(ResolvedValue.Serialize()); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"source: {Source}, ";
		result += $"resolvedValue: {ResolvedValue}, ";
		result += ")";
		return result;
	}
}

public class AddressResolutionStatement : ISerializer {
	public AddressResolutionStatement(UnresolvedAddress? unresolved = null, AddressResolutionEntry[]? resolutionEntries = null) {
		Unresolved = unresolved ?? new UnresolvedAddress();
		ResolutionEntries = resolutionEntries ?? Array.Empty<AddressResolutionEntry>();
	}

	public void Sort() {
	}

	public UnresolvedAddress Unresolved {
		get; set;
	}

	public AddressResolutionEntry[] ResolutionEntries {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += Unresolved.Size;
			size += 4;
			size += ArrayHelpers.Size(ResolutionEntries);
			return size;
		}
	}

	public static AddressResolutionStatement Deserialize(BinaryReader br) {
		var unresolved = UnresolvedAddress.Deserialize(br);
		var resolutionEntriesCount = br.ReadUInt32();
		var resolutionEntries = ArrayHelpers.ReadArrayCount(br, AddressResolutionEntry.Deserialize, (byte)resolutionEntriesCount);

		var instance = new AddressResolutionStatement(
			unresolved,
			resolutionEntries);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Unresolved.Serialize()); 
		bw.Write(BitConverter.GetBytes((uint)ResolutionEntries.Length));  // bound: resolution_entries_count
		Sort();
		ArrayHelpers.WriteArray(bw, ResolutionEntries);
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"unresolved: {Unresolved}, ";
		result += $"resolutionEntries: [{string.Join(",", ResolutionEntries.Select(e => e.ToString()))}], ";
		result += ")";
		return result;
	}
}

public class MosaicResolutionEntry : ISerializer {
	public MosaicResolutionEntry(ReceiptSource? source = null, MosaicId? resolvedValue = null) {
		Source = source ?? new ReceiptSource();
		ResolvedValue = resolvedValue ?? new MosaicId();
	}

	public void Sort() {
		Source.Sort();
	}

	public ReceiptSource Source {
		get; set;
	}

	public MosaicId ResolvedValue {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += Source.Size;
			size += ResolvedValue.Size;
			return size;
		}
	}

	public static MosaicResolutionEntry Deserialize(BinaryReader br) {
		var source = ReceiptSource.Deserialize(br);
		var resolvedValue = MosaicId.Deserialize(br);

		var instance = new MosaicResolutionEntry(
			source,
			resolvedValue);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Source.Serialize()); 
		bw.Write(ResolvedValue.Serialize()); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"source: {Source}, ";
		result += $"resolvedValue: {ResolvedValue}, ";
		result += ")";
		return result;
	}
}

public class MosaicResolutionStatement : ISerializer {
	public MosaicResolutionStatement(UnresolvedMosaicId? unresolved = null, MosaicResolutionEntry[]? resolutionEntries = null) {
		Unresolved = unresolved ?? new UnresolvedMosaicId();
		ResolutionEntries = resolutionEntries ?? Array.Empty<MosaicResolutionEntry>();
	}

	public void Sort() {
	}

	public UnresolvedMosaicId Unresolved {
		get; set;
	}

	public MosaicResolutionEntry[] ResolutionEntries {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += Unresolved.Size;
			size += 4;
			size += ArrayHelpers.Size(ResolutionEntries);
			return size;
		}
	}

	public static MosaicResolutionStatement Deserialize(BinaryReader br) {
		var unresolved = UnresolvedMosaicId.Deserialize(br);
		var resolutionEntriesCount = br.ReadUInt32();
		var resolutionEntries = ArrayHelpers.ReadArrayCount(br, MosaicResolutionEntry.Deserialize, (byte)resolutionEntriesCount);

		var instance = new MosaicResolutionStatement(
			unresolved,
			resolutionEntries);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Unresolved.Serialize()); 
		bw.Write(BitConverter.GetBytes((uint)ResolutionEntries.Length));  // bound: resolution_entries_count
		Sort();
		ArrayHelpers.WriteArray(bw, ResolutionEntries);
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"unresolved: {Unresolved}, ";
		result += $"resolutionEntries: [{string.Join(",", ResolutionEntries.Select(e => e.ToString()))}], ";
		result += ")";
		return result;
	}
}

public class TransactionStatement : ISerializer {
	public TransactionStatement(uint? primaryId = null, uint? secondaryId = null, Receipt[]? receipts = null) {
		PrimaryId = primaryId ?? 0;
		SecondaryId = secondaryId ?? 0;
		Receipts = receipts ?? Array.Empty<Receipt>();
	}

	public void Sort() {
	}

	public uint PrimaryId {
		get; set;
	}

	public uint SecondaryId {
		get; set;
	}

	public Receipt[] Receipts {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += 4;
			size += ArrayHelpers.Size(Receipts);
			return size;
		}
	}

	public static TransactionStatement Deserialize(BinaryReader br) {
		var primaryId = br.ReadUInt32();
		var secondaryId = br.ReadUInt32();
		var receiptCount = br.ReadUInt32();
		var receipts = ArrayHelpers.ReadArrayCount(br, Receipt.Deserialize, (byte)receiptCount);

		var instance = new TransactionStatement(
			primaryId,
			secondaryId,
			receipts);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(BitConverter.GetBytes(PrimaryId)); 
		bw.Write(BitConverter.GetBytes(SecondaryId)); 
		bw.Write(BitConverter.GetBytes((uint)Receipts.Length));  // bound: receipt_count
		Sort();
		ArrayHelpers.WriteArray(bw, Receipts);
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"primaryId: {Converter.ToString(PrimaryId)}, ";
		result += $"secondaryId: {Converter.ToString(SecondaryId)}, ";
		result += $"receipts: [{string.Join(",", Receipts.Select(e => e.ToString()))}], ";
		result += ")";
		return result;
	}
}

public class BlockStatement : ISerializer {
	public BlockStatement(
	    TransactionStatement[]? transactionStatements = null,
	    AddressResolutionStatement[]? addressResolutionStatements = null,
	    MosaicResolutionStatement[]? mosaicResolutionStatements = null
	) {
		TransactionStatements = transactionStatements ?? Array.Empty<TransactionStatement>();
		AddressResolutionStatements = addressResolutionStatements ?? Array.Empty<AddressResolutionStatement>();
		MosaicResolutionStatements = mosaicResolutionStatements ?? Array.Empty<MosaicResolutionStatement>();
	}

	public void Sort() {
	}

	public TransactionStatement[] TransactionStatements {
		get; set;
	}

	public AddressResolutionStatement[] AddressResolutionStatements {
		get; set;
	}

	public MosaicResolutionStatement[] MosaicResolutionStatements {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += ArrayHelpers.Size(TransactionStatements);
			size += 4;
			size += ArrayHelpers.Size(AddressResolutionStatements);
			size += 4;
			size += ArrayHelpers.Size(MosaicResolutionStatements);
			return size;
		}
	}

	public static BlockStatement Deserialize(BinaryReader br) {
		var transactionStatementCount = br.ReadUInt32();
		var transactionStatements = ArrayHelpers.ReadArrayCount(br, TransactionStatement.Deserialize, (byte)transactionStatementCount);
		var addressResolutionStatementCount = br.ReadUInt32();
		var addressResolutionStatements = ArrayHelpers.ReadArrayCount(br, AddressResolutionStatement.Deserialize, (byte)addressResolutionStatementCount);
		var mosaicResolutionStatementCount = br.ReadUInt32();
		var mosaicResolutionStatements = ArrayHelpers.ReadArrayCount(br, MosaicResolutionStatement.Deserialize, (byte)mosaicResolutionStatementCount);

		var instance = new BlockStatement(
			transactionStatements,
			addressResolutionStatements,
			mosaicResolutionStatements);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(BitConverter.GetBytes((uint)TransactionStatements.Length));  // bound: transaction_statement_count
		Sort();
		ArrayHelpers.WriteArray(bw, TransactionStatements);
		bw.Write(BitConverter.GetBytes((uint)AddressResolutionStatements.Length));  // bound: address_resolution_statement_count
		Sort();
		ArrayHelpers.WriteArray(bw, AddressResolutionStatements);
		bw.Write(BitConverter.GetBytes((uint)MosaicResolutionStatements.Length));  // bound: mosaic_resolution_statement_count
		Sort();
		ArrayHelpers.WriteArray(bw, MosaicResolutionStatements);
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"transactionStatements: [{string.Join(",", TransactionStatements.Select(e => e.ToString()))}], ";
		result += $"addressResolutionStatements: [{string.Join(",", AddressResolutionStatements.Select(e => e.ToString()))}], ";
		result += $"mosaicResolutionStatements: [{string.Join(",", MosaicResolutionStatements.Select(e => e.ToString()))}], ";
		result += ")";
		return result;
	}
}

public class AccountKeyLinkTransactionV1 : ITransaction {
	public const byte TRANSACTION_VERSION = 1;

	public static readonly TransactionType TRANSACTION_TYPE = TransactionType.ACCOUNT_KEY_LINK;

	private readonly uint VerifiableEntityHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;

	public AccountKeyLinkTransactionV1(
	    Signature? signature = null,
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    TransactionType? type = null,
	    Amount? fee = null,
	    Timestamp? deadline = null,
	    PublicKey? linkedPublicKey = null,
	    LinkAction? linkAction = null
	) {
		Signature = signature ?? new Signature();
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? AccountKeyLinkTransactionV1.TRANSACTION_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? AccountKeyLinkTransactionV1.TRANSACTION_TYPE;
		Fee = fee ?? new Amount();
		Deadline = deadline ?? new Timestamp();
		LinkedPublicKey = linkedPublicKey ?? new PublicKey();
		LinkAction = linkAction ?? LinkAction.UNLINK;
		VerifiableEntityHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
	}

	public void Sort() {
	}

	public Signature Signature {
		get; set;
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public TransactionType Type {
		get; set;
	}

	public Amount Fee {
		get; set;
	}

	public Timestamp Deadline {
		get; set;
	}

	public PublicKey LinkedPublicKey {
		get; set;
	}

	public LinkAction LinkAction {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += Signature.Size;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += Fee.Size;
			size += Deadline.Size;
			size += LinkedPublicKey.Size;
			size += LinkAction.Size;
			return size;
		}
	}

	public static AccountKeyLinkTransactionV1 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var verifiableEntityHeaderReserved_1 = br.ReadUInt32();
		if (0 != verifiableEntityHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({verifiableEntityHeaderReserved_1})");
		var signature = Signature.Deserialize(br);
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = TransactionType.Deserialize(br);
		var fee = Amount.Deserialize(br);
		var deadline = Timestamp.Deserialize(br);
		var linkedPublicKey = PublicKey.Deserialize(br);
		var linkAction = LinkAction.Deserialize(br);

		var instance = new AccountKeyLinkTransactionV1(
			signature,
			signerPublicKey,
			version,
			network,
			type,
			fee,
			deadline,
			linkedPublicKey,
			linkAction);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(VerifiableEntityHeaderReserved_1)); 
		bw.Write(Signature.Serialize()); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(Fee.Serialize()); 
		bw.Write(Deadline.Serialize()); 
		bw.Write(LinkedPublicKey.Serialize()); 
		bw.Write(LinkAction.Serialize()); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signature: {Signature}, ";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"fee: {Fee}, ";
		result += $"deadline: {Deadline}, ";
		result += $"linkedPublicKey: {LinkedPublicKey}, ";
		result += $"linkAction: {LinkAction}, ";
		result += ")";
		return result;
	}
}

public class EmbeddedAccountKeyLinkTransactionV1 : IBaseTransaction {
	public const byte TRANSACTION_VERSION = 1;

	public static readonly TransactionType TRANSACTION_TYPE = TransactionType.ACCOUNT_KEY_LINK;

	private readonly uint EmbeddedTransactionHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;

	public EmbeddedAccountKeyLinkTransactionV1(
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    TransactionType? type = null,
	    PublicKey? linkedPublicKey = null,
	    LinkAction? linkAction = null
	) {
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? EmbeddedAccountKeyLinkTransactionV1.TRANSACTION_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? EmbeddedAccountKeyLinkTransactionV1.TRANSACTION_TYPE;
		LinkedPublicKey = linkedPublicKey ?? new PublicKey();
		LinkAction = linkAction ?? LinkAction.UNLINK;
		EmbeddedTransactionHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
	}

	public void Sort() {
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public TransactionType Type {
		get; set;
	}

	public PublicKey LinkedPublicKey {
		get; set;
	}

	public LinkAction LinkAction {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += LinkedPublicKey.Size;
			size += LinkAction.Size;
			return size;
		}
	}

	public static EmbeddedAccountKeyLinkTransactionV1 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var embeddedTransactionHeaderReserved_1 = br.ReadUInt32();
		if (0 != embeddedTransactionHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({embeddedTransactionHeaderReserved_1})");
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = TransactionType.Deserialize(br);
		var linkedPublicKey = PublicKey.Deserialize(br);
		var linkAction = LinkAction.Deserialize(br);

		var instance = new EmbeddedAccountKeyLinkTransactionV1(
			signerPublicKey,
			version,
			network,
			type,
			linkedPublicKey,
			linkAction);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(EmbeddedTransactionHeaderReserved_1)); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(LinkedPublicKey.Serialize()); 
		bw.Write(LinkAction.Serialize()); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"linkedPublicKey: {LinkedPublicKey}, ";
		result += $"linkAction: {LinkAction}, ";
		result += ")";
		return result;
	}
}

public class NodeKeyLinkTransactionV1 : ITransaction {
	public const byte TRANSACTION_VERSION = 1;

	public static readonly TransactionType TRANSACTION_TYPE = TransactionType.NODE_KEY_LINK;

	private readonly uint VerifiableEntityHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;

	public NodeKeyLinkTransactionV1(
	    Signature? signature = null,
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    TransactionType? type = null,
	    Amount? fee = null,
	    Timestamp? deadline = null,
	    PublicKey? linkedPublicKey = null,
	    LinkAction? linkAction = null
	) {
		Signature = signature ?? new Signature();
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? NodeKeyLinkTransactionV1.TRANSACTION_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? NodeKeyLinkTransactionV1.TRANSACTION_TYPE;
		Fee = fee ?? new Amount();
		Deadline = deadline ?? new Timestamp();
		LinkedPublicKey = linkedPublicKey ?? new PublicKey();
		LinkAction = linkAction ?? LinkAction.UNLINK;
		VerifiableEntityHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
	}

	public void Sort() {
	}

	public Signature Signature {
		get; set;
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public TransactionType Type {
		get; set;
	}

	public Amount Fee {
		get; set;
	}

	public Timestamp Deadline {
		get; set;
	}

	public PublicKey LinkedPublicKey {
		get; set;
	}

	public LinkAction LinkAction {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += Signature.Size;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += Fee.Size;
			size += Deadline.Size;
			size += LinkedPublicKey.Size;
			size += LinkAction.Size;
			return size;
		}
	}

	public static NodeKeyLinkTransactionV1 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var verifiableEntityHeaderReserved_1 = br.ReadUInt32();
		if (0 != verifiableEntityHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({verifiableEntityHeaderReserved_1})");
		var signature = Signature.Deserialize(br);
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = TransactionType.Deserialize(br);
		var fee = Amount.Deserialize(br);
		var deadline = Timestamp.Deserialize(br);
		var linkedPublicKey = PublicKey.Deserialize(br);
		var linkAction = LinkAction.Deserialize(br);

		var instance = new NodeKeyLinkTransactionV1(
			signature,
			signerPublicKey,
			version,
			network,
			type,
			fee,
			deadline,
			linkedPublicKey,
			linkAction);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(VerifiableEntityHeaderReserved_1)); 
		bw.Write(Signature.Serialize()); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(Fee.Serialize()); 
		bw.Write(Deadline.Serialize()); 
		bw.Write(LinkedPublicKey.Serialize()); 
		bw.Write(LinkAction.Serialize()); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signature: {Signature}, ";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"fee: {Fee}, ";
		result += $"deadline: {Deadline}, ";
		result += $"linkedPublicKey: {LinkedPublicKey}, ";
		result += $"linkAction: {LinkAction}, ";
		result += ")";
		return result;
	}
}

public class EmbeddedNodeKeyLinkTransactionV1 : IBaseTransaction {
	public const byte TRANSACTION_VERSION = 1;

	public static readonly TransactionType TRANSACTION_TYPE = TransactionType.NODE_KEY_LINK;

	private readonly uint EmbeddedTransactionHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;

	public EmbeddedNodeKeyLinkTransactionV1(
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    TransactionType? type = null,
	    PublicKey? linkedPublicKey = null,
	    LinkAction? linkAction = null
	) {
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? EmbeddedNodeKeyLinkTransactionV1.TRANSACTION_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? EmbeddedNodeKeyLinkTransactionV1.TRANSACTION_TYPE;
		LinkedPublicKey = linkedPublicKey ?? new PublicKey();
		LinkAction = linkAction ?? LinkAction.UNLINK;
		EmbeddedTransactionHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
	}

	public void Sort() {
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public TransactionType Type {
		get; set;
	}

	public PublicKey LinkedPublicKey {
		get; set;
	}

	public LinkAction LinkAction {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += LinkedPublicKey.Size;
			size += LinkAction.Size;
			return size;
		}
	}

	public static EmbeddedNodeKeyLinkTransactionV1 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var embeddedTransactionHeaderReserved_1 = br.ReadUInt32();
		if (0 != embeddedTransactionHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({embeddedTransactionHeaderReserved_1})");
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = TransactionType.Deserialize(br);
		var linkedPublicKey = PublicKey.Deserialize(br);
		var linkAction = LinkAction.Deserialize(br);

		var instance = new EmbeddedNodeKeyLinkTransactionV1(
			signerPublicKey,
			version,
			network,
			type,
			linkedPublicKey,
			linkAction);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(EmbeddedTransactionHeaderReserved_1)); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(LinkedPublicKey.Serialize()); 
		bw.Write(LinkAction.Serialize()); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"linkedPublicKey: {LinkedPublicKey}, ";
		result += $"linkAction: {LinkAction}, ";
		result += ")";
		return result;
	}
}

public class Cosignature : ISerializer {
	public Cosignature(ulong? version = null, PublicKey? signerPublicKey = null, Signature? signature = null) {
		Version = version ?? 0;
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Signature = signature ?? new Signature();
	}

	public void Sort() {
	}

	public ulong Version {
		get; set;
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public Signature Signature {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 8;
			size += SignerPublicKey.Size;
			size += Signature.Size;
			return size;
		}
	}

	public static Cosignature Deserialize(BinaryReader br) {
		var version = br.ReadUInt64();
		var signerPublicKey = PublicKey.Deserialize(br);
		var signature = Signature.Deserialize(br);

		var instance = new Cosignature(
			version,
			signerPublicKey,
			signature);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(BitConverter.GetBytes(Version)); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(Signature.Serialize()); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"signature: {Signature}, ";
		result += ")";
		return result;
	}
}

public class DetachedCosignature : ISerializer {
	public DetachedCosignature(
	    ulong? version = null,
	    PublicKey? signerPublicKey = null,
	    Signature? signature = null,
	    Hash256? parentHash = null
	) {
		Version = version ?? 0;
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Signature = signature ?? new Signature();
		ParentHash = parentHash ?? new Hash256();
	}

	public void Sort() {
	}

	public ulong Version {
		get; set;
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public Signature Signature {
		get; set;
	}

	public Hash256 ParentHash {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 8;
			size += SignerPublicKey.Size;
			size += Signature.Size;
			size += ParentHash.Size;
			return size;
		}
	}

	public static DetachedCosignature Deserialize(BinaryReader br) {
		var version = br.ReadUInt64();
		var signerPublicKey = PublicKey.Deserialize(br);
		var signature = Signature.Deserialize(br);
		var parentHash = Hash256.Deserialize(br);

		var instance = new DetachedCosignature(
			version,
			signerPublicKey,
			signature,
			parentHash);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(BitConverter.GetBytes(Version)); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(Signature.Serialize()); 
		bw.Write(ParentHash.Serialize()); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"signature: {Signature}, ";
		result += $"parentHash: {ParentHash}, ";
		result += ")";
		return result;
	}
}

public class AggregateCompleteTransactionV1 : ITransaction {
	public const byte TRANSACTION_VERSION = 1;

	public static readonly TransactionType TRANSACTION_TYPE = TransactionType.AGGREGATE_COMPLETE;

	private readonly uint VerifiableEntityHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;
	private readonly uint AggregateTransactionHeaderReserved_1;

	public AggregateCompleteTransactionV1(
	    Signature? signature = null,
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    TransactionType? type = null,
	    Amount? fee = null,
	    Timestamp? deadline = null,
	    Hash256? transactionsHash = null,
	    IBaseTransaction[]? transactions = null,
	    Cosignature[]? cosignatures = null
	) {
		Signature = signature ?? new Signature();
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? AggregateCompleteTransactionV1.TRANSACTION_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? AggregateCompleteTransactionV1.TRANSACTION_TYPE;
		Fee = fee ?? new Amount();
		Deadline = deadline ?? new Timestamp();
		TransactionsHash = transactionsHash ?? new Hash256();
		Transactions = transactions ?? Array.Empty<IBaseTransaction>();
		Cosignatures = cosignatures ?? Array.Empty<Cosignature>();
		VerifiableEntityHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
		AggregateTransactionHeaderReserved_1 = 0; // reserved field
	}

	public void Sort() {
	}

	public Signature Signature {
		get; set;
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public TransactionType Type {
		get; set;
	}

	public Amount Fee {
		get; set;
	}

	public Timestamp Deadline {
		get; set;
	}

	public Hash256 TransactionsHash {
		get; set;
	}

	public IBaseTransaction[] Transactions {
		get; set;
	}

	public Cosignature[] Cosignatures {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += Signature.Size;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += Fee.Size;
			size += Deadline.Size;
			size += TransactionsHash.Size;
			size += 4;
			size += 4;
			size += ArrayHelpers.Size(Transactions, 8, false);
			size += ArrayHelpers.Size(Cosignatures);
			return size;
		}
	}

	public static AggregateCompleteTransactionV1 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var verifiableEntityHeaderReserved_1 = br.ReadUInt32();
		if (0 != verifiableEntityHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({verifiableEntityHeaderReserved_1})");
		var signature = Signature.Deserialize(br);
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = TransactionType.Deserialize(br);
		var fee = Amount.Deserialize(br);
		var deadline = Timestamp.Deserialize(br);
		var transactionsHash = Hash256.Deserialize(br);
		var payloadSize = br.ReadUInt32();
		var aggregateTransactionHeaderReserved_1 = br.ReadUInt32();
		if (0 != aggregateTransactionHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({aggregateTransactionHeaderReserved_1})");
		var transactions = ArrayHelpers.ReadVariableSizeElements(br, EmbeddedTransactionFactory.Deserialize, payloadSize, 8, false);
		var cosignatures = ArrayHelpers.ReadArray(br, Cosignature.Deserialize);

		var instance = new AggregateCompleteTransactionV1(
			signature,
			signerPublicKey,
			version,
			network,
			type,
			fee,
			deadline,
			transactionsHash,
			transactions,
			cosignatures);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(VerifiableEntityHeaderReserved_1)); 
		bw.Write(Signature.Serialize()); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(Fee.Serialize()); 
		bw.Write(Deadline.Serialize()); 
		bw.Write(TransactionsHash.Serialize()); 
		bw.Write(BitConverter.GetBytes(ArrayHelpers.Size(Transactions, 8, false)));  // bound: payload_size
		bw.Write(BitConverter.GetBytes(AggregateTransactionHeaderReserved_1)); 
		Sort();
		ArrayHelpers.WriteVariableSizeElements(bw, Transactions, 8, false);
		Sort();
		ArrayHelpers.WriteArray(bw, Cosignatures);
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signature: {Signature}, ";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"fee: {Fee}, ";
		result += $"deadline: {Deadline}, ";
		result += $"transactionsHash: {TransactionsHash}, ";
		result += $"transactions: [{string.Join(",", Transactions.Select(e => e.ToString()))}], ";
		result += $"cosignatures: [{string.Join(",", Cosignatures.Select(e => e.ToString()))}], ";
		result += ")";
		return result;
	}
}

public class AggregateCompleteTransactionV2 : ITransaction {
	public const byte TRANSACTION_VERSION = 2;

	public static readonly TransactionType TRANSACTION_TYPE = TransactionType.AGGREGATE_COMPLETE;

	private readonly uint VerifiableEntityHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;
	private readonly uint AggregateTransactionHeaderReserved_1;

	public AggregateCompleteTransactionV2(
	    Signature? signature = null,
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    TransactionType? type = null,
	    Amount? fee = null,
	    Timestamp? deadline = null,
	    Hash256? transactionsHash = null,
	    IBaseTransaction[]? transactions = null,
	    Cosignature[]? cosignatures = null
	) {
		Signature = signature ?? new Signature();
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? AggregateCompleteTransactionV2.TRANSACTION_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? AggregateCompleteTransactionV2.TRANSACTION_TYPE;
		Fee = fee ?? new Amount();
		Deadline = deadline ?? new Timestamp();
		TransactionsHash = transactionsHash ?? new Hash256();
		Transactions = transactions ?? Array.Empty<IBaseTransaction>();
		Cosignatures = cosignatures ?? Array.Empty<Cosignature>();
		VerifiableEntityHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
		AggregateTransactionHeaderReserved_1 = 0; // reserved field
	}

	public void Sort() {
	}

	public Signature Signature {
		get; set;
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public TransactionType Type {
		get; set;
	}

	public Amount Fee {
		get; set;
	}

	public Timestamp Deadline {
		get; set;
	}

	public Hash256 TransactionsHash {
		get; set;
	}

	public IBaseTransaction[] Transactions {
		get; set;
	}

	public Cosignature[] Cosignatures {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += Signature.Size;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += Fee.Size;
			size += Deadline.Size;
			size += TransactionsHash.Size;
			size += 4;
			size += 4;
			size += ArrayHelpers.Size(Transactions, 8, false);
			size += ArrayHelpers.Size(Cosignatures);
			return size;
		}
	}

	public static AggregateCompleteTransactionV2 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var verifiableEntityHeaderReserved_1 = br.ReadUInt32();
		if (0 != verifiableEntityHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({verifiableEntityHeaderReserved_1})");
		var signature = Signature.Deserialize(br);
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = TransactionType.Deserialize(br);
		var fee = Amount.Deserialize(br);
		var deadline = Timestamp.Deserialize(br);
		var transactionsHash = Hash256.Deserialize(br);
		var payloadSize = br.ReadUInt32();
		var aggregateTransactionHeaderReserved_1 = br.ReadUInt32();
		if (0 != aggregateTransactionHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({aggregateTransactionHeaderReserved_1})");
		var transactions = ArrayHelpers.ReadVariableSizeElements(br, EmbeddedTransactionFactory.Deserialize, payloadSize, 8, false);
		var cosignatures = ArrayHelpers.ReadArray(br, Cosignature.Deserialize);

		var instance = new AggregateCompleteTransactionV2(
			signature,
			signerPublicKey,
			version,
			network,
			type,
			fee,
			deadline,
			transactionsHash,
			transactions,
			cosignatures);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(VerifiableEntityHeaderReserved_1)); 
		bw.Write(Signature.Serialize()); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(Fee.Serialize()); 
		bw.Write(Deadline.Serialize()); 
		bw.Write(TransactionsHash.Serialize()); 
		bw.Write(BitConverter.GetBytes(ArrayHelpers.Size(Transactions, 8, false)));  // bound: payload_size
		bw.Write(BitConverter.GetBytes(AggregateTransactionHeaderReserved_1)); 
		Sort();
		ArrayHelpers.WriteVariableSizeElements(bw, Transactions, 8, false);
		Sort();
		ArrayHelpers.WriteArray(bw, Cosignatures);
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signature: {Signature}, ";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"fee: {Fee}, ";
		result += $"deadline: {Deadline}, ";
		result += $"transactionsHash: {TransactionsHash}, ";
		result += $"transactions: [{string.Join(",", Transactions.Select(e => e.ToString()))}], ";
		result += $"cosignatures: [{string.Join(",", Cosignatures.Select(e => e.ToString()))}], ";
		result += ")";
		return result;
	}
}

public class AggregateBondedTransactionV1 : ITransaction {
	public const byte TRANSACTION_VERSION = 1;

	public static readonly TransactionType TRANSACTION_TYPE = TransactionType.AGGREGATE_BONDED;

	private readonly uint VerifiableEntityHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;
	private readonly uint AggregateTransactionHeaderReserved_1;

	public AggregateBondedTransactionV1(
	    Signature? signature = null,
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    TransactionType? type = null,
	    Amount? fee = null,
	    Timestamp? deadline = null,
	    Hash256? transactionsHash = null,
	    IBaseTransaction[]? transactions = null,
	    Cosignature[]? cosignatures = null
	) {
		Signature = signature ?? new Signature();
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? AggregateBondedTransactionV1.TRANSACTION_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? AggregateBondedTransactionV1.TRANSACTION_TYPE;
		Fee = fee ?? new Amount();
		Deadline = deadline ?? new Timestamp();
		TransactionsHash = transactionsHash ?? new Hash256();
		Transactions = transactions ?? Array.Empty<IBaseTransaction>();
		Cosignatures = cosignatures ?? Array.Empty<Cosignature>();
		VerifiableEntityHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
		AggregateTransactionHeaderReserved_1 = 0; // reserved field
	}

	public void Sort() {
	}

	public Signature Signature {
		get; set;
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public TransactionType Type {
		get; set;
	}

	public Amount Fee {
		get; set;
	}

	public Timestamp Deadline {
		get; set;
	}

	public Hash256 TransactionsHash {
		get; set;
	}

	public IBaseTransaction[] Transactions {
		get; set;
	}

	public Cosignature[] Cosignatures {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += Signature.Size;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += Fee.Size;
			size += Deadline.Size;
			size += TransactionsHash.Size;
			size += 4;
			size += 4;
			size += ArrayHelpers.Size(Transactions, 8, false);
			size += ArrayHelpers.Size(Cosignatures);
			return size;
		}
	}

	public static AggregateBondedTransactionV1 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var verifiableEntityHeaderReserved_1 = br.ReadUInt32();
		if (0 != verifiableEntityHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({verifiableEntityHeaderReserved_1})");
		var signature = Signature.Deserialize(br);
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = TransactionType.Deserialize(br);
		var fee = Amount.Deserialize(br);
		var deadline = Timestamp.Deserialize(br);
		var transactionsHash = Hash256.Deserialize(br);
		var payloadSize = br.ReadUInt32();
		var aggregateTransactionHeaderReserved_1 = br.ReadUInt32();
		if (0 != aggregateTransactionHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({aggregateTransactionHeaderReserved_1})");
		var transactions = ArrayHelpers.ReadVariableSizeElements(br, EmbeddedTransactionFactory.Deserialize, payloadSize, 8, false);
		var cosignatures = ArrayHelpers.ReadArray(br, Cosignature.Deserialize);

		var instance = new AggregateBondedTransactionV1(
			signature,
			signerPublicKey,
			version,
			network,
			type,
			fee,
			deadline,
			transactionsHash,
			transactions,
			cosignatures);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(VerifiableEntityHeaderReserved_1)); 
		bw.Write(Signature.Serialize()); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(Fee.Serialize()); 
		bw.Write(Deadline.Serialize()); 
		bw.Write(TransactionsHash.Serialize()); 
		bw.Write(BitConverter.GetBytes(ArrayHelpers.Size(Transactions, 8, false)));  // bound: payload_size
		bw.Write(BitConverter.GetBytes(AggregateTransactionHeaderReserved_1)); 
		Sort();
		ArrayHelpers.WriteVariableSizeElements(bw, Transactions, 8, false);
		Sort();
		ArrayHelpers.WriteArray(bw, Cosignatures);
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signature: {Signature}, ";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"fee: {Fee}, ";
		result += $"deadline: {Deadline}, ";
		result += $"transactionsHash: {TransactionsHash}, ";
		result += $"transactions: [{string.Join(",", Transactions.Select(e => e.ToString()))}], ";
		result += $"cosignatures: [{string.Join(",", Cosignatures.Select(e => e.ToString()))}], ";
		result += ")";
		return result;
	}
}

public class AggregateBondedTransactionV2 : ITransaction {
	public const byte TRANSACTION_VERSION = 2;

	public static readonly TransactionType TRANSACTION_TYPE = TransactionType.AGGREGATE_BONDED;

	private readonly uint VerifiableEntityHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;
	private readonly uint AggregateTransactionHeaderReserved_1;

	public AggregateBondedTransactionV2(
	    Signature? signature = null,
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    TransactionType? type = null,
	    Amount? fee = null,
	    Timestamp? deadline = null,
	    Hash256? transactionsHash = null,
	    IBaseTransaction[]? transactions = null,
	    Cosignature[]? cosignatures = null
	) {
		Signature = signature ?? new Signature();
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? AggregateBondedTransactionV2.TRANSACTION_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? AggregateBondedTransactionV2.TRANSACTION_TYPE;
		Fee = fee ?? new Amount();
		Deadline = deadline ?? new Timestamp();
		TransactionsHash = transactionsHash ?? new Hash256();
		Transactions = transactions ?? Array.Empty<IBaseTransaction>();
		Cosignatures = cosignatures ?? Array.Empty<Cosignature>();
		VerifiableEntityHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
		AggregateTransactionHeaderReserved_1 = 0; // reserved field
	}

	public void Sort() {
	}

	public Signature Signature {
		get; set;
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public TransactionType Type {
		get; set;
	}

	public Amount Fee {
		get; set;
	}

	public Timestamp Deadline {
		get; set;
	}

	public Hash256 TransactionsHash {
		get; set;
	}

	public IBaseTransaction[] Transactions {
		get; set;
	}

	public Cosignature[] Cosignatures {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += Signature.Size;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += Fee.Size;
			size += Deadline.Size;
			size += TransactionsHash.Size;
			size += 4;
			size += 4;
			size += ArrayHelpers.Size(Transactions, 8, false);
			size += ArrayHelpers.Size(Cosignatures);
			return size;
		}
	}

	public static AggregateBondedTransactionV2 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var verifiableEntityHeaderReserved_1 = br.ReadUInt32();
		if (0 != verifiableEntityHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({verifiableEntityHeaderReserved_1})");
		var signature = Signature.Deserialize(br);
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = TransactionType.Deserialize(br);
		var fee = Amount.Deserialize(br);
		var deadline = Timestamp.Deserialize(br);
		var transactionsHash = Hash256.Deserialize(br);
		var payloadSize = br.ReadUInt32();
		var aggregateTransactionHeaderReserved_1 = br.ReadUInt32();
		if (0 != aggregateTransactionHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({aggregateTransactionHeaderReserved_1})");
		var transactions = ArrayHelpers.ReadVariableSizeElements(br, EmbeddedTransactionFactory.Deserialize, payloadSize, 8, false);
		var cosignatures = ArrayHelpers.ReadArray(br, Cosignature.Deserialize);

		var instance = new AggregateBondedTransactionV2(
			signature,
			signerPublicKey,
			version,
			network,
			type,
			fee,
			deadline,
			transactionsHash,
			transactions,
			cosignatures);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(VerifiableEntityHeaderReserved_1)); 
		bw.Write(Signature.Serialize()); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(Fee.Serialize()); 
		bw.Write(Deadline.Serialize()); 
		bw.Write(TransactionsHash.Serialize()); 
		bw.Write(BitConverter.GetBytes(ArrayHelpers.Size(Transactions, 8, false)));  // bound: payload_size
		bw.Write(BitConverter.GetBytes(AggregateTransactionHeaderReserved_1)); 
		Sort();
		ArrayHelpers.WriteVariableSizeElements(bw, Transactions, 8, false);
		Sort();
		ArrayHelpers.WriteArray(bw, Cosignatures);
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signature: {Signature}, ";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"fee: {Fee}, ";
		result += $"deadline: {Deadline}, ";
		result += $"transactionsHash: {TransactionsHash}, ";
		result += $"transactions: [{string.Join(",", Transactions.Select(e => e.ToString()))}], ";
		result += $"cosignatures: [{string.Join(",", Cosignatures.Select(e => e.ToString()))}], ";
		result += ")";
		return result;
	}
}

public class VotingKeyLinkTransactionV1 : ITransaction {
	public const byte TRANSACTION_VERSION = 1;

	public static readonly TransactionType TRANSACTION_TYPE = TransactionType.VOTING_KEY_LINK;

	private readonly uint VerifiableEntityHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;

	public VotingKeyLinkTransactionV1(
	    Signature? signature = null,
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    TransactionType? type = null,
	    Amount? fee = null,
	    Timestamp? deadline = null,
	    VotingPublicKey? linkedPublicKey = null,
	    FinalizationEpoch? startEpoch = null,
	    FinalizationEpoch? endEpoch = null,
	    LinkAction? linkAction = null
	) {
		Signature = signature ?? new Signature();
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? VotingKeyLinkTransactionV1.TRANSACTION_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? VotingKeyLinkTransactionV1.TRANSACTION_TYPE;
		Fee = fee ?? new Amount();
		Deadline = deadline ?? new Timestamp();
		LinkedPublicKey = linkedPublicKey ?? new VotingPublicKey();
		StartEpoch = startEpoch ?? new FinalizationEpoch();
		EndEpoch = endEpoch ?? new FinalizationEpoch();
		LinkAction = linkAction ?? LinkAction.UNLINK;
		VerifiableEntityHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
	}

	public void Sort() {
	}

	public Signature Signature {
		get; set;
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public TransactionType Type {
		get; set;
	}

	public Amount Fee {
		get; set;
	}

	public Timestamp Deadline {
		get; set;
	}

	public VotingPublicKey LinkedPublicKey {
		get; set;
	}

	public FinalizationEpoch StartEpoch {
		get; set;
	}

	public FinalizationEpoch EndEpoch {
		get; set;
	}

	public LinkAction LinkAction {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += Signature.Size;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += Fee.Size;
			size += Deadline.Size;
			size += LinkedPublicKey.Size;
			size += StartEpoch.Size;
			size += EndEpoch.Size;
			size += LinkAction.Size;
			return size;
		}
	}

	public static VotingKeyLinkTransactionV1 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var verifiableEntityHeaderReserved_1 = br.ReadUInt32();
		if (0 != verifiableEntityHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({verifiableEntityHeaderReserved_1})");
		var signature = Signature.Deserialize(br);
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = TransactionType.Deserialize(br);
		var fee = Amount.Deserialize(br);
		var deadline = Timestamp.Deserialize(br);
		var linkedPublicKey = VotingPublicKey.Deserialize(br);
		var startEpoch = FinalizationEpoch.Deserialize(br);
		var endEpoch = FinalizationEpoch.Deserialize(br);
		var linkAction = LinkAction.Deserialize(br);

		var instance = new VotingKeyLinkTransactionV1(
			signature,
			signerPublicKey,
			version,
			network,
			type,
			fee,
			deadline,
			linkedPublicKey,
			startEpoch,
			endEpoch,
			linkAction);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(VerifiableEntityHeaderReserved_1)); 
		bw.Write(Signature.Serialize()); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(Fee.Serialize()); 
		bw.Write(Deadline.Serialize()); 
		bw.Write(LinkedPublicKey.Serialize()); 
		bw.Write(StartEpoch.Serialize()); 
		bw.Write(EndEpoch.Serialize()); 
		bw.Write(LinkAction.Serialize()); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signature: {Signature}, ";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"fee: {Fee}, ";
		result += $"deadline: {Deadline}, ";
		result += $"linkedPublicKey: {LinkedPublicKey}, ";
		result += $"startEpoch: {StartEpoch}, ";
		result += $"endEpoch: {EndEpoch}, ";
		result += $"linkAction: {LinkAction}, ";
		result += ")";
		return result;
	}
}

public class EmbeddedVotingKeyLinkTransactionV1 : IBaseTransaction {
	public const byte TRANSACTION_VERSION = 1;

	public static readonly TransactionType TRANSACTION_TYPE = TransactionType.VOTING_KEY_LINK;

	private readonly uint EmbeddedTransactionHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;

	public EmbeddedVotingKeyLinkTransactionV1(
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    TransactionType? type = null,
	    VotingPublicKey? linkedPublicKey = null,
	    FinalizationEpoch? startEpoch = null,
	    FinalizationEpoch? endEpoch = null,
	    LinkAction? linkAction = null
	) {
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? EmbeddedVotingKeyLinkTransactionV1.TRANSACTION_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? EmbeddedVotingKeyLinkTransactionV1.TRANSACTION_TYPE;
		LinkedPublicKey = linkedPublicKey ?? new VotingPublicKey();
		StartEpoch = startEpoch ?? new FinalizationEpoch();
		EndEpoch = endEpoch ?? new FinalizationEpoch();
		LinkAction = linkAction ?? LinkAction.UNLINK;
		EmbeddedTransactionHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
	}

	public void Sort() {
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public TransactionType Type {
		get; set;
	}

	public VotingPublicKey LinkedPublicKey {
		get; set;
	}

	public FinalizationEpoch StartEpoch {
		get; set;
	}

	public FinalizationEpoch EndEpoch {
		get; set;
	}

	public LinkAction LinkAction {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += LinkedPublicKey.Size;
			size += StartEpoch.Size;
			size += EndEpoch.Size;
			size += LinkAction.Size;
			return size;
		}
	}

	public static EmbeddedVotingKeyLinkTransactionV1 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var embeddedTransactionHeaderReserved_1 = br.ReadUInt32();
		if (0 != embeddedTransactionHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({embeddedTransactionHeaderReserved_1})");
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = TransactionType.Deserialize(br);
		var linkedPublicKey = VotingPublicKey.Deserialize(br);
		var startEpoch = FinalizationEpoch.Deserialize(br);
		var endEpoch = FinalizationEpoch.Deserialize(br);
		var linkAction = LinkAction.Deserialize(br);

		var instance = new EmbeddedVotingKeyLinkTransactionV1(
			signerPublicKey,
			version,
			network,
			type,
			linkedPublicKey,
			startEpoch,
			endEpoch,
			linkAction);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(EmbeddedTransactionHeaderReserved_1)); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(LinkedPublicKey.Serialize()); 
		bw.Write(StartEpoch.Serialize()); 
		bw.Write(EndEpoch.Serialize()); 
		bw.Write(LinkAction.Serialize()); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"linkedPublicKey: {LinkedPublicKey}, ";
		result += $"startEpoch: {StartEpoch}, ";
		result += $"endEpoch: {EndEpoch}, ";
		result += $"linkAction: {LinkAction}, ";
		result += ")";
		return result;
	}
}

public class VrfKeyLinkTransactionV1 : ITransaction {
	public const byte TRANSACTION_VERSION = 1;

	public static readonly TransactionType TRANSACTION_TYPE = TransactionType.VRF_KEY_LINK;

	private readonly uint VerifiableEntityHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;

	public VrfKeyLinkTransactionV1(
	    Signature? signature = null,
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    TransactionType? type = null,
	    Amount? fee = null,
	    Timestamp? deadline = null,
	    PublicKey? linkedPublicKey = null,
	    LinkAction? linkAction = null
	) {
		Signature = signature ?? new Signature();
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? VrfKeyLinkTransactionV1.TRANSACTION_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? VrfKeyLinkTransactionV1.TRANSACTION_TYPE;
		Fee = fee ?? new Amount();
		Deadline = deadline ?? new Timestamp();
		LinkedPublicKey = linkedPublicKey ?? new PublicKey();
		LinkAction = linkAction ?? LinkAction.UNLINK;
		VerifiableEntityHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
	}

	public void Sort() {
	}

	public Signature Signature {
		get; set;
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public TransactionType Type {
		get; set;
	}

	public Amount Fee {
		get; set;
	}

	public Timestamp Deadline {
		get; set;
	}

	public PublicKey LinkedPublicKey {
		get; set;
	}

	public LinkAction LinkAction {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += Signature.Size;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += Fee.Size;
			size += Deadline.Size;
			size += LinkedPublicKey.Size;
			size += LinkAction.Size;
			return size;
		}
	}

	public static VrfKeyLinkTransactionV1 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var verifiableEntityHeaderReserved_1 = br.ReadUInt32();
		if (0 != verifiableEntityHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({verifiableEntityHeaderReserved_1})");
		var signature = Signature.Deserialize(br);
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = TransactionType.Deserialize(br);
		var fee = Amount.Deserialize(br);
		var deadline = Timestamp.Deserialize(br);
		var linkedPublicKey = PublicKey.Deserialize(br);
		var linkAction = LinkAction.Deserialize(br);

		var instance = new VrfKeyLinkTransactionV1(
			signature,
			signerPublicKey,
			version,
			network,
			type,
			fee,
			deadline,
			linkedPublicKey,
			linkAction);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(VerifiableEntityHeaderReserved_1)); 
		bw.Write(Signature.Serialize()); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(Fee.Serialize()); 
		bw.Write(Deadline.Serialize()); 
		bw.Write(LinkedPublicKey.Serialize()); 
		bw.Write(LinkAction.Serialize()); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signature: {Signature}, ";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"fee: {Fee}, ";
		result += $"deadline: {Deadline}, ";
		result += $"linkedPublicKey: {LinkedPublicKey}, ";
		result += $"linkAction: {LinkAction}, ";
		result += ")";
		return result;
	}
}

public class EmbeddedVrfKeyLinkTransactionV1 : IBaseTransaction {
	public const byte TRANSACTION_VERSION = 1;

	public static readonly TransactionType TRANSACTION_TYPE = TransactionType.VRF_KEY_LINK;

	private readonly uint EmbeddedTransactionHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;

	public EmbeddedVrfKeyLinkTransactionV1(
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    TransactionType? type = null,
	    PublicKey? linkedPublicKey = null,
	    LinkAction? linkAction = null
	) {
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? EmbeddedVrfKeyLinkTransactionV1.TRANSACTION_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? EmbeddedVrfKeyLinkTransactionV1.TRANSACTION_TYPE;
		LinkedPublicKey = linkedPublicKey ?? new PublicKey();
		LinkAction = linkAction ?? LinkAction.UNLINK;
		EmbeddedTransactionHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
	}

	public void Sort() {
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public TransactionType Type {
		get; set;
	}

	public PublicKey LinkedPublicKey {
		get; set;
	}

	public LinkAction LinkAction {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += LinkedPublicKey.Size;
			size += LinkAction.Size;
			return size;
		}
	}

	public static EmbeddedVrfKeyLinkTransactionV1 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var embeddedTransactionHeaderReserved_1 = br.ReadUInt32();
		if (0 != embeddedTransactionHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({embeddedTransactionHeaderReserved_1})");
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = TransactionType.Deserialize(br);
		var linkedPublicKey = PublicKey.Deserialize(br);
		var linkAction = LinkAction.Deserialize(br);

		var instance = new EmbeddedVrfKeyLinkTransactionV1(
			signerPublicKey,
			version,
			network,
			type,
			linkedPublicKey,
			linkAction);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(EmbeddedTransactionHeaderReserved_1)); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(LinkedPublicKey.Serialize()); 
		bw.Write(LinkAction.Serialize()); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"linkedPublicKey: {LinkedPublicKey}, ";
		result += $"linkAction: {LinkAction}, ";
		result += ")";
		return result;
	}
}

public class HashLockTransactionV1 : ITransaction {
	public const byte TRANSACTION_VERSION = 1;

	public static readonly TransactionType TRANSACTION_TYPE = TransactionType.HASH_LOCK;

	private readonly uint VerifiableEntityHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;

	public HashLockTransactionV1(
	    Signature? signature = null,
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    TransactionType? type = null,
	    Amount? fee = null,
	    Timestamp? deadline = null,
	    UnresolvedMosaic? mosaic = null,
	    BlockDuration? duration = null,
	    Hash256? hash = null
	) {
		Signature = signature ?? new Signature();
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? HashLockTransactionV1.TRANSACTION_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? HashLockTransactionV1.TRANSACTION_TYPE;
		Fee = fee ?? new Amount();
		Deadline = deadline ?? new Timestamp();
		Mosaic = mosaic ?? new UnresolvedMosaic();
		Duration = duration ?? new BlockDuration();
		Hash = hash ?? new Hash256();
		VerifiableEntityHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
	}

	public void Sort() {
		Mosaic.Sort();
	}

	public Signature Signature {
		get; set;
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public TransactionType Type {
		get; set;
	}

	public Amount Fee {
		get; set;
	}

	public Timestamp Deadline {
		get; set;
	}

	public UnresolvedMosaic Mosaic {
		get; set;
	}

	public BlockDuration Duration {
		get; set;
	}

	public Hash256 Hash {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += Signature.Size;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += Fee.Size;
			size += Deadline.Size;
			size += Mosaic.Size;
			size += Duration.Size;
			size += Hash.Size;
			return size;
		}
	}

	public static HashLockTransactionV1 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var verifiableEntityHeaderReserved_1 = br.ReadUInt32();
		if (0 != verifiableEntityHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({verifiableEntityHeaderReserved_1})");
		var signature = Signature.Deserialize(br);
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = TransactionType.Deserialize(br);
		var fee = Amount.Deserialize(br);
		var deadline = Timestamp.Deserialize(br);
		var mosaic = UnresolvedMosaic.Deserialize(br);
		var duration = BlockDuration.Deserialize(br);
		var hash = Hash256.Deserialize(br);

		var instance = new HashLockTransactionV1(
			signature,
			signerPublicKey,
			version,
			network,
			type,
			fee,
			deadline,
			mosaic,
			duration,
			hash);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(VerifiableEntityHeaderReserved_1)); 
		bw.Write(Signature.Serialize()); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(Fee.Serialize()); 
		bw.Write(Deadline.Serialize()); 
		bw.Write(Mosaic.Serialize()); 
		bw.Write(Duration.Serialize()); 
		bw.Write(Hash.Serialize()); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signature: {Signature}, ";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"fee: {Fee}, ";
		result += $"deadline: {Deadline}, ";
		result += $"mosaic: {Mosaic}, ";
		result += $"duration: {Duration}, ";
		result += $"hash: {Hash}, ";
		result += ")";
		return result;
	}
}

public class EmbeddedHashLockTransactionV1 : IBaseTransaction {
	public const byte TRANSACTION_VERSION = 1;

	public static readonly TransactionType TRANSACTION_TYPE = TransactionType.HASH_LOCK;

	private readonly uint EmbeddedTransactionHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;

	public EmbeddedHashLockTransactionV1(
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    TransactionType? type = null,
	    UnresolvedMosaic? mosaic = null,
	    BlockDuration? duration = null,
	    Hash256? hash = null
	) {
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? EmbeddedHashLockTransactionV1.TRANSACTION_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? EmbeddedHashLockTransactionV1.TRANSACTION_TYPE;
		Mosaic = mosaic ?? new UnresolvedMosaic();
		Duration = duration ?? new BlockDuration();
		Hash = hash ?? new Hash256();
		EmbeddedTransactionHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
	}

	public void Sort() {
		Mosaic.Sort();
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public TransactionType Type {
		get; set;
	}

	public UnresolvedMosaic Mosaic {
		get; set;
	}

	public BlockDuration Duration {
		get; set;
	}

	public Hash256 Hash {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += Mosaic.Size;
			size += Duration.Size;
			size += Hash.Size;
			return size;
		}
	}

	public static EmbeddedHashLockTransactionV1 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var embeddedTransactionHeaderReserved_1 = br.ReadUInt32();
		if (0 != embeddedTransactionHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({embeddedTransactionHeaderReserved_1})");
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = TransactionType.Deserialize(br);
		var mosaic = UnresolvedMosaic.Deserialize(br);
		var duration = BlockDuration.Deserialize(br);
		var hash = Hash256.Deserialize(br);

		var instance = new EmbeddedHashLockTransactionV1(
			signerPublicKey,
			version,
			network,
			type,
			mosaic,
			duration,
			hash);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(EmbeddedTransactionHeaderReserved_1)); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(Mosaic.Serialize()); 
		bw.Write(Duration.Serialize()); 
		bw.Write(Hash.Serialize()); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"mosaic: {Mosaic}, ";
		result += $"duration: {Duration}, ";
		result += $"hash: {Hash}, ";
		result += ")";
		return result;
	}
}

public class LockHashAlgorithm : IEnum<byte> {
	public static readonly LockHashAlgorithm SHA3_256 = new LockHashAlgorithm(0);

	public static readonly LockHashAlgorithm HASH_160 = new LockHashAlgorithm(1);

	public static readonly LockHashAlgorithm HASH_256 = new LockHashAlgorithm(2);

	public byte Value { get; }

	public LockHashAlgorithm(byte value = 0) {
		Value = value;
	}

	internal static string ValueToKey(uint value) {
		var values = new uint[]{
			0, 1, 2
		};
		var keys = new []{
			"SHA3_256", "HASH_160", "HASH_256"
		};

		var index = Array.IndexOf(values, value);
		if (-1 == index)
			throw new Exception($"invalid enum value {value}");

		return keys[index];
	}

	internal static LockHashAlgorithm FromValue(uint value) {
		return value switch
		{
			0 => SHA3_256,
			1 => HASH_160,
			2 => HASH_256,
			_ => throw new Exception($"invalid enum value {value}")
		};
	}

	public uint Size {
		get {
			return 1;
		}
	}

	public static LockHashAlgorithm Deserialize(BinaryReader br) {
		return FromValue(br.ReadByte());
	}

	public byte[] Serialize() {
		return new []{Value};
	}

	public override string ToString() {
		return $"LockHashAlgorithm.{ValueToKey(Value)}";
	}
}

public class SecretLockTransactionV1 : ITransaction {
	public const byte TRANSACTION_VERSION = 1;

	public static readonly TransactionType TRANSACTION_TYPE = TransactionType.SECRET_LOCK;

	private readonly uint VerifiableEntityHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;

	public SecretLockTransactionV1(
	    Signature? signature = null,
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    TransactionType? type = null,
	    Amount? fee = null,
	    Timestamp? deadline = null,
	    UnresolvedAddress? recipientAddress = null,
	    Hash256? secret = null,
	    UnresolvedMosaic? mosaic = null,
	    BlockDuration? duration = null,
	    LockHashAlgorithm? hashAlgorithm = null
	) {
		Signature = signature ?? new Signature();
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? SecretLockTransactionV1.TRANSACTION_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? SecretLockTransactionV1.TRANSACTION_TYPE;
		Fee = fee ?? new Amount();
		Deadline = deadline ?? new Timestamp();
		RecipientAddress = recipientAddress ?? new UnresolvedAddress();
		Secret = secret ?? new Hash256();
		Mosaic = mosaic ?? new UnresolvedMosaic();
		Duration = duration ?? new BlockDuration();
		HashAlgorithm = hashAlgorithm ?? LockHashAlgorithm.SHA3_256;
		VerifiableEntityHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
	}

	public void Sort() {
		Mosaic.Sort();
	}

	public Signature Signature {
		get; set;
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public TransactionType Type {
		get; set;
	}

	public Amount Fee {
		get; set;
	}

	public Timestamp Deadline {
		get; set;
	}

	public UnresolvedAddress RecipientAddress {
		get; set;
	}

	public Hash256 Secret {
		get; set;
	}

	public UnresolvedMosaic Mosaic {
		get; set;
	}

	public BlockDuration Duration {
		get; set;
	}

	public LockHashAlgorithm HashAlgorithm {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += Signature.Size;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += Fee.Size;
			size += Deadline.Size;
			size += RecipientAddress.Size;
			size += Secret.Size;
			size += Mosaic.Size;
			size += Duration.Size;
			size += HashAlgorithm.Size;
			return size;
		}
	}

	public static SecretLockTransactionV1 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var verifiableEntityHeaderReserved_1 = br.ReadUInt32();
		if (0 != verifiableEntityHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({verifiableEntityHeaderReserved_1})");
		var signature = Signature.Deserialize(br);
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = TransactionType.Deserialize(br);
		var fee = Amount.Deserialize(br);
		var deadline = Timestamp.Deserialize(br);
		var recipientAddress = UnresolvedAddress.Deserialize(br);
		var secret = Hash256.Deserialize(br);
		var mosaic = UnresolvedMosaic.Deserialize(br);
		var duration = BlockDuration.Deserialize(br);
		var hashAlgorithm = LockHashAlgorithm.Deserialize(br);

		var instance = new SecretLockTransactionV1(
			signature,
			signerPublicKey,
			version,
			network,
			type,
			fee,
			deadline,
			recipientAddress,
			secret,
			mosaic,
			duration,
			hashAlgorithm);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(VerifiableEntityHeaderReserved_1)); 
		bw.Write(Signature.Serialize()); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(Fee.Serialize()); 
		bw.Write(Deadline.Serialize()); 
		bw.Write(RecipientAddress.Serialize()); 
		bw.Write(Secret.Serialize()); 
		bw.Write(Mosaic.Serialize()); 
		bw.Write(Duration.Serialize()); 
		bw.Write(HashAlgorithm.Serialize()); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signature: {Signature}, ";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"fee: {Fee}, ";
		result += $"deadline: {Deadline}, ";
		result += $"recipientAddress: {RecipientAddress}, ";
		result += $"secret: {Secret}, ";
		result += $"mosaic: {Mosaic}, ";
		result += $"duration: {Duration}, ";
		result += $"hashAlgorithm: {HashAlgorithm}, ";
		result += ")";
		return result;
	}
}

public class EmbeddedSecretLockTransactionV1 : IBaseTransaction {
	public const byte TRANSACTION_VERSION = 1;

	public static readonly TransactionType TRANSACTION_TYPE = TransactionType.SECRET_LOCK;

	private readonly uint EmbeddedTransactionHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;

	public EmbeddedSecretLockTransactionV1(
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    TransactionType? type = null,
	    UnresolvedAddress? recipientAddress = null,
	    Hash256? secret = null,
	    UnresolvedMosaic? mosaic = null,
	    BlockDuration? duration = null,
	    LockHashAlgorithm? hashAlgorithm = null
	) {
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? EmbeddedSecretLockTransactionV1.TRANSACTION_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? EmbeddedSecretLockTransactionV1.TRANSACTION_TYPE;
		RecipientAddress = recipientAddress ?? new UnresolvedAddress();
		Secret = secret ?? new Hash256();
		Mosaic = mosaic ?? new UnresolvedMosaic();
		Duration = duration ?? new BlockDuration();
		HashAlgorithm = hashAlgorithm ?? LockHashAlgorithm.SHA3_256;
		EmbeddedTransactionHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
	}

	public void Sort() {
		Mosaic.Sort();
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public TransactionType Type {
		get; set;
	}

	public UnresolvedAddress RecipientAddress {
		get; set;
	}

	public Hash256 Secret {
		get; set;
	}

	public UnresolvedMosaic Mosaic {
		get; set;
	}

	public BlockDuration Duration {
		get; set;
	}

	public LockHashAlgorithm HashAlgorithm {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += RecipientAddress.Size;
			size += Secret.Size;
			size += Mosaic.Size;
			size += Duration.Size;
			size += HashAlgorithm.Size;
			return size;
		}
	}

	public static EmbeddedSecretLockTransactionV1 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var embeddedTransactionHeaderReserved_1 = br.ReadUInt32();
		if (0 != embeddedTransactionHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({embeddedTransactionHeaderReserved_1})");
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = TransactionType.Deserialize(br);
		var recipientAddress = UnresolvedAddress.Deserialize(br);
		var secret = Hash256.Deserialize(br);
		var mosaic = UnresolvedMosaic.Deserialize(br);
		var duration = BlockDuration.Deserialize(br);
		var hashAlgorithm = LockHashAlgorithm.Deserialize(br);

		var instance = new EmbeddedSecretLockTransactionV1(
			signerPublicKey,
			version,
			network,
			type,
			recipientAddress,
			secret,
			mosaic,
			duration,
			hashAlgorithm);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(EmbeddedTransactionHeaderReserved_1)); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(RecipientAddress.Serialize()); 
		bw.Write(Secret.Serialize()); 
		bw.Write(Mosaic.Serialize()); 
		bw.Write(Duration.Serialize()); 
		bw.Write(HashAlgorithm.Serialize()); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"recipientAddress: {RecipientAddress}, ";
		result += $"secret: {Secret}, ";
		result += $"mosaic: {Mosaic}, ";
		result += $"duration: {Duration}, ";
		result += $"hashAlgorithm: {HashAlgorithm}, ";
		result += ")";
		return result;
	}
}

public class SecretProofTransactionV1 : ITransaction {
	public const byte TRANSACTION_VERSION = 1;

	public static readonly TransactionType TRANSACTION_TYPE = TransactionType.SECRET_PROOF;

	private readonly uint VerifiableEntityHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;

	public SecretProofTransactionV1(
	    Signature? signature = null,
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    TransactionType? type = null,
	    Amount? fee = null,
	    Timestamp? deadline = null,
	    UnresolvedAddress? recipientAddress = null,
	    Hash256? secret = null,
	    LockHashAlgorithm? hashAlgorithm = null,
	    byte[]? proof = null
	) {
		Signature = signature ?? new Signature();
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? SecretProofTransactionV1.TRANSACTION_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? SecretProofTransactionV1.TRANSACTION_TYPE;
		Fee = fee ?? new Amount();
		Deadline = deadline ?? new Timestamp();
		RecipientAddress = recipientAddress ?? new UnresolvedAddress();
		Secret = secret ?? new Hash256();
		HashAlgorithm = hashAlgorithm ?? LockHashAlgorithm.SHA3_256;
		Proof = proof ?? Array.Empty<byte>();
		VerifiableEntityHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
	}

	public void Sort() {
	}

	public Signature Signature {
		get; set;
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public TransactionType Type {
		get; set;
	}

	public Amount Fee {
		get; set;
	}

	public Timestamp Deadline {
		get; set;
	}

	public UnresolvedAddress RecipientAddress {
		get; set;
	}

	public Hash256 Secret {
		get; set;
	}

	public LockHashAlgorithm HashAlgorithm {
		get; set;
	}

	public byte[] Proof {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += Signature.Size;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += Fee.Size;
			size += Deadline.Size;
			size += RecipientAddress.Size;
			size += Secret.Size;
			size += 2;
			size += HashAlgorithm.Size;
			size += (uint)Proof.Length;
			return size;
		}
	}

	public static SecretProofTransactionV1 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var verifiableEntityHeaderReserved_1 = br.ReadUInt32();
		if (0 != verifiableEntityHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({verifiableEntityHeaderReserved_1})");
		var signature = Signature.Deserialize(br);
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = TransactionType.Deserialize(br);
		var fee = Amount.Deserialize(br);
		var deadline = Timestamp.Deserialize(br);
		var recipientAddress = UnresolvedAddress.Deserialize(br);
		var secret = Hash256.Deserialize(br);
		var proofSize = br.ReadUInt16();
		var hashAlgorithm = LockHashAlgorithm.Deserialize(br);
		var proof = br.ReadBytes((int)proofSize);

		var instance = new SecretProofTransactionV1(
			signature,
			signerPublicKey,
			version,
			network,
			type,
			fee,
			deadline,
			recipientAddress,
			secret,
			hashAlgorithm,
			proof);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(VerifiableEntityHeaderReserved_1)); 
		bw.Write(Signature.Serialize()); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(Fee.Serialize()); 
		bw.Write(Deadline.Serialize()); 
		bw.Write(RecipientAddress.Serialize()); 
		bw.Write(Secret.Serialize()); 
		bw.Write(BitConverter.GetBytes((ushort)Proof.Length));  // bound: proof_size
		bw.Write(HashAlgorithm.Serialize()); 
		bw.Write(Proof); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signature: {Signature}, ";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"fee: {Fee}, ";
		result += $"deadline: {Deadline}, ";
		result += $"recipientAddress: {RecipientAddress}, ";
		result += $"secret: {Secret}, ";
		result += $"hashAlgorithm: {HashAlgorithm}, ";
		result += $"proof: hex({Converter.BytesToHex(Proof)}), ";
		result += ")";
		return result;
	}
}

public class EmbeddedSecretProofTransactionV1 : IBaseTransaction {
	public const byte TRANSACTION_VERSION = 1;

	public static readonly TransactionType TRANSACTION_TYPE = TransactionType.SECRET_PROOF;

	private readonly uint EmbeddedTransactionHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;

	public EmbeddedSecretProofTransactionV1(
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    TransactionType? type = null,
	    UnresolvedAddress? recipientAddress = null,
	    Hash256? secret = null,
	    LockHashAlgorithm? hashAlgorithm = null,
	    byte[]? proof = null
	) {
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? EmbeddedSecretProofTransactionV1.TRANSACTION_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? EmbeddedSecretProofTransactionV1.TRANSACTION_TYPE;
		RecipientAddress = recipientAddress ?? new UnresolvedAddress();
		Secret = secret ?? new Hash256();
		HashAlgorithm = hashAlgorithm ?? LockHashAlgorithm.SHA3_256;
		Proof = proof ?? Array.Empty<byte>();
		EmbeddedTransactionHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
	}

	public void Sort() {
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public TransactionType Type {
		get; set;
	}

	public UnresolvedAddress RecipientAddress {
		get; set;
	}

	public Hash256 Secret {
		get; set;
	}

	public LockHashAlgorithm HashAlgorithm {
		get; set;
	}

	public byte[] Proof {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += RecipientAddress.Size;
			size += Secret.Size;
			size += 2;
			size += HashAlgorithm.Size;
			size += (uint)Proof.Length;
			return size;
		}
	}

	public static EmbeddedSecretProofTransactionV1 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var embeddedTransactionHeaderReserved_1 = br.ReadUInt32();
		if (0 != embeddedTransactionHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({embeddedTransactionHeaderReserved_1})");
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = TransactionType.Deserialize(br);
		var recipientAddress = UnresolvedAddress.Deserialize(br);
		var secret = Hash256.Deserialize(br);
		var proofSize = br.ReadUInt16();
		var hashAlgorithm = LockHashAlgorithm.Deserialize(br);
		var proof = br.ReadBytes((int)proofSize);

		var instance = new EmbeddedSecretProofTransactionV1(
			signerPublicKey,
			version,
			network,
			type,
			recipientAddress,
			secret,
			hashAlgorithm,
			proof);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(EmbeddedTransactionHeaderReserved_1)); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(RecipientAddress.Serialize()); 
		bw.Write(Secret.Serialize()); 
		bw.Write(BitConverter.GetBytes((ushort)Proof.Length));  // bound: proof_size
		bw.Write(HashAlgorithm.Serialize()); 
		bw.Write(Proof); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"recipientAddress: {RecipientAddress}, ";
		result += $"secret: {Secret}, ";
		result += $"hashAlgorithm: {HashAlgorithm}, ";
		result += $"proof: hex({Converter.BytesToHex(Proof)}), ";
		result += ")";
		return result;
	}
}

public class AccountMetadataTransactionV1 : ITransaction {
	public const byte TRANSACTION_VERSION = 1;

	public static readonly TransactionType TRANSACTION_TYPE = TransactionType.ACCOUNT_METADATA;

	private readonly uint VerifiableEntityHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;

	public AccountMetadataTransactionV1(
	    Signature? signature = null,
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    TransactionType? type = null,
	    Amount? fee = null,
	    Timestamp? deadline = null,
	    UnresolvedAddress? targetAddress = null,
	    ulong? scopedMetadataKey = null,
	    ushort? valueSizeDelta = null,
	    byte[]? value = null
	) {
		Signature = signature ?? new Signature();
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? AccountMetadataTransactionV1.TRANSACTION_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? AccountMetadataTransactionV1.TRANSACTION_TYPE;
		Fee = fee ?? new Amount();
		Deadline = deadline ?? new Timestamp();
		TargetAddress = targetAddress ?? new UnresolvedAddress();
		ScopedMetadataKey = scopedMetadataKey ?? 0;
		ValueSizeDelta = valueSizeDelta ?? 0;
		Value = value ?? Array.Empty<byte>();
		VerifiableEntityHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
	}

	public void Sort() {
	}

	public Signature Signature {
		get; set;
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public TransactionType Type {
		get; set;
	}

	public Amount Fee {
		get; set;
	}

	public Timestamp Deadline {
		get; set;
	}

	public UnresolvedAddress TargetAddress {
		get; set;
	}

	public ulong ScopedMetadataKey {
		get; set;
	}

	public ushort ValueSizeDelta {
		get; set;
	}

	public byte[] Value {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += Signature.Size;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += Fee.Size;
			size += Deadline.Size;
			size += TargetAddress.Size;
			size += 8;
			size += 2;
			size += 2;
			size += (uint)Value.Length;
			return size;
		}
	}

	public static AccountMetadataTransactionV1 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var verifiableEntityHeaderReserved_1 = br.ReadUInt32();
		if (0 != verifiableEntityHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({verifiableEntityHeaderReserved_1})");
		var signature = Signature.Deserialize(br);
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = TransactionType.Deserialize(br);
		var fee = Amount.Deserialize(br);
		var deadline = Timestamp.Deserialize(br);
		var targetAddress = UnresolvedAddress.Deserialize(br);
		var scopedMetadataKey = br.ReadUInt64();
		var valueSizeDelta = br.ReadUInt16();
		var valueSize = br.ReadUInt16();
		var value = br.ReadBytes((int)valueSize);

		var instance = new AccountMetadataTransactionV1(
			signature,
			signerPublicKey,
			version,
			network,
			type,
			fee,
			deadline,
			targetAddress,
			scopedMetadataKey,
			valueSizeDelta,
			value);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(VerifiableEntityHeaderReserved_1)); 
		bw.Write(Signature.Serialize()); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(Fee.Serialize()); 
		bw.Write(Deadline.Serialize()); 
		bw.Write(TargetAddress.Serialize()); 
		bw.Write(BitConverter.GetBytes(ScopedMetadataKey)); 
		bw.Write(BitConverter.GetBytes(ValueSizeDelta)); 
		bw.Write(BitConverter.GetBytes((ushort)Value.Length));  // bound: value_size
		bw.Write(Value); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signature: {Signature}, ";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"fee: {Fee}, ";
		result += $"deadline: {Deadline}, ";
		result += $"targetAddress: {TargetAddress}, ";
		result += $"scopedMetadataKey: {Converter.ToString(ScopedMetadataKey)}, ";
		result += $"valueSizeDelta: {Converter.ToString(ValueSizeDelta)}, ";
		result += $"value: hex({Converter.BytesToHex(Value)}), ";
		result += ")";
		return result;
	}
}

public class EmbeddedAccountMetadataTransactionV1 : IBaseTransaction {
	public const byte TRANSACTION_VERSION = 1;

	public static readonly TransactionType TRANSACTION_TYPE = TransactionType.ACCOUNT_METADATA;

	private readonly uint EmbeddedTransactionHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;

	public EmbeddedAccountMetadataTransactionV1(
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    TransactionType? type = null,
	    UnresolvedAddress? targetAddress = null,
	    ulong? scopedMetadataKey = null,
	    ushort? valueSizeDelta = null,
	    byte[]? value = null
	) {
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? EmbeddedAccountMetadataTransactionV1.TRANSACTION_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? EmbeddedAccountMetadataTransactionV1.TRANSACTION_TYPE;
		TargetAddress = targetAddress ?? new UnresolvedAddress();
		ScopedMetadataKey = scopedMetadataKey ?? 0;
		ValueSizeDelta = valueSizeDelta ?? 0;
		Value = value ?? Array.Empty<byte>();
		EmbeddedTransactionHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
	}

	public void Sort() {
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public TransactionType Type {
		get; set;
	}

	public UnresolvedAddress TargetAddress {
		get; set;
	}

	public ulong ScopedMetadataKey {
		get; set;
	}

	public ushort ValueSizeDelta {
		get; set;
	}

	public byte[] Value {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += TargetAddress.Size;
			size += 8;
			size += 2;
			size += 2;
			size += (uint)Value.Length;
			return size;
		}
	}

	public static EmbeddedAccountMetadataTransactionV1 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var embeddedTransactionHeaderReserved_1 = br.ReadUInt32();
		if (0 != embeddedTransactionHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({embeddedTransactionHeaderReserved_1})");
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = TransactionType.Deserialize(br);
		var targetAddress = UnresolvedAddress.Deserialize(br);
		var scopedMetadataKey = br.ReadUInt64();
		var valueSizeDelta = br.ReadUInt16();
		var valueSize = br.ReadUInt16();
		var value = br.ReadBytes((int)valueSize);

		var instance = new EmbeddedAccountMetadataTransactionV1(
			signerPublicKey,
			version,
			network,
			type,
			targetAddress,
			scopedMetadataKey,
			valueSizeDelta,
			value);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(EmbeddedTransactionHeaderReserved_1)); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(TargetAddress.Serialize()); 
		bw.Write(BitConverter.GetBytes(ScopedMetadataKey)); 
		bw.Write(BitConverter.GetBytes(ValueSizeDelta)); 
		bw.Write(BitConverter.GetBytes((ushort)Value.Length));  // bound: value_size
		bw.Write(Value); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"targetAddress: {TargetAddress}, ";
		result += $"scopedMetadataKey: {Converter.ToString(ScopedMetadataKey)}, ";
		result += $"valueSizeDelta: {Converter.ToString(ValueSizeDelta)}, ";
		result += $"value: hex({Converter.BytesToHex(Value)}), ";
		result += ")";
		return result;
	}
}

public class MosaicMetadataTransactionV1 : ITransaction {
	public const byte TRANSACTION_VERSION = 1;

	public static readonly TransactionType TRANSACTION_TYPE = TransactionType.MOSAIC_METADATA;

	private readonly uint VerifiableEntityHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;

	public MosaicMetadataTransactionV1(
	    Signature? signature = null,
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    TransactionType? type = null,
	    Amount? fee = null,
	    Timestamp? deadline = null,
	    UnresolvedAddress? targetAddress = null,
	    ulong? scopedMetadataKey = null,
	    UnresolvedMosaicId? targetMosaicId = null,
	    ushort? valueSizeDelta = null,
	    byte[]? value = null
	) {
		Signature = signature ?? new Signature();
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? MosaicMetadataTransactionV1.TRANSACTION_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? MosaicMetadataTransactionV1.TRANSACTION_TYPE;
		Fee = fee ?? new Amount();
		Deadline = deadline ?? new Timestamp();
		TargetAddress = targetAddress ?? new UnresolvedAddress();
		ScopedMetadataKey = scopedMetadataKey ?? 0;
		TargetMosaicId = targetMosaicId ?? new UnresolvedMosaicId();
		ValueSizeDelta = valueSizeDelta ?? 0;
		Value = value ?? Array.Empty<byte>();
		VerifiableEntityHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
	}

	public void Sort() {
	}

	public Signature Signature {
		get; set;
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public TransactionType Type {
		get; set;
	}

	public Amount Fee {
		get; set;
	}

	public Timestamp Deadline {
		get; set;
	}

	public UnresolvedAddress TargetAddress {
		get; set;
	}

	public ulong ScopedMetadataKey {
		get; set;
	}

	public UnresolvedMosaicId TargetMosaicId {
		get; set;
	}

	public ushort ValueSizeDelta {
		get; set;
	}

	public byte[] Value {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += Signature.Size;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += Fee.Size;
			size += Deadline.Size;
			size += TargetAddress.Size;
			size += 8;
			size += TargetMosaicId.Size;
			size += 2;
			size += 2;
			size += (uint)Value.Length;
			return size;
		}
	}

	public static MosaicMetadataTransactionV1 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var verifiableEntityHeaderReserved_1 = br.ReadUInt32();
		if (0 != verifiableEntityHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({verifiableEntityHeaderReserved_1})");
		var signature = Signature.Deserialize(br);
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = TransactionType.Deserialize(br);
		var fee = Amount.Deserialize(br);
		var deadline = Timestamp.Deserialize(br);
		var targetAddress = UnresolvedAddress.Deserialize(br);
		var scopedMetadataKey = br.ReadUInt64();
		var targetMosaicId = UnresolvedMosaicId.Deserialize(br);
		var valueSizeDelta = br.ReadUInt16();
		var valueSize = br.ReadUInt16();
		var value = br.ReadBytes((int)valueSize);

		var instance = new MosaicMetadataTransactionV1(
			signature,
			signerPublicKey,
			version,
			network,
			type,
			fee,
			deadline,
			targetAddress,
			scopedMetadataKey,
			targetMosaicId,
			valueSizeDelta,
			value);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(VerifiableEntityHeaderReserved_1)); 
		bw.Write(Signature.Serialize()); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(Fee.Serialize()); 
		bw.Write(Deadline.Serialize()); 
		bw.Write(TargetAddress.Serialize()); 
		bw.Write(BitConverter.GetBytes(ScopedMetadataKey)); 
		bw.Write(TargetMosaicId.Serialize()); 
		bw.Write(BitConverter.GetBytes(ValueSizeDelta)); 
		bw.Write(BitConverter.GetBytes((ushort)Value.Length));  // bound: value_size
		bw.Write(Value); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signature: {Signature}, ";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"fee: {Fee}, ";
		result += $"deadline: {Deadline}, ";
		result += $"targetAddress: {TargetAddress}, ";
		result += $"scopedMetadataKey: {Converter.ToString(ScopedMetadataKey)}, ";
		result += $"targetMosaicId: {TargetMosaicId}, ";
		result += $"valueSizeDelta: {Converter.ToString(ValueSizeDelta)}, ";
		result += $"value: hex({Converter.BytesToHex(Value)}), ";
		result += ")";
		return result;
	}
}

public class EmbeddedMosaicMetadataTransactionV1 : IBaseTransaction {
	public const byte TRANSACTION_VERSION = 1;

	public static readonly TransactionType TRANSACTION_TYPE = TransactionType.MOSAIC_METADATA;

	private readonly uint EmbeddedTransactionHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;

	public EmbeddedMosaicMetadataTransactionV1(
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    TransactionType? type = null,
	    UnresolvedAddress? targetAddress = null,
	    ulong? scopedMetadataKey = null,
	    UnresolvedMosaicId? targetMosaicId = null,
	    ushort? valueSizeDelta = null,
	    byte[]? value = null
	) {
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? EmbeddedMosaicMetadataTransactionV1.TRANSACTION_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? EmbeddedMosaicMetadataTransactionV1.TRANSACTION_TYPE;
		TargetAddress = targetAddress ?? new UnresolvedAddress();
		ScopedMetadataKey = scopedMetadataKey ?? 0;
		TargetMosaicId = targetMosaicId ?? new UnresolvedMosaicId();
		ValueSizeDelta = valueSizeDelta ?? 0;
		Value = value ?? Array.Empty<byte>();
		EmbeddedTransactionHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
	}

	public void Sort() {
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public TransactionType Type {
		get; set;
	}

	public UnresolvedAddress TargetAddress {
		get; set;
	}

	public ulong ScopedMetadataKey {
		get; set;
	}

	public UnresolvedMosaicId TargetMosaicId {
		get; set;
	}

	public ushort ValueSizeDelta {
		get; set;
	}

	public byte[] Value {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += TargetAddress.Size;
			size += 8;
			size += TargetMosaicId.Size;
			size += 2;
			size += 2;
			size += (uint)Value.Length;
			return size;
		}
	}

	public static EmbeddedMosaicMetadataTransactionV1 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var embeddedTransactionHeaderReserved_1 = br.ReadUInt32();
		if (0 != embeddedTransactionHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({embeddedTransactionHeaderReserved_1})");
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = TransactionType.Deserialize(br);
		var targetAddress = UnresolvedAddress.Deserialize(br);
		var scopedMetadataKey = br.ReadUInt64();
		var targetMosaicId = UnresolvedMosaicId.Deserialize(br);
		var valueSizeDelta = br.ReadUInt16();
		var valueSize = br.ReadUInt16();
		var value = br.ReadBytes((int)valueSize);

		var instance = new EmbeddedMosaicMetadataTransactionV1(
			signerPublicKey,
			version,
			network,
			type,
			targetAddress,
			scopedMetadataKey,
			targetMosaicId,
			valueSizeDelta,
			value);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(EmbeddedTransactionHeaderReserved_1)); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(TargetAddress.Serialize()); 
		bw.Write(BitConverter.GetBytes(ScopedMetadataKey)); 
		bw.Write(TargetMosaicId.Serialize()); 
		bw.Write(BitConverter.GetBytes(ValueSizeDelta)); 
		bw.Write(BitConverter.GetBytes((ushort)Value.Length));  // bound: value_size
		bw.Write(Value); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"targetAddress: {TargetAddress}, ";
		result += $"scopedMetadataKey: {Converter.ToString(ScopedMetadataKey)}, ";
		result += $"targetMosaicId: {TargetMosaicId}, ";
		result += $"valueSizeDelta: {Converter.ToString(ValueSizeDelta)}, ";
		result += $"value: hex({Converter.BytesToHex(Value)}), ";
		result += ")";
		return result;
	}
}

public class NamespaceMetadataTransactionV1 : ITransaction {
	public const byte TRANSACTION_VERSION = 1;

	public static readonly TransactionType TRANSACTION_TYPE = TransactionType.NAMESPACE_METADATA;

	private readonly uint VerifiableEntityHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;

	public NamespaceMetadataTransactionV1(
	    Signature? signature = null,
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    TransactionType? type = null,
	    Amount? fee = null,
	    Timestamp? deadline = null,
	    UnresolvedAddress? targetAddress = null,
	    ulong? scopedMetadataKey = null,
	    NamespaceId? targetNamespaceId = null,
	    ushort? valueSizeDelta = null,
	    byte[]? value = null
	) {
		Signature = signature ?? new Signature();
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? NamespaceMetadataTransactionV1.TRANSACTION_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? NamespaceMetadataTransactionV1.TRANSACTION_TYPE;
		Fee = fee ?? new Amount();
		Deadline = deadline ?? new Timestamp();
		TargetAddress = targetAddress ?? new UnresolvedAddress();
		ScopedMetadataKey = scopedMetadataKey ?? 0;
		TargetNamespaceId = targetNamespaceId ?? new NamespaceId();
		ValueSizeDelta = valueSizeDelta ?? 0;
		Value = value ?? Array.Empty<byte>();
		VerifiableEntityHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
	}

	public void Sort() {
	}

	public Signature Signature {
		get; set;
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public TransactionType Type {
		get; set;
	}

	public Amount Fee {
		get; set;
	}

	public Timestamp Deadline {
		get; set;
	}

	public UnresolvedAddress TargetAddress {
		get; set;
	}

	public ulong ScopedMetadataKey {
		get; set;
	}

	public NamespaceId TargetNamespaceId {
		get; set;
	}

	public ushort ValueSizeDelta {
		get; set;
	}

	public byte[] Value {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += Signature.Size;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += Fee.Size;
			size += Deadline.Size;
			size += TargetAddress.Size;
			size += 8;
			size += TargetNamespaceId.Size;
			size += 2;
			size += 2;
			size += (uint)Value.Length;
			return size;
		}
	}

	public static NamespaceMetadataTransactionV1 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var verifiableEntityHeaderReserved_1 = br.ReadUInt32();
		if (0 != verifiableEntityHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({verifiableEntityHeaderReserved_1})");
		var signature = Signature.Deserialize(br);
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = TransactionType.Deserialize(br);
		var fee = Amount.Deserialize(br);
		var deadline = Timestamp.Deserialize(br);
		var targetAddress = UnresolvedAddress.Deserialize(br);
		var scopedMetadataKey = br.ReadUInt64();
		var targetNamespaceId = NamespaceId.Deserialize(br);
		var valueSizeDelta = br.ReadUInt16();
		var valueSize = br.ReadUInt16();
		var value = br.ReadBytes((int)valueSize);

		var instance = new NamespaceMetadataTransactionV1(
			signature,
			signerPublicKey,
			version,
			network,
			type,
			fee,
			deadline,
			targetAddress,
			scopedMetadataKey,
			targetNamespaceId,
			valueSizeDelta,
			value);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(VerifiableEntityHeaderReserved_1)); 
		bw.Write(Signature.Serialize()); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(Fee.Serialize()); 
		bw.Write(Deadline.Serialize()); 
		bw.Write(TargetAddress.Serialize()); 
		bw.Write(BitConverter.GetBytes(ScopedMetadataKey)); 
		bw.Write(TargetNamespaceId.Serialize()); 
		bw.Write(BitConverter.GetBytes(ValueSizeDelta)); 
		bw.Write(BitConverter.GetBytes((ushort)Value.Length));  // bound: value_size
		bw.Write(Value); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signature: {Signature}, ";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"fee: {Fee}, ";
		result += $"deadline: {Deadline}, ";
		result += $"targetAddress: {TargetAddress}, ";
		result += $"scopedMetadataKey: {Converter.ToString(ScopedMetadataKey)}, ";
		result += $"targetNamespaceId: {TargetNamespaceId}, ";
		result += $"valueSizeDelta: {Converter.ToString(ValueSizeDelta)}, ";
		result += $"value: hex({Converter.BytesToHex(Value)}), ";
		result += ")";
		return result;
	}
}

public class EmbeddedNamespaceMetadataTransactionV1 : IBaseTransaction {
	public const byte TRANSACTION_VERSION = 1;

	public static readonly TransactionType TRANSACTION_TYPE = TransactionType.NAMESPACE_METADATA;

	private readonly uint EmbeddedTransactionHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;

	public EmbeddedNamespaceMetadataTransactionV1(
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    TransactionType? type = null,
	    UnresolvedAddress? targetAddress = null,
	    ulong? scopedMetadataKey = null,
	    NamespaceId? targetNamespaceId = null,
	    ushort? valueSizeDelta = null,
	    byte[]? value = null
	) {
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? EmbeddedNamespaceMetadataTransactionV1.TRANSACTION_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? EmbeddedNamespaceMetadataTransactionV1.TRANSACTION_TYPE;
		TargetAddress = targetAddress ?? new UnresolvedAddress();
		ScopedMetadataKey = scopedMetadataKey ?? 0;
		TargetNamespaceId = targetNamespaceId ?? new NamespaceId();
		ValueSizeDelta = valueSizeDelta ?? 0;
		Value = value ?? Array.Empty<byte>();
		EmbeddedTransactionHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
	}

	public void Sort() {
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public TransactionType Type {
		get; set;
	}

	public UnresolvedAddress TargetAddress {
		get; set;
	}

	public ulong ScopedMetadataKey {
		get; set;
	}

	public NamespaceId TargetNamespaceId {
		get; set;
	}

	public ushort ValueSizeDelta {
		get; set;
	}

	public byte[] Value {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += TargetAddress.Size;
			size += 8;
			size += TargetNamespaceId.Size;
			size += 2;
			size += 2;
			size += (uint)Value.Length;
			return size;
		}
	}

	public static EmbeddedNamespaceMetadataTransactionV1 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var embeddedTransactionHeaderReserved_1 = br.ReadUInt32();
		if (0 != embeddedTransactionHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({embeddedTransactionHeaderReserved_1})");
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = TransactionType.Deserialize(br);
		var targetAddress = UnresolvedAddress.Deserialize(br);
		var scopedMetadataKey = br.ReadUInt64();
		var targetNamespaceId = NamespaceId.Deserialize(br);
		var valueSizeDelta = br.ReadUInt16();
		var valueSize = br.ReadUInt16();
		var value = br.ReadBytes((int)valueSize);

		var instance = new EmbeddedNamespaceMetadataTransactionV1(
			signerPublicKey,
			version,
			network,
			type,
			targetAddress,
			scopedMetadataKey,
			targetNamespaceId,
			valueSizeDelta,
			value);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(EmbeddedTransactionHeaderReserved_1)); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(TargetAddress.Serialize()); 
		bw.Write(BitConverter.GetBytes(ScopedMetadataKey)); 
		bw.Write(TargetNamespaceId.Serialize()); 
		bw.Write(BitConverter.GetBytes(ValueSizeDelta)); 
		bw.Write(BitConverter.GetBytes((ushort)Value.Length));  // bound: value_size
		bw.Write(Value); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"targetAddress: {TargetAddress}, ";
		result += $"scopedMetadataKey: {Converter.ToString(ScopedMetadataKey)}, ";
		result += $"targetNamespaceId: {TargetNamespaceId}, ";
		result += $"valueSizeDelta: {Converter.ToString(ValueSizeDelta)}, ";
		result += $"value: hex({Converter.BytesToHex(Value)}), ";
		result += ")";
		return result;
	}
}

public class MosaicNonce : BaseValue, ISerializer {
	public const byte SIZE = 4;

	public MosaicNonce(object? mosaicNonce = null): base(SIZE, mosaicNonce) {
	}

	public static MosaicNonce Deserialize(BinaryReader br) {
		return new MosaicNonce(br.ReadUInt32());
	}

	public byte[] Serialize() {
		return BitConverter.GetBytes((uint)Value);
	}
}

public class MosaicFlags : IEnum<byte> {
	public static readonly MosaicFlags NONE = new MosaicFlags(0);

	public static readonly MosaicFlags SUPPLY_MUTABLE = new MosaicFlags(1);

	public static readonly MosaicFlags TRANSFERABLE = new MosaicFlags(2);

	public static readonly MosaicFlags RESTRICTABLE = new MosaicFlags(4);

	public static readonly MosaicFlags REVOKABLE = new MosaicFlags(8);

	public byte Value { get; }

	public MosaicFlags(byte value = 0) {
		Value = value;
	}

	public bool Has(uint flag) {
		return 0 != (Value & flag);
	}

	public uint Size {
		get {
			return 1;
		}
	}

	public static MosaicFlags Deserialize(BinaryReader br) {
		return new MosaicFlags(br.ReadByte());
	}

	public byte[] Serialize() {
		return new []{Value};
	}

	public override string ToString() {
		var values = new uint[]{
			0, 1, 2, 4, 8
		};
		var keys = new []{
			"NONE", "SUPPLY_MUTABLE", "TRANSFERABLE", "RESTRICTABLE", "REVOKABLE"
		};

		if (0 == Value) {
			var index = Array.IndexOf(values, Value);
			return $"MosaicFlags.{keys[index]}";
		}

		var positions = values.ToList().Select((flag, i) => new {flag, Index = i}).Where(flag => (Value & flag.flag) != 0).ToList();
		return string.Join("|", positions.Select(n => $"MosaicFlags.{keys[n.Index]}"));
	}
}

public class MosaicSupplyChangeAction : IEnum<byte> {
	public static readonly MosaicSupplyChangeAction DECREASE = new MosaicSupplyChangeAction(0);

	public static readonly MosaicSupplyChangeAction INCREASE = new MosaicSupplyChangeAction(1);

	public byte Value { get; }

	public MosaicSupplyChangeAction(byte value = 0) {
		Value = value;
	}

	internal static string ValueToKey(uint value) {
		var values = new uint[]{
			0, 1
		};
		var keys = new []{
			"DECREASE", "INCREASE"
		};

		var index = Array.IndexOf(values, value);
		if (-1 == index)
			throw new Exception($"invalid enum value {value}");

		return keys[index];
	}

	internal static MosaicSupplyChangeAction FromValue(uint value) {
		return value switch
		{
			0 => DECREASE,
			1 => INCREASE,
			_ => throw new Exception($"invalid enum value {value}")
		};
	}

	public uint Size {
		get {
			return 1;
		}
	}

	public static MosaicSupplyChangeAction Deserialize(BinaryReader br) {
		return FromValue(br.ReadByte());
	}

	public byte[] Serialize() {
		return new []{Value};
	}

	public override string ToString() {
		return $"MosaicSupplyChangeAction.{ValueToKey(Value)}";
	}
}

public class MosaicDefinitionTransactionV1 : ITransaction {
	public const byte TRANSACTION_VERSION = 1;

	public static readonly TransactionType TRANSACTION_TYPE = TransactionType.MOSAIC_DEFINITION;

	private readonly uint VerifiableEntityHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;

	public MosaicDefinitionTransactionV1(
	    Signature? signature = null,
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    TransactionType? type = null,
	    Amount? fee = null,
	    Timestamp? deadline = null,
	    MosaicId? id = null,
	    BlockDuration? duration = null,
	    MosaicNonce? nonce = null,
	    MosaicFlags? flags = null,
	    byte? divisibility = null
	) {
		Signature = signature ?? new Signature();
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? MosaicDefinitionTransactionV1.TRANSACTION_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? MosaicDefinitionTransactionV1.TRANSACTION_TYPE;
		Fee = fee ?? new Amount();
		Deadline = deadline ?? new Timestamp();
		Id = id ?? new MosaicId();
		Duration = duration ?? new BlockDuration();
		Nonce = nonce ?? new MosaicNonce();
		Flags = flags ?? MosaicFlags.NONE;
		Divisibility = divisibility ?? 0;
		VerifiableEntityHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
	}

	public void Sort() {
	}

	public Signature Signature {
		get; set;
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public TransactionType Type {
		get; set;
	}

	public Amount Fee {
		get; set;
	}

	public Timestamp Deadline {
		get; set;
	}

	public MosaicId Id {
		get; set;
	}

	public BlockDuration Duration {
		get; set;
	}

	public MosaicNonce Nonce {
		get; set;
	}

	public MosaicFlags Flags {
		get; set;
	}

	public byte Divisibility {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += Signature.Size;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += Fee.Size;
			size += Deadline.Size;
			size += Id.Size;
			size += Duration.Size;
			size += Nonce.Size;
			size += Flags.Size;
			size += 1;
			return size;
		}
	}

	public static MosaicDefinitionTransactionV1 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var verifiableEntityHeaderReserved_1 = br.ReadUInt32();
		if (0 != verifiableEntityHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({verifiableEntityHeaderReserved_1})");
		var signature = Signature.Deserialize(br);
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = TransactionType.Deserialize(br);
		var fee = Amount.Deserialize(br);
		var deadline = Timestamp.Deserialize(br);
		var id = MosaicId.Deserialize(br);
		var duration = BlockDuration.Deserialize(br);
		var nonce = MosaicNonce.Deserialize(br);
		var flags = MosaicFlags.Deserialize(br);
		var divisibility = br.ReadByte();

		var instance = new MosaicDefinitionTransactionV1(
			signature,
			signerPublicKey,
			version,
			network,
			type,
			fee,
			deadline,
			id,
			duration,
			nonce,
			flags,
			divisibility);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(VerifiableEntityHeaderReserved_1)); 
		bw.Write(Signature.Serialize()); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(Fee.Serialize()); 
		bw.Write(Deadline.Serialize()); 
		bw.Write(Id.Serialize()); 
		bw.Write(Duration.Serialize()); 
		bw.Write(Nonce.Serialize()); 
		bw.Write(Flags.Serialize()); 
		bw.Write(Divisibility); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signature: {Signature}, ";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"fee: {Fee}, ";
		result += $"deadline: {Deadline}, ";
		result += $"id: {Id}, ";
		result += $"duration: {Duration}, ";
		result += $"nonce: {Nonce}, ";
		result += $"flags: {Flags}, ";
		result += $"divisibility: {Converter.ToString(Divisibility)}, ";
		result += ")";
		return result;
	}
}

public class EmbeddedMosaicDefinitionTransactionV1 : IBaseTransaction {
	public const byte TRANSACTION_VERSION = 1;

	public static readonly TransactionType TRANSACTION_TYPE = TransactionType.MOSAIC_DEFINITION;

	private readonly uint EmbeddedTransactionHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;

	public EmbeddedMosaicDefinitionTransactionV1(
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    TransactionType? type = null,
	    MosaicId? id = null,
	    BlockDuration? duration = null,
	    MosaicNonce? nonce = null,
	    MosaicFlags? flags = null,
	    byte? divisibility = null
	) {
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? EmbeddedMosaicDefinitionTransactionV1.TRANSACTION_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? EmbeddedMosaicDefinitionTransactionV1.TRANSACTION_TYPE;
		Id = id ?? new MosaicId();
		Duration = duration ?? new BlockDuration();
		Nonce = nonce ?? new MosaicNonce();
		Flags = flags ?? MosaicFlags.NONE;
		Divisibility = divisibility ?? 0;
		EmbeddedTransactionHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
	}

	public void Sort() {
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public TransactionType Type {
		get; set;
	}

	public MosaicId Id {
		get; set;
	}

	public BlockDuration Duration {
		get; set;
	}

	public MosaicNonce Nonce {
		get; set;
	}

	public MosaicFlags Flags {
		get; set;
	}

	public byte Divisibility {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += Id.Size;
			size += Duration.Size;
			size += Nonce.Size;
			size += Flags.Size;
			size += 1;
			return size;
		}
	}

	public static EmbeddedMosaicDefinitionTransactionV1 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var embeddedTransactionHeaderReserved_1 = br.ReadUInt32();
		if (0 != embeddedTransactionHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({embeddedTransactionHeaderReserved_1})");
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = TransactionType.Deserialize(br);
		var id = MosaicId.Deserialize(br);
		var duration = BlockDuration.Deserialize(br);
		var nonce = MosaicNonce.Deserialize(br);
		var flags = MosaicFlags.Deserialize(br);
		var divisibility = br.ReadByte();

		var instance = new EmbeddedMosaicDefinitionTransactionV1(
			signerPublicKey,
			version,
			network,
			type,
			id,
			duration,
			nonce,
			flags,
			divisibility);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(EmbeddedTransactionHeaderReserved_1)); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(Id.Serialize()); 
		bw.Write(Duration.Serialize()); 
		bw.Write(Nonce.Serialize()); 
		bw.Write(Flags.Serialize()); 
		bw.Write(Divisibility); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"id: {Id}, ";
		result += $"duration: {Duration}, ";
		result += $"nonce: {Nonce}, ";
		result += $"flags: {Flags}, ";
		result += $"divisibility: {Converter.ToString(Divisibility)}, ";
		result += ")";
		return result;
	}
}

public class MosaicSupplyChangeTransactionV1 : ITransaction {
	public const byte TRANSACTION_VERSION = 1;

	public static readonly TransactionType TRANSACTION_TYPE = TransactionType.MOSAIC_SUPPLY_CHANGE;

	private readonly uint VerifiableEntityHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;

	public MosaicSupplyChangeTransactionV1(
	    Signature? signature = null,
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    TransactionType? type = null,
	    Amount? fee = null,
	    Timestamp? deadline = null,
	    UnresolvedMosaicId? mosaicId = null,
	    Amount? delta = null,
	    MosaicSupplyChangeAction? action = null
	) {
		Signature = signature ?? new Signature();
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? MosaicSupplyChangeTransactionV1.TRANSACTION_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? MosaicSupplyChangeTransactionV1.TRANSACTION_TYPE;
		Fee = fee ?? new Amount();
		Deadline = deadline ?? new Timestamp();
		MosaicId = mosaicId ?? new UnresolvedMosaicId();
		Delta = delta ?? new Amount();
		Action = action ?? MosaicSupplyChangeAction.DECREASE;
		VerifiableEntityHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
	}

	public void Sort() {
	}

	public Signature Signature {
		get; set;
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public TransactionType Type {
		get; set;
	}

	public Amount Fee {
		get; set;
	}

	public Timestamp Deadline {
		get; set;
	}

	public UnresolvedMosaicId MosaicId {
		get; set;
	}

	public Amount Delta {
		get; set;
	}

	public MosaicSupplyChangeAction Action {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += Signature.Size;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += Fee.Size;
			size += Deadline.Size;
			size += MosaicId.Size;
			size += Delta.Size;
			size += Action.Size;
			return size;
		}
	}

	public static MosaicSupplyChangeTransactionV1 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var verifiableEntityHeaderReserved_1 = br.ReadUInt32();
		if (0 != verifiableEntityHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({verifiableEntityHeaderReserved_1})");
		var signature = Signature.Deserialize(br);
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = TransactionType.Deserialize(br);
		var fee = Amount.Deserialize(br);
		var deadline = Timestamp.Deserialize(br);
		var mosaicId = UnresolvedMosaicId.Deserialize(br);
		var delta = Amount.Deserialize(br);
		var action = MosaicSupplyChangeAction.Deserialize(br);

		var instance = new MosaicSupplyChangeTransactionV1(
			signature,
			signerPublicKey,
			version,
			network,
			type,
			fee,
			deadline,
			mosaicId,
			delta,
			action);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(VerifiableEntityHeaderReserved_1)); 
		bw.Write(Signature.Serialize()); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(Fee.Serialize()); 
		bw.Write(Deadline.Serialize()); 
		bw.Write(MosaicId.Serialize()); 
		bw.Write(Delta.Serialize()); 
		bw.Write(Action.Serialize()); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signature: {Signature}, ";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"fee: {Fee}, ";
		result += $"deadline: {Deadline}, ";
		result += $"mosaicId: {MosaicId}, ";
		result += $"delta: {Delta}, ";
		result += $"action: {Action}, ";
		result += ")";
		return result;
	}
}

public class EmbeddedMosaicSupplyChangeTransactionV1 : IBaseTransaction {
	public const byte TRANSACTION_VERSION = 1;

	public static readonly TransactionType TRANSACTION_TYPE = TransactionType.MOSAIC_SUPPLY_CHANGE;

	private readonly uint EmbeddedTransactionHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;

	public EmbeddedMosaicSupplyChangeTransactionV1(
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    TransactionType? type = null,
	    UnresolvedMosaicId? mosaicId = null,
	    Amount? delta = null,
	    MosaicSupplyChangeAction? action = null
	) {
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? EmbeddedMosaicSupplyChangeTransactionV1.TRANSACTION_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? EmbeddedMosaicSupplyChangeTransactionV1.TRANSACTION_TYPE;
		MosaicId = mosaicId ?? new UnresolvedMosaicId();
		Delta = delta ?? new Amount();
		Action = action ?? MosaicSupplyChangeAction.DECREASE;
		EmbeddedTransactionHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
	}

	public void Sort() {
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public TransactionType Type {
		get; set;
	}

	public UnresolvedMosaicId MosaicId {
		get; set;
	}

	public Amount Delta {
		get; set;
	}

	public MosaicSupplyChangeAction Action {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += MosaicId.Size;
			size += Delta.Size;
			size += Action.Size;
			return size;
		}
	}

	public static EmbeddedMosaicSupplyChangeTransactionV1 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var embeddedTransactionHeaderReserved_1 = br.ReadUInt32();
		if (0 != embeddedTransactionHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({embeddedTransactionHeaderReserved_1})");
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = TransactionType.Deserialize(br);
		var mosaicId = UnresolvedMosaicId.Deserialize(br);
		var delta = Amount.Deserialize(br);
		var action = MosaicSupplyChangeAction.Deserialize(br);

		var instance = new EmbeddedMosaicSupplyChangeTransactionV1(
			signerPublicKey,
			version,
			network,
			type,
			mosaicId,
			delta,
			action);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(EmbeddedTransactionHeaderReserved_1)); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(MosaicId.Serialize()); 
		bw.Write(Delta.Serialize()); 
		bw.Write(Action.Serialize()); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"mosaicId: {MosaicId}, ";
		result += $"delta: {Delta}, ";
		result += $"action: {Action}, ";
		result += ")";
		return result;
	}
}

public class MosaicSupplyRevocationTransactionV1 : ITransaction {
	public const byte TRANSACTION_VERSION = 1;

	public static readonly TransactionType TRANSACTION_TYPE = TransactionType.MOSAIC_SUPPLY_REVOCATION;

	private readonly uint VerifiableEntityHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;

	public MosaicSupplyRevocationTransactionV1(
	    Signature? signature = null,
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    TransactionType? type = null,
	    Amount? fee = null,
	    Timestamp? deadline = null,
	    UnresolvedAddress? sourceAddress = null,
	    UnresolvedMosaic? mosaic = null
	) {
		Signature = signature ?? new Signature();
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? MosaicSupplyRevocationTransactionV1.TRANSACTION_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? MosaicSupplyRevocationTransactionV1.TRANSACTION_TYPE;
		Fee = fee ?? new Amount();
		Deadline = deadline ?? new Timestamp();
		SourceAddress = sourceAddress ?? new UnresolvedAddress();
		Mosaic = mosaic ?? new UnresolvedMosaic();
		VerifiableEntityHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
	}

	public void Sort() {
		Mosaic.Sort();
	}

	public Signature Signature {
		get; set;
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public TransactionType Type {
		get; set;
	}

	public Amount Fee {
		get; set;
	}

	public Timestamp Deadline {
		get; set;
	}

	public UnresolvedAddress SourceAddress {
		get; set;
	}

	public UnresolvedMosaic Mosaic {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += Signature.Size;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += Fee.Size;
			size += Deadline.Size;
			size += SourceAddress.Size;
			size += Mosaic.Size;
			return size;
		}
	}

	public static MosaicSupplyRevocationTransactionV1 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var verifiableEntityHeaderReserved_1 = br.ReadUInt32();
		if (0 != verifiableEntityHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({verifiableEntityHeaderReserved_1})");
		var signature = Signature.Deserialize(br);
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = TransactionType.Deserialize(br);
		var fee = Amount.Deserialize(br);
		var deadline = Timestamp.Deserialize(br);
		var sourceAddress = UnresolvedAddress.Deserialize(br);
		var mosaic = UnresolvedMosaic.Deserialize(br);

		var instance = new MosaicSupplyRevocationTransactionV1(
			signature,
			signerPublicKey,
			version,
			network,
			type,
			fee,
			deadline,
			sourceAddress,
			mosaic);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(VerifiableEntityHeaderReserved_1)); 
		bw.Write(Signature.Serialize()); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(Fee.Serialize()); 
		bw.Write(Deadline.Serialize()); 
		bw.Write(SourceAddress.Serialize()); 
		bw.Write(Mosaic.Serialize()); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signature: {Signature}, ";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"fee: {Fee}, ";
		result += $"deadline: {Deadline}, ";
		result += $"sourceAddress: {SourceAddress}, ";
		result += $"mosaic: {Mosaic}, ";
		result += ")";
		return result;
	}
}

public class EmbeddedMosaicSupplyRevocationTransactionV1 : IBaseTransaction {
	public const byte TRANSACTION_VERSION = 1;

	public static readonly TransactionType TRANSACTION_TYPE = TransactionType.MOSAIC_SUPPLY_REVOCATION;

	private readonly uint EmbeddedTransactionHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;

	public EmbeddedMosaicSupplyRevocationTransactionV1(
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    TransactionType? type = null,
	    UnresolvedAddress? sourceAddress = null,
	    UnresolvedMosaic? mosaic = null
	) {
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? EmbeddedMosaicSupplyRevocationTransactionV1.TRANSACTION_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? EmbeddedMosaicSupplyRevocationTransactionV1.TRANSACTION_TYPE;
		SourceAddress = sourceAddress ?? new UnresolvedAddress();
		Mosaic = mosaic ?? new UnresolvedMosaic();
		EmbeddedTransactionHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
	}

	public void Sort() {
		Mosaic.Sort();
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public TransactionType Type {
		get; set;
	}

	public UnresolvedAddress SourceAddress {
		get; set;
	}

	public UnresolvedMosaic Mosaic {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += SourceAddress.Size;
			size += Mosaic.Size;
			return size;
		}
	}

	public static EmbeddedMosaicSupplyRevocationTransactionV1 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var embeddedTransactionHeaderReserved_1 = br.ReadUInt32();
		if (0 != embeddedTransactionHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({embeddedTransactionHeaderReserved_1})");
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = TransactionType.Deserialize(br);
		var sourceAddress = UnresolvedAddress.Deserialize(br);
		var mosaic = UnresolvedMosaic.Deserialize(br);

		var instance = new EmbeddedMosaicSupplyRevocationTransactionV1(
			signerPublicKey,
			version,
			network,
			type,
			sourceAddress,
			mosaic);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(EmbeddedTransactionHeaderReserved_1)); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(SourceAddress.Serialize()); 
		bw.Write(Mosaic.Serialize()); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"sourceAddress: {SourceAddress}, ";
		result += $"mosaic: {Mosaic}, ";
		result += ")";
		return result;
	}
}

public class MultisigAccountModificationTransactionV1 : ITransaction {
	public const byte TRANSACTION_VERSION = 1;

	public static readonly TransactionType TRANSACTION_TYPE = TransactionType.MULTISIG_ACCOUNT_MODIFICATION;

	private readonly uint VerifiableEntityHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;
	private readonly uint MultisigAccountModificationTransactionBodyReserved_1;

	public MultisigAccountModificationTransactionV1(
	    Signature? signature = null,
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    TransactionType? type = null,
	    Amount? fee = null,
	    Timestamp? deadline = null,
	    byte? minRemovalDelta = null,
	    byte? minApprovalDelta = null,
	    UnresolvedAddress[]? addressAdditions = null,
	    UnresolvedAddress[]? addressDeletions = null
	) {
		Signature = signature ?? new Signature();
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? MultisigAccountModificationTransactionV1.TRANSACTION_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? MultisigAccountModificationTransactionV1.TRANSACTION_TYPE;
		Fee = fee ?? new Amount();
		Deadline = deadline ?? new Timestamp();
		MinRemovalDelta = minRemovalDelta ?? 0;
		MinApprovalDelta = minApprovalDelta ?? 0;
		AddressAdditions = addressAdditions ?? Array.Empty<UnresolvedAddress>();
		AddressDeletions = addressDeletions ?? Array.Empty<UnresolvedAddress>();
		VerifiableEntityHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
		MultisigAccountModificationTransactionBodyReserved_1 = 0; // reserved field
	}

	public void Sort() {
	}

	public Signature Signature {
		get; set;
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public TransactionType Type {
		get; set;
	}

	public Amount Fee {
		get; set;
	}

	public Timestamp Deadline {
		get; set;
	}

	public byte MinRemovalDelta {
		get; set;
	}

	public byte MinApprovalDelta {
		get; set;
	}

	public UnresolvedAddress[] AddressAdditions {
		get; set;
	}

	public UnresolvedAddress[] AddressDeletions {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += Signature.Size;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += Fee.Size;
			size += Deadline.Size;
			size += 1;
			size += 1;
			size += 1;
			size += 1;
			size += 4;
			size += ArrayHelpers.Size(AddressAdditions);
			size += ArrayHelpers.Size(AddressDeletions);
			return size;
		}
	}

	public static MultisigAccountModificationTransactionV1 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var verifiableEntityHeaderReserved_1 = br.ReadUInt32();
		if (0 != verifiableEntityHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({verifiableEntityHeaderReserved_1})");
		var signature = Signature.Deserialize(br);
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = TransactionType.Deserialize(br);
		var fee = Amount.Deserialize(br);
		var deadline = Timestamp.Deserialize(br);
		var minRemovalDelta = br.ReadByte();
		var minApprovalDelta = br.ReadByte();
		var addressAdditionsCount = br.ReadByte();
		var addressDeletionsCount = br.ReadByte();
		var multisigAccountModificationTransactionBodyReserved_1 = br.ReadUInt32();
		if (0 != multisigAccountModificationTransactionBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({multisigAccountModificationTransactionBodyReserved_1})");
		var addressAdditions = ArrayHelpers.ReadArrayCount(br, UnresolvedAddress.Deserialize, (byte)addressAdditionsCount);
		var addressDeletions = ArrayHelpers.ReadArrayCount(br, UnresolvedAddress.Deserialize, (byte)addressDeletionsCount);

		var instance = new MultisigAccountModificationTransactionV1(
			signature,
			signerPublicKey,
			version,
			network,
			type,
			fee,
			deadline,
			minRemovalDelta,
			minApprovalDelta,
			addressAdditions,
			addressDeletions);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(VerifiableEntityHeaderReserved_1)); 
		bw.Write(Signature.Serialize()); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(Fee.Serialize()); 
		bw.Write(Deadline.Serialize()); 
		bw.Write(MinRemovalDelta); 
		bw.Write(MinApprovalDelta); 
		bw.Write((byte)AddressAdditions.Length);  // bound: address_additions_count
		bw.Write((byte)AddressDeletions.Length);  // bound: address_deletions_count
		bw.Write(BitConverter.GetBytes(MultisigAccountModificationTransactionBodyReserved_1)); 
		Sort();
		ArrayHelpers.WriteArray(bw, AddressAdditions);
		Sort();
		ArrayHelpers.WriteArray(bw, AddressDeletions);
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signature: {Signature}, ";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"fee: {Fee}, ";
		result += $"deadline: {Deadline}, ";
		result += $"minRemovalDelta: {Converter.ToString(MinRemovalDelta)}, ";
		result += $"minApprovalDelta: {Converter.ToString(MinApprovalDelta)}, ";
		result += $"addressAdditions: [{string.Join(",", AddressAdditions.Select(e => e.ToString()))}], ";
		result += $"addressDeletions: [{string.Join(",", AddressDeletions.Select(e => e.ToString()))}], ";
		result += ")";
		return result;
	}
}

public class EmbeddedMultisigAccountModificationTransactionV1 : IBaseTransaction {
	public const byte TRANSACTION_VERSION = 1;

	public static readonly TransactionType TRANSACTION_TYPE = TransactionType.MULTISIG_ACCOUNT_MODIFICATION;

	private readonly uint EmbeddedTransactionHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;
	private readonly uint MultisigAccountModificationTransactionBodyReserved_1;

	public EmbeddedMultisigAccountModificationTransactionV1(
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    TransactionType? type = null,
	    byte? minRemovalDelta = null,
	    byte? minApprovalDelta = null,
	    UnresolvedAddress[]? addressAdditions = null,
	    UnresolvedAddress[]? addressDeletions = null
	) {
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? EmbeddedMultisigAccountModificationTransactionV1.TRANSACTION_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? EmbeddedMultisigAccountModificationTransactionV1.TRANSACTION_TYPE;
		MinRemovalDelta = minRemovalDelta ?? 0;
		MinApprovalDelta = minApprovalDelta ?? 0;
		AddressAdditions = addressAdditions ?? Array.Empty<UnresolvedAddress>();
		AddressDeletions = addressDeletions ?? Array.Empty<UnresolvedAddress>();
		EmbeddedTransactionHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
		MultisigAccountModificationTransactionBodyReserved_1 = 0; // reserved field
	}

	public void Sort() {
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public TransactionType Type {
		get; set;
	}

	public byte MinRemovalDelta {
		get; set;
	}

	public byte MinApprovalDelta {
		get; set;
	}

	public UnresolvedAddress[] AddressAdditions {
		get; set;
	}

	public UnresolvedAddress[] AddressDeletions {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += 1;
			size += 1;
			size += 1;
			size += 1;
			size += 4;
			size += ArrayHelpers.Size(AddressAdditions);
			size += ArrayHelpers.Size(AddressDeletions);
			return size;
		}
	}

	public static EmbeddedMultisigAccountModificationTransactionV1 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var embeddedTransactionHeaderReserved_1 = br.ReadUInt32();
		if (0 != embeddedTransactionHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({embeddedTransactionHeaderReserved_1})");
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = TransactionType.Deserialize(br);
		var minRemovalDelta = br.ReadByte();
		var minApprovalDelta = br.ReadByte();
		var addressAdditionsCount = br.ReadByte();
		var addressDeletionsCount = br.ReadByte();
		var multisigAccountModificationTransactionBodyReserved_1 = br.ReadUInt32();
		if (0 != multisigAccountModificationTransactionBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({multisigAccountModificationTransactionBodyReserved_1})");
		var addressAdditions = ArrayHelpers.ReadArrayCount(br, UnresolvedAddress.Deserialize, (byte)addressAdditionsCount);
		var addressDeletions = ArrayHelpers.ReadArrayCount(br, UnresolvedAddress.Deserialize, (byte)addressDeletionsCount);

		var instance = new EmbeddedMultisigAccountModificationTransactionV1(
			signerPublicKey,
			version,
			network,
			type,
			minRemovalDelta,
			minApprovalDelta,
			addressAdditions,
			addressDeletions);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(EmbeddedTransactionHeaderReserved_1)); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(MinRemovalDelta); 
		bw.Write(MinApprovalDelta); 
		bw.Write((byte)AddressAdditions.Length);  // bound: address_additions_count
		bw.Write((byte)AddressDeletions.Length);  // bound: address_deletions_count
		bw.Write(BitConverter.GetBytes(MultisigAccountModificationTransactionBodyReserved_1)); 
		Sort();
		ArrayHelpers.WriteArray(bw, AddressAdditions);
		Sort();
		ArrayHelpers.WriteArray(bw, AddressDeletions);
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"minRemovalDelta: {Converter.ToString(MinRemovalDelta)}, ";
		result += $"minApprovalDelta: {Converter.ToString(MinApprovalDelta)}, ";
		result += $"addressAdditions: [{string.Join(",", AddressAdditions.Select(e => e.ToString()))}], ";
		result += $"addressDeletions: [{string.Join(",", AddressDeletions.Select(e => e.ToString()))}], ";
		result += ")";
		return result;
	}
}

public class AddressAliasTransactionV1 : ITransaction {
	public const byte TRANSACTION_VERSION = 1;

	public static readonly TransactionType TRANSACTION_TYPE = TransactionType.ADDRESS_ALIAS;

	private readonly uint VerifiableEntityHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;

	public AddressAliasTransactionV1(
	    Signature? signature = null,
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    TransactionType? type = null,
	    Amount? fee = null,
	    Timestamp? deadline = null,
	    NamespaceId? namespaceId = null,
	    Address? address = null,
	    AliasAction? aliasAction = null
	) {
		Signature = signature ?? new Signature();
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? AddressAliasTransactionV1.TRANSACTION_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? AddressAliasTransactionV1.TRANSACTION_TYPE;
		Fee = fee ?? new Amount();
		Deadline = deadline ?? new Timestamp();
		NamespaceId = namespaceId ?? new NamespaceId();
		Address = address ?? new Address();
		AliasAction = aliasAction ?? AliasAction.UNLINK;
		VerifiableEntityHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
	}

	public void Sort() {
	}

	public Signature Signature {
		get; set;
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public TransactionType Type {
		get; set;
	}

	public Amount Fee {
		get; set;
	}

	public Timestamp Deadline {
		get; set;
	}

	public NamespaceId NamespaceId {
		get; set;
	}

	public Address Address {
		get; set;
	}

	public AliasAction AliasAction {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += Signature.Size;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += Fee.Size;
			size += Deadline.Size;
			size += NamespaceId.Size;
			size += Address.Size;
			size += AliasAction.Size;
			return size;
		}
	}

	public static AddressAliasTransactionV1 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var verifiableEntityHeaderReserved_1 = br.ReadUInt32();
		if (0 != verifiableEntityHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({verifiableEntityHeaderReserved_1})");
		var signature = Signature.Deserialize(br);
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = TransactionType.Deserialize(br);
		var fee = Amount.Deserialize(br);
		var deadline = Timestamp.Deserialize(br);
		var namespaceId = NamespaceId.Deserialize(br);
		var address = Address.Deserialize(br);
		var aliasAction = AliasAction.Deserialize(br);

		var instance = new AddressAliasTransactionV1(
			signature,
			signerPublicKey,
			version,
			network,
			type,
			fee,
			deadline,
			namespaceId,
			address,
			aliasAction);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(VerifiableEntityHeaderReserved_1)); 
		bw.Write(Signature.Serialize()); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(Fee.Serialize()); 
		bw.Write(Deadline.Serialize()); 
		bw.Write(NamespaceId.Serialize()); 
		bw.Write(Address.Serialize()); 
		bw.Write(AliasAction.Serialize()); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signature: {Signature}, ";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"fee: {Fee}, ";
		result += $"deadline: {Deadline}, ";
		result += $"namespaceId: {NamespaceId}, ";
		result += $"address: {Address}, ";
		result += $"aliasAction: {AliasAction}, ";
		result += ")";
		return result;
	}
}

public class EmbeddedAddressAliasTransactionV1 : IBaseTransaction {
	public const byte TRANSACTION_VERSION = 1;

	public static readonly TransactionType TRANSACTION_TYPE = TransactionType.ADDRESS_ALIAS;

	private readonly uint EmbeddedTransactionHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;

	public EmbeddedAddressAliasTransactionV1(
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    TransactionType? type = null,
	    NamespaceId? namespaceId = null,
	    Address? address = null,
	    AliasAction? aliasAction = null
	) {
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? EmbeddedAddressAliasTransactionV1.TRANSACTION_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? EmbeddedAddressAliasTransactionV1.TRANSACTION_TYPE;
		NamespaceId = namespaceId ?? new NamespaceId();
		Address = address ?? new Address();
		AliasAction = aliasAction ?? AliasAction.UNLINK;
		EmbeddedTransactionHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
	}

	public void Sort() {
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public TransactionType Type {
		get; set;
	}

	public NamespaceId NamespaceId {
		get; set;
	}

	public Address Address {
		get; set;
	}

	public AliasAction AliasAction {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += NamespaceId.Size;
			size += Address.Size;
			size += AliasAction.Size;
			return size;
		}
	}

	public static EmbeddedAddressAliasTransactionV1 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var embeddedTransactionHeaderReserved_1 = br.ReadUInt32();
		if (0 != embeddedTransactionHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({embeddedTransactionHeaderReserved_1})");
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = TransactionType.Deserialize(br);
		var namespaceId = NamespaceId.Deserialize(br);
		var address = Address.Deserialize(br);
		var aliasAction = AliasAction.Deserialize(br);

		var instance = new EmbeddedAddressAliasTransactionV1(
			signerPublicKey,
			version,
			network,
			type,
			namespaceId,
			address,
			aliasAction);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(EmbeddedTransactionHeaderReserved_1)); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(NamespaceId.Serialize()); 
		bw.Write(Address.Serialize()); 
		bw.Write(AliasAction.Serialize()); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"namespaceId: {NamespaceId}, ";
		result += $"address: {Address}, ";
		result += $"aliasAction: {AliasAction}, ";
		result += ")";
		return result;
	}
}

public class MosaicAliasTransactionV1 : ITransaction {
	public const byte TRANSACTION_VERSION = 1;

	public static readonly TransactionType TRANSACTION_TYPE = TransactionType.MOSAIC_ALIAS;

	private readonly uint VerifiableEntityHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;

	public MosaicAliasTransactionV1(
	    Signature? signature = null,
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    TransactionType? type = null,
	    Amount? fee = null,
	    Timestamp? deadline = null,
	    NamespaceId? namespaceId = null,
	    MosaicId? mosaicId = null,
	    AliasAction? aliasAction = null
	) {
		Signature = signature ?? new Signature();
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? MosaicAliasTransactionV1.TRANSACTION_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? MosaicAliasTransactionV1.TRANSACTION_TYPE;
		Fee = fee ?? new Amount();
		Deadline = deadline ?? new Timestamp();
		NamespaceId = namespaceId ?? new NamespaceId();
		MosaicId = mosaicId ?? new MosaicId();
		AliasAction = aliasAction ?? AliasAction.UNLINK;
		VerifiableEntityHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
	}

	public void Sort() {
	}

	public Signature Signature {
		get; set;
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public TransactionType Type {
		get; set;
	}

	public Amount Fee {
		get; set;
	}

	public Timestamp Deadline {
		get; set;
	}

	public NamespaceId NamespaceId {
		get; set;
	}

	public MosaicId MosaicId {
		get; set;
	}

	public AliasAction AliasAction {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += Signature.Size;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += Fee.Size;
			size += Deadline.Size;
			size += NamespaceId.Size;
			size += MosaicId.Size;
			size += AliasAction.Size;
			return size;
		}
	}

	public static MosaicAliasTransactionV1 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var verifiableEntityHeaderReserved_1 = br.ReadUInt32();
		if (0 != verifiableEntityHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({verifiableEntityHeaderReserved_1})");
		var signature = Signature.Deserialize(br);
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = TransactionType.Deserialize(br);
		var fee = Amount.Deserialize(br);
		var deadline = Timestamp.Deserialize(br);
		var namespaceId = NamespaceId.Deserialize(br);
		var mosaicId = MosaicId.Deserialize(br);
		var aliasAction = AliasAction.Deserialize(br);

		var instance = new MosaicAliasTransactionV1(
			signature,
			signerPublicKey,
			version,
			network,
			type,
			fee,
			deadline,
			namespaceId,
			mosaicId,
			aliasAction);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(VerifiableEntityHeaderReserved_1)); 
		bw.Write(Signature.Serialize()); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(Fee.Serialize()); 
		bw.Write(Deadline.Serialize()); 
		bw.Write(NamespaceId.Serialize()); 
		bw.Write(MosaicId.Serialize()); 
		bw.Write(AliasAction.Serialize()); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signature: {Signature}, ";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"fee: {Fee}, ";
		result += $"deadline: {Deadline}, ";
		result += $"namespaceId: {NamespaceId}, ";
		result += $"mosaicId: {MosaicId}, ";
		result += $"aliasAction: {AliasAction}, ";
		result += ")";
		return result;
	}
}

public class EmbeddedMosaicAliasTransactionV1 : IBaseTransaction {
	public const byte TRANSACTION_VERSION = 1;

	public static readonly TransactionType TRANSACTION_TYPE = TransactionType.MOSAIC_ALIAS;

	private readonly uint EmbeddedTransactionHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;

	public EmbeddedMosaicAliasTransactionV1(
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    TransactionType? type = null,
	    NamespaceId? namespaceId = null,
	    MosaicId? mosaicId = null,
	    AliasAction? aliasAction = null
	) {
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? EmbeddedMosaicAliasTransactionV1.TRANSACTION_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? EmbeddedMosaicAliasTransactionV1.TRANSACTION_TYPE;
		NamespaceId = namespaceId ?? new NamespaceId();
		MosaicId = mosaicId ?? new MosaicId();
		AliasAction = aliasAction ?? AliasAction.UNLINK;
		EmbeddedTransactionHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
	}

	public void Sort() {
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public TransactionType Type {
		get; set;
	}

	public NamespaceId NamespaceId {
		get; set;
	}

	public MosaicId MosaicId {
		get; set;
	}

	public AliasAction AliasAction {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += NamespaceId.Size;
			size += MosaicId.Size;
			size += AliasAction.Size;
			return size;
		}
	}

	public static EmbeddedMosaicAliasTransactionV1 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var embeddedTransactionHeaderReserved_1 = br.ReadUInt32();
		if (0 != embeddedTransactionHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({embeddedTransactionHeaderReserved_1})");
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = TransactionType.Deserialize(br);
		var namespaceId = NamespaceId.Deserialize(br);
		var mosaicId = MosaicId.Deserialize(br);
		var aliasAction = AliasAction.Deserialize(br);

		var instance = new EmbeddedMosaicAliasTransactionV1(
			signerPublicKey,
			version,
			network,
			type,
			namespaceId,
			mosaicId,
			aliasAction);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(EmbeddedTransactionHeaderReserved_1)); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(NamespaceId.Serialize()); 
		bw.Write(MosaicId.Serialize()); 
		bw.Write(AliasAction.Serialize()); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"namespaceId: {NamespaceId}, ";
		result += $"mosaicId: {MosaicId}, ";
		result += $"aliasAction: {AliasAction}, ";
		result += ")";
		return result;
	}
}

public class NamespaceRegistrationTransactionV1 : ITransaction {
	public const byte TRANSACTION_VERSION = 1;

	public static readonly TransactionType TRANSACTION_TYPE = TransactionType.NAMESPACE_REGISTRATION;

	private readonly uint VerifiableEntityHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;

	public NamespaceRegistrationTransactionV1(
	    Signature? signature = null,
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    TransactionType? type = null,
	    Amount? fee = null,
	    Timestamp? deadline = null,
	    BlockDuration? duration = null,
	    NamespaceId? parentId = null,
	    NamespaceId? id = null,
	    NamespaceRegistrationType? registrationType = null,
	    byte[]? name = null
	) {
		Signature = signature ?? new Signature();
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? NamespaceRegistrationTransactionV1.TRANSACTION_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? NamespaceRegistrationTransactionV1.TRANSACTION_TYPE;
		Fee = fee ?? new Amount();
		Deadline = deadline ?? new Timestamp();
		Duration = duration ?? new BlockDuration();
		ParentId = parentId ?? null;
		Id = id ?? new NamespaceId();
		RegistrationType = registrationType ?? NamespaceRegistrationType.ROOT;
		Name = name ?? Array.Empty<byte>();
		VerifiableEntityHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
	}

	public void Sort() {
	}

	public Signature Signature {
		get; set;
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public TransactionType Type {
		get; set;
	}

	public Amount Fee {
		get; set;
	}

	public Timestamp Deadline {
		get; set;
	}

	public BlockDuration Duration {
		get; set;
	}

	public NamespaceId? ParentId {
		get; set;
	}

	public NamespaceId Id {
		get; set;
	}

	public NamespaceRegistrationType RegistrationType {
		get; set;
	}

	public byte[] Name {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += Signature.Size;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += Fee.Size;
			size += Deadline.Size;
			if (NamespaceRegistrationType.ROOT.Value == RegistrationType.Value)
				size += Duration.Size;

			if (NamespaceRegistrationType.CHILD.Value == RegistrationType.Value)
				size += ParentId.Size;

			size += Id.Size;
			size += RegistrationType.Size;
			size += 1;
			size += (uint)Name.Length;
			return size;
		}
	}

	public static NamespaceRegistrationTransactionV1 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var verifiableEntityHeaderReserved_1 = br.ReadUInt32();
		if (0 != verifiableEntityHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({verifiableEntityHeaderReserved_1})");
		var signature = Signature.Deserialize(br);
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = TransactionType.Deserialize(br);
		var fee = Amount.Deserialize(br);
		var deadline = Timestamp.Deserialize(br);
		// deserialize to temporary buffer for further processing
		var durationTemporary = BlockDuration.Deserialize(br);
		var id = NamespaceId.Deserialize(br);
		var registrationType = NamespaceRegistrationType.Deserialize(br);
		var duration = new BlockDuration();
		if (NamespaceRegistrationType.ROOT.Value == registrationType.Value) {
			{
				var tempMs = new MemoryStream(durationTemporary.Serialize());
				var tempBr = new BinaryReader(tempMs);
				duration = BlockDuration.Deserialize(tempBr);
			}
		}
		var parentId = new NamespaceId();
		if (NamespaceRegistrationType.CHILD.Value == registrationType.Value) {
			{
				var tempMs = new MemoryStream(durationTemporary.Serialize());
				var tempBr = new BinaryReader(tempMs);
				parentId = NamespaceId.Deserialize(tempBr);
			}
		}
		var nameSize = br.ReadByte();
		var name = br.ReadBytes((int)nameSize);

		var instance = new NamespaceRegistrationTransactionV1(
			signature,
			signerPublicKey,
			version,
			network,
			type,
			fee,
			deadline,
			duration,
			parentId,
			id,
			registrationType,
			name);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(VerifiableEntityHeaderReserved_1)); 
		bw.Write(Signature.Serialize()); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(Fee.Serialize()); 
		bw.Write(Deadline.Serialize()); 
		if (NamespaceRegistrationType.ROOT.Value == RegistrationType.Value)
			bw.Write(Duration.Serialize()); 

		if (NamespaceRegistrationType.CHILD.Value == RegistrationType.Value)
			bw.Write(ParentId.Serialize()); 

		bw.Write(Id.Serialize()); 
		bw.Write(RegistrationType.Serialize()); 
		bw.Write((byte)Name.Length);  // bound: name_size
		bw.Write(Name); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signature: {Signature}, ";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"fee: {Fee}, ";
		result += $"deadline: {Deadline}, ";
		if (NamespaceRegistrationType.ROOT.Value == RegistrationType.Value)
			result += $"duration: {Duration}, ";

		if (NamespaceRegistrationType.CHILD.Value == RegistrationType.Value)
			result += $"parentId: {ParentId}, ";

		result += $"id: {Id}, ";
		result += $"registrationType: {RegistrationType}, ";
		result += $"name: hex({Converter.BytesToHex(Name)}), ";
		result += ")";
		return result;
	}
}

public class EmbeddedNamespaceRegistrationTransactionV1 : IBaseTransaction {
	public const byte TRANSACTION_VERSION = 1;

	public static readonly TransactionType TRANSACTION_TYPE = TransactionType.NAMESPACE_REGISTRATION;

	private readonly uint EmbeddedTransactionHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;

	public EmbeddedNamespaceRegistrationTransactionV1(
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    TransactionType? type = null,
	    BlockDuration? duration = null,
	    NamespaceId? parentId = null,
	    NamespaceId? id = null,
	    NamespaceRegistrationType? registrationType = null,
	    byte[]? name = null
	) {
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? EmbeddedNamespaceRegistrationTransactionV1.TRANSACTION_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? EmbeddedNamespaceRegistrationTransactionV1.TRANSACTION_TYPE;
		Duration = duration ?? new BlockDuration();
		ParentId = parentId ?? null;
		Id = id ?? new NamespaceId();
		RegistrationType = registrationType ?? NamespaceRegistrationType.ROOT;
		Name = name ?? Array.Empty<byte>();
		EmbeddedTransactionHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
	}

	public void Sort() {
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public TransactionType Type {
		get; set;
	}

	public BlockDuration Duration {
		get; set;
	}

	public NamespaceId? ParentId {
		get; set;
	}

	public NamespaceId Id {
		get; set;
	}

	public NamespaceRegistrationType RegistrationType {
		get; set;
	}

	public byte[] Name {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			if (NamespaceRegistrationType.ROOT.Value == RegistrationType.Value)
				size += Duration.Size;

			if (NamespaceRegistrationType.CHILD.Value == RegistrationType.Value)
				size += ParentId.Size;

			size += Id.Size;
			size += RegistrationType.Size;
			size += 1;
			size += (uint)Name.Length;
			return size;
		}
	}

	public static EmbeddedNamespaceRegistrationTransactionV1 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var embeddedTransactionHeaderReserved_1 = br.ReadUInt32();
		if (0 != embeddedTransactionHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({embeddedTransactionHeaderReserved_1})");
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = TransactionType.Deserialize(br);
		// deserialize to temporary buffer for further processing
		var durationTemporary = BlockDuration.Deserialize(br);
		var id = NamespaceId.Deserialize(br);
		var registrationType = NamespaceRegistrationType.Deserialize(br);
		var duration = new BlockDuration();
		if (NamespaceRegistrationType.ROOT.Value == registrationType.Value) {
			{
				var tempMs = new MemoryStream(durationTemporary.Serialize());
				var tempBr = new BinaryReader(tempMs);
				duration = BlockDuration.Deserialize(tempBr);
			}
		}
		var parentId = new NamespaceId();
		if (NamespaceRegistrationType.CHILD.Value == registrationType.Value) {
			{
				var tempMs = new MemoryStream(durationTemporary.Serialize());
				var tempBr = new BinaryReader(tempMs);
				parentId = NamespaceId.Deserialize(tempBr);
			}
		}
		var nameSize = br.ReadByte();
		var name = br.ReadBytes((int)nameSize);

		var instance = new EmbeddedNamespaceRegistrationTransactionV1(
			signerPublicKey,
			version,
			network,
			type,
			duration,
			parentId,
			id,
			registrationType,
			name);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(EmbeddedTransactionHeaderReserved_1)); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		if (NamespaceRegistrationType.ROOT.Value == RegistrationType.Value)
			bw.Write(Duration.Serialize()); 

		if (NamespaceRegistrationType.CHILD.Value == RegistrationType.Value)
			bw.Write(ParentId.Serialize()); 

		bw.Write(Id.Serialize()); 
		bw.Write(RegistrationType.Serialize()); 
		bw.Write((byte)Name.Length);  // bound: name_size
		bw.Write(Name); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		if (NamespaceRegistrationType.ROOT.Value == RegistrationType.Value)
			result += $"duration: {Duration}, ";

		if (NamespaceRegistrationType.CHILD.Value == RegistrationType.Value)
			result += $"parentId: {ParentId}, ";

		result += $"id: {Id}, ";
		result += $"registrationType: {RegistrationType}, ";
		result += $"name: hex({Converter.BytesToHex(Name)}), ";
		result += ")";
		return result;
	}
}

public class AccountRestrictionFlags : IEnum<ushort> {
	public static readonly AccountRestrictionFlags ADDRESS = new AccountRestrictionFlags(1);

	public static readonly AccountRestrictionFlags MOSAIC_ID = new AccountRestrictionFlags(2);

	public static readonly AccountRestrictionFlags TRANSACTION_TYPE = new AccountRestrictionFlags(4);

	public static readonly AccountRestrictionFlags OUTGOING = new AccountRestrictionFlags(16384);

	public static readonly AccountRestrictionFlags BLOCK = new AccountRestrictionFlags(32768);

	public ushort Value { get; }

	public AccountRestrictionFlags(ushort value = 0) {
		Value = value;
	}

	public bool Has(uint flag) {
		return 0 != (Value & flag);
	}

	public uint Size {
		get {
			return 2;
		}
	}

	public static AccountRestrictionFlags Deserialize(BinaryReader br) {
		return new AccountRestrictionFlags(br.ReadUInt16());
	}

	public byte[] Serialize() {
		return BitConverter.GetBytes(Value);
	}

	public override string ToString() {
		var values = new uint[]{
			1, 2, 4, 16384, 32768
		};
		var keys = new []{
			"ADDRESS", "MOSAIC_ID", "TRANSACTION_TYPE", "OUTGOING", "BLOCK"
		};

		if (0 == Value) {
			var index = Array.IndexOf(values, Value);
			return $"AccountRestrictionFlags.{keys[index]}";
		}

		var positions = values.ToList().Select((flag, i) => new {flag, Index = i}).Where(flag => (Value & flag.flag) != 0).ToList();
		return string.Join("|", positions.Select(n => $"AccountRestrictionFlags.{keys[n.Index]}"));
	}
}

public class AccountAddressRestrictionTransactionV1 : ITransaction {
	public const byte TRANSACTION_VERSION = 1;

	public static readonly TransactionType TRANSACTION_TYPE = TransactionType.ACCOUNT_ADDRESS_RESTRICTION;

	private readonly uint VerifiableEntityHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;
	private readonly uint AccountRestrictionTransactionBodyReserved_1;

	public AccountAddressRestrictionTransactionV1(
	    Signature? signature = null,
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    TransactionType? type = null,
	    Amount? fee = null,
	    Timestamp? deadline = null,
	    AccountRestrictionFlags? restrictionFlags = null,
	    UnresolvedAddress[]? restrictionAdditions = null,
	    UnresolvedAddress[]? restrictionDeletions = null
	) {
		Signature = signature ?? new Signature();
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? AccountAddressRestrictionTransactionV1.TRANSACTION_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? AccountAddressRestrictionTransactionV1.TRANSACTION_TYPE;
		Fee = fee ?? new Amount();
		Deadline = deadline ?? new Timestamp();
		RestrictionFlags = restrictionFlags ?? AccountRestrictionFlags.ADDRESS;
		RestrictionAdditions = restrictionAdditions ?? Array.Empty<UnresolvedAddress>();
		RestrictionDeletions = restrictionDeletions ?? Array.Empty<UnresolvedAddress>();
		VerifiableEntityHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
		AccountRestrictionTransactionBodyReserved_1 = 0; // reserved field
	}

	public void Sort() {
	}

	public Signature Signature {
		get; set;
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public TransactionType Type {
		get; set;
	}

	public Amount Fee {
		get; set;
	}

	public Timestamp Deadline {
		get; set;
	}

	public AccountRestrictionFlags RestrictionFlags {
		get; set;
	}

	public UnresolvedAddress[] RestrictionAdditions {
		get; set;
	}

	public UnresolvedAddress[] RestrictionDeletions {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += Signature.Size;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += Fee.Size;
			size += Deadline.Size;
			size += RestrictionFlags.Size;
			size += 1;
			size += 1;
			size += 4;
			size += ArrayHelpers.Size(RestrictionAdditions);
			size += ArrayHelpers.Size(RestrictionDeletions);
			return size;
		}
	}

	public static AccountAddressRestrictionTransactionV1 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var verifiableEntityHeaderReserved_1 = br.ReadUInt32();
		if (0 != verifiableEntityHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({verifiableEntityHeaderReserved_1})");
		var signature = Signature.Deserialize(br);
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = TransactionType.Deserialize(br);
		var fee = Amount.Deserialize(br);
		var deadline = Timestamp.Deserialize(br);
		var restrictionFlags = AccountRestrictionFlags.Deserialize(br);
		var restrictionAdditionsCount = br.ReadByte();
		var restrictionDeletionsCount = br.ReadByte();
		var accountRestrictionTransactionBodyReserved_1 = br.ReadUInt32();
		if (0 != accountRestrictionTransactionBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({accountRestrictionTransactionBodyReserved_1})");
		var restrictionAdditions = ArrayHelpers.ReadArrayCount(br, UnresolvedAddress.Deserialize, (byte)restrictionAdditionsCount);
		var restrictionDeletions = ArrayHelpers.ReadArrayCount(br, UnresolvedAddress.Deserialize, (byte)restrictionDeletionsCount);

		var instance = new AccountAddressRestrictionTransactionV1(
			signature,
			signerPublicKey,
			version,
			network,
			type,
			fee,
			deadline,
			restrictionFlags,
			restrictionAdditions,
			restrictionDeletions);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(VerifiableEntityHeaderReserved_1)); 
		bw.Write(Signature.Serialize()); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(Fee.Serialize()); 
		bw.Write(Deadline.Serialize()); 
		bw.Write(RestrictionFlags.Serialize()); 
		bw.Write((byte)RestrictionAdditions.Length);  // bound: restriction_additions_count
		bw.Write((byte)RestrictionDeletions.Length);  // bound: restriction_deletions_count
		bw.Write(BitConverter.GetBytes(AccountRestrictionTransactionBodyReserved_1)); 
		Sort();
		ArrayHelpers.WriteArray(bw, RestrictionAdditions);
		Sort();
		ArrayHelpers.WriteArray(bw, RestrictionDeletions);
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signature: {Signature}, ";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"fee: {Fee}, ";
		result += $"deadline: {Deadline}, ";
		result += $"restrictionFlags: {RestrictionFlags}, ";
		result += $"restrictionAdditions: [{string.Join(",", RestrictionAdditions.Select(e => e.ToString()))}], ";
		result += $"restrictionDeletions: [{string.Join(",", RestrictionDeletions.Select(e => e.ToString()))}], ";
		result += ")";
		return result;
	}
}

public class EmbeddedAccountAddressRestrictionTransactionV1 : IBaseTransaction {
	public const byte TRANSACTION_VERSION = 1;

	public static readonly TransactionType TRANSACTION_TYPE = TransactionType.ACCOUNT_ADDRESS_RESTRICTION;

	private readonly uint EmbeddedTransactionHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;
	private readonly uint AccountRestrictionTransactionBodyReserved_1;

	public EmbeddedAccountAddressRestrictionTransactionV1(
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    TransactionType? type = null,
	    AccountRestrictionFlags? restrictionFlags = null,
	    UnresolvedAddress[]? restrictionAdditions = null,
	    UnresolvedAddress[]? restrictionDeletions = null
	) {
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? EmbeddedAccountAddressRestrictionTransactionV1.TRANSACTION_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? EmbeddedAccountAddressRestrictionTransactionV1.TRANSACTION_TYPE;
		RestrictionFlags = restrictionFlags ?? AccountRestrictionFlags.ADDRESS;
		RestrictionAdditions = restrictionAdditions ?? Array.Empty<UnresolvedAddress>();
		RestrictionDeletions = restrictionDeletions ?? Array.Empty<UnresolvedAddress>();
		EmbeddedTransactionHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
		AccountRestrictionTransactionBodyReserved_1 = 0; // reserved field
	}

	public void Sort() {
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public TransactionType Type {
		get; set;
	}

	public AccountRestrictionFlags RestrictionFlags {
		get; set;
	}

	public UnresolvedAddress[] RestrictionAdditions {
		get; set;
	}

	public UnresolvedAddress[] RestrictionDeletions {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += RestrictionFlags.Size;
			size += 1;
			size += 1;
			size += 4;
			size += ArrayHelpers.Size(RestrictionAdditions);
			size += ArrayHelpers.Size(RestrictionDeletions);
			return size;
		}
	}

	public static EmbeddedAccountAddressRestrictionTransactionV1 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var embeddedTransactionHeaderReserved_1 = br.ReadUInt32();
		if (0 != embeddedTransactionHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({embeddedTransactionHeaderReserved_1})");
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = TransactionType.Deserialize(br);
		var restrictionFlags = AccountRestrictionFlags.Deserialize(br);
		var restrictionAdditionsCount = br.ReadByte();
		var restrictionDeletionsCount = br.ReadByte();
		var accountRestrictionTransactionBodyReserved_1 = br.ReadUInt32();
		if (0 != accountRestrictionTransactionBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({accountRestrictionTransactionBodyReserved_1})");
		var restrictionAdditions = ArrayHelpers.ReadArrayCount(br, UnresolvedAddress.Deserialize, (byte)restrictionAdditionsCount);
		var restrictionDeletions = ArrayHelpers.ReadArrayCount(br, UnresolvedAddress.Deserialize, (byte)restrictionDeletionsCount);

		var instance = new EmbeddedAccountAddressRestrictionTransactionV1(
			signerPublicKey,
			version,
			network,
			type,
			restrictionFlags,
			restrictionAdditions,
			restrictionDeletions);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(EmbeddedTransactionHeaderReserved_1)); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(RestrictionFlags.Serialize()); 
		bw.Write((byte)RestrictionAdditions.Length);  // bound: restriction_additions_count
		bw.Write((byte)RestrictionDeletions.Length);  // bound: restriction_deletions_count
		bw.Write(BitConverter.GetBytes(AccountRestrictionTransactionBodyReserved_1)); 
		Sort();
		ArrayHelpers.WriteArray(bw, RestrictionAdditions);
		Sort();
		ArrayHelpers.WriteArray(bw, RestrictionDeletions);
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"restrictionFlags: {RestrictionFlags}, ";
		result += $"restrictionAdditions: [{string.Join(",", RestrictionAdditions.Select(e => e.ToString()))}], ";
		result += $"restrictionDeletions: [{string.Join(",", RestrictionDeletions.Select(e => e.ToString()))}], ";
		result += ")";
		return result;
	}
}

public class AccountMosaicRestrictionTransactionV1 : ITransaction {
	public const byte TRANSACTION_VERSION = 1;

	public static readonly TransactionType TRANSACTION_TYPE = TransactionType.ACCOUNT_MOSAIC_RESTRICTION;

	private readonly uint VerifiableEntityHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;
	private readonly uint AccountRestrictionTransactionBodyReserved_1;

	public AccountMosaicRestrictionTransactionV1(
	    Signature? signature = null,
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    TransactionType? type = null,
	    Amount? fee = null,
	    Timestamp? deadline = null,
	    AccountRestrictionFlags? restrictionFlags = null,
	    UnresolvedMosaicId[]? restrictionAdditions = null,
	    UnresolvedMosaicId[]? restrictionDeletions = null
	) {
		Signature = signature ?? new Signature();
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? AccountMosaicRestrictionTransactionV1.TRANSACTION_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? AccountMosaicRestrictionTransactionV1.TRANSACTION_TYPE;
		Fee = fee ?? new Amount();
		Deadline = deadline ?? new Timestamp();
		RestrictionFlags = restrictionFlags ?? AccountRestrictionFlags.ADDRESS;
		RestrictionAdditions = restrictionAdditions ?? Array.Empty<UnresolvedMosaicId>();
		RestrictionDeletions = restrictionDeletions ?? Array.Empty<UnresolvedMosaicId>();
		VerifiableEntityHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
		AccountRestrictionTransactionBodyReserved_1 = 0; // reserved field
	}

	public void Sort() {
	}

	public Signature Signature {
		get; set;
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public TransactionType Type {
		get; set;
	}

	public Amount Fee {
		get; set;
	}

	public Timestamp Deadline {
		get; set;
	}

	public AccountRestrictionFlags RestrictionFlags {
		get; set;
	}

	public UnresolvedMosaicId[] RestrictionAdditions {
		get; set;
	}

	public UnresolvedMosaicId[] RestrictionDeletions {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += Signature.Size;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += Fee.Size;
			size += Deadline.Size;
			size += RestrictionFlags.Size;
			size += 1;
			size += 1;
			size += 4;
			size += ArrayHelpers.Size(RestrictionAdditions);
			size += ArrayHelpers.Size(RestrictionDeletions);
			return size;
		}
	}

	public static AccountMosaicRestrictionTransactionV1 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var verifiableEntityHeaderReserved_1 = br.ReadUInt32();
		if (0 != verifiableEntityHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({verifiableEntityHeaderReserved_1})");
		var signature = Signature.Deserialize(br);
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = TransactionType.Deserialize(br);
		var fee = Amount.Deserialize(br);
		var deadline = Timestamp.Deserialize(br);
		var restrictionFlags = AccountRestrictionFlags.Deserialize(br);
		var restrictionAdditionsCount = br.ReadByte();
		var restrictionDeletionsCount = br.ReadByte();
		var accountRestrictionTransactionBodyReserved_1 = br.ReadUInt32();
		if (0 != accountRestrictionTransactionBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({accountRestrictionTransactionBodyReserved_1})");
		var restrictionAdditions = ArrayHelpers.ReadArrayCount(br, UnresolvedMosaicId.Deserialize, (byte)restrictionAdditionsCount);
		var restrictionDeletions = ArrayHelpers.ReadArrayCount(br, UnresolvedMosaicId.Deserialize, (byte)restrictionDeletionsCount);

		var instance = new AccountMosaicRestrictionTransactionV1(
			signature,
			signerPublicKey,
			version,
			network,
			type,
			fee,
			deadline,
			restrictionFlags,
			restrictionAdditions,
			restrictionDeletions);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(VerifiableEntityHeaderReserved_1)); 
		bw.Write(Signature.Serialize()); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(Fee.Serialize()); 
		bw.Write(Deadline.Serialize()); 
		bw.Write(RestrictionFlags.Serialize()); 
		bw.Write((byte)RestrictionAdditions.Length);  // bound: restriction_additions_count
		bw.Write((byte)RestrictionDeletions.Length);  // bound: restriction_deletions_count
		bw.Write(BitConverter.GetBytes(AccountRestrictionTransactionBodyReserved_1)); 
		Sort();
		ArrayHelpers.WriteArray(bw, RestrictionAdditions);
		Sort();
		ArrayHelpers.WriteArray(bw, RestrictionDeletions);
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signature: {Signature}, ";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"fee: {Fee}, ";
		result += $"deadline: {Deadline}, ";
		result += $"restrictionFlags: {RestrictionFlags}, ";
		result += $"restrictionAdditions: [{string.Join(",", RestrictionAdditions.Select(e => e.ToString()))}], ";
		result += $"restrictionDeletions: [{string.Join(",", RestrictionDeletions.Select(e => e.ToString()))}], ";
		result += ")";
		return result;
	}
}

public class EmbeddedAccountMosaicRestrictionTransactionV1 : IBaseTransaction {
	public const byte TRANSACTION_VERSION = 1;

	public static readonly TransactionType TRANSACTION_TYPE = TransactionType.ACCOUNT_MOSAIC_RESTRICTION;

	private readonly uint EmbeddedTransactionHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;
	private readonly uint AccountRestrictionTransactionBodyReserved_1;

	public EmbeddedAccountMosaicRestrictionTransactionV1(
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    TransactionType? type = null,
	    AccountRestrictionFlags? restrictionFlags = null,
	    UnresolvedMosaicId[]? restrictionAdditions = null,
	    UnresolvedMosaicId[]? restrictionDeletions = null
	) {
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? EmbeddedAccountMosaicRestrictionTransactionV1.TRANSACTION_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? EmbeddedAccountMosaicRestrictionTransactionV1.TRANSACTION_TYPE;
		RestrictionFlags = restrictionFlags ?? AccountRestrictionFlags.ADDRESS;
		RestrictionAdditions = restrictionAdditions ?? Array.Empty<UnresolvedMosaicId>();
		RestrictionDeletions = restrictionDeletions ?? Array.Empty<UnresolvedMosaicId>();
		EmbeddedTransactionHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
		AccountRestrictionTransactionBodyReserved_1 = 0; // reserved field
	}

	public void Sort() {
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public TransactionType Type {
		get; set;
	}

	public AccountRestrictionFlags RestrictionFlags {
		get; set;
	}

	public UnresolvedMosaicId[] RestrictionAdditions {
		get; set;
	}

	public UnresolvedMosaicId[] RestrictionDeletions {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += RestrictionFlags.Size;
			size += 1;
			size += 1;
			size += 4;
			size += ArrayHelpers.Size(RestrictionAdditions);
			size += ArrayHelpers.Size(RestrictionDeletions);
			return size;
		}
	}

	public static EmbeddedAccountMosaicRestrictionTransactionV1 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var embeddedTransactionHeaderReserved_1 = br.ReadUInt32();
		if (0 != embeddedTransactionHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({embeddedTransactionHeaderReserved_1})");
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = TransactionType.Deserialize(br);
		var restrictionFlags = AccountRestrictionFlags.Deserialize(br);
		var restrictionAdditionsCount = br.ReadByte();
		var restrictionDeletionsCount = br.ReadByte();
		var accountRestrictionTransactionBodyReserved_1 = br.ReadUInt32();
		if (0 != accountRestrictionTransactionBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({accountRestrictionTransactionBodyReserved_1})");
		var restrictionAdditions = ArrayHelpers.ReadArrayCount(br, UnresolvedMosaicId.Deserialize, (byte)restrictionAdditionsCount);
		var restrictionDeletions = ArrayHelpers.ReadArrayCount(br, UnresolvedMosaicId.Deserialize, (byte)restrictionDeletionsCount);

		var instance = new EmbeddedAccountMosaicRestrictionTransactionV1(
			signerPublicKey,
			version,
			network,
			type,
			restrictionFlags,
			restrictionAdditions,
			restrictionDeletions);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(EmbeddedTransactionHeaderReserved_1)); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(RestrictionFlags.Serialize()); 
		bw.Write((byte)RestrictionAdditions.Length);  // bound: restriction_additions_count
		bw.Write((byte)RestrictionDeletions.Length);  // bound: restriction_deletions_count
		bw.Write(BitConverter.GetBytes(AccountRestrictionTransactionBodyReserved_1)); 
		Sort();
		ArrayHelpers.WriteArray(bw, RestrictionAdditions);
		Sort();
		ArrayHelpers.WriteArray(bw, RestrictionDeletions);
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"restrictionFlags: {RestrictionFlags}, ";
		result += $"restrictionAdditions: [{string.Join(",", RestrictionAdditions.Select(e => e.ToString()))}], ";
		result += $"restrictionDeletions: [{string.Join(",", RestrictionDeletions.Select(e => e.ToString()))}], ";
		result += ")";
		return result;
	}
}

public class AccountOperationRestrictionTransactionV1 : ITransaction {
	public const byte TRANSACTION_VERSION = 1;

	public static readonly TransactionType TRANSACTION_TYPE = TransactionType.ACCOUNT_OPERATION_RESTRICTION;

	private readonly uint VerifiableEntityHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;
	private readonly uint AccountRestrictionTransactionBodyReserved_1;

	public AccountOperationRestrictionTransactionV1(
	    Signature? signature = null,
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    TransactionType? type = null,
	    Amount? fee = null,
	    Timestamp? deadline = null,
	    AccountRestrictionFlags? restrictionFlags = null,
	    TransactionType[]? restrictionAdditions = null,
	    TransactionType[]? restrictionDeletions = null
	) {
		Signature = signature ?? new Signature();
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? AccountOperationRestrictionTransactionV1.TRANSACTION_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? AccountOperationRestrictionTransactionV1.TRANSACTION_TYPE;
		Fee = fee ?? new Amount();
		Deadline = deadline ?? new Timestamp();
		RestrictionFlags = restrictionFlags ?? AccountRestrictionFlags.ADDRESS;
		RestrictionAdditions = restrictionAdditions ?? Array.Empty<TransactionType>();
		RestrictionDeletions = restrictionDeletions ?? Array.Empty<TransactionType>();
		VerifiableEntityHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
		AccountRestrictionTransactionBodyReserved_1 = 0; // reserved field
	}

	public void Sort() {
	}

	public Signature Signature {
		get; set;
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public TransactionType Type {
		get; set;
	}

	public Amount Fee {
		get; set;
	}

	public Timestamp Deadline {
		get; set;
	}

	public AccountRestrictionFlags RestrictionFlags {
		get; set;
	}

	public TransactionType[] RestrictionAdditions {
		get; set;
	}

	public TransactionType[] RestrictionDeletions {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += Signature.Size;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += Fee.Size;
			size += Deadline.Size;
			size += RestrictionFlags.Size;
			size += 1;
			size += 1;
			size += 4;
			size += ArrayHelpers.Size(RestrictionAdditions);
			size += ArrayHelpers.Size(RestrictionDeletions);
			return size;
		}
	}

	public static AccountOperationRestrictionTransactionV1 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var verifiableEntityHeaderReserved_1 = br.ReadUInt32();
		if (0 != verifiableEntityHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({verifiableEntityHeaderReserved_1})");
		var signature = Signature.Deserialize(br);
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = TransactionType.Deserialize(br);
		var fee = Amount.Deserialize(br);
		var deadline = Timestamp.Deserialize(br);
		var restrictionFlags = AccountRestrictionFlags.Deserialize(br);
		var restrictionAdditionsCount = br.ReadByte();
		var restrictionDeletionsCount = br.ReadByte();
		var accountRestrictionTransactionBodyReserved_1 = br.ReadUInt32();
		if (0 != accountRestrictionTransactionBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({accountRestrictionTransactionBodyReserved_1})");
		var restrictionAdditions = ArrayHelpers.ReadArrayCount(br, TransactionType.Deserialize, (byte)restrictionAdditionsCount);
		var restrictionDeletions = ArrayHelpers.ReadArrayCount(br, TransactionType.Deserialize, (byte)restrictionDeletionsCount);

		var instance = new AccountOperationRestrictionTransactionV1(
			signature,
			signerPublicKey,
			version,
			network,
			type,
			fee,
			deadline,
			restrictionFlags,
			restrictionAdditions,
			restrictionDeletions);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(VerifiableEntityHeaderReserved_1)); 
		bw.Write(Signature.Serialize()); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(Fee.Serialize()); 
		bw.Write(Deadline.Serialize()); 
		bw.Write(RestrictionFlags.Serialize()); 
		bw.Write((byte)RestrictionAdditions.Length);  // bound: restriction_additions_count
		bw.Write((byte)RestrictionDeletions.Length);  // bound: restriction_deletions_count
		bw.Write(BitConverter.GetBytes(AccountRestrictionTransactionBodyReserved_1)); 
		Sort();
		ArrayHelpers.WriteArray(bw, RestrictionAdditions);
		Sort();
		ArrayHelpers.WriteArray(bw, RestrictionDeletions);
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signature: {Signature}, ";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"fee: {Fee}, ";
		result += $"deadline: {Deadline}, ";
		result += $"restrictionFlags: {RestrictionFlags}, ";
		result += $"restrictionAdditions: [{string.Join(",", RestrictionAdditions.Select(e => e.ToString()))}], ";
		result += $"restrictionDeletions: [{string.Join(",", RestrictionDeletions.Select(e => e.ToString()))}], ";
		result += ")";
		return result;
	}
}

public class EmbeddedAccountOperationRestrictionTransactionV1 : IBaseTransaction {
	public const byte TRANSACTION_VERSION = 1;

	public static readonly TransactionType TRANSACTION_TYPE = TransactionType.ACCOUNT_OPERATION_RESTRICTION;

	private readonly uint EmbeddedTransactionHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;
	private readonly uint AccountRestrictionTransactionBodyReserved_1;

	public EmbeddedAccountOperationRestrictionTransactionV1(
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    TransactionType? type = null,
	    AccountRestrictionFlags? restrictionFlags = null,
	    TransactionType[]? restrictionAdditions = null,
	    TransactionType[]? restrictionDeletions = null
	) {
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? EmbeddedAccountOperationRestrictionTransactionV1.TRANSACTION_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? EmbeddedAccountOperationRestrictionTransactionV1.TRANSACTION_TYPE;
		RestrictionFlags = restrictionFlags ?? AccountRestrictionFlags.ADDRESS;
		RestrictionAdditions = restrictionAdditions ?? Array.Empty<TransactionType>();
		RestrictionDeletions = restrictionDeletions ?? Array.Empty<TransactionType>();
		EmbeddedTransactionHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
		AccountRestrictionTransactionBodyReserved_1 = 0; // reserved field
	}

	public void Sort() {
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public TransactionType Type {
		get; set;
	}

	public AccountRestrictionFlags RestrictionFlags {
		get; set;
	}

	public TransactionType[] RestrictionAdditions {
		get; set;
	}

	public TransactionType[] RestrictionDeletions {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += RestrictionFlags.Size;
			size += 1;
			size += 1;
			size += 4;
			size += ArrayHelpers.Size(RestrictionAdditions);
			size += ArrayHelpers.Size(RestrictionDeletions);
			return size;
		}
	}

	public static EmbeddedAccountOperationRestrictionTransactionV1 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var embeddedTransactionHeaderReserved_1 = br.ReadUInt32();
		if (0 != embeddedTransactionHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({embeddedTransactionHeaderReserved_1})");
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = TransactionType.Deserialize(br);
		var restrictionFlags = AccountRestrictionFlags.Deserialize(br);
		var restrictionAdditionsCount = br.ReadByte();
		var restrictionDeletionsCount = br.ReadByte();
		var accountRestrictionTransactionBodyReserved_1 = br.ReadUInt32();
		if (0 != accountRestrictionTransactionBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({accountRestrictionTransactionBodyReserved_1})");
		var restrictionAdditions = ArrayHelpers.ReadArrayCount(br, TransactionType.Deserialize, (byte)restrictionAdditionsCount);
		var restrictionDeletions = ArrayHelpers.ReadArrayCount(br, TransactionType.Deserialize, (byte)restrictionDeletionsCount);

		var instance = new EmbeddedAccountOperationRestrictionTransactionV1(
			signerPublicKey,
			version,
			network,
			type,
			restrictionFlags,
			restrictionAdditions,
			restrictionDeletions);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(EmbeddedTransactionHeaderReserved_1)); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(RestrictionFlags.Serialize()); 
		bw.Write((byte)RestrictionAdditions.Length);  // bound: restriction_additions_count
		bw.Write((byte)RestrictionDeletions.Length);  // bound: restriction_deletions_count
		bw.Write(BitConverter.GetBytes(AccountRestrictionTransactionBodyReserved_1)); 
		Sort();
		ArrayHelpers.WriteArray(bw, RestrictionAdditions);
		Sort();
		ArrayHelpers.WriteArray(bw, RestrictionDeletions);
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"restrictionFlags: {RestrictionFlags}, ";
		result += $"restrictionAdditions: [{string.Join(",", RestrictionAdditions.Select(e => e.ToString()))}], ";
		result += $"restrictionDeletions: [{string.Join(",", RestrictionDeletions.Select(e => e.ToString()))}], ";
		result += ")";
		return result;
	}
}

public class MosaicAddressRestrictionTransactionV1 : ITransaction {
	public const byte TRANSACTION_VERSION = 1;

	public static readonly TransactionType TRANSACTION_TYPE = TransactionType.MOSAIC_ADDRESS_RESTRICTION;

	private readonly uint VerifiableEntityHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;

	public MosaicAddressRestrictionTransactionV1(
	    Signature? signature = null,
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    TransactionType? type = null,
	    Amount? fee = null,
	    Timestamp? deadline = null,
	    UnresolvedMosaicId? mosaicId = null,
	    ulong? restrictionKey = null,
	    ulong? previousRestrictionValue = null,
	    ulong? newRestrictionValue = null,
	    UnresolvedAddress? targetAddress = null
	) {
		Signature = signature ?? new Signature();
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? MosaicAddressRestrictionTransactionV1.TRANSACTION_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? MosaicAddressRestrictionTransactionV1.TRANSACTION_TYPE;
		Fee = fee ?? new Amount();
		Deadline = deadline ?? new Timestamp();
		MosaicId = mosaicId ?? new UnresolvedMosaicId();
		RestrictionKey = restrictionKey ?? 0;
		PreviousRestrictionValue = previousRestrictionValue ?? 0;
		NewRestrictionValue = newRestrictionValue ?? 0;
		TargetAddress = targetAddress ?? new UnresolvedAddress();
		VerifiableEntityHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
	}

	public void Sort() {
	}

	public Signature Signature {
		get; set;
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public TransactionType Type {
		get; set;
	}

	public Amount Fee {
		get; set;
	}

	public Timestamp Deadline {
		get; set;
	}

	public UnresolvedMosaicId MosaicId {
		get; set;
	}

	public ulong RestrictionKey {
		get; set;
	}

	public ulong PreviousRestrictionValue {
		get; set;
	}

	public ulong NewRestrictionValue {
		get; set;
	}

	public UnresolvedAddress TargetAddress {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += Signature.Size;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += Fee.Size;
			size += Deadline.Size;
			size += MosaicId.Size;
			size += 8;
			size += 8;
			size += 8;
			size += TargetAddress.Size;
			return size;
		}
	}

	public static MosaicAddressRestrictionTransactionV1 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var verifiableEntityHeaderReserved_1 = br.ReadUInt32();
		if (0 != verifiableEntityHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({verifiableEntityHeaderReserved_1})");
		var signature = Signature.Deserialize(br);
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = TransactionType.Deserialize(br);
		var fee = Amount.Deserialize(br);
		var deadline = Timestamp.Deserialize(br);
		var mosaicId = UnresolvedMosaicId.Deserialize(br);
		var restrictionKey = br.ReadUInt64();
		var previousRestrictionValue = br.ReadUInt64();
		var newRestrictionValue = br.ReadUInt64();
		var targetAddress = UnresolvedAddress.Deserialize(br);

		var instance = new MosaicAddressRestrictionTransactionV1(
			signature,
			signerPublicKey,
			version,
			network,
			type,
			fee,
			deadline,
			mosaicId,
			restrictionKey,
			previousRestrictionValue,
			newRestrictionValue,
			targetAddress);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(VerifiableEntityHeaderReserved_1)); 
		bw.Write(Signature.Serialize()); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(Fee.Serialize()); 
		bw.Write(Deadline.Serialize()); 
		bw.Write(MosaicId.Serialize()); 
		bw.Write(BitConverter.GetBytes(RestrictionKey)); 
		bw.Write(BitConverter.GetBytes(PreviousRestrictionValue)); 
		bw.Write(BitConverter.GetBytes(NewRestrictionValue)); 
		bw.Write(TargetAddress.Serialize()); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signature: {Signature}, ";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"fee: {Fee}, ";
		result += $"deadline: {Deadline}, ";
		result += $"mosaicId: {MosaicId}, ";
		result += $"restrictionKey: {Converter.ToString(RestrictionKey)}, ";
		result += $"previousRestrictionValue: {Converter.ToString(PreviousRestrictionValue)}, ";
		result += $"newRestrictionValue: {Converter.ToString(NewRestrictionValue)}, ";
		result += $"targetAddress: {TargetAddress}, ";
		result += ")";
		return result;
	}
}

public class EmbeddedMosaicAddressRestrictionTransactionV1 : IBaseTransaction {
	public const byte TRANSACTION_VERSION = 1;

	public static readonly TransactionType TRANSACTION_TYPE = TransactionType.MOSAIC_ADDRESS_RESTRICTION;

	private readonly uint EmbeddedTransactionHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;

	public EmbeddedMosaicAddressRestrictionTransactionV1(
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    TransactionType? type = null,
	    UnresolvedMosaicId? mosaicId = null,
	    ulong? restrictionKey = null,
	    ulong? previousRestrictionValue = null,
	    ulong? newRestrictionValue = null,
	    UnresolvedAddress? targetAddress = null
	) {
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? EmbeddedMosaicAddressRestrictionTransactionV1.TRANSACTION_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? EmbeddedMosaicAddressRestrictionTransactionV1.TRANSACTION_TYPE;
		MosaicId = mosaicId ?? new UnresolvedMosaicId();
		RestrictionKey = restrictionKey ?? 0;
		PreviousRestrictionValue = previousRestrictionValue ?? 0;
		NewRestrictionValue = newRestrictionValue ?? 0;
		TargetAddress = targetAddress ?? new UnresolvedAddress();
		EmbeddedTransactionHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
	}

	public void Sort() {
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public TransactionType Type {
		get; set;
	}

	public UnresolvedMosaicId MosaicId {
		get; set;
	}

	public ulong RestrictionKey {
		get; set;
	}

	public ulong PreviousRestrictionValue {
		get; set;
	}

	public ulong NewRestrictionValue {
		get; set;
	}

	public UnresolvedAddress TargetAddress {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += MosaicId.Size;
			size += 8;
			size += 8;
			size += 8;
			size += TargetAddress.Size;
			return size;
		}
	}

	public static EmbeddedMosaicAddressRestrictionTransactionV1 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var embeddedTransactionHeaderReserved_1 = br.ReadUInt32();
		if (0 != embeddedTransactionHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({embeddedTransactionHeaderReserved_1})");
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = TransactionType.Deserialize(br);
		var mosaicId = UnresolvedMosaicId.Deserialize(br);
		var restrictionKey = br.ReadUInt64();
		var previousRestrictionValue = br.ReadUInt64();
		var newRestrictionValue = br.ReadUInt64();
		var targetAddress = UnresolvedAddress.Deserialize(br);

		var instance = new EmbeddedMosaicAddressRestrictionTransactionV1(
			signerPublicKey,
			version,
			network,
			type,
			mosaicId,
			restrictionKey,
			previousRestrictionValue,
			newRestrictionValue,
			targetAddress);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(EmbeddedTransactionHeaderReserved_1)); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(MosaicId.Serialize()); 
		bw.Write(BitConverter.GetBytes(RestrictionKey)); 
		bw.Write(BitConverter.GetBytes(PreviousRestrictionValue)); 
		bw.Write(BitConverter.GetBytes(NewRestrictionValue)); 
		bw.Write(TargetAddress.Serialize()); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"mosaicId: {MosaicId}, ";
		result += $"restrictionKey: {Converter.ToString(RestrictionKey)}, ";
		result += $"previousRestrictionValue: {Converter.ToString(PreviousRestrictionValue)}, ";
		result += $"newRestrictionValue: {Converter.ToString(NewRestrictionValue)}, ";
		result += $"targetAddress: {TargetAddress}, ";
		result += ")";
		return result;
	}
}

public class MosaicRestrictionKey : BaseValue, ISerializer {
	public const byte SIZE = 8;

	public MosaicRestrictionKey(object? mosaicRestrictionKey = null): base(SIZE, mosaicRestrictionKey) {
	}

	public static MosaicRestrictionKey Deserialize(BinaryReader br) {
		return new MosaicRestrictionKey(br.ReadUInt64());
	}

	public byte[] Serialize() {
		return BitConverter.GetBytes(Value);
	}
}

public class MosaicRestrictionType : IEnum<byte> {
	public static readonly MosaicRestrictionType NONE = new MosaicRestrictionType(0);

	public static readonly MosaicRestrictionType EQ = new MosaicRestrictionType(1);

	public static readonly MosaicRestrictionType NE = new MosaicRestrictionType(2);

	public static readonly MosaicRestrictionType LT = new MosaicRestrictionType(3);

	public static readonly MosaicRestrictionType LE = new MosaicRestrictionType(4);

	public static readonly MosaicRestrictionType GT = new MosaicRestrictionType(5);

	public static readonly MosaicRestrictionType GE = new MosaicRestrictionType(6);

	public byte Value { get; }

	public MosaicRestrictionType(byte value = 0) {
		Value = value;
	}

	internal static string ValueToKey(uint value) {
		var values = new uint[]{
			0, 1, 2, 3, 4, 5, 6
		};
		var keys = new []{
			"NONE", "EQ", "NE", "LT", "LE", "GT", "GE"
		};

		var index = Array.IndexOf(values, value);
		if (-1 == index)
			throw new Exception($"invalid enum value {value}");

		return keys[index];
	}

	internal static MosaicRestrictionType FromValue(uint value) {
		return value switch
		{
			0 => NONE,
			1 => EQ,
			2 => NE,
			3 => LT,
			4 => LE,
			5 => GT,
			6 => GE,
			_ => throw new Exception($"invalid enum value {value}")
		};
	}

	public uint Size {
		get {
			return 1;
		}
	}

	public static MosaicRestrictionType Deserialize(BinaryReader br) {
		return FromValue(br.ReadByte());
	}

	public byte[] Serialize() {
		return new []{Value};
	}

	public override string ToString() {
		return $"MosaicRestrictionType.{ValueToKey(Value)}";
	}
}

public class MosaicGlobalRestrictionTransactionV1 : ITransaction {
	public const byte TRANSACTION_VERSION = 1;

	public static readonly TransactionType TRANSACTION_TYPE = TransactionType.MOSAIC_GLOBAL_RESTRICTION;

	private readonly uint VerifiableEntityHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;

	public MosaicGlobalRestrictionTransactionV1(
	    Signature? signature = null,
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    TransactionType? type = null,
	    Amount? fee = null,
	    Timestamp? deadline = null,
	    UnresolvedMosaicId? mosaicId = null,
	    UnresolvedMosaicId? referenceMosaicId = null,
	    ulong? restrictionKey = null,
	    ulong? previousRestrictionValue = null,
	    ulong? newRestrictionValue = null,
	    MosaicRestrictionType? previousRestrictionType = null,
	    MosaicRestrictionType? newRestrictionType = null
	) {
		Signature = signature ?? new Signature();
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? MosaicGlobalRestrictionTransactionV1.TRANSACTION_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? MosaicGlobalRestrictionTransactionV1.TRANSACTION_TYPE;
		Fee = fee ?? new Amount();
		Deadline = deadline ?? new Timestamp();
		MosaicId = mosaicId ?? new UnresolvedMosaicId();
		ReferenceMosaicId = referenceMosaicId ?? new UnresolvedMosaicId();
		RestrictionKey = restrictionKey ?? 0;
		PreviousRestrictionValue = previousRestrictionValue ?? 0;
		NewRestrictionValue = newRestrictionValue ?? 0;
		PreviousRestrictionType = previousRestrictionType ?? MosaicRestrictionType.NONE;
		NewRestrictionType = newRestrictionType ?? MosaicRestrictionType.NONE;
		VerifiableEntityHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
	}

	public void Sort() {
	}

	public Signature Signature {
		get; set;
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public TransactionType Type {
		get; set;
	}

	public Amount Fee {
		get; set;
	}

	public Timestamp Deadline {
		get; set;
	}

	public UnresolvedMosaicId MosaicId {
		get; set;
	}

	public UnresolvedMosaicId ReferenceMosaicId {
		get; set;
	}

	public ulong RestrictionKey {
		get; set;
	}

	public ulong PreviousRestrictionValue {
		get; set;
	}

	public ulong NewRestrictionValue {
		get; set;
	}

	public MosaicRestrictionType PreviousRestrictionType {
		get; set;
	}

	public MosaicRestrictionType NewRestrictionType {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += Signature.Size;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += Fee.Size;
			size += Deadline.Size;
			size += MosaicId.Size;
			size += ReferenceMosaicId.Size;
			size += 8;
			size += 8;
			size += 8;
			size += PreviousRestrictionType.Size;
			size += NewRestrictionType.Size;
			return size;
		}
	}

	public static MosaicGlobalRestrictionTransactionV1 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var verifiableEntityHeaderReserved_1 = br.ReadUInt32();
		if (0 != verifiableEntityHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({verifiableEntityHeaderReserved_1})");
		var signature = Signature.Deserialize(br);
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = TransactionType.Deserialize(br);
		var fee = Amount.Deserialize(br);
		var deadline = Timestamp.Deserialize(br);
		var mosaicId = UnresolvedMosaicId.Deserialize(br);
		var referenceMosaicId = UnresolvedMosaicId.Deserialize(br);
		var restrictionKey = br.ReadUInt64();
		var previousRestrictionValue = br.ReadUInt64();
		var newRestrictionValue = br.ReadUInt64();
		var previousRestrictionType = MosaicRestrictionType.Deserialize(br);
		var newRestrictionType = MosaicRestrictionType.Deserialize(br);

		var instance = new MosaicGlobalRestrictionTransactionV1(
			signature,
			signerPublicKey,
			version,
			network,
			type,
			fee,
			deadline,
			mosaicId,
			referenceMosaicId,
			restrictionKey,
			previousRestrictionValue,
			newRestrictionValue,
			previousRestrictionType,
			newRestrictionType);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(VerifiableEntityHeaderReserved_1)); 
		bw.Write(Signature.Serialize()); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(Fee.Serialize()); 
		bw.Write(Deadline.Serialize()); 
		bw.Write(MosaicId.Serialize()); 
		bw.Write(ReferenceMosaicId.Serialize()); 
		bw.Write(BitConverter.GetBytes(RestrictionKey)); 
		bw.Write(BitConverter.GetBytes(PreviousRestrictionValue)); 
		bw.Write(BitConverter.GetBytes(NewRestrictionValue)); 
		bw.Write(PreviousRestrictionType.Serialize()); 
		bw.Write(NewRestrictionType.Serialize()); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signature: {Signature}, ";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"fee: {Fee}, ";
		result += $"deadline: {Deadline}, ";
		result += $"mosaicId: {MosaicId}, ";
		result += $"referenceMosaicId: {ReferenceMosaicId}, ";
		result += $"restrictionKey: {Converter.ToString(RestrictionKey)}, ";
		result += $"previousRestrictionValue: {Converter.ToString(PreviousRestrictionValue)}, ";
		result += $"newRestrictionValue: {Converter.ToString(NewRestrictionValue)}, ";
		result += $"previousRestrictionType: {PreviousRestrictionType}, ";
		result += $"newRestrictionType: {NewRestrictionType}, ";
		result += ")";
		return result;
	}
}

public class EmbeddedMosaicGlobalRestrictionTransactionV1 : IBaseTransaction {
	public const byte TRANSACTION_VERSION = 1;

	public static readonly TransactionType TRANSACTION_TYPE = TransactionType.MOSAIC_GLOBAL_RESTRICTION;

	private readonly uint EmbeddedTransactionHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;

	public EmbeddedMosaicGlobalRestrictionTransactionV1(
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    TransactionType? type = null,
	    UnresolvedMosaicId? mosaicId = null,
	    UnresolvedMosaicId? referenceMosaicId = null,
	    ulong? restrictionKey = null,
	    ulong? previousRestrictionValue = null,
	    ulong? newRestrictionValue = null,
	    MosaicRestrictionType? previousRestrictionType = null,
	    MosaicRestrictionType? newRestrictionType = null
	) {
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? EmbeddedMosaicGlobalRestrictionTransactionV1.TRANSACTION_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? EmbeddedMosaicGlobalRestrictionTransactionV1.TRANSACTION_TYPE;
		MosaicId = mosaicId ?? new UnresolvedMosaicId();
		ReferenceMosaicId = referenceMosaicId ?? new UnresolvedMosaicId();
		RestrictionKey = restrictionKey ?? 0;
		PreviousRestrictionValue = previousRestrictionValue ?? 0;
		NewRestrictionValue = newRestrictionValue ?? 0;
		PreviousRestrictionType = previousRestrictionType ?? MosaicRestrictionType.NONE;
		NewRestrictionType = newRestrictionType ?? MosaicRestrictionType.NONE;
		EmbeddedTransactionHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
	}

	public void Sort() {
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public TransactionType Type {
		get; set;
	}

	public UnresolvedMosaicId MosaicId {
		get; set;
	}

	public UnresolvedMosaicId ReferenceMosaicId {
		get; set;
	}

	public ulong RestrictionKey {
		get; set;
	}

	public ulong PreviousRestrictionValue {
		get; set;
	}

	public ulong NewRestrictionValue {
		get; set;
	}

	public MosaicRestrictionType PreviousRestrictionType {
		get; set;
	}

	public MosaicRestrictionType NewRestrictionType {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += MosaicId.Size;
			size += ReferenceMosaicId.Size;
			size += 8;
			size += 8;
			size += 8;
			size += PreviousRestrictionType.Size;
			size += NewRestrictionType.Size;
			return size;
		}
	}

	public static EmbeddedMosaicGlobalRestrictionTransactionV1 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var embeddedTransactionHeaderReserved_1 = br.ReadUInt32();
		if (0 != embeddedTransactionHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({embeddedTransactionHeaderReserved_1})");
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = TransactionType.Deserialize(br);
		var mosaicId = UnresolvedMosaicId.Deserialize(br);
		var referenceMosaicId = UnresolvedMosaicId.Deserialize(br);
		var restrictionKey = br.ReadUInt64();
		var previousRestrictionValue = br.ReadUInt64();
		var newRestrictionValue = br.ReadUInt64();
		var previousRestrictionType = MosaicRestrictionType.Deserialize(br);
		var newRestrictionType = MosaicRestrictionType.Deserialize(br);

		var instance = new EmbeddedMosaicGlobalRestrictionTransactionV1(
			signerPublicKey,
			version,
			network,
			type,
			mosaicId,
			referenceMosaicId,
			restrictionKey,
			previousRestrictionValue,
			newRestrictionValue,
			previousRestrictionType,
			newRestrictionType);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(EmbeddedTransactionHeaderReserved_1)); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(MosaicId.Serialize()); 
		bw.Write(ReferenceMosaicId.Serialize()); 
		bw.Write(BitConverter.GetBytes(RestrictionKey)); 
		bw.Write(BitConverter.GetBytes(PreviousRestrictionValue)); 
		bw.Write(BitConverter.GetBytes(NewRestrictionValue)); 
		bw.Write(PreviousRestrictionType.Serialize()); 
		bw.Write(NewRestrictionType.Serialize()); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"mosaicId: {MosaicId}, ";
		result += $"referenceMosaicId: {ReferenceMosaicId}, ";
		result += $"restrictionKey: {Converter.ToString(RestrictionKey)}, ";
		result += $"previousRestrictionValue: {Converter.ToString(PreviousRestrictionValue)}, ";
		result += $"newRestrictionValue: {Converter.ToString(NewRestrictionValue)}, ";
		result += $"previousRestrictionType: {PreviousRestrictionType}, ";
		result += $"newRestrictionType: {NewRestrictionType}, ";
		result += ")";
		return result;
	}
}

public class TransferTransactionV1 : ITransaction {
	public const byte TRANSACTION_VERSION = 1;

	public static readonly TransactionType TRANSACTION_TYPE = TransactionType.TRANSFER;

	private readonly uint VerifiableEntityHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;
	private readonly byte TransferTransactionBodyReserved_1;
	private readonly uint TransferTransactionBodyReserved_2;

	public TransferTransactionV1(
	    Signature? signature = null,
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    TransactionType? type = null,
	    Amount? fee = null,
	    Timestamp? deadline = null,
	    UnresolvedAddress? recipientAddress = null,
	    UnresolvedMosaic[]? mosaics = null,
	    byte[]? message = null
	) {
		Signature = signature ?? new Signature();
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? TransferTransactionV1.TRANSACTION_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? TransferTransactionV1.TRANSACTION_TYPE;
		Fee = fee ?? new Amount();
		Deadline = deadline ?? new Timestamp();
		RecipientAddress = recipientAddress ?? new UnresolvedAddress();
		Mosaics = mosaics ?? Array.Empty<UnresolvedMosaic>();
		Message = message ?? Array.Empty<byte>();
		VerifiableEntityHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
		TransferTransactionBodyReserved_1 = 0; // reserved field
		TransferTransactionBodyReserved_2 = 0; // reserved field
	}

	public void Sort() {
		Array.Sort(Mosaics, (lhs, rhs) => 
			ArrayHelpers.DeepCompare(ArrayHelpers.GetValue(lhs.MosaicId), ArrayHelpers.GetValue(rhs.MosaicId)));
	}

	public Signature Signature {
		get; set;
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public TransactionType Type {
		get; set;
	}

	public Amount Fee {
		get; set;
	}

	public Timestamp Deadline {
		get; set;
	}

	public UnresolvedAddress RecipientAddress {
		get; set;
	}

	public UnresolvedMosaic[] Mosaics {
		get; set;
	}

	public byte[] Message {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += Signature.Size;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += Fee.Size;
			size += Deadline.Size;
			size += RecipientAddress.Size;
			size += 2;
			size += 1;
			size += 1;
			size += 4;
			size += ArrayHelpers.Size(Mosaics);
			size += (uint)Message.Length;
			return size;
		}
	}

	public static TransferTransactionV1 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var verifiableEntityHeaderReserved_1 = br.ReadUInt32();
		if (0 != verifiableEntityHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({verifiableEntityHeaderReserved_1})");
		var signature = Signature.Deserialize(br);
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = TransactionType.Deserialize(br);
		var fee = Amount.Deserialize(br);
		var deadline = Timestamp.Deserialize(br);
		var recipientAddress = UnresolvedAddress.Deserialize(br);
		var messageSize = br.ReadUInt16();
		var mosaicsCount = br.ReadByte();
		var transferTransactionBodyReserved_1 = br.ReadByte();
		if (0 != transferTransactionBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({transferTransactionBodyReserved_1})");
		var transferTransactionBodyReserved_2 = br.ReadUInt32();
		if (0 != transferTransactionBodyReserved_2)
			throw new Exception($"Invalid value of reserved field ({transferTransactionBodyReserved_2})");
		var mosaics = ArrayHelpers.ReadArrayCount(br, UnresolvedMosaic.Deserialize, (byte)mosaicsCount);
		var message = br.ReadBytes((int)messageSize);

		var instance = new TransferTransactionV1(
			signature,
			signerPublicKey,
			version,
			network,
			type,
			fee,
			deadline,
			recipientAddress,
			mosaics,
			message);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(VerifiableEntityHeaderReserved_1)); 
		bw.Write(Signature.Serialize()); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(Fee.Serialize()); 
		bw.Write(Deadline.Serialize()); 
		bw.Write(RecipientAddress.Serialize()); 
		bw.Write(BitConverter.GetBytes((ushort)Message.Length));  // bound: message_size
		bw.Write((byte)Mosaics.Length);  // bound: mosaics_count
		bw.Write(TransferTransactionBodyReserved_1); 
		bw.Write(BitConverter.GetBytes(TransferTransactionBodyReserved_2)); 
		Sort();
		ArrayHelpers.WriteArray(bw, Mosaics);
		bw.Write(Message); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signature: {Signature}, ";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"fee: {Fee}, ";
		result += $"deadline: {Deadline}, ";
		result += $"recipientAddress: {RecipientAddress}, ";
		result += $"mosaics: [{string.Join(",", Mosaics.Select(e => e.ToString()))}], ";
		result += $"message: hex({Converter.BytesToHex(Message)}), ";
		result += ")";
		return result;
	}
}

public class EmbeddedTransferTransactionV1 : IBaseTransaction {
	public const byte TRANSACTION_VERSION = 1;

	public static readonly TransactionType TRANSACTION_TYPE = TransactionType.TRANSFER;

	private readonly uint EmbeddedTransactionHeaderReserved_1;
	private readonly uint EntityBodyReserved_1;
	private readonly byte TransferTransactionBodyReserved_1;
	private readonly uint TransferTransactionBodyReserved_2;

	public EmbeddedTransferTransactionV1(
	    PublicKey? signerPublicKey = null,
	    byte? version = null,
	    NetworkType? network = null,
	    TransactionType? type = null,
	    UnresolvedAddress? recipientAddress = null,
	    UnresolvedMosaic[]? mosaics = null,
	    byte[]? message = null
	) {
		SignerPublicKey = signerPublicKey ?? new PublicKey();
		Version = version ?? EmbeddedTransferTransactionV1.TRANSACTION_VERSION;
		Network = network ?? NetworkType.MAINNET;
		Type = type ?? EmbeddedTransferTransactionV1.TRANSACTION_TYPE;
		RecipientAddress = recipientAddress ?? new UnresolvedAddress();
		Mosaics = mosaics ?? Array.Empty<UnresolvedMosaic>();
		Message = message ?? Array.Empty<byte>();
		EmbeddedTransactionHeaderReserved_1 = 0; // reserved field
		EntityBodyReserved_1 = 0; // reserved field
		TransferTransactionBodyReserved_1 = 0; // reserved field
		TransferTransactionBodyReserved_2 = 0; // reserved field
	}

	public void Sort() {
		Array.Sort(Mosaics, (lhs, rhs) => 
			ArrayHelpers.DeepCompare(ArrayHelpers.GetValue(lhs.MosaicId), ArrayHelpers.GetValue(rhs.MosaicId)));
	}

	public PublicKey SignerPublicKey {
		get; set;
	}

	public byte Version {
		get; set;
	}

	public NetworkType Network {
		get; set;
	}

	public TransactionType Type {
		get; set;
	}

	public UnresolvedAddress RecipientAddress {
		get; set;
	}

	public UnresolvedMosaic[] Mosaics {
		get; set;
	}

	public byte[] Message {
		get; set;
	}

	public uint Size {
		get {
			uint size = 0;
			size += 4;
			size += 4;
			size += SignerPublicKey.Size;
			size += 4;
			size += 1;
			size += Network.Size;
			size += Type.Size;
			size += RecipientAddress.Size;
			size += 2;
			size += 1;
			size += 1;
			size += 4;
			size += ArrayHelpers.Size(Mosaics);
			size += (uint)Message.Length;
			return size;
		}
	}

	public static EmbeddedTransferTransactionV1 Deserialize(BinaryReader br) {
		var size = br.ReadUInt32();
		br = new BinaryReader(new MemoryStream(br.ReadBytes((int) size - 4)));
		var embeddedTransactionHeaderReserved_1 = br.ReadUInt32();
		if (0 != embeddedTransactionHeaderReserved_1)
			throw new Exception($"Invalid value of reserved field ({embeddedTransactionHeaderReserved_1})");
		var signerPublicKey = PublicKey.Deserialize(br);
		var entityBodyReserved_1 = br.ReadUInt32();
		if (0 != entityBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({entityBodyReserved_1})");
		var version = br.ReadByte();
		var network = NetworkType.Deserialize(br);
		var type = TransactionType.Deserialize(br);
		var recipientAddress = UnresolvedAddress.Deserialize(br);
		var messageSize = br.ReadUInt16();
		var mosaicsCount = br.ReadByte();
		var transferTransactionBodyReserved_1 = br.ReadByte();
		if (0 != transferTransactionBodyReserved_1)
			throw new Exception($"Invalid value of reserved field ({transferTransactionBodyReserved_1})");
		var transferTransactionBodyReserved_2 = br.ReadUInt32();
		if (0 != transferTransactionBodyReserved_2)
			throw new Exception($"Invalid value of reserved field ({transferTransactionBodyReserved_2})");
		var mosaics = ArrayHelpers.ReadArrayCount(br, UnresolvedMosaic.Deserialize, (byte)mosaicsCount);
		var message = br.ReadBytes((int)messageSize);

		var instance = new EmbeddedTransferTransactionV1(
			signerPublicKey,
			version,
			network,
			type,
			recipientAddress,
			mosaics,
			message);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes(EmbeddedTransactionHeaderReserved_1)); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes(EntityBodyReserved_1)); 
		bw.Write(Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(RecipientAddress.Serialize()); 
		bw.Write(BitConverter.GetBytes((ushort)Message.Length));  // bound: message_size
		bw.Write((byte)Mosaics.Length);  // bound: mosaics_count
		bw.Write(TransferTransactionBodyReserved_1); 
		bw.Write(BitConverter.GetBytes(TransferTransactionBodyReserved_2)); 
		Sort();
		ArrayHelpers.WriteArray(bw, Mosaics);
		bw.Write(Message); 
		return ms.ToArray();
	}

	public override string ToString() {
		var result = "(";
		result += $"signerPublicKey: {SignerPublicKey}, ";
		result += $"version: {Converter.ToString(Version)}, ";
		result += $"network: {Network}, ";
		result += $"type: {Type}, ";
		result += $"recipientAddress: {RecipientAddress}, ";
		result += $"mosaics: [{string.Join(",", Mosaics.Select(e => e.ToString()))}], ";
		result += $"message: hex({Converter.BytesToHex(Message)}), ";
		result += ")";
		return result;
	}
}

public class TransactionFactory : IDeserializer {
	public static ulong ToKey(uint[] values) {
		if (values.Length == 1)
			return (ulong)values[0];

		// assume each key is at most 32bits
		return values.Aggregate(0UL, (accumulator, value) => (accumulator << 32) + (ulong)value);
	}

	public static ITransaction Deserialize(BinaryReader br) {
		var position = br.BaseStream.Position;
		var parent = Transaction.Deserialize(br);
		var mapping = new Dictionary<ulong, Func<BinaryReader, ITransaction>>
		{
			{ToKey(new uint[]{AccountKeyLinkTransactionV1.TRANSACTION_TYPE.Value, AccountKeyLinkTransactionV1.TRANSACTION_VERSION}), AccountKeyLinkTransactionV1.Deserialize},
			{ToKey(new uint[]{NodeKeyLinkTransactionV1.TRANSACTION_TYPE.Value, NodeKeyLinkTransactionV1.TRANSACTION_VERSION}), NodeKeyLinkTransactionV1.Deserialize},
			{ToKey(new uint[]{AggregateCompleteTransactionV1.TRANSACTION_TYPE.Value, AggregateCompleteTransactionV1.TRANSACTION_VERSION}), AggregateCompleteTransactionV1.Deserialize},
			{ToKey(new uint[]{AggregateCompleteTransactionV2.TRANSACTION_TYPE.Value, AggregateCompleteTransactionV2.TRANSACTION_VERSION}), AggregateCompleteTransactionV2.Deserialize},
			{ToKey(new uint[]{AggregateBondedTransactionV1.TRANSACTION_TYPE.Value, AggregateBondedTransactionV1.TRANSACTION_VERSION}), AggregateBondedTransactionV1.Deserialize},
			{ToKey(new uint[]{AggregateBondedTransactionV2.TRANSACTION_TYPE.Value, AggregateBondedTransactionV2.TRANSACTION_VERSION}), AggregateBondedTransactionV2.Deserialize},
			{ToKey(new uint[]{VotingKeyLinkTransactionV1.TRANSACTION_TYPE.Value, VotingKeyLinkTransactionV1.TRANSACTION_VERSION}), VotingKeyLinkTransactionV1.Deserialize},
			{ToKey(new uint[]{VrfKeyLinkTransactionV1.TRANSACTION_TYPE.Value, VrfKeyLinkTransactionV1.TRANSACTION_VERSION}), VrfKeyLinkTransactionV1.Deserialize},
			{ToKey(new uint[]{HashLockTransactionV1.TRANSACTION_TYPE.Value, HashLockTransactionV1.TRANSACTION_VERSION}), HashLockTransactionV1.Deserialize},
			{ToKey(new uint[]{SecretLockTransactionV1.TRANSACTION_TYPE.Value, SecretLockTransactionV1.TRANSACTION_VERSION}), SecretLockTransactionV1.Deserialize},
			{ToKey(new uint[]{SecretProofTransactionV1.TRANSACTION_TYPE.Value, SecretProofTransactionV1.TRANSACTION_VERSION}), SecretProofTransactionV1.Deserialize},
			{ToKey(new uint[]{AccountMetadataTransactionV1.TRANSACTION_TYPE.Value, AccountMetadataTransactionV1.TRANSACTION_VERSION}), AccountMetadataTransactionV1.Deserialize},
			{ToKey(new uint[]{MosaicMetadataTransactionV1.TRANSACTION_TYPE.Value, MosaicMetadataTransactionV1.TRANSACTION_VERSION}), MosaicMetadataTransactionV1.Deserialize},
			{ToKey(new uint[]{NamespaceMetadataTransactionV1.TRANSACTION_TYPE.Value, NamespaceMetadataTransactionV1.TRANSACTION_VERSION}), NamespaceMetadataTransactionV1.Deserialize},
			{ToKey(new uint[]{MosaicDefinitionTransactionV1.TRANSACTION_TYPE.Value, MosaicDefinitionTransactionV1.TRANSACTION_VERSION}), MosaicDefinitionTransactionV1.Deserialize},
			{ToKey(new uint[]{MosaicSupplyChangeTransactionV1.TRANSACTION_TYPE.Value, MosaicSupplyChangeTransactionV1.TRANSACTION_VERSION}), MosaicSupplyChangeTransactionV1.Deserialize},
			{ToKey(new uint[]{MosaicSupplyRevocationTransactionV1.TRANSACTION_TYPE.Value, MosaicSupplyRevocationTransactionV1.TRANSACTION_VERSION}), MosaicSupplyRevocationTransactionV1.Deserialize},
			{ToKey(new uint[]{MultisigAccountModificationTransactionV1.TRANSACTION_TYPE.Value, MultisigAccountModificationTransactionV1.TRANSACTION_VERSION}), MultisigAccountModificationTransactionV1.Deserialize},
			{ToKey(new uint[]{AddressAliasTransactionV1.TRANSACTION_TYPE.Value, AddressAliasTransactionV1.TRANSACTION_VERSION}), AddressAliasTransactionV1.Deserialize},
			{ToKey(new uint[]{MosaicAliasTransactionV1.TRANSACTION_TYPE.Value, MosaicAliasTransactionV1.TRANSACTION_VERSION}), MosaicAliasTransactionV1.Deserialize},
			{ToKey(new uint[]{NamespaceRegistrationTransactionV1.TRANSACTION_TYPE.Value, NamespaceRegistrationTransactionV1.TRANSACTION_VERSION}), NamespaceRegistrationTransactionV1.Deserialize},
			{ToKey(new uint[]{AccountAddressRestrictionTransactionV1.TRANSACTION_TYPE.Value, AccountAddressRestrictionTransactionV1.TRANSACTION_VERSION}), AccountAddressRestrictionTransactionV1.Deserialize},
			{ToKey(new uint[]{AccountMosaicRestrictionTransactionV1.TRANSACTION_TYPE.Value, AccountMosaicRestrictionTransactionV1.TRANSACTION_VERSION}), AccountMosaicRestrictionTransactionV1.Deserialize},
			{ToKey(new uint[]{AccountOperationRestrictionTransactionV1.TRANSACTION_TYPE.Value, AccountOperationRestrictionTransactionV1.TRANSACTION_VERSION}), AccountOperationRestrictionTransactionV1.Deserialize},
			{ToKey(new uint[]{MosaicAddressRestrictionTransactionV1.TRANSACTION_TYPE.Value, MosaicAddressRestrictionTransactionV1.TRANSACTION_VERSION}), MosaicAddressRestrictionTransactionV1.Deserialize},
			{ToKey(new uint[]{MosaicGlobalRestrictionTransactionV1.TRANSACTION_TYPE.Value, MosaicGlobalRestrictionTransactionV1.TRANSACTION_VERSION}), MosaicGlobalRestrictionTransactionV1.Deserialize},
			{ToKey(new uint[]{TransferTransactionV1.TRANSACTION_TYPE.Value, TransferTransactionV1.TRANSACTION_VERSION}), TransferTransactionV1.Deserialize}
		};
		br.BaseStream.Position = position;
		return mapping[ToKey(new uint[]{parent.Type.Value, parent.Version})](br);
	}

	public static ITransaction Deserialize(string payload) {
		using var ms = new MemoryStream(Converter.HexToBytes(payload).ToArray());
		using var br = new BinaryReader(ms);
		return Deserialize(br);
	}

	public static ITransaction CreateByName(string entityName) {
		var mapping = new Dictionary<string, ITransaction>
		{
			{"account_key_link_transaction_v1", new AccountKeyLinkTransactionV1()},
			{"node_key_link_transaction_v1", new NodeKeyLinkTransactionV1()},
			{"aggregate_complete_transaction_v1", new AggregateCompleteTransactionV1()},
			{"aggregate_complete_transaction_v2", new AggregateCompleteTransactionV2()},
			{"aggregate_bonded_transaction_v1", new AggregateBondedTransactionV1()},
			{"aggregate_bonded_transaction_v2", new AggregateBondedTransactionV2()},
			{"voting_key_link_transaction_v1", new VotingKeyLinkTransactionV1()},
			{"vrf_key_link_transaction_v1", new VrfKeyLinkTransactionV1()},
			{"hash_lock_transaction_v1", new HashLockTransactionV1()},
			{"secret_lock_transaction_v1", new SecretLockTransactionV1()},
			{"secret_proof_transaction_v1", new SecretProofTransactionV1()},
			{"account_metadata_transaction_v1", new AccountMetadataTransactionV1()},
			{"mosaic_metadata_transaction_v1", new MosaicMetadataTransactionV1()},
			{"namespace_metadata_transaction_v1", new NamespaceMetadataTransactionV1()},
			{"mosaic_definition_transaction_v1", new MosaicDefinitionTransactionV1()},
			{"mosaic_supply_change_transaction_v1", new MosaicSupplyChangeTransactionV1()},
			{"mosaic_supply_revocation_transaction_v1", new MosaicSupplyRevocationTransactionV1()},
			{"multisig_account_modification_transaction_v1", new MultisigAccountModificationTransactionV1()},
			{"address_alias_transaction_v1", new AddressAliasTransactionV1()},
			{"mosaic_alias_transaction_v1", new MosaicAliasTransactionV1()},
			{"namespace_registration_transaction_v1", new NamespaceRegistrationTransactionV1()},
			{"account_address_restriction_transaction_v1", new AccountAddressRestrictionTransactionV1()},
			{"account_mosaic_restriction_transaction_v1", new AccountMosaicRestrictionTransactionV1()},
			{"account_operation_restriction_transaction_v1", new AccountOperationRestrictionTransactionV1()},
			{"mosaic_address_restriction_transaction_v1", new MosaicAddressRestrictionTransactionV1()},
			{"mosaic_global_restriction_transaction_v1", new MosaicGlobalRestrictionTransactionV1()},
			{"transfer_transaction_v1", new TransferTransactionV1()}

		};
		return mapping[entityName];
	}
}

public class EmbeddedTransactionFactory : IDeserializer {
	public static ulong ToKey(uint[] values) {
		if (values.Length == 1)
			return (ulong)values[0];

		// assume each key is at most 32bits
		return values.Aggregate(0UL, (accumulator, value) => (accumulator << 32) + (ulong)value);
	}

	public static IBaseTransaction Deserialize(BinaryReader br) {
		var position = br.BaseStream.Position;
		var parent = EmbeddedTransaction.Deserialize(br);
		var mapping = new Dictionary<ulong, Func<BinaryReader, IBaseTransaction>>
		{
			{ToKey(new uint[]{EmbeddedAccountKeyLinkTransactionV1.TRANSACTION_TYPE.Value, EmbeddedAccountKeyLinkTransactionV1.TRANSACTION_VERSION}), EmbeddedAccountKeyLinkTransactionV1.Deserialize},
			{ToKey(new uint[]{EmbeddedNodeKeyLinkTransactionV1.TRANSACTION_TYPE.Value, EmbeddedNodeKeyLinkTransactionV1.TRANSACTION_VERSION}), EmbeddedNodeKeyLinkTransactionV1.Deserialize},
			{ToKey(new uint[]{EmbeddedVotingKeyLinkTransactionV1.TRANSACTION_TYPE.Value, EmbeddedVotingKeyLinkTransactionV1.TRANSACTION_VERSION}), EmbeddedVotingKeyLinkTransactionV1.Deserialize},
			{ToKey(new uint[]{EmbeddedVrfKeyLinkTransactionV1.TRANSACTION_TYPE.Value, EmbeddedVrfKeyLinkTransactionV1.TRANSACTION_VERSION}), EmbeddedVrfKeyLinkTransactionV1.Deserialize},
			{ToKey(new uint[]{EmbeddedHashLockTransactionV1.TRANSACTION_TYPE.Value, EmbeddedHashLockTransactionV1.TRANSACTION_VERSION}), EmbeddedHashLockTransactionV1.Deserialize},
			{ToKey(new uint[]{EmbeddedSecretLockTransactionV1.TRANSACTION_TYPE.Value, EmbeddedSecretLockTransactionV1.TRANSACTION_VERSION}), EmbeddedSecretLockTransactionV1.Deserialize},
			{ToKey(new uint[]{EmbeddedSecretProofTransactionV1.TRANSACTION_TYPE.Value, EmbeddedSecretProofTransactionV1.TRANSACTION_VERSION}), EmbeddedSecretProofTransactionV1.Deserialize},
			{ToKey(new uint[]{EmbeddedAccountMetadataTransactionV1.TRANSACTION_TYPE.Value, EmbeddedAccountMetadataTransactionV1.TRANSACTION_VERSION}), EmbeddedAccountMetadataTransactionV1.Deserialize},
			{ToKey(new uint[]{EmbeddedMosaicMetadataTransactionV1.TRANSACTION_TYPE.Value, EmbeddedMosaicMetadataTransactionV1.TRANSACTION_VERSION}), EmbeddedMosaicMetadataTransactionV1.Deserialize},
			{ToKey(new uint[]{EmbeddedNamespaceMetadataTransactionV1.TRANSACTION_TYPE.Value, EmbeddedNamespaceMetadataTransactionV1.TRANSACTION_VERSION}), EmbeddedNamespaceMetadataTransactionV1.Deserialize},
			{ToKey(new uint[]{EmbeddedMosaicDefinitionTransactionV1.TRANSACTION_TYPE.Value, EmbeddedMosaicDefinitionTransactionV1.TRANSACTION_VERSION}), EmbeddedMosaicDefinitionTransactionV1.Deserialize},
			{ToKey(new uint[]{EmbeddedMosaicSupplyChangeTransactionV1.TRANSACTION_TYPE.Value, EmbeddedMosaicSupplyChangeTransactionV1.TRANSACTION_VERSION}), EmbeddedMosaicSupplyChangeTransactionV1.Deserialize},
			{ToKey(new uint[]{EmbeddedMosaicSupplyRevocationTransactionV1.TRANSACTION_TYPE.Value, EmbeddedMosaicSupplyRevocationTransactionV1.TRANSACTION_VERSION}), EmbeddedMosaicSupplyRevocationTransactionV1.Deserialize},
			{ToKey(new uint[]{EmbeddedMultisigAccountModificationTransactionV1.TRANSACTION_TYPE.Value, EmbeddedMultisigAccountModificationTransactionV1.TRANSACTION_VERSION}), EmbeddedMultisigAccountModificationTransactionV1.Deserialize},
			{ToKey(new uint[]{EmbeddedAddressAliasTransactionV1.TRANSACTION_TYPE.Value, EmbeddedAddressAliasTransactionV1.TRANSACTION_VERSION}), EmbeddedAddressAliasTransactionV1.Deserialize},
			{ToKey(new uint[]{EmbeddedMosaicAliasTransactionV1.TRANSACTION_TYPE.Value, EmbeddedMosaicAliasTransactionV1.TRANSACTION_VERSION}), EmbeddedMosaicAliasTransactionV1.Deserialize},
			{ToKey(new uint[]{EmbeddedNamespaceRegistrationTransactionV1.TRANSACTION_TYPE.Value, EmbeddedNamespaceRegistrationTransactionV1.TRANSACTION_VERSION}), EmbeddedNamespaceRegistrationTransactionV1.Deserialize},
			{ToKey(new uint[]{EmbeddedAccountAddressRestrictionTransactionV1.TRANSACTION_TYPE.Value, EmbeddedAccountAddressRestrictionTransactionV1.TRANSACTION_VERSION}), EmbeddedAccountAddressRestrictionTransactionV1.Deserialize},
			{ToKey(new uint[]{EmbeddedAccountMosaicRestrictionTransactionV1.TRANSACTION_TYPE.Value, EmbeddedAccountMosaicRestrictionTransactionV1.TRANSACTION_VERSION}), EmbeddedAccountMosaicRestrictionTransactionV1.Deserialize},
			{ToKey(new uint[]{EmbeddedAccountOperationRestrictionTransactionV1.TRANSACTION_TYPE.Value, EmbeddedAccountOperationRestrictionTransactionV1.TRANSACTION_VERSION}), EmbeddedAccountOperationRestrictionTransactionV1.Deserialize},
			{ToKey(new uint[]{EmbeddedMosaicAddressRestrictionTransactionV1.TRANSACTION_TYPE.Value, EmbeddedMosaicAddressRestrictionTransactionV1.TRANSACTION_VERSION}), EmbeddedMosaicAddressRestrictionTransactionV1.Deserialize},
			{ToKey(new uint[]{EmbeddedMosaicGlobalRestrictionTransactionV1.TRANSACTION_TYPE.Value, EmbeddedMosaicGlobalRestrictionTransactionV1.TRANSACTION_VERSION}), EmbeddedMosaicGlobalRestrictionTransactionV1.Deserialize},
			{ToKey(new uint[]{EmbeddedTransferTransactionV1.TRANSACTION_TYPE.Value, EmbeddedTransferTransactionV1.TRANSACTION_VERSION}), EmbeddedTransferTransactionV1.Deserialize}
		};
		br.BaseStream.Position = position;
		return mapping[ToKey(new uint[]{parent.Type.Value, parent.Version})](br);
	}

	public static IBaseTransaction Deserialize(string payload) {
		using var ms = new MemoryStream(Converter.HexToBytes(payload).ToArray());
		using var br = new BinaryReader(ms);
		return Deserialize(br);
	}

	public static IBaseTransaction CreateByName(string entityName) {
		var mapping = new Dictionary<string, IBaseTransaction>
		{
			{"account_key_link_transaction_v1", new EmbeddedAccountKeyLinkTransactionV1()},
			{"node_key_link_transaction_v1", new EmbeddedNodeKeyLinkTransactionV1()},
			{"voting_key_link_transaction_v1", new EmbeddedVotingKeyLinkTransactionV1()},
			{"vrf_key_link_transaction_v1", new EmbeddedVrfKeyLinkTransactionV1()},
			{"hash_lock_transaction_v1", new EmbeddedHashLockTransactionV1()},
			{"secret_lock_transaction_v1", new EmbeddedSecretLockTransactionV1()},
			{"secret_proof_transaction_v1", new EmbeddedSecretProofTransactionV1()},
			{"account_metadata_transaction_v1", new EmbeddedAccountMetadataTransactionV1()},
			{"mosaic_metadata_transaction_v1", new EmbeddedMosaicMetadataTransactionV1()},
			{"namespace_metadata_transaction_v1", new EmbeddedNamespaceMetadataTransactionV1()},
			{"mosaic_definition_transaction_v1", new EmbeddedMosaicDefinitionTransactionV1()},
			{"mosaic_supply_change_transaction_v1", new EmbeddedMosaicSupplyChangeTransactionV1()},
			{"mosaic_supply_revocation_transaction_v1", new EmbeddedMosaicSupplyRevocationTransactionV1()},
			{"multisig_account_modification_transaction_v1", new EmbeddedMultisigAccountModificationTransactionV1()},
			{"address_alias_transaction_v1", new EmbeddedAddressAliasTransactionV1()},
			{"mosaic_alias_transaction_v1", new EmbeddedMosaicAliasTransactionV1()},
			{"namespace_registration_transaction_v1", new EmbeddedNamespaceRegistrationTransactionV1()},
			{"account_address_restriction_transaction_v1", new EmbeddedAccountAddressRestrictionTransactionV1()},
			{"account_mosaic_restriction_transaction_v1", new EmbeddedAccountMosaicRestrictionTransactionV1()},
			{"account_operation_restriction_transaction_v1", new EmbeddedAccountOperationRestrictionTransactionV1()},
			{"mosaic_address_restriction_transaction_v1", new EmbeddedMosaicAddressRestrictionTransactionV1()},
			{"mosaic_global_restriction_transaction_v1", new EmbeddedMosaicGlobalRestrictionTransactionV1()},
			{"transfer_transaction_v1", new EmbeddedTransferTransactionV1()}

		};
		return mapping[entityName];
	}
}

public class BlockFactory : IDeserializer {
	public static ulong ToKey(uint[] values) {
		if (values.Length == 1)
			return (ulong)values[0];

		// assume each key is at most 32bits
		return values.Aggregate(0UL, (accumulator, value) => (accumulator << 32) + (ulong)value);
	}

	public static ISerializer Deserialize(BinaryReader br) {
		var position = br.BaseStream.Position;
		var parent = Block.Deserialize(br);
		var mapping = new Dictionary<ulong, Func<BinaryReader, ISerializer>>
		{
			{ToKey(new uint[]{NemesisBlockV1.BLOCK_TYPE.Value}), NemesisBlockV1.Deserialize},
			{ToKey(new uint[]{NormalBlockV1.BLOCK_TYPE.Value}), NormalBlockV1.Deserialize},
			{ToKey(new uint[]{ImportanceBlockV1.BLOCK_TYPE.Value}), ImportanceBlockV1.Deserialize}
		};
		br.BaseStream.Position = position;
		return mapping[ToKey(new uint[]{parent.Type.Value})](br);
	}

	public static ISerializer Deserialize(string payload) {
		using var ms = new MemoryStream(Converter.HexToBytes(payload).ToArray());
		using var br = new BinaryReader(ms);
		return Deserialize(br);
	}

	public static ISerializer CreateByName(string entityName) {
		var mapping = new Dictionary<string, ISerializer>
		{
			{"nemesis_block_v1", new NemesisBlockV1()},
			{"normal_block_v1", new NormalBlockV1()},
			{"importance_block_v1", new ImportanceBlockV1()}

		};
		return mapping[entityName];
	}
}

public class ReceiptFactory : IDeserializer {
	public static ulong ToKey(uint[] values) {
		if (values.Length == 1)
			return (ulong)values[0];

		// assume each key is at most 32bits
		return values.Aggregate(0UL, (accumulator, value) => (accumulator << 32) + (ulong)value);
	}

	public static ISerializer Deserialize(BinaryReader br) {
		var position = br.BaseStream.Position;
		var parent = Receipt.Deserialize(br);
		var mapping = new Dictionary<ulong, Func<BinaryReader, ISerializer>>
		{
			{ToKey(new uint[]{HarvestFeeReceipt.RECEIPT_TYPE.Value}), HarvestFeeReceipt.Deserialize},
			{ToKey(new uint[]{InflationReceipt.RECEIPT_TYPE.Value}), InflationReceipt.Deserialize},
			{ToKey(new uint[]{LockHashCreatedFeeReceipt.RECEIPT_TYPE.Value}), LockHashCreatedFeeReceipt.Deserialize},
			{ToKey(new uint[]{LockHashCompletedFeeReceipt.RECEIPT_TYPE.Value}), LockHashCompletedFeeReceipt.Deserialize},
			{ToKey(new uint[]{LockHashExpiredFeeReceipt.RECEIPT_TYPE.Value}), LockHashExpiredFeeReceipt.Deserialize},
			{ToKey(new uint[]{LockSecretCreatedFeeReceipt.RECEIPT_TYPE.Value}), LockSecretCreatedFeeReceipt.Deserialize},
			{ToKey(new uint[]{LockSecretCompletedFeeReceipt.RECEIPT_TYPE.Value}), LockSecretCompletedFeeReceipt.Deserialize},
			{ToKey(new uint[]{LockSecretExpiredFeeReceipt.RECEIPT_TYPE.Value}), LockSecretExpiredFeeReceipt.Deserialize},
			{ToKey(new uint[]{MosaicExpiredReceipt.RECEIPT_TYPE.Value}), MosaicExpiredReceipt.Deserialize},
			{ToKey(new uint[]{MosaicRentalFeeReceipt.RECEIPT_TYPE.Value}), MosaicRentalFeeReceipt.Deserialize},
			{ToKey(new uint[]{NamespaceExpiredReceipt.RECEIPT_TYPE.Value}), NamespaceExpiredReceipt.Deserialize},
			{ToKey(new uint[]{NamespaceDeletedReceipt.RECEIPT_TYPE.Value}), NamespaceDeletedReceipt.Deserialize},
			{ToKey(new uint[]{NamespaceRentalFeeReceipt.RECEIPT_TYPE.Value}), NamespaceRentalFeeReceipt.Deserialize}
		};
		br.BaseStream.Position = position;
		return mapping[ToKey(new uint[]{parent.Type.Value})](br);
	}

	public static ISerializer Deserialize(string payload) {
		using var ms = new MemoryStream(Converter.HexToBytes(payload).ToArray());
		using var br = new BinaryReader(ms);
		return Deserialize(br);
	}

	public static ISerializer CreateByName(string entityName) {
		var mapping = new Dictionary<string, ISerializer>
		{
			{"harvest_fee_receipt", new HarvestFeeReceipt()},
			{"inflation_receipt", new InflationReceipt()},
			{"lock_hash_created_fee_receipt", new LockHashCreatedFeeReceipt()},
			{"lock_hash_completed_fee_receipt", new LockHashCompletedFeeReceipt()},
			{"lock_hash_expired_fee_receipt", new LockHashExpiredFeeReceipt()},
			{"lock_secret_created_fee_receipt", new LockSecretCreatedFeeReceipt()},
			{"lock_secret_completed_fee_receipt", new LockSecretCompletedFeeReceipt()},
			{"lock_secret_expired_fee_receipt", new LockSecretExpiredFeeReceipt()},
			{"mosaic_expired_receipt", new MosaicExpiredReceipt()},
			{"mosaic_rental_fee_receipt", new MosaicRentalFeeReceipt()},
			{"namespace_expired_receipt", new NamespaceExpiredReceipt()},
			{"namespace_deleted_receipt", new NamespaceDeletedReceipt()},
			{"namespace_rental_fee_receipt", new NamespaceRentalFeeReceipt()}

		};
		return mapping[entityName];
	}
}
}