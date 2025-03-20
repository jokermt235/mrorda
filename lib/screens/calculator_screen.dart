import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _expression = '';
  String _result = '';

  void _onButtonPressed(String value) {
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

  String _calculate(String expr) {
    try {
      // Жөнөкөй эле солдон-оңко эсептөө
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
          if (currentOp == '+') result += number;
          if (currentOp == '-') result -= number;
          if (currentOp == '*') result *= number;
          if (currentOp == '/') result /= number;

          currentOp = ch;
          currentNumber = '';
        }
      }
      double number = double.tryParse(currentNumber) ?? 0;
      if (currentOp == '+') result += number;
      if (currentOp == '-') result -= number;
      if (currentOp == '*') result *= number;
      if (currentOp == '/') result /= number;

      return result.toString();
    } catch (e) {
      return 'Error';
    }
  }

  Widget _buildButton(String text) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => _onButtonPressed(text),
        child: Text(text, style: const TextStyle(fontSize: 24)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculator')),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(20),
            child: Text(_expression, style: const TextStyle(fontSize: 32)),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(20),
            child: Text(
              _result,
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
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
          ),
        ],
      ),
    );
  }
}
