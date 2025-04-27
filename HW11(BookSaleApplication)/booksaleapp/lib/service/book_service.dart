import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:booksaleapp/data/models/book.dart';
import 'package:booksaleapp/data/repository/book_repository.dart';

class BookService {
  final BookRepository _repo = BookRepository();

  Future<List<Book>> fetchAll() => _repo.fetchBooks();
  Future<Book> getById(String id) async {
    final all = await _repo.fetchBooks();
    return all.firstWhere((b) => b.id == id);
  }
  Future<List<Book>> search(String query) async {
    final all = await _repo.fetchBooks();
    return all
        .where((b) => b.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
  Future<List<Book>> byCategory(String category) async {
    final all = await _repo.fetchBooks();
    return all.where((b) => b.category == category).toList();
  }
}

final bookServiceProvider = Provider<BookService>((ref) => BookService());