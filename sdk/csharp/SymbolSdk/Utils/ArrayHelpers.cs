namespace SymbolSdk;
public static class ArrayHelpers
{
    public static int DeepCompare(object lhs, object rhs)
    {
        if (lhs is not (Array or byte[]))
        {
            if (Equals(lhs, rhs))
                return 0;
            var property = lhs.GetType().GetProperty("Value");
            if (property == null)
            {
                return Comparer<object>.Default.Compare(lhs, rhs);
            }
            {
                var lhsValue = (uint)property.GetValue(lhs);
                var rhsValue = (uint)property.GetValue(rhs);
                return lhsValue > rhsValue ? 1 : -1;
            }
        }

        var lhsArray = (Array)lhs;
        var rhsArray = (Array)rhs;
        
        if (lhsArray.Length != rhsArray.Length)
            return lhsArray.Length > rhsArray.Length ? 1 : -1;

        return lhsArray.Cast<object>().Select((_, i) => 
            DeepCompare(lhsArray.GetValue(i), rhsArray.GetValue(i))).FirstOrDefault(compareResult => compareResult != 0);
    }
    
    private static void AddPadding(int size, BinaryWriter bw,
        int alignment)
    {
        var padding = GetPadding(size, alignment);
        while (padding > 0)
        {
            bw.Write((byte)0);
            padding--;
        }
    }

    private static int GetPadding(int size, int alignment)
    {
        if (alignment == 0)
        {
            return 0;
        }
        return 0 == size % alignment ? 0 : alignment - (size % alignment);
    }
    
    public static void WriteArray<T>(BinaryWriter bw, IEnumerable<T> elements) where T : ISerializer
    {
        foreach (var t in elements)
        {
            bw.Write(t.Serialize());
            AddPadding((int)t.Size, bw, 0);
        }
    }

    /**
	 * Calculates aligned size.
	 * @param {uint} size Size.
	 * @param {uint} alignment Alignment.
	 * @returns {uint} Size rounded up to alignment.
	 */
    private static uint AlignUp(uint size, uint alignment)
    {
        return (uint)Math.Floor((size + alignment - 1) / (float)alignment) * alignment;
    }
    
    public static uint Size<T>(T[] elements, uint alignment = 0, bool skipLastElementPadding = false) where T : ISerializer
    {
        if (!elements.Any()) return 0;
        if (alignment == 0) return (uint)elements.Sum(e => e.Size);

        if (!skipLastElementPadding) return (uint)elements.Sum(e => AlignUp(e.Size, alignment));

        return (uint)elements.Take(elements.Length - 1).Sum(e => AlignUp(e.Size, alignment)) +
               (uint)elements.Skip(elements.Length - 1).Sum(e => e.Size);
    }

    /**
	 * Writes array of variable size objects.
	 * @param {BinaryWriter} output An output sink.
	 * @param {array&lt;T&gt;} elements Serializable elements.
	 * @param {uint} alignment Alignment used to make sure each object is at boundary.
	 * @param {bool} skipLastElementPadding true if last element should not be aligned/padded.
	 */
    public static void WriteVariableSizeElements<T>(BinaryWriter bw, T[] elements, uint alignment, bool skipLastElementPadding = false) where T : ISerializer
    {
        for (var i = 0; i < elements.Length; i++)
        {
            bw.Write(elements[i].Serialize().ToArray());
            if (skipLastElementPadding && elements.Length - 1 == i) continue;
            var alignedSize = AlignUp(elements[i].Size, alignment);
            if (alignedSize != elements[i].Size)
            {
                bw.Write(new byte[alignedSize - elements[i].Size]);
            }
        }
    }

    /**
	 * Reads array of variable size objects.
	 * @param {BinaryReader} bufferInput A uint8 array.
	 * @param {Func} FactoryClass Factory used to deserialize objects.
	 * @param {uint} alignment Alignment used to make sure each object is at boundary.
	 * @param {bool} skipLastElementPadding true if last element is not aligned/padded.
	 * @returns {array&lt;T&gt;} Array of deserialized objects.
	 */
    public static T[] ReadVariableSizeElements<T>(BinaryReader br, Func<BinaryReader, T> factoryClass, uint payloadSize, uint alignment, bool skipLastElementPadding = false) where T : IStruct
    {
        var elements = new List<T>();
        if (alignment == 0) return elements.ToArray();
        var remainingByteSizes = (int)payloadSize;
        while (remainingByteSizes > 0)
        {
            var entity = factoryClass(br);
            elements.Add(entity);
            var alignedSize = (skipLastElementPadding && entity.Size >= br.BaseStream.Length - br.BaseStream.Position)
                ? (int)entity.Size
                : (int)AlignUp(entity.Size, alignment);
            if (alignedSize > remainingByteSizes)
                throw new Exception("unexpected buffer length");
            br.ReadBytes((int)(alignedSize - entity.Size));
            remainingByteSizes -= alignedSize;
        }
        return elements.ToArray();
    }

    /**
	 * Reads array of objects.
	 * @param {BinaryReader} bufferInput Input buffer.
	 * @param {Func} accessor Optional accessor used to check objects order.
	 * @returns {array&lt;T&gt;} Array of deserialized objects.
	 */
    public static T[] ReadArray<T>(BinaryReader br, Func<BinaryReader, T> factory) where T : ISerializer
    {
        var position = br.BaseStream.Position;
        var length = (int)br.BaseStream.Length;
        var elements = new List<T>();
        if (length == position) return elements.ToArray();
        while (br.BaseStream.Position < length)
        {
            var entity = factory(br);
            elements.Add(entity);
        }
        return elements.ToArray();
    }

    /**
	 * Reads array of deterministic number of objects.
	 * @param {BinaryReader} bufferInput A uint8 array.
	 * @param {Func} accessor Optional accessor used to check objects order.
     * @param {byte} count Number of object to deserialize.
	 * @returns {array&lt;T&gt;} Array of deserialized objects.
	 */
    public static T[] ReadArrayCount<T>(BinaryReader br, Func<BinaryReader, T> factory, byte count) where T : ISerializer
    {
        var alignment = br.BaseStream.Length;
        var elements = new List<T>();
        if (alignment == 0) return elements.ToArray();
        for (var i = 0; i < count; i++)
        {
            var entity = factory(br);
            elements.Add(entity);
        }
        return elements.ToArray();
    }
    
    public static object GetValue(object o) {
        var comparerMethod = o.GetType().GetMethod("Comparer"); 
        return comparerMethod != null ? comparerMethod.Invoke(o, new object[] { }) : o.GetType().GetField("Value").GetValue(o);
    }
}