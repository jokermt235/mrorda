import 'dart:async';
import 'package:riverpod_project/models/book.dart';

class BookService {
  Future<Book> getBookData() async {

    await Future.delayed(const Duration(seconds: 2));
    return Book(
      title: "Пример книги",
      pages: [
        "Страница 1: Привет мир",
        "Страница 2: Пример текста",
        "Страница 3: Другая информация",
      ],
    );
  }
}
