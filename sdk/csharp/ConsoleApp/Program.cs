// See https://aka.ms/new-console-template for more information

using System.Globalization;
using SymbolSdk;
using SymbolSdk.Symbol;
using SymbolSdk.Utils;

/*
public Amount(object? amount = null): base(SIZE, amount) {
}
public UnresolvedAddress(object? unresolvedAddress = null): base(SIZE, unresolvedAddress) {
}
*/

var amount = new Amount(amount: "56148181AF8A6CFC");
Console.WriteLine(amount);
var address = new UnresolvedAddress("TAUYF774MZWLBEUI7S2LR6BA5CYLL53QSMDVV3Y");
Console.WriteLine(address.ToString());

public class TransferTransactionV1(
	Signature? signature,
	PublicKey? publicKey,
	byte? version,
	NetworkType? network,
	TransactionType? type,
	Amount? fee,
	Timestamp? deadline,
	UnresolvedAddress? recipientAddress,
	UnresolvedMosaic[]? mosaics,
	byte[]? message)
	: ITransaction
{
	public const byte TRANSACTION_VERSION = 1;

	public static readonly TransactionType TRANSACTION_TYPE = TransactionType.TRANSFER;

	private const int VerifiableEntityHeaderReserved_1 = 0; // reserved field
	private const int EntityBodyReserved_1 = 0; // reserved field
	private const int TransferTransactionBodyReserved_1 = 0; // reserved field
	private const int TransferTransactionBodyReserved_2 = 0; // reserved field

	public Dictionary<string, string> TypeHints { get; } = new Dictionary<string, string>(){
		{"Signature", "pod:Signature"},
		{"SignerPublicKey", "pod:PublicKey"},
		{"Network", "enum:NetworkType"},
		{"Type", "enum:TransactionType"},
		{"Fee", "pod:Amount"},
		{"Deadline", "pod:Timestamp"},
		{"RecipientAddress", "pod:UnresolvedAddress"},
		{"Mosaics", "array[UnresolvedMosaic]"},
		{"Message", "bytes_array"}
	};

	public void Sort() {
		Array.Sort(Mosaics, (lhs, rhs) => {
			var comparerMethod = lhs.MosaicId.GetType().GetMethod("Comparer");	return comparerMethod != null
				? ArrayHelpers.DeepCompare(comparerMethod.Invoke(lhs.MosaicId, new object[] { }),
					comparerMethod.Invoke(rhs.MosaicId, new object[] { }))
				: ArrayHelpers.DeepCompare(lhs.MosaicId.GetType().GetField("Value").GetValue(lhs.MosaicId) ?? throw new InvalidOperationException(),
		rhs.MosaicId.GetType().GetField("Value").GetValue(rhs.MosaicId) ?? throw new InvalidOperationException());
		});
	}

	public Signature Signature {
		get; set;
	} = signature ?? new Signature();

	public PublicKey SignerPublicKey {
		get; set;
	} = publicKey ?? new PublicKey();

	public byte Version {
		get; set;
	} = version ?? TransferTransactionV1.TRANSACTION_VERSION;

	public NetworkType Network {
		get; set;
	} = network ?? NetworkType.MAINNET;

	public TransactionType Type {
		get; set;
	} = type ?? TransferTransactionV1.TRANSACTION_TYPE;

	public Amount Fee {
		get; set;
	} = fee ?? new Amount();

	public Timestamp Deadline {
		get; set;
	} = deadline ?? new Timestamp();

	public UnresolvedAddress RecipientAddress {
		get; set;
	} = recipientAddress ?? new UnresolvedAddress();

	public UnresolvedMosaic[] Mosaics {
		get; set;
	} = mosaics ?? Array.Empty<UnresolvedMosaic>();

	public byte[]? Message {
		get; set;
	} = message ?? null;

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

		var instance = new TransferTransactionV1(signature, signerPublicKey, version, network, type, fee, deadline, recipientAddress, mosaics, message);
		return instance;
	}

	public byte[] Serialize() {
		using var ms = new MemoryStream();
		using var bw = new BinaryWriter(ms);
		bw.Write(Size);
		bw.Write(BitConverter.GetBytes((uint)(uint)VerifiableEntityHeaderReserved_1)); 
		bw.Write(Signature.Serialize()); 
		bw.Write(SignerPublicKey.Serialize()); 
		bw.Write(BitConverter.GetBytes((uint)(uint)EntityBodyReserved_1)); 
		bw.Write((byte)Version); 
		bw.Write(Network.Serialize()); 
		bw.Write(Type.Serialize()); 
		bw.Write(Fee.Serialize()); 
		bw.Write(Deadline.Serialize()); 
		bw.Write(RecipientAddress.Serialize()); 
		bw.Write(BitConverter.GetBytes((ushort)(ushort)Message.Length));  // bound: message_size
		bw.Write((byte)Mosaics.Length);  // bound: mosaics_count
		bw.Write((byte)TransferTransactionBodyReserved_1); 
		bw.Write(BitConverter.GetBytes((uint)(uint)TransferTransactionBodyReserved_2)); 
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