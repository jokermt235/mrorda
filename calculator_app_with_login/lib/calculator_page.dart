import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart'; // Import math_expressions package

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _display = '0';
  String _previousInput = '';
  String _currentInput = '';

  void _onButtonPressed(String text) {
    setState(() {
      if (text == 'C') {
        _display = '0';
        _previousInput = '';
        _currentInput = '';
      } else if (text == 'DEL') {
        if (_currentInput.isNotEmpty) {
          _currentInput = _currentInput.substring(0, _currentInput.length - 1);
        }
        if (_currentInput.isEmpty) {
          _display = '0';
        } else {
          _display = _currentInput;
        }
      } else if (text == '=') {
        try {
          _display = _calculateResult(_currentInput);
          _previousInput = _display; // Save the result for further use if needed
          _currentInput = ''; // Reset for next calculation
        } catch (e) {
          _display = 'Error';
        }
      } else {
        if (_currentInput == '0') {
          _currentInput = text; // Start fresh if current input is 0
        } else {
          _currentInput += text; // Concatenate new input
        }
        _display = _currentInput; // Display the current input
      }
    });
  }

  String _calculateResult(String expression) {
    try {
      GrammarParser p = GrammarParser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      double result = exp.evaluate(EvaluationType.REAL, cm);

      // If the result is an integer, return it as an integer string without the decimal point
      if (result == result.toInt()) {
        return result.toInt().toString();
      } else {
        return result.toString(); // Otherwise, return the float as a string
      }
    } catch (e) {
      return 'Error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculator')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              _display,
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: 17,  // Increased count to include 'DEL' button
            itemBuilder: (context, index) {
              String buttonText = '';
              if (index < 9) {
                buttonText = (index + 1).toString();
              } else if (index == 9) {
                buttonText = 'C';
              } else if (index == 10) {
                buttonText = '0';
              } else if (index == 11) {
                buttonText = '=';
              } else if (index == 12) {
                buttonText = '+';
              } else if (index == 13) {
                buttonText = '-';
              } else if (index == 14) {
                buttonText = '*';
              } else if (index == 15) {
                buttonText = '/';
              } else if (index == 16) {
                buttonText = 'DEL'; // Add the 'DEL' button
              }

              return ElevatedButton(
                onPressed: () => _onButtonPressed(buttonText),
                child: Text(buttonText, style: TextStyle(fontSize: 24)),
              );
            },
          ),
        ],
      ),
    );
  }
}