import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/book_service.dart';
import 'book_event.dart';
import 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final BookService bookService;

  BookBloc(this.bookService) : super(BookInitial()) {
    on<LoadBooks>(_onLoadBooks);
  }

  void _onLoadBooks(LoadBooks event, Emitter<BookState> emit) async {
    emit(BookLoading());
    try {
      final books = await bookService.fetchBooks();
      emit(BookLoaded(books));
    } catch (_) {
      emit(BookError());
    }
  }
}
