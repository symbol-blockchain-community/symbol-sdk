<?php

namespace SymbolSdk\Utils;

use SplFixedArray;
use ArrayAccess;
use OutOfRangeException;
use RangeException;

function deepCompare($lhs, $rhs)
{
	if (!is_array($lhs) && !($lhs instanceof SplFixedArray) && !($lhs instanceof ArrayAccess)) {
		if ($lhs === $rhs)
			return 0;

		return $lhs > $rhs ? 1 : -1;
	}

	if (count($lhs) !== count($rhs))
		return count($lhs) > count($rhs) ? 1 : -1;

	for ($i = 0; $i < count($lhs); ++$i) {
		$compareResult = deepCompare($lhs[$i], $rhs[$i]);
		if ($compareResult !== 0)
			return $compareResult;
	}

	return 0;
}

function readArrayImpl(BinaryReader &$reader, callable $factoryMethod, $accessor, $shouldContinue)
{
	$elements = [];
	$previousElement = null;
	$i = 0;
	while ($shouldContinue($i, $reader)) {
		$element = call_user_func($factoryMethod, $reader);

		if ($element->size() <= 0) {
			throw new RangeException('element size has invalid size');
		}

		if ($accessor && $previousElement && deepCompare($accessor($previousElement), $accessor($element)) >= 0) {
			throw new RangeException('elements in array are not sorted');
		}

		array_push($elements, $element);
		$previousElement = $element;
		++$i;
	}

	return $elements;
}

function writeArrayImpl(BinaryWriter $output, array $elements, int $count, $accessor)
{
	for ($i = 0; $i < $count; ++$i) {
		$element = $elements[$i];
		if ($accessor && 0 < $i && 0 <= deepCompare($accessor($elements[$i - 1]), $accessor($element)))
			throw new OutOfRangeException('array passed to write array is not sorted');

		$output->write($element->serialize());
	}
}

function alignUp($size, $alignment)
{
	return intval(($size + $alignment - 1) / $alignment) * $alignment;
}

function size($elements, $alignment = 0, $skipLastElementPadding = false): int
{
	if ($elements == null) return 0;
	if ($alignment == 0) {
		return array_sum(array_map(function ($e) {
			return $e->size();
		}, $elements));
	}

	if (!$skipLastElementPadding) {
		return array_sum(array_map(function ($e) use ($alignment) {
			return alignUp($e->size(), $alignment);
		}, $elements));
	}

	$lastIndex = count($elements) - 1;
	$lastElement = $elements[$lastIndex];
	$sum = array_sum(array_map(function ($e) use ($alignment) {
		return alignUp($e->size(), $alignment);
	}, array_slice($elements, 0, $lastIndex)));

	$sum += $lastElement->size();
	return $sum;
}

function readArray($reader, callable $factoryMethod, $accessor = null)
{
	return readArrayImpl($reader, $factoryMethod, $accessor, fn ($_, BinaryReader $reader) => 0 < $reader->getRemainingLength());
}

function readArrayCount($bufferInput, callable $factoryMethod, $count, $accessor = null)
{
	return readArrayImpl($bufferInput, $factoryMethod, $accessor, function ($index) use ($count) {
		return $count > $index;
	});
}

function readVariableSizeElements(BinaryReader &$reader, callable $deserializeFunc, $binarySize, $alignment, $skipLastElementPadding = false)
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
			: alignUp($element->size(), $alignment);
		if ($alignedSize > strlen($buffer))
			throw new OutOfRangeException('unexpected buffer length');

		$reader->advance($alignedSize);
		$binarySize -= $alignedSize;
	}

	return $elements;
}

function writeArray(BinaryWriter $output, array $elements, $accessor = null)
{
	if ($elements == Null) return;
	writeArrayImpl($output, $elements, count($elements), $accessor);
}

function writeArrayCount(BinaryWriter $output, array $elements, int $count, $accessor = null)
{
	if ($elements == Null) return;
	writeArrayImpl($output, $elements, $count, $accessor);
}

function writeVariableSizeElements(BinaryWriter $output, array $elements, int $alignment, $skipLastElementPadding = false)
{
	foreach ($elements as $index => $element) {
		$output->write($element->serialize());

		if (!$skipLastElementPadding || count($elements) - 1 !== $index) {
			$alignedSize = alignUp($element->size(), $alignment);

			if ($alignedSize - $element->size() > 0) {
				$padding = str_repeat("\x00", $alignedSize - $element->size());
				$output->write($padding);
			}
		}
	}
}
