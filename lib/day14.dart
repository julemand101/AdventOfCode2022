// --- Day 14: Regolith Reservoir ---
// https://adventofcode.com/2022/day/14

import 'dart:collection';
import 'dart:math';

int solveA(Iterable<String> input) {
  // A point might be filled with either a rock or sand. In the beginning, we
  // only have rocks. Since we later need to only count the sand, we keep a
  // count of how many rocks there are so we can subtract that later.
  final HashSet<Point<int>> filledPoints = parseRocks(input);
  final int numberOfRocks = filledPoints.length;
  final int bottomY = filledPoints.reduce((a, b) => a.y > b.y ? a : b).y;
  const sandSpawnPoint = Point<int>(500, 0);

  outerLoop:
  while (true) {
    var x = sandSpawnPoint.x;

    for (var y = sandSpawnPoint.y; y < bottomY; y++) {
      final point = Point(x, y);

      if (!filledPoints.contains(point.downOneStep)) {
        // Do nothing since we should just keep going directly down
      } else if (!filledPoints.contains(point.oneStepDownAndToTheLeft)) {
        // Move one step to the left
        x--;
      } else if (!filledPoints.contains(point.oneStepDownAndToTheRight)) {
        // Move one step to the right
        x++;
      } else {
        filledPoints.add(point);
        continue outerLoop;
      }
    }

    // If we end here, we reached the "endless" bottom and should then stop
    // since no more sand can be added.
    break;
  }

  return filledPoints.length - numberOfRocks;
}

int solveB(Iterable<String> input) {
  final HashSet<Point<int>> filledPoints = parseRocks(input);
  final int numberOfRocks = filledPoints.length;
  final int bottomY = filledPoints.reduce((a, b) => a.y > b.y ? a : b).y + 2;
  const sandSpawnPoint = Point<int>(500, 0);

  bool isNotBlocked(Point<int> point) =>
      !filledPoints.contains(point) && point.y < bottomY;

  outerLoop:
  while (isNotBlocked(sandSpawnPoint)) {
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
        filledPoints.add(point);
        continue outerLoop;
      }
    }
  }

  return filledPoints.length - numberOfRocks;
}

HashSet<Point<int>> parseRocks(Iterable<String> input) {
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

  return rockPoints;
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
