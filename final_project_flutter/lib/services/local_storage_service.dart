import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  Future<void> saveCart(Map<String, int> cart) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('cart', cart.entries.map((e) => '${e.key}:${e.value}').join(','));
  }

  Future<Map<String, int>> loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final cartString = prefs.getString('cart');
    if (cartString == null || cartString.isEmpty) return {};
    final entries = cartString.split(',').where((e) => e.contains(':'));
    return {for (var entry in entries) entry.split(':')[0]: int.parse(entry.split(':')[1])};
  }
}