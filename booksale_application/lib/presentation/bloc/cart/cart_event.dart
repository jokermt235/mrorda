part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
}

class AddToCart extends CartEvent {
  final BookModel book;
  const AddToCart(this.book);
  @override
  List<Object> get props => [book];
}

class RemoveFromCart extends CartEvent {
  final BookModel book;
  const RemoveFromCart(this.book);
  @override
  List<Object> get props => [book];
}

class UpdateQuantity extends CartEvent {
  final BookModel book;
  final int quantity;
  const UpdateQuantity(this.book, this.quantity);
  @override
  List<Object> get props => [book, quantity];
}