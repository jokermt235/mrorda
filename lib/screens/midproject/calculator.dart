import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/calculator': (context) => CalculatorScreen(),
      },
    );
  }
}

/// LoginScreen – жөнөкөй форма. Бул жерде электрондук почта жана сырсөз киргизилип,
/// эгер колдонуучунун маалыматтары туура болсо, калькулятор экранына өтүлөт.
/// Бул мисалда электрондук почта: user@test.com, сырсөз: password.
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String _error = '';

  void _login() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      // Тесттик авторизация: туура маалымат болсо, калькуляторго өтүү
      if (_email == 'user@test.com' && _password == 'password') {
        Navigator.pushReplacementNamed(context, '/calculator');
      } else {
        setState(() {
          _error = 'Login failed: incorrect data';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                onSaved: (value) => _email = value!.trim(),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                onSaved: (value) => _password = value!.trim(),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                child: const Text('Login'),
              ),
              if (_error.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    _error,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// CalculatorScreen – жөнөкөй калькулятор. Колдонуучу баскан тамгаларды
/// _expression айнымалысына кошуп, "=" басылганда _calculate функциясы аркылуу эсептеп чыгат.
/// Эскерте кетсек: бул эсептөө функциясы операторлордун ордун так сактамайт жана солдон-оңко эсептейт.
class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _expression = '';
  String _result = '';

  void _onPressed(String value) {
    setState(() {
      if (value == 'C') {
        _expression = '';
        _result = '';
      } else if (value == '=') {
        _result = _calculate(_expression);
      } else {
        _expression += value;
      }
    });
  }

  // Өтө жөнөкөй эсептөө: ар бир операцияны солдон-оңко эсептейт.
  String _calculate(String expr) {
    try {
      expr = expr.replaceAll(' ', '');
      double result = 0;
      String currentNumber = '';
      String currentOp = '+';
      for (int i = 0; i < expr.length; i++) {
        String ch = expr[i];
        if ('0123456789.'.contains(ch)) {
          currentNumber += ch;
        } else {
          double number = double.tryParse(currentNumber) ?? 0;
          if (currentOp == '+') {
            result += number;
          } else if (currentOp == '-') {
            result -= number;
          } else if (currentOp == '*') {
            result *= number;
          } else if (currentOp == '/') {
            result /= number;
          }
          currentOp = ch;
          currentNumber = '';
        }
      }
      double number = double.tryParse(currentNumber) ?? 0;
      if (currentOp == '+') {
        result += number;
      } else if (currentOp == '-') {
        result -= number;
      } else if (currentOp == '*') {
        result *= number;
      } else if (currentOp == '/') {
        result /= number;
      }
      return result.toString();
    } catch (e) {
      return 'Error';
    }
  }

  /// Кнопканы түзүүчү функция
  Widget _buildButton(String text) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => _onPressed(text),
        child: Text(text, style: const TextStyle(fontSize: 24)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculator')),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerRight,
            child: Text(
              _expression,
              style: const TextStyle(fontSize: 32),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerRight,
            child: Text(
              _result,
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    _buildButton("7"),
                    _buildButton("8"),
                    _buildButton("9"),
                    _buildButton("/"),
                  ],
                ),
                Row(
                  children: [
                    _buildButton("4"),
                    _buildButton("5"),
                    _buildButton("6"),
                    _buildButton("*"),
                  ],
                ),
                Row(
                  children: [
                    _buildButton("1"),
                    _buildButton("2"),
                    _buildButton("3"),
                    _buildButton("-"),
                  ],
                ),
                Row(
                  children: [
                    _buildButton("C"),
                    _buildButton("0"),
                    _buildButton("="),
                    _buildButton("+"),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
