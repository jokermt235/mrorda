import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../widgets/custom_text_field.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>(); // Ключ для формы
  final _emailController = TextEditingController(); // Контроллер для email
  final _passwordController = TextEditingController(); // Контроллер для пароля
  bool _isLoading = false; // Флаг для отображения загрузки

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) { // Проверка валидации
      setState(() {
        _isLoading = true; // Показываем индикатор загрузки
      });

      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      // Имитация аутентификации
      final isAuthenticated = await AuthService.login(email, password);

      setState(() {
        _isLoading = false; // Скрываем индикатор загрузки
      });

      if (isAuthenticated) {
        // Переход на домашний экран
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        // Показ сообщения об ошибке
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Неверный email или пароль')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Вход'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Поле для email
              CustomTextField(
                controller: _emailController,
                label: 'Email',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите email';
                  }
                  if (!value.contains('@')) {
                    return 'Пожалуйста, введите корректный email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              // Поле для пароля
              CustomTextField(
                controller: _passwordController,
                label: 'Пароль',
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите пароль';
                  }
                  if (value.length < 6) {
                    return 'Пароль должен быть не менее 6 символов';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              // Кнопка входа
              _isLoading
                  ? CircularProgressIndicator() // Индикатор загрузки
                  : ElevatedButton(
                      onPressed: _login,
                      child: Text('Войти'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}