import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booksaleapp/bloc/cart/cart_event.dart';
import 'package:booksaleapp/bloc/cart/cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState(items: {})) {
    on<AddToCart>((event, emit) {
      final map = Map<String, CartItem>.from(state.items);
      if (map.containsKey(event.book.id)) {
        map[event.book.id]!.count++;
      } else {
        map[event.book.id] = CartItem(book: event.book, count: 1);
      }
      emit(CartState(items: map));
    });

    on<RemoveFromCart>((event, emit) {
      final map = Map<String, CartItem>.from(state.items);
      final item = map[event.book.id];
      if (item != null) {
        if (item.count > 1) {
          item.count--;
        } else {
          map.remove(event.book.id);
        }
      }
      emit(CartState(items: map));
    });
  }
}