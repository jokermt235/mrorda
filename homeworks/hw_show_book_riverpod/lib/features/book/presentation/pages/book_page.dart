import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/book_provider.dart';

class BookPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final books = ref.watch(bookListProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Books')),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (_, index) {
          final book = books[index];
          return ListTile(title: Text(book.title), subtitle: Text(book.author));
        },
      ),
    );
  }
}
