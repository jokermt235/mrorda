import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/book.dart';
import '../services/book_service.dart';

final bookProvider = FutureProvider<Book>((ref) {
  return BookService().fetchBook();
});

final pageIndexProvider = StateProvider<int>((ref) => 0);
