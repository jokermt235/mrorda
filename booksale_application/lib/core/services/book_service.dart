import '../services/dio_client.dart';

class BookService {
  final DioClient _dioClient;

  BookService(this._dioClient);

  Future<List<dynamic>> fetchAllBooks() async {
    final response = await _dioClient.get('/books');
    return response.data;
  }

  Future<List<dynamic>> searchBooks(String query) async {
    final response = await _dioClient.get('/books/search', queryParams: {'q': query});
    return response.data;
  }

  Future<Map<String, dynamic>> fetchBookById(String id) async {
    final response = await _dioClient.get('/books/$id');
    return response.data;
  }

  Future<List<dynamic>> fetchBooksByCategory(String category) async {
    final response = await _dioClient.get('/books/category/$category');
    return response.data;
  }
}