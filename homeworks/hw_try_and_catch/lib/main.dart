import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TryCatchFuturePage());
  }
}

class TryCatchFuturePage extends StatefulWidget {
  @override
  _TryCatchFuturePageState createState() => _TryCatchFuturePageState();
}

class _TryCatchFuturePageState extends State<TryCatchFuturePage> {
  String result = 'Результат будет здесь';

  @override
  void initState() {
    super.initState();
    _calculate();
  }

  Future<void> _calculate() async {
    try {
      await Future.delayed(Duration(seconds: 2));
      int resultValue = 10 ~/ 0;
      setState(() {
        result = 'Результат: $resultValue';
      });
    } catch (e) {
      setState(() {
        result = 'Произошла ошибка: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Try-Catch with Future')),
      body: Center(child: Text(result, style: TextStyle(fontSize: 24))),
    );
  }
}
