import '../models/book.dart';

class BookService {
  Future<Book> fetchBook() async {
    await Future.delayed(const Duration(seconds: 1));
    return Book(
      title: 'Книга',
      pages: [
        'Начало',
        'Середина',
        'Конец',
      ],
    );
  }
}
