<?php
namespace SymbolSdk\Impl\External;
require_once __DIR__ . '/Keccak.php';

use SymbolSdk\Impl\External\Keccak;
use SymbolSdk\Utils\Converter;

use Error;
use TypeError;
use Exception;
use SplFixedArray;

class TweetNaclFastSymbol {
	static $_9;
	static $gf0;
	static $gf1;
	static $D;
	static $D2;
	static $X;
	static $Y;
	static $I;

	static $crypto_sign_BYTES = 64;
	static $crypto_sign_PUBLICKEYBYTES = 32;
	static $crypto_sign_SECRETKEYBYTES = 64;
	static $crypto_sign_SEEDBYTES = 32;

	public static function init()
	{
		// バイト列の初期化
		self::$_9 = array_fill(0, 32, 0);
		self::$_9[0] = 9;

		// gf0, gf1, D, D2, X, Y, I の初期化
		self::$gf0 = self::gf();
		self::$gf1 = self::gf([1]);
		self::$D = self::gf([0x78a3, 0x1359, 0x4dca, 0x75eb, 0xd8ab, 0x4141, 0x0a4d, 0x0070, 0xe898, 0x7779, 0x4079, 0x8cc7, 0xfe73, 0x2b6f, 0x6cee, 0x5203]);
		self::$D2 = self::gf([0xf159, 0x26b2, 0x9b94, 0xebd6, 0xb156, 0x8283, 0x149a, 0x00e0, 0xd130, 0xeef3, 0x80f2, 0x198e, 0xfce7, 0x56df, 0xd9dc, 0x2406]);
		self::$X = self::gf([0xd51a, 0x8f25, 0x2d60, 0xc956, 0xa7b2, 0x9525, 0xc760, 0x692c, 0xdc5c, 0xfdd6, 0xe231, 0xc0a4, 0x53fe, 0xcd6e, 0x36d3, 0x2169]);
		self::$Y = self::gf([0x6658, 0x6666, 0x6666, 0x6666, 0x6666, 0x6666, 0x6666, 0x6666, 0x6666, 0x6666, 0x6666, 0x6666, 0x6666, 0x6666, 0x6666, 0x6666]);
		self::$I = self::gf([0xa0b0, 0x4a0e, 0x1b27, 0xc4ee, 0xe478, 0xad2f, 0x1806, 0x2f43, 0xd7a7, 0x3dfb, 0x0099, 0x2b4d, 0xdf0b, 0x4fc1, 0x2480, 0x2b83]);
	}
	// 配列を生成する関数
	public static function  gf($init = null) {
			$r = array_fill(0, 16, 0); // 16要素の配列を0で初期化

			if ($init) {
					for ($i = 0; $i < count($init); $i++) {
							$r[$i] = $init[$i];
					}
			}

			return $r;
	}

	private static function vn($x, $xi, $y, $yi, $n) {
		$d = 0;
		for ($i = 0; $i < $n; $i++) {
				$d |= $x[$xi + $i] ^ $y[$yi + $i];
		}
		return (1 & (($d - 1) >> 8)) - 1;
	}

	private static function crypto_verify_32($x, $xi, $y, $yi) {
		return self::vn($x, $xi, $y, $yi, 32);
	}

	private static function set25519(&$r, $a) {
		for ($i = 0; $i < 16; $i++) {
				$r[$i] = $a[$i] | 0;
		}
	}

	private static function car25519(&$o) {
		$c = 1;
		for ($i = 0; $i < 16; $i++) {
				$v = $o[$i] + $c + 65535;
				$c = intval($v / 65536);
				$o[$i] = $v - $c * 65536;
		}
		$o[0] += $c - 1 + 37 * ($c - 1);
	}

	private static function sel25519(&$p, &$q, $b) {
		$c = ~($b - 1);
		for ($i = 0; $i < 16; $i++) {
			$t = $c & ($p[$i] ^ $q[$i]);
			$p[$i] ^= $t;
			$q[$i] ^= $t;
		}
	}

