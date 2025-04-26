import 'package:flutter/material.dart';

void main() {
  runApp(const BookApp());
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

class BookPageView extends StatelessWidget {
  const BookPageView({super.key});

  final List<String> pages = const [
    "📘 Page 1: Once upon a time...",
    "📗 Page 2: A hero began their journey...",
    "📙 Page 3: They faced great challenges...",
    "📕 Page 4: And found their happy ending.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Book Viewer")),
      body: PageView.builder(
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                pages[index],
                style: const TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ),
    );
  }
}
