// --- Day 6: Tuning Trouble ---
// https://adventofcode.com/2022/day/6

import 'dart:io';
import 'package:advent_of_code_2022/day06.dart';
import 'package:test/test.dart';

final input = File('test/data/day06.txt').readAsLinesSync().first;

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA('mjqjpqmgbljsphdztnvjfqwrcgsmlb'), equals(7));
    });
    test('Example 2', () {
      expect(solveA('bvwbjplbgvbhsrlpgdmjqwftvncz'), equals(5));
    });
    test('Example 3', () {
      expect(solveA('nppdvjthqldpwncqszvftbrmjlhg'), equals(6));
    });
    test('Example 4', () {
      expect(solveA('nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg'), equals(10));
    });
    test('Example 5', () {
      expect(solveA('zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw'), equals(11));
    });
    test('Solution', () {
      expect(solveA(input), equals(1779));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB('mjqjpqmgbljsphdztnvjfqwrcgsmlb'), equals(19));
    });
    test('Example 2', () {
      expect(solveB('bvwbjplbgvbhsrlpgdmjqwftvncz'), equals(23));
    });
    test('Example 3', () {
      expect(solveB('nppdvjthqldpwncqszvftbrmjlhg'), equals(23));
    });
    test('Example 4', () {
      expect(solveB('nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg'), equals(29));
    });
    test('Example 5', () {
      expect(solveB('zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw'), equals(26));
    });
    test('Solution', () {
      expect(solveB(input), equals(2635));
    });
  });
}
