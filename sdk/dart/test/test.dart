import 'package:symbol_sdk/CryptoTypes.dart';
import 'package:symbol_sdk/index.dart';
import 'package:symbol_sdk/nem/KeyPair.dart';
import 'package:symbol_sdk/nem/SharedKey.dart';
import 'package:symbol_sdk/nem/index.dart' as symbol;

void main() {
  var privateKey = PrivateKey('8F545C2816788AB41D352F236D80DBBCBC34705B5F902EFF1F1D88327C7C1300');
      var keyPair = KeyPair(privateKey);
      var otherPublicKey = PublicKey('4C3B71636D3088ED3DF93D81E9169604EF0D4D68107BE0B446715DC12096243B');
      var result = deriveSharedKey(keyPair, otherPublicKey);
      print(result);
}