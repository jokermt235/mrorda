import 'package:flutter/material.dart';

class Book {
  final String id;
  final String title;
  final String author;
  final double price;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.price,
  });
}

class BookProvider with ChangeNotifier {
  final List<Book> _books = [
    Book(id: '1', title: 'Book One', author: 'Author A', price: 9.99),
    Book(id: '2', title: 'Book Two', author: 'Author B', price: 12.99),
    Book(id: '3', title: 'Book Three', author: 'Author C', price: 15.99),
  ];

  List<Book> get books => _books;
}