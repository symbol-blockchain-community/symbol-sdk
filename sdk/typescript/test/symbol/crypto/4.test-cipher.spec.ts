import fs from 'fs';
import path from 'path';
import { promisify } from 'util';
import { uint8ToHex, hexToUint8, encodeAesGcm } from '../../../src';
import { deriveSharedKey } from '../../../src/symbol';
import * as mocha from 'mocha';
import { expect } from 'chai';

const readFile = promisify(fs.readFile);

describe('Test cipher', () => {
  it('should correct cipher', async () => {
    const filePath = path.resolve(__dirname, '../../../../../tests/vectors/symbol/crypto/4.test-cipher.json');
    const contents = await readFile(filePath, { encoding: 'utf-8' });
    const jsonMap = JSON.parse(contents);
    var counter = 0;

    for (const element of jsonMap) {
      if (counter > 100) return;
      const privateKey = hexToUint8(element['privateKey']);
      const recipientPublicKey = hexToUint8(element['otherPublicKey']);
      var clearText = hexToUint8(element['clearText']);
      var iv = element['iv'];
      var result = encodeAesGcm(deriveSharedKey, privateKey, recipientPublicKey, clearText, hexToUint8(iv));
      var tag = element['tag'];
      var cipherText = element['cipherText'];
      expect(uint8ToHex(result['tag']).toUpperCase(), tag);
      expect(uint8ToHex(result['cipherText']).toUpperCase(), cipherText);
      counter++;
    }
  });
});