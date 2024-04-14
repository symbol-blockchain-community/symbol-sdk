import { KeyPair } from './KeyPair'
import { deriveSharedKey } from './SharedKey'
import { concatArrays, decodeAesGcm, encodeAesGcm } from '../impl/CipherHelpers'
import { PublicKey } from '../CryptoTypes'
import { Buffer } from 'buffer'

const GCM_IV_SIZE = 12
const TAG_SIZE = 16

interface TryDecodeResult {
  isDecoded: boolean
  message: any
}

const filterExceptions = (statement: () => any, exceptions: any[]) => {
  try {
    const message = statement()
    return [true, message]
  } catch (exception: unknown) {
    if (!exceptions.some((exceptionMessage: any) => (exception as Error).message.includes(exceptionMessage)))
      throw exception
  }

  return [false, undefined]
}

/**
 * Encrypts and encodes messages between two parties.
 */
export default class MessageEncoder {
  private _keyPair: KeyPair
  /**
   * Creates message encoder around key pair.
   * @param {KeyPair} keyPair Key pair.
   */
  constructor(keyPair: KeyPair) {
    /**
     * @private
     */
    this._keyPair = keyPair
  }

  /**
   * Public key used for message encoding.
   * @returns {PublicKey} Public key used for message encoding.
   */
  get publicKey(): PublicKey {
    return this._keyPair.publicKey
  }

  /**
   * Tries to decode encoded message.
   * @param {PublicKey} recipientPublicKey Recipient's public key.
   * @param {Uint8Array} encodedMessage Encoded message.
   * @returns {TryDecodeResult} Tuple containing decoded status and message.
   */
  tryDecode(recipientPublicKey: PublicKey, encodedMessage: Uint8Array): TryDecodeResult {
    if (1 === encodedMessage[0]) {
      const [result, message] = filterExceptions(
        () =>
          decodeAesGcm(
            deriveSharedKey,
            this._keyPair.privateKey.bytes,
            recipientPublicKey.bytes,
            encodedMessage.subarray(1)
          ),
        ['Unsupported state or unable to authenticate data']
      )
      if (result) return { isDecoded: true, message }
    }
    return { isDecoded: false, message: encodedMessage }
  }

  /**
   * Encodes message to recipient using recommended format.
   * @param {PublicKey} recipientPublicKey Recipient public key.
   * @param {Uint8Array} message Message to encode.
   * @returns {Uint8Array} Encrypted and encoded message.
   */
  encode(recipientPublicKey: PublicKey, message: Uint8Array): Uint8Array {
    const { tag, initializationVector, cipherText } = encodeAesGcm(
      deriveSharedKey,
      this._keyPair.privateKey.bytes,
      recipientPublicKey.bytes,
      message
    )

    return concatArrays(new Uint8Array([1]), tag, initializationVector, cipherText)
  }
}

// region type declarations

/**
 * Result of a try decode operation.
 * @class
 * @typedef {object} TryDecodeResult
 * @property {boolean} isDecoded \c true if message has been decoded and decrypted; \c false otherwise.
 * @property {Uint8Array} message Decoded message when `isDecoded` is \c true; encoded message otherwise.
 */

// endregion
