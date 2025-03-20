import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SumArrayScreen(),
    );
  }
}

class SumArrayScreen extends StatefulWidget {
  @override
  _SumArrayScreenState createState() => _SumArrayScreenState();
}

class _SumArrayScreenState extends State<SumArrayScreen> {
  final TextEditingController _controller = TextEditingController();
  int _sum = 0;

  void _calculateSum() {
    List<int> numbers =
        _controller.text
            .split(' ')
            .map((e) => int.tryParse(e.trim()) ?? 0)
            .toList();
    setState(() {
      _sum = numbers.reduce((a, b) => a + b);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Сумма массива"), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Введите числа через пробел',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateSum,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12),
              ),
              child: Text("Рассчитать сумму", style: TextStyle(fontSize: 18)),
            ),
            SizedBox(height: 20),
            Text(
              "Сумма: $_sum",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
