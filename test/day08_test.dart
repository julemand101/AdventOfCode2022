// --- Day 8: Treetop Tree House ---
// https://adventofcode.com/2022/day/8

import 'dart:io';
import 'package:advent_of_code_2022/day08.dart';
import 'package:test/test.dart';

final input = File('test/data/day08.txt').readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
          solveA(const [
            '30373',
            '25512',
            '65332',
            '33549',
            '35390',
          ]),
          equals(21));
    });
    test('Solution', () {
      expect(solveA(input), equals(1814));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(
          solveB(const [
            '30373',
            '25512',
            '65332',
            '33549',
            '35390',
          ]),
          equals(8));
    });
    test('Solution', () {
      expect(solveB(input), equals(330786));
    });
  });
}
