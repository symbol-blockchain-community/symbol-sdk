using SymbolSdk.Symbol;
using SymbolSdk;

namespace Test.Symbol.Model;

public class ReceiptTest 
{
    [Test] 
    public void HarvestFeeReceipt_receipts_1() 
    { 
        const string payload = "300000000000432144B262C46CEABB85EFCDAB90785634129841E5B8E40781CF74DABF592817DE48711D778648DEAFB2"; 
        var receipt = new HarvestFeeReceipt(
            mosaic: new Mosaic(
                mosaicId: new MosaicId(9636553580561478212),
                amount: new Amount(1311768467294899695)
                ), 
            targetAddress: new Address("TBA6LOHEA6A465G2X5MSQF66JBYR254GJDPK7MQ")
            ); 
        Assert.Multiple(() => 
        { 
            Assert.That(Converter.BytesToHex(receipt.Serialize()), Is.EqualTo(payload));
            Assert.That(Converter.BytesToHex(ReceiptFactory.Deserialize(payload).Serialize()), Is.EqualTo(payload));
        });
    }
    [Test] 
    public void InflationReceipt_receipts_2() 
    { 
        const string payload = "180000000000435144B262C46CEABB85EFCDAB9078563412"; 
        var receipt = new InflationReceipt(
            mosaic: new Mosaic(
                mosaicId: new MosaicId(9636553580561478212),
                amount: new Amount(1311768467294899695)
            )
        ); 
        Assert.Multiple(() => 
        { 
            Assert.That(Converter.BytesToHex(receipt.Serialize()), Is.EqualTo(payload));
            Assert.That(Converter.BytesToHex(ReceiptFactory.Deserialize(payload).Serialize()), Is.EqualTo(payload));
        });
    }
    [Test] 
    public void LockHashCreatedFeeReceipt_receipts_3() 
    { 
        const string payload = "300000000000483144B262C46CEABB85EFCDAB90785634129841E5B8E40781CF74DABF592817DE48711D778648DEAFB2"; 
        var receipt = new LockHashCreatedFeeReceipt(
            mosaic: new Mosaic(
                mosaicId: new MosaicId(9636553580561478212),
                amount: new Amount(1311768467294899695)
            ), 
            targetAddress: new Address("TBA6LOHEA6A465G2X5MSQF66JBYR254GJDPK7MQ")
        ); 
        Assert.Multiple(() => 
        { 
            Assert.That(Converter.BytesToHex(receipt.Serialize()), Is.EqualTo(payload));
            Assert.That(Converter.BytesToHex(ReceiptFactory.Deserialize(payload).Serialize()), Is.EqualTo(payload));
        });
    }
    [Test] 
    public void LockHashCompletedFeeReceipt_receipts_4() 
    { 
        const string payload = "300000000000482244B262C46CEABB85EFCDAB90785634129841E5B8E40781CF74DABF592817DE48711D778648DEAFB2"; 
        var receipt = new LockHashCompletedFeeReceipt(
            mosaic: new Mosaic(
                mosaicId: new MosaicId(9636553580561478212),
                amount: new Amount(1311768467294899695)
            ), 
            targetAddress: new Address("TBA6LOHEA6A465G2X5MSQF66JBYR254GJDPK7MQ")
        ); 
        Assert.Multiple(() => 
        { 
            Assert.That(Converter.BytesToHex(receipt.Serialize()), Is.EqualTo(payload));
            Assert.That(Converter.BytesToHex(ReceiptFactory.Deserialize(payload).Serialize()), Is.EqualTo(payload));
        });
    }
    [Test] 
    public void LockHashExpiredFeeReceipt_receipts_5() 
    { 
        const string payload = "300000000000482344B262C46CEABB85EFCDAB90785634129841E5B8E40781CF74DABF592817DE48711D778648DEAFB2"; 
        var receipt = new LockHashExpiredFeeReceipt(
            mosaic: new Mosaic(
                mosaicId: new MosaicId(9636553580561478212),
                amount: new Amount(1311768467294899695)
            ), 
            targetAddress: new Address("TBA6LOHEA6A465G2X5MSQF66JBYR254GJDPK7MQ")
        ); 
        Assert.Multiple(() => 
        { 
            Assert.That(Converter.BytesToHex(receipt.Serialize()), Is.EqualTo(payload));
            Assert.That(Converter.BytesToHex(ReceiptFactory.Deserialize(payload).Serialize()), Is.EqualTo(payload));
        });
    }
    [Test] 
    public void LockSecretCreatedFeeReceipt_receipts_6() 
    { 
        const string payload = "300000000000523144B262C46CEABB85EFCDAB90785634129841E5B8E40781CF74DABF592817DE48711D778648DEAFB2"; 
        var receipt = new LockSecretCreatedFeeReceipt(
            mosaic: new Mosaic(
                mosaicId: new MosaicId(9636553580561478212),
                amount: new Amount(1311768467294899695)
            ), 
            targetAddress: new Address("TBA6LOHEA6A465G2X5MSQF66JBYR254GJDPK7MQ")
        ); 
        Assert.Multiple(() => 
        { 
            Assert.That(Converter.BytesToHex(receipt.Serialize()), Is.EqualTo(payload));
            Assert.That(Converter.BytesToHex(ReceiptFactory.Deserialize(payload).Serialize()), Is.EqualTo(payload));
        });
    }
    [Test] 
    public void LockSecretCompletedFeeReceipt_receipts_7() 
    { 
        const string payload = "300000000000522244B262C46CEABB85EFCDAB90785634129841E5B8E40781CF74DABF592817DE48711D778648DEAFB2"; 
        var receipt = new LockSecretCompletedFeeReceipt(
            mosaic: new Mosaic(
                mosaicId: new MosaicId(9636553580561478212),
                amount: new Amount(1311768467294899695)
            ), 
            targetAddress: new Address("TBA6LOHEA6A465G2X5MSQF66JBYR254GJDPK7MQ")
        ); 
        Assert.Multiple(() => 
        { 
            Assert.That(Converter.BytesToHex(receipt.Serialize()), Is.EqualTo(payload));
            Assert.That(Converter.BytesToHex(ReceiptFactory.Deserialize(payload).Serialize()), Is.EqualTo(payload));
        });
    }
    [Test] 
    public void LockSecretExpiredFeeReceipt_receipts_8() 
    { 
        const string payload = "300000000000522344B262C46CEABB85EFCDAB90785634129841E5B8E40781CF74DABF592817DE48711D778648DEAFB2"; 
        var receipt = new LockSecretExpiredFeeReceipt(
            mosaic: new Mosaic(
                mosaicId: new MosaicId(9636553580561478212),
                amount: new Amount(1311768467294899695)
            ), 
            targetAddress: new Address("TBA6LOHEA6A465G2X5MSQF66JBYR254GJDPK7MQ")
        ); 
        Assert.Multiple(() => 
        { 
            Assert.That(Converter.BytesToHex(receipt.Serialize()), Is.EqualTo(payload));
            Assert.That(Converter.BytesToHex(ReceiptFactory.Deserialize(payload).Serialize()), Is.EqualTo(payload));
        });
    }
    [Test] 
    public void MosaicExpiredReceipt_receipts_9() 
    { 
        const string payload = "1000000000004D4144B262C46CEABB85"; 
        var receipt = new MosaicExpiredReceipt(
            artifactId: new MosaicId(9636553580561478212)
        ); 
        Assert.Multiple(() => 
        { 
            Assert.That(Converter.BytesToHex(receipt.Serialize()), Is.EqualTo(payload));
            Assert.That(Converter.BytesToHex(ReceiptFactory.Deserialize(payload).Serialize()), Is.EqualTo(payload));
        });
    }
    [Test] 
    public void MosaicRentalFeeReceipt_receipts_10() 
    { 
        const string payload = "4800000000004D1244B262C46CEABB85EFCDAB90785634129841E5B8E40781CF74DABF592817DE48711D778648DEAFB298F409274B52FABBFBCF7E7DF7E20DE1D0C3F657FB8595C1"; 
        var receipt = new MosaicRentalFeeReceipt(
            mosaic: new Mosaic(
                mosaicId: new MosaicId(9636553580561478212),
                amount: new Amount(1311768467294899695)
            ), 
            senderAddress: new Address("TBA6LOHEA6A465G2X5MSQF66JBYR254GJDPK7MQ"),
            recipientAddress: new Address("TD2ASJ2LKL5LX66PPZ67PYQN4HIMH5SX7OCZLQI")
        ); 
        Assert.Multiple(() => 
        { 
            Assert.That(Converter.BytesToHex(receipt.Serialize()), Is.EqualTo(payload));
            Assert.That(Converter.BytesToHex(ReceiptFactory.Deserialize(payload).Serialize()), Is.EqualTo(payload));
        });
    }
    [Test] 
    public void NamespaceExpiredReceipt_receipts_11() 
    { 
        const string payload = "1000000000004E41F6CFC5756D0AC4B6"; 
        var receipt = new NamespaceExpiredReceipt(
            artifactId: new NamespaceId(13169662675581784054)
        );
        Assert.Multiple(() => 
        { 
            Assert.That(Converter.BytesToHex(receipt.Serialize()), Is.EqualTo(payload));
            Assert.That(Converter.BytesToHex(ReceiptFactory.Deserialize(payload).Serialize()), Is.EqualTo(payload));
        });
    }
    [Test] 
    public void NamespaceRentalFeeReceipt_receipts_13() 
    { 
        const string payload = "4800000000004D1244B262C46CEABB85EFCDAB90785634129841E5B8E40781CF74DABF592817DE48711D778648DEAFB298F409274B52FABBFBCF7E7DF7E20DE1D0C3F657FB8595C1"; 
        var receipt = new MosaicRentalFeeReceipt(
            mosaic: new Mosaic(
                mosaicId: new MosaicId(9636553580561478212),
                amount: new Amount(1311768467294899695)
            ), 
            senderAddress: new Address("TBA6LOHEA6A465G2X5MSQF66JBYR254GJDPK7MQ"),
            recipientAddress: new Address("TD2ASJ2LKL5LX66PPZ67PYQN4HIMH5SX7OCZLQI")
        ); 
        Assert.Multiple(() => 
        { 
            Assert.That(Converter.BytesToHex(receipt.Serialize()), Is.EqualTo(payload));
            Assert.That(Converter.BytesToHex(ReceiptFactory.Deserialize(payload).Serialize()), Is.EqualTo(payload));
        });
    }
}

