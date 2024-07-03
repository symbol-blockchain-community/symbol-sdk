<?php

namespace SymbolSdk\Symbol\Models;

require_once __DIR__ . '/../../../src/symbol/models.php';

use PHPUnit\Framework\TestCase;

class ReceiptTest extends TestCase
{
  public function testHarvestFeeReceipt_receipts_1()
  {
    $payload = '300000000000432144B262C46CEABB85EFCDAB90785634129841E5B8E40781CF74DABF592817DE48711D778648DEAFB2';
    $receipt = new HarvestFeeReceipt(
      mosaic: new Mosaic(
      mosaicId: new MosaicId('9636553580561478212'),
      amount: new Amount(1311768467294899695),
    ),
      targetAddress: new Address('TBA6LOHEA6A465G2X5MSQF66JBYR254GJDPK7MQ')
    );
    $this->assertEquals($payload, strtoupper(bin2hex($receipt->serialize())));
    $deserializedReceipt = ReceiptFactory::deserialize($receipt->serialize());
    $this->assertEquals($payload, strtoupper(bin2hex($deserializedReceipt->serialize())));
  }

  public function testInflationReceipt_receipts_2()
  {
    $payload = '180000000000435144B262C46CEABB85EFCDAB9078563412';
    $receipt = new InflationReceipt(
      mosaic: new Mosaic(
        mosaicId: new MosaicId('9636553580561478212'),
        amount: new Amount(1311768467294899695),
      ),
    );
    $this->assertEquals($payload, strtoupper(bin2hex($receipt->serialize())));
    $deserializedReceipt = ReceiptFactory::deserialize($receipt->serialize());
    $this->assertEquals($payload, strtoupper(bin2hex($deserializedReceipt->serialize())));
  }

  public function testLockHashCreatedFeeReceipt_receipts_3()
  {
    $payload = '300000000000483144B262C46CEABB85EFCDAB90785634129841E5B8E40781CF74DABF592817DE48711D778648DEAFB2';
    $receipt = new LockHashCreatedFeeReceipt(
      mosaic: new Mosaic(
        mosaicId: new MosaicId('9636553580561478212'),
        amount: new Amount(1311768467294899695),
      ),
      targetAddress: new Address('TBA6LOHEA6A465G2X5MSQF66JBYR254GJDPK7MQ')
    );
    $this->assertEquals($payload, strtoupper(bin2hex($receipt->serialize())));
    $deserializedReceipt = ReceiptFactory::deserialize($receipt->serialize());
    $this->assertEquals($payload, strtoupper(bin2hex($deserializedReceipt->serialize())));
  }

  public function testLockHashCompletedFeeReceipt_receipts_4()
  {
    $payload = '300000000000482244B262C46CEABB85EFCDAB90785634129841E5B8E40781CF74DABF592817DE48711D778648DEAFB2';
    $receipt = new LockHashCompletedFeeReceipt(
      mosaic: new Mosaic(
        mosaicId: new MosaicId('9636553580561478212'),
        amount: new Amount(1311768467294899695),
      ),
      targetAddress: new Address('TBA6LOHEA6A465G2X5MSQF66JBYR254GJDPK7MQ')
    );
    $this->assertEquals($payload, strtoupper(bin2hex($receipt->serialize())));
    $deserializedReceipt = ReceiptFactory::deserialize($receipt->serialize());
    $this->assertEquals($payload, strtoupper(bin2hex($deserializedReceipt->serialize())));
  }

  public function testLockHashExpiredFeeReceipt_receipts_5()
  {
    $payload = '300000000000482344B262C46CEABB85EFCDAB90785634129841E5B8E40781CF74DABF592817DE48711D778648DEAFB2';
    $receipt = new LockHashExpiredFeeReceipt(
      mosaic: new Mosaic(
        mosaicId: new MosaicId('9636553580561478212'),
        amount: new Amount(1311768467294899695),
      ),
      targetAddress: new Address('TBA6LOHEA6A465G2X5MSQF66JBYR254GJDPK7MQ')
    );
    $this->assertEquals($payload, strtoupper(bin2hex($receipt->serialize())));
    $deserializedReceipt = ReceiptFactory::deserialize($receipt->serialize());
    $this->assertEquals($payload, strtoupper(bin2hex($deserializedReceipt->serialize())));
  }

  public function testLockSecretCreatedFeeReceipt_receipts_6()
  {
    $payload = '300000000000523144B262C46CEABB85EFCDAB90785634129841E5B8E40781CF74DABF592817DE48711D778648DEAFB2';
    $receipt = new LockSecretCreatedFeeReceipt(
      mosaic: new Mosaic(
        mosaicId: new MosaicId('9636553580561478212'),
        amount: new Amount(1311768467294899695),
      ),
      targetAddress: new Address('TBA6LOHEA6A465G2X5MSQF66JBYR254GJDPK7MQ')
    );
    $this->assertEquals($payload, strtoupper(bin2hex($receipt->serialize())));
    $deserializedReceipt = ReceiptFactory::deserialize($receipt->serialize());
    $this->assertEquals($payload, strtoupper(bin2hex($deserializedReceipt->serialize())));
  }

