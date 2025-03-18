import 'package:flutter/material.dart';
import 'package:expressions/expressions.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _output = "0";
  String _input = "";

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "=") {
        try {
          _output = _calculate(_input).toString();
        } catch (e) {
          _output = "Invalid";
        }
      } else if (buttonText == "C") {
        _input = "";
        _output = "0";
      } else {
        _input += buttonText;
        _output = _input;
      }
    });
  }

  String _calculate(String expression) {
    try {
      final exp = Expression.parse(expression);
      final evaluator = ExpressionEvaluator();
      final result = evaluator.eval(exp, {});
      if (result is double) {
        return result.toString();
      } else if (result is int) {
        return result.toString();
      } else {
        return "Invalid";
      }
    } catch (e) {
      return "Invalid";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        leading: IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.bottomRight,
              child: Text(
                _output,
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Column(
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
        ],
      ),
    );
  }

  Widget _buildButton(String buttonText) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => _buttonPressed(buttonText),
        child: Text(buttonText, style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
