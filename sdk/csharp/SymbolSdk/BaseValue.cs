using System.Globalization;

namespace SymbolSdk
{
    /**
     * Represents a base integer.
     */
    public abstract class BaseValue
    {
        public uint Size { get; }
        public readonly ulong Value;

        /**
         * Creates a base value.
         * @param {byte} size Size of the integer.
         * @param {object} value Value.
         */
        protected BaseValue(byte size, object? value)
        {
            Size = size;

            Value = value switch
            {
                string str => ulong.Parse(str, NumberStyles.HexNumber),
                ulong val => val,
                null => 0,
                _ => throw new System.Exception("Invalid value type.")
            };
        }
        
        /**
	     * Converts base value to string.
	     * @returns {string} String representation.
	     */
        public override string ToString()
        {
            return "0x" + $"{Value:X}".PadLeft((int)Size * 2, '0');
        }
    }
}