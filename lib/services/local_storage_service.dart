import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  Future<void> saveCart(Map<String, int> cart) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('cart', cart.toString());
  }

  Future<Map<String, int>> loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final cartString = prefs.getString('cart');
    if (cartString == null) return {};
    final Map<String, int> cart = {};

    final entries = cartString.substring(1, cartString.length - 1).split(', ');
    for (var entry in entries) {
      final split = entry.split(': ');
      cart[split[0]] = int.parse(split[1]);
    }
    return cart;
  }
}
