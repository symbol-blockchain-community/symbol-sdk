namespace SymbolSdk
{
    public interface IEnum<out T>: ISerializer
    {
        public T Value{ get; }
    }
}