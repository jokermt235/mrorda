part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class LoadCart extends CartEvent {}

class AddToCart extends CartEvent {
  final String bookId;

  const AddToCart(this.bookId);

  @override
  List<Object> get props => [bookId];
}

class RemoveFromCart extends CartEvent {
  final String bookId;

  const RemoveFromCart(this.bookId);

  @override
  List<Object> get props => [bookId];
}
