// lib/bloc/book_event.dart
part of 'book_bloc.dart';

abstract class BookEvent {}

class LoadBooks extends BookEvent {}

class SearchBooks extends BookEvent {
  final String query;
  SearchBooks(this.query);
}

class FilterBooksByCategory extends BookEvent {
  final String category;
  FilterBooksByCategory(this.category);
}