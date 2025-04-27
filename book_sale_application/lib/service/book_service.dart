import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/models/book.dart';
import '../data/repository/book_repository.dart';

class BookService {
  final BookRepository _repository = BookRepository();

  Future<List<Book>> fetchAllBooks() => _repository.fetchBooks();

  Future<Book> getBookById(String id) async {
    final books = await _repository.fetchBooks();
    return books.firstWhere((book) => book.id == id);
  }

  Future<List<Book>> searchBooks(String query) async {
    final books = await _repository.fetchBooks();
    return books
        .where((book) => book.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  Future<List<Book>> filterByCategory(String category) async {
    final books = await _repository.fetchBooks();
    return books.where((book) => book.category == category).toList();
  }
}

// Service locator using Riverpod
final bookServiceProvider = Provider<BookService>((ref) => BookService());