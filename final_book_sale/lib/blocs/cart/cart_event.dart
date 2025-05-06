import 'package:equatable/equatable.dart';
import '../../models/book_model.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddToCart extends CartEvent {
  final Book book;
  const AddToCart(this.book);

  @override
  List<Object> get props => [book];
}

class RemoveFromCart extends CartEvent {
  final Book book;
  const RemoveFromCart(this.book);

  @override
  List<Object> get props => [book];
}

class IncreaseBookQuantity extends CartEvent {
  final Book book;
  const IncreaseBookQuantity(this.book);

  @override
  List<Object> get props => [book];
}

class DecreaseBookQuantity extends CartEvent {
  final Book book;
  const DecreaseBookQuantity(this.book);

  @override
  List<Object> get props => [book];
}
