import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  final String color;
  const Page3({required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 3')),
      body: Center(child: Text('Color passed: $color')),
    );
  }
}
