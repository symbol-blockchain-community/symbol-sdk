namespace SymbolSdk.Symbol;

public class VotingKeysGenerator
{
    public KeyPair RootKeyPair;
    public Func<PrivateKey> PrivateKeyGenerator;
    public VotingKeysGenerator(KeyPair rootKeyPair, Func<PrivateKey>? privateKeyGenerator = null)
    {
        RootKeyPair = rootKeyPair;
        PrivateKeyGenerator = privateKeyGenerator ?? PrivateKey.Random;
    }

    public byte[] Generate(long startEpoch, long endEpoch)
    {
        const byte HEADER_SIZE = 80;
        const byte EPOCH_ENTRY_SIZE = 96;

        var numEpochs = endEpoch - startEpoch + 1;
        var buffer = new byte[HEADER_SIZE + EPOCH_ENTRY_SIZE * numEpochs];
        BitConverter.GetBytes(startEpoch).CopyTo(buffer, 0);
        BitConverter.GetBytes(endEpoch).CopyTo(buffer, 8);
        BitConverter.GetBytes(0xFFFFFFFFFFFFFFFF).CopyTo(buffer, 16);
        BitConverter.GetBytes(0xFFFFFFFFFFFFFFFF).CopyTo(buffer, 24);
        RootKeyPair.PublicKey.bytes.CopyTo(buffer, 32);
        BitConverter.GetBytes(startEpoch).CopyTo(buffer, 64);
        BitConverter.GetBytes(endEpoch).CopyTo(buffer, 72);
        
        for (int i = 0; i < numEpochs; i++) {
            var identifier = endEpoch - i;
            var childPrivateKey = PrivateKeyGenerator();
            var childKeyPair = new KeyPair(childPrivateKey);

            var parentSignedPayloadBuffer = new byte[40];
            childKeyPair.PublicKey.bytes.CopyTo(parentSignedPayloadBuffer, 0);
            BitConverter.GetBytes(identifier).CopyTo(parentSignedPayloadBuffer, 32);
            var signature = RootKeyPair.Sign(parentSignedPayloadBuffer);
            var startOffset = HEADER_SIZE + EPOCH_ENTRY_SIZE * i;
            childKeyPair.PrivateKey.bytes.CopyTo(buffer, startOffset);
            signature.bytes.CopyTo(buffer, startOffset + PrivateKey.SIZE);
        }
        return buffer;
    }
}