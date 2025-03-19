import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/auth_service.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = "0";
  String _currentInput = "";
  double _num1 = 0;
  double _num2 = 0;
  String _operand = "";
  bool _operandClicked = false;

  void _buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _output = "0";
      _currentInput = "";
      _num1 = 0;
      _num2 = 0;
      _operand = "";
      _operandClicked = false;
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "×" ||
        buttonText == "÷") {
      _num1 = double.parse(_output);
      _operand = buttonText;
      _operandClicked = true;
    } else if (buttonText == "=") {
      _num2 = double.parse(_output);
      if (_operand == "+") {
        _output = (_num1 + _num2).toString();
      }
      if (_operand == "-") {
        _output = (_num1 - _num2).toString();
      }
      if (_operand == "×") {
        _output = (_num1 * _num2).toString();
      }
      if (_operand == "÷") {
        _output = (_num1 / _num2).toString();
      }
      _num1 = 0;
      _num2 = 0;
      _operand = "";
      _operandClicked = false;
    } else {
      if (_operandClicked) {
        _output = buttonText;
        _operandClicked = false;
      } else {
        if (_output == "0") {
          _output = buttonText;
        } else {
          _output = _output + buttonText;
        }
      }
    }

    setState(() {});
  }

  Widget _buildButton(
    String buttonText, {
    Color color = Colors.white,
    Color textColor = Colors.black,
  }) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: textColor,
            backgroundColor: color,
            padding: EdgeInsets.all(24),
          ),
          onPressed: () => _buttonPressed(buttonText),
          child: Text(buttonText, style: TextStyle(fontSize: 24)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await Provider.of<AuthService>(context, listen: false).signOut();
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 24),
            child: Text(
              _output,
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Divider()),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  _buildButton("7"),
                  _buildButton("8"),
                  _buildButton("9"),
                  _buildButton(
                    "÷",
                    color: Colors.orange,
                    textColor: Colors.white,
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("4"),
                  _buildButton("5"),
                  _buildButton("6"),
                  _buildButton(
                    "×",
                    color: Colors.orange,
                    textColor: Colors.white,
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("1"),
                  _buildButton("2"),
                  _buildButton("3"),
                  _buildButton(
                    "-",
                    color: Colors.orange,
                    textColor: Colors.white,
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton(
                    "C",
                    color: Colors.grey,
                    textColor: Colors.white,
                  ),
                  _buildButton("0"),
                  _buildButton(
                    "=",
                    color: Colors.orange,
                    textColor: Colors.white,
                  ),
                  _buildButton(
                    "+",
                    color: Colors.orange,
                    textColor: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
