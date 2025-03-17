import 'package:flutter/material.dart';

mixin CalculatorMixin {
  double add(double a, double b) => a + b;
}

class Utility {
  static void performNothing() {
    // Этот метод ничего не делает
  }
}

class SumCalculator with CalculatorMixin {
  double calculate(double a, double b) {
    return add(a, b);
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
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  double _sum = 0;
  final SumCalculator _calculator = SumCalculator();

  void _calculateSum() {
    double num1 = double.tryParse(_controller1.text) ?? 0;
    double num2 = double.tryParse(_controller2.text) ?? 0;
    setState(() {
      _sum = _calculator.calculate(num1, num2);
    });
    Utility.performNothing();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Сумматор с Mixin и Static')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Введите число 1'),
            ),
            TextField(
              controller: _controller2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Введите число 2'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateSum,
              child: Text('Вычислить сумму'),
            ),
            SizedBox(height: 20),
            Text('Результат: $_sum', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
