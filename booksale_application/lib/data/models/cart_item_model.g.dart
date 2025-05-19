// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItemModel _$CartItemModelFromJson(Map<String, dynamic> json) =>
    CartItemModel(
      book: BookModel.fromJson(json['book'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$CartItemModelToJson(CartItemModel instance) =>
    <String, dynamic>{
      'book': instance.book.toJson(),
      'quantity': instance.quantity,
    };
