import 'dart:convert';

import 'package:lesson9riverpod/product/data/product.dart';
import 'package:lesson9riverpod/product/service/product_request.dart';
import 'package:lesson9riverpod/product/service/product_service.dart';

class ProductRepository{
  final ProductService _productService = ProductService();
  Future<List<Product>> getProducts() async{
    final response  = await _productService.fetch(
      ProductRequest()
    );
    List<Product> result = [];
    if (response != null){
      List<dynamic> dynamicData = response.data;
      for(var item in dynamicData){
        result.add(Product.fromJson(item));
      }
    }
    return result;
  }
}