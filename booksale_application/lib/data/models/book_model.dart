import 'package:json_annotation/json_annotation.dart';

part 'book_model.g.dart';

@JsonSerializable()
class BookModel {
  final String id;
  final String title;
  final String author;
  final String category;
  final int pageCount;
  final double price;
  final String coverUrl;

  BookModel({
    required this.id,
    required this.title,
    required this.author,
    required this.category,
    required this.pageCount,
    required this.price,
    required this.coverUrl,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) =>
      _$BookModelFromJson(json);
  Map<String, dynamic> toJson() => _$BookModelToJson(this);
}