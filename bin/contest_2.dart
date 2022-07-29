import 'package:contest_2/joseph_permutation.dart' as task1;
import 'package:contest_2/buddy_pairs.dart' as task2;
import 'package:contest_2/k_primes.dart' as task3;
import 'package:contest_2/gap_in_primes.dart' as task4;
import 'package:contest_2/john_ann.dart' as task5;
import 'package:contest_2/primes_in_numbers.dart' as task6;
import 'package:contest_2/perimetr.dart' as task7;

import 'package:contest_2/mathematical_expression.dart' as task18;


void main(List<String> arguments) {
  print('№1\n${task1.josephusPermutation([1, 2, 3, 4, 5, 6, 7], 3)}\n');
  print('№2\n${task2.buddy(10, 50)}\n');
  print('№3\nk-primes: ${task3.countKPrimes(5, 500, 600)}\npuzzle: ${task3.puzzle(143)}\n');
  print('№4\n${task4.gap(4, 130, 200)}\n');
  print('№5\njohn(11): ${task5.john(11)}\nann(6): ${task5.ann(6)}\nsum_john: ${task5.sumJohn(75)}\nsum_ann: ${task5.sumAnn(150)}\n');
  print('№6\n${task6.primesInNumbers(86240)}\n');
  print('№7\n${task7.perimeter(7)}\n');

  print('№18\n${task18.evaluateMathematicalExpr('6 + -( -4)')}\n');
}
