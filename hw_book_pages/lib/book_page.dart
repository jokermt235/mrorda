import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_page.freezed.dart';

@freezed
class BookPage with _$BookPage {
  const factory BookPage({
    required int pageNumber,
    required String content,
  }) = _BookPage;
}
