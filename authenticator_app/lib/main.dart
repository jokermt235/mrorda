import 'package:flutter/material.dart';
import 'authenticator.dart'; // Import the AuthService class

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Authentication',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthScreen(),
    );
  }
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final AuthService _authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _statusMessage = "";
  bool _isSignUp = false;  // Flag to toggle between Sign-Up and Sign-In

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Toggle between Sign-Up and Sign-In mode
  void _toggleAuthMode() {
    setState(() {
      _isSignUp = !_isSignUp;
    });
  }

  // Handle authentication (Sign-In or Sign-Up)
  void _authenticate() {
    final email = _emailController.text;
    final password = _passwordController.text;
    bool result;

    if (_isSignUp) {
      result = _authService.signUp(email, password);
      setState(() {
        _statusMessage = result ? "Sign-Up Successful!" : "Email already in use.";
      });
    } else {
      result = _authService.signIn(email, password);
      setState(() {
        _statusMessage = result ? "Login Successful!" : "Invalid email or password.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_isSignUp ? "Sign Up" : "Sign In")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true, // Hide password text
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _authenticate,
              child: Text(_isSignUp ? "Sign Up" : "Sign In"),
            ),
            SizedBox(height: 20),
            Text(_statusMessage, style: TextStyle(color: Colors.red)),
            TextButton(
              onPressed: _toggleAuthMode,
              child: Text(_isSignUp
                  ? "Already have an account? Sign In"
                  : "Don't have an account? Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}