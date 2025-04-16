import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'book_page_index.dart';

void main() {
  runApp(const ProviderScope(child: BookShelfApp()));
}

class BookShelfApp extends StatelessWidget {
  const BookShelfApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Shelf',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BookShelfPage(),
    );
  }
}

class BookShelfPage extends ConsumerWidget {
  const BookShelfPage({super.key});

  final List<String> books = const [
    '📖 Книга 1: Введение',
    '📖 Книга 2: Основы Flutter',
    '📖 Книга 3: Riverpod магия',
    '📖 Книга 4: Практика',
    '📖 Книга 5: Итоги',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(bookPageIndexProvider);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () =>
          ref.read(bookPageIndexProvider.notifier).next(books.length),
      child: Scaffold(
        body: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: Text(
              books[index],
              key: ValueKey<int>(index),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
