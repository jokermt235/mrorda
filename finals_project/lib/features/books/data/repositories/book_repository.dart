import 'package:finals_project/features/books/data/datasources/book_api_service.dart';
import 'package:finals_project/features/books/domain/models/book.dart';

class BookRepository {
  final BookApiService _apiService;

  BookRepository(this._apiService);

  Future<List<Book>> getBooks() async {
    return await _apiService.getBooks();
  }

  List<String> getAllCategories(List<Book> books) {
    final categories = books.map((book) => book.category).toSet().toList();
    categories.sort();
    return categories;
  }

  List<Book> filterBooksByCategory(List<Book> books, String category) {
    if (category.isEmpty || category == 'All') return books;
    return books.where((book) => book.category == category).toList();
  }

  List<Book> searchBooks(List<Book> books, String query) {
    if (query.isEmpty) return books;
    final lowercaseQuery = query.toLowerCase();
    return books.where((book) {
      return book.title.toLowerCase().contains(lowercaseQuery) ||
          book.author.toLowerCase().contains(lowercaseQuery) ||
          book.category.toLowerCase().contains(lowercaseQuery);
    }).toList();
  }
}
