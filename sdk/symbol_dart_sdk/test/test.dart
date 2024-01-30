
//import 'package:pinenacl/api.dart';
//import '../bin/symbol/models.dart';
//import '../bin/nem/models.dart';
//import '../bin/symbol/Network.dart' as network;
import '../bin/facade/SymbolFacade.dart';
import '../bin/symbol/Network.dart' as snt;
import '../bin/symbol/models.dart';
import '../bin/utils/converter.dart';
import '../bin/CryptoTypes.dart' as ct;
//import '../models_c.dart';
//import 'dart:convert';
//import 'dart:typed_data';
import '../bin/utils/arrayHelpers.dart';
import '../bin/symbol/idGenerator.dart';
import '../bin/symbol/Network.dart' as nt;

void main() async {
	var payload = '4800000000004D1244B262C46CEABB85EFCDAB90785634129841E5B8E40781CF74DABF592817DE48711D778648DEAFB298F409274B52FABBFBCF7E7DF7E20DE1D0C3F657FB8595C1';
      var receipt = NamespaceRentalFeeReceipt(
        mosaic: Mosaic(
          mosaicId: MosaicId('9636553580561478212'),
          amount: Amount(1311768467294899695),
        ),
        senderAddress: Address('TBA6LOHEA6A465G2X5MSQF66JBYR254GJDPK7MQ'),
        recipientAddress: Address('TD2ASJ2LKL5LX66PPZ67PYQN4HIMH5SX7OCZLQI')
      );
  print(bytesToHex(receipt.serialize()));
  var receipt2 = ReceiptFactory().deserialize(payload);
  print(receipt2);
  print(bytesToHex(receipt2.serialize()));
}
// 4800000000004E1344B262C46CEABB85EFCDAB90785634129841E5B8E40781CF74DABF592817DE48711D778648DEAFB298F409274B52FABBFBCF7E7DF7E20DE1D0C3F657FB8595C1
// 4800000000004D1244B262C46CEABB85EFCDAB90785634129841E5B8E40781CF74DABF592817DE48711D778648DEAFB298F409274B52FABBFBCF7E7DF7E20DE1D0C3F657FB8595C1
