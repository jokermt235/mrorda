part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

class AddToCart extends CartEvent {
  final Book book;

  const AddToCart({required this.book});

  @override
  List<Object?> get props => [book];
}

class RemoveFromCart extends CartEvent {
  final Book book;

  const RemoveFromCart({required this.book});

  @override
  List<Object?> get props => [book];
}

class IncreaseQuantity extends CartEvent {
  final Book book;

  const IncreaseQuantity({required this.book});

  @override
  List<Object?> get props => [book];
}

class DecreaseQuantity extends CartEvent {
  final Book book;

  const DecreaseQuantity({required this.book});

  @override
  List<Object?> get props => [book];
}