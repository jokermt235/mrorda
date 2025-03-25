// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Book _$BookFromJson(Map<String, dynamic> json) => _Book(
  title: json['title'] as String,
  type: json['type'] as String,
  pageCount: (json['pageCount'] as num).toInt(),
  price: (json['price'] as num).toDouble(),
  coverImage: json['coverImage'] as String,
  description: json['description'] as String,
);

Map<String, dynamic> _$BookToJson(_Book instance) => <String, dynamic>{
  'title': instance.title,
  'type': instance.type,
  'pageCount': instance.pageCount,
  'price': instance.price,
  'coverImage': instance.coverImage,
  'description': instance.description,
};
