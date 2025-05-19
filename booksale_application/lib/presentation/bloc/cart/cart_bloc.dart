import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../core/services/local_storage_service.dart';
import '../../../data/models/book_model.dart';
import '../../../data/models/cart_item_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final LocalStorageService _localStorage;
  CartBloc(this._localStorage) : super(CartInitial()) {
    on<AddToCart>(_addToCart);
    on<RemoveFromCart>(_removeFromCart);
    on<UpdateQuantity>(_updateQuantity);
    _loadCartFromStorage();
  }

  Future<void> _loadCartFromStorage() async {
    final cartItems = await _localStorage.loadCart();
    emit(CartState(items: cartItems));
  }

  Future<void> _addToCart(AddToCart event, Emitter<CartState> emit) async {
    final items = List<CartItemModel>.from(state.items);
    final existingIndex = items.indexWhere((item) => item.book.id == event.book.id);

    if (existingIndex >= 0) {
      items[existingIndex] = items[existingIndex].copyWith(
        quantity: items[existingIndex].quantity + 1,
      );
    } else {
      items.add(CartItemModel(book: event.book, quantity: 1)); // Use CartItemModel directly
    }

    await _localStorage.saveCart(items);
    emit(CartState(items: items));
  }

  Future<void> _removeFromCart(RemoveFromCart event, Emitter<CartState> emit) async {
    final items = List<CartItemModel>.from(state.items); // Fix: Use CartItemModel
    items.removeWhere((item) => item.book.id == event.book.id);

    await _localStorage.saveCart(items);
    emit(CartState(items: items));
  }

  Future<void> _updateQuantity(UpdateQuantity event, Emitter<CartState> emit) async {
    final items = List<CartItemModel>.from(state.items); // Fix: Use CartItemModel
    final index = items.indexWhere((item) => item.book.id == event.book.id);

    if (index >= 0) {
      items[index] = items[index].copyWith(quantity: event.quantity);
      await _localStorage.saveCart(items);
      emit(CartState(items: items));
    }
  }
}