import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:book_store/features/cart/data/models/cart_item_model.dart';
import 'package:book_store/features/cart/data/datasources/cart_local_data_source.dart';
import 'package:book_store/features/book/data/models/book_model.dart';

class CartLocalDataSourceImpl implements CartLocalDataSource {
  final SharedPreferences sharedPreferences;
  static const String _cartKey = 'cart';

  CartLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<CartItemModel>> getCartItems() async {
    final jsonString = sharedPreferences.getString(_cartKey);
    if (jsonString == null) return [];

    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((item) {
      return CartItemModel(
        book: BookModel.fromJson(item['book']),
        quantity: item['quantity'],
      );
    }).toList();
  }

  @override
  Future<void> saveCartItems(List<CartItemModel> items) async {
    final jsonList = items.map((item) {
      return {
        'book': item.book.toJson(),
        'quantity': item.quantity,
      };
    }).toList();

    await sharedPreferences.setString(_cartKey, json.encode(jsonList));
  }
}