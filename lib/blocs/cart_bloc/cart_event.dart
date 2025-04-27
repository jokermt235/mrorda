part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class LoadCart extends CartEvent {}

class AddToCart extends CartEvent {
  final Book book;

  const AddToCart({required this.book});

  @override
  List<Object> get props => [book];
}

class RemoveFromCart extends CartEvent {
  final String bookId;

  const RemoveFromCart({required this.bookId});

  @override
  List<Object> get props => [bookId];
}

class DecreaseQuantity extends CartEvent {
  final String bookId;

  const DecreaseQuantity({required this.bookId});

  @override
  List<Object> get props => [bookId];
}

class ClearCart extends CartEvent {}