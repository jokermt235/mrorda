import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../book/book.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final SharedPreferences prefs;

  CartBloc({required this.prefs}) : super(CartLoading()) {
    on<LoadCart>(_onLoadCart);
    on<AddToCart>(_onAddToCart);
    on<RemoveFromCart>(_onRemoveFromCart);
  }

  void _onLoadCart(LoadCart event, Emitter<CartState> emit) {
    emit(CartLoaded([])); // Simplified for example
  }

  void _onAddToCart(AddToCart event, Emitter<CartState> emit) {
    if (state is CartLoaded) {
      final currentState = state as CartLoaded;
      final existingIndex = currentState.items.indexWhere(
        (item) => item.book.id == event.book.id,
      );

      if (existingIndex >= 0) {
        final updatedItems = List<CartItem>.from(currentState.items);
        updatedItems[existingIndex] = updatedItems[existingIndex]
            .copyWith(quantity: updatedItems[existingIndex].quantity + 1);
        emit(CartLoaded(updatedItems));
      } else {
        emit(CartLoaded([...currentState.items, CartItem(book: event.book)]));
      }
    }
  }

  void _onRemoveFromCart(RemoveFromCart event, Emitter<CartState> emit) {
    if (state is CartLoaded) {
      final currentState = state as CartLoaded;
      final existingIndex = currentState.items.indexWhere(
        (item) => item.book.id == event.book.id,
      );

      if (existingIndex >= 0) {
        final updatedItems = List<CartItem>.from(currentState.items);
        if (updatedItems[existingIndex].quantity > 1) {
          updatedItems[existingIndex] = updatedItems[existingIndex]
              .copyWith(quantity: updatedItems[existingIndex].quantity - 1);
          emit(CartLoaded(updatedItems));
        } else {
          updatedItems.removeAt(existingIndex);
          emit(CartLoaded(updatedItems));
        }
      }
    }
  }
}