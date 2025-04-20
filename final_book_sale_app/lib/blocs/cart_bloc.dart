import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/book_model.dart';

class CartState {
  final Map<Book, int> items;

  CartState({required this.items});

  double get total => items.entries.fold(0, (sum, e) => sum + e.key.price * e.value);
}

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState(items: {}));

  // Добавить книгу
  void addBook(Book book) {
    final items = Map<Book, int>.from(state.items);
    items[book] = (items[book] ?? 0) + 1;
    emit(CartState(items: items));
    _saveCartToStorage(items);
  }

  // Удалить книгу
  void removeBook(Book book) {
    final items = Map<Book, int>.from(state.items);
    items.remove(book);
    emit(CartState(items: items));
    _saveCartToStorage(items);
  }

  // Уменьшить количество книги
  void decreaseBook(Book book) {
    final items = Map<Book, int>.from(state.items);
    if (items.containsKey(book)) {
      items[book] = items[book]! - 1;
      if (items[book]! <= 0) {
        items.remove(book);
      }
    }
    emit(CartState(items: items));
    _saveCartToStorage(items);
  }

  // Загрузка корзины из SharedPreferences
  Future<void> loadCart(List<Book> allBooks) async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('cart');
    if (data == null) return;

    final decoded = jsonDecode(data) as Map<String, dynamic>;

    final Map<Book, int> loadedItems = {};
    for (var entry in decoded.entries) {
      final book = allBooks.firstWhere(
        (b) => b.id == entry.key,
        orElse: () => Book.empty(),
      );
      if (book.id != "") {
        loadedItems[book] = entry.value;
      }
    }

    emit(CartState(items: loadedItems));
  }

  // Сохранение корзины в SharedPreferences
  Future<void> _saveCartToStorage(Map<Book, int> items) async {
    final prefs = await SharedPreferences.getInstance();
    final cartMap = items.map((book, count) => MapEntry(book.id, count));
    prefs.setString('cart', jsonEncode(cartMap));
  }
}
