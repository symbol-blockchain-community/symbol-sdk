<?php

/**
 * This code is derived from or inspired by the BIP39 implementation in bitcoin-lib-php:
 * https://github.com/Bit-Wasp/bitcoin-lib-php/tree/master/src/BIP39
 * 
 * The original code is released into the public domain under the terms of the Unlicense:
 * https://github.com/Bit-Wasp/bitcoin-lib-php/blob/master/LICENSE
 *
 * While attribution is not required by the license, we include this notice as a courtesy 
 * to the original authors and to maintain transparency about the code's origin.
 */

namespace SymbolSdk\BIP39;

abstract class BIP39WordList
{
		/**
		 * get a list of all the words
		 *
		 * @return array
		 */
		abstract public function getWords();

		/**
		 * get a word by it's index
		 *
		 * should throw an exception if the index does not exist
		 *
		 * @param int			 $idx
		 * @return string
		 */
		abstract public function getWord($idx);

		/**
		 * get the index for a word
		 *
		 * should throw an exception if the word does not exist
		 *
		 * @param string		$word
		 * @return int
		 */
		abstract public function getIndex($word);
}