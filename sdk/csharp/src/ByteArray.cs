using System;
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
            if (arrayInput == null)
            {
            }
            else if (arrayInput is byte[] bytes1)
            {
                Size = fixedSize;
                if (fixedSize != bytes1.Length) throw new Exception($"bytes was size {bytes1.Length} but must be {fixedSize}");
                bytes = bytes1;
            }
            else if (arrayInput is string str)
            {
                if (str.Length == 39)
                {
                    bytes = Converter.StringToAddress(str);
                }
                else
                {
                    var rawBytes = Converter.HexToBytes(str);
                    if (fixedSize != rawBytes.Length) throw new Exception($"bytes was size {rawBytes.Length} but must be {fixedSize}");
                    bytes = rawBytes;   
                }
            }
        }

        /**
	     * Creates a byte array.
	     * @param {byte} fixedSize Size of the array.
	     * @param {string} arrayInput hex string.
	     */
        protected ByteArray(int fixedSize, string hexstring)
        {
            var rawBytes = Converter.HexToBytes(hexstring);
            if (fixedSize != rawBytes.Length) throw new Exception($"bytes was size {rawBytes.Length} but must be {fixedSize}");
            bytes = rawBytes;
        }

        /**
	     * Returns string representation of this object.
	     * @returns {string} String representation of this object
	     */
        public override string ToString()
        {
            return Converter.BytesToHex(bytes);
        }
    }
}
