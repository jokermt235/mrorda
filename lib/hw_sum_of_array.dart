import 'dart:async';
import 'dart:math';

Future<int> getSumAfterRandomDelay(List<int> numbers) async {
  final randomDelay = Random().nextInt(5) + 1;
  await Future.delayed(Duration(seconds: randomDelay));
  return numbers.reduce((a, b) => a + b);
}

void main() async {
  final numbers = [1, 2, 3, 4, 5];
  final sum = await getSumAfterRandomDelay(numbers);

  print('Sum of array: $sum');
}
