import 'package:freezed_annotation/freezed_annotation.dart';

part 'book.freezed.dart';
part 'book.g.dart';

@freezed
sealed class Book with _$Book {
  factory Book({
    required String title,
    required String type,
    required int pageCount,
    required double price,
    required String coverImage,
    required String description,
  }) = _Book;
  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
}