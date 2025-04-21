import 'package:flutter/material.dart';
import 'reader.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bookPages = ['page 1.', 'page 2.', 'page 3.', 'page 4.'];

    return MaterialApp(
      title: 'Book Reader',
      home: BookReader(pages: bookPages),
    );
  }
}
