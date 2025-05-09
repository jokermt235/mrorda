import 'package:flutter/material.dart';
import '../models/book_model.dart';

class BookGrid extends StatelessWidget {
  const BookGrid({super.key});

  @override
  Widget build(BuildContext context) {
    List<Book> books = [
      Book(title: 'Book 1', price: 15.99, pages: 200, category: 'Fiction'),
      Book(title: 'Book 2', price: 9.99, pages: 120, category: 'Science'),
      Book(title: 'Book 3', price: 22.50, pages: 300, category: 'Biography'),
    ];

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: books.length,
      itemBuilder: (context, index) {
        Book book = books[index];

        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              '/viewBook',
              arguments: book,
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.book, size: 48),
                const SizedBox(height: 8),
                Text(book.title),
                const SizedBox(height: 4),
                Text('\$${book.price.toStringAsFixed(2)}'),
              ],
            ),
          ),
        );
      },
    );
  }
}