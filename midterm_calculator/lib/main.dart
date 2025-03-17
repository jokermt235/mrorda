import 'package:flutter/material.dart';
import 'login_page.dart'; // Импортируем LoginPage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(), // Стартуем с экрана логина
    );
  }
}
