import 'package:flutter_application_2/core/models/book.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bookServiceProvider = Provider<BookService>((ref) => BookService());

class BookService {
  Future<List<Book>> fetchAllBooks() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return List.generate(5, (index) {
      final idx = index + 1;
      return Book(
        id: '$idx',
        title: 'Book $idx',
        author: 'Author $idx',
        image: 'assets/images/book$idx.png',
        price: 10 + idx * 5,
        totalPages: 50,
        category: 'Category ${idx % 3}',
        description: 'Description of Book $idx',
      );
    });
  }

  Future<List<Book>> searchBooks(String query) async {
    final allBooks = await fetchAllBooks();
    return allBooks
        .where((book) => book.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  Future<List<Book>> getBooksByCategory(String category) async {
    final allBooks = await fetchAllBooks();
    return allBooks.where((book) => book.category == category).toList();
  }
}
