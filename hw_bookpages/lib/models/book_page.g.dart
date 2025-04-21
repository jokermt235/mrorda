// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BookPage _$BookPageFromJson(Map<String, dynamic> json) => _BookPage(
  pageNumber: (json['pageNumber'] as num).toInt(),
  content: json['content'] as String,
);

Map<String, dynamic> _$BookPageToJson(_BookPage instance) => <String, dynamic>{
  'pageNumber': instance.pageNumber,
  'content': instance.content,
};
