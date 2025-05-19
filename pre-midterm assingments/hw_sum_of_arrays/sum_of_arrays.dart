import 'dart:async';
import 'dart:math';

Future<int> getArraySum(List<int> array) async {
  int randomDelay = Random().nextInt(5) + 1;
  print("Waiting for $randomDelay seconds...");

  await Future.delayed(Duration(seconds: randomDelay));

  int sum = array.reduce((a, b) => a + b);
  return sum;
}

void main() async {
  List<int> numbers = [10, 20, 30, 41];

  int result = await getArraySum(numbers);
  print("The sum of the array is: $result");
}
