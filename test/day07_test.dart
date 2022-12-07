// --- Day 7: No Space Left On Device ---
// https://adventofcode.com/2022/day/7

import 'dart:io';
import 'package:advent_of_code_2022/day07.dart';
import 'package:test/test.dart';

final input = File('test/data/day07.txt').readAsLinesSync();
const List<String> exampleInput = [
  r'$ cd /',
  r'$ ls',
  r'dir a',
  r'14848514 b.txt',
  r'8504156 c.dat',
  r'dir d',
  r'$ cd a',
  r'$ ls',
  r'dir e',
  r'29116 f',
  r'2557 g',
  r'62596 h.lst',
  r'$ cd e',
  r'$ ls',
  r'584 i',
  r'$ cd ..',
  r'$ cd ..',
  r'$ cd d',
  r'$ ls',
  r'4060174 j',
  r'8033020 d.log',
  r'5626152 d.ext',
  r'7214296 k',
];

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(exampleInput), equals(95437));
    });
    test('Solution', () {
      expect(solveA(input), equals(1444896));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(exampleInput), equals(24933642));
    });
    test('Solution', () {
      expect(solveB(input), equals(404395));
    });
  });
}
