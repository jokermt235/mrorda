import '../models/cart.dart';

class CartState {
  final List<CartItem> cartItems;
  final double totalPrice;

  CartState({required this.cartItems, required this.totalPrice});

  // Create a copy of the current state with new values
  CartState copyWith({List<CartItem>? cartItems, double? totalPrice}) {
    return CartState(
      cartItems: cartItems ?? this.cartItems,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }
}

class InitialCartState extends CartState {
  InitialCartState() : super(cartItems: [], totalPrice: 0.0);
}


