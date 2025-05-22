import 'package:flutter_application_2/core/models/book.dart';

class CartItem {
  final Book book;
  int quantity;

  CartItem({required this.book, required this.quantity});
}

class CartState {
  final Map<String, CartItem> items;

  CartState({required this.items});

  double get totalPrice {
    return items.values.fold(
      0,
      (sum, item) => sum + item.book.price * item.quantity,
    );
  }

  int get totalItems {
    return items.values.fold(0, (sum, item) => sum + item.quantity);
  }
}
