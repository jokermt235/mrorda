// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Book _$BookFromJson(Map<String, dynamic> json) => _Book(
  title: json['title'] as String,
  quotes: (json['quotes'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$BookToJson(_Book instance) => <String, dynamic>{
  'title': instance.title,
  'quotes': instance.quotes,
};
