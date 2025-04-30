import 'dart:async';
import 'dart:math';

void main() {

  final numbers = List<int>.generate(5, (index) => index + 1);
  
  print('array list: $numbers');

  final delay = Random().nextInt(4) + 1;
  print('calculation will start in $delay sec');

  calculateSum(numbers, delay);
}

Future<void> calculateSum(List<int> numbers, int delay) async {

  await Future.delayed(Duration(seconds: delay));

  final sum = numbers.fold<int>(0, (prev, element) => prev + element);

  final endTime = DateTime.now();
  print('sum: $sum');
  print('time: ${delay}s');
}
import 'dart:async';
import 'dart:math';

void main() {

  final numbers = List<int>.generate(5, (index) => index + 1);
  
  print('array list: $numbers');

  final delay = Random().nextInt(4) + 1;
  print('calculation will start in $delay sec');

  calculateSum(numbers, delay);
}

Future<void> calculateSum(List<int> numbers, int delay) async {

  await Future.delayed(Duration(seconds: delay));

  final sum = numbers.fold<int>(0, (prev, element) => prev + element);

  final endTime = DateTime.now();
  print('sum: $sum');
  print('time: ${delay}s');
}
