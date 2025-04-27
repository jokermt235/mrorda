part of 'book_bloc.dart';

abstract class BookEvent extends Equatable {
  const BookEvent();

  @override
  List<Object> get props => [];
}

class FetchBooks extends BookEvent {}

class FilterBooksByCategory extends BookEvent {
  final String? category;

  const FilterBooksByCategory({this.category});

  @override
  List<Object> get props => [category ?? ''];
}

class SearchBooks extends BookEvent {
  final String query;

  const SearchBooks({required this.query});

  @override
  List<Object> get props => [query];
}