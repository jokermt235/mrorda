import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../models/book_model.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState([])) {
    on<AddToCart>(_onAddToCart);
    on<RemoveFromCart>(_onRemoveFromCart);
    on<IncreaseBookQuantity>(_onIncreaseQuantity);
    on<DecreaseBookQuantity>(_onDecreaseQuantity);

    _loadCartFromPrefs();
  }

  Future<void> _onAddToCart(AddToCart event, Emitter<CartState> emit) async {
    final updatedCart = List.of(state.cartItems)..add(event.book);
    emit(CartState(updatedCart));
    await _saveCartToPrefs(updatedCart);
  }

  Future<void> _onRemoveFromCart(RemoveFromCart event, Emitter<CartState> emit) async {
    final updatedCart = List.of(state.cartItems)..removeWhere((book) => book.id == event.book.id);
    emit(CartState(updatedCart));
    await _saveCartToPrefs(updatedCart);
  }

  void _onIncreaseQuantity(IncreaseBookQuantity event, Emitter<CartState> emit) {
    final updatedCart = List.of(state.cartItems)..add(event.book);
    emit(CartState(updatedCart));
    _saveCartToPrefs(updatedCart);
  }

  void _onDecreaseQuantity(DecreaseBookQuantity event, Emitter<CartState> emit) {
    final updatedCart = List.of(state.cartItems)..remove(event.book);
    emit(CartState(updatedCart));
    _saveCartToPrefs(updatedCart);
  }

  Future<void> _saveCartToPrefs(List<Book> cartItems) async {
    final prefs = await SharedPreferences.getInstance();
    final cartJson = jsonEncode(cartItems.map((book) => book.toJson()).toList());
    await prefs.setString('cart', cartJson);
  }

  Future<void> _loadCartFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final cartString = prefs.getString('cart');

    if (cartString != null) {
      final decoded = jsonDecode(cartString) as List<dynamic>;
      final loadedBooks = decoded.map((json) => Book.fromJson(json)).toList();
      emit(CartState(loadedBooks));
    }
  }
}
