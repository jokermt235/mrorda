import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/data_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQLite Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: {
        '/data': (context) => const DataScreen(),
      },
    );
  }
}
