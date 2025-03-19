import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppState(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Auth + Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const AuthScreen(),
    );
  }
}

// ---------- STATE ----------
class AppState with ChangeNotifier {
  final Map<String, String> _users = {}; // username: password
  String? _currentUser;
  double _result = 0;
  String _currentInput = '';
  String _operation = '';

  bool get isLoggedIn => _currentUser != null;
  String get currentUser => _currentUser ?? '';
  double get result => _result;
  String get currentInput => _currentInput;

  // REGISTRATION
  bool register(String username, String password) {
    if (_users.containsKey(username)) return false;
    _users[username] = password;
    notifyListeners();
    return true;
  }

  // LOGIN
  bool login(String username, String password) {
    if (_users[username] == password) {
      _currentUser = username;
      notifyListeners();
      return true;
    }
    return false;
  }

  void logout() {
    _currentUser = null;
    clear();
    notifyListeners();
  }

  // CALCULATOR
  void setInput(String value) {
    _currentInput += value;
    notifyListeners();
  }

  void setOperation(String op) {
    if (_currentInput.isNotEmpty) {
      _operation = op;
      _result = double.parse(_currentInput);
      _currentInput = '';
      notifyListeners();
    }
  }

  void calculate() {
    if (_currentInput.isNotEmpty && _operation.isNotEmpty) {
      double secondNumber = double.parse(_currentInput);
      switch (_operation) {
        case '+':
          _result += secondNumber;
          break;
        case '-':
          _result -= secondNumber;
          break;
        case '*':
          _result *= secondNumber;
          break;
        case '/':
          _result /= secondNumber;
          break;
      }
      _currentInput = '';
      _operation = '';
      notifyListeners();
    }
  }

  void clear() {
    _result = 0;
    _currentInput = '';
    _operation = '';
    notifyListeners();
  }
}

// ---------- AUTH SCREEN ----------
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool showRegister = false;

  @override
  Widget build(BuildContext context) {
    return showRegister ? RegistrationScreen(onSwitch: _switch) : LoginScreen(onSwitch: _switch);
  }

  void _switch() {
    setState(() {
      showRegister = !showRegister;
    });
  }
}

// ---------- LOGIN ----------
class LoginScreen extends StatelessWidget {
  final VoidCallback onSwitch;
  const LoginScreen({super.key, required this.onSwitch});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                bool success = appState.login(usernameController.text, passwordController.text);
                if (success) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const CalculatorScreen()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Invalid credentials')),
                  );
                }
              },
              child: const Text('Login'),
            ),
            TextButton(
              onPressed: onSwitch,
              child: const Text('No account? Register here'),
            )
          ],
        ),
      ),
    );
  }
}

// ---------- REGISTRATION ----------
class RegistrationScreen extends StatelessWidget {
  final VoidCallback onSwitch;
  const RegistrationScreen({super.key, required this.onSwitch});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                bool success = appState.register(usernameController.text, passwordController.text);
                if (success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Registration successful!')),
                  );
                  onSwitch();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Username already exists')),
                  );
                }
              },
              child: const Text('Register'),
            ),
            TextButton(
              onPressed: onSwitch,
              child: const Text('Already have an account? Login'),
            )
          ],
        ),
      ),
    );
  }
}

// ---------- CALCULATOR SCREEN ----------
class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, ${appState.currentUser}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              appState.logout();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const AuthScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.bottomRight,
              child: Text(
                appState.currentInput.isNotEmpty
                    ? appState.currentInput
                    : appState.result.toString(),
                style: const TextStyle(fontSize: 48),
              ),
            ),
          ),
          Row(
            children: ['7', '8', '9', '/'].map((e) => _btn(context, e)).toList(),
          ),
          Row(
            children: ['4', '5', '6', '*'].map((e) => _btn(context, e)).toList(),
          ),
          Row(
            children: ['1', '2', '3', '-'].map((e) => _btn(context, e)).toList(),
          ),
          Row(
            children: ['0', 'C', '=', '+'].map((e) => _btn(context, e)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _btn(BuildContext context, String text) {
    final appState = Provider.of<AppState>(context, listen: false);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: ElevatedButton(
          onPressed: () {
            if (text == 'C') {
              appState.clear();
            } else if (text == '=') {
              appState.calculate();
            } else if (['+', '-', '*', '/'].contains(text)) {
              appState.setOperation(text);
            } else {
              appState.setInput(text);
            }
          },
          child: Text(text, style: const TextStyle(fontSize: 24)),
        ),
      ),
    );
  }
}
