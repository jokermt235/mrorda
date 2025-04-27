import 'package:booksaleapp/data/models/book.dart';

abstract class CartEvent {}

class AddToCart extends CartEvent {
  final Book book;
  AddToCart(this.book);
}

class RemoveFromCart extends CartEvent {
  final Book book;
  RemoveFromCart(this.book);
}