	private static function pack25519(&$o, $n) {
		$m = array_fill(0, 16, 0);
		$t = array_fill(0, 16, 0);
		
		for ($i = 0; $i < 16; $i++) {
				$t[$i] = $n[$i];
		}
		
		self::car25519($t);
		self::car25519($t);
		self::car25519($t);
		
		for ($j = 0; $j < 2; $j++) {
				$m[0] = $t[0] - 0xffed;
				for ($i = 1; $i < 15; $i++) {
						$m[$i] = $t[$i] - 0xffff - (($m[$i - 1] >> 16) & 1);
						$m[$i - 1] &= 0xffff;
				}
				$m[15] = $t[15] - 0x7fff - (($m[14] >> 16) & 1);
				$b = ($m[15] >> 16) & 1;
				$m[14] &= 0xffff;
				self::sel25519($t, $m, 1 - $b);
		}
		
		for ($i = 0; $i < 16; $i++) {
				$o[2 * $i] = $t[$i] & 0xff;
				$o[2 * $i + 1] = $t[$i] >> 8;
		}
	}

	public static function neq25519($a, $b) {
		$c = array_fill(0, 32, 0);
		$d = array_fill(0, 32, 0);
		self::pack25519($c, $a);
		self::pack25519($d, $b);
		return self::crypto_verify_32($c, 0, $d, 0);
	}

	private static function par25519($a) {
		$d = array_fill(0, 32, 0);
		self::pack25519($d, $a);
		return $d[0] & 1;
	}

	private static function unpack25519(&$o, $n) {
		for ($i = 0; $i < 16; $i++) {
				$o[$i] = $n[2 * $i] + ($n[2 * $i + 1] << 8);
		}
		$o[15] &= 0x7fff;
	}

	private static function A(&$o, $a, $b) {
		for ($i = 0; $i < 16; $i++) {
				$o[$i] = $a[$i] + $b[$i];
		}
	}

	public static function Z(&$o, $a, $b) {
		for ($i = 0; $i < 16; $i++) {
				$o[$i] = $a[$i] - $b[$i];
		}
	}

