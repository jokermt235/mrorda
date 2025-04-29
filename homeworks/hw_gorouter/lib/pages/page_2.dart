import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  final int age;
  const Page2({required this.age});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page 2")),
      body: Center(child: Text('You are $age years old')),
    );
  }
}
