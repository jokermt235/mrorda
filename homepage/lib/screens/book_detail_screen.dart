import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/book.dart';

class BookDetailScreen extends StatelessWidget {
  final String bookId;

  const BookDetailScreen({super.key, required this.bookId});

  @override
  Widget build(BuildContext context) {
    final book = context.read<BookProvider>().books.firstWhere((book) => book.id == bookId);

    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(book.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text('Author: ${book.author}'),
            const SizedBox(height: 10),
            Text('Price: \$${book.price.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}