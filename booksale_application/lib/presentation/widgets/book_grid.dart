import 'package:flutter/material.dart';
import '../../../data/models/book_model.dart';
import '../../../presentation/widgets/book_card.dart';

class BookGrid extends StatelessWidget {
  final List<BookModel> books;
  const BookGrid({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.6,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemCount: books.length,
        itemBuilder: (context, index) => BookCard(book: books[index]),
      ),
    );
  }
}