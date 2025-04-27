import '../models/cart_item.dart';
import '../services/local_storage_service.dart';

class CartRepository {
  final LocalStorageService localStorageService;

  CartRepository({required this.localStorageService});

  Future<List<CartItem>> getCartItems() async {
    return await localStorageService.loadCart();
  }

  Future<void> saveCartItems(List<CartItem> cartItems) async {
    await localStorageService.saveCart(cartItems);
  }
}