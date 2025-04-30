import 'package:finals_project/features/books/data/datasources/cart_local_storage.dart';
import 'package:finals_project/features/books/domain/models/book.dart';
import 'package:finals_project/features/books/domain/models/cart_item.dart';

class CartRepository {
  final CartLocalStorage _localStorage;

  CartRepository(this._localStorage);

  Future<List<CartItem>> getCartItems() async {
    return await _localStorage.getCartItems();
  }

  Future<void> addToCart(Book book) async {
    final cartItems = await _localStorage.getCartItems();
    final existingItemIndex =
        cartItems.indexWhere((item) => item.book.id == book.id);

    if (existingItemIndex != -1) {
      cartItems[existingItemIndex] = cartItems[existingItemIndex].copyWith(
        quantity: cartItems[existingItemIndex].quantity + 1,
      );
    } else {
      cartItems.add(CartItem(book: book, quantity: 1));
    }

    await _localStorage.saveCartItems(cartItems);
  }

  Future<void> removeFromCart(int bookId) async {
    final cartItems = await _localStorage.getCartItems();
    cartItems.removeWhere((item) => item.book.id == bookId);
    await _localStorage.saveCartItems(cartItems);
  }

  Future<void> updateQuantity(int bookId, int quantity) async {
    final cartItems = await _localStorage.getCartItems();
    final existingItemIndex =
        cartItems.indexWhere((item) => item.book.id == bookId);

    if (existingItemIndex != -1) {
      if (quantity <= 0) {
        cartItems.removeAt(existingItemIndex);
      } else {
        cartItems[existingItemIndex] = cartItems[existingItemIndex].copyWith(
          quantity: quantity,
        );
      }
      await _localStorage.saveCartItems(cartItems);
    }
  }

  double calculateTotalPrice(List<CartItem> cartItems) {
    return cartItems.fold(
        0, (sum, item) => sum + (item.book.price * item.quantity));
  }
}
