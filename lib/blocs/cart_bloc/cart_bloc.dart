import 'package:book_store2/models/book.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/cart_item.dart';
import '../../repositories/cart_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository cartRepository;

  CartBloc({required this.cartRepository}) : super(CartLoading()) {
    on<LoadCart>(_onLoadCart);
    on<AddToCart>(_onAddToCart);
    on<RemoveFromCart>(_onRemoveFromCart);
    on<DecreaseQuantity>(_onDecreaseQuantity);
    on<ClearCart>(_onClearCart);
  }

  Future<void> _onLoadCart(LoadCart event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      final cartItems = await cartRepository.getCartItems();
      emit(CartLoaded(cartItems: cartItems));
    } catch (e) {
      emit(CartError(message: e.toString()));
    }
  }

  Future<void> _onAddToCart(AddToCart event, Emitter<CartState> emit) async {
    if (state is CartLoaded) {
      final currentState = state as CartLoaded;
      final existingItemIndex = currentState.cartItems
          .indexWhere((item) => item.book.id == event.book.id);

      List<CartItem> updatedCartItems;
      if (existingItemIndex >= 0) {
        updatedCartItems = List<CartItem>.from(currentState.cartItems); // Explicit type
        updatedCartItems[existingItemIndex] = updatedCartItems[existingItemIndex]
            .copyWith(quantity: updatedCartItems[existingItemIndex].quantity + 1);
      } else {
        updatedCartItems = List<CartItem>.from(currentState.cartItems) // Explicit type
          ..add(CartItem(book: event.book));
      }

      await cartRepository.saveCartItems(updatedCartItems);
      emit(CartLoaded(cartItems: updatedCartItems));
    }
  }

  Future<void> _onRemoveFromCart(RemoveFromCart event, Emitter<CartState> emit) async {
    if (state is CartLoaded) {
      final currentState = state as CartLoaded;
      final updatedCartItems = List<CartItem>.from( // Explicit type
        currentState.cartItems.where((item) => item.book.id != event.bookId),
      );

      await cartRepository.saveCartItems(updatedCartItems);
      emit(CartLoaded(cartItems: updatedCartItems));
    }
  }

  Future<void> _onDecreaseQuantity(DecreaseQuantity event, Emitter<CartState> emit) async {
    if (state is CartLoaded) {
      final currentState = state as CartLoaded;
      final itemIndex = currentState.cartItems
          .indexWhere((item) => item.book.id == event.bookId);

      if (itemIndex >= 0) {
        final item = currentState.cartItems[itemIndex];
        if (item.quantity > 1) {
          final updatedCartItems = List<CartItem>.from(currentState.cartItems); // Explicit type
          updatedCartItems[itemIndex] = item.copyWith(quantity: item.quantity - 1);
          await cartRepository.saveCartItems(updatedCartItems);
          emit(CartLoaded(cartItems: updatedCartItems));
        } else {
          add(RemoveFromCart(bookId: event.bookId));
        }
      }
    }
  }

  Future<void> _onClearCart(ClearCart event, Emitter<CartState> emit) async {
    await cartRepository.saveCartItems([]);
    emit(CartLoaded(cartItems: []));
  }
}