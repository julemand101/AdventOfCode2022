// --- Day 6: Tuning Trouble ---
// https://adventofcode.com/2022/day/6

int solveA(String input) => solve(input, distinctCharacters: 4);
int solveB(String input) => solve(input, distinctCharacters: 14);

int solve(String input, {required int distinctCharacters}) {
  final List<String> letters = input.split('');

  for (var i = distinctCharacters; i < letters.length; i++) {
    Set<String> set = letters.sublist(i - distinctCharacters, i).toSet();

    if (set.length == distinctCharacters) {
      return i;
    }
  }

  throw 'Could not find $distinctCharacters distinct characters in $input';
}
