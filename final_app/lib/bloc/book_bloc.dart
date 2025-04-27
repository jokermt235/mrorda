import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/book.dart';
import '../services/book_service.dart';

class BookState {
  final List<Book> books;
  final String searchQuery;

  BookState({required this.books, this.searchQuery = ''});

  List<Book> get filteredBooks {
    if (searchQuery.isEmpty) return books;
    return books
        .where((book) => book.title.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
  }
}

class BookCubit extends Cubit<BookState> {
  final BookService bookService;

  BookCubit(this.bookService) : super(BookState(books: [])) {
    loadBooks();
  }

  void loadBooks() {
    final books = bookService.fetchBooks();
    emit(BookState(books: books));
  }

  void searchBooks(String query) {
    emit(BookState(books: state.books, searchQuery: query));
  }
}
