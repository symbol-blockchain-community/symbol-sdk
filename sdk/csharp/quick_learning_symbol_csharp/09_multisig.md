# 9.マルチシグ化
アカウントのマルチシグ化について説明します。


### 注意事項

一つのマルチシグアカウントに登録できる連署者の数は25個です。
一つのアカウントは最大25個のマルチシグの連署者になれます。
マルチシグは最大3階層まで構成できます。
本書では1階層のマルチシグのみ解説します。

## 9.0 アカウントの準備
この章のサンプルソースコードで使用するアカウントを作成し、それぞれの秘密鍵を出力しておきます。
本章でマルチシグ化したアカウントBobは、Carolの秘密鍵を紛失すると使えなくなってしまうのでご注意ください。
※本章のBobはマルチシグ化するため新たに作成することをおすすめします。

```cs
var bobKeyPair = KeyPair.GenerateNewKeyPair();
var carolKeyPair1 = KeyPair.GenerateNewKeyPair();
var carolKeyPair2 = KeyPair.GenerateNewKeyPair();
var carolKeyPair3 = KeyPair.GenerateNewKeyPair();
var carolKeyPair4 = KeyPair.GenerateNewKeyPair();
var carolKeyPair5 = KeyPair.GenerateNewKeyPair();

Console.WriteLine(bobKeyPair.PrivateKey);
Console.WriteLine(carolKeyPair1.PrivateKey);
Console.WriteLine(carolKeyPair2.PrivateKey);
Console.WriteLine(carolKeyPair3.PrivateKey);
Console.WriteLine(carolKeyPair4.PrivateKey);
Console.WriteLine(carolKeyPair5.PrivateKey);

var bobAddress = facade.Network.PublicKeyToAddress(bobKeyPair.PublicKey);
var carol1Address = facade.Network.PublicKeyToAddress(carol1KeyPair.PublicKey);
var carol2Address = facade.Network.PublicKeyToAddress(carol2KeyPair.PublicKey);
var carol3Address = facade.Network.PublicKeyToAddress(carol3KeyPair.PublicKey);
var carol4Address = facade.Network.PublicKeyToAddress(carol4KeyPair.PublicKey);
var carol5Address = facade.Network.PublicKeyToAddress(carol5KeyPair.PublicKey);
```

テストネットの場合はFAUCETでネットワーク手数料分をbobとcarol1に補給しておきます。

- Faucet
    - https://testnet.symbol.tools/

##### URL出力
```cs
Console.WriteLine($"https://testnet.symbol.tools/?recipient={bobAddress}&amount=20");
Console.WriteLine($"https://testnet.symbol.tools/?recipient={carol1Address}&amount=20");
```

## 9.1 マルチシグの登録

Symbolではマルチシグアカウントを新規に作成するのではなく、既存アカウントについて連署者を指定してマルチシグ化します。
マルチシグ化には連署者に指定されたアカウントの承諾署名(オプトイン)が必要なため、アグリゲートトランザクションを使用します。

