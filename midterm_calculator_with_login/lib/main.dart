import 'package:flutter/material.dart';
import 'package:calculator_with_login/pages/login_page.dart';
import 'package:calculator_with_login/pages/register_page.dart';
import 'package:calculator_with_login/pages/calculator_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/calculator': (context) => CalculatorPage(),
      },
    );
  }
}
