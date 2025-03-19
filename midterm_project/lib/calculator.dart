import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'main.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});
  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String expression = '';
  String result = '';
  void evaluateExpression() {
    try {
      Parser parser = Parser();
      Expression exp = parser.parse(expression);
      ContextModel contextModel = ContextModel();
      double evaluationResult = exp.evaluate(EvaluationType.REAL, contextModel);
      setState(() {
        result = evaluationResult.toString();
      });
    } catch (e) {
      setState(() {
        result = 'Error';
      });
    }
  }

  void buttonClicked(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        expression = '';
        result = '';
      } else if (buttonText == 'CE') {
        if (expression.isNotEmpty) {
          expression = expression.substring(0, expression.length - 1);
        }
      } else if (buttonText == '=') {
        if (expression.isNotEmpty) {
          evaluateExpression();
        }
      } else {
        expression += buttonText;
      }
    });
  }

  void _logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        actions: [
          IconButton(icon: const Icon(Icons.exit_to_app), onPressed: _logout),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Text(expression, style: const TextStyle(fontSize: 32)),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                result,
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 20,
              itemBuilder: (context, index) {
                List<String> buttons = [
                  'C', 'CE', '(', ')',
                  '7', '8', '9', '+',
                  '4', '5', '6', '-',
                  '1', '2', '3', '*',
                  '0', '.', '=', '/'
                ];
                return ElevatedButton(
                  onPressed: () => buttonClicked(buttons[index]),
                  child: Text(
                    buttons[index],
                    style: const TextStyle(fontSize: 24),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
