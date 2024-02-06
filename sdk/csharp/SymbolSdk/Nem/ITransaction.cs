namespace SymbolSdk.Nem
{
    public interface ITransaction : IBaseTransaction
    {
        public Signature Signature { get; set; }
        public PublicKey SignerPublicKey { get; }
        public byte Version { get; }
    }
}