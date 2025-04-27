import 'package:flutter/foundation.dart';

class ProductItem {
  final String id;
  final String title;
  final String thumbnail;
  final double price;
  final int pages;
  final String description;

  const ProductItem({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.price,
    required this.pages,
    required this.description,
  });
}
