import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

Future<int> calculateArraySum(List<int> array) async {
  // Генерация случайной задержки от 1 до 5 секунд
  int randomSeconds = Random().nextInt(5) + 1;
  print("Random delay: $randomSeconds seconds...");

  // Ожидание случайное количество секунд
  await Future.delayed(Duration(seconds: randomSeconds));

  // Вычисление суммы элементов массива
  int sum = array.fold(0, (previousValue, element) => previousValue + element);
  return sum;
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String sumMessage = 'Calculating the sum of the array...';

  @override
  void initState() {
    super.initState();
    _calculateSum();
  }

  // Функция для вычисления и отображения суммы массива
  void _calculateSum() async {
    List<int> numbers = [10, 20, 30, 40, 50];
    int result = await calculateArraySum(numbers);
    setState(() {
      sumMessage = "The sum of the array is: $result";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sum of Array Example'),
        ),
        body: Center(
          child: Text(sumMessage),
        ),
      ),
    );
  }
}
