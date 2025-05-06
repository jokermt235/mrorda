import 'package:equatable/equatable.dart';
import '../../models/book_model.dart';

class CartState extends Equatable {
  final List<Book> cartItems;

  const CartState(this.cartItems);

  double get totalPrice => cartItems.fold(0, (total, book) => total + book.price);

  @override
  List<Object> get props => [cartItems];
}