```cs
var multisigTx = new EmbeddedMultisigAccountModificationTransactionV1(
    signerPublicKey: bobPublicKey, //マルチシグ化したいアカウントの公開鍵を指定
    minApprovalDelta: 3, //minApproval:承認のために必要な最小署名者数増分
    minRemovalDelta: 3, //minRemoval:除名のために必要な最小署名者数増分
    addressAdditions: new UnresolvedAddress[]
    {
        new(carol1Address),
        new(carol2Address),
        new(carol3Address),
        new(carol4Address),
    }
);

var innerTransactions = new IBaseTransaction[] {multisigTx};
var merkleHash = SymbolFacade.HashEmbeddedTransactions(innerTransactions, NetworkType.TESTNET);

var aggregateTx = new AggregateCompleteTransactionV2(
    network: NetworkType.TESTNET,
    transactions: innerTransactions,
    signerPublicKey: bobPublicKey,
    transactionsHash: merkleHash,
    deadline: facade.Network.CreateDeadline(3600)
);
TransactionHelper.SetMaxFee(aggregateTx, 100, 4/*連署者の数*/);
Console.WriteLine(aggregateTx.Fee);

var bobSignature = facade.SignTransaction(bobKeyPair, aggregateTx); //マルチシグ化したいアカウント
TransactionHelper.AttachSignature(aggregateTx, bobSignature);

var hash = facade.HashTransaction(aggregateTx);

var caror1Cosignature = new Cosignature(
    signature: carol1KeyPair.Sign(hash.bytes),
    signerPublicKey: carol1PublicKey
); //追加・除外対象として指定したアカウント

var caror2Cosignature = new Cosignature(
    signature: carol2KeyPair.Sign(hash.bytes),
    signerPublicKey: carol2PublicKey
); //追加・除外対象として指定したアカウント

var caror3Cosignature = new Cosignature(
    signature: carol3KeyPair.Sign(hash.bytes),
    signerPublicKey: carol3PublicKey
); //追加・除外対象として指定したアカウント

var caror4Cosignature = new Cosignature(
    signature: carol4KeyPair.Sign(hash.bytes),
    signerPublicKey: carol4PublicKey
); //追加・除外対象として指定したアカウント

aggregateTx.Cosignatures = new []
{
    caror1Cosignature,
    caror2Cosignature,
    caror3Cosignature,
    caror4Cosignature
};

var payload = GetPayload.GetPayload(aggregateTx);
var result = await Announce(payload);
Console.WriteLine(result);
```

## 9.2 確認

### マルチシグ化したアカウントの確認

https://symbol.github.io/symbol-openapi/v1.0.3/#tag/Multisig-routes/operation/getAccountMultisig

```cs
var multisigAccountInfo = JsonNode.Parse(await GetDataFromApi(node, $"/account/{bobAddress}/multisig"));
Console.WriteLine($"MultisigAccountInfo: {multisigAccountInfo}");
```
###### 出力例
```js
> MultisigAccountInfo: {
  "multisig": {
    "version": 1,
    "accountAddress": "987FBEA14740E5F97C72BD46B9C73860496A1B82923B02E8",
    "minApproval": 3,
    "minRemoval": 3,
    "cosignatoryAddresses": [
      "984F5658989C315F34E5BFC72834E2D3C13D7236334DC6F7",
      "989C37EBE03C38A48A8AC0BD37EBED48D0D6BECDF96527A6",
      "98B01F1BBBA35D6A727B3FBE8F4FFB423E175615F9CADA69",
      "98CA6BD25936FAAEFBE124729E0541EEC0DA080CCC8D3FFB"
    ],
    "multisigAddresses": []
  }
}
```

cosignatoryAddressesが連署者として登録されていることがわかります。
また、minApproval:3 によりトランザクションが成立するために必要な署名数3
minRemoval: 3により連署者を取り外すために必要な署名者数は3であることがわかります。

### 連署者アカウントの確認
```cs
var multisigAccountInfo = JsonNode.Parse(await GetDataFromApi(node, $"/account/{carol1Address}/multisig"));
Console.WriteLine($"MultisigAccountInfo: {multisigAccountInfo}");
```
###### 出力例
```cs
> MultisigAccountInfo: {
  "multisig": {
    "version": 1,
    "accountAddress": "984F5658989C315F34E5BFC72834E2D3C13D7236334DC6F7",
    "minApproval": 0,
    "minRemoval": 0,
    "cosignatoryAddresses": [],
    "multisigAddresses": [
      "987FBEA14740E5F97C72BD46B9C73860496A1B82923B02E8"
    ]
  }
}
```

multisigAddresses に対して連署する権利を持っていることが分かります。

## 9.3 マルチシグ署名

マルチシグ化したアカウントからモザイクを送信します。

### アグリゲートコンプリートトランザクションで送信