	private static function M(&$o, $a, $b) {
		$t0 = 0;  $t1 = 0;  $t2 = 0;  $t3 = 0;  $t4 = 0;  $t5 = 0;  $t6 = 0;  $t7 = 0;
		$t8 = 0;  $t9 = 0; $t10 = 0; $t11 = 0; $t12 = 0; $t13 = 0; $t14 = 0; $t15 = 0;
		$t16 = 0; $t17 = 0; $t18 = 0; $t19 = 0; $t20 = 0; $t21 = 0; $t22 = 0; $t23 = 0;
		$t24 = 0; $t25 = 0; $t26 = 0; $t27 = 0; $t28 = 0; $t29 = 0; $t30 = 0;

		$b0 = $b[0];
		$b1 = $b[1];
		$b2 = $b[2];
		$b3 = $b[3];
		$b4 = $b[4];
		$b5 = $b[5];
		$b6 = $b[6];
		$b7 = $b[7];
		$b8 = $b[8];
		$b9 = $b[9];
		$b10 = $b[10];
		$b11 = $b[11];
		$b12 = $b[12];
		$b13 = $b[13];
		$b14 = $b[14];
		$b15 = $b[15];

		$v = $a[0];
		$t0 += $v * $b0;
		$t1 += $v * $b1;
		$t2 += $v * $b2;
		$t3 += $v * $b3;
		$t4 += $v * $b4;
		$t5 += $v * $b5;
		$t6 += $v * $b6;
		$t7 += $v * $b7;
		$t8 += $v * $b8;
		$t9 += $v * $b9;
		$t10 += $v * $b10;
		$t11 += $v * $b11;
		$t12 += $v * $b12;
		$t13 += $v * $b13;
		$t14 += $v * $b14;
		$t15 += $v * $b15;

		$v = $a[1];
		$t1 += $v * $b0;
		$t2 += $v * $b1;
		$t3 += $v * $b2;
		$t4 += $v * $b3;
		$t5 += $v * $b4;
		$t6 += $v * $b5;
		$t7 += $v * $b6;
		$t8 += $v * $b7;
		$t9 += $v * $b8;
		$t10 += $v * $b9;
		$t11 += $v * $b10;
		$t12 += $v * $b11;
		$t13 += $v * $b12;
		$t14 += $v * $b13;
		$t15 += $v * $b14;
		$t16 += $v * $b15;

		$v = $a[2];
		$t2 += $v * $b0;
		$t3 += $v * $b1;
		$t4 += $v * $b2;
		$t5 += $v * $b3;
		$t6 += $v * $b4;
		$t7 += $v * $b5;
		$t8 += $v * $b6;
		$t9 += $v * $b7;
		$t10 += $v * $b8;
		$t11 += $v * $b9;
		$t12 += $v * $b10;
		$t13 += $v * $b11;
		$t14 += $v * $b12;
		$t15 += $v * $b13;
		$t16 += $v * $b14;
		$t17 += $v * $b15;

		$v = $a[3];
		$t3 += $v * $b0;
		$t4 += $v * $b1;
		$t5 += $v * $b2;
		$t6 += $v * $b3;
		$t7 += $v * $b4;
		$t8 += $v * $b5;
		$t9 += $v * $b6;
		$t10 += $v * $b7;
		$t11 += $v * $b8;
		$t12 += $v * $b9;
		$t13 += $v * $b10;
		$t14 += $v * $b11;
		$t15 += $v * $b12;
		$t16 += $v * $b13;
		$t17 += $v * $b14;
		$t18 += $v * $b15;

		$v = $a[4];
		$t4 += $v * $b0;
		$t5 += $v * $b1;
		$t6 += $v * $b2;
		$t7 += $v * $b3;
		$t8 += $v * $b4;
		$t9 += $v * $b5;
		$t10 += $v * $b6;
		$t11 += $v * $b7;
		$t12 += $v * $b8;
		$t13 += $v * $b9;
		$t14 += $v * $b10;
		$t15 += $v * $b11;
		$t16 += $v * $b12;
		$t17 += $v * $b13;
		$t18 += $v * $b14;
		$t19 += $v * $b15;

		$v = $a[5];
		$t5 += $v * $b0;
		$t6 += $v * $b1;
		$t7 += $v * $b2;
		$t8 += $v * $b3;
		$t9 += $v * $b4;
		$t10 += $v * $b5;
		$t11 += $v * $b6;
		$t12 += $v * $b7;
		$t13 += $v * $b8;
		$t14 += $v * $b9;
		$t15 += $v * $b10;
		$t16 += $v * $b11;
		$t17 += $v * $b12;
		$t18 += $v * $b13;
		$t19 += $v * $b14;
		$t20 += $v * $b15;

		$v = $a[6];
		$t6 += $v * $b0;
		$t7 += $v * $b1;
		$t8 += $v * $b2;
		$t9 += $v * $b3;
		$t10 += $v * $b4;
		$t11 += $v * $b5;
		$t12 += $v * $b6;
		$t13 += $v * $b7;
		$t14 += $v * $b8;
		$t15 += $v * $b9;
		$t16 += $v * $b10;
		$t17 += $v * $b11;
		$t18 += $v * $b12;
		$t19 += $v * $b13;
		$t20 += $v * $b14;
		$t21 += $v * $b15;

		$v = $a[7];
		$t7 += $v * $b0;
		$t8 += $v * $b1;
		$t9 += $v * $b2;
		$t10 += $v * $b3;
		$t11 += $v * $b4;
		$t12 += $v * $b5;
		$t13 += $v * $b6;
		$t14 += $v * $b7;
		$t15 += $v * $b8;
		$t16 += $v * $b9;
		$t17 += $v * $b10;
		$t18 += $v * $b11;
		$t19 += $v * $b12;
		$t20 += $v * $b13;
		$t21 += $v * $b14;
		$t22 += $v * $b15;

		$v = $a[8];
		$t8 += $v * $b0;
		$t9 += $v * $b1;
		$t10 += $v * $b2;
		$t11 += $v * $b3;
		$t12 += $v * $b4;
		$t13 += $v * $b5;
		$t14 += $v * $b6;
		$t15 += $v * $b7;
		$t16 += $v * $b8;
		$t17 += $v * $b9;
		$t18 += $v * $b10;
		$t19 += $v * $b11;
		$t20 += $v * $b12;
		$t21 += $v * $b13;
		$t22 += $v * $b14;
		$t23 += $v * $b15;

		$v = $a[9];
		$t9 += $v * $b0;
		$t10 += $v * $b1;
		$t11 += $v * $b2;
		$t12 += $v * $b3;
		$t13 += $v * $b4;
		$t14 += $v * $b5;
		$t15 += $v * $b6;
		$t16 += $v * $b7;
		$t17 += $v * $b8;
		$t18 += $v * $b9;
		$t19 += $v * $b10;
		$t20 += $v * $b11;
		$t21 += $v * $b12;
		$t22 += $v * $b13;
		$t23 += $v * $b14;
		$t24 += $v * $b15;

		$v = $a[10];
		$t10 += $v * $b0;
		$t11 += $v * $b1;
		$t12 += $v * $b2;
		$t13 += $v * $b3;
		$t14 += $v * $b4;
		$t15 += $v * $b5;
		$t16 += $v * $b6;
		$t17 += $v * $b7;
		$t18 += $v * $b8;
		$t19 += $v * $b9;
		$t20 += $v * $b10;
		$t21 += $v * $b11;
		$t22 += $v * $b12;
		$t23 += $v * $b13;
		$t24 += $v * $b14;
		$t25 += $v * $b15;

		$v = $a[11];
		$t11 += $v * $b0;
		$t12 += $v * $b1;
		$t13 += $v * $b2;
		$t14 += $v * $b3;
		$t15 += $v * $b4;
		$t16 += $v * $b5;
		$t17 += $v * $b6;
		$t18 += $v * $b7;
		$t19 += $v * $b8;
		$t20 += $v * $b9;
		$t21 += $v * $b10;
		$t22 += $v * $b11;
		$t23 += $v * $b12;
		$t24 += $v * $b13;
		$t25 += $v * $b14;
		$t26 += $v * $b15;

		$v = $a[12];
		$t12 += $v * $b0;
		$t13 += $v * $b1;
		$t14 += $v * $b2;
		$t15 += $v * $b3;
		$t16 += $v * $b4;
		$t17 += $v * $b5;
		$t18 += $v * $b6;
		$t19 += $v * $b7;
		$t20 += $v * $b8;
		$t21 += $v * $b9;
		$t22 += $v * $b10;
		$t23 += $v * $b11;
		$t24 += $v * $b12;
		$t25 += $v * $b13;
		$t26 += $v * $b14;
		$t27 += $v * $b15;

		$v = $a[13];
		$t13 += $v * $b0;
		$t14 += $v * $b1;
		$t15 += $v * $b2;
		$t16 += $v * $b3;
		$t17 += $v * $b4;
		$t18 += $v * $b5;
		$t19 += $v * $b6;
		$t20 += $v * $b7;
		$t21 += $v * $b8;
		$t22 += $v * $b9;
		$t23 += $v * $b10;
		$t24 += $v * $b11;
		$t25 += $v * $b12;
		$t26 += $v * $b13;
		$t27 += $v * $b14;
		$t28 += $v * $b15;

		$v = $a[14];
		$t14 += $v * $b0;
		$t15 += $v * $b1;
		$t16 += $v * $b2;
		$t17 += $v * $b3;
		$t18 += $v * $b4;
		$t19 += $v * $b5;
		$t20 += $v * $b6;
		$t21 += $v * $b7;
		$t22 += $v * $b8;
		$t23 += $v * $b9;
		$t24 += $v * $b10;
		$t25 += $v * $b11;
		$t26 += $v * $b12;
		$t27 += $v * $b13;
		$t28 += $v * $b14;
		$t29 += $v * $b15;

		$v = $a[15];
		$t15 += $v * $b0;
		$t16 += $v * $b1;
		$t17 += $v * $b2;
		$t18 += $v * $b3;
		$t19 += $v * $b4;
		$t20+= $v * $b5;
		$t21 += $v * $b6;
		$t22 += $v * $b7;
		$t23 += $v * $b8;
		$t24 += $v * $b9;
		$t25 += $v * $b10;
		$t26 += $v * $b11;
		$t27 += $v * $b12;
		$t28 += $v * $b13;
		$t29 += $v * $b14;
		$t30 += $v * $b15;

		$t0 += 38 * $t16;
		$t1 += 38 * $t17;
		$t2 += 38 * $t18;
		$t3 += 38 * $t19;
		$t4 += 38 * $t20;
		$t5 += 38 * $t21;
		$t6 += 38 * $t22;
		$t7 += 38 * $t23;
		$t8 += 38 * $t24;
		$t9 += 38 * $t25;
		$t10 += 38 * $t26;
		$t11 += 38 * $t27;
		$t12 += 38 * $t28;
		$t13 += 38 * $t29;
		$t14 += 38 * $t30;
		// $t15 はそのまま

		// first car
		$c = 1;
		$v = $t0 + $c + 65535; $c = floor($v / 65536); $t0 = $v - $c * 65536;
		$v = $t1 + $c + 65535; $c = floor($v / 65536); $t1 = $v - $c * 65536;
		$v = $t2 + $c + 65535; $c = floor($v / 65536); $t2 = $v - $c * 65536;
		$v = $t3 + $c + 65535; $c = floor($v / 65536); $t3 = $v - $c * 65536;
		$v = $t4 + $c + 65535; $c = floor($v / 65536); $t4 = $v - $c * 65536;
		$v = $t5 + $c + 65535; $c = floor($v / 65536); $t5 = $v - $c * 65536;
		$v = $t6 + $c + 65535; $c = floor($v / 65536); $t6 = $v - $c * 65536;
		$v = $t7 + $c + 65535; $c = floor($v / 65536); $t7 = $v - $c * 65536;
		$v = $t8 + $c + 65535; $c = floor($v / 65536); $t8 = $v - $c * 65536;
		$v = $t9 + $c + 65535; $c = floor($v / 65536); $t9 = $v - $c * 65536;
		$v = $t10 + $c + 65535; $c = floor($v / 65536); $t10 = $v - $c * 65536;
		$v = $t11 + $c + 65535; $c = floor($v / 65536); $t11 = $v - $c * 65536;
		$v = $t12 + $c + 65535; $c = floor($v / 65536); $t12 = $v - $c * 65536;
		$v = $t13 + $c + 65535; $c = floor($v / 65536); $t13 = $v - $c * 65536;
		$v = $t14 + $c + 65535; $c = floor($v / 65536); $t14 = $v - $c * 65536;
		$v = $t15 + $c + 65535; $c = floor($v / 65536); $t15 = $v - $c * 65536;
		$t0 += $c - 1 + 37 * ($c - 1);

		// second car
		$c = 1;
		$v = $t0 + $c + 65535; $c = floor($v / 65536); $t0 = $v - $c * 65536;
		$v = $t1 + $c + 65535; $c = floor($v / 65536); $t1 = $v - $c * 65536;
		$v = $t2 + $c + 65535; $c = floor($v / 65536); $t2 = $v - $c * 65536;
		$v = $t3 + $c + 65535; $c = floor($v / 65536); $t3 = $v - $c * 65536;
		$v = $t4 + $c + 65535; $c = floor($v / 65536); $t4 = $v - $c * 65536;
		$v = $t5 + $c + 65535; $c = floor($v / 65536); $t5 = $v - $c * 65536;
		$v = $t6 + $c + 65535; $c = floor($v / 65536); $t6 = $v - $c * 65536;
		$v = $t7 + $c + 65535; $c = floor($v / 65536); $t7 = $v - $c * 65536;
		$v = $t8 + $c + 65535; $c = floor($v / 65536); $t8 = $v - $c * 65536;
		$v = $t9 + $c + 65535; $c = floor($v / 65536); $t9 = $v - $c * 65536;
		$v = $t10 + $c + 65535; $c = floor($v / 65536); $t10 = $v - $c * 65536;
		$v = $t11 + $c + 65535; $c = floor($v / 65536); $t11 = $v - $c * 65536;
		$v = $t12 + $c + 65535; $c = floor($v / 65536); $t12 = $v - $c * 65536;
		$v = $t13 + $c + 65535; $c = floor($v / 65536); $t13 = $v - $c * 65536;
		$v = $t14 + $c + 65535; $c = floor($v / 65536); $t14 = $v - $c * 65536;
		$v = $t15 + $c + 65535; $c = floor($v / 65536); $t15 = $v - $c * 65536;

		$t0 += $c - 1 + 37 * ($c-1);

		$o[ 0] = $t0;
		$o[ 1] = $t1;
		$o[ 2] = $t2;
		$o[ 3] = $t3;
		$o[ 4] = $t4;
		$o[ 5] = $t5;
		$o[ 6] = $t6;
		$o[ 7] = $t7;
		$o[ 8] = $t8;
		$o[ 9] = $t9;
		$o[10] = $t10;
		$o[11] = $t11;
		$o[12] = $t12;
		$o[13] = $t13;
		$o[14] = $t14;
		$o[15] = $t15;
	}

