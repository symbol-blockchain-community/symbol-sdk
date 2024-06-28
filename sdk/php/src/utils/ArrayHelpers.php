<?php

namespace SymbolSdk\Utils;

use SplFixedArray;
use ArrayAccess;
use OutOfRangeException;
use RangeException;

class ArrayHelpers {
	public static function deepCompare($lhs, $rhs)
	{
		if (!is_array($lhs) && !($lhs instanceof SplFixedArray) && !($lhs instanceof ArrayAccess)) {
			if ($lhs === $rhs)
				return 0;
	
			return $lhs > $rhs ? 1 : -1;
		}
	
		if (count($lhs) !== count($rhs))
			return count($lhs) > count($rhs) ? 1 : -1;
	
		for ($i = 0; $i < count($lhs); ++$i) {
			$compareResult = self::deepCompare($lhs[$i], $rhs[$i]);
			if ($compareResult !== 0)
				return $compareResult;
		}
	
		return 0;
	}
	
	public static function readArrayImpl(BinaryReader &$reader, callable $factoryMethod, $accessor, $shouldContinue)
	{
		$elements = [];
		$previousElement = null;
		$i = 0;
		while ($shouldContinue($i, $reader)) {
			$element = call_user_func($factoryMethod, $reader);
	
			if ($element->size() <= 0) {
				throw new RangeException('element size has invalid size');
			}
	
			if ($accessor && $previousElement && self::deepCompare($accessor($previousElement), $accessor($element)) >= 0) {
				throw new RangeException('elements in array are not sorted');
			}
	
			array_push($elements, $element);
			$previousElement = $element;
			++$i;
		}
	
		return $elements;
	}
	
	public static function writeArrayImpl(BinaryWriter $output, array $elements, int $count, $accessor)
	{
		for ($i = 0; $i < $count; ++$i) {
			$element = $elements[$i];
			if ($accessor && 0 < $i && 0 <= self::deepCompare($accessor($elements[$i - 1]), $accessor($element)))
				throw new OutOfRangeException('array passed to write array is not sorted');
	
			$output->write($element->serialize());
		}
	}
	
	public static function alignUp($size, $alignment)
	{
		return intval(($size + $alignment - 1) / $alignment) * $alignment;
	}
	
	public static function size($elements, $alignment = 0, $skipLastElementPadding = false): int
	{
		if ($elements == null) return 0;
		if ($alignment == 0) {
			return array_sum(array_map(function ($e) {
				return $e->size();
			}, $elements));
		}
	
		if (!$skipLastElementPadding) {
			return array_sum(array_map(function ($e) use ($alignment) {
				return self::alignUp($e->size(), $alignment);
			}, $elements));
		}
	
		$lastIndex = count($elements) - 1;
		$lastElement = $elements[$lastIndex];
		$sum = array_sum(array_map(function ($e) use ($alignment) {
			return self::alignUp($e->size(), $alignment);
		}, array_slice($elements, 0, $lastIndex)));
	
		$sum += $lastElement->size();
		return $sum;
	}
	
	public static function readArray($reader, callable $factoryMethod, $accessor = null)
	{
		return self::readArrayImpl($reader, $factoryMethod, $accessor, fn ($_, BinaryReader $reader) => 0 < $reader->getRemainingLength());
	}
	
	public static function readArrayCount($bufferInput, callable $factoryMethod, $count, $accessor = null)
	{
		return self::readArrayImpl($bufferInput, $factoryMethod, $accessor, function ($index) use ($count) {
			return $count > $index;
		});
	}
	
	public static function readVariableSizeElements(BinaryReader &$reader, callable $deserializeFunc, $binarySize, $alignment, $skipLastElementPadding = false)
	{
		$elements = [];
		while (0 < $binarySize) {
			$buffer = $reader->readRemaining();
			$element = call_user_func($deserializeFunc, $buffer);
	
			if (0 >= $element->size())
				throw new OutOfRangeException('element size has invalid size');
	
			array_push($elements, $element);
	
			$alignedSize = ($skipLastElementPadding && $element->size() >= $reader->getRemainingLength())
				? $element->size()
				: self::alignUp($element->size(), $alignment);
			if ($alignedSize > strlen($buffer))
				throw new OutOfRangeException('unexpected buffer length');
	
			$reader->advance($alignedSize);
			$binarySize -= $alignedSize;
		}
	
		return $elements;
	}
	
	public static function writeArray(BinaryWriter $output, array $elements, $accessor = null)
	{
		if ($elements == Null) return;
		self::writeArrayImpl($output, $elements, count($elements), $accessor);
	}
	
	public static function writeArrayCount(BinaryWriter $output, array $elements, int $count, $accessor = null)
	{
		if ($elements == Null) return;
		self::writeArrayImpl($output, $elements, $count, $accessor);
	}
	
	public static function writeVariableSizeElements(BinaryWriter $output, array $elements, int $alignment, $skipLastElementPadding = false)
	{
		foreach ($elements as $index => $element) {
			$output->write($element->serialize());
	
			if (!$skipLastElementPadding || count($elements) - 1 !== $index) {
				$alignedSize = self::alignUp($element->size(), $alignment);
	
				if ($alignedSize - $element->size() > 0) {
					$padding = str_repeat("\x00", $alignedSize - $element->size());
					$output->write($padding);
				}
			}
		}
	}	
}
