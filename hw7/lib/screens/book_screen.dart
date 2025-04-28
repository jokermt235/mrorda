import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/book_provider.dart';

class BookScreen extends ConsumerWidget {
  const BookScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookAsync = ref.watch(bookProvider);
    final pageIndex = ref.watch(pageIndexProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Book Reader')),
      body: bookAsync.when(
        data: (book) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    book.pages[pageIndex],
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Ошибка: $e')),
      ),
      bottomNavigationBar: bookAsync.when(
        data: (book) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: pageIndex > 0
                    ? () => ref.read(pageIndexProvider.notifier).state--
                    : null,
                icon: const Icon(Icons.arrow_left),
              ),
              Text(
                '${pageIndex + 1} / ${book.pages.length}',
                style: const TextStyle(fontSize: 16),
              ),
              IconButton(
                onPressed: pageIndex < book.pages.length - 1
                    ? () => ref.read(pageIndexProvider.notifier).state++
                    : null,
                icon: const Icon(Icons.arrow_right),
              ),
            ],
          ),
        ),
        loading: () => const SizedBox.shrink(),
        error: (e, _) => const SizedBox.shrink(),
      ),
    );
  }
}
