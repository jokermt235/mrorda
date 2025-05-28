part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class LoadCart extends CartEvent {}

class AddToCart extends CartEvent {
  final CartItem item;

  const AddToCart(this.item);

  @override
  List<Object> get props => [item];
}

class RemoveFromCart extends CartEvent {
  final String bookId;

  const RemoveFromCart(this.bookId);

  @override
  List<Object> get props => [bookId];
}

class UpdateCartQuantity extends CartEvent {
  final String bookId;
  final int quantity;

  const UpdateCartQuantity(this.bookId, this.quantity);

  @override
  List<Object> get props => [bookId, quantity];
}

