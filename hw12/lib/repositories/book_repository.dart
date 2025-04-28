import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/book.dart';

class BookRepository {
  Future<List<Book>> fetchBooks() async {
    // await Future.delayed(const Duration(milliseconds: 500));
    final jsonString = await rootBundle.loadString('assets/books.json');
    final List data = json.decode(jsonString);
    return data.map((json) => Book.fromJson(json)).toList();
  }
}
