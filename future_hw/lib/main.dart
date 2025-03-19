import 'dart:async';
import 'dart:math';

void main() {

  final numbers = [1, 2, 3, 4, 5];

  calculateSumAfterRandomDelay(numbers).then((sum) {
    print('Сумма массива: $sum');
  }).catchError((error) {
    print('Произошла ошибка: $error');
  });

  print('Ожидаем вычисления суммы...');
}


Future<int> calculateSumAfterRandomDelay(List<int> numbers) async {

  final random = Random();
  final delayInSeconds = random.nextInt(5) + 1; // От 1 до 5 секунд

  print('Задержка: $delayInSeconds секунд');
  await Future.delayed(Duration(seconds: delayInSeconds));


  final sum = numbers.reduce((value, element) => value + element);

  return sum;
}