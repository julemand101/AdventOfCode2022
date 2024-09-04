// --- Day 11: Monkey in the Middle ---
// https://adventofcode.com/2022/day/11

import 'dart:collection';

import 'package:collection/collection.dart';

int solveA(Iterable<String> input) => solve(input, rounds: 20, partB: false);
int solveB(Iterable<String> input) => solve(input, rounds: 10000, partB: true);

int solve(Iterable<String> input, {required int rounds, required bool partB}) {
  List<Monkey> monkeys = input
      .splitBetween((first, second) => first.isEmpty || second.isEmpty)
      .where((element) => element.length == 6)
      .map(Monkey.parse)
      .toList(growable: false);

  int superModulo = monkeys.map((e) => e.divisibleBy).reduce((a, b) => a * b);

  for (int round = 0; round < rounds; round++) {
    for (final monkey in monkeys) {
      monkey.inspect(monkeys, partB: partB, superModulo: superModulo);
    }
  }

  monkeys.sort(
    (a, b) => b.inspectedItemsCount.compareTo(a.inspectedItemsCount),
  );

  return monkeys
      .take(2)
      .map((e) => e.inspectedItemsCount)
      .reduce((a, b) => a * b);
}

class Monkey {
  final int id;
  final Queue<int> items;
  final int Function(int) operation;
  final int divisibleBy;
  final int throwToMonkeyIfTrue;
  final int throwToMonkeyIfFalse;
  int inspectedItemsCount = 0;

  Monkey({
    required this.id,
    required this.items,
    required this.operation,
    required this.divisibleBy,
    required this.throwToMonkeyIfTrue,
    required this.throwToMonkeyIfFalse,
  });

  factory Monkey.parse(List<String> lines) {
    int id = int.parse(RegExp(r'Monkey (\d+):').firstMatch(lines[0])![1]!);
    Queue<int> items =
        Queue.of(lines[1].split(': ').last.split(', ').map(int.parse));
    int Function(int) operation = parseOperation(lines[2]);
    int divisibleBy = int.parse(lines[3].split('by ').last);
    int throwToMonkeyIfTrue = int.parse(lines[4].split('monkey ').last);
    int throwToMonkeyIfFalse = int.parse(lines[5].split('monkey ').last);

    return Monkey(
      id: id,
      items: items,
      operation: operation,
      divisibleBy: divisibleBy,
      throwToMonkeyIfTrue: throwToMonkeyIfTrue,
      throwToMonkeyIfFalse: throwToMonkeyIfFalse,
    );
  }

  static int Function(int) parseOperation(String line) {
    RegExp regExp = RegExp(r'Operation: new = old ([*+]) (old|\d+)');
    RegExpMatch match = regExp.firstMatch(line)!;

    String operation = match[1]!;
    int? value = int.tryParse(match[2]!);

    return (int old) => switch (operation) {
          '*' => old * (value ?? old),
          '+' => old + (value ?? old),
          _ => throw 'Unknown operation: $operation in $line',
        };
  }

  void inspect(
    List<Monkey> monkeys, {
    required int superModulo,
    required bool partB,
  }) {
    while (items.isNotEmpty) {
      final newWorryValue = (partB
              ? (operation(items.removeFirst()))
              : (operation(items.removeFirst()) ~/ 3)) %
          superModulo;

      monkeys[(newWorryValue % divisibleBy == 0)
              ? throwToMonkeyIfTrue
              : throwToMonkeyIfFalse]
          .items
          .add(newWorryValue);

      inspectedItemsCount++;
    }
  }
}
