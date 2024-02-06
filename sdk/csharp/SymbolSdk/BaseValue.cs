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
                null => 0,
                _ => ConvertToUlong(value)
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
        
        public static ulong ConvertToUlong(object value)
        {
            return value switch
            {
                byte b => b,
                sbyte sb => (ulong) sb,
                short s => (ulong) s,
                ushort us => us,
                int i => (ulong) i,
                uint ui => ui,
                long l => (ulong) l,
                ulong ul => ul,
                _ => throw new ArgumentException("Invalid value type.")
            };
        }
    }
}