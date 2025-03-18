import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = "0"; // Основной экран (результат после "=")
  String _currentExpression = ""; // Показывает вводимую операцию
  String _expressionHistory = ""; // Перемещается наверх после "="
  bool _isResultDisplayed = false; // Флаг для отображения результата

  void _onDigitPressed(String digit) {
    setState(() {
      if (_isResultDisplayed) {
        _currentExpression = "";
        _isResultDisplayed = false;
      }
      _currentExpression += digit;
      _output = _currentExpression;
    });
  }

  void _onOperatorPressed(String operator) {
    if (_currentExpression.isEmpty) return;
    if (_currentExpression.endsWith(" ") || _isResultDisplayed) return; 

    setState(() {
      _currentExpression += " $operator ";
      _output = _currentExpression;
      _isResultDisplayed = false;
    });
  }

  void _calculateResult() {
    if (_currentExpression.isEmpty || _currentExpression.endsWith(" ")) return;

    try {
      List<String> tokens = _currentExpression.split(" ");
      if (tokens.length < 3) return;

      double num1 = double.parse(tokens[0]);
      String operator = tokens[1];
      double num2 = double.parse(tokens[2]);
      double result = 0;

      switch (operator) {
        case "+":
          result = num1 + num2;
          break;
        case "-":
          result = num1 - num2;
          break;
        case "*":
          result = num1 * num2;
          break;
        case "/":
          result = num2 != 0 ? num1 / num2 : double.infinity;
          break;
      }

      setState(() {
        _expressionHistory = _currentExpression; // Перемещаем наверх
        _output = result == result.toInt() ? result.toInt().toString() : result.toStringAsFixed(2);
        _currentExpression = "";
        _isResultDisplayed = true;
      });
    } catch (e) {
      setState(() {
        _output = "Error";
      });
    }
  }

  void _clear() {
    setState(() {
      _output = "0";
      _currentExpression = "";
      _expressionHistory = "";
      _isResultDisplayed = false;
    });
  }

  void _logout() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.black87],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 40, left: 20),
                  child: IconButton(
                    onPressed: _logout,
                    icon: Icon(Icons.logout, color: Colors.white),
                    tooltip: "Logout",
                  ),
                ),
              ),

              // Верхняя строка (отображает предыдущую операцию)
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  _expressionHistory,
                  style: TextStyle(fontSize: 24, color: Colors.white70),
                ),
              ),

              // Основной экран (отображает текущий ввод)
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
        ],
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
