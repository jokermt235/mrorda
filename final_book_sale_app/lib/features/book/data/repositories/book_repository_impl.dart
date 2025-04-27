import 'package:final_book_sale_app/features/book/domain/repositories/book_repository.dart';
import 'package:final_book_sale_app/features/book/domain/entities/book.dart';
import 'package:final_book_sale_app/features/book/data/datasource/book_sqlite_data_source.dart';

class BookRepositoryImpl implements BookRepository {
  final BookLocalDataSource localDataSource;

  BookRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<List<Book>> getBooks() async {
    final localBooks = await localDataSource.getBooks();
    return localBooks.map((book) => Book.fromJson(book)).toList();
  }

  @override
  Future<List<Book>> searchBooks(String query) async {
    final localBooks = await localDataSource.searchBooks(query);
    return localBooks.map((book) => Book.fromJson(book)).toList() ?? [];
  }
}