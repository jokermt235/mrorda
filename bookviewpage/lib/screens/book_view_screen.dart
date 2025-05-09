import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/book.dart';
import '../widgets/book_details_widget.dart';
import '../widgets/cart_counter_widget.dart';
import '../widgets/category_info_widget.dart';

class BookViewScreen extends StatelessWidget {
  final String bookId;

  const BookViewScreen({super.key, required this.bookId});

  @override
  Widget build(BuildContext context) {
    final book = context.read<BookProvider>().books.firstWhere((b) => b.id == bookId);

    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BookDetailsWidget(book: book),
            const SizedBox(height: 16),
            CartCounterWidget(bookId: book.id),
            const SizedBox(height: 16),
            CategoryInfoWidget(category: book.category),
          ],
        ),
      ),
    );
  }
}