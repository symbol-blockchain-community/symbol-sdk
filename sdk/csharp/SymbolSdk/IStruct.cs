using System.Collections.Generic;

namespace SymbolSdk
{
    public interface IStruct : ISerializer
    {
        public Dictionary<string, string> TypeHints { get; }
    }
}