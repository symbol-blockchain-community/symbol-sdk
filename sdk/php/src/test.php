<?php
require_once '../src/utils/converter.php';
require_once '../src/BaseValue.php';
require_once '../src/BinaryData.php';
require_once '../src/BinaryStream.php';
require_once '../src/utils/arrayHelpers.php';
require_once '../src/symbol/models.php';

function echoN($input)
{
	echo $input . "\n";
}

$ts = new TransferTransactionV1(
	signerPublicKey: new PublicKey(hex2bin('13B00FBB13C7644E13BD786F0EA4F97820022A2606759793A5D3525A03F92A2F')),
	network: new NetworkType(NetworkType::TESTNET),
	fee: new Amount(1000),
	deadline: new Timestamp(1000),
	recipientAddress: new UnresolvedAddress(Converter::addressToBinary('TA5LGYEWS6L2WYBQ75J2DGK7IOZHYVWFWRLOFWI')),
	mosaics: [
		new UnresolvedMosaic(
			new UnresolvedMosaicId(0x56148181AF8A6CFC),
			amount: new Amount(1000),
		),
		new UnresolvedMosaic(
			new UnresolvedMosaicId(0x56148181AF8A6C00),
			amount: new Amount(1000),
		)
	],
	message: "\x00" . iconv('UTF-8', 'SJIS', 'あいうえお')
);
echoN($ts);
echoN(bin2hex($ts->serialize()));

$ttt = TransferTransactionV1::deserialize(new BinaryReader($ts->serialize()));
echoN($ttt);

$t = TransactionFactory::deserialize($ts->serialize());
echoN($t);

/* echoN(bin2hex($ts->serialize()));
$ts2 = TransferTransactionV1::deserialize($ts->serialize());
echoN($ts2);

$ts = new TransferTransactionV1(
	signerPublicKey: new PublicKey(hex2bin('13B00FBB13C7644E13BD786F0EA4F97820022A2606759793A5D3525A03F92A2F')),
	network: new NetworkType(NetworkType::TESTNET),
	fee: new Amount(1000),
	deadline: new Timestamp(1000),
	recipientAddress: new UnresolvedAddress(Converter::addressToBinary('TA5LGYEWS6L2WYBQ75J2DGK7IOZHYVWFWRLOFWI')),
	mosaics: [
		new UnresolvedMosaic(
			new UnresolvedMosaicId(0x56148181AF8A6CFC),
			amount: new Amount(1000),
		),
		new UnresolvedMosaic(
			new UnresolvedMosaicId(0x56148181AF8A6C00),
			amount: new Amount(1000),
		)
	],
	message: "\x00" . iconv('UTF-8', 'SJIS', 'あいうえお')
);
*/
