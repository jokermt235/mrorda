import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/book.dart';
import '../services/book_service.dart';
import '../service_locator.dart';

abstract class BookEvent {}
class LoadBooks extends BookEvent {
  final String? category;
  final String? search;
  LoadBooks({this.category, this.search});
}

class BookState {
  final List<Book> books;
  final String selectedCategory;
  final String search;

  BookState({required this.books, this.selectedCategory = "All", this.search = ""});

  BookState copyWith({List<Book>? books, String? selectedCategory, String? search}) {
    return BookState(
      books: books ?? this.books,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      search: search ?? this.search,
    );
  }
}

class BookBloc extends Bloc<BookEvent, BookState> {
  final BookService _bookService = sl<BookService>();

  BookBloc() : super(BookState(books: sl<BookService>().getBooks())) {
    on<LoadBooks>((event, emit) {
      final books = _bookService.getBooks(
        category: event.category ?? state.selectedCategory,
        search: event.search ?? state.search,
      );
      emit(state.copyWith(
        books: books,
        selectedCategory: event.category ?? state.selectedCategory,
        search: event.search ?? state.search,
      ));
    });
  }
}