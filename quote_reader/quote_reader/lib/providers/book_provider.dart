import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/book.dart';
import '../services/book_service.dart';

// Провайдер для BookService
final bookServiceProvider = Provider<BookService>((ref) {
  return BookService();
});

// Провайдер, который получает книгу с цитатами
final quoteBookProvider = FutureProvider<Book>((ref) async {
  final service = ref.watch(bookServiceProvider);
  return service.getQuoteBook();
});
