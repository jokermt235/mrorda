// lib/bloc/book_state.dart
part of 'book_bloc.dart';

abstract class BookState {
  final List<Book> books;
  BookState({this.books = const []});
}

class BookLoading extends BookState {}

class BookLoaded extends BookState {
  BookLoaded({required List<Book> books}) : super(books: books);
}

class BookError extends BookState {
  final String message;
  BookError(this.message);
}