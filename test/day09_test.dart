// --- Day 9: Rope Bridge ---
// https://adventofcode.com/2022/day/9

import 'dart:io';
import 'package:advent_of_code_2022/day09.dart';
import 'package:test/test.dart';

final input = File('test/data/day09.txt').readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
          solveA(const [
            'R 4',
            'U 4',
            'L 3',
            'D 1',
            'R 4',
            'D 1',
            'L 5',
            'R 2',
          ]),
          equals(13));
    });
    test('Solution', () {
      expect(solveA(input), equals(6503));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(
          solveB(const [
            'R 4',
            'U 4',
            'L 3',
            'D 1',
            'R 4',
            'D 1',
            'L 5',
            'R 2',
          ]),
          equals(1));
    });
    test('Example 2', () {
      expect(
          solveB(const [
            'R 5',
            'U 8',
            'L 8',
            'D 3',
            'R 17',
            'D 10',
            'L 25',
            'U 20',
          ]),
          equals(36));
    });
    test('Solution', () {
      expect(solveB(input), equals(2724));
    });
  });
}
