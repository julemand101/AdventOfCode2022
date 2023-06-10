// --- Day 12: Hill Climbing Algorithm ---
// https://adventofcode.com/2022/day/12

import 'dart:io';
import 'package:advent_of_code_2022/day12.dart';
import 'package:test/test.dart';

final input = File('test/data/day12.txt').readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
          solveA(const [
            'Sabqponm',
            'abcryxxl',
            'accszExk',
            'acctuvwj',
            'abdefghi',
          ]),
          equals(31));
    });
    test('Solution', () {
      expect(solveA(input), equals(528));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(
          solveB(const [
            'Sabqponm',
            'abcryxxl',
            'accszExk',
            'acctuvwj',
            'abdefghi',
          ]),
          equals(29));
    });
    test('Solution', () {
      expect(solveB(input), equals(522));
    });
  });
}
