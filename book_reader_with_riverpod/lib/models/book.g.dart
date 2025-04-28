// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookImpl _$$BookImplFromJson(Map<String, dynamic> json) => _$BookImpl(
  id: json['id'] as String,
  title: json['title'] as String,
  author: json['author'] as String,
  pages: (json['pages'] as List<dynamic>).map((e) => e as String).toList(),
  currentPageIndex: (json['currentPageIndex'] as num).toInt(),
);

Map<String, dynamic> _$$BookImplToJson(_$BookImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'author': instance.author,
      'pages': instance.pages,
      'currentPageIndex': instance.currentPageIndex,
    };
