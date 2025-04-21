import 'package:book_store/features/cart/domain/repositories/cart_repository.dart';
import 'package:book_store/features/cart/data/models/cart_item_model.dart';
import 'package:book_store/features/cart/data/datasources/cart_local_data_source.dart';

class CartRepositoryImpl implements CartRepository {
  final CartLocalDataSource localDataSource;

  CartRepositoryImpl({required this.localDataSource});

  @override
  Future<List<CartItemModel>> getCartItems() async {
    return await localDataSource.getCartItems();
  }

  @override
  Future<void> saveCartItems(List<CartItemModel> items) async {
    await localDataSource.saveCartItems(items);
  }
}