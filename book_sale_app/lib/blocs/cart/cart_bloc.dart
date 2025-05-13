import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final Map<String, int> _cart = {};

  CartBloc() : super(CartInitial()) {
    on<AddToCart>((event, emit) {
      _cart[event.bookId] = (_cart[event.bookId] ?? 0) + 1;
      emit(CartUpdated(Map.from(_cart)));
    });

    on<RemoveFromCart>((event, emit) {
      if (_cart.containsKey(event.bookId)) {
        _cart.remove(event.bookId);
      }
      emit(CartUpdated(Map.from(_cart)));
    });

    on<DecreaseCartItem>((event, emit) {
      if (_cart.containsKey(event.bookId)) {
        if (_cart[event.bookId]! > 1) {
          _cart[event.bookId] = _cart[event.bookId]! - 1;
        } else {
          _cart.remove(event.bookId);
        }
      }
      emit(CartUpdated(Map.from(_cart)));
    });
  }
}
