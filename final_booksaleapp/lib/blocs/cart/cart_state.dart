part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object?> get props => [];
}

class CartInitial extends CartState {
  const CartInitial();
}

class CartLoaded extends CartState {
  final List<CartItem> cartItems;

  const CartLoaded({this.cartItems = const []});

  double get totalPrice => cartItems.fold(0, (total, item) => total + (item.book.price * item.quantity));

  int get totalItems => cartItems.fold(0, (total, item) => total + item.quantity);

  @override
  List<Object?> get props => [cartItems];
}

class CartError extends CartState {
  final String? message;

  const CartError({this.message});
}