	private static function S(&$o, $a) {
		self::M($o, $a, $a);
	}

	private static function inv25519(&$o, $i) {
		$c = self::gf();
		for ($a = 0; $a < 16; $a++) {
				$c[$a] = $i[$a];
		}
		for ($a = 253; $a >= 0; $a--) {
			self::S($c, $c);
				if ($a !== 2 && $a !== 4) {
					self::M($c, $c, $i);
				}
		}
		for ($a = 0; $a < 16; $a++) {
				$o[$a] = $c[$a];
		}
	}

	private static function pow2523(&$o, $i) {
		$c = self::gf();
		for ($a = 0; $a < 16; $a++) {
				$c[$a] = $i[$a];
		}
		for ($a = 250; $a >= 0; $a--) {
			self::S($c, $c);
				if ($a !== 1) {
					self::M($c, $c, $i);
				}
		}
		for ($a = 0; $a < 16; $a++) {
				$o[$a] = $c[$a];
		}
	}

	public static function crypto_hash(&$out, $m, $n, $hasher) {
		for ($i = 0; $i < count($m); $i++) {
			$m[$i] = pack('C*', $m[$i]);
		}
		$binary = implode('', array_slice($m, 0, $n));
		$hash = $hasher == 'sha512' ? hex2bin(hash('sha512', $binary)) : hex2bin(Keccak::hash($binary, 512));

		for ($i = 0; $i < count($out); ++$i)
			$out[$i] = ord($hash[$i]);

		return 0;
	}

