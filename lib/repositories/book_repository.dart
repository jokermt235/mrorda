import '../models/book.dart';
import '../services/api_service.dart';

class BookRepository {
  final ApiService apiService;

  BookRepository({required this.apiService});

  Future<List<Book>> fetchBooks() async {
    return await apiService.fetchBooks();
  }
}