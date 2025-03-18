import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController field1Controller = TextEditingController();
  final TextEditingController field2Controller = TextEditingController();
  int? result;

  void calculateSum() {
    int field1 = int.tryParse(field1Controller.text) ?? 0;
    int field2 = int.tryParse(field2Controller.text) ?? 0;
    
    setState(() {
      result = (field1 < 0 || field2 < 0) ? 0 : field1 + field2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("calculator")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: field1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "number 1"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: field2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "number 2"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateSum,
              child: Text("="),
            ),
            SizedBox(height: 20),
            Text(
              result != null ? "result: $result" : "enter =",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
