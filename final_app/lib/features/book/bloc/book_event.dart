part of 'book_bloc.dart';

abstract class BookEvent extends Equatable {
  const BookEvent();

  @override
  List<Object> get props => [];
}

class LoadBooks extends BookEvent {}

class SearchBooks extends BookEvent {
  final String query;

  const SearchBooks({required this.query});

  @override
  List<Object> get props => [query];
}

class FilterByCategory extends BookEvent {
  final String category;

  const FilterByCategory({required this.category});

  @override
  List<Object> get props => [category];
}

class AddToCart extends BookEvent {
  final String bookId;

  const AddToCart({required this.bookId});

  @override
  List<Object> get props => [bookId];
}

class RemoveFromCart extends BookEvent {
  final String bookId;

  const RemoveFromCart({required this.bookId});

  @override
  List<Object> get props => [bookId];
}

class DecreaseQuantity extends BookEvent {
  final String bookId;

  const DecreaseQuantity({required this.bookId});

  @override
  List<Object> get props => [bookId];
}