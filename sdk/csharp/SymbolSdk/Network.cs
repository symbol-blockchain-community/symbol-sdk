using Org.BouncyCastle.Crypto.Digests;

namespace SymbolSdk
{
    /**
	 * Represents a network.
	 */
    public class BaseNetwork
    {
        public readonly string Name;
        public readonly byte Identifier;
        public readonly NetworkTimestampDatetimeConverter DatetimeConverter;

        /**
		 * Creates a new network with the specified name and identifier byte.
		 * @param {string} name Network name.
		 * @param {byte} identifier Network identifier byte.
		 * @param {NetworkTimestampDatetimeConverter} datetimeConverter Network timestamp datetime converter associated with this network.
		 * @param {KeccakDigest} addressHasher Gets the primary hasher to use in the public key to address conversion.
		 * @param {Func} createAddress Creates an encoded address from an address without checksum and checksum bytes.
		 * @param {Type} AddressClass Address class associated with this network.
		 * @param {Type} NetworkTimestampClass Network timestamp class associated with this network.
		 */
        protected BaseNetwork(string name, byte identifier, NetworkTimestampDatetimeConverter datetimeConverter, Type networkTimestampClass)
        {
            Name = name;
            Identifier = identifier;
            DatetimeConverter = datetimeConverter;
        }
        
	    public (byte[] version, byte[] checksum) PublicKeyToAddressFunc(byte[] publicKey, KeccakDigest digest)
        {
	        var partOneHashBuilder = digest;
	        var partOneHash = new byte[partOneHashBuilder.GetDigestSize()];
	        partOneHashBuilder.BlockUpdate(publicKey, 0, publicKey.Length);
	        partOneHashBuilder.DoFinal(partOneHash, 0);
	        var partTwoHashBuilder = new RipeMD160Digest();
	        var partTwoHash = new byte[partTwoHashBuilder.GetDigestSize()];
	        partTwoHashBuilder.BlockUpdate(partOneHash, 0, partOneHash.Length);
	        partTwoHashBuilder.DoFinal(partTwoHash, 0);

	        var version = new[] { Identifier }.Concat(partTwoHash).ToArray();

	        var partThreeHashBuilder = digest;
	        var resultHash = new byte[partThreeHashBuilder.GetDigestSize()];
	        partThreeHashBuilder.BlockUpdate(version, 0, version.Length);
	        partThreeHashBuilder.DoFinal(resultHash, 0);
	        var checksum = new byte[4];
	        Array.Copy(resultHash, checksum, 4);
            
	        return (version, checksum);
        }
        
        /**
		 * Converts a network timestamp to a datetime.
		 * @param {NetworkTimestamp} referenceNetworkTimestamp Reference network timestamp to convert.
		 * @returns {DateTime} Datetime representation of the reference network timestamp.
		 */
        public DateTime ToDatetime(BaseNetworkTimestamp referenceNetworkTimestamp) => DatetimeConverter.ToDatetime(referenceNetworkTimestamp.Timestamp);
        
        /**
		 * Returns string representation of this object.
		 * @returns {string} String representation of this object
		 */
        public override string ToString()
        {
            return Name;
        }
    }
}