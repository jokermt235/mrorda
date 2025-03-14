import 'dart:async';
import 'dart:math';

Future<int> calculateSum (List<int> array) async {
  int delay = Random().nextInt(5) + 1;
  print("Delay: $delay seconds...");

  await Future.delayed(Duration(seconds: delay)); // Wait for the specified number of seconds

  int sum = array.fold(0, (prev, element) => prev + element); //fold is like a way to go through all the items in a list and combine them into one value (like sum).
  return sum;
}

void main() async {
  List<int> values = [22, 14, 31, 9, 15, 25];
  print("Calculating...");
  int result = await calculateSum(values);
  print("The sum is: $result");
}