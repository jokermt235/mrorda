import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Delay Sum',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Random Delay Sum App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _sum = 0;
  bool _isLoading = false;

  // Function to calculate sum after a random delay
  Future<void> _calculateSumAfterRandomDelay() async {
    setState(() {
      _isLoading = true;
    });

    // Random delay between 1 to 5 seconds
    final randomDelay = Random().nextInt(5) + 1;

    // Wait for the random delay
    await Future.delayed(Duration(seconds: randomDelay));

    // Array to calculate sum
    List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    // Calculate the sum of the array
    int sum = numbers.reduce((value, element) => value + element);

    setState(() {
      _sum = sum;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('The sum of the array is:'),
            if (_isLoading)
              const CircularProgressIndicator()
            else
              Text(
                '$_sum',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateSumAfterRandomDelay,
              child: const Text('Calculate Sum After Random Delay'),
            ),
          ],
        ),
      ),
    );
  }
}
