import 'package:final_book_sale_app/features/book/domain/entities/book.dart';

abstract class BookRepository {
  Future<List<Book>> getBooks();
  Future<List<Book>> searchBooks(String query);
}