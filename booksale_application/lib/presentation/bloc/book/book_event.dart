part of 'book_bloc.dart';

abstract class BookEvent extends Equatable {
  const BookEvent();

  @override
  List<Object> get props => [];
}

class FetchBooks extends BookEvent {}

class FetchBookById extends BookEvent {
  final String id;
  const FetchBookById(this.id);

  @override
  List<Object> get props => [id];
}

class SearchBooks extends BookEvent {
  final String query;
  const SearchBooks(this.query);

  @override
  List<Object> get props => [query];
}

class FilterByCategory extends BookEvent {
  final String category;
  const FilterByCategory(this.category);

  @override
  List<Object> get props => [category];
}