	private static function add(&$p, $q) {
		$a = self::gf(); $b = self::gf(); $c = self::gf();
		$d = self::gf(); $e = self::gf(); $f = self::gf();
		$g = self::gf(); $h = self::gf(); $t = self::gf();

		self::Z($a, $p[1], $p[0]);
		self::Z($t, $q[1], $q[0]);
		self::M($a, $a, $t);
		self::A($b, $p[0], $p[1]);
		self::A($t, $q[0], $q[1]);
		self::M($b, $b, $t);
		self::M($c, $p[3], $q[3]);
		self::M($c, $c, self::$D2);
		self::M($d, $p[2], $q[2]);
		self::A($d, $d, $d);
		self::Z($e, $b, $a);
		self::Z($f, $d, $c);
		self::A($g, $d, $c);
		self::A($h, $b, $a);

		self::M($p[0], $e, $f);
		self::M($p[1], $h, $g);
		self::M($p[2], $g, $f);
		self::M($p[3], $e, $h);
	}

	private static function cswap(&$p, &$q, $b) {
		for ($i = 0; $i < 4; $i++) {
			self::sel25519($p[$i], $q[$i], $b);
		}
	}

	public static function pack(&$r, $p) {
		$tx = self::gf(); $ty = self::gf(); $zi = self::gf();
		self::inv25519($zi, $p[2]);
		self::M($tx, $p[0], $zi);
		self::M($ty, $p[1], $zi);
		self::pack25519($r, $ty);
		$r[31] ^= self::par25519($tx) << 7;
	}

