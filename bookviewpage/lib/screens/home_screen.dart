import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/book.dart';
import 'book_view_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final books = context.watch<BookProvider>().books;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Books'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return ListTile(
            leading: Image.network(book.coverUrl, width: 50, height: 50),
            title: Text(book.title),
            subtitle: Text('Price: \$${book.price.toStringAsFixed(2)}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookViewScreen(bookId: book.id),
                ),
              );
            },
          );
        },
      ),
    );
  }
}