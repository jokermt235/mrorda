import 'package:equatable/equatable.dart';
import 'book.dart';

class CartItem extends Equatable {
  final Book book;
  final int quantity;

  const CartItem({required this.book, required this.quantity});

  CartItem copyWith({Book? book, int? quantity}) {
    return CartItem(
      book: book ?? this.book,
      quantity: quantity ?? this.quantity,
    );
  }

  double get totalPrice => book.price * quantity;

  @override
  List<Object> get props => [book, quantity];

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      book: Book.fromJson(json['book'] as Map<String, dynamic>),
      quantity: json['quantity'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {'book': book.toJson(), 'quantity': quantity};
  }
}
