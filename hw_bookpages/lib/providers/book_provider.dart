import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hw_bookpages/models/book_page.dart';


// Пример: 3 страницы книги
final bookPagesProvider = Provider<List<BookPage>>((ref) => [
  BookPage(pageNumber: 1, content: "Первая страница книги."),
  BookPage(pageNumber: 2, content: "Вторая страница книги."),
  BookPage(pageNumber: 3, content: "Третья страница книги."),
]);

// Текущая страница
final currentPageProvider = StateProvider<int>((ref) => 0);
