namespace SymbolSdk.Nem
{
    public interface IBaseTransaction : IStruct
    {
        public PublicKey SignerPublicKey { get; set; }
        public NetworkType Network { get; set; }
        public TransactionType Type { get; }
        public void Sort();
    }
}