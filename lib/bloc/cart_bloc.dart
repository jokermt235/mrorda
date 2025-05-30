import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../services/local_storage.dart'; // Исправлен импорт

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final LocalStorage localStorage;

  CartBloc({required this.localStorage}) : super(CartLoading()) {
    on<LoadCart>(_onLoadCart);
    on<AddToCart>(_onAddToCart);
    on<RemoveFromCart>(_onRemoveFromCart);
  }

  void _onLoadCart(LoadCart event, Emitter<CartState> emit) {
    try {
      final cart = localStorage.getCart();
      emit(CartLoaded(cart: _convertToCartMap(cart)));
    } catch (e) {
      emit(CartError(message: 'Failed to load cart'));
    }
  }

  void _onAddToCart(AddToCart event, Emitter<CartState> emit) {
    if (state is! CartLoaded) return;

    final currentState = state as CartLoaded;
    final newCart = Map<String, int>.from(currentState.cart);
    newCart.update(event.bookId, (value) => value + 1, ifAbsent: () => 1);

    _saveAndEmit(newCart, emit);
  }

  void _onRemoveFromCart(RemoveFromCart event, Emitter<CartState> emit) {
    if (state is! CartLoaded) return;

    final currentState = state as CartLoaded;
    final newCart = Map<String, int>.from(currentState.cart);
    final count = newCart[event.bookId] ?? 0;

    if (count > 1) {
      newCart[event.bookId] = count - 1;
    } else {
      newCart.remove(event.bookId);
    }

    _saveAndEmit(newCart, emit);
  }

  void _saveAndEmit(Map<String, int> cart, Emitter<CartState> emit) {
    try {
      localStorage.saveCart(_convertToStringList(cart));
      emit(CartLoaded(cart: cart));
    } catch (e) {
      emit(CartError(message: 'Failed to update cart'));
    }
  }

  Map<String, int> _convertToCartMap(List<String> bookIds) {
    final Map<String, int> cartMap = {};
    for (var id in bookIds) {
      cartMap.update(id, (value) => value + 1, ifAbsent: () => 1);
    }
    return cartMap;
  }

  List<String> _convertToStringList(Map<String, int> cart) {
    return cart.entries
        .expand((entry) => List.filled(entry.value, entry.key))
        .toList();
  }
}
