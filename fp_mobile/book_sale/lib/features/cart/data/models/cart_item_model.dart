import 'package:equatable/equatable.dart';
import 'package:book_store/features/book/data/models/book_model.dart';

class CartItemModel extends Equatable {
  final BookModel book;
  final int quantity;

  const CartItemModel({
    required this.book,
    this.quantity = 1,
  });

  CartItemModel copyWith({
    BookModel? book,
    int? quantity,
  }) {
    return CartItemModel(
      book: book ?? this.book,
      quantity: quantity ?? this.quantity,
    );
  }

  double get totalPrice => book.price * quantity;

  @override
  List<Object?> get props => [book, quantity];
}