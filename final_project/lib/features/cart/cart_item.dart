import '../book/book.dart';

class CartItem {
  final Book book;
  final int quantity;

  const CartItem({required this.book, this.quantity = 1});

  CartItem copyWith({int? quantity}) {
    return CartItem(
      book: book,
      quantity: quantity ?? this.quantity,
    );
  }
}