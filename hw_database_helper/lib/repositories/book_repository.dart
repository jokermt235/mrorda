import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/book.dart';

class BookRepository {
  Future<Book> loadBook(String bookId) async {
    final bookContents = {
      '1': ["Page 1", "Page 2", "Page 3"],
      '2': ["Chapter 1", "Chapter 2"],
      '3': ["Start", "Middle", "End"],
    };

    return Book(
      id: bookId,
      title: 'Book $bookId',
      author: 'Author $bookId',
      currentPage: 0,
      pages: bookContents[bookId] ?? ["No content"],
    );
  }

  Future<Book> saveBook(Book book) async {
    return book;
  }
}

final bookRepositoryProvider = Provider((ref) => BookRepository());