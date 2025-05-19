// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookModel _$BookModelFromJson(Map<String, dynamic> json) => BookModel(
  id: json['id'] as String,
  title: json['title'] as String,
  author: json['author'] as String,
  category: json['category'] as String,
  pageCount: (json['pageCount'] as num).toInt(),
  price: (json['price'] as num).toDouble(),
  coverUrl: json['coverUrl'] as String,
);

Map<String, dynamic> _$BookModelToJson(BookModel instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'author': instance.author,
  'category': instance.category,
  'pageCount': instance.pageCount,
  'price': instance.price,
  'coverUrl': instance.coverUrl,
};
