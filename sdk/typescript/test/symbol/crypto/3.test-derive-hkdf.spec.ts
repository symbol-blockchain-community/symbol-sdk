import fs from 'fs';
import path from 'path';
import { promisify } from 'util';
import { uint8ToHex, hexToUint8 } from '../../../src';
import { deriveSharedKey } from '../../../src/symbol';
import * as mocha from 'mocha';
import { expect } from 'chai';

const readFile = promisify(fs.readFile);

describe('Test derive hkdf', () => {
  it('should derive correct hkdf', async () => {
    const filePath = path.resolve(__dirname, '../../../../../tests/vectors/symbol/crypto/3.test-derive-hkdf.json');
    const contents = await readFile(filePath, { encoding: 'utf-8' });
    const jsonMap = JSON.parse(contents);

    for (const element of jsonMap) {
      const privateKey = hexToUint8(element['privateKey']);
      const otherPublicKey = hexToUint8(element['otherPublicKey']);
      const result = deriveSharedKey(privateKey, otherPublicKey);
      const sharedKey = element['sharedKey'];
      expect(uint8ToHex(result.bytes)).to.equal(sharedKey);
    }
  });
});