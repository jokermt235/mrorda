import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  final String name;
  const Page1({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page 1")),
      body: Center(child: Text('Hello, $name!')),
    );
  }
}
