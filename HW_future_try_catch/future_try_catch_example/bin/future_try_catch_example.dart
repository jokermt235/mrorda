import 'dart:async';
import 'dart:math';

void main() {
  print("Program started...");

  performTask();

  print("Waiting for the Future to complete...");
}

Future<int> simulateAsyncOperation() async {
  int delaySeconds = Random().nextInt(5) + 1; 
  print("Operation will execute after $delaySeconds seconds...");

  await Future.delayed(Duration(seconds: delaySeconds));

  if (Random().nextBool()) {
    throw Exception("Something went wrong during the operation!");
  }

  List<int> numbers = [1, 2, 3, 4, 5];
  int sum = numbers.reduce((a, b) => a + b);
  return sum;
}


void performTask() async {
  try {
    int result = await simulateAsyncOperation();
    print("Success! Sum of array series: $result");
  } catch (e) {
    print("Error caught: $e");
  }
}
