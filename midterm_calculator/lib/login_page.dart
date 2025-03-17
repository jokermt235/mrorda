import 'package:flutter/material.dart';
import 'calculator_page.dart'; // Импортируем калькулятор

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _controller = TextEditingController();
  String _errorText = '';

  // Логин для примера
  String validUsername = "user";

  void _login() {
    if (_controller.text == validUsername) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => CalculatorPage(),
        ), // Переход на калькулятор
      );
    } else {
      setState(() {
        _errorText = 'Неверный логин';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Введите логин',
                errorText: _errorText.isEmpty ? null : _errorText,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _login, child: Text('Войти')),
          ],
        ),
      ),
    );
  }
}
