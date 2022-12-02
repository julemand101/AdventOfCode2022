// --- Day 2: Rock Paper Scissors ---
// https://adventofcode.com/2022/day/2

import 'dart:io';
import 'package:advent_of_code_2022/day02.dart';
import 'package:test/test.dart';

final input = File('test/data/day02.txt').readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
          solveA(const [
            'A Y',
            'B X',
            'C Z',
          ]),
          equals(15));
    });
    test('Solution', () {
      expect(solveA(input), equals(8392));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(
          solveB(const [
            'A Y',
            'B X',
            'C Z',
          ]),
          equals(12));
    });
    test('Solution', () {
      expect(solveB(input), equals(10116));
    });
  });
}
