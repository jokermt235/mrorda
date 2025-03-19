import 'dart:async';
import 'dart:math';

Future<int> arraySum(List<int> array) async {
  int randomSeconds = Random().nextInt(5) + 1;
  print("wait for $randomSeconds seconds");

  await Future.delayed(Duration(seconds: randomSeconds));

  int sum = array.fold(0, (x, y) => x + y);
  return sum;
}

void main() async {
  List<int> numbers = [56, 8, 4, -8, 43];
  int result = await arraySum(numbers);
  print("sum: $result");
}
