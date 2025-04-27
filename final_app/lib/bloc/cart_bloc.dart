import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/book.dart';
import '../models/cart.dart';

class CartState {
  final List<CartItem> items;

  CartState({required this.items});

  double get totalPrice => items.fold(0, (total, item) => total + item.book.price * item.quantity);
}

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState(items: []));

  void addToCart(Book book) {
    final existing = state.items.where((item) => item.book.id == book.id).toList();
    if (existing.isNotEmpty) {
      existing.first.quantity++;
    } else {
      state.items.add(CartItem(book: book));
    }
    emit(CartState(items: List.from(state.items)));
  }

  void removeFromCart(Book book) {
    state.items.removeWhere((item) => item.book.id == book.id);
    emit(CartState(items: List.from(state.items)));
  }

  void decreaseQuantity(Book book) {
    final existing = state.items.firstWhere((item) => item.book.id == book.id);
    if (existing.quantity > 1) {
      existing.quantity--;
    } else {
      removeFromCart(book);
    }
    emit(CartState(items: List.from(state.items)));
  }
}
