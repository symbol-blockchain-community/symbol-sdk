import '../CryptoTypes.dart' as ct;
import '../nem/KeyPair.dart' as nc;
import '../nem/models.dart';
import 'dart:typed_data';
import '../impl/CiperHelper.dart';
import '../utils/converter.dart';
import './SharedKey.dart';

List filterExceptions(Function statement, List<String> exceptions) {
  try {
    var message = statement();
    return [true, message];
  } catch (exception) {
    if (!exceptions.any((exceptionMessage) => exception.toString().contains(exceptionMessage))) {
      rethrow;
    }
  }

  return [false, null];
}

final DELEGATION_MARKER = Uint8List.fromList(hexToBytes('FE2A8061577301E2'));

class MessageEncorder {
  nc.KeyPair keyPair;
  MessageEncorder(nc.KeyPair keyPair) :keyPair = keyPair;
  ct.PublicKey get publicKey => keyPair.publicKey;

  Future<Uint8List> encode(ct.PublicKey recipientPublicKey, Uint8List message) async {
    final result = encodeAesGcm(deriveSharedKey, keyPair, recipientPublicKey, message);

    return concatArrays([
      Uint8List.fromList([1]),
      result['tag'],
      result['initializationVector'],
      result['cipherText']
    ]);
  }

  Future<Map<String, dynamic>> tryDecode(
    ct.PublicKey recipientPublicKey, Message encodedMessage) async {
      if (MessageType.ENCRYPTED != encodedMessage.messageType) {
        throw Exception('invalid message format');
      }

      var resultAndMessage = filterExceptions(
        () => decodeAesGcm(deriveSharedKey, keyPair, recipientPublicKey, encodedMessage.message),
        ['Unsupported state or unable to authenticate data']
      );
      if (resultAndMessage[0]){
        return { 'isDecoded': true, 'message': resultAndMessage[1] };
      }
      return { 'isDecoded': false, 'message': encodedMessage };
  }
}