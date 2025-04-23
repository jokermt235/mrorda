import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lesson9riverpod/product/data/product.dart';
import 'package:lesson9riverpod/product/data/product_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_provider.g.dart';

@riverpod
Future<List<Product>> product(Ref ref) async {
  ProductRepository repository = ProductRepository();
  return await repository.getProducts();
}