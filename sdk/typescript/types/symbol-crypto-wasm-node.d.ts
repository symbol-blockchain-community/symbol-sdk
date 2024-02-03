declare module 'symbol-crypto-wasm-node' {
  type Uint8ArrayBoxed = Uint8Array;

  /**
   * Generates public key given secret key.
   * @param hash_mode 
   * @param sk_boxed 
   * @param pk_boxed 
   */
  export function crypto_sign_keypair(hash_mode: HashMode, sk_boxed: Uint8ArrayBoxed, pk_boxed: Uint8ArrayBoxed): void;

  /**
   * Signs message.
   * @param hash_mode 
   * @param sk_boxed 
   * @param message_boxed 
   * @param signature_boxed 
   */
  export function crypto_private_sign(hash_mode: HashMode, sk_boxed: Uint8ArrayBoxed, message_boxed: Uint8ArrayBoxed, signature_boxed: Uint8ArrayBoxed): void;

  /**
   * Verifies signature.
   * @param hash_mode 
   * @param pk_boxed 
   * @param message_boxed 
   * @param signature_boxed 
   * @returns {boolean}
   */
  export function crypto_private_verify(hash_mode: HashMode, pk_boxed: Uint8ArrayBoxed, message_boxed: Uint8ArrayBoxed, signature_boxed: Uint8ArrayBoxed): boolean;

  /**
   * Supported hash modes.
   */
  export enum HashMode {
    /**
    * Keccak hash.
    */
    Keccak = 0,
    /**
    * SHA2 hash.
    */
    Sha2_512 = 1
  }
}