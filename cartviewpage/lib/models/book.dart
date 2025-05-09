import 'package:flutter/material.dart';

class Book {
  final String id;
  final String title;
  final double price;
  int quantity;

  Book({
    required this.id,
    required this.title,
    required this.price,
    this.quantity = 1,
  });
}

class BookProvider with ChangeNotifier {
  final List<Book> _books = [
    Book(id: '1', title: 'Book A', price: 10.0),
    Book(id: '2', title: 'Book B', price: 15.0),
    Book(id: '3', title: 'Book C', price: 20.0),
  ];

  List<Book> get books => _books;

  void addBook(String id) {
    try {
      final book = _books.firstWhere((b) => b.id == id);
      book.quantity++;
    } catch (e) {
      // Если книга не найдена, ничего не делаем
    }
    notifyListeners();
  }

  void removeBook(String id) {
    try {
      final book = _books.firstWhere((b) => b.id == id);
      if (book.quantity > 1) {
        book.quantity--;
      } else {
        _books.removeWhere((b) => b.id == id);
      }
    } catch (e) {
      // Если книга не найдена, ничего не делаем
    }
    notifyListeners();
  }

  double get totalPrice => _books.fold(0, (total, book) => total + (book.price * book.quantity));
}