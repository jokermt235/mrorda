import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/book.dart';

// Пример книжной полки
final bookShelfProvider = Provider<List<Book>>((ref) {
  return [
    Book(title: 'Book 1', pages: ['Page 1.1', 'Page 1.2', 'Page 1.3']),
    Book(title: 'Book 2', pages: ['Page 2.1', 'Page 2.2']),
  ];
});

// Текущая выбранная книга
final currentBookIndexProvider = StateProvider<int>((ref) => 0);

// Текущая страница в книге
final currentPageProvider = StateProvider<int>((ref) => 0);

// Получить текущую книгу
final currentBookProvider = Provider<Book>((ref) {
  final books = ref.watch(bookShelfProvider);
  final index = ref.watch(currentBookIndexProvider);
  return books[index];
});

// Получить текущий текст страницы
final currentPageTextProvider = Provider<String>((ref) {
  final book = ref.watch(currentBookProvider);
  final pageIndex = ref.watch(currentPageProvider);
  return book.pages[pageIndex];
});
