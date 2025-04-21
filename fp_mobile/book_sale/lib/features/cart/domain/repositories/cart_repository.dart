import 'package:book_store/features/cart/data/models/cart_item_model.dart';

abstract class CartRepository {
  Future<List<CartItemModel>> getCartItems();
  Future<void> saveCartItems(List<CartItemModel> items);
}