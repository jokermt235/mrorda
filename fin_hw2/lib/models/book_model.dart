import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_model.freezed.dart';
part 'book_model.g.dart'; // Optional, only if you need JSON support

@freezed
class Book with _$Book {
  const factory Book({
    required String title,
    required String author,
    required int pageCount,
  }) = _Book;

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json); // only if using json_serializable
}
