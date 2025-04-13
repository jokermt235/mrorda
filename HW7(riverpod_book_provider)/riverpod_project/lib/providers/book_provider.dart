import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/models/book.dart';
import 'package:riverpod_project/services/book_service.dart';

final bookServiceProvider = Provider<BookService>((ref) {
  return BookService();
});

final bookFutureProvider = FutureProvider<Book>((ref) async {
  final service = ref.watch(bookServiceProvider);
  return service.getBookData();
});
