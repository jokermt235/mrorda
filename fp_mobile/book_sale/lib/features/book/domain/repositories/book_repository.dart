import 'package:book_store/features/book/data/models/book_model.dart';

abstract class BookRepository {
  Future<List<BookModel>> getAllBooks();
  Future<BookModel> getBookById(String id);
}