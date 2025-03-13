import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AdditionCalculator());
  }
}

class AdditionCalculator extends StatefulWidget {
  @override
  _AdditionCalculatorState createState() => _AdditionCalculatorState();
}

class _AdditionCalculatorState extends State<AdditionCalculator> {
  final TextEditingController inputA = TextEditingController();
  final TextEditingController inputB = TextEditingController();
  String resultText = "";

  void performAddition() {
    final double numA = double.tryParse(inputA.text) ?? 0;
    final double numB = double.tryParse(inputB.text) ?? 0;
    setState(() {
      resultText = (numA + numB).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Two Numbers')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: inputA,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Input Number A'),
            ),
            TextField(
              controller: inputB,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Input Number B'),
            ),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: performAddition,
              child: Text('Add Numbers'),
            ),
            SizedBox(height: 25),
            Text('Sum: $resultText'),
          ],
        ),
      ),
    );
  }
}
