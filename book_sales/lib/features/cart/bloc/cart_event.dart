import 'package:book_sales/core/models/book.dart';

abstract class CartEvent {}

class AddBookToCart extends CartEvent {
  final Book book;
  AddBookToCart(this.book);
}

class RemoveBookFromCart extends CartEvent {
  final Book book;
  RemoveBookFromCart(this.book);
}