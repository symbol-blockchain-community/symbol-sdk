namespace SymbolSdk
{
    public interface ISerializer
    {
        public uint Size { get; }
        public byte[] Serialize();
    }
}