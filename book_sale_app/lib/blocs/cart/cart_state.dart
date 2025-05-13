part of 'cart_bloc.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartUpdated extends CartState {
  final Map<String, int> cart;
  CartUpdated(this.cart);
}
