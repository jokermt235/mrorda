import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw12_booksale/book_repository.dart';
import 'book.dart';

abstract class BookEvent {}

class FetchBooks extends BookEvent {}

class FilterBooksByCategory extends BookEvent {
  final String category;

  FilterBooksByCategory(this.category);
}

abstract class BookState {}

class BookInitial extends BookState {}

class BookLoading extends BookState {}

class BookLoaded extends BookState {
  final List<Book> books;

  BookLoaded(this.books);
}

class BookError extends BookState {
  final String message;

  BookError({required this.message});
}

class BookBloc extends Bloc<BookEvent, BookState> {
  final BookRepository bookRepository;

  BookBloc(this.bookRepository) : super(BookInitial()) {
    on<FetchBooks>(_onFetchBooks);
    on<FilterBooksByCategory>(_onFilterBooksByCategory);
  }

  Future<void> _onFetchBooks(FetchBooks event, Emitter<BookState> emit) async {
    try {
      emit(BookLoading());
      await Future.delayed(Duration(seconds: 2));

      final books = await bookRepository.fetchBooks();
      emit(BookLoaded(books));
    } catch (_) {
      emit(BookError(message: "Failed to load books."));
    }
  }

  Future<void> _onFilterBooksByCategory(
    FilterBooksByCategory event,
    Emitter<BookState> emit,
  ) async {
    try {
      emit(BookLoading());
      await Future.delayed(Duration(milliseconds: 500));
      final allBooks = await bookRepository.fetchBooks();
      final filteredBooks =
          allBooks
              .where(
                (book) =>
                    book.category.toLowerCase() == event.category.toLowerCase(),
              )
              .toList();
      emit(BookLoaded(filteredBooks));
    } catch (_) {
      emit(BookError(message: "Failed to filter books."));
    }
  }
}
