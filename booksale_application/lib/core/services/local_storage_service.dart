import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/models/cart_item_model.dart';
import '../../data/models/book_model.dart';

class LocalStorageService {
  static const _cachedBooksKey = 'cached_books';
  static const _cartKey = 'cart';

  Future<void> cacheBooks(List<BookModel> books) async {
    final prefs = await SharedPreferences.getInstance();
    final json = books.map((book) => book.toJson()).toList();
    await prefs.setString(_cachedBooksKey, jsonEncode(json));
  }

  Future<List<BookModel>> getCachedBooks() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_cachedBooksKey);

    if (jsonString == null) return [];

    try {
      final List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList
          .map((json) => BookModel.fromJson(json))
          .toList();
    } catch (e) {
      print('Error loading cached books: $e');
      return [];
    }
  }

  Future<void> saveCart(List<CartItemModel> items) async {
    final prefs = await SharedPreferences.getInstance();
    final json = items.map((item) => item.toJson()).toList();
    await prefs.setString(_cartKey, jsonEncode(json));
  }

  Future<List<CartItemModel>> loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_cartKey);

    if (jsonString == null) return [];

    try {
      final List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList
          .map((json) => CartItemModel.fromJson(json))
          .toList();
    } catch (e) {
      if (kDebugMode) {
        print('Error loading cart: $e');
      }
      return [];
    }
  }
}