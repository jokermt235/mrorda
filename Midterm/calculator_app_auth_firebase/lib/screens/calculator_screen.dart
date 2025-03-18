import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _expression = "";
  String _result = "";

  void _onPressed(String value) {
    setState(() {
      if (value == "C") {
        _expression = "";
        _result = "";
      } else if (value == "=") {
        try {
          // ignore: deprecated_member_use
          Parser p = Parser();
          Expression exp = p.parse(_expression);
          ContextModel cm = ContextModel();
          double eval = exp.evaluate(EvaluationType.REAL, cm);
          _result = eval.toString();
        } catch (e) {
          _result = "Error";
        }
      } else {
        _expression += value;
      }
    });
  }

  Widget _buildButton(String value, Color color, double fontSize) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => _onPressed(value),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: color,
          padding: EdgeInsets.symmetric(vertical: 20),
          elevation: 4,
          shadowColor: Colors.black.withOpacity(0.2),
        ),
        child: Text(
          value,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 450), 
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            color: Color(0xFFF9F9F9),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    alignment: Alignment.bottomRight,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      _expression,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(
                      _result,
                      style: TextStyle(
                        fontSize: 36,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Divider(),
                  Column(
                    children: [
                      Row(
                        children: [
                          _buildButton("7", Colors.blueGrey[200]!, 24),
                          _buildButton("8", Colors.blueGrey[200]!, 24),
                          _buildButton("9", Colors.blueGrey[200]!, 24),
                          _buildButton("/", Colors.orangeAccent, 26),
                        ],
                      ),
                      Row(
                        children: [
                          _buildButton("4", Colors.blueGrey[200]!, 24),
                          _buildButton("5", Colors.blueGrey[200]!, 24),
                          _buildButton("6", Colors.blueGrey[200]!, 24),
                          _buildButton("*", Colors.orangeAccent, 26),
                        ],
                      ),
                      Row(
                        children: [
                          _buildButton("1", Colors.blueGrey[200]!, 24),
                          _buildButton("2", Colors.blueGrey[200]!, 24),
                          _buildButton("3", Colors.blueGrey[200]!, 24),
                          _buildButton("-", Colors.orangeAccent, 26),
                        ],
                      ),
                      Row(
                        children: [
                          _buildButton("0", Colors.blueGrey[200]!, 24),
                          _buildButton(".", Colors.blueGrey[200]!, 24),
                          _buildButton("=", Colors.greenAccent, 26),
                          _buildButton("+", Colors.orangeAccent, 26),
                        ],
                      ),
                      Row(
                        children: [_buildButton("C", Colors.yellowAccent, 24)],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
