import 'dart:async';
import 'dart:math';

Future<void> waitRandomSeconds() async {
  Random random = Random();
  int seconds = random.nextInt(5) + 1; // Случайное число от 1 до 5
  print('Ждем $seconds секунд...');
  await Future.delayed(Duration(seconds: seconds));
}

// суммы массива
int sumOfArray(List<int> numbers) {
  int sum = 0;
  for (int number in numbers) {
    sum += number;
  }
  return sum;
}

void main() {
  print('Начало программы');

  // Массив чисел
  List<int> numbers = [1, 2, 3, 4, 5];

  waitRandomSeconds()
      .then((_) {
        int sum = sumOfArray(numbers);
        print('Sum of Array Series: $sum');
      })
      .catchError((error) {
        print('Errr: $error');
      })
      .whenComplete(() {
        print('End');
      });

  print('Конец программы');
}
