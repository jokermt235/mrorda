import 'package:hive/hive.dart';
import 'package:book_sale_app/models/cart_item.dart';

class CartService {
  final Box<CartItem> _cartBox = Hive.box<CartItem>('cart');

  Future<List<CartItem>> getCartItems() async {
    return _cartBox.values.toList();
  }

  Future<void> addToCart(CartItem item) async {
    await _cartBox.put(item.book.id, item);
  }

  Future<void> removeFromCart(String bookId) async {
    await _cartBox.delete(bookId);
  }

  Future<void> updateQuantity(String bookId, int quantity) async {
    final item = _cartBox.get(bookId);
    if (item != null) {
      if (quantity <= 0) {
        await _cartBox.delete(bookId);
      } else {
        await _cartBox.put(bookId, CartItem(book: item.book, quantity: quantity));
      }
    }
  }
}
