// --- Day 13: Distress Signal ---
// https://adventofcode.com/2022/day/13

import 'dart:io';
import 'package:advent_of_code_2022/day13.dart';
import 'package:test/test.dart';

final input = File('test/data/day13.txt').readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
          solveA(const [
            '[1,1,3,1,1]',
            '[1,1,5,1,1]',
            '',
            '[[1],[2,3,4]]',
            '[[1],4]',
            '',
            '[9]',
            '[[8,7,6]]',
            '',
            '[[4,4],4,4]',
            '[[4,4],4,4,4]',
            '',
            '[7,7,7,7]',
            '[7,7,7]',
            '',
            '[]',
            '[3]',
            '',
            '[[[]]]',
            '[[]]',
            '',
            '[1,[2,[3,[4,[5,6,7]]]],8,9]',
            '[1,[2,[3,[4,[5,6,0]]]],8,9]',
          ]),
          equals(13));
    });
    test('Solution', () {
      expect(solveA(input), equals(6072));
    });
  });
}
