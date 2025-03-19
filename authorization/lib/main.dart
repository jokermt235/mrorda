import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(AuthorizationApp()); 
}

class AuthorizationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Authorization',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}