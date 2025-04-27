import 'package:flutter/material.dart';

class BookViewPage extends StatelessWidget {
  final Book book;

  BookViewPage({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(book.title)),
      body: Center(
        child: Column(
          children: [
            Image.network(book.coverUrl),
            Text('Author: ${book.author}'),
            Text('Price: \$${book.price}'),
            Text('Pages: ${book.pages}'),
          ],
        ),
      ),
    );
  }
}

class Book {
  final String id;
  final String title;
  final String author;
  final String coverUrl;
  final int pages;
  final double price;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.coverUrl,
    required this.pages,
    required this.price,
  });
}
