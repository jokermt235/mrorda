import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/book.dart';
import '../../repositories/book_repository.dart';

part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final BookRepository bookRepository;

  BookBloc({required this.bookRepository}) : super(BookInitial()) {
    on<FetchBooks>(_onFetchBooks);
    on<FilterBooksByCategory>(_onFilterBooksByCategory);
    on<SearchBooks>(_onSearchBooks);
  }

  Future<void> _onFetchBooks(FetchBooks event, Emitter<BookState> emit) async {
    emit(BookLoading());
    try {
      final books = await bookRepository.fetchBooks();
      emit(BookLoaded(books: books, filteredBooks: books));
    } catch (e) {
      emit(BookError(message: e.toString()));
    }
  }

  void _onFilterBooksByCategory(FilterBooksByCategory event, Emitter<BookState> emit) {
    if (state is BookLoaded) {
      final currentState = state as BookLoaded;
      if (event.category == null) {
        emit(currentState.copyWith(filteredBooks: currentState.books));
      } else {
        final filteredBooks = currentState.books
            .where((book) => book.category == event.category)
            .toList();
        emit(currentState.copyWith(filteredBooks: filteredBooks));
      }
    }
  }

  void _onSearchBooks(SearchBooks event, Emitter<BookState> emit) {
    if (state is BookLoaded) {
      final currentState = state as BookLoaded;
      if (event.query.isEmpty) {
        emit(currentState.copyWith(filteredBooks: currentState.books));
      } else {
        final filteredBooks = currentState.books
            .where((book) =>
                book.title.toLowerCase().contains(event.query.toLowerCase()) ||
                book.author.toLowerCase().contains(event.query.toLowerCase()))
            .toList();
        emit(currentState.copyWith(filteredBooks: filteredBooks));
      }
    }
  }
}