import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('try, catch with future')),
        body: Center(child: FutureExample()),
      ),
    );
  }
}

class FutureExample extends StatefulWidget {
  @override
  _FutureExampleState createState() => _FutureExampleState();
}

class _FutureExampleState extends State<FutureExample> {
  String result = 'wait...';

  @override
  void initState() {
    super.initState();
    performAsyncTask();
  }

  Future<void> performAsyncTask() async {
    try {
      final String data = await fetchData();
      setState(() {
        result = 'data loaded: $data';
      });
    } catch (e) {
      setState(() {
        result = 'error!!1: $e';
      });
    }
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 2));
    if (DateTime.now().second % 2 == 0) {
      throw Exception('network error');
    }

    return 'Bless you';
  }

  @override
  Widget build(BuildContext context) {
    return Text(result, style: TextStyle(fontSize: 24));
  }
}
