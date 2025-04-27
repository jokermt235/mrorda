import 'package:book_store2/models/book.dart';

class CartItem {
  final Book book;
  int quantity;

  CartItem({
    required this.book,
    this.quantity = 1,
  });

  double get totalPrice => book.price * quantity;

  CartItem copyWith({
    Book? book,
    int? quantity,
  }) {
    return CartItem(
      book: book ?? this.book,
      quantity: quantity ?? this.quantity,
    );
  }
}