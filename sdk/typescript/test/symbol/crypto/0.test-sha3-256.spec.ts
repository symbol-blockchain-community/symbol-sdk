import fs from 'fs';
import path from 'path';
import { promisify } from 'util';
import { uint8ToHex, hexToUint8 } from '../../../src';
import * as mocha from 'mocha';
import { expect } from 'chai';
import { sha3_256 } from '@noble/hashes/sha3';

const readFile = promisify(fs.readFile);

describe('Test sha3 256', () => {
  it('should correct sha3 256', async () => {
    const filePath = path.resolve(__dirname, '../../../../../tests/vectors/symbol/crypto/0.test-sha3-256.json');
    const contents = await readFile(filePath, { encoding: 'utf-8' });
    const jsonMap = JSON.parse(contents);

    for (const element of jsonMap) {
      const data = hexToUint8(element['data']);
      const hash = sha3_256.create().update(hexToUint8(element['data'])).digest();
      expect(element['hash']).to.equal(uint8ToHex(hash));
    }
  });
});