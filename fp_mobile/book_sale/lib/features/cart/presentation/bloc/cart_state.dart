part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<CartItemModel> cartItems;

  const CartLoaded({required this.cartItems});

  double get totalPrice {
    return cartItems.fold(
        0, (total, current) => total + current.totalPrice);
  }

  @override
  List<Object> get props => [cartItems];
}

class CartError extends CartState {
  final String message;

  const CartError({required this.message});

  @override
  List<Object> get props => [message];
}