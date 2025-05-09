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

class BookProvider extends ChangeNotifier {
  final List<Book> _cart = [];

  List<Book> get cart => _cart;

  double get totalPrice {
    return _cart.fold(0.0, (total, book) => total + book.price * book.quantity);
  }

  void addBook(Book book) {
    final existingBook = _cart.firstWhere(
          (item) => item.id == book.id,
      orElse: () => Book(id: '', title: '', price: 0.0),
    );

    if (existingBook.id != '') {
      existingBook.quantity++;
    } else {
      _cart.add(book);
    }
    notifyListeners();
  }

  void removeBook(Book book) {
    _cart.removeWhere((item) => item.id == book.id);
    notifyListeners();
  }

  void updateQuantity(Book book, int newQuantity) {
    if (newQuantity <= 0) {
      removeBook(book);
    } else {
      book.quantity = newQuantity;
    }
    notifyListeners();
  }
}