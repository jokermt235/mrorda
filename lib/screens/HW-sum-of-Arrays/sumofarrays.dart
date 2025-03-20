import 'dart:async';
import 'dart:math';

Future<int> calculateSum(List<int> numbers) async {
  int delay = Random().nextInt(5) + 1;
  print("Waiting for $delay seconds...");

  await Future.delayed(Duration(seconds: delay));

  return numbers.reduce((a, b) => a + b);
}

void main() async {
  List<int> values = [5, 15, 25, 35, 45];
  print("Starting calculation...");
  int total = await calculateSum(values);
  print("Total sum: $total");
}
