// --- Day 13: Distress Signal ---
// https://adventofcode.com/2022/day/13

import 'dart:convert';

import 'package:collection/collection.dart';

int solveA(Iterable<String> input) {
  int sum = 0;
  int index = 0;

  for (final [List<dynamic> packetData1, List<dynamic> packetData2] in input
      .where((element) => element.isNotEmpty)
      .map(jsonDecode)
      .slices(2)) {
    index++;

    if (testPair(packetData1, packetData2)!) {
      sum += index;
    }
  }

  return sum;
}

int solveB(Iterable<String> input) {
  const List<dynamic> divider1 = [
    [2]
  ];
  const List<dynamic> divider2 = [
    [6]
  ];

  final List<dynamic> dataPackets = [
    divider1,
    divider2,
    ...input.where((element) => element.isNotEmpty).map(jsonDecode),
  ]..sort((a, b) => testPair(a, b)! ? -1 : 1);

  final int divider1Index = dataPackets.indexOf(divider1) + 1;
  final int divider2Index = dataPackets.indexOf(divider2, divider1Index) + 1;

  return divider1Index * divider2Index;
}

bool? testPair(dynamic packetData1, dynamic packetData2) {
  switch ((packetData1, packetData2)) {
    case (int left, int right):
      if (left == right) {
        return null;
      } else {
        return left < right;
      }
    case (List<dynamic> left, List<dynamic> right):
      final leftIterator = left.iterator, rightIterator = right.iterator;

      while (true) {
        switch ((leftIterator.moveNext(), rightIterator.moveNext())) {
          case (true, false):
            return false;
          case (false, true):
            return true;
          case (false, false):
            return null;
          case (true, true):
            final leftValue = leftIterator.current;
            final rightValue = rightIterator.current;

            final result = testPair(leftValue, rightValue);
            if (result != null) {
              return result;
            }
        }
      }
    case (List<dynamic> left, int right):
      return testPair(left, [right]);
    case (int left, List<dynamic> right):
      return testPair([left], right);
  }

  throw Exception(
      'Could not handle packetData1($packetData1) packetData2($packetData2)!');
}
