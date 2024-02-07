import fs from 'fs';
import path from 'path';
import { promisify } from 'util';
import { hexToUint8, addressToString, PrivateKey, uint8ToHex } from '../../../src';
import { Network, PublicKey, KeyPair } from '../../../src/symbol';
import * as mocha from 'mocha';
import { expect } from 'chai';

const readFile = promisify(fs.readFile);

describe('Test keys', () => {
  it('should correct keys', async () => {
    const filePath = path.resolve(__dirname, '../../../../../tests/vectors/symbol/crypto/2.test-sign.json');
    const contents = await readFile(filePath, { encoding: 'utf-8' });
    const jsonMap = JSON.parse(contents);

    var counter = 0;

    for (const element of jsonMap) {
      if (counter > 100) return;
      var privateKey = new PrivateKey(element['privateKey']);
      var publicKey = element['publicKey'];
      var keyPair = new KeyPair(privateKey);
      var data = hexToUint8(element['data']);
      var signed = keyPair.sign(data);
      var signature = element['signature'];
      expect(uint8ToHex(keyPair.publicKey.bytes)).to.equal(publicKey);
      expect(uint8ToHex(signed.bytes)).to.equal(signature);
      counter++;
    }
  });
});