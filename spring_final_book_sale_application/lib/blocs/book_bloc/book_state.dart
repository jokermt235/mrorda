import 'package:equatable/equatable.dart';
import '../../models/book.dart';

abstract class BookState extends Equatable {
  const BookState();
  @override
  List<Object?> get props => [];
}

class BookInitial extends BookState {}

class BookLoading extends BookState {}

class BookLoaded extends BookState {
  final List<Book> books;
  final List<String> categories;
  final String? activeCategory;

  const BookLoaded({
    required this.books,
    required this.categories,
    this.activeCategory = 'All',
  });

  @override
  List<Object?> get props => [books, categories, activeCategory];
}

class CategoriesLoaded extends BookState {
  final List<String> categories;
  const CategoriesLoaded(this.categories);
  @override
  List<Object?> get props => [categories];
}

class BookError extends BookState {
  final String message;
  const BookError(this.message);
  @override
  List<Object?> get props => [message];
}
