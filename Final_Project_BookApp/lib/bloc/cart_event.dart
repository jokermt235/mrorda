import '../models/book.dart';

abstract class CartEvent {}

class AddToCart extends CartEvent {
  final Book book;
  AddToCart(this.book);
}

class RemoveFromCart extends CartEvent {
  final Book book;
  RemoveFromCart(this.book);
}

class IncreaseQuantity extends CartEvent {
  final Book book;
  IncreaseQuantity(this.book);
}

class DecreaseQuantity extends CartEvent {
  final Book book;
  DecreaseQuantity(this.book);
}
