import 'package:flutter_application_2/core/models/book.dart';

abstract class CartEvent {}

class AddBookToCart extends CartEvent {
  final Book book;
  AddBookToCart(this.book);
}

class RemoveBookFromCart extends CartEvent {
  final Book book;
  RemoveBookFromCart(this.book);
}
