part of 'cart_bloc.dart';

class CartState extends Equatable {
  final List<CartItemModel> items;
  const CartState({required this.items});

  double get totalPrice => items.fold(
    0,
        (sum, item) => sum + (item.book.price * item.quantity),
  );

  @override
  List<Object> get props => [items];
}

class CartInitial extends CartState {
  CartInitial() : super(items: []);
}