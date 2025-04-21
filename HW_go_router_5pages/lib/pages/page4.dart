import 'package:flutter/material.dart';

class Page4 extends StatelessWidget {
  final String message;
  const Page4({required this.message, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 4')),
      body: Center(child: Text('Message passed: $message')),
    );
  }
}
