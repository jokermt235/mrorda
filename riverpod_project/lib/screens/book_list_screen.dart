import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/providers/book_provider.dart';

class BookListScreen extends ConsumerWidget {
  const BookListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookAsyncValue = ref.watch(bookFutureProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Моя книга"),
      ),
      body: bookAsyncValue.when(
        data: (book) {
          return ListView.builder(
            itemCount: book.pages.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("Страница ${index + 1}"),
                subtitle: Text(book.pages[index]),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) =>
            Center(child: Text("Ошибка: $error")),
      ),
    );
  }
}
