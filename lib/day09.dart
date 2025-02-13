// --- Day 9: Rope Bridge ---
// https://adventofcode.com/2022/day/9

import 'dart:math';

int solveA(Iterable<String> input) => solve(input, amountOfKnots: 2);
int solveB(Iterable<String> input) => solve(input, amountOfKnots: 10);

int solve(Iterable<String> input, {required int amountOfKnots}) {
  final tailVisits = {const Point<int>(0, 0)};
  final knots = List.filled(amountOfKnots, const Point<int>(0, 0));

  for (final line in input) {
    final List<String> parts = line.split(' ');
    final String direction = parts[0];
    final int distance = int.parse(parts[1]);

    for (var i = 0; i < distance; i++) {
      final oldHeadPoint = knots[0];

      knots[0] = switch (direction) {
        'U' => Point<int>(oldHeadPoint.x, oldHeadPoint.y - 1),
        'D' => Point<int>(oldHeadPoint.x, oldHeadPoint.y + 1),
        'L' => Point<int>(oldHeadPoint.x - 1, oldHeadPoint.y),
        'R' => Point<int>(oldHeadPoint.x + 1, oldHeadPoint.y),
        _ => throw 'Invalid instruction: $line',
      };

      for (var knotIndex = 1; knotIndex < knots.length; knotIndex++) {
        knots[knotIndex] = knots[knotIndex].pointTowards(knots[knotIndex - 1]);

        // Track where the tail are moving
        if (knotIndex == amountOfKnots - 1) {
          tailVisits.add(knots[knotIndex]);
        }
      }
    }
  }

  return tailVisits.length;
}

extension on Point<int> {
  bool isTouching(Point<int> other) =>
      [x - 1, x, x + 1].contains(other.x) &&
      [y - 1, y, y + 1].contains(other.y);

  Point<int> pointTowards(Point<int> other) {
    if (isTouching(other)) {
      return this;
    }

    if (x == other.x && y != other.y) {
      if ((other.y - y) > 0) {
        return Point(x, y + 1);
      } else {
        return Point(x, y - 1);
      }
    } else if (x != other.x && y == other.y) {
      if ((other.x - x) > 0) {
        return Point(x + 1, y);
      } else {
        return Point(x - 1, y);
      }
    } else {
      for (final attemptX in [x - 1, x + 1]) {
        for (final attemptY in [y - 1, y + 1]) {
          Point<int> attempt = Point<int>(attemptX, attemptY);

          if (attempt.isTouching(other)) {
            return attempt;
          }
        }
      }
    }

    throw 'Could not get closer from $this to $other';
  }
}
