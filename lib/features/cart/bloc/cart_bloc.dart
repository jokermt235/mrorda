import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_2/features/cart/bloc/cart_event.dart';
import 'package:flutter_application_2/features/cart/bloc/cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState(items: {})) {
    on<AddBookToCart>((event, emit) {
      final updatedItems = Map<String, CartItem>.from(state.items);
      if (updatedItems.containsKey(event.book.id)) {
        updatedItems[event.book.id]!.quantity++;
      } else {
        updatedItems[event.book.id] = CartItem(book: event.book, quantity: 1);
      }
      emit(CartState(items: updatedItems));
    });

    on<RemoveBookFromCart>((event, emit) {
      final updatedItems = Map<String, CartItem>.from(state.items);
      final item = updatedItems[event.book.id];
      if (item != null) {
        if (item.quantity > 1) {
          item.quantity--;
        } else {
          updatedItems.remove(event.book.id);
        }
      }
      emit(CartState(items: updatedItems));
    });
  }
}
