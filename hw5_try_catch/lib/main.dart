import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _message = "Press the button";

  Future<void> _simulateFutureTask() async {
    setState(() => _message = "Processing...");
    try {
      int delay = Random().nextInt(5) + 1;
      await Future.delayed(Duration(seconds: delay));

      if (Random().nextBool()) throw "Random Error Occurred!";

      setState(() => _message = "Success! Task completed.");
    } catch (e) {
      setState(() => _message = "Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Future Try-Catch Example")),
      body: Center(child: Text(_message, style: const TextStyle(fontSize: 20))),
      floatingActionButton: FloatingActionButton(
        onPressed: _simulateFutureTask,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
