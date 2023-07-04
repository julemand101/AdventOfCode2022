// --- Day 14: Regolith Reservoir ---
// https://adventofcode.com/2022/day/14

import 'dart:collection';
import 'dart:math';

int solveA(Iterable<String> input) {
  final HashSet<Point<int>> rockPoints = HashSet();

  for (final pathToDraw in input.map((e) => e.split(' -> ').map(parsePoint))) {
    int? prevX;
    int? prevY;

    for (final point in pathToDraw) {
      rockPoints.add(point);

      if (point.x == prevX && prevY != null) {
        for (final y in generateSequence(prevY, point.y)) {
          rockPoints.add(Point(point.x, y));
        }
      } else if (point.y == prevY && prevX != null) {
        for (final x in generateSequence(prevX, point.x)) {
          rockPoints.add(Point(x, point.y));
        }
      }

      prevX = point.x;
      prevY = point.y;
    }
  }

  final int bottomY = rockPoints.reduce((a, b) => a.y > b.y ? a : b).y;
  final HashSet<Point<int>> sandPoints = HashSet();
  const sandSpawnPoint = Point<int>(500, 0);

  bool isNotBlocked(Point<int> point) =>
      !sandPoints.contains(point) && !rockPoints.contains(point);

  outerLoop:
  while (true) {
    var x = sandSpawnPoint.x;

    for (var y = sandSpawnPoint.y; y < bottomY; y++) {
      final point = Point(x, y);

      if (isNotBlocked(point.downOneStep)) {
        // Do nothing since we should just keep going directly down
      } else if (isNotBlocked(point.oneStepDownAndToTheLeft)) {
        // Move one step to the left
        x--;
      } else if (isNotBlocked(point.oneStepDownAndToTheRight)) {
        // Move one step to the right
        x++;
      } else {
        sandPoints.add(point);
        continue outerLoop;
      }
    }

    // If we end here, we reached the "endless" bottom and should then stop
    // since no more sand can be added.
    break;
  }

  return sandPoints.length;
}

Point<int> parsePoint(String l) => switch (l.split(',')) {
      [final x, final y] => Point(int.parse(x), int.parse(y)),
      final unParseable => throw Exception('Could not parse: $unParseable'),
    };

List<int> generateSequence(int from, int to) => (from < to)
    ? [for (var i = from + 1; i < to; i++) i]
    : [for (var i = from - 1; i > to; i--) i];

extension on Point<int> {
  Point<int> get downOneStep => Point(x, y + 1);
  Point<int> get oneStepDownAndToTheLeft => Point(x - 1, y + 1);
  Point<int> get oneStepDownAndToTheRight => Point(x + 1, y + 1);
}
