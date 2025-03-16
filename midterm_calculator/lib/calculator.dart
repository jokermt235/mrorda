import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = "0";  
  String _currentInput = "";  
  double _num1 = 0;  
  double _num2 = 0; 
  String _operator = "";  

  
  void _onDigitPressed(String digit) {
    setState(() {
      if (_currentInput.length < 10) {
        _currentInput += digit;
        _output = _currentInput;
      }
    });
  }

 
  void _onOperatorPressed(String operator) {
    if (_currentInput.isEmpty) return;
    setState(() {
      _num1 = double.parse(_currentInput);
      _operator = operator;
      _currentInput = "";
    });
  }

  
  void _calculateResult() {
  if (_currentInput.isEmpty || _operator.isEmpty) return;

  setState(() {
    _num2 = double.parse(_currentInput);
    double result = 0;

    switch (_operator) {
      case "+":
        result = _num1 + _num2;
        break;
      case "-":
        result = _num1 - _num2;
        break;
      case "*":
        result = _num1 * _num2;
        break;
      case "/":
        result = _num2 != 0 ? _num1 / _num2 : double.infinity;  
        break;
    }

    
    if (result == result.toInt()) {
      _output = result.toInt().toString();  
    } else {
      _output = result.toStringAsFixed(2);  
    }

    _currentInput = "";
    _operator = "";
  });
}


  
  void _clear() {
    setState(() {
      _output = "0";
      _currentInput = "";
      _num1 = 0;
      _num2 = 0;
      _operator = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.black87],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Дисплей
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                _output,
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

            Divider(color: Colors.white),

            
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: GridView.count(
                  crossAxisCount: 4,
                  children: [
                    _buildButton("7"),
                    _buildButton("8"),
                    _buildButton("9"),
                    _buildButton("/", color: Colors.orange),
                    _buildButton("4"),
                    _buildButton("5"),
                    _buildButton("6"),
                    _buildButton("*", color: Colors.orange),
                    _buildButton("1"),
                    _buildButton("2"),
                    _buildButton("3"),
                    _buildButton("-", color: Colors.orange),
                    _buildButton("0"),
                    _buildButton(".", color: Colors.grey),
                    _buildButton("C", color: Colors.red, onTap: _clear),
                    _buildButton("+", color: Colors.orange),
                    _buildButton("=", color: Colors.green, onTap: _calculateResult),  
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  
  Widget _buildButton(String label, {Color color = Colors.white24, Function()? onTap}) {
    return GestureDetector(
      onTap: onTap ?? () => _onButtonPressed(label),
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              offset: Offset(3, 3),
              blurRadius: 5,
            ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  
  void _onButtonPressed(String label) {
    if (label == "C") {
      _clear();
    } else if (label == "=") {
      _calculateResult();
    } else if (label == "+" || label == "-" || label == "*" || label == "/") {
      _onOperatorPressed(label);
    } else {
      _onDigitPressed(label);
    }
  }
}
