import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/book_model.dart';
import '../providers/book_provider.dart';
import 'add_edit_book_screen.dart';

class BookListScreen extends ConsumerWidget {
  const BookListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final books = ref.watch(bookProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Catalog'),
      ),
      body: books.isEmpty
          ? const Center(
        child: Text('No books added yet.'),
      )
          : ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return ListTile(
            title: Text(book.title),
            subtitle: Text('${book.author} (${book.year})'),
            trailing: Checkbox(
              value: book.isRead,
              onChanged: (value) {
                ref.read(bookProvider.notifier).toggleReadStatus(book.id);
              },
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddEditBookScreen(book: book),
                ),
              );
            },
            onLongPress: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Delete Book'),
                    content: const Text('Are you sure you want to delete this book?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          ref.read(bookProvider.notifier).removeBook(book.id);
                          Navigator.pop(context);
                        },
                        child: const Text('Delete'),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddEditBookScreen(),
            ),
          );
        },
      ),
    );
  }
}