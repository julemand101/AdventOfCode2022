// --- Day 14: Regolith Reservoir ---
// https://adventofcode.com/2022/day/14

import 'dart:io';
import 'package:advent_of_code_2022/day14.dart';
import 'package:test/test.dart';

final input = File('test/data/day14.txt').readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
        solveA(const [
          '498,4 -> 498,6 -> 496,6',
          '503,4 -> 502,4 -> 502,9 -> 494,9',
        ]),
        equals(24),
      );
    });
    test('Solution', () {
      expect(solveA(input), equals(768));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(
        solveB(const [
          '498,4 -> 498,6 -> 496,6',
          '503,4 -> 502,4 -> 502,9 -> 494,9',
        ]),
        equals(93),
      );
    });
    test('Solution', () {
      expect(solveB(input), equals(26686));
    });
  });
}
