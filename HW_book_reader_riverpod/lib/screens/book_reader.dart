import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/book_provider.dart';

class BookReader extends ConsumerWidget {
  const BookReader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final book = ref.watch(bookProvider);
    final currentPage = ref.watch(currentPageIndexProvider);

    return Scaffold(
      appBar: AppBar(title: Text(book.title)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            book.pages[currentPage],
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: currentPage > 0
                  ? () => ref
                      .read(currentPageIndexProvider.notifier)
                      .state--
                  : null,
              child: const Text('Previous'),
            ),
            ElevatedButton(
              onPressed: currentPage < book.pages.length - 1
                  ? () => ref
                      .read(currentPageIndexProvider.notifier)
                      .state++
                  : null,
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
