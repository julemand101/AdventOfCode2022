// --- Day 10: Cathode-Ray Tube ---
// https://adventofcode.com/2022/day/10

import 'dart:io';
import 'package:advent_of_code_2022/day10.dart';
import 'package:test/test.dart';

final input = File('test/data/day10.txt').readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(largeProgramExample), equals(13140));
    });
    test('Solution', () {
      expect(solveA(input), equals(14340));
    });
  });
  group('Part One', () {
    test('Example 1', () {
      expect(
        solveB(largeProgramExample),
        equals('''
####    ####    ####    ####    ####    ####    ####    ####    ####    ####    
######      ######      ######      ######      ######      ######      ######  
########        ########        ########        ########        ########        
##########          ##########          ##########          ##########          
############            ############            ############            ########
##############              ##############              ##############          
'''),
      );
    });
    test('Solution', () {
      expect(
        solveB(input),
        equals('''
######      ####    ######        ####    ####    ######    ##    ##  ######    
##    ##  ##    ##  ##    ##        ##  ##    ##  ##    ##  ##    ##  ##    ##  
##    ##  ##    ##  ##    ##        ##  ##        ######    ########  ##    ##  
######    ########  ######          ##  ##        ##    ##  ##    ##  ######    
##        ##    ##  ##        ##    ##  ##    ##  ##    ##  ##    ##  ##        
##        ##    ##  ##          ####      ####    ######    ##    ##  ##        
'''),
      );
    });
  });
}

const largeProgramExample = [
  'addx 15',
  'addx -11',
  'addx 6',
  'addx -3',
  'addx 5',
  'addx -1',
  'addx -8',
  'addx 13',
  'addx 4',
  'noop',
  'addx -1',
  'addx 5',
  'addx -1',
  'addx 5',
  'addx -1',
  'addx 5',
  'addx -1',
  'addx 5',
  'addx -1',
  'addx -35',
  'addx 1',
  'addx 24',
  'addx -19',
  'addx 1',
  'addx 16',
  'addx -11',
  'noop',
  'noop',
  'addx 21',
  'addx -15',
  'noop',
  'noop',
  'addx -3',
  'addx 9',
  'addx 1',
  'addx -3',
  'addx 8',
  'addx 1',
  'addx 5',
  'noop',
  'noop',
  'noop',
  'noop',
  'noop',
  'addx -36',
  'noop',
  'addx 1',
  'addx 7',
  'noop',
  'noop',
  'noop',
  'addx 2',
  'addx 6',
  'noop',
  'noop',
  'noop',
  'noop',
  'noop',
  'addx 1',
  'noop',
  'noop',
  'addx 7',
  'addx 1',
  'noop',
  'addx -13',
  'addx 13',
  'addx 7',
  'noop',
  'addx 1',
  'addx -33',
  'noop',
  'noop',
  'noop',
  'addx 2',
  'noop',
  'noop',
  'noop',
  'addx 8',
  'noop',
  'addx -1',
  'addx 2',
  'addx 1',
  'noop',
  'addx 17',
  'addx -9',
  'addx 1',
  'addx 1',
  'addx -3',
  'addx 11',
  'noop',
  'noop',
  'addx 1',
  'noop',
  'addx 1',
  'noop',
  'noop',
  'addx -13',
  'addx -19',
  'addx 1',
  'addx 3',
  'addx 26',
  'addx -30',
  'addx 12',
  'addx -1',
  'addx 3',
  'addx 1',
  'noop',
  'noop',
  'noop',
  'addx -9',
  'addx 18',
  'addx 1',
  'addx 2',
  'noop',
  'noop',
  'addx 9',
  'noop',
  'noop',
  'noop',
  'addx -1',
  'addx 2',
  'addx -37',
  'addx 1',
  'addx 3',
  'noop',
  'addx 15',
  'addx -21',
  'addx 22',
  'addx -6',
  'addx 1',
  'noop',
  'addx 2',
  'addx 1',
  'noop',
  'addx -10',
  'noop',
  'noop',
  'addx 20',
  'addx 1',
  'addx 2',
  'addx 2',
  'addx -6',
  'addx -11',
  'noop',
  'noop',
  'noop',
];
