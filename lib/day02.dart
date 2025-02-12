// --- Day 2: Rock Paper Scissors ---
// https://adventofcode.com/2022/day/2

const rock = 1;
const paper = 2;
const scissors = 3;

const lose = 0;
const draw = 3;
const win = 6;

int solveA(Iterable<String> input) => solve(input, const {
  // Rock
  'A': {'X': rock + draw, 'Y': paper + win, 'Z': scissors + lose},
  // Paper
  'B': {'X': rock + lose, 'Y': paper + draw, 'Z': scissors + win},
  // Scissors
  'C': {'X': rock + win, 'Y': paper + lose, 'Z': scissors + draw},
});

int solveB(Iterable<String> input) => solve(input, const {
  // Rock
  'A': {'X': scissors + lose, 'Y': rock + draw, 'Z': paper + win},
  // Paper
  'B': {'X': rock + lose, 'Y': paper + draw, 'Z': scissors + win},
  // Scissors
  'C': {'X': paper + lose, 'Y': scissors + draw, 'Z': rock + win},
});

int solve(Iterable<String> input, Map<String, Map<String, int>> pointCalcMap) =>
    input
        .map((e) => e.split(' '))
        .map((e) => pointCalcMap[e[0]]![e[1]]!)
        .reduce((a, b) => a + b);
