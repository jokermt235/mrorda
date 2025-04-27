import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/book_provider.dart';

void main() {
  runApp(const ProviderScope(child: BookReaderApp()));
}

class BookReaderApp extends StatelessWidget {
  const BookReaderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Book Reader', home: const BookReaderPage());
  }
}

class BookReaderPage extends ConsumerWidget {
  const BookReaderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final book = ref.watch(bookProvider);
    final currentPage = ref.watch(currentPageProvider);

    return Scaffold(
      appBar: AppBar(title: Text(book.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            book.pages[currentPage],
            style: const TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (currentPage > 0)
            FloatingActionButton(
              heroTag: "prevPage",
              onPressed: () {
                final previousPage = currentPage - 1;
                ref.read(currentPageProvider.notifier).state = previousPage;
              },
              child: const Icon(Icons.navigate_before),
            ),
          if (currentPage > 0 && currentPage < book.pages.length - 1)
            const SizedBox(width: 16),
          if (currentPage < book.pages.length - 1)
            FloatingActionButton(
              heroTag: "nextPage",
              onPressed: () {
                final nextPage = currentPage + 1;
                ref.read(currentPageProvider.notifier).state = nextPage;
              },
              child: const Icon(Icons.navigate_next),
            ),
        ],
      ),
    );
  }
}
