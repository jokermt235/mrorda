import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_page.freezed.dart';
part 'book_page.g.dart';

@freezed
class BookPage with _$BookPage {
  const factory BookPage({
    required int pageNumber,
    required String content,
  }) = _BookPage;

  factory BookPage.fromJson(Map<String, dynamic> json) => _$BookPageFromJson(json);
  
  @override
  // TODO: implement content
  String get content => throw UnimplementedError();
  
  @override
  // TODO: implement pageNumber
  int get pageNumber => throw UnimplementedError();
  
  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
