// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookModelImpl _$$BookModelImplFromJson(Map<String, dynamic> json) =>
    _$BookModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      author: json['author'] as String,
      coverImage: json['coverImage'] as String,
      category: json['category'] as String,
      price: (json['price'] as num).toDouble(),
      pageCount: (json['pageCount'] as num).toInt(),
      description: json['description'] as String,
      samplePages:
          (json['samplePages'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
    );

Map<String, dynamic> _$$BookModelImplToJson(_$BookModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'author': instance.author,
      'coverImage': instance.coverImage,
      'category': instance.category,
      'price': instance.price,
      'pageCount': instance.pageCount,
      'description': instance.description,
      'samplePages': instance.samplePages,
    };
