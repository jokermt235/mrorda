part of 'cart_bloc.dart';

abstract class CartEvent {}

class AddToCart extends CartEvent {
  final String bookId;
  AddToCart(this.bookId);
}

class RemoveFromCart extends CartEvent {
  final String bookId;
  RemoveFromCart(this.bookId);
}

class DecreaseCartItem extends CartEvent {
  final String bookId;
  DecreaseCartItem(this.bookId);
}
