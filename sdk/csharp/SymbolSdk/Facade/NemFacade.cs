using SymbolSdk;
using Org.BouncyCastle.Crypto.Digests;

namespace SymbolSdk.Nem;
/**
 * Facade used to interact with NEM blockchain.
 */
public class NemFacade
{
    public readonly Network Network;

    /**
     * Creates a NEM facade.
     * @param {Network} network NEM network or network name.
     */
    public NemFacade(Network network)
    {
        Network = network;
    }

    /**
     * Hashes a NEM transaction.
     * @param {ITransaction} transaction Transaction object.
     * @returns {Hash256} Transaction hash.
     */
    public Hash256 HashTransaction(ITransaction transaction)
    {
        var hasher = new KeccakDigest(256);
        var hash = new byte[32];
        var nonVerifiableTransaction = TransactionHelper.ToNonVerifiableTransaction(transaction);
        hasher.BlockUpdate(nonVerifiableTransaction.Serialize(), 0, nonVerifiableTransaction.Serialize().Length);
        hasher.DoFinal(hash, 0);
        return new Hash256(hash);
    }

    /**
	 * Signs a NEM transaction.
	 * @param {KeyPair} keyPair Key pair.
	 * @param {IBaseTransaction} transaction Transaction object.
	 * @returns {Signature} Transaction signature.
	 */
    public Signature SignTransaction(KeyPair keyPair, IBaseTransaction transaction)
    {
        var nonVerifiableTransaction = TransactionHelper.ToNonVerifiableTransaction(transaction);
        return keyPair.Sign(nonVerifiableTransaction.Serialize());
    }
    
    /**
	 * Verifies a NEM transaction.
	 * @param {IBaseTransaction} transaction Transaction object.
	 * @param {Signature} signature Signature to verify.
	 * @returns {bool} true if transaction signature is verified.
	 */
    public static bool VerifyTransaction(ITransaction transaction, Signature signature) {
        var nonVerifiableTransaction = TransactionHelper.ToNonVerifiableTransaction(transaction);
        var publicKey = new PublicKey(transaction.SignerPublicKey.bytes);
        return new Verifier(publicKey).Verify(nonVerifiableTransaction.Serialize(), signature);
    }
}