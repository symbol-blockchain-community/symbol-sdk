import 'package:test/test.dart';
import '../../../bin/symbol/models.dart';
import '../../../bin/utils/converter.dart';

void main() {
  group('receipts test', () => {
    test('HarvestFeeReceipt_receipts_1', () {
      var payload = '300000000000432144B262C46CEABB85EFCDAB90785634129841E5B8E40781CF74DABF592817DE48711D778648DEAFB2';
      var receipt = HarvestFeeReceipt(
        mosaic: Mosaic(
          mosaicId: MosaicId('9636553580561478212'),
          amount: Amount(1311768467294899695),
        ),
        targetAddress: Address('TBA6LOHEA6A465G2X5MSQF66JBYR254GJDPK7MQ')
      );
      expect(bytesToHex((ReceiptFactory().deserialize(payload)).serialize()), payload);
      expect(bytesToHex(receipt.serialize()).toUpperCase(), payload);
    }),
    test('InflationReceipt_receipts_2', () {
      var payload = '180000000000435144B262C46CEABB85EFCDAB9078563412';
      var receipt = InflationReceipt(
        mosaic: Mosaic(
          mosaicId: MosaicId('9636553580561478212'),
          amount: Amount(1311768467294899695),
        ),
      );
      expect(bytesToHex((ReceiptFactory().deserialize(payload)).serialize()), payload);
      expect(bytesToHex(receipt.serialize()).toUpperCase(), payload);
    }),
    test('LockHashCreatedFeeReceipt_receipts_3', () {
      var payload = '300000000000483144B262C46CEABB85EFCDAB90785634129841E5B8E40781CF74DABF592817DE48711D778648DEAFB2';
      var receipt = LockHashCreatedFeeReceipt(
        mosaic: Mosaic(
          mosaicId: MosaicId('9636553580561478212'),
          amount: Amount(1311768467294899695),
        ),
        targetAddress: Address('TBA6LOHEA6A465G2X5MSQF66JBYR254GJDPK7MQ')
      );
      expect(bytesToHex((ReceiptFactory().deserialize(payload)).serialize()), payload);
      expect(bytesToHex(receipt.serialize()).toUpperCase(), payload);
    }),
    test('LockHashCompletedFeeReceipt_receipts_4', () {
      var payload = '300000000000482244B262C46CEABB85EFCDAB90785634129841E5B8E40781CF74DABF592817DE48711D778648DEAFB2';
      var receipt = LockHashCompletedFeeReceipt(
        mosaic: Mosaic(
          mosaicId: MosaicId('9636553580561478212'),
          amount: Amount(1311768467294899695),
        ),
        targetAddress: Address('TBA6LOHEA6A465G2X5MSQF66JBYR254GJDPK7MQ')
      );
      expect(bytesToHex((ReceiptFactory().deserialize(payload)).serialize()), payload);
      expect(bytesToHex(receipt.serialize()).toUpperCase(), payload);
    }),
    test('LockHashExpiredFeeReceipt_receipts_5', () {
      var payload = '300000000000482344B262C46CEABB85EFCDAB90785634129841E5B8E40781CF74DABF592817DE48711D778648DEAFB2';
      var receipt = LockHashExpiredFeeReceipt(
        mosaic: Mosaic(
          mosaicId: MosaicId('9636553580561478212'),
          amount: Amount(1311768467294899695),
        ),
        targetAddress: Address('TBA6LOHEA6A465G2X5MSQF66JBYR254GJDPK7MQ')
      );
      expect(bytesToHex((ReceiptFactory().deserialize(payload)).serialize()), payload);
      expect(bytesToHex(receipt.serialize()).toUpperCase(), payload);
    }),
    test('LockSecretCreatedFeeReceipt_receipts_6', () {
      var payload = '300000000000523144B262C46CEABB85EFCDAB90785634129841E5B8E40781CF74DABF592817DE48711D778648DEAFB2';
      var receipt = LockSecretCreatedFeeReceipt(
        mosaic: Mosaic(
          mosaicId: MosaicId('9636553580561478212'),
          amount: Amount(1311768467294899695),
        ),
        targetAddress: Address('TBA6LOHEA6A465G2X5MSQF66JBYR254GJDPK7MQ')
      );
      expect(bytesToHex((ReceiptFactory().deserialize(payload)).serialize()), payload);
      expect(bytesToHex(receipt.serialize()).toUpperCase(), payload);
    }),
    test('LockSecretCompletedFeeReceipt_receipts_7', () {
      var payload = '300000000000522244B262C46CEABB85EFCDAB90785634129841E5B8E40781CF74DABF592817DE48711D778648DEAFB2';
      var receipt = LockSecretCompletedFeeReceipt(
        mosaic: Mosaic(
          mosaicId: MosaicId('9636553580561478212'),
          amount: Amount(1311768467294899695),
        ),
        targetAddress: Address('TBA6LOHEA6A465G2X5MSQF66JBYR254GJDPK7MQ')
      );
      expect(bytesToHex((ReceiptFactory().deserialize(payload)).serialize()), payload);
      expect(bytesToHex(receipt.serialize()).toUpperCase(), payload);
    }),
    test('LockSecretExpiredFeeReceipt_receipts_8', () {
      var payload = '300000000000522344B262C46CEABB85EFCDAB90785634129841E5B8E40781CF74DABF592817DE48711D778648DEAFB2';
      var receipt = LockSecretExpiredFeeReceipt(
        mosaic: Mosaic(
          mosaicId: MosaicId('9636553580561478212'),
          amount: Amount(1311768467294899695),
        ),
        targetAddress: Address('TBA6LOHEA6A465G2X5MSQF66JBYR254GJDPK7MQ')
      );
      expect(bytesToHex((ReceiptFactory().deserialize(payload)).serialize()), payload);
      expect(bytesToHex(receipt.serialize()).toUpperCase(), payload);
    }),
    test('MosaicExpiredReceipt_receipts_9', () {
      var payload = '1000000000004D4144B262C46CEABB85';
      var receipt = MosaicExpiredReceipt(
        artifactId: MosaicId('9636553580561478212'),
      );
      expect(bytesToHex((ReceiptFactory().deserialize(payload)).serialize()), payload);
      expect(bytesToHex(receipt.serialize()).toUpperCase(), payload);
    }),
    test('MosaicRentalFeeReceipt_receipts_10', () {
      var payload = '4800000000004D1244B262C46CEABB85EFCDAB90785634129841E5B8E40781CF74DABF592817DE48711D778648DEAFB298F409274B52FABBFBCF7E7DF7E20DE1D0C3F657FB8595C1';
      var receipt = MosaicRentalFeeReceipt(
        mosaic: Mosaic(
          mosaicId: MosaicId('9636553580561478212'),
          amount: Amount(1311768467294899695),
        ),
        senderAddress: Address('TBA6LOHEA6A465G2X5MSQF66JBYR254GJDPK7MQ'),
        recipientAddress: Address('TD2ASJ2LKL5LX66PPZ67PYQN4HIMH5SX7OCZLQI')
      );
      expect(bytesToHex((ReceiptFactory().deserialize(payload)).serialize()), payload);
      expect(bytesToHex(receipt.serialize()).toUpperCase(), payload);
    }),
    test('NamespaceExpiredReceipt_receipts_11', () {
      var payload = '1000000000004E41F6CFC5756D0AC4B6';
      var receipt = NamespaceExpiredReceipt(
        artifactId: NamespaceId('13169662675581784054'),
      );
      expect(bytesToHex((ReceiptFactory().deserialize(payload)).serialize()), payload);
      expect(bytesToHex(receipt.serialize()).toUpperCase(), payload);
    }),
    test('NamespaceRentalFeeReceipt_receipts_13', () {
      var payload = '4800000000004D1244B262C46CEABB85EFCDAB90785634129841E5B8E40781CF74DABF592817DE48711D778648DEAFB298F409274B52FABBFBCF7E7DF7E20DE1D0C3F657FB8595C1';
      var receipt = MosaicRentalFeeReceipt(
        mosaic: Mosaic(
          mosaicId: MosaicId('9636553580561478212'),
          amount: Amount(1311768467294899695),
        ),
        senderAddress: Address('TBA6LOHEA6A465G2X5MSQF66JBYR254GJDPK7MQ'),
        recipientAddress: Address('TD2ASJ2LKL5LX66PPZ67PYQN4HIMH5SX7OCZLQI')
      );
      expect(bytesToHex((ReceiptFactory().deserialize(payload)).serialize()), payload);
      expect(bytesToHex(receipt.serialize()).toUpperCase(), payload);
    }),
  });
}