	public static function scalarmult(&$p, &$q, $s) {
		self::set25519($p[0], self::$gf0);
		self::set25519($p[1], self::$gf1);
		self::set25519($p[2], self::$gf1);
		self::set25519($p[3], self::$gf0);

		for ($i = 255; $i >= 0; --$i) {
			$b = ($s[(int)($i/8)|0] >> ($i&7)) & 1;
			self::cswap($p, $q, $b);
			self::add($q, $p);
			self::add($p, $p);
			self::cswap($p, $q, $b);
		}
	}

	private static function scalarbase(&$p, $s) {
		$q = [self::gf(), self::gf(), self::gf(), self::gf()];
		self::set25519($q[0], self::$X);
		self::set25519($q[1], self::$Y);
		self::set25519($q[2], self::$gf1);
		self::M($q[3], self::$X, self::$Y);

		self::scalarmult($p, $q, $s);
	}

	private static function crypto_sign_keypair(&$pk, &$sk, $hasher) {
		$d = new SplFixedArray(64);
		$p = [self::gf(), self::gf(), self::gf(), self::gf()];

		self::crypto_hash($d, $sk, 32, $hasher);
		$d[0] &= 248;

		$d[31] &= 127;
		$d[31] |= 64;

		self::scalarbase($p, $d);

		self::pack($pk, $p);

		for ($i = 0; $i < 32; $i++) {
				$sk[$i+32] = $pk[$i];
		}
		return 0;
	}

	public static $L = [0xed, 0xd3, 0xf5, 0x5c, 0x1a, 0x63, 0x12, 0x58, 0xd6, 0x9c, 0xf7, 0xa2, 0xde, 0xf9, 0xde, 0x14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x10];

