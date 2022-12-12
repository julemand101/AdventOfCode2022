// --- Day 12: Hill Climbing Algorithm ---
// https://adventofcode.com/2022/day/12

import 'dart:typed_data';

final Map<String, int> heightMap = {
  'S': 0,
  for (var i = 97; i <= 122; i++) String.fromCharCode(i): i - 97,
  'E': 25,
};

int solveA(Iterable<String> input) {
  for (final line in input) {}

  heightMap.entries.forEach(print);

  return 0;
}

class Grid {
  final int xSize;
  final int ySize;
  final Uint8List list;

  Grid(this.xSize, this.ySize) : list = Uint8List(xSize * ySize);

  int get(int x, int y) => list[listIndexOf(x, y)];
  int listIndexOf(int x, int y) => x + (y * xSize);

  void setValue(int x, int y, int value) => list[listIndexOf(x, y)] = value;
  void setAllValues(Iterable<int> values) => list.setAll(0, values);

  @override
  String toString() {
    final buffer = StringBuffer();

    for (var y = 0; y < ySize; y++) {
      for (var x = 0; x < xSize; x++) {
        buffer.write(get(x, y));
      }
      buffer.writeln();
    }

    return buffer.toString();
  }
}
