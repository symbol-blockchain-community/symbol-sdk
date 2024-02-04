using System;
using SymbolSdk.Symbol;
using Nem = SymbolSdk.Nem;
using SymbolSdk.Utils;

namespace SymbolSdk
{
    /**
     * Represents a fixed size byte array.
     */
    public abstract class ByteArray
    {
        public uint Size { get; }
        public byte[] bytes { get; }

        /**
	     * Creates a byte array.
	     * @param {byte} fixedSize Size of the array.
	     * @param {byte[]?} arrayInput Byte array.
	     */
        protected ByteArray(byte fixedSize, object? arrayInput)
        {
            bytes = new byte[fixedSize];
            switch (arrayInput)
            {
                case byte[] bytes1:
                {
                    Size = fixedSize;
                    if (fixedSize != bytes1.Length) throw new Exception($"bytes was size {bytes1.Length} but must be {fixedSize}");
                    bytes = bytes1;
                    break;
                }
                case string {Length: 39 or 40} str:
                    bytes = Converter.StringToAddress(str);
                    break;
                case string str when Converter.IsHexString(str):
                {
                    var rawBytes = Converter.HexToBytes(str);
                    if (fixedSize != rawBytes.Length) throw new Exception($"bytes was size {rawBytes.Length} but must be {fixedSize}");
                    bytes = rawBytes;
                    break;
                }
                case string str:
                    throw new Exception("Invalid input type.");
            }
        }
        
        /**
	     * Returns string representation of this object.
	     * @returns {string} String representation of this object
	     */
        public override string ToString()
        {
            if (this.GetType() == typeof(UnresolvedAddress) || this.GetType() == typeof(Nem.Address) || this.GetType() == typeof(Address) || this.GetType() == typeof(UnresolvedAddress))
            {
                return Converter.AddressToString(bytes);
            }
            return Converter.BytesToHex(bytes);
        }
    }
}
