import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/book_provider.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Reader',
      home: BookScreen(),
    );
  }
}

class BookScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final book = ref.watch(bookProvider);
    final currentPage = ref.watch(currentPageProvider);

    return Scaffold(
      appBar: AppBar(title: Text(book.title)),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Text(
            book.pages[currentPage],
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: currentPage > 0
                  ? () => ref.read(currentPageProvider.notifier).state--
                  : null,
            ),
            Text('Page ${currentPage + 1}/${book.pages.length}'),
            IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: currentPage < book.pages.length - 1
                  ? () => ref.read(currentPageProvider.notifier).state++
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
