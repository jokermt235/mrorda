import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  final String name;
  const Page1({required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 1')),
      body: Center(child: Text('Name passed: $name')),
    );
  }
}
