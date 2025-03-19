import 'package:flutter/material.dart';

void main() => runApp(SumCalculatorApp());

class SumCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Калькулятор суммы',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SumScreen(),
    );
  }
}

class SumScreen extends StatefulWidget {
  @override
  _SumScreenState createState() => _SumScreenState();
}

class _SumScreenState extends State<SumScreen> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  String _result = '0';

  void _updateSum() {
    double num1 = double.tryParse(_num1Controller.text) ?? 0;
    double num2 = double.tryParse(_num2Controller.text) ?? 0;
    setState(() {
      _result = (num1 + num2).toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Сложение чисел')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildNumberField(_num1Controller, 'Первое число'),
            SizedBox(height: 12),
            _buildNumberField(_num2Controller, 'Второе число'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateSum,
              child: Text('Вычислить сумму'),
            ),
            SizedBox(height: 20),
            Text(
              'Результат: $_result',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNumberField(TextEditingController controller, String label) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }
}
