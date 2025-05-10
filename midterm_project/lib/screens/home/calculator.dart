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
        Color? backgroundColor,
        Color textColor = Colors.black,
        bool isOperator = false,
        bool isEquals = false,
        bool isClear = false,
      }) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(16),
          color: backgroundColor ??
              (isOperator ? Colors.blue.shade800 :
              isEquals ? Colors.blue.shade600 :
              isClear ? Colors.redAccent : Colors.white),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () => _buttonPressed(buttonText),
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Text(
                  buttonText,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: isOperator || isEquals || isClear ? Colors.white : textColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade800,
              Colors.blue.shade500,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              // App Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Калькулятор',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.logout, color: Colors.white),
                      onPressed: () async {
                        await Provider.of<AuthService>(context, listen: false).signOut();
                      },
                    ),
                  ],
                ),
              ),

              // Output Display
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                alignment: Alignment.centerRight,
                child: Text(
                  _output,
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade900,
                  ),
                ),
              ),

              // Buttons Area
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              _buildButton("7"),
                              _buildButton("8"),
                              _buildButton("9"),
                              _buildButton("÷", isOperator: true),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              _buildButton("4"),
                              _buildButton("5"),
                              _buildButton("6"),
                              _buildButton("×", isOperator: true),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              _buildButton("1"),
                              _buildButton("2"),
                              _buildButton("3"),
                              _buildButton("-", isOperator: true),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              _buildButton("C", isClear: true),
                              _buildButton("0"),
                              _buildButton("=", isEquals: true),
                              _buildButton("+", isOperator: true),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}