import 'dart:async';
import 'dart:math';

Future<int> delayedSum(List<int> numbers) async {
  int delaySeconds = Random().nextInt(5) + 1;
  await Future.delayed(Duration(seconds: delaySeconds));
  return numbers.reduce((a, b) => a + b);
}

void main() async {
  List<int> numbers = [1, 2, 3, 4, 5];
  print("Calculating sum...");
  int sum = await delayedSum(numbers);
  print("Sum: $sum");
}
