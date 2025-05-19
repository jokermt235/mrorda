import 'package:json_annotation/json_annotation.dart';
import 'book_model.dart';

part 'cart_item_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CartItemModel {
  final BookModel book;
  final int quantity;

  CartItemModel({
    required this.book,
    required this.quantity,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) => _$CartItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$CartItemModelToJson(this);

  CartItemModel copyWith({int? quantity}) {
    return CartItemModel(
      book: book,
      quantity: quantity ?? this.quantity,
    );
  }
}