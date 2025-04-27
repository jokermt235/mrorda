import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/cart.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(InitialCartState()) {
        on<IncreaseQuantity>((event, emit) {
      final cartItems = List<CartItem>.from(state.cartItems);

      final item = cartItems.firstWhere((item) => item.book.id == event.book.id);
      item.increaseQuantity();

      final updatedTotalPrice = cartItems.fold(0.0, (sum, item) => sum + item.totalPrice);
      emit(state.copyWith(cartItems: cartItems, totalPrice: updatedTotalPrice));
    });

    on<DecreaseQuantity>((event, emit) {
      final cartItems = List<CartItem>.from(state.cartItems);

      final item = cartItems.firstWhere((item) => item.book.id == event.book.id);
      item.decreaseQuantity();

      final updatedTotalPrice = cartItems.fold(0.0, (sum, item) => sum + item.totalPrice);
      emit(state.copyWith(cartItems: cartItems, totalPrice: updatedTotalPrice));
    });

    // REGISTER AddToCart
    on<AddToCart>((event, emit) {
      final cartItems = List<CartItem>.from(state.cartItems);

      final existingItem = cartItems.firstWhere(
        (item) => item.book.id == event.book.id,
        orElse: () => CartItem(book: event.book, quantity: 0),
      );

      if (existingItem.quantity > 0) {
        existingItem.increaseQuantity();
      } else {
        cartItems.add(CartItem(book: event.book, quantity: 1));
      }

      final updatedTotalPrice = cartItems.fold(0.0, (sum, item) => sum + item.totalPrice);
      emit(state.copyWith(cartItems: cartItems, totalPrice: updatedTotalPrice));
    });

    // REGISTER RemoveFromCart
    on<RemoveFromCart>((event, emit) {
      final cartItems = List<CartItem>.from(state.cartItems);

      cartItems.removeWhere((item) => item.book.id == event.book.id);

      final updatedTotalPrice = cartItems.fold(0.0, (sum, item) => sum + item.totalPrice);
      emit(state.copyWith(cartItems: cartItems, totalPrice: updatedTotalPrice));
    });
  }
}
