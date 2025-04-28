import 'package:book_sale_appl/services/book_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/book.dart';
import '../locator.dart';

class BookBloc extends Cubit<List<Book>> {
  BookBloc() : super([]);

  void loadBooks() {
    final books = locator<BookService>().getBooks();
    emit(books);
  }

  List<String> getCategories() {
    final books = state;
    return books.map((book) => book.category).toSet().toList();
  }

  void searchBooks(String query) {
    final books = locator<BookService>().getBooks();
    final results =
        books
            .where(
              (book) => book.title.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
    emit(results);
  }

  void filterByCategory(String category) {
    final books = locator<BookService>().getBooks();
    final results = books.where((book) => book.category == category).toList();
    emit(results);
  }
}
