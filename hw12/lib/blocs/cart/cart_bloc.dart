import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../models/book.dart';
import '../../models/cart_item.dart';

abstract class CartEvent {}

class LoadCart extends CartEvent {}

class AddToCart extends CartEvent {
  final Book book;
  AddToCart(this.book);
}

class RemoveFromCart extends CartEvent {
  final Book book;
  RemoveFromCart(this.book);
}

class IncreaseQuantity extends CartEvent {
  final Book book;
  IncreaseQuantity(this.book);
}

class DecreaseQuantity extends CartEvent {
  final Book book;
  DecreaseQuantity(this.book);
}

class CartState {
  final List<CartItem> cartItems;
  CartState(this.cartItems);
}

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState([])) {
    on<LoadCart>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      final cartString = prefs.getString('cart_items');
      if (cartString != null) {
        final cartList = (json.decode(cartString) as List)
            .map((item) => CartItem.fromJson(item))
            .toList();
        emit(CartState(cartList));
      } else {
        emit(CartState([]));
      }
    });

    on<AddToCart>((event, emit) async {
      List<CartItem> updated = List.from(state.cartItems);
      final index = updated.indexWhere((item) => item.book.id == event.book.id);
      if (index != -1) {
        updated[index] = CartItem(book: event.book, quantity: updated[index].quantity + 1);
      } else {
        updated.add(CartItem(book: event.book));
      }
      emit(CartState(updated));
      await saveCartToPrefs(updated);
    });

    on<RemoveFromCart>((event, emit) async {
      final updated = state.cartItems.where((item) => item.book.id != event.book.id).toList();
      emit(CartState(updated));
      await saveCartToPrefs(updated);
    });

    on<IncreaseQuantity>((event, emit) async {
      List<CartItem> updated = state.cartItems.map((item) {
        if (item.book.id == event.book.id) {
          return CartItem(book: item.book, quantity: item.quantity + 1);
        }
        return item;
      }).toList();
      emit(CartState(updated));
      await saveCartToPrefs(updated);
    });

    on<DecreaseQuantity>((event, emit) async {
      List<CartItem> updated = state.cartItems.map((item) {
        if (item.book.id == event.book.id && item.quantity > 1) {
          return CartItem(book: item.book, quantity: item.quantity - 1);
        }
        return item;
      }).where((item) => item.quantity > 0).toList();
      emit(CartState(updated));
      await saveCartToPrefs(updated);
    });
  }

  Future<void> saveCartToPrefs(List<CartItem> cartItems) async {
    final prefs = await SharedPreferences.getInstance();
    final cartList = cartItems.map((item) => item.toJson()).toList();
    prefs.setString('cart_items', json.encode(cartList));
  }
}
