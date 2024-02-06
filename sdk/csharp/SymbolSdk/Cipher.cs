using System.Buffers.Binary;
using System.Security.Cryptography;
using System.Text;
using Org.BouncyCastle.Crypto;
using Org.BouncyCastle.Crypto.Engines;
using Org.BouncyCastle.Crypto.Modes;
using Org.BouncyCastle.Crypto.Parameters;
using Org.BouncyCastle.Security;

namespace SymbolSdk;

public class AesCbcCipher
{
    private readonly SharedKey256 _aesKey;
    private static Aes CreateAesCbcManaged(byte[] key, byte[] iv)
    {
        var aes = Aes.Create();
        aes.KeySize = 128;
        aes.BlockSize = 128;
        aes.Mode = CipherMode.CBC;
        aes.IV = iv;
        aes.Key = key;
        aes.Padding = PaddingMode.PKCS7;
        return aes;
    }
    public AesCbcCipher(SharedKey256 aesKey)
    {
        _aesKey = aesKey;
    }
    
    public byte[] Encrypt(byte[] clearText, byte[] iv)
    {
        var aes = CreateAesCbcManaged(_aesKey.bytes, iv);
        return aes.CreateEncryptor().TransformFinalBlock(clearText, 0, clearText.Length);
    }
    
    public byte[] Decrypt(byte[] cipherText, byte[] iv)
    {
        var aes = CreateAesCbcManaged(_aesKey.bytes, iv);
        return aes.CreateDecryptor().TransformFinalBlock(cipherText, 0, cipherText.Length);
    }
}

public class AesGcmCipher
{
    public const byte TAG_SIZE = 16;
    
    private readonly SharedKey256 _aesKey;
    public AesGcmCipher(SharedKey256 aesKey)
    {
        _aesKey = aesKey;
    }
    
    public (byte[] cipherText, byte[] tag) Encrypt(byte[] clearText, byte[] iv)
    {
        var aes = new AesGcm(_aesKey.bytes);
        var cipherBytes = new byte[clearText.Length];
        var tag = new byte[16];
        aes.Encrypt(iv, clearText, cipherBytes, tag);
        return (cipherBytes, tag);
    }
    
    public byte[] Decrypt(byte[] cipherText, byte[] iv, byte[] tag)
    {
        var aes = new AesGcm(_aesKey.bytes);
        var clearText = new byte[cipherText.Length];
        aes.Decrypt(iv, cipherText, tag, clearText);
        return clearText;
    }
}