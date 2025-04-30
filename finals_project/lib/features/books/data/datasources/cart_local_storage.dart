import 'dart:convert'; // Required for JSON operations
import 'package:finals_project/core/error/exceptions.dart';
import 'package:finals_project/features/books/domain/models/cart_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartLocalStorage {
  final String _cartKey = 'cart_items';

  Future<List<CartItem>> getCartItems() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final cartItemsJson = prefs.getString(_cartKey);

      if (cartItemsJson == null) return [];

      final List<dynamic> jsonList = jsonDecode(cartItemsJson);
      return jsonList.map((json) => CartItem.fromJson(json)).toList();
    } catch (e) {
      throw CacheException('Failed to load cart items: ${e.toString()}');
    }
  }

  Future<void> saveCartItems(List<CartItem> cartItems) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString =
          jsonEncode(cartItems.map((item) => item.toJson()).toList());
      await prefs.setString(_cartKey, jsonString);
    } catch (e) {
      throw CacheException('Failed to save cart items: ${e.toString()}');
    }
  }
}
