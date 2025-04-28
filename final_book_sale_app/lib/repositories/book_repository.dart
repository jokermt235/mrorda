import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/book.dart';

class BookRepository {
  Future<List<Book>> fetchBooks() async {
    final response = await rootBundle.loadString('assets/books.json');
    final List data = json.decode(response);
    return data.map((e) => Book.fromJson(e)).toList();
  }
}
