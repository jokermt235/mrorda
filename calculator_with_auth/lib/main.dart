import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth + Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => AuthScreen(),
        '/home': (context) => HomeScreen(),
        '/calculator': (context) => CalculatorScreen(),
      },
    );
  }
}

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  static final Map<String, String> _users = {};

  void _register() {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      _showError('fill all fields');
      return;
    }

    if (_users.containsKey(username)) {
      _showError('user is already exist');
      return;
    }

    _users[username] = password;
    _navigateToHome(username);
  }

  void _login() {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      _showError('fill all fields');
      return;
    }

    if (_users[username] == password) {
      _navigateToHome(username);
    } else {
      _showError('error:wrong data');
    }
  }

  void _navigateToHome(String username) {
    Navigator.pushReplacementNamed(context, '/home', arguments: username);
  }

  void _showError(String text) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(text), backgroundColor: Colors.red));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('authentication')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'username'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'password'),
            ),
            Spacer(),
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _login,
                    child: Text('log in'),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _register,
                    child: Text('registration'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final username = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('welcome, $username!'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/calculator'),
              child: Text('open calculator'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushReplacementNamed(context, '/'),
              child: Text('log out'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = '0';
  double _num1 = 0;
  double _num2 = 0;
  String _operation = '';
  bool _newNumber = true;

  void _buttonPressed(String buttonText) {
    if (buttonText == 'C') {
      _clear();
    } else if (buttonText == '⌫') {
      _backspace();
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == '×' ||
        buttonText == '÷') {
      _setOperation(buttonText);
    } else if (buttonText == '=') {
      _calculate();
    } else if (buttonText == '.') {
      _addDecimal();
    } else {
      _addNumber(buttonText);
    }
  }

  void _clear() {
    setState(() {
      _output = '0';
      _num1 = 0;
      _num2 = 0;
      _operation = '';
      _newNumber = true;
    });
  }

  void _backspace() {
    if (_output.length > 1) {
      setState(() {
        _output = _output.substring(0, _output.length - 1);
      });
    } else {
      _clear();
    }
  }

  void _setOperation(String operation) {
    if (_operation.isNotEmpty) return;

    setState(() {
      _num1 = double.parse(_output);
      _operation = operation;
      _newNumber = true;
    });
  }

  void _calculate() {
    if (_operation.isEmpty) return;

    _num2 = double.parse(_output);
    double result = 0;

    switch (_operation) {
      case '+':
        result = _num1 + _num2;
        break;
      case '-':
        result = _num1 - _num2;
        break;
      case '×':
        result = _num1 * _num2;
        break;
      case '÷':
        result = _num2 != 0 ? _num1 / _num2 : double.infinity;
        break;
    }

    setState(() {
      _output = result != double.infinity ? result.toString() : 'error';
      if (_output.endsWith('.0')) {
        _output = _output.substring(0, _output.length - 2);
      }
      _num1 = 0;
      _num2 = 0;
      _operation = '';
      _newNumber = true;
    });
  }

  void _addDecimal() {
    if (_newNumber) {
      _output = '0.';
      _newNumber = false;
    } else if (!_output.contains('.')) {
      _output += '.';
    }
    setState(() {});
  }

  void _addNumber(String number) {
    if (_newNumber) {
      _output = number;
      _newNumber = false;
    } else {
      _output += number;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('calculator'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            height: 80,
            alignment: Alignment.bottomRight,
            child: Text(
              _output,
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.all(8),
              crossAxisCount: 4,
              childAspectRatio: 1.1,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              children: [
                _calcButton('C', Colors.red),
                _calcButton('⌫', Colors.blue),
                _calcButton('÷', Colors.blue),
                _calcButton('×', Colors.blue),
                _calcButton('7', Colors.grey[850]!),
                _calcButton('8', Colors.grey[850]!),
                _calcButton('9', Colors.grey[850]!),
                _calcButton('-', Colors.blue),
                _calcButton('4', Colors.grey[850]!),
                _calcButton('5', Colors.grey[850]!),
                _calcButton('6', Colors.grey[850]!),
                _calcButton('+', Colors.blue),
                _calcButton('1', Colors.grey[850]!),
                _calcButton('2', Colors.grey[850]!),
                _calcButton('3', Colors.grey[850]!),
                _calcButton('=', Colors.blue, height: 2),
                _calcButton('0', Colors.grey[850]!, width: 2),
                _calcButton('.', Colors.grey[850]!),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _calcButton(
    String text,
    Color color, {
    int width = 1,
    int height = 1,
  }) {
    return Container(
      margin: EdgeInsets.all(2),
      child: ElevatedButton(
        onPressed: () => _buttonPressed(text),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: EdgeInsets.all(12),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
