import 'package:flutter/material.dart';

class Page4 extends StatelessWidget {
  final String? extraMessage;
  const Page4({this.extraMessage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page 4")),
      body: Center(child: Text(extraMessage ?? 'No message')),
    );
  }
}
