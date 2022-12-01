// --- Day 1: Calorie Counting ---
// https://adventofcode.com/2022/day/1

import 'dart:math';

int solveA(Iterable<String> input) {
  int sum = 0;
  int maxSum = 0;

  for (final line in input.followedBy(const [''])) {
    if (line.isEmpty) {
      maxSum = max(sum, maxSum);
      sum = 0;
    } else {
      sum += int.parse(line);
    }
  }

  return maxSum;
}

int solveB(Iterable<String> input) {
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
  sums.sort((a, b) => b.compareTo(a));

  return sums.take(3).reduce((a, b) => a + b);
}
