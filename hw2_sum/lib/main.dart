import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _firstNumberController = TextEditingController();
  final TextEditingController _secondNumberController = TextEditingController();
  String _sum = '';

  void _calculateSum() {
    final firstNumber = double.tryParse(_firstNumberController.text);
    final secondNumber = double.tryParse(_secondNumberController.text);

    if (firstNumber != null && secondNumber != null) {
      setState(() {
        _sum = (firstNumber + secondNumber).toString();
      });
    } else {
      setState(() {
        _sum = 'Invalid input';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sum Calculator')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _firstNumberController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'First number'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _secondNumberController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Second number'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calculateSum,
                child: const Text('Calculate Sum'),
              ),
              const SizedBox(height: 20),
              Text('Sum: $_sum'),
            ],
          ),
        ),
      ),
    );
  }
}