  public function testLockSecretCompletedFeeReceipt_receipts_7()
  {
    $payload = '300000000000522244B262C46CEABB85EFCDAB90785634129841E5B8E40781CF74DABF592817DE48711D778648DEAFB2';
    $receipt = new LockSecretCompletedFeeReceipt(
      mosaic: new Mosaic(
        mosaicId: new MosaicId('9636553580561478212'),
        amount: new Amount(1311768467294899695),
      ),
      targetAddress: new Address('TBA6LOHEA6A465G2X5MSQF66JBYR254GJDPK7MQ')
    );
    $this->assertEquals($payload, strtoupper(bin2hex($receipt->serialize())));
    $deserializedReceipt = ReceiptFactory::deserialize($receipt->serialize());
    $this->assertEquals($payload, strtoupper(bin2hex($deserializedReceipt->serialize())));
  }

  public function testLockSecretExpiredFeeReceipt_receipts_8()
  {
    $payload = '300000000000522344B262C46CEABB85EFCDAB90785634129841E5B8E40781CF74DABF592817DE48711D778648DEAFB2';
    $receipt = new LockSecretExpiredFeeReceipt(
      mosaic: new Mosaic(
        mosaicId: new MosaicId('9636553580561478212'),
        amount: new Amount(1311768467294899695),
      ),
      targetAddress: new Address('TBA6LOHEA6A465G2X5MSQF66JBYR254GJDPK7MQ')
    );
    $this->assertEquals($payload, strtoupper(bin2hex($receipt->serialize())));
    $deserializedReceipt = ReceiptFactory::deserialize($receipt->serialize());
    $this->assertEquals($payload, strtoupper(bin2hex($deserializedReceipt->serialize())));
  }

  public function testMosaicExpiredReceipt_receipts_9()
  {
    $payload = '1000000000004D4144B262C46CEABB85';
    $receipt = new MosaicExpiredReceipt(
      artifactId: new MosaicId('9636553580561478212'),
    );
    $this->assertEquals($payload, strtoupper(bin2hex($receipt->serialize())));
    $deserializedReceipt = ReceiptFactory::deserialize($receipt->serialize());
    $this->assertEquals($payload, strtoupper(bin2hex($deserializedReceipt->serialize())));
  }

  public function testMosaicRentalFeeReceipt_receipts_10()
  {
    $payload = '4800000000004D1244B262C46CEABB85EFCDAB90785634129841E5B8E40781CF74DABF592817DE48711D778648DEAFB298F409274B52FABBFBCF7E7DF7E20DE1D0C3F657FB8595C1';
    $receipt = new MosaicRentalFeeReceipt(
      mosaic: new Mosaic(
        mosaicId: new MosaicId('9636553580561478212'),
        amount: new Amount(1311768467294899695),
      ),
      senderAddress: new Address('TBA6LOHEA6A465G2X5MSQF66JBYR254GJDPK7MQ'),
      recipientAddress: new Address('TD2ASJ2LKL5LX66PPZ67PYQN4HIMH5SX7OCZLQI')
    );
    $this->assertEquals($payload, strtoupper(bin2hex($receipt->serialize())));
    $deserializedReceipt = ReceiptFactory::deserialize($receipt->serialize());
    $this->assertEquals($payload, strtoupper(bin2hex($deserializedReceipt->serialize())));
  }

  public function testNamespaceExpiredReceipt_receipts_11()
  {
    $payload = '1000000000004E41F6CFC5756D0AC4B6';
    $receipt = new NamespaceExpiredReceipt(
      artifactId: new NamespaceId('13169662675581784054'),
    );
    $this->assertEquals($payload, strtoupper(bin2hex($receipt->serialize())));
    $deserializedReceipt = ReceiptFactory::deserialize($receipt->serialize());
    $this->assertEquals($payload, strtoupper(bin2hex($deserializedReceipt->serialize())));
  }

  public function testNamespaceRentalFeeReceipt_receipts_13()
  {
    $payload = '4800000000004D1244B262C46CEABB85EFCDAB90785634129841E5B8E40781CF74DABF592817DE48711D778648DEAFB298F409274B52FABBFBCF7E7DF7E20DE1D0C3F657FB8595C1';
    $receipt = new MosaicRentalFeeReceipt(
      mosaic: new Mosaic(
        mosaicId: new MosaicId('9636553580561478212'),
        amount: new Amount(1311768467294899695),
      ),
      senderAddress: new Address('TBA6LOHEA6A465G2X5MSQF66JBYR254GJDPK7MQ'),
      recipientAddress: new Address('TD2ASJ2LKL5LX66PPZ67PYQN4HIMH5SX7OCZLQI')
    );
    $this->assertEquals($payload, strtoupper(bin2hex($receipt->serialize())));
    $deserializedReceipt = ReceiptFactory::deserialize($receipt->serialize());
    $this->assertEquals($payload, strtoupper(bin2hex($deserializedReceipt->serialize())));
  }
}
