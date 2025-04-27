// lib/bloc/cart/cart_event.dart
part of 'cart_bloc.dart';

abstract class CartEvent {}

class AddToCart extends CartEvent {
  final Book book;
  AddToCart(this.book);
}

class RemoveFromCart extends CartEvent {
  final Book book;
  RemoveFromCart(this.book);
}

class UpdateQuantity extends CartEvent {
  final Book book;
  final int quantity;
  UpdateQuantity(this.book, this.quantity);
}

class LoadCart extends CartEvent {}

class ClearCart extends CartEvent {}