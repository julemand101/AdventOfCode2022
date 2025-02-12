// --- Day 7: No Space Left On Device ---
// https://adventofcode.com/2022/day/7

int solveA(Iterable<String> input) => makeAoCFileSystem(input).values
    .map((e) => e.size)
    .where((size) => size <= 100000)
    .reduce((a, b) => a + b);

int solveB(Iterable<String> input) {
  final Map<String, AoCDirectory> aoCFileSystem = makeAoCFileSystem(input);

  final int sizeOfOutermostDirectory = aoCFileSystem['']!.size;
  final int unusedSpaceCurrently = 70000000 - sizeOfOutermostDirectory;
  final int directorySizeToBeFound = 30000000 - unusedSpaceCurrently;

  final List<AoCDirectory> aoCDirectoryCandidates = [
    for (AoCDirectory aoCDirectory in aoCFileSystem.values)
      if (aoCDirectory.size >= directorySizeToBeFound) aoCDirectory,
  ]..sort((a, b) => a.size.compareTo(b.size));

  return aoCDirectoryCandidates.first.size;
}

Map<String, AoCDirectory> makeAoCFileSystem(Iterable<String> input) {
  final List<String> currentPath = [''];
  final Map<String, AoCDirectory> previousDirectories = {};
  AoCDirectory currentDirectory = previousDirectories.putIfAbsent(
    '',
    () => AoCDirectory(path: '/'),
  );

  AoCDirectory getDirectory(String path) =>
      previousDirectories.putIfAbsent(path, () => AoCDirectory(path: path));

  for (final line in input) {
    if (line.startsWith(r'$ cd ')) {
      switch (line.split(r'$ cd ')[1]) {
        case '..':
          currentPath.removeLast();
        case '/':
          currentPath
            ..clear()
            ..add('');
        case var argument:
          currentPath.add(argument);
      }

      String stringPath = currentPath.join('/');
      currentDirectory = getDirectory(stringPath);
    } else {
      if (!line.startsWith(r'$ ls')) {
        final List<String> parts = line.split(' ');
        final String name = parts[1];
        final String entryPath = '${currentPath.join('/')}/$name';

        if (parts.first == 'dir') {
          final directory = getDirectory(entryPath);
          currentDirectory.entries.add(directory);
        } else {
          final int size = int.parse(parts.first);
          currentDirectory.entries.add(AoCFile(path: entryPath, size: size));
        }
      }
    }
  }

  return previousDirectories;
}

abstract class AoCEntry {
  final String path;

  AoCEntry({required this.path});

  int get size;
}

class AoCDirectory extends AoCEntry {
  final List<AoCEntry> entries = [];

  AoCDirectory({required super.path});

  @override
  late final int size = entries.fold<int>(0, (sum, b) => sum + b.size);
}

class AoCFile extends AoCEntry {
  @override
  final int size;

  AoCFile({required super.path, required this.size});
}
