// lib/blocs/cart/cart_bloc.dart

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:final_booksaleapp/models/book.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartInitial()) {
    on<AddToCart>(_onAddToCart);
    on<RemoveFromCart>(_onRemoveFromCart);
    on<IncreaseQuantity>(_onIncreaseQuantity);
    on<DecreaseQuantity>(_onDecreaseQuantity);
  }

  void _onAddToCart(AddToCart event, Emitter<CartState> emit) {
    final bookToAdd = event.book;
    if (state is CartLoaded) {
      final currentState = state as CartLoaded;
      final existingItemIndex = currentState.cartItems.indexWhere((item) => item.book.id == bookToAdd.id);

      if (existingItemIndex >= 0) {
        // Book already in cart, increase quantity
        final updatedItems = currentState.cartItems.map((item) {
          return item.book.id == bookToAdd.id
              ? CartItem(book: item.book, quantity: item.quantity + 1)
              : item;
        }).toList();
        emit(CartLoaded(cartItems: updatedItems));
      } else {
        // Book not in cart, add it
        final updatedItems = [...currentState.cartItems, CartItem(book: bookToAdd, quantity: 1)];
        emit(CartLoaded(cartItems: updatedItems));
      }
    } else if (state is CartInitial) {
      // Initial state, add the first item
      emit(CartLoaded(cartItems: [CartItem(book: bookToAdd, quantity: 1)]));
    }
  }

  void _onRemoveFromCart(RemoveFromCart event, Emitter<CartState> emit) {
    if (state is CartLoaded) {
      final currentState = state as CartLoaded;
      final updatedItems = currentState.cartItems.where((item) => item.book.id != event.book.id).toList();
      emit(CartLoaded(cartItems: updatedItems));
    }
  }

  void _onIncreaseQuantity(IncreaseQuantity event, Emitter<CartState> emit) {
    if (state is CartLoaded) {
      final currentState = state as CartLoaded;
      final updatedItems = currentState.cartItems.map((item) {
        return item.book.id == event.book.id ? CartItem(book: item.book, quantity: item.quantity + 1) : item;
      }).toList();
      emit(CartLoaded(cartItems: updatedItems));
    }
  }

  void _onDecreaseQuantity(DecreaseQuantity event, Emitter<CartState> emit) {
    if (state is CartLoaded) {
      final currentState = state as CartLoaded;
      final updatedItems = currentState.cartItems.map((item) {
        if (item.book.id == event.book.id) {
          final newQuantity = item.quantity - 1;
          return newQuantity > 0 ? CartItem(book: item.book, quantity: newQuantity) : null;
        }
        return item;
      }).whereType<CartItem>().toList();
      emit(CartLoaded(cartItems: updatedItems));
    }
  }
}

class CartItem extends Equatable {
  final Book book;
  final int quantity;

  const CartItem({required this.book, required this.quantity});

  @override
  List<Object?> get props => [book, quantity];
}