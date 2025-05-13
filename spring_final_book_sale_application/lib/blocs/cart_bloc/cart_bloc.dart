import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/cart_service.dart';
import 'cart_event.dart';
import 'cart_state.dart';
import '../../models/cart_item.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartService cartService;

  CartBloc({required this.cartService}) : super(CartInitial()) {
    on<LoadCart>(_onLoadCart);
    on<AddBookToCart>(_onAddBookToCart);
    on<RemoveBookFromCart>(_onRemoveBookFromCart);
    on<DecreaseBookQuantity>(_onDecreaseBookQuantity);
    on<ClearCart>(_onClearCart);
  }

  double _calculateTotalPrice(List<CartItem> items) {
    return items.fold(0.0, (sum, item) => sum + item.totalPrice);
  }

  void _emitCartLoaded(Emitter<CartState> emit) {
    final items = cartService.getCartItems();
    final total = _calculateTotalPrice(items);
    emit(CartLoaded(items: items, totalPrice: total));
  }

  void _onLoadCart(LoadCart event, Emitter<CartState> emit) {
    emit(CartLoading());
    try {
      _emitCartLoaded(emit);
    } catch (e) {
      emit(const CartError("Failed to load cart"));
    }
  }

  Future<void> _onAddBookToCart(
    AddBookToCart event,
    Emitter<CartState> emit,
  ) async {
    emit(CartLoading());
    try {
      await cartService.addItem(event.book);
      _emitCartLoaded(emit);
    } catch (e) {
      emit(const CartError("Failed to add item"));
      _emitCartLoaded(emit);
    }
  }

  Future<void> _onRemoveBookFromCart(
    RemoveBookFromCart event,
    Emitter<CartState> emit,
  ) async {
    emit(CartLoading());
    try {
      await cartService.removeItem(event.bookId);
      _emitCartLoaded(emit);
    } catch (e) {
      emit(const CartError("Failed to remove item"));
      _emitCartLoaded(emit);
    }
  }

  Future<void> _onDecreaseBookQuantity(
    DecreaseBookQuantity event,
    Emitter<CartState> emit,
  ) async {
    emit(CartLoading());
    try {
      await cartService.decreaseItemQuantity(event.bookId);
      _emitCartLoaded(emit);
    } catch (e) {
      emit(const CartError("Failed to update item quantity"));
      _emitCartLoaded(emit);
    }
  }

  Future<void> _onClearCart(ClearCart event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      await cartService.clearCart();
      _emitCartLoaded(emit);
    } catch (e) {
      emit(const CartError("Failed to clear cart"));
      _emitCartLoaded(emit);
    }
  }
}
