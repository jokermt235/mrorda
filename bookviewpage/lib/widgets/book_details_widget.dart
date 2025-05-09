import 'package:flutter/material.dart';
import '../models/book.dart';

class BookDetailsWidget extends StatelessWidget {
  final Book book;

  const BookDetailsWidget({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(book.coverUrl, width: 150, height: 150),
        const SizedBox(height: 8),
        Text(book.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text('Author: ${book.author}'),
        const SizedBox(height: 4),
        Text('Price: \$${book.price.toStringAsFixed(2)}'),
        const SizedBox(height: 4),
        Text('Pages: ${book.pages}'),
      ],
    );
  }
}