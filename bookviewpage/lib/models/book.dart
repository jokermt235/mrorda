import 'package:flutter/material.dart';

class Book {
  final String id;
  final String title;
  final String author;
  final String coverUrl;
  final double price;
  final int pages;
  final String category;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.coverUrl,
    required this.price,
    required this.pages,
    required this.category,
  });
}

class BookProvider with ChangeNotifier {
  final List<Book> _books = [
    Book(
      id: '1',
      title: 'Flutter for Beginners',
      author: 'John Doe',
      coverUrl: 'https://via.placeholder.com/150',
      price: 15.99,
      pages: 320,
      category: 'Programming',
    ),
    Book(
      id: '2',
      title: 'Advanced Flutter',
      author: 'Jane Smith',
      coverUrl: 'https://via.placeholder.com/150',
      price: 19.99,
      pages: 450,
      category: 'Technology',
    ),
  ];

  List<Book> get books => _books;
}