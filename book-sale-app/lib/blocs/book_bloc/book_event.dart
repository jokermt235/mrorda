import 'package:equatable/equatable.dart';

abstract class BookEvent extends Equatable {
  const BookEvent();
  @override
  List<Object?> get props => [];
}

class LoadBooks extends BookEvent {}

class SearchBooks extends BookEvent {
  final String query;
  const SearchBooks(this.query);
  @override
  List<Object?> get props => [query];
}

class FilterBooksByCategory extends BookEvent {
  final String category;
  const FilterBooksByCategory(this.category);
  @override
  List<Object?> get props => [category];
}

class LoadCategories extends BookEvent {}
