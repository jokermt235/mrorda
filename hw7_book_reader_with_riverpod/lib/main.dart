import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hw7_book_reader_with_riverpod/screens/book_reader_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Reader',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BookReaderPage(),
    );
  }
}