import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw12_booksale/book_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'book.dart';
import 'service_locator.dart';

class CartBloc extends Cubit<Map<Book, int>> {
  CartBloc() : super({}) {
    _loadFromStorage();
  }

  void _loadFromStorage() {
    final jsonString = sl<SharedPreferences>().getString('cart');
    if (jsonString != null) {
      final decoded = jsonDecode(jsonString) as Map<String, dynamic>;
      final books = <Book, int>{};
      for (final entry in decoded.entries) {
        final book = sl<BookRepository>().getBookById(entry.key);
        if (book != null) books[book] = entry.value;
      }
      emit(books);
    }
  }

  void addBook(Book book) {
    final newCart = Map<Book, int>.from(state);
    newCart[book] = (newCart[book] ?? 0) + 1;
    _saveAndEmit(newCart);
  }

  void removeBook(Book book) {
    final newCart = Map<Book, int>.from(state);
    newCart.remove(book);
    _saveAndEmit(newCart);
  }

  void decreaseBook(Book book) {
    final newCart = Map<Book, int>.from(state);
    if (newCart.containsKey(book)) {
      if (newCart[book]! <= 1) {
        newCart.remove(book);
      } else {
        newCart[book] = newCart[book]! - 1;
      }
      _saveAndEmit(newCart);
    }
  }

  void _saveAndEmit(Map<Book, int> newCart) {
    final encoded = {
      for (final entry in newCart.entries) entry.key.id: entry.value,
    };
    sl<SharedPreferences>().setString('cart', jsonEncode(encoded));
    emit(newCart);
  }
}
