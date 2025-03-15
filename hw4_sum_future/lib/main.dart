import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int? _sum;
  bool _isLoading = false;

  Future<void> _calculateSum() async {
    setState(() => _isLoading = true);
    await Future.delayed(Duration(seconds: Random().nextInt(5) + 1));
    setState(() {
      _sum = [1, 2, 3, 4, 5, 6, 7, 8, 9].reduce((a, b) => a + b);
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Future Delay Example')),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : Text(_sum == null ? 'Press the button' : 'Sum: $_sum', style: const TextStyle(fontSize: 24)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _calculateSum,
        child: const Icon(Icons.calculate),
      ),
    );
  }
}
