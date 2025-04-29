import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  final String city;
  const Page3({required this.city});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page 3")),
      body: Center(child: Text('Welcome to $city')),
    );
  }
}
