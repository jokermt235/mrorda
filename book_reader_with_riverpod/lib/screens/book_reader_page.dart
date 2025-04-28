import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hw7_book_reader_with_riverpod/providers/book_provider.dart';

class BookReaderPage extends ConsumerWidget {
  const BookReaderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final book = ref.watch(bookProvider);
    final currentPage = book.pages[book.currentPageIndex];

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(book.title),
            Text(
              'by ${book.author}',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white70,
                  ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Text(
              currentPage,
              key: ValueKey(currentPage),
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 32), 
          FloatingActionButton(
            heroTag: 'prev', 
            onPressed: () => ref.read(bookProvider.notifier).previousPage(),
            child: const Icon(Icons.arrow_back),
          ),
          FloatingActionButton(
            heroTag: 'next',
            onPressed: () => ref.read(bookProvider.notifier).nextPage(),
            child: const Icon(Icons.arrow_forward),
          ),
          const SizedBox(width: 32), 
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
