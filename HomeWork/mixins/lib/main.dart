import 'package:flutter/material.dart';
import 'mixins.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dart + Flutter Mixins & Static Methods',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Person person = Person('Eldana');
    person.introduce();

    int difference = Calculator.subtract(10, 4);
    int quotient = Calculator.divide(10, 2);

    return Scaffold(
      appBar: AppBar(title: Text('Mixins and Static Methods Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Difference of 10 and 4: $difference'),
            Text('Quotient of 10 and 2: $quotient'),
          ],
        ),
      ),
    );
  }
}

class Calculator {
  static int subtract(int a, int b) {
    return a - b;
  }

  static int divide(int a, int b) {
    if (b == 0) {
      throw ArgumentError("Cannot divide by zero.");
    }
    return a ~/ b;
  }
}
