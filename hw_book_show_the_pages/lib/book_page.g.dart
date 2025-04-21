// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookPageImpl _$$BookPageImplFromJson(Map<String, dynamic> json) =>
    _$BookPageImpl(
      pageNumber: (json['pageNumber'] as num).toInt(),
      content: json['content'] as String,
    );

Map<String, dynamic> _$$BookPageImplToJson(_$BookPageImpl instance) =>
    <String, dynamic>{
      'pageNumber': instance.pageNumber,
      'content': instance.content,
    };
