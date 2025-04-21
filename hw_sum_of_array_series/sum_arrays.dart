
import 'dart:async';
import 'dart:math';

Future<int> calculateArraySum(List<int> array) async {
  int randomSeconds = Random().nextInt(5) + 1;
  print("Random delay: $randomSeconds seconds...");

  await Future.delayed(Duration(seconds: randomSeconds));

  int sum = array.fold(0, (previousValue, element) => previousValue + element);
  return sum;
}

void main() async {
  List<int> numbers = [10, 20, 30, 40, 50];
  print("Calculating the sum of the array...");
  int result = await calculateArraySum(numbers);
  print("The sum of the array is: $result");
}
