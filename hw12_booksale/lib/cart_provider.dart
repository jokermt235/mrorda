import 'package:flutter/material.dart';
import 'book.dart';

class CartProvider with ChangeNotifier {
  List<Book> _cartItems = [];

  List<Book> get cartItems => _cartItems;

  void addToCart(Book book) {
    _cartItems.add(book);
    notifyListeners();
  }

  void removeFromCart(Book book) {
    _cartItems.remove(book);
    notifyListeners();
  }

  int get itemCount => _cartItems.length;

  double get totalPrice {
    return _cartItems.fold(0, (sum, item) => sum + item.price);
  }
}
