part of 'book_event.dart';

abstract class BookEvent extends Equatable {
  const BookEvent();

  @override
  List<Object> get props => [];
}

class LoadBooks extends BookEvent {}

class FilterBooks extends BookEvent {
  final String query;
  const FilterBooks(this.query);
  @override
  List<Object> get props => [query];
}

class FilterByCategory extends BookEvent {
  final String category;
  const FilterByCategory(this.category);
  @override
  List<Object> get props => [category];
}
