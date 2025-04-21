part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class LoadCartEvent extends CartEvent {}

class AddToCartEvent extends CartEvent {
  final BookModel book;

  const AddToCartEvent({required this.book});

  @override
  List<Object> get props => [book];
}

class RemoveFromCartEvent extends CartEvent {
  final BookModel book;

  const RemoveFromCartEvent({required this.book});

  @override
  List<Object> get props => [book];
}

class IncreaseQuantityEvent extends CartEvent {
  final String bookId;

  const IncreaseQuantityEvent({required this.bookId});

  @override
  List<Object> get props => [bookId];
}

class DecreaseQuantityEvent extends CartEvent {
  final String bookId;

  const DecreaseQuantityEvent({required this.bookId});

  @override
  List<Object> get props => [bookId];
}

class ClearCartEvent extends CartEvent {}