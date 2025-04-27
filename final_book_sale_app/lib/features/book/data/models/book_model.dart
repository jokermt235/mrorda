import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_model.freezed.dart';
part 'book_model.g.dart';

// flutter pub run build_runner build (to generate the freezed files)

@freezed
class BookModel with _$BookModel {
  const factory BookModel({
    required String id,
    required String title,
    required String author,
    required String coverImage,
    required String category,
    required double price,
    required int pageCount,
    required String description,
    required List<String> samplePages,
  }) = _BookModel;

  factory BookModel.fromJson(Map<String, dynamic> json) =>
      _$BookModelFromJson(json);
}