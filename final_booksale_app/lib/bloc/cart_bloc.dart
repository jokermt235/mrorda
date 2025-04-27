// lib/bloc/cart/cart_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_booksale_app/models/book_model.dart';
import 'package:final_booksale_app/models/cart_item.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoaded(items: [], totalPrice: 0.0)) {
    on<AddToCart>(_onAddToCart);
    on<RemoveFromCart>(_onRemoveFromCart);
    on<UpdateQuantity>(_onUpdateQuantity);
    on<LoadCart>(_onLoadCart);
    on<ClearCart>(_onClearCart);
  }

  void _onAddToCart(AddToCart event, Emitter<CartState> emit) {
    print('AddToCart event received for book: ${event.book.title}');
    final currentState = state as CartLoaded;
    final existingItemIndex =
        currentState.items.indexWhere((item) => item.book.id == event.book.id);

    if (existingItemIndex >= 0) {
      final updatedItems = List<CartItem>.from(currentState.items);
      updatedItems[existingItemIndex].quantity++;
      emit(CartLoaded(items: updatedItems, totalPrice: _calculateTotalPrice(updatedItems)));
      print('Book quantity increased. Cart: ${updatedItems.length} items, Total: ${state.totalPrice}');
    } else {
      final updatedItems = [...currentState.items, CartItem(book: event.book)];
      emit(CartLoaded(items: updatedItems, totalPrice: _calculateTotalPrice(updatedItems)));
      print('Book added to cart. Cart: ${updatedItems.length} items, Total: ${state.totalPrice}');
    }
  }

  void _onRemoveFromCart(RemoveFromCart event, Emitter<CartState> emit) {
    print('RemoveFromCart event received for book: ${event.book.title}');
    final currentState = state as CartLoaded;
    final updatedItems =
        currentState.items.where((item) => item.book.id != event.book.id).toList();
    emit(CartLoaded(items: updatedItems, totalPrice: _calculateTotalPrice(updatedItems)));
    print('Book removed from cart. Cart: ${updatedItems.length} items, Total: ${state.totalPrice}');
  }

  void _onUpdateQuantity(UpdateQuantity event, Emitter<CartState> emit) {
    print('UpdateQuantity event received for book: ${event.book.title}, quantity: ${event.quantity}');
    final currentState = state as CartLoaded;
    final updatedItems = currentState.items.map((item) {
      if (item.book.id == event.book.id) {
        return CartItem(book: item.book, quantity: event.quantity);
      }
      return item;
    }).toList();
    emit(CartLoaded(items: updatedItems, totalPrice: _calculateTotalPrice(updatedItems)));
    print('Cart quantity updated. Cart: ${updatedItems.length} items, Total: ${state.totalPrice}');
  }

  void _onLoadCart(LoadCart event, Emitter<CartState> emit) {
    print('LoadCart event received.');
    emit(CartLoaded(items: [], totalPrice: 0.0)); // Placeholder
  }

  void _onClearCart(ClearCart event, Emitter<CartState> emit) {
    print('ClearCart event received.');
    emit(CartLoaded(items: [], totalPrice: 0.0)); // Placeholder
  }

  double _calculateTotalPrice(List<CartItem> items) {
    return items.fold(0.0, (total, item) => total + (item.book.price * item.quantity));
  }
}