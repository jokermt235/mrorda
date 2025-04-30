import 'package:equatable/equatable.dart';
import 'package:finals_project/features/books/domain/models/book.dart';

class CartItem extends Equatable {
  final Book book;
  final int quantity;

  const CartItem({
    required this.book,
    required this.quantity,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      book: Book.fromJson(json['book']),
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() => {
        'book': book.toJson(),
        'quantity': quantity,
      };

  @override
  List<Object> get props => [book, quantity];

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
