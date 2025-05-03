import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/book_list_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Catalog',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BookListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}