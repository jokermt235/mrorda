import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class SumCalculator {
  Future<int> calculateSum(List<int> numbers) async {
    int delay =
        Random().nextInt(5) +
        1; // Генерация случайной задержки от 1 до 5 секунд
    await Future.delayed(Duration(seconds: delay));
    return numbers.reduce((a, b) => a + b);
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController _controller = TextEditingController();
  final SumCalculator _calculator = SumCalculator();
  int? _sum;
  bool _isLoading = false;

  void _calculateSum() async {
    setState(() {
      _isLoading = true;
      _sum = null;
    });

    List<int> numbers =
        _controller.text
            .split(',')
            .map((e) => int.tryParse(e.trim()) ?? 0)
            .toList();

    int result = await _calculator.calculateSum(numbers);

    setState(() {
      _sum = result;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Асинхронный сумматор')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Введите числа через запятую',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateSum,
              child: Text('Вычислить сумму'),
            ),
            SizedBox(height: 20),
            _isLoading
                ? CircularProgressIndicator()
                : _sum != null
                ? Text('Результат: $_sum', style: TextStyle(fontSize: 24))
                : Container(),
          ],
        ),
      ),
    );
  }
}
