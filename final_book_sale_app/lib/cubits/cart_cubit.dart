import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/book.dart';
import '../services/local_storage_service.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final LocalStorageService localStorageService;

  CartCubit(this.localStorageService) : super(CartState(cartItems: {}));

  Future<void> loadCart() async {
    final loadedCart = await localStorageService.loadCart();
    emit(CartState(cartItems: loadedCart));
  }

  void addToCart(Book book) {
    final updatedCart = Map<Book, int>.from(state.cartItems);
    updatedCart.update(book, (count) => count + 1, ifAbsent: () => 1);
    emit(CartState(cartItems: updatedCart));
    localStorageService.saveCart(updatedCart);
  }

  void removeFromCart(Book book) {
    final updatedCart = Map<Book, int>.from(state.cartItems);
    updatedCart.remove(book);
    emit(CartState(cartItems: updatedCart));
    localStorageService.saveCart(updatedCart);
  }

  void decreaseItem(Book book) {
    final updatedCart = Map<Book, int>.from(state.cartItems);
    if (updatedCart.containsKey(book)) {
      final count = updatedCart[book]!;
      if (count > 1) {
        updatedCart[book] = count - 1;
      } else {
        updatedCart.remove(book);
      }
      emit(CartState(cartItems: updatedCart));
      localStorageService.saveCart(updatedCart);
    }
  }

  void clearCart() {
    emit(CartState(cartItems: {}));
    localStorageService.saveCart({});
  }
}
