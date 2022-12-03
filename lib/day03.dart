// --- Day 3: Rucksack Reorganization ---
// https://adventofcode.com/2022/day/3

final Map<String, int> priorityMap = {
  for (var i = 0; i < 26; i++)
    String.fromCharCode('a'.codeUnitAt(0) + i): i + 1,
  for (var i = 0; i < 26; i++)
    String.fromCharCode('A'.codeUnitAt(0) + i): i + 27,
};

int solveA(Iterable<String> input) {
  int sum = 0;

  for (final line in input) {
    List<String> items = line.split('');
    Set<String> firstCompartment = items.sublist(0, items.length ~/ 2).toSet();
    Set<String> secondCompartment = items.sublist(items.length ~/ 2).toSet();

    sum += priorityMap[firstCompartment.intersection(secondCompartment).first]!;
  }

  return sum;
}

int solveB(List<String> input) {
  int sum = 0;
  Set<String> groupItemSet = {};

  for (int i = 0; i < input.length; i++) {
    List<String> items = input[i].split('');

    if (groupItemSet.isEmpty) {
      groupItemSet.addAll(items);
    } else {
      groupItemSet = groupItemSet.intersection(items.toSet());
    }

    // For last line in each third iteration
    if (i % 3 == 2) {
      sum += priorityMap[groupItemSet.first]!;
      groupItemSet.clear();
    }
  }

  return sum;
}
