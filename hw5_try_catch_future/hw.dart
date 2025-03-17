import 'dart:async';
import 'dart:math';

void main() {
  print('Program started');

  try {
    int result = 10 ~/ 0;
    print('Result: $result');
  } catch (e) {
    print('An error occurred: $e');
  } finally {
    print('This block will always execute.');
  }

  Future.delayed(Duration(seconds: 2), () {
        throw Exception('Error in Future!');
      })
      .then((value) {
        print('Future completed successfully: $value');
      })
      .catchError((error) {
        print('An error occurred in Future: $error');
      })
      .whenComplete(() {
        print('Future completed.');
      });

  Future<void> fetchData() async {
    try {
      print('Loading data...');
      await Future.delayed(Duration(seconds: 2));
      throw Exception('Error while loading data');
    } catch (e) {
      print('Error: $e');
    } finally {
      print('Loading completed.');
    }
  }

  fetchData();

  Random random = Random();
  int seconds = random.nextInt(5) + 1;
  print('Waiting for $seconds seconds...');
  Future.delayed(Duration(seconds: seconds), () {
    List<int> numbers = [1, 2, 3, 4, 5];
    int sum = numbers.reduce((a, b) => a + b);
    print('Sum of the array: $sum');
  });

  print('Program ended');
}