アグリゲートコンプリートトランザクションの場合、ノードにアナウンスする前に連署者の署名を全て集めてからトランザクションを作成します。

```cs
var tx = new EmbeddedTransferTransactionV1(
    network: NetworkType.TESTNET,
    recipientAddress: aliceAddress,
    signerPublicKey: bobPublicKey, 
    mosaics: new UnresolvedMosaic[]
    {
        new (
            mosaicId: new UnresolvedMosaicId(IdGenerator.GenerateNamespaceId("symbol.xym")),
            amount: new Amount(1000000)
            )
    },
    message: Converter.Utf8ToPlainMessage("test")
);

var innerTransactions = new IBaseTransaction[] {tx};
var merkleHash = SymbolFacade.HashEmbeddedTransactions(innerTransactions);

var aggregateTx = new AggregateCompleteTransactionV2(
    network: NetworkType.TESTNET,
    signerPublicKey: carol1PublicKey,
    transactions: innerTransactions,
    transactionsHash: merkleHash,
    deadline: facade.Network.CreateDeadline(3600)
);

TransactionHelper.SetMaxFee(aggregateTx, 100, 2/*連署者の数*/);

var signature = facade.SignTransaction(carol1KeyPair, aggregateTx); //起案者による署名
TransactionHelper.AttachSignature(aggregateTx, signature);

var hash = facade.HashTransaction(aggregateTx);
var cosignature1 = new Cosignature(
    signature: carol2KeyPair.Sign(hash.bytes),
    signerPublicKey: carol2PublicKey
); //連署者による署名
var cosignature2 = new Cosignature(
    signature: carol3KeyPair.Sign(hash.bytes),
    signerPublicKey: carol3PublicKey
); //連署者による署名
aggregateTx.Cosignatures = new [] {cosignature1, cosignature2};

var payload = TransactionHelper.GetPayload(aggregateTx);
var result = await Announce(payload);
Console.WriteLine(result);
```

### アグリゲートボンデッドトランザクションで送信

アグリゲートボンデッドトランザクションの場合は連署者を指定せずにアナウンスできます。
事前にハッシュロックでトランザクションを留め置きしておくことを宣言しておき、連署者がネットワーク上に留め置きされたトランザクションに追加署名することで完成となります。

```cs
var tx = new EmbeddedTransferTransactionV1(
    recipientAddress: aliceAddress,
    signerPublicKey: bobPublicKey,
    mosaics: new UnresolvedMosaic[]
    {
        new(
            mosaicId: new UnresolvedMosaicId(IdGenerator.GenerateNamespaceId("symbol.xym")),
            amount: new Amount(1000000))
    },
    message: Converter.Utf8ToPlainMessage("test")
);

var innerTransactions = new IBaseTransaction[] {tx};
var merkleHash = SymbolFacade.HashEmbeddedTransactions(innerTransactions, NetworkType.TESTNET);

var aggregateTx = new AggregateBondedTransactionV2(
    network: NetworkType.TESTNET,
    transactions: innerTransactions,
    signerPublicKey: carol1PublicKey,
    transactionsHash: merkleHash,
    deadline: facade.Network.CreateDeadline(3600)
);
TransactionHelper.SetMaxFee(aggregateTx, 100, 2/*連署者の数*/);

//署名
var carol1Signature = facade.SignTransaction(carol1KeyPair, aggregateTx);
var payloadBonded = TransactionHelper.AttachSignature(aggregateTx, carol1Signature);
//ボンデッドのペイロードを控えておく
Console.WriteLine(payloadBonded);

var hash = facade.HashTransaction(aggregateTx);
//連署テスト用にハッシュも控えておく
Console.WriteLine(hash);

//ハッシュロックTX作成
var hashLockTx = new HashLockTransactionV1(
    network: NetworkType.TESTNET,
    signerPublicKey: carol1PublicKey,
    mosaic: new UnresolvedMosaic(
        mosaicId: new UnresolvedMosaicId(namespaceId),
        amount: new Amount(10 * 1000000)
    ),
    duration: new BlockDuration(480),
    hash: hash,
    deadline: facade.Network.CreateDeadline(3600)
);
TransactionHelper.SetMaxFee(hashLockTx, 100);

//署名
var signature = facade.SignTransaction(carol1KeyPair, hashLockTx);
var payload = TransactionHelper.AttachSignature(hashLockTx, signature);

//ハッシュロックTXをアナウンス
var result = await Announce(payload);
Console.WriteLine(result);
```

