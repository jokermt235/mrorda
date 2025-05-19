import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static const _cartKey = 'cart';
  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  List<String> getCart() => _prefs.getStringList(_cartKey) ?? [];

  void saveCart(List<String> bookIds) {
    _prefs.setStringList(_cartKey, bookIds);
  }
}
