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
    const filePath = path.resolve(__dirname, '../../../../../tests/vectors/symbol/crypto/1.test-keys.json');
    const contents = await readFile(filePath, { encoding: 'utf-8' });
    const jsonMap = JSON.parse(contents);

    var counter = 0;

    for (const element of jsonMap) {
      if (counter > 100) return; 
      const privateKey = new PrivateKey(element['privateKey']);
      const publicKey = element['publicKey'];
      var keyPair = new KeyPair(privateKey);
      expect(uint8ToHex(keyPair.publicKey.bytes)).to.equal(publicKey);
      counter++;
    }
  });
});