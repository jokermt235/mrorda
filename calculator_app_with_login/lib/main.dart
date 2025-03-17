import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'calculator_page.dart'; // Import your CalculatorPage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);

  /// Function to handle user authentication (login)
  Future<String?> _authUser(LoginData data) async {
    final prefs = await SharedPreferences.getInstance();
    final storedPassword = prefs.getString(data.name);

    if (storedPassword == null) {
      return 'No account found for this email';
    } else if (storedPassword != data.password) {
      return 'Incorrect password';
    }

    return null; // Login successful
  }

  /// Function to handle user registration (sign-up)
  Future<String?>? _signUpUser(SignupData data) async {
    final prefs = await SharedPreferences.getInstance();

    if (data.name == null || data.password == null) {
      return 'Email and password cannot be empty';
    }

    if (prefs.containsKey(data.name!)) {
      return 'Email is already registered';
    }

    // Save user credentials
    await prefs.setString(data.name!, data.password!);

    return 'Account created successfully! Please log in.';
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Login',
      onLogin: (LoginData data) async {
        final loginMessage = await _authUser(data);
        if (loginMessage == null) {
          // If login is successful, navigate to the calculator page
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => CalculatorPage()),
          );
        } else {
          return loginMessage;
        }
        return null;
      },
      onSignup: _signUpUser,
      onRecoverPassword: (_) => null, // Implement if needed
      theme: LoginTheme(
        primaryColor: Colors.blue,
        accentColor: Colors.white,
      ),
    );
  }
}