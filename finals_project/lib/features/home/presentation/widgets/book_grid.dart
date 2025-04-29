import 'package:finals_project/features/shared/data/models/book_model.dart';
import 'package:flutter/material.dart';

class BookGrid extends StatelessWidget {
  final List<BookModel> books;

  const BookGrid({Key? key, required this.books}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: books.length,
      itemBuilder: (context, index) {
        final book = books[index];
        return Card(
          child: Column(
            children: [
              Image.network(book.coverUrl),
              Text(book.title),
              Text('\$${book.price}'),
            ],
          ),
        );
      },
    );
  }
}
