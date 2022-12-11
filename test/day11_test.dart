// --- Day 11: Monkey in the Middle ---
// https://adventofcode.com/2022/day/11

import 'dart:io';
import 'package:advent_of_code_2022/day11.dart';
import 'package:test/test.dart';

final input = File('test/data/day11.txt').readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(exampleInput), equals(10605));
    });
    test('Solution', () {
      expect(solveA(input), equals(117624));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(exampleInput), equals(2713310158));
    });
    test('Solution', () {
      expect(solveB(input), equals(16792940265));
    });
  });
}

const exampleInput = [
  'Monkey 0:',
  '  Starting items: 79, 98',
  '  Operation: new = old * 19',
  '  Test: divisible by 23',
  '    If true: throw to monkey 2',
  '    If false: throw to monkey 3',
  '',
  'Monkey 1:',
  '  Starting items: 54, 65, 75, 74',
  '  Operation: new = old + 6',
  '  Test: divisible by 19',
  '    If true: throw to monkey 2',
  '    If false: throw to monkey 0',
  '',
  'Monkey 2:',
  '  Starting items: 79, 60, 97',
  '  Operation: new = old * old',
  '  Test: divisible by 13',
  '    If true: throw to monkey 1',
  '    If false: throw to monkey 3',
  '',
  'Monkey 3:',
  '  Starting items: 74',
  '  Operation: new = old + 3',
  '  Test: divisible by 17',
  '    If true: throw to monkey 0',
  '    If false: throw to monkey 1',
];
