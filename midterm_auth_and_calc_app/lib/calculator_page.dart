import 'package:flutter/material.dart';
import 'login_page.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _displayText = '0';
  String _equation = '';
  bool _hasResult = false;

  void _onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _displayText = '0';
        _equation = '';
      } else if (buttonText == '⌫') {
        if (_displayText.length > 1) {
          _displayText = _displayText.substring(0, _displayText.length - 1);
        } else {
          _displayText = '0';
        }
      } else if (buttonText == '=') {
        try {
          _equation = _displayText;
          _equation = _equation.replaceAll('×', '*');
          _equation = _equation.replaceAll('÷', '/');

          final result = _calculate(_equation);

          if (result == result.toInt()) {
            _displayText = result.toInt().toString();
          } else {
            _displayText = result.toString();
          }
          _hasResult = true;
        } catch (e) {
          _displayText = 'Ошибка';
        }
      } else {
        if (_displayText == '0' || _hasResult) {
          _displayText = buttonText;
          _hasResult = false;
        } else {
          _displayText += buttonText;
        }
      }
    });
  }

  double _calculate(String expression) {
    List<String> tokens = [];
    String currentNumber = '';

    for (int i = 0; i < expression.length; i++) {
      String char = expression[i];
      if (char == '+' || char == '-' || char == '*' || char == '/') {
        if (currentNumber.isNotEmpty) {
          tokens.add(currentNumber);
          currentNumber = '';
        }
        tokens.add(char);
      } else {
        currentNumber += char;
      }
    }

    if (currentNumber.isNotEmpty) {
      tokens.add(currentNumber);
    }

    int i = 0;
    while (i < tokens.length) {
      if (tokens[i] == '*') {
        double a = double.parse(tokens[i - 1]);
        double b = double.parse(tokens[i + 1]);
        tokens[i - 1] = (a * b).toString();
        tokens.removeAt(i);
        tokens.removeAt(i);
      } else if (tokens[i] == '/') {
        double a = double.parse(tokens[i - 1]);
        double b = double.parse(tokens[i + 1]);
        tokens[i - 1] = (a / b).toString();
        tokens.removeAt(i);
        tokens.removeAt(i);
      } else {
        i++;
      }
    }

    double result = double.parse(tokens[0]);
    for (i = 1; i < tokens.length; i += 2) {
      if (tokens[i] == '+') {
        result += double.parse(tokens[i + 1]);
      } else if (tokens[i] == '-') {
        result -= double.parse(tokens[i + 1]);
      }
    }

    return result;
  }

  Widget _buildButton(String text, {Color? color, Color? textColor}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? Colors.white,
            foregroundColor: textColor ?? Colors.black,
            padding: const EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () => _onButtonPressed(text),
          child: Text(text, style: const TextStyle(fontSize: 24)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Калькулятор'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              alignment: Alignment.bottomRight,
              child: Text(
                _displayText,
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    _buildButton(
                      'C',
                      color: Colors.red[100],
                      textColor: Colors.red,
                    ),
                    _buildButton('⌫', color: Colors.blue[100]),
                    _buildButton('%', color: Colors.blue[100]),
                    _buildButton('÷', color: Colors.blue[100]),
                  ],
                ),
                Row(
                  children: [
                    _buildButton('7'),
                    _buildButton('8'),
                    _buildButton('9'),
                    _buildButton('×', color: Colors.blue[100]),
                  ],
                ),
                Row(
                  children: [
                    _buildButton('4'),
                    _buildButton('5'),
                    _buildButton('6'),
                    _buildButton('-', color: Colors.blue[100]),
                  ],
                ),
                Row(
                  children: [
                    _buildButton('1'),
                    _buildButton('2'),
                    _buildButton('3'),
                    _buildButton('+', color: Colors.blue[100]),
                  ],
                ),
                Row(
                  children: [
                    _buildButton('0', color: Colors.white),
                    _buildButton('.'),
                    _buildButton(
                      '=',
                      color: Colors.blue,
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
