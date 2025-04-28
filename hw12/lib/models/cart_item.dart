import 'book.dart';

class CartItem {
  final Book book;
  int quantity;

  CartItem({required this.book, this.quantity = 1});

  Map<String, dynamic> toJson() => {
    'book': book.toJson(),
    'quantity': quantity,
  };

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
    book: Book.fromJson(json['book']),
    quantity: json['quantity'],
  );
}

