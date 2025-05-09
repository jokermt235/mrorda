// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookImpl _$$BookImplFromJson(Map<String, dynamic> json) => _$BookImpl(
  title: json['title'] as String,
  quotes: (json['quotes'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$$BookImplToJson(_$BookImpl instance) =>
    <String, dynamic>{'title': instance.title, 'quotes': instance.quotes};
