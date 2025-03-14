import 'package:flutter/material.dart';
import 'auth_service.dart'; 
import 'calculator.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login & Calculator',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _message = '';

  void _login() async {
    String username = _usernameController.text;
    String password = _passwordController.text;

    AuthService authService = AuthService(username: username, password: password);
    bool isSuccess = await authService.authenticate();

    setState(() {
      _message = isSuccess ? 'Login Successful!' : 'Invalid Username or Password';
    });

    if (isSuccess) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => CalculatorPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Login Page', style: TextStyle(color: Colors.cyan)),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              style: TextStyle(color: Colors.cyan),
              decoration: InputDecoration(
                labelText: 'Username',
                labelStyle: TextStyle(color: Colors.cyan),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.cyan),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.cyan),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              style: TextStyle(color: Colors.cyan),
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.cyan),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.cyan),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.cyan),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink),
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login', style: TextStyle(fontSize: 18, color: Colors.black)),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                backgroundColor: Colors.cyan,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              _message,
              style: TextStyle(
                color: _message.contains('Invalid') ? Colors.pink : Colors.green,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}