// --- Day 1: Calorie Counting ---
// https://adventofcode.com/2022/day/1

import 'dart:io';
import 'package:advent_of_code_2022/day01.dart';
import 'package:test/test.dart';

final input = File('test/data/day01.txt').readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
          solveA(const [
            '1000',
            '2000',
            '3000',
            '',
            '4000',
            '',
            '5000',
            '6000',
            '',
            '7000',
            '8000',
            '9000',
            '',
            '10000',
          ]),
          equals(24000));
    });
    test('Solution', () {
      expect(solveA(input), equals(69912));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(
          solveB(const [
            '1000',
            '2000',
            '3000',
            '',
            '4000',
            '',
            '5000',
            '6000',
            '',
            '7000',
            '8000',
            '9000',
            '',
            '10000',
          ]),
          equals(45000));
    });
    test('Solution', () {
      expect(solveB(input), equals(208180));
    });
  });
}
