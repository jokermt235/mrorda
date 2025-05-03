import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/book_model.dart';

class BookNotifier extends StateNotifier<List<Book>> {
  BookNotifier() : super([]);

  void addBook(Book book) {
    state = [...state, book];
  }

  void removeBook(String id) {
    state = state.where((book) => book.id != id).toList();
  }

  void toggleReadStatus(String id) {
    state = state.map((book) {
      if (book.id == id) {
        return book.copyWith(isRead: !book.isRead);
      }
      return book;
    }).toList();
  }

  void updateBook(String id, Book updatedBook) {
    state = state.map((book) {
      if (book.id == id) {
        return updatedBook;
      }
      return book;
    }).toList();
  }
}

final bookProvider = StateNotifierProvider<BookNotifier, List<Book>>((ref) {
  return BookNotifier();
});