import 'package:calculator/calculator.dart';
import 'package:calculator/login.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),         
        '/calculator': (context) => CalculatorPage(), 
      },
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
