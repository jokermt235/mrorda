import 'dart:async';
import 'dart:math';

void main() {
  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  int randomSeconds = Random().nextInt(5) + 1;

  Future.delayed(Duration(seconds: randomSeconds), () {
    int sum = numbers.reduce((a, b) => a + b);

    print('Sum of the array: $sum');
  });

  print('The task will execute in $randomSeconds seconds.');
}
