part of 'book_bloc.dart';

abstract class BookState extends Equatable {
  const BookState();

  @override
  List<Object> get props => [];
}

class BookInitial extends BookState {}

class BookLoading extends BookState {}

class BookLoaded extends BookState {
  final List<Book> books;
  final List<Book> filteredBooks;

  const BookLoaded({required this.books, required this.filteredBooks});

  BookLoaded copyWith({
    List<Book>? books,
    List<Book>? filteredBooks,
  }) {
    return BookLoaded(
      books: books ?? this.books,
      filteredBooks: filteredBooks ?? this.filteredBooks,
    );
  }

  @override
  List<Object> get props => [books, filteredBooks];
}

class BookError extends BookState {
  final String message;

  const BookError({required this.message});

  @override
  List<Object> get props => [message];
}