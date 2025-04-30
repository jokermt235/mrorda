import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finals_project/features/books/data/repositories/cart_repository.dart';
import 'package:finals_project/features/books/domain/models/book.dart';
import 'package:finals_project/features/books/domain/models/cart_item.dart';

// Events
abstract class CartEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadCartEvent extends CartEvent {}

class AddToCartEvent extends CartEvent {
  final Book book;
  AddToCartEvent(this.book);
  @override
  List<Object> get props => [book];
}

class RemoveFromCartEvent extends CartEvent {
  final int bookId;
  RemoveFromCartEvent(this.bookId);
  @override
  List<Object> get props => [bookId];
}

class UpdateQuantityEvent extends CartEvent {
  final int bookId;
  final int quantity;
  UpdateQuantityEvent(this.bookId, this.quantity);
  @override
  List<Object> get props => [bookId, quantity];
}

// States
abstract class CartState extends Equatable {
  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<CartItem> cartItems;
  final double totalPrice;

  CartLoaded({
    required this.cartItems,
    required this.totalPrice,
  });

  @override
  List<Object> get props => [cartItems, totalPrice];
}

class CartError extends CartState {
  final String message;
  CartError(this.message);
  @override
  List<Object> get props => [message];
}

// BLoC
class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository _cartRepository;

  CartBloc(this._cartRepository) : super(CartInitial()) {
    on<LoadCartEvent>(_onLoadCart);
    on<AddToCartEvent>(_onAddToCart);
    on<RemoveFromCartEvent>(_onRemoveFromCart);
    on<UpdateQuantityEvent>(_onUpdateQuantity);
  }

  Future<void> _onLoadCart(
    LoadCartEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(CartLoading());
    try {
      final cartItems = await _cartRepository.getCartItems();
      final totalPrice = _cartRepository.calculateTotalPrice(cartItems);
      emit(CartLoaded(cartItems: cartItems, totalPrice: totalPrice));
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> _onAddToCart(
    AddToCartEvent event,
    Emitter<CartState> emit,
  ) async {
    if (state is CartLoaded) {
      emit(CartLoading());
      try {
        await _cartRepository.addToCart(event.book);
        final cartItems = await _cartRepository.getCartItems();
        final totalPrice = _cartRepository.calculateTotalPrice(cartItems);
        emit(CartLoaded(cartItems: cartItems, totalPrice: totalPrice));
      } catch (e) {
        emit(CartError(e.toString()));
      }
    }
  }

  Future<void> _onRemoveFromCart(
    RemoveFromCartEvent event,
    Emitter<CartState> emit,
  ) async {
    if (state is CartLoaded) {
      emit(CartLoading());
      try {
        await _cartRepository.removeFromCart(event.bookId);
        final cartItems = await _cartRepository.getCartItems();
        final totalPrice = _cartRepository.calculateTotalPrice(cartItems);
        emit(CartLoaded(cartItems: cartItems, totalPrice: totalPrice));
      } catch (e) {
        emit(CartError(e.toString()));
      }
    }
  }

  Future<void> _onUpdateQuantity(
    UpdateQuantityEvent event,
    Emitter<CartState> emit,
  ) async {
    if (state is CartLoaded) {
      emit(CartLoading());
      try {
        await _cartRepository.updateQuantity(event.bookId, event.quantity);
        final cartItems = await _cartRepository.getCartItems();
        final totalPrice = _cartRepository.calculateTotalPrice(cartItems);
        emit(CartLoaded(cartItems: cartItems, totalPrice: totalPrice));
      } catch (e) {
        emit(CartError(e.toString()));
      }
    }
  }
}