```cs
//ハッシュロックの承認を確認した後、ボンデッドTXをアナウンス
var payload = "{\"payload\": \"100100000000000001C0964F392FE2D55373E69AF3DB4DA33E302B2DFA1C29BBA4B6CA1FC5F70CAB5F832D6ED0C38C3B49DD4D322C2A0A6E8F336071ADD0BA878CDBDFCCD0AA5B0D414CDBF3CAAE880CFD095E0AD8A87B56383C63BA4FDFC6980CFE9E4D82EFE121000000000298414280BB000000000000D33B0D4F03000000175EED761F28B8E3E053A44F374A0D97C4D3A27A558E6BC364FB38B7F31F5363680000000000000065000000000000003120B9824211E91C596C98B4FA46E129FE26B2EAD259C5D4C90C41836D18E9840000000001985441982982FFFC666CB09288FCB4B8F820E8B0B5F77093075AEF0500010000000000EEAFF441BA994BE740420F00000000000074657374000000\"}";
var result = await AnnounceBonded(payload);
```
ボンデッドトランザクションがノードに取り込まれるとパーシャル署名状態となるので、8.ロックで紹介した連署を使用して、マルチシグアカウントで連署します。
連署をサポートするウォレットで承認することもできます。


## 9.4 マルチシグ送信の確認

マルチシグで行った送信トランザクションの結果を確認してみます。

```cs
var hash = "EFCD8B70E854BDE519E6D576DF563BF22351338A6453EF87372072231140B674";
var txInfo = JsonNode.Parse(await GetDataFromApi(node, $"/transactions/confirmed/{hash}"));
Console.WriteLine($"TxInfo: {txInfo}");
```
###### 出力例
```cs
> TxInfo: {
  "meta": {
    "height": "377165",
    "hash": "EFCD8B70E854BDE519E6D576DF563BF22351338A6453EF87372072231140B674",
    "merkleComponentHash": "92D6AE32B798F437930315643E33F50DA47D0D75DE6334715F72588E41CAA138",
    "index": 1,
    "timestamp": "14144733313",
    "feeMultiplier": 100
  },
  "transaction": {
    "size": 480,
    "signature": "AD9385E7243EBB0ADD0DAD4A806FEA930A7310FD53554F93679C629011AF2B496DE3A986C7469C99DBA151A1CB8F1DF15EBDEA25D84CCAD36F345013D1EEBB04",
    "signerPublicKey": "414CDBF3CAAE880CFD095E0AD8A87B56383C63BA4FDFC6980CFE9E4D82EFE121",
    "version": 2,
    "network": 152,
    "type": 16705,
    "maxFee": "48000",
    "deadline": "14151912978",
    "transactionsHash": "175EED761F28B8E3E053A44F374A0D97C4D3A27A558E6BC364FB38B7F31F5363",
    "cosignatures": [
      {
        "version": "0",
        "signerPublicKey": "561AA3785DB0545F375A8315C1F7F785FE2445D06FE6B83AC5D13B70E3CE5A4B",
        "signature": "ACFBA8E408A7098A199AC6E14DF060C922E126EB4AB6B2C290C03B8EAFB5EC028363EA94D6BA4090D9F8D74BF78D997018B1DFB593A4AE7F6C84E5B179A04809"
      },
      {
        "version": "0",
        "signerPublicKey": "9025491143901E01CCE5C841E9883FC1C0DB00711CA56E9CD45BF2371E9E19D3",
        "signature": "A4D902EF4249038F6C348E6BA4CC8BB44F7222CDADECCF7FC6D826DF797A102FAEA408CAB6DCA54526D67364AE16A6B50BECC888644451F2D59FA62D2E1A9908"
      }
    ],
    "transactions": [
      {
        "meta": {
          "height": "377165",
          "aggregateHash": "EFCD8B70E854BDE519E6D576DF563BF22351338A6453EF87372072231140B674",
          "aggregateId": "64380E01D7D26E76F92974A9",
          "index": 0,
          "timestamp": "14144733313",
          "feeMultiplier": 100
        },
        "transaction": {
          "signerPublicKey": "3120B9824211E91C596C98B4FA46E129FE26B2EAD259C5D4C90C41836D18E984",
          "version": 1,
          "network": 152,
          "type": 16724,
          "recipientAddress": "982982FFFC666CB09288FCB4B8F820E8B0B5F77093075AEF",
          "message": "0074657374",
          "mosaics": [
            {
              "id": "E74B99BA41F4AFEE",
              "amount": "1000000"
            }
          ]
        },
        "id": "64380E01D7D26E76F92974AA"
      }
    ]
  },
  "id": "64380E01D7D26E76F92974A9"
}
```

