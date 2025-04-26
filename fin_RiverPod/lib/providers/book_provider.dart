import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/book_model.dart';

final booksProvider = Provider<List<Book>>((ref) {
  return [
    Book(title: 'Page 1', author: 'Author A', pageCount: 1),
    Book(title: 'Page 2', author: 'Author B', pageCount: 2),
    Book(title: 'Page 3', author: 'Author C', pageCount: 3),
  ];
});
