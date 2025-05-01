import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/book.dart';
import '../models/cart_item.dart';

class CartService {
  final SharedPreferences _prefs;
  static const _cartKey = 'shopping_cart';

  List<CartItem> _cartItems = [];

  CartService(this._prefs) {
    _loadCart();
  }

  void _loadCart() {
    final String? cartJson = _prefs.getString(_cartKey);
    if (cartJson != null) {
      try {
        final List<dynamic> decodedList = jsonDecode(cartJson) as List;
        _cartItems =
            decodedList
                .map((item) => CartItem.fromJson(item as Map<String, dynamic>))
                .toList();
      } catch (e) {
        _cartItems = [];
      }
    } else {
      _cartItems = [];
    }
  }

  Future<void> _saveCart() async {
    final List<Map<String, dynamic>> encodedList =
        _cartItems.map((item) => item.toJson()).toList();
    await _prefs.setString(_cartKey, jsonEncode(encodedList));
  }

  List<CartItem> getCartItems() {
    _loadCart();
    return List.unmodifiable(_cartItems);
  }

  Future<void> addItem(Book book) async {
    final index = _cartItems.indexWhere((item) => item.book.id == book.id);
    if (index != -1) {
      _cartItems[index] = _cartItems[index].copyWith(
        quantity: _cartItems[index].quantity + 1,
      );
    } else {
      _cartItems.add(CartItem(book: book, quantity: 1));
    }
    await _saveCart();
  }

  Future<void> removeItem(String bookId) async {
    _cartItems.removeWhere((item) => item.book.id == bookId);
    await _saveCart();
  }

  Future<void> decreaseItemQuantity(String bookId) async {
    final index = _cartItems.indexWhere((item) => item.book.id == bookId);
    if (index != -1) {
      if (_cartItems[index].quantity > 1) {
        _cartItems[index] = _cartItems[index].copyWith(
          quantity: _cartItems[index].quantity - 1,
        );
      } else {
        _cartItems.removeAt(index);
      }
      await _saveCart();
    }
  }

  Future<void> clearCart() async {
    _cartItems = [];
    await _saveCart();
  }
}