	public static function modL(&$r, &$x)
  {
		$carry = 0;
		for ($i = 63; $i >= 32; --$i) {
				$carry = 0;
				for ($j = $i - 32, $k = $i - 12; $j < $k; ++$j) {
						$x[$j] += $carry - 16 * $x[$i] * self::$L[$j - ($i - 32)];
						$carry = intval(($x[$j] + 128) / 256);
						$x[$j] -= $carry * 256;
				}
				$x[$j] += $carry;
				$x[$i] = 0;
		}
		
		$carry = 0;
		for ($j = 0; $j < 32; ++$j) {
				$x[$j] += $carry - ($x[31] >> 4) * self::$L[$j];
				$carry = $x[$j] >> 8;
				$x[$j] &= 255;
		}
		for ($j = 0; $j < 32; ++$j) {
				$x[$j] -= $carry * self::$L[$j];
		}
		for ($i = 0; $i < 32; ++$i) {
				$x[$i + 1] += $x[$i] >> 8;
				$r[$i] = $x[$i] & 255;
		}
  }

	public static function reduce(&$r)
	{
			$x = array_fill(0, 64, 0);
			for ($i = 0; $i < 64; ++$i) {
					$x[$i] = $r[$i];
			}
			for ($i = 0; $i < 64; ++$i) {
					$r[$i] = 0;
			}
			self::modL($r, $x);
	}

	private static function crypto_sign(&$sm, &$m, $n, &$sk, $hasher)
	{
		$d = array_fill(0, 64, 0);
		$h = array_fill(0, 64, 0);
		$r = array_fill(0, 64, 0);
		$x = array_fill(0, 64, 0);
		$p = [self::gf(), self::gf(), self::gf(), self::gf()];

		self::crypto_hash($d, $sk, 32, $hasher);
		
		$d[0] &= 248;
		$d[31] &= 127;
		$d[31] |= 64;

		$smlen = $n + 64;
		for ($i = 0; $i < $n; ++$i) {
			$sm[64 + $i] = $m[$i];
		}
		for ($i = 0; $i < 32; ++$i) {
			$sm[32 + $i] = $d[32 + $i];
		}

		self::crypto_hash($r, array_slice($sm, 32), $n + 32, $hasher);
		self::reduce($r);
		self::scalarbase($p, $r);
		self::pack($sm, $p);

		for ($i = 32; $i < 64; ++$i) {
				$sm[$i] = $sk[$i];
		}
		self::crypto_hash($h, $sm, $n + 64, $hasher);
		self::reduce($h);

		for ($i = 0; $i < 64; ++$i) $x[$i] = 0;
		for ($i = 0; $i < 32; $i++) $x[$i] = $r[$i];
		
		for ($i = 0; $i < 32; ++$i) {
			for ($j = 0; $j < 32; ++$j) {
				$x[$i + $j] += $h[$i] * $d[$j];
			}
		}

		$sliced = [array_slice($sm, 0, 32), array_slice($sm, 32)];
		self::modL($sliced[1], $x);
		$sm = array_merge($sliced[0], $sliced[1]);
		return $smlen;
	}

	public static function unpackneg(&$r, $p) {
		$t = self::gf(); $chk = self::gf(); $num = self::gf();
		$den = self::gf(); $den2 = self::gf(); $den4 = self::gf();
		$den6 = self::gf();
	
		self::set25519($r[2], self::$gf1);
		self::unpack25519($r[1], $p);

		self::S($num, $r[1]);
		self::M($den, $num, self::$D);
		self::Z($num, $num, $r[2]);
		self::A($den, $r[2], $den);
	
		self::S($den2, $den);
		self::S($den4, $den2);
		self::M($den6, $den4, $den2);
		self::M($t, $den6, $num);
		self::M($t, $t, $den);
	
		self::pow2523($t, $t);
		self::M($t, $t, $num);
		self::M($t, $t, $den);
		self::M($t, $t, $den);
		self::M($r[0], $t, $den);
	
		self::S($chk, $r[0]);
		self::M($chk, $chk, $den);
		if (self::neq25519($chk, $num)) self::M($r[0], $r[0], self::$I);
	
		self::S($chk, $r[0]);
		self::M($chk, $chk, $den);
		if (self::neq25519($chk, $num)) return -1;
	
		if (self::par25519($r[0]) === ($p[31]>>7)) self::Z($r[0], self::$gf0, $r[0]);
	
		self::M($r[3], $r[0], $r[1]);
		return 0;
	}

