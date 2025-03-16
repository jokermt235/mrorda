import 'package:flutter/material.dart';

import './home_screen.dart';

void main() {
  return runApp(
    MaterialApp(
      theme: ThemeData(primaryColor: Colors.orangeAccent),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Calculator'),
          backgroundColor: Colors.orangeAccent,
        ),
        backgroundColor: const Color.fromARGB(255, 20, 20, 20),
        body: const HomeScreen(),
      ),
    ),
  );
}