- マルチシグアカウント
    - Bob
        - transaction.transactions[0].transaction.signerPublicKey
            - 3120B9824211E91C596C98B4FA46E129FE26B2EAD259C5D4C90C41836D18E984
- 起案者アカウント
    - Carol1
        - transaction.signerPublicKey
            - 414CDBF3CAAE880CFD095E0AD8A87B56383C63BA4FDFC6980CFE9E4D82EFE121
- 連署者アカウント
    - Carol2
        - transaction.cosignatures[0].signerPublicKey
            - 561AA3785DB0545F375A8315C1F7F785FE2445D06FE6B83AC5D13B70E3CE5A4B
    - Carol3
        - transaction.cosignatures[1].signerPublicKey
            - 9025491143901E01CCE5C841E9883FC1C0DB00711CA56E9CD45BF2371E9E19D3

## 9.5 マルチシグ構成変更

### マルチシグ構成の縮小

連署者を減らすには除名対象アドレスに指定するとともに最小署名者数を連署者数が超えてしまわないように調整してトランザクションをアナウンスします。
除名対象者を連署者に含む必要はありません。

```cs
var multisigTx = new EmbeddedMultisigAccountModificationTransactionV1(
    minApprovalDelta: 255, //承認のために必要な最小署名者数増分
    minRemovalDelta: 255, //除名のために必要な最小署名者数増分
    addressAdditions: new UnresolvedAddress[]
    {
        new(carol3Address)
    },
    signerPublicKey: bobPublicKey //構成変更したいマルチシグアカウントの公開鍵を指定
);

var innerTransactions = new IBaseTransaction[] {multisigTx};
var merkleHash = SymbolFacade.HashEmbeddedTransactions(innerTransactions, NetworkType.TESTNET);

var aggregateTx = new AggregateCompleteTransactionV2(
    network: NetworkType.TESTNET,
    transactions: innerTransactions,
    signerPublicKey: carol1PublicKey,
    transactionsHash: merkleHash,
    deadline: facade.Network.CreateDeadline(3600)
);
TransactionHelper.SetMaxFee(aggregateTx, 100, 2/*連署者の数*/);

//署名
var carol1Signature = facade.SignTransaction(carol1KeyPair, aggregateTx);
TransactionHelper.AttachSignature(aggregateTx, carol1Signature);

var hash = facade.HashTransaction(aggregateTx);
Console.WriteLine(hash);

var cosignature1 = new Cosignature(
    signature: carol2KeyPair.Sign(hash.bytes),
    signerPublicKey: carol2PublicKey
); //連署者による署名

var cosignature2 = new Cosignature(
    signature: carol4KeyPair.Sign(hash.bytes),
    signerPublicKey: carol4PublicKey
); //連署者による署名
aggregateTx.Cosignatures = new [] {cosignature1, cosignature2};

var payload = TransactionHelper.GetPayload(aggregateTx);
var result = await Announce(payload);
Console.WriteLine(result);
```

