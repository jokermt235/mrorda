import 'package:equatable/equatable.dart';
import '../../models/book.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
  @override
  List<Object> get props => [];
}

class LoadCart extends CartEvent {}

class AddBookToCart extends CartEvent {
  final Book book;
  const AddBookToCart(this.book);
  @override
  List<Object> get props => [book];
}

class RemoveBookFromCart extends CartEvent {
  final String bookId;
  const RemoveBookFromCart(this.bookId);
  @override
  List<Object> get props => [bookId];
}

class DecreaseBookQuantity extends CartEvent {
  final String bookId;
  const DecreaseBookQuantity(this.bookId);
  @override
  List<Object> get props => [bookId];
}

class ClearCart extends CartEvent {}
