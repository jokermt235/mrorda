import 'package:dio/dio.dart';
import '../models/book_model.dart';

abstract class BookRepository {
  Future<List<BookModel>> fetchBooks();
}

class BookRepositoryImpl implements BookRepository {
  final Dio dio;

  BookRepositoryImpl({required this.dio});

  @override
  Future<List<BookModel>> fetchBooks() async {
    try {
      final response = await dio.get('https://example.com/books.json');

      // Проверка на успешный статус ответа
      if (response.statusCode == 200) {
        final List data = response.data;
        return data.map((json) => BookModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load books');
      }
    } catch (e) {
      // Обработка ошибок
      print('Error fetching books: $e');
      throw Exception('Failed to load books');
    }
  }
}
