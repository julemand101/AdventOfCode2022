// --- Day 12: Hill Climbing Algorithm ---
// https://adventofcode.com/2022/day/12

import 'dart:collection';
import 'dart:math';
import 'dart:typed_data';

final int letterA = 'a'.codeUnitAt(0);
final int letterS = 'S'.codeUnitAt(0);
final int letterE = 'E'.codeUnitAt(0);
final int letterZ = 'z'.codeUnitAt(0);

// Highest uint16 value = Point we have yet to visit
const notVisited = 65535;

int solveA(List<String> input) {
  final (:startPosition, lowestElevationPositions: _, :distances) =
      parseInput(input);

  return distances[startPosition];
}

int solveB(List<String> input) {
  final (startPosition: _, :lowestElevationPositions, :distances) =
      parseInput(input);

  return lowestElevationPositions.fold(
    notVisited,
    (shortestDistance, position) => min(shortestDistance, distances[position]),
  );
}

({
  int startPosition,
  List<int> lowestElevationPositions,
  Uint16List distances,
}) parseInput(List<String> input) {
  Grid grid = Grid(input.first.length, input.length)
    ..setAllValues(input.expand((line) => line.codeUnits));

  late final Point<int> startPoint, endPoint;
  final List<int> lowestElevationPoints = [];

  for (var y = 0; y < grid.ySize; y++) {
    for (var x = 0; x < grid.xSize; x++) {
      int codeUnit = grid.get(x, y);

      if (codeUnit == letterS) {
        startPoint = Point(x, y);
        codeUnit = grid.setValue(x, y, letterA);
      } else if (codeUnit == letterE) {
        endPoint = Point(x, y);
        codeUnit = grid.setValue(x, y, letterZ);
      }

      if (codeUnit == letterA) {
        lowestElevationPoints.add(grid.listIndexOf(x, y));
      }
    }
  }

  Uint16List distances = Uint16List(grid.list.length)
    ..fillRange(0, grid.list.length, -1)
    ..[grid.listIndexOfPoint(endPoint)] = 0;

  Queue<Point<int>> pointsToVisit = Queue()..add(endPoint);

  while (pointsToVisit.isNotEmpty) {
    final Point<int> pointToVisit = pointsToVisit.removeFirst();
    final int listIndexOfPoint = grid.listIndexOfPoint(pointToVisit);
    final int currentDistance = distances[listIndexOfPoint];

    for (final Point<int> neighbourPoint in grid.getNeighbours(pointToVisit)) {
      final int indexOfNeighbourPoint = grid.listIndexOfPoint(neighbourPoint);
      final int knowDistanceToPoint = distances[indexOfNeighbourPoint];

      if (knowDistanceToPoint == notVisited) {
        distances[indexOfNeighbourPoint] = currentDistance + 1;
        pointsToVisit.add(neighbourPoint);
      }
    }
  }

  return (
    startPosition: grid.listIndexOfPoint(startPoint),
    lowestElevationPositions: lowestElevationPoints,
    distances: distances,
  );
}

class Grid {
  final int xSize;
  final int ySize;
  final Uint8List list;

  Grid(this.xSize, this.ySize) : list = Uint8List(xSize * ySize);

  int get(int x, int y) => list[listIndexOf(x, y)];
  int listIndexOf(int x, int y) => x + (y * xSize);
  int listIndexOfPoint(Point<int> point) => listIndexOf(point.x, point.y);

  int setValue(int x, int y, int value) => list[listIndexOf(x, y)] = value;
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
        .where((p) => get(p.x, p.y) >= currentHeight - 1);
  }

  @override
  String toString() {
    final buffer = StringBuffer();

    for (var y = 0; y < ySize; y++) {
      for (var x = 0; x < xSize; x++) {
        buffer.writeCharCode(get(x, y));
      }
      buffer.writeln();
    }

    return buffer.toString();
  }
}
