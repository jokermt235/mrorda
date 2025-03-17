import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Auth()),
        ChangeNotifierProvider(create: (context) => Calculator()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginScreen(),
    );
  }
}

class Auth with ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  void login(String username, String password) {
    if (username == 'Zhazgul' && password == 'password1') {
      _isLoggedIn = true;
      notifyListeners();
    } else {
      throw Exception('Invalid credentials');
    }
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }
}

// Класс для управления калькулятором
class Calculator with ChangeNotifier {
  double _result = 0;
  String _currentInput = '';
  String _operation = '';

  double get result => _result;
  String get currentInput => _currentInput;
  String get operation => _operation;

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

// Экран входа
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                try {
                  auth.login(usernameController.text, passwordController.text);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CalculatorScreen(),
                    ),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Invalid username or password'),
                    ),
                  );
                }
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

// Экран калькулятора
class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final calculator = Provider.of<Calculator>(context);
    final auth = Provider.of<Auth>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Calculator'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              auth.logout();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
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
                calculator.currentInput.isNotEmpty
                    ? calculator.currentInput
                    : calculator.result.toString(),
                style: const TextStyle(fontSize: 48),
              ),
            ),
          ),
          Row(
            children: [
              _buildButton('7', context),
              _buildButton('8', context),
              _buildButton('9', context),
              _buildButton('/', context),
            ],
          ),
          Row(
            children: [
              _buildButton('4', context),
              _buildButton('5', context),
              _buildButton('6', context),
              _buildButton('*', context),
            ],
          ),
          Row(
            children: [
              _buildButton('1', context),
              _buildButton('2', context),
              _buildButton('3', context),
              _buildButton('-', context),
            ],
          ),
          Row(
            children: [
              _buildButton('0', context),
              _buildButton('C', context),
              _buildButton('=', context),
              _buildButton('+', context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text, BuildContext context) {
    final calculator = Provider.of<Calculator>(context, listen: false);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ElevatedButton(
          onPressed: () {
            if (text == 'C') {
              calculator.clear();
            } else if (text == '=') {
              calculator.calculate();
            } else if (['+', '-', '*', '/'].contains(text)) {
              calculator.setOperation(text);
            } else {
              calculator.setInput(text);
            }
          },
          child: Text(text, style: const TextStyle(fontSize: 24)),
        ),
      ),
    );
  }
}