※MinApprovalDelta,MinRemovalDeltaはbyte型です。byte型で-1を表すには最大値（255）を使って表現することができます。同じく-2は254です。

### 連署者構成の差替え

連署者を差し替えるには、追加対象アドレスと除名対象アドレスを指定します。
新たに追加指定するアカウントの連署は必ず必要です。

```cs
var multisigTx = new EmbeddedMultisigAccountModificationTransactionV1(
    addressAdditions: new UnresolvedAddress[]
    {
        new(carol5Address)
    }, //追加対象アドレス
    addressDeletions: new UnresolvedAddress[]
    {
        new(carol4Address)
    }, //除名対象アドレス
    signerPublicKey: bobPublicKey //構成変更したいマルチシグアカウントの公開鍵を指定
); // 承認、除名共に人数の増減はないため、MinApprovalDelta, MinRemovalDeltaは不要

var innerTransactions = new IBaseTransaction[] {multisigTx};
var merkleHash = SymbolFacade.HashEmbeddedTransactions(innerTransactions, NetworkType.TESTNET);

var aggregateTx = new AggregateCompleteTransactionV2(
    network: NetworkType.TESTNET,
    transactions: innerTransactions,
    signerPublicKey: carol1PublicKey,
    transactionsHash: merkleHash,
    deadline: facade.Network.CreateDeadline(3600)
);

TransactionHelper.SetMaxFee(aggregateTx, 100, 2/*連署者の数*/);

//署名
var carol1Signature = facade.SignTransaction(carol1KeyPair, aggregateTx); //起案者による署名
TransactionHelper.AttachSignature(aggregateTx, carol1Signature);

var hash = facade.HashTransaction(aggregateTx);
Console.WriteLine(hash);

var cosignature1 = new Cosignature(
    signature: carol2KeyPair.Sign(hash.bytes),
    signerPublicKey: carol2PublicKey
); //連署者による署名

var cosignature2 = new Cosignature(
    signature: carol5KeyPair.Sign(hash.bytes),
    signerPublicKey: carol5PublicKey
); //承諾アカウントによる署名

aggregateTx.Cosignatures = new [] {cosignature1, cosignature2};

var payload = TransactionHelper.GetPayload(aggregateTx);
var result = await Announce(payload);
Console.WriteLine(result);
```

## 9.6 現場で使えるヒント

### 多要素認証

秘密鍵の管理を複数の端末に分散させることができます。
セキュリティ用の鍵を用意しておけば、紛失・漏洩時にも安全に回復することができます。
また、マルチシグの安全運用については盗難時と紛失時の2パターンを検討しておく必要があるのでご注意ください。
- 盗難時：ほかにも秘密鍵を使える人がいる。
- 紛失時：だれもその秘密鍵を使えなくなる。


### アカウントの所有

マルチシグ化したアカウントの秘密鍵は無効化し、マルチシグを解除しない限りたとえ秘密鍵を知っていたとしても
モザイク送信などはできなくなります。
モザイクの章で説明した通り、所有を「自分の意思で手放すことができる状態」だとすると、
マルチシグ化したアカウントがもつモザイク等の所有者は連署者になります。
また、Symbolではマルチシグの構成変更が可能ですのでアカウントの所有を他の連署者に安全に移転することができます。

### ワークフロー

Symbolではマルチシグを3階層まで構成することができます(マルチレベルマルチシグ)。
マルチレベルマルチシグを用いることで、バックアップ鍵を不正に持ち出して連署を完成させたり、承認者と監査役だけで署名を完成させるといったことを防ぐことができます。
これによって、ブロックチェーン上にトランザクションが存在することが現実社会のワークフローなどの条件を満たした証拠として提示することができます。