	private static function crypto_sign_open($m, $sm, $n, $pk, $hasher) {
		$t = array_fill(0, 32, 0); $h = array_fill(0, 64, 0);
		$p = [self::gf(), self::gf(), self::gf(), self::gf()];
		$q = [self::gf(), self::gf(), self::gf(), self::gf()];
		if ($n < 64) return -1;
	
		if (self::unpackneg($q, $pk)) return -1;

		for ($i = 0; $i < $n; $i++) $m[$i] = $sm[$i];
		for ($i = 0; $i < 32; $i++) $m[$i+32] = $pk[$i];
		self::crypto_hash($h, $m, $n, $hasher);
		self::reduce($h);
		self::scalarmult($p, $q, $h, true);

		self::scalarbase($q, array_slice($sm, 32));
		self::add($p, $q);
		self::pack($t, $p);

		$n -= 64; // eslint-disable-line no-param-reassign
		if (self::crypto_verify_32($sm, 0, $t, 0)) {
			for ($i = 0; $i < $n; $i++) $m[$i] = 0;
			return -1;
		}
	
		for ($i = 0; $i < $n; $i++) $m[$i] = $sm[$i + 64];
		return $n;
	}

	public function is_array_string($array) {
		foreach ($array as $element) {
			if (!is_string($element)) {
				return false;
			}
		}
		return true;
	}

	public static function checkArrayTypes(...$params) {
		foreach ($params as $param) {
			if (!is_array($param)) {
				throw new TypeError('unexpected type, use array');
			}
		}
	}

	public static function nacl_sign($msg, $secretKey, $hasher){
		$msg = Converter::binaryToArray($msg);
		$secretKey = Converter::binaryToArray($secretKey);
		self::checkArrayTypes($msg, $secretKey);
		if (count($secretKey) !== self::$crypto_sign_SECRETKEYBYTES)
			throw new Error('bad secret key size');
		$signedMsg = array_fill(0, self::$crypto_sign_BYTES + count($msg), 0);
		self::crypto_sign($signedMsg, $msg, count($msg), $secretKey, $hasher);
		return $signedMsg;
	}

	public static function nacl_sign_detached($msg, $secretKey, $hasher){
		$signedMsg = self::nacl_sign($msg, $secretKey, $hasher);
		$sig = array_fill(0, self::$crypto_sign_BYTES, 0);
		for($i = 0; $i < count($sig); $i++) $sig[$i] = $signedMsg[$i];
		return self::arrayToBinary($sig);
	}

	public static function nacl_sign_keyPair_fromSeed($seed, $hasher) {
		$seed = Converter::binaryToArray($seed);
		self::checkArrayTypes($seed);

		if (count($seed) !== self::$crypto_sign_SEEDBYTES)
			throw new Exception('bad seed size');

		$pk = array_fill(0, self::$crypto_sign_PUBLICKEYBYTES, 0);
		$sk = array_fill(0, self::$crypto_sign_SECRETKEYBYTES, 0);

		for ($i = 0; $i < self::$crypto_sign_SEEDBYTES; $i++) {
			$sk[$i] = $seed[$i];
		}
		self::crypto_sign_keypair($pk, $sk, $hasher);
		
		return ['publicKey' => self::arrayToBinary($pk), 'secretKey' => self::arrayToBinary($sk)];
	}

	public static function nacl_sign_detached_verify($msg, $sig, $publicKey, $hasher){
		$msg = Converter::binaryToArray($msg);
		$sig = Converter::binaryToArray($sig);
		$publicKey = Converter::binaryToArray($publicKey);
		self::checkArrayTypes($msg, $sig, $publicKey);
		if (count($sig) !== self::$crypto_sign_BYTES)
			throw new Error('bad signature size');
		if (count($publicKey) !== self::$crypto_sign_PUBLICKEYBYTES)
			throw new Error('bad public key size');
		$sm = array_fill(0, self::$crypto_sign_BYTES + count($msg), 0);
		$m = array_fill(0, self::$crypto_sign_BYTES + count($msg), 0);
		for ($i = 0; $i < self::$crypto_sign_BYTES; $i++) $sm[$i] = $sig[$i];
		for ($i = 0; $i < count($msg); $i++) $sm[$i+self::$crypto_sign_BYTES] = $msg[$i];
		return (self::crypto_sign_open($m, $sm, count($sm), $publicKey, $hasher) >= 0);
	}

	public static function arrayToBinary($array) {
		$binaryData = '';
		foreach ($array as $element) {
				$binaryData .= pack('C', $element);
		}
		return $binaryData;
	}
}
?>


