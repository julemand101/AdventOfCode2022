// --- Day 10: Cathode-Ray Tube ---
// https://adventofcode.com/2022/day/10

import 'package:collection/collection.dart';

int solveA(Iterable<String> input) =>
    runProgramAndGetRegisterXEachCycle(input).foldIndexed(
        0,
        (cpuCycle, sum, registerX) =>
            (cpuCycle == 20 || (cpuCycle > 20 && (cpuCycle - 20) % 40 == 0))
                ? sum + (cpuCycle * registerX)
                : sum);

String solveB(Iterable<String> input) =>
    runProgramAndGetRegisterXEachCycle(input).skip(1).take(240).foldIndexed(
      StringBuffer(),
      (cpuCycle, image, registerX) {
        int cathodePosition = cpuCycle % 40;

        // Changed the layout to use `##`/` ` instead of `#`/` ` because it
        // makes the output a lot easier to read. Test code is changed to this
        // format as well.
        String value = (cathodePosition == registerX - 1) ||
                (cathodePosition == registerX) ||
                (cathodePosition == registerX + 1)
            ? '##'
            : '  ';

        return ((cpuCycle + 1) % 40 == 0)
            ? (image..writeln(value))
            : (image..write(value));
      },
    ).toString();

Iterable<int> runProgramAndGetRegisterXEachCycle(Iterable<String> input) sync* {
  int registerX = 1;
  yield registerX;
  yield registerX;

  for (final instruction in input) {
    yield registerX;

    if (instruction.startsWith('addx')) {
      yield registerX += int.parse(instruction.split(' ')[1]);
    } else if (instruction == 'noop') {
      // Do nothing
    } else {
      throw '$instruction is an invalid instruction!';
    }
  }
}
