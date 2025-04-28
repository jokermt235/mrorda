import 'package:flutter/material.dart';
import '../models/book.dart';
import '../screens/book_view_page.dart';

class BookGrid extends StatelessWidget {
  final List<Book> books;

  const BookGrid({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.6,
      ),
      itemCount: books.length,
      itemBuilder: (context, index) {
        final book = books[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookViewPage(bookId: book.id),
              ),
            );
          },
          child: Card(
            child: Column(
              children: [
                Expanded(
                  child: Image.asset(book.coverUrl, fit: BoxFit.cover),
                ),
                const SizedBox(height: 8),
                Text(book.title, textAlign: TextAlign.center),
              ],
            ),
          ),
        );
      },
    );
  }
}