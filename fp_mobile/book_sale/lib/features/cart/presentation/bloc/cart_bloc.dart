import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:book_store/features/cart/domain/repositories/cart_repository.dart';
import 'package:book_store/features/book/data/models/book_model.dart';
import 'package:book_store/features/cart/data/models/cart_item_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository cartRepository;

  CartBloc({required this.cartRepository}) : super(CartInitial()) {
    on<LoadCartEvent>(_onLoadCart);
    on<AddToCartEvent>(_onAddToCart);
    on<RemoveFromCartEvent>(_onRemoveFromCart);
    on<IncreaseQuantityEvent>(_onIncreaseQuantity);
    on<DecreaseQuantityEvent>(_onDecreaseQuantity);
    on<ClearCartEvent>(_onClearCart);
  }

  Future<void> _onLoadCart(LoadCartEvent event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      final cartItems = await cartRepository.getCartItems();
      emit(CartLoaded(cartItems: cartItems));
    } catch (e) {
      emit(CartError(message: e.toString()));
    }
  }

  Future<void> _onAddToCart(AddToCartEvent event, Emitter<CartState> emit) async {
    if (state is! CartLoaded) return;
    final currentState = state as CartLoaded;

    final existingItemIndex = currentState.cartItems
        .indexWhere((item) => item.book.id == event.book.id);

    final updatedItems = List<CartItemModel>.from(currentState.cartItems);
    
    if (existingItemIndex >= 0) {
      updatedItems[existingItemIndex] = updatedItems[existingItemIndex].copyWith(
        quantity: updatedItems[existingItemIndex].quantity + 1
      );
    } else {
      updatedItems.add(CartItemModel(book: event.book));
    }

    await cartRepository.saveCartItems(updatedItems);
    emit(CartLoaded(cartItems: updatedItems));
  }

  Future<void> _onRemoveFromCart(RemoveFromCartEvent event, Emitter<CartState> emit) async {
    if (state is! CartLoaded) return;
    final currentState = state as CartLoaded;

    final updatedItems = List<CartItemModel>.from(currentState.cartItems)
      ..removeWhere((item) => item.book.id == event.book.id);

    await cartRepository.saveCartItems(updatedItems);
    emit(CartLoaded(cartItems: updatedItems));
  }

  Future<void> _onIncreaseQuantity(IncreaseQuantityEvent event, Emitter<CartState> emit) async {
    if (state is! CartLoaded) return;
    final currentState = state as CartLoaded;

    final itemIndex = currentState.cartItems
        .indexWhere((item) => item.book.id == event.bookId);

    if (itemIndex >= 0) {
      final updatedItems = List<CartItemModel>.from(currentState.cartItems);
      updatedItems[itemIndex] = updatedItems[itemIndex].copyWith(
        quantity: updatedItems[itemIndex].quantity + 1
      );

      await cartRepository.saveCartItems(updatedItems);
      emit(CartLoaded(cartItems: updatedItems));
    }
  }

  Future<void> _onDecreaseQuantity(DecreaseQuantityEvent event, Emitter<CartState> emit) async {
    if (state is! CartLoaded) return;
    final currentState = state as CartLoaded;

    final itemIndex = currentState.cartItems
        .indexWhere((item) => item.book.id == event.bookId);

    if (itemIndex >= 0) {
      final updatedItems = List<CartItemModel>.from(currentState.cartItems);
      if (updatedItems[itemIndex].quantity > 1) {
        updatedItems[itemIndex] = updatedItems[itemIndex].copyWith(
          quantity: updatedItems[itemIndex].quantity - 1
        );
      } else {
        updatedItems.removeAt(itemIndex);
      }

      await cartRepository.saveCartItems(updatedItems);
      emit(CartLoaded(cartItems: updatedItems));
    }
  }

  Future<void> _onClearCart(ClearCartEvent event, Emitter<CartState> emit) async {
    await cartRepository.saveCartItems([]);
    emit(CartLoaded(cartItems: []));
  }
}