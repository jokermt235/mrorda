import 'package:equatable/equatable.dart';
import '../../models/cart_item.dart';

abstract class CartState extends Equatable {
  const CartState();
  @override List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<CartItem> items;
  final double totalPrice;

  const CartLoaded({required this.items, required this.totalPrice});

  int get totalItems => items.fold(0, (sum, item) => sum + item.quantity);

  int getQuantityForBook(String bookId) {
    try {
      return items.firstWhere((item) => item.book.id == bookId).quantity;
    } catch (e) {
      return 0;
    }
  }

  @override List<Object> get props => [items, totalPrice];
}

class CartError extends CartState {
    final String message;
    const CartError(this.message);
    @override List<Object> get props => [message];
}