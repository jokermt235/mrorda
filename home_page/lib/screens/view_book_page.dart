import 'package:flutter/material.dart';

class ViewBookPage extends StatelessWidget {
  final String? bookTitle;

  const ViewBookPage({super.key, this.bookTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(bookTitle ?? 'No Book Selected'),
      ),
      body: Center(
        child: Text('Details about ${bookTitle ?? 'Unknown Book'}'),
      ),
    );
  }
}