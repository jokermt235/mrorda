part of 'book_bloc.dart';

@freezed
class BookState with _$BookState {
  const factory BookState.initial() = _Initial;
  const factory BookState.loading() = _Loading;
  const factory BookState.loaded(List<Book> books) = _Loaded;
  const factory BookState.error(String message) = _Error;
}