import '../../core/services/dio_client.dart';
import '../../core/services/local_storage_service.dart';
import '../../core/services/mock_book_database.dart';
import '../models/book_model.dart';

class BookRepository {
  final DioClient _dio;
  final LocalStorageService _localStorage;
  final MockBookDatabase _mockDatabase;

  BookRepository({
    required DioClient dio,
    required LocalStorageService localStorage,
    required MockBookDatabase mockDatabase, // Add this
  })  : _dio = dio,
        _localStorage = localStorage,
        _mockDatabase = mockDatabase;

  Future<List<BookModel>> getBooks() async {
    try {
      final response = await _dio.get('/books');
      final books = (response.data as List)
          .map((json) => BookModel.fromJson(json))
          .toList();

      await _localStorage.cacheBooks(books);
      return books;
    } catch (e) {
      final cachedBooks = await _localStorage.getCachedBooks();
      if (cachedBooks.isNotEmpty) return cachedBooks;

      return await _mockDatabase.getMockBooks();
    }
  }

  Future<List<BookModel>> searchBooks(String query) async {
    try {
      final response = await _dio.get('/books/search', queryParams: {'q': query});
      return (response.data as List).map((json) => BookModel.fromJson(json)).toList();
    } catch (e) {
      final mockBooks = await _mockDatabase.getMockBooks();
      return mockBooks.where((book) =>
      book.title.toLowerCase().contains(query.toLowerCase()) ||
          book.author.toLowerCase().contains(query.toLowerCase())
      ).toList();
    }
  }

  Future<BookModel> getBookById(String id) async {
    try {
      final response = await _dio.get('/books/$id');
      return BookModel.fromJson(response.data);
    } catch (e) {
      final mockBooks = await _mockDatabase.getMockBooks();
      return mockBooks.firstWhere((book) => book.id == id);
    }
  }

  Future<List<BookModel>> fetchBooksByCategory(String category) async {
    try {
      final response = await _dio.get('/books/category/$category');
      return (response.data as List).map((json) => BookModel.fromJson(json)).toList();
    } catch (e) {
      final mockBooks = await _mockDatabase.getMockBooks();
      return mockBooks.where((book) => book.category == category).toList();
    }
  }
}