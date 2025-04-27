import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:book_sales/core/services/book_service.dart';
import 'package:book_sales/features/books/bloc/book_event.dart';
import 'package:book_sales/features/books/bloc/book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final BookService _service;

  BookBloc(this._service) : super(BookLoading()) {
    on<LoadBooks>((event, emit) async {
      emit(BookLoading());
      final books = await _service.fetchAllBooks();
      emit(BookLoaded(books));
    });

    on<SearchBooks>((event, emit) async {
      emit(BookLoading());
      final books = await _service.searchBooks(event.query);
      emit(BookLoaded(books));
    });

    on<FilterBooksByCategory>((event, emit) async {
      emit(BookLoading());
      final books = await _service.getBooksByCategory(event.category);
      emit(BookLoaded(books));
    });
  }
}