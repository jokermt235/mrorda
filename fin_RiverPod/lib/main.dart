import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/book_page_view.dart';

void main() {
  runApp(
    const ProviderScope(child: BookApp()),
  );
}

class BookApp extends StatelessWidget {
  const BookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Viewer',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const BookPageView(),
    );
  }
}
