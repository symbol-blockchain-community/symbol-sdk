namespace SymbolSdk.Symbol;

public class MessageEncoder
{
    private KeyPair keyPair { get; set; }

    public MessageEncoder(KeyPair keyPair)
    {
        this.keyPair = keyPair;
    }

    public byte[] Encode(PublicKey recipientPublicKey, byte[] message)
    {
        var encoded = CiperHelper.EncodeAesGcm(SharedKey.DeriveSharedKey, keyPair.PrivateKey.bytes, recipientPublicKey.bytes, message);
        var prefix = new byte[] { 1 };
        return prefix.Concat(encoded.tag).Concat(encoded.initializationVector).Concat(encoded.cipherText).ToArray();
    }

    public (bool isDecoded, byte[] message) TryDecode(PublicKey recipientPublicKey, byte[] encodedMessage)
    {
        if (1 == encodedMessage[0]) {
            try {
                var message = CiperHelper.DecodeAesGcm(
                    SharedKey.DeriveSharedKey, keyPair.PrivateKey.bytes, recipientPublicKey.bytes, encodedMessage.Skip(1).ToArray());
                return (isDecoded: true, message: message);
            } catch (Exception e) {
                // 何もしない
            }
        }
        return (isDecoded: false, message: encodedMessage);
    }
}