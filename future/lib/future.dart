import 'dart:math';

Future<int> getSumAfterDelay(List<int> numbers) async {
  var random = Random();
  var delayInSeconds = random.nextInt(5) + 1;

  await Future.delayed(Duration(seconds: delayInSeconds));

  int sum = numbers.reduce((a, b) => a + b);

  print('Sum of the array: $sum');
  return sum;
}

void main() async {
  List<int> numbers = [1, 20, 67, 12, 5]; 

  print('Waiting for the sum to be calculated');
  
  int sum = await getSumAfterDelay(numbers);

  print('Sum was calculated: $sum');
}
