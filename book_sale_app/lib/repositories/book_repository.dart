import '../services/book_service.dart';
import '../models/book.dart';

class BookRepository {
  final BookService bookService;
  BookRepository(this.bookService);

  Future<List<Book>> getBooks() async {
    return await bookService.fetchBooks();
  }
}
