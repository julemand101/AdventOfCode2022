// --- Day 8: Treetop Tree House ---
// https://adventofcode.com/2022/day/8

import 'dart:math';
import 'dart:typed_data';

import 'package:collection/collection.dart';

int solveA(List<String> input) {
  Grid grid = Grid(input.first.length, input.length)
    ..setAllValues(input.expand((line) => line.split('')).map(int.parse));

  int checkTree(int highestTree, int x, int y) {
    final int treeHeight = grid.get(x, y);

    if (treeHeight > highestTree) {
      grid.visit(x, y);
      return treeHeight;
    } else {
      return highestTree;
    }
  }

  // Top to bottom
  for (var x = 0; x < grid.xSize; x++) {
    for (var y = 0, highestTree = -1; y < grid.ySize; y++) {
      if ((highestTree = checkTree(highestTree, x, y)) == 9) {
        break;
      }
    }
  }

  // Bottom to top
  for (var x = 0; x < grid.xSize; x++) {
    for (var y = grid.ySize - 1, highestTree = -1; y >= 0; y--) {
      if ((highestTree = checkTree(highestTree, x, y)) == 9) {
        break;
      }
    }
  }

  // Left to right
  for (var y = 0; y < grid.ySize; y++) {
    for (var x = 0, highestTree = -1; x < grid.xSize; x++) {
      if ((highestTree = checkTree(highestTree, x, y)) == 9) {
        break;
      }
    }
  }

  // Right to left
  for (var y = 0; y < grid.ySize; y++) {
    for (var x = grid.xSize - 1, highestTree = -1; x >= 0; x--) {
      if ((highestTree = checkTree(highestTree, x, y)) == 9) {
        break;
      }
    }
  }

  return grid.countVisited;
}

int solveB(List<String> input) {
  Grid grid = Grid(input.first.length, input.length)
    ..setAllValues(input.expand((line) => line.split('')).map(int.parse));

  int highestScenicScore = 0;

  for (var y = 0; y < grid.ySize; y++) {
    for (var x = 0; x < grid.xSize; x++) {
      final int heightOfTreeUnderConsideration = grid.get(x, y);

      // Look up
      int upScore = 0;
      for (var y2 = y; y2 >= 0; y2--) {
        if (y2 == y) {
          continue;
        }
        upScore++;

        if (grid.get(x, y2) >= heightOfTreeUnderConsideration) {
          break;
        }
      }

      // Look down
      int downScore = 0;
      for (var y2 = y; y2 < grid.ySize; y2++) {
        if (y2 == y) {
          continue;
        }
        downScore++;

        if (grid.get(x, y2) >= heightOfTreeUnderConsideration) {
          break;
        }
      }

      // Look left
      int leftScore = 0;
      for (var x2 = x; x2 >= 0; x2--) {
        if (x2 == x) {
          continue;
        }
        leftScore++;

        if (grid.get(x2, y) >= heightOfTreeUnderConsideration) {
          break;
        }
      }

      // Look right
      int rightScore = 0;
      for (var x2 = x; x2 < grid.xSize; x2++) {
        if (x2 == x) {
          continue;
        }
        rightScore++;

        if (grid.get(x2, y) >= heightOfTreeUnderConsideration) {
          break;
        }
      }

      highestScenicScore = max(
        upScore * downScore * leftScore * rightScore,
        highestScenicScore,
      );
    }
  }

  return highestScenicScore;
}

class Grid {
  final int xSize;
  final int ySize;
  final Uint8List list;
  final BoolList visitedList;

  Grid(this.xSize, this.ySize)
      : list = Uint8List(xSize * ySize),
        visitedList = BoolList(xSize * ySize);

  int get(int x, int y) => list[listIndexOf(x, y)];
  int listIndexOf(int x, int y) => x + (y * xSize);

  void setValue(int x, int y, int value) => list[listIndexOf(x, y)] = value;
  void setAllValues(Iterable<int> values) => list.setAll(0, values);

  void visit(int x, int y) => visitedList[listIndexOf(x, y)] = true;

  int get countVisited => visitedList.where((boolValue) => boolValue).length;

  @override
  String toString() {
    final buffer = StringBuffer();

    for (var y = 0; y < ySize; y++) {
      for (var x = 0; x < xSize; x++) {
        buffer.write(visitedList[listIndexOf(x, y)] ? get(x, y) : ' ');
      }
      buffer.writeln();
    }

    return buffer.toString();
  }
}
