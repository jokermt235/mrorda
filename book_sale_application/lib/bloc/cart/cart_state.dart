import '../../data/models/book.dart';

class CartItem {
  final Book book;
  int quantity;

  CartItem({required this.book, this.quantity = 1});
}

class CartState {
  final Map<String, CartItem> items;
  CartState({required this.items});

  double get totalPrice {
    return items.values.fold(0, (sum, item) => sum + item.book.price * item.quantity);
  }
}