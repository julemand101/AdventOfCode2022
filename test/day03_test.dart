// --- Day 3: Rucksack Reorganization ---
// https://adventofcode.com/2022/day/3

import 'dart:io';
import 'package:advent_of_code_2022/day03.dart';
import 'package:test/test.dart';

final input = File('test/data/day03.txt').readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
        solveA(const [
          'vJrwpWtwJgWrhcsFMMfFFhFp',
          'jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL',
          'PmmdzqPrVvPwwTWBwg',
          'wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn',
          'ttgJtRGJQctTZtZT',
          'CrZsJsPPZsGzwwsLwLmpwMDw',
        ]),
        equals(157),
      );
    });
    test('Solution', () {
      expect(solveA(input), equals(7766));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(
        solveB(const [
          'vJrwpWtwJgWrhcsFMMfFFhFp',
          'jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL',
          'PmmdzqPrVvPwwTWBwg',
          'wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn',
          'ttgJtRGJQctTZtZT',
          'CrZsJsPPZsGzwwsLwLmpwMDw',
        ]),
        equals(70),
      );
    });
    test('Solution', () {
      expect(solveB(input), equals(2415));
    });
  });
}
