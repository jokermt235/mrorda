import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:final_book_sale_app/features/book/domain/entities/book.dart';
import 'package:final_book_sale_app/features/book/domain/usecases/get_books.dart';
import 'package:final_book_sale_app/features/book/domain/usecases/SearchBook.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'book_event.dart';
part 'book_state.dart';
part 'book_bloc.freezed.dart';

@injectable
class BookBloc extends Bloc<BookEvent, BookState> {
  final GetBooks getBooks;
  final SearchBooksUseCase searchBooksUseCase;
  List<Book> allBooks = [];

  BookBloc({
    required this.getBooks,
    required this.searchBooksUseCase,
  }) : super(const BookState.initial()) {
    on<LoadBooks>(_onLoadBooks);
    on<SearchBooks>(_onSearchBooks);
    on<FilterByCategory>(_onFilterByCategory);
  }

  Future<void> _onLoadBooks(
      LoadBooks event,
      Emitter<BookState> emit,
      ) async {
    emit(const BookState.loading());

    final result = await getBooks();

    result.fold(
          (failure) => emit(BookState.error(failure.toString())),
          (List<Book> books) {
        allBooks = books;
        emit(BookState.loaded(books));
      },
    );
  }

  Future<void> _onSearchBooks(
      SearchBooks event,
      Emitter<BookState> emit,
      ) async {
    if (event.query.isEmpty) {
      emit(BookState.loaded(allBooks));
      return;
    }

    emit(const BookState.loading());

    final result = await searchBooksUseCase(event.query);

    result.fold(
          (failure) => emit(BookState.error(failure.toString())),
          (books) => emit(BookState.loaded(books)),
    );
  }

  void _onFilterByCategory(
      FilterByCategory event,
      Emitter<BookState> emit,
      ) {
    final filteredBooks = event.category == 'All'
        ? allBooks
        : allBooks.where((book) => book.category == event.category).toList();
    emit(BookState.loaded(filteredBooks));
  }
}