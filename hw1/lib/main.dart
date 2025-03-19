import 'package:flutter/material.dart';

void main() {
  runApp(SumApp());
}

class SumApp extends StatelessWidget {
  const SumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SumCalculator());
  }
}

class SumCalculator extends StatefulWidget {
  const SumCalculator({super.key});
  @override
  SumCalculatorState createState() => SumCalculatorState();
}

class SumCalculatorState extends State<SumCalculator> {
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  double sum = 0.0;
  void calculateSum() {
    double num1 = double.tryParse(num1Controller.text) ?? 0.0;
    double num2 = double.tryParse(num2Controller.text) ?? 0.0;
    setState(() {
      sum = num1 + num2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: num1Controller,
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: num2Controller,
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(onPressed: calculateSum, child: Text("sum")),
            Text("sum: $sum"),
          ],
        ),
      ),
    );
  }
}
