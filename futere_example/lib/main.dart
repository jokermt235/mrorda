import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Future Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureExampleScreen(),
    );
  }
}

class FutureExampleScreen extends StatefulWidget {
  @override
  _FutureExampleScreenState createState() => _FutureExampleScreenState();
}

class _FutureExampleScreenState extends State<FutureExampleScreen> {
  String _result = 'Нажми кнопку, чтобы начать';
  bool _isLoading = false;


  Future<void> calculateSum() async {
    setState(() {
      _isLoading = true;
      _result = 'Вычисляем сумму...';
    });

    try {
      final numbers = [1, 2, 3, 4, 5];

      final random = Random();
      final delayInSeconds = random.nextInt(5) + 1;

      await Future.delayed(Duration(seconds: delayInSeconds));

      final sum = numbers.reduce((value, element) => value + element);

      setState(() {
        _result = 'Сумма массива: $sum';
      });
    } catch (error) {

      setState(() {
        _result = 'Ошибка: $error';
      });
    } finally {

      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Future Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _result,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            if (_isLoading)
              CircularProgressIndicator() 
            else
              ElevatedButton(
                onPressed: calculateSum,
                child: Text('Вычислить сумму'),
              ),
          ],
        ),
      ),
    );
  }
}