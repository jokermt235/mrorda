import 'dart:async';
import 'dart:math';

void main() {
  print("Program started...");

  int delaySeconds = Random().nextInt(5) + 1;
  print("Future will execute after $delaySeconds seconds...");

  Future.delayed(Duration(seconds: delaySeconds), () {
    List<int> numbers = [1, 2, 3, 4, 5]; 
    int sum = numbers.reduce((a, b) => a + b);
    print("Array series: $numbers");
    print("Sum of array series: $sum");
  });

  print("Waiting for the Future...");
}
