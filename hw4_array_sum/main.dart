import 'dart:math';
import 'dart:async';

void main() async {
  print('Программа запущена');

  final List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  print('Массив чисел: ${numbers.join(', ')}');

  print('Начинаем вычисление суммы массива...');
  final DateTime startTime = DateTime.now();

  try {
    final int sum = await calculateSumWithDelay(numbers);
    final DateTime endTime = DateTime.now();
    final Duration difference = endTime.difference(startTime);

    print('Сумма массива: $sum');
    print(
      'Время выполнения: ${difference.inSeconds}.${difference.inMilliseconds % 1000} секунд',
    );
  } catch (e) {
    print('Произошла ошибка: $e');
  }
}

Future<int> calculateSumWithDelay(List<int> numbers) async {
  final random = Random();
  final delay = random.nextInt(4) + 1; 

  print('Вычисление начнется через $delay секунд');

  await Future.delayed(Duration(seconds: delay));

  int sum = 0;
  for (int number in numbers) {
    sum += number;
  }

  return sum;
}
