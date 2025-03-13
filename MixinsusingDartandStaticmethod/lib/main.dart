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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Using the Mixin
    MyClass myClass = MyClass('Saikal');
    myClass.greet();

    // Using Static Methods
    int sum = MathUtils.add(5, 3);
    int product = MathUtils.multiply(5, 3);

    return Scaffold(
      appBar: AppBar(
        title: Text('Mixins and Static Methods Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Sum of 5 and 3: $sum'),
            Text('Product of 5 and 3: $product'),
          ],
        ),
      ),
    );
  }
}
