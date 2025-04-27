import 'package:booksaleapp/data/models/book.dart';

class CartItem {
  final Book book;
  int count;
  CartItem({required this.book, required this.count});
}

class CartState {
  final Map<String, CartItem> items;
  CartState({required this.items});
}