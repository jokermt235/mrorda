import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/book_provider.dart';

class BookPageView extends ConsumerWidget {
  const BookPageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final books = ref.watch(booksProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Book Viewer")),
      body: PageView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "${book.title}\nby ${book.author}",
                style: const TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ),
    );
  }
}
