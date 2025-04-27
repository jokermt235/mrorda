import 'package:shared_preferences/shared_preferences.dart';
import '../models/book.dart';
import '../models/cart_item.dart';
import 'dart:convert';

class LocalStorageService {
  static const String _cartKey = 'cart';

  Future<void> saveCart(List<CartItem> cartItems) async {
    final prefs = await SharedPreferences.getInstance();
    final cartJson = cartItems.map((item) => jsonEncode({
      'book': item.book.toJson(),
      'quantity': item.quantity,
    })).toList();
    await prefs.setStringList(_cartKey, cartJson);
  }

  Future<List<CartItem>> loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final cartJson = prefs.getStringList(_cartKey) ?? [];
    return cartJson.map((itemJson) {
      final itemMap = jsonDecode(itemJson);
      return CartItem(
        book: Book.fromJson(itemMap['book']),
        quantity: itemMap['quantity'],
      );
    }).toList();
  }
}