import 'package:flutter/material.dart';
import '../models/book_model.dart';
import '../models/cart_model.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addToCart(Book book) {
    int index = _items.indexWhere((item) => item.book.title == book.title);

    if (index >= 0) {
      _items[index].quantity++;
    } else {
      _items.add(CartItem(book: book));
    }

    notifyListeners();
  }

  int get totalItems {
    int count = 0;
    for (var item in _items) {
      count += item.quantity;
    }
    return count;
  }
}