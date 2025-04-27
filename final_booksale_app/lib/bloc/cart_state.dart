// lib/bloc/cart/cart_state.dart
part of 'cart_bloc.dart';

abstract class CartState {
  final List<CartItem> items;
  final double totalPrice;

  CartState({this.items = const [], this.totalPrice = 0.0});
}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  CartLoaded({required List<CartItem> items, required double totalPrice})
      : super(items: items, totalPrice: totalPrice);
}

class CartError extends CartState {
  final String message;
  CartError(this.message);
}