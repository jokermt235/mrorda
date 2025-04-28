import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/book.dart';

class LocalStorage {
  static const String cartKey = 'cart_items';

  Future<void> saveCart(List<Book> books) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> encodedBooks =
        books
            .map(
              (book) => jsonEncode({
                'id': book.id,
                'title': book.title,
                'category': book.category,
                'coverUrl': book.coverUrl,
                'pages': book.pages,
                'price': book.price,
              }),
            )
            .toList();
    await prefs.setStringList(cartKey, encodedBooks);
  }

  Future<List<Book>> loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? encodedBooks = prefs.getStringList(cartKey);
    if (encodedBooks == null) return [];

    return encodedBooks.map((str) {
      final json = jsonDecode(str);
      return Book(
        id: json['id'],
        title: json['title'],
        category: json['category'],
        coverUrl: json['coverUrl'],
        pages: json['pages'],
        price: json['price'],
        description: '',
      );
    }).toList();
  }
}
