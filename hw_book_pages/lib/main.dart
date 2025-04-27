import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hw_book_pages/book_page.dart';
import 'package:hw_book_pages/book_provider.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book',
      home: const BookScreen(),
    );
  }
}

class BookScreen extends ConsumerWidget {
  const BookScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pages = ref.watch(bookPagesProvider);
    final currentPageIndex = ref.watch(currentPageProvider);

    BookPage currentPage = pages[currentPageIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Page ${currentPage.pageNumber}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          currentPage.content,
          style: const TextStyle(fontSize: 24),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: currentPageIndex > 0
                ? () => ref.read(currentPageProvider.notifier).state--
                : null,
            child: const Text('Previous'),
          ),
          TextButton(
            onPressed: currentPageIndex < pages.length - 1
                ? () => ref.read(currentPageProvider.notifier).state++
                : null,
            child: const Text('Next'),
          ),
        ],
      ),
    );
  }
}
