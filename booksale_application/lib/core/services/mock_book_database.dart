import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/models/book_model.dart';

class MockBookDatabase {
  static const _booksKey = 'mock_books';

  Future<void> initializeMockData() async {
    final prefs = await SharedPreferences.getInstance();
    final existingBooks = prefs.getString(_booksKey);

    if (existingBooks == null) {
      final mockBooks = _generateMockBooks();
      await prefs.setString(_booksKey, jsonEncode(mockBooks));
    }
  }

  Future<List<BookModel>> getMockBooks() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_booksKey) ?? '[]';

    final List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.map((json) => BookModel.fromJson(json)).toList();
  }

  List<Map<String, dynamic>> _generateMockBooks() {
    return [
      {
        'id': '1',
        'title': 'The Hitchhiker\'s Guide to the Galaxy',
        'author': 'Douglas Adams',
        'category': 'Fiction',
        'pageCount': 224,
        'price': 12.99,
        'coverUrl': 'https://covers.openlibrary.org/b/id/903121-M.jpg',
      },
      {
        'id': '2',
        'title': 'Dune',
        'author': 'Frank Herbert',
        'category': 'Science Fiction',
        'pageCount': 688,
        'price': 15.99,
        'coverUrl': 'https://covers.openlibrary.org/b/id/827977-M.jpg',
      },
      {
        'id': '3',
        'title': 'To Kill a Mockingbird',
        'author': 'Harper Lee',
        'category': 'Classic',
        'pageCount': 336,
        'price': 9.99,
        'coverUrl': 'https://covers.openlibrary.org/b/id/803023-M.jpg',
      },
      {
        'id': '4',
        'title': '1984',
        'author': 'George Orwell',
        'category': 'Dystopian',
        'pageCount': 328,
        'price': 10.99,
        'coverUrl': 'https://covers.openlibrary.org/b/id/7222246-M.jpg',
      },
    ];
  }
}