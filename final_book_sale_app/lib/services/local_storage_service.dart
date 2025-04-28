import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/book.dart';

class LocalStorageService {
  static const _cartKey = 'cart';

  Future<void> saveCart(Map<Book, int> cartItems) async {
    final prefs = await SharedPreferences.getInstance();
    final List<Map<String, dynamic>> cartList = cartItems.entries.map((entry) {
      return {
        'book': {
          'id': entry.key.id,
          'title': entry.key.title,
          'author': entry.key.author,
          'price': entry.key.price,
          'category': entry.key.category,
          'pages': entry.key.pages,
          'coverUrl': entry.key.coverUrl,
        },
        'count': entry.value,
      };
    }).toList();
    await prefs.setString(_cartKey, jsonEncode(cartList));
  }

  Future<Map<Book, int>> loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final String? cartString = prefs.getString(_cartKey);

    if (cartString == null) return {};

    final List<dynamic> cartList = jsonDecode(cartString);
    return {
      for (var item in cartList)
        Book.fromJson(item['book'] as Map<String, dynamic>): item['count'] as int,
    };
  }
}
