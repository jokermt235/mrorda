import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Сумма полей',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const MyHomePage(title: 'Сумма двух чисел'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController field1 = TextEditingController();
  final TextEditingController field2 = TextEditingController();
  double sum = 0;

  void calculateSum() {
    setState(() {
      double number1 = double.tryParse(field1.text) ?? 0;
      double number2 = double.tryParse(field2.text) ?? 0;
      sum = number1 + number2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: field1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Введите первое число',
                border: OutlineInputBorder(),
              ),
              onChanged: (text) => calculateSum(),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: field2,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Введите второе число',
                border: OutlineInputBorder(),
              ),
              onChanged: (text) => calculateSum(),
            ),
            const SizedBox(height: 30),
            Text(
              'Сумма: $sum',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
