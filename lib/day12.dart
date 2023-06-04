// --- Day 12: Hill Climbing Algorithm ---
// https://adventofcode.com/2022/day/12

import 'dart:math';
import 'dart:typed_data';

import 'package:collection/collection.dart';

final int letterA = 'a'.codeUnitAt(0);
final int letterS = 'S'.codeUnitAt(0);
final int letterE = 'E'.codeUnitAt(0);
final int letterZ = 'z'.codeUnitAt(0);

int solveA(List<String> input) {
  Grid grid = Grid(input.first.length, input.length)
    ..setAllValues(input.expand((line) => line.codeUnits));

  late final Point<int> startPoint;
  late final Point<int> endPoint;

  for (var y = 0; y < grid.ySize; y++) {
    for (var x = 0; x < grid.xSize; x++) {
      int codeUnit = grid.get(x, y);

      if (codeUnit == letterS) {
        startPoint = Point(x, y);
        grid.setValue(x, y, letterA);
      } else if (codeUnit == letterE) {
        endPoint = Point(x, y);
        grid.setValue(x, y, letterZ);
      }
    }
  }

  // Default `false` on all values
  BoolList visited = BoolList(grid.list.length)
    ..[grid.listIndexOf(startPoint.x, startPoint.y)] = true;
  Grid distance = Grid(grid.xSize, grid.ySize);

  print(startPoint);
  print(grid.getNeighbours(Point(0, 0)));
  print(endPoint);

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

  Iterable<Point<int>> getNeighbours(Point<int> point) sync* {
    int currentHeight = get(point.x, point.y);

    yield* [
      Point(point.x, point.y - 1), // up
      Point(point.x + 1, point.y), // right
      Point(point.x, point.y + 1), // down
      Point(point.x - 1, point.y), // left
    ]
        .where((p) => p.x >= 0 && p.x < xSize && p.y >= 0 && p.y < ySize)
        .where((p) {
      int height = get(p.x, p.y);

      return (height == currentHeight) || (height == (currentHeight + 1));
    });
  }

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
