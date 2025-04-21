import 'package:flutter/material.dart';

class BookReader extends StatelessWidget {
  final List<String> pages;

  const BookReader({Key? key, required this.pages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: pages.length,
      itemBuilder: (context, index) {
        return Scaffold(
          appBar: AppBar(title: Text('Page ${index + 1}')),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(pages[index], style: const TextStyle(fontSize: 18)),
          ),
        );
      },
    );
  }
}
