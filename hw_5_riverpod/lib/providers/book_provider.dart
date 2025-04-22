import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/book_service.dart';
import '../models/book.dart';

final bookServiceProvider = Provider<BookService>((ref) {
  return BookService();
});

final bookProvider = FutureProvider<Book>((ref) async {
  final service = ref.watch(bookServiceProvider);
  return service.getQuoteBook();
});