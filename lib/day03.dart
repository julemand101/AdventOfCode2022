// --- Day 3: Rucksack Reorganization ---
// https://adventofcode.com/2022/day/3

int solveA(Iterable<String> input) {
  int sum = 0;

  for (final line in input) {
    List<String> items = line.split('');
    Set<String> firstCompartment = items.sublist(0, items.length ~/ 2).toSet();
    Set<String> secondCompartment = items.sublist(items.length ~/ 2).toSet();

    sum += getPriority(firstCompartment.intersection(secondCompartment).first);
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
      sum += getPriority(groupItemSet.first);
      groupItemSet.clear();
    }
  }

  return sum;
}

int getPriority(String character) {
  final asciiValue = character.codeUnitAt(0);

  if (asciiValue >= 65 && asciiValue <= 90) {
    // A (Priority 1) -> Z (Priority 26)
    return (asciiValue - 64) + 26;
  } else if (asciiValue >= 97 && asciiValue <= 122) {
    // a (Priority 27) -> Z (Priority 52)
    return asciiValue - 96;
  }

  throw 'Could not parse character: $character';
}
