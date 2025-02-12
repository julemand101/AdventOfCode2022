// --- Day 4: Camp Cleanup ---
// https://adventofcode.com/2022/day/4

int solveA(Iterable<String> input) => solve(input, (aSet, bSet) {
  Set<int> unionSet = aSet.union(bSet);
  return unionSet.length == aSet.length || unionSet.length == bSet.length;
});

int solveB(Iterable<String> input) =>
    solve(input, (aSet, bSet) => aSet.intersection(bSet).isNotEmpty);

int solve(
  Iterable<String> input,
  bool Function(Set<int> aSet, Set<int> bSet) isOverlappingAssignmentFunction,
) {
  int overlappingAssignments = 0;

  for (final line in input) {
    RegExpMatch match = inputRegExp.firstMatch(line)!;
    Set<int> aSet = createSet(int.parse(match[1]!), int.parse(match[2]!));
    Set<int> bSet = createSet(int.parse(match[3]!), int.parse(match[4]!));

    if (isOverlappingAssignmentFunction(aSet, bSet)) {
      overlappingAssignments++;
    }
  }

  return overlappingAssignments;
}

RegExp inputRegExp = RegExp(r'(\d+)-(\d+),(\d+)-(\d+)');
Set<int> createSet(int from, int to) => {for (int i = from; i <= to; i++) i};
