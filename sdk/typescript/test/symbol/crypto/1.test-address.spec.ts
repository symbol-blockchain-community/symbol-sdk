import fs from 'fs';
import path from 'path';
import { promisify } from 'util';
import { hexToUint8, addressToString } from '../../../src';
import { Network, PublicKey } from '../../../src/symbol';
import * as mocha from 'mocha';
import { expect } from 'chai';

const readFile = promisify(fs.readFile);

describe('Test address', () => {
  it('should correct address', async () => {
    const filePath = path.resolve(__dirname, '../../../../../tests/vectors/symbol/crypto/1.test-address.json');
    const contents = await readFile(filePath, { encoding: 'utf-8' });
    const jsonMap = JSON.parse(contents);

    for (const element of jsonMap) {
      const publicKey = new PublicKey(element['publicKey']);
      var mainNetwork = Network.MAINNET;
      var testNetwork = Network.TESTNET;
      var testAddress = addressToString(testNetwork.publicKeyToAddress(publicKey).bytes);
      var mainAddress = addressToString(mainNetwork.publicKeyToAddress(publicKey).bytes);
      expect(mainAddress).to.equal(element['address_Public']);
      expect(testAddress).to.equal(element['address_PublicTest']);
    }
  });
});