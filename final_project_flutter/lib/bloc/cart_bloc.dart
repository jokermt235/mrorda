import 'package:flutter_bloc/flutter_bloc.dart';
import '../service_locator.dart';
import '../services/local_storage_service.dart';

abstract class CartEvent {}
class AddToCart extends CartEvent {
  final String bookId;
  AddToCart(this.bookId);
}
class RemoveFromCart extends CartEvent {
  final String bookId;
  RemoveFromCart(this.bookId);
}
class DecreaseCount extends CartEvent {
  final String bookId;
  DecreaseCount(this.bookId);
}
class LoadCart extends CartEvent {}

class CartState {
  final Map<String, int> cart; // {bookId: count}
  CartState(this.cart);
}

class CartBloc extends Bloc<CartEvent, CartState> {
  final LocalStorageService _localStorage = sl<LocalStorageService>();

  CartBloc() : super(CartState({})) {
    on<LoadCart>((event, emit) async {
      final cart = await _localStorage.loadCart();
      emit(CartState(cart));
    });
    on<AddToCart>((event, emit) {
      final cart = Map<String, int>.from(state.cart);
      cart[event.bookId] = (cart[event.bookId] ?? 0) + 1;
      _localStorage.saveCart(cart);
      emit(CartState(cart));
    });
    on<RemoveFromCart>((event, emit) {
      final cart = Map<String, int>.from(state.cart);
      cart.remove(event.bookId);
      _localStorage.saveCart(cart);
      emit(CartState(cart));
    });
    on<DecreaseCount>((event, emit) {
      final cart = Map<String, int>.from(state.cart);
      if (cart.containsKey(event.bookId)) {
        if (cart[event.bookId]! > 1) {
          cart[event.bookId] = cart[event.bookId]! - 1;
        } else {
          cart.remove(event.bookId);
        }
      }
      _localStorage.saveCart(cart);
      emit(CartState(cart));
    });
  }
}