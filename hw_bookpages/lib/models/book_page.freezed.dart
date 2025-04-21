// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookPage {

 int get pageNumber; String get content;
/// Create a copy of BookPage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookPageCopyWith<BookPage> get copyWith => _$BookPageCopyWithImpl<BookPage>(this as BookPage, _$identity);

  /// Serializes this BookPage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookPage&&(identical(other.pageNumber, pageNumber) || other.pageNumber == pageNumber)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pageNumber,content);

@override
String toString() {
  return 'BookPage(pageNumber: $pageNumber, content: $content)';
}


}

/// @nodoc
abstract mixin class $BookPageCopyWith<$Res>  {
  factory $BookPageCopyWith(BookPage value, $Res Function(BookPage) _then) = _$BookPageCopyWithImpl;
@useResult
$Res call({
 int pageNumber, String content
});




}
/// @nodoc
class _$BookPageCopyWithImpl<$Res>
    implements $BookPageCopyWith<$Res> {
  _$BookPageCopyWithImpl(this._self, this._then);

  final BookPage _self;
  final $Res Function(BookPage) _then;

/// Create a copy of BookPage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pageNumber = null,Object? content = null,}) {
  return _then(_self.copyWith(
pageNumber: null == pageNumber ? _self.pageNumber : pageNumber // ignore: cast_nullable_to_non_nullable
as int,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _BookPage implements BookPage {
  const _BookPage({required this.pageNumber, required this.content});
  factory _BookPage.fromJson(Map<String, dynamic> json) => _$BookPageFromJson(json);

@override final  int pageNumber;
@override final  String content;

/// Create a copy of BookPage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookPageCopyWith<_BookPage> get copyWith => __$BookPageCopyWithImpl<_BookPage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookPageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookPage&&(identical(other.pageNumber, pageNumber) || other.pageNumber == pageNumber)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pageNumber,content);

@override
String toString() {
  return 'BookPage(pageNumber: $pageNumber, content: $content)';
}


}

/// @nodoc
abstract mixin class _$BookPageCopyWith<$Res> implements $BookPageCopyWith<$Res> {
  factory _$BookPageCopyWith(_BookPage value, $Res Function(_BookPage) _then) = __$BookPageCopyWithImpl;
@override @useResult
$Res call({
 int pageNumber, String content
});




}
/// @nodoc
class __$BookPageCopyWithImpl<$Res>
    implements _$BookPageCopyWith<$Res> {
  __$BookPageCopyWithImpl(this._self, this._then);

  final _BookPage _self;
  final $Res Function(_BookPage) _then;

/// Create a copy of BookPage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pageNumber = null,Object? content = null,}) {
  return _then(_BookPage(
pageNumber: null == pageNumber ? _self.pageNumber : pageNumber // ignore: cast_nullable_to_non_nullable
as int,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
