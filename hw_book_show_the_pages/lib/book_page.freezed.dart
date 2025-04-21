// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BookPage _$BookPageFromJson(Map<String, dynamic> json) {
  return _BookPage.fromJson(json);
}

/// @nodoc
mixin _$BookPage {
  int get pageNumber => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  /// Serializes this BookPage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BookPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookPageCopyWith<BookPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookPageCopyWith<$Res> {
  factory $BookPageCopyWith(BookPage value, $Res Function(BookPage) then) =
      _$BookPageCopyWithImpl<$Res, BookPage>;
  @useResult
  $Res call({int pageNumber, String content});
}

/// @nodoc
class _$BookPageCopyWithImpl<$Res, $Val extends BookPage>
    implements $BookPageCopyWith<$Res> {
  _$BookPageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? pageNumber = null, Object? content = null}) {
    return _then(
      _value.copyWith(
            pageNumber:
                null == pageNumber
                    ? _value.pageNumber
                    : pageNumber // ignore: cast_nullable_to_non_nullable
                        as int,
            content:
                null == content
                    ? _value.content
                    : content // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BookPageImplCopyWith<$Res>
    implements $BookPageCopyWith<$Res> {
  factory _$$BookPageImplCopyWith(
    _$BookPageImpl value,
    $Res Function(_$BookPageImpl) then,
  ) = __$$BookPageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int pageNumber, String content});
}

/// @nodoc
class __$$BookPageImplCopyWithImpl<$Res>
    extends _$BookPageCopyWithImpl<$Res, _$BookPageImpl>
    implements _$$BookPageImplCopyWith<$Res> {
  __$$BookPageImplCopyWithImpl(
    _$BookPageImpl _value,
    $Res Function(_$BookPageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BookPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? pageNumber = null, Object? content = null}) {
    return _then(
      _$BookPageImpl(
        pageNumber:
            null == pageNumber
                ? _value.pageNumber
                : pageNumber // ignore: cast_nullable_to_non_nullable
                    as int,
        content:
            null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BookPageImpl implements _BookPage {
  const _$BookPageImpl({required this.pageNumber, required this.content});

  factory _$BookPageImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookPageImplFromJson(json);

  @override
  final int pageNumber;
  @override
  final String content;

  @override
  String toString() {
    return 'BookPage(pageNumber: $pageNumber, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookPageImpl &&
            (identical(other.pageNumber, pageNumber) ||
                other.pageNumber == pageNumber) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, pageNumber, content);

  /// Create a copy of BookPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookPageImplCopyWith<_$BookPageImpl> get copyWith =>
      __$$BookPageImplCopyWithImpl<_$BookPageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookPageImplToJson(this);
  }
}

abstract class _BookPage implements BookPage {
  const factory _BookPage({
    required final int pageNumber,
    required final String content,
  }) = _$BookPageImpl;

  factory _BookPage.fromJson(Map<String, dynamic> json) =
      _$BookPageImpl.fromJson;

  @override
  int get pageNumber;
  @override
  String get content;

  /// Create a copy of BookPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookPageImplCopyWith<_$BookPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
