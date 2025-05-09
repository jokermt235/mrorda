import 'package:flutter_bloc/flutter_bloc.dart';
import '../../service/book_service.dart';
import 'book_event.dart';
import 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final BookService _bookService;

  BookBloc(this._bookService) : super(BookLoading()) {
    on<LoadBooks>((event, emit) async {
      emit(BookLoading());
      try {
        final books = await _bookService.fetchAllBooks();
        emit(BookLoaded(books));
      } catch (e) {
        emit(BookError('Failed to load books'));
      }
    });

    on<SearchBooks>((event, emit) async {
      emit(BookLoading());
      try {
        final books = await _bookService.searchBooks(event.query);
        emit(BookLoaded(books));
      } catch (e) {
        emit(BookError('Failed to search books'));
      }
    });

    on<FilterBooksByCategory>((event, emit) async {
      emit(BookLoading());
      try {
        final books = await _bookService.filterByCategory(event.category);
        emit(BookLoaded(books));
      } catch (e) {
        emit(BookError('Failed to filter books'));
      }
    });
  }
}