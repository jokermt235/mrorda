import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  final int age;
  const Page2({required this.age, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 2')),
      body: Center(child: Text('Age passed: $age')),
    );
  }
}
