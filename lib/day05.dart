// --- Day 5: Supply Stacks ---
// https://adventofcode.com/2022/day/5

import 'package:collection/collection.dart' as collection;

String solveA(Iterable<String> input) => solve(
      input,
      pickMultipleCratesAtOnce: false,
    );

String solveB(Iterable<String> input) => solve(
      input,
      pickMultipleCratesAtOnce: true,
    );

String solve(
  Iterable<String> input, {
  required bool pickMultipleCratesAtOnce,
}) {
  List<List<String>> queues = [];
  final Iterator<String> inputIterator = input.iterator;

  // Parse setup phase
  while (inputIterator.moveNext() && inputIterator.current.isNotEmpty) {
    final String line = inputIterator.current;

    // Skip the number line
    if (line.trim().startsWith('1')) {
      continue;
    }

    for (var i = 0, index = 0; i <= line.length; i += 4, index++) {
      if (queues.length < index + 1) {
        queues.add([]);
      }

      String segmentLetter = line.substring(i + 1, i + 2);
      if (segmentLetter.trim().isNotEmpty) {
        queues[index].add(segmentLetter);
      }
    }
  }

  // Reverse each queue
  queues.forEach(collection.reverse);

  // Parse move instructions
  RegExp moveInstructionRegExp = RegExp(r'move (\d+) from (\d+) to (\d+)');

  while (inputIterator.moveNext()) {
    final String line = inputIterator.current;
    final RegExpMatch match = moveInstructionRegExp.firstMatch(line)!;

    int moveAmount = int.parse(match[1]!);
    int moveFrom = int.parse(match[2]!) - 1;
    int moveTo = int.parse(match[3]!) - 1;

    List<String> moveFromList = queues[moveFrom];
    List<String> containers = [];

    for (var i = 0; i < moveAmount; i++) {
      containers.add(moveFromList.removeLast());
    }

    queues[moveTo].addAll(
      pickMultipleCratesAtOnce ? containers.reversed : containers,
    );
  }

  return queues.map((e) => e.last).join();
}
