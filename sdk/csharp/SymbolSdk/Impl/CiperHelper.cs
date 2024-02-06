using System.Security.Cryptography;

namespace SymbolSdk;

public class CiperHelper
{
    const int GCM_IV_SIZE = 12;
    const int CBC_IV_SIZE = 16;
    const int SALT_SIZE = 32;

    private static (byte[] Tag, byte[] InitializationVector, byte[] EncodedMessageData) Decode(byte tagSize, byte ivSize, byte[] encodedMessage)
    {
        var tag = new byte[tagSize];
        Array.Copy(encodedMessage, 0, tag, 0, tagSize);
        var initializationVector = new byte[ivSize];
        Array.Copy(encodedMessage, tagSize, initializationVector, 0, ivSize);
        var encodedMessageData = new byte[encodedMessage.Length - tagSize - ivSize];
        Array.Copy(encodedMessage, tagSize + ivSize, encodedMessageData, 0, encodedMessage.Length - tagSize - ivSize);
        return (tag, initializationVector, encodedMessageData);
    }
    
    public static byte[] DecodeAesGcm(
        Func<byte[], byte[], SharedKey256> deriveSharedKey,
        byte[] privateKey,
        byte[] publicKey,
        byte[] encodedMessage)
    {
        var decoded = Decode(AesGcmCipher.TAG_SIZE, GCM_IV_SIZE, encodedMessage);
        var sharedKey = deriveSharedKey(privateKey, publicKey);
        var cipher = new AesGcmCipher(sharedKey);
        
        return cipher.Decrypt(decoded.EncodedMessageData, decoded.InitializationVector, decoded.Tag);
    }
    
    public static (byte[] tag, byte[] initializationVector, byte[] cipherText) EncodeAesGcm(
        Func<byte[], byte[], SharedKey256> deriveSharedKey,
        byte[] privateKey,
        byte[] publicKey,
        byte[] message,
        byte[]? iv = null)
    {
        var sharedKey = deriveSharedKey(privateKey, publicKey);
        var cipher = new AesGcmCipher(sharedKey);
        
        var rngCsp = RandomNumberGenerator.Create();
        var randomBytes = new byte[12];
        rngCsp.GetBytes(randomBytes);
        var initializationVector = iv ?? randomBytes;
        var secretBox = cipher.Encrypt(message, initializationVector);
        return (secretBox.tag, initializationVector, secretBox.cipherText);
    }
}