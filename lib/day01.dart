// --- Day 1: Calorie Counting ---
// https://adventofcode.com/2022/day/1

import 'dart:math';

int solveA(Iterable<String> input) => solve(input).reduce(max);

int solveB(Iterable<String> input) =>
    (solve(input)..sort()).reversed.take(3).reduce((a, b) => a + b);

List<int> solve(Iterable<String> input) {
  List<int> sums = [];
  int tmpSum = 0;

  for (final line in input.followedBy(const [''])) {
    if (line.isEmpty) {
      sums.add(tmpSum);
      tmpSum = 0;
    } else {
      tmpSum += int.parse(line);
    }
  }

  return sums;
}
