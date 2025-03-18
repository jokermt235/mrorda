import 'package:flutter/material.dart';
import 'calc.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final TextEditingController _controllerA = TextEditingController();
  final TextEditingController _controllerB = TextEditingController();
  String _operator = '+';
  String _result = '';

  @override
  void dispose() {
    _controllerA.dispose();
    _controllerB.dispose();
    super.dispose();
  }

  void _calculateResult() {
    double a = double.tryParse(_controllerA.text) ?? 0;
    double b = double.tryParse(_controllerB.text) ?? 0;
    try {
      double res = calculate(a, b, _operator);
      setState(() {
        _result = res.toString();
      });
    } catch (e) {
      setState(() {
        _result = 'Ошибка: $e';
      });
    }
  }

  Widget _buildOperatorButton(String op) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _operator = op;
        });
      },
style: ElevatedButton.styleFrom(
  backgroundColor: _operator == op ? Colors.blueAccent : Colors.blue,
),

      child: Text(op),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
  
            TextField(
              controller: _controllerA,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Operand A',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),

            TextField(
              controller: _controllerB,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Operand B',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 8,
              children: [
                _buildOperatorButton('+'),
                _buildOperatorButton('-'),
                _buildOperatorButton('*'),
                _buildOperatorButton('/'),
                _buildOperatorButton('%'),
                _buildOperatorButton('**'),
              ],
            ),
            const SizedBox(height: 20),
  
            ElevatedButton(
              onPressed: _calculateResult,
              child: const Text('='),
            ),
            const SizedBox(height: 20),
            Text(
              'Result: $_result',
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
