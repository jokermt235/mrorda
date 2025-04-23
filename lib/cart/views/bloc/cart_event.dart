import 'package:lesson9riverpod/product/data/product.dart';

abstract class CartEvent{}

class CartAddEvent extends CartEvent{
  Product product;
  CartAddEvent({required this.product});
}

class CartInitEvent extends CartEvent{
  Product product;
  CartInitEvent({required this.product});
}
