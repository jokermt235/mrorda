part of 'book_bloc.dart';

@freezed
class BookEvent with _$BookEvent {
  const factory BookEvent.loadBooks() = LoadBooks;
  const factory BookEvent.searchBooks(String query) = SearchBooks;
  const factory BookEvent.filterByCategory(String category) = FilterByCategory;
}