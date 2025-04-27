// lib/models/cart_item.dart
import 'package:final_booksale_app/models/book_model.dart';

class CartItem {
  final Book book;
  int quantity;

  CartItem({required this.book, this.quantity = 1});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartItem &&
          runtimeType == other.runtimeType &&
          book.id == other.book.id;

  @override
  int get hashCode => book.id.hashCode;
}