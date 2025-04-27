// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookImpl _$$BookImplFromJson(Map<String, dynamic> json) => _$BookImpl(
      title: json['title'] as String,
      author: json['author'] as String,
      pages: (json['pages'] as num).toInt(),
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$$BookImplToJson(_$BookImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'author': instance.author,
      'pages': instance.pages,
      'imageUrl': instance.imageUrl,
